Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w186sm11843859wmd.20.2016.04.15.07.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Apr 2016 07:23:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3F4C93E05B2;
	Fri, 15 Apr 2016 15:24:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC v1 11/12] arm: atomically check the exclusive value in a STREX
Date: Fri, 15 Apr 2016 15:23:50 +0100
Message-Id: <1460730231-1184-13-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1460730231-1184-1-git-send-email-alex.bennee@linaro.org>
References: <1460730231-1184-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3/thchp6Zcly

From: KONRAD Frederic <fred.konrad@greensocs.com>

This mechanism replaces the existing load/store exclusive mechanism which seems
to be broken for MTTCG. It follows the intention of the existing
mechanism and stores the target address and data values during a load
operation and checks that they remain unchanged before a store.

In common with the older approach, this provides weaker semantics than required
in that it could be that a different processor writes the same value as a
non-exclusive write, however in practise this seems to be irrelevant.

The old implementation didn’t correctly store it’s values as globals, but rather
kept a local copy per CPU.

This new mechanism stores the values globally and also uses the atomic cmpxchg
macros to ensure atomicity - it is therefore very efficient and threadsafe.

Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
[AJB: re-base, compile fixes, atomic_bool_cmpxchg]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1 (enable-for-armv7-v1):
  - re-base on top of base patches
  - use atomic_bool_cmpxchg
  - ws fixes
  - protect with #ifdef CONFIG_SOFTMMU to fix linux-user compilation
---
 target-arm/cpu.c       |  21 ++++++++
 target-arm/cpu.h       |   6 +++
 target-arm/helper.c    |  16 ++++++
 target-arm/helper.h    |   6 +++
 target-arm/op_helper.c | 130 ++++++++++++++++++++++++++++++++++++++++++++++++-
 target-arm/translate.c |  96 ++++++------------------------------
 6 files changed, 194 insertions(+), 81 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index e48e83a..2c0e9a5 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -32,6 +32,26 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 
+/* Protect cpu_exclusive_* variable .*/
+__thread bool cpu_have_exclusive_lock;
+QemuSpin cpu_exclusive_lock;
+
+inline void arm_exclusive_lock(void)
+{
+    if (!cpu_have_exclusive_lock) {
+        qemu_spin_lock(&cpu_exclusive_lock);
+        cpu_have_exclusive_lock = true;
+    }
+}
+
+inline void arm_exclusive_unlock(void)
+{
+    if (cpu_have_exclusive_lock) {
+        cpu_have_exclusive_lock = false;
+        qemu_spin_unlock(&cpu_exclusive_lock);
+    }
+}
+
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -482,6 +502,7 @@ static void arm_cpu_initfn(Object *obj)
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
         if (!inited) {
             inited = true;
+            qemu_spin_init(&cpu_exclusive_lock);
             arm_translate_init();
         }
     }
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 066ff67..4055567 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -523,6 +523,9 @@ static inline bool is_a64(CPUARMState *env)
 int cpu_arm_signal_handler(int host_signum, void *pinfo,
                            void *puc);
 
+bool arm_get_phys_addr(CPUARMState *env, target_ulong address, int access_type,
+                       hwaddr *phys_ptr, int *prot, target_ulong *page_size);
+
 /**
  * pmccntr_sync
  * @env: CPUARMState
@@ -2170,6 +2173,9 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
 #include "exec/exec-all.h"
 
+void arm_exclusive_lock(void);
+void arm_exclusive_unlock(void);
+
 enum {
     QEMU_PSCI_CONDUIT_DISABLED = 0,
     QEMU_PSCI_CONDUIT_SMC = 1,
diff --git a/target-arm/helper.c b/target-arm/helper.c
index bc9fbda..560cbef 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -35,6 +35,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 #define PMCRE   0x1
 #endif
 
+#ifdef CONFIG_SOFTMMU
+bool arm_get_phys_addr(CPUARMState *env, target_ulong address, int access_type,
+                       hwaddr *phys_ptr, int *prot, target_ulong *page_size)
+{
+    MemTxAttrs attrs = {};
+    ARMMMUFaultInfo fi = {};
+    uint32_t fsr;
+    return get_phys_addr(env, address, access_type, cpu_mmu_index(env, false),
+                         phys_ptr, &attrs, prot, page_size, &fsr, &fi);
+}
+#endif
+
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
     int nregs;
@@ -6104,6 +6116,10 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
     uint32_t offset;
     uint32_t moe;
 
+    arm_exclusive_lock();
+    env->exclusive_addr = -1;
+    arm_exclusive_unlock();
+
     /* If this is a debug exception we must update the DBGDSCR.MOE bits */
     switch (env->exception.syndrome >> ARM_EL_EC_SHIFT) {
     case EC_BREAKPOINT:
diff --git a/target-arm/helper.h b/target-arm/helper.h
index 84aa637..ba1fe4d 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -537,6 +537,12 @@ DEF_HELPER_2(dc_zva, void, env, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 
+#ifdef CONFIG_SOFTMMU
+DEF_HELPER_4(atomic_cmpxchg64, i32, env, i32, i64, i32)
+#endif
+DEF_HELPER_1(atomic_clear, void, env)
+DEF_HELPER_3(atomic_claim, void, env, i32, i64)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index d626ff1..669fb45 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -31,12 +31,141 @@ static void raise_exception(CPUARMState *env, uint32_t excp,
     CPUState *cs = CPU(arm_env_get_cpu(env));
 
     assert(!excp_is_internal(excp));
+    arm_exclusive_lock();
     cs->exception_index = excp;
     env->exception.syndrome = syndrome;
     env->exception.target_el = target_el;
+    /*
+     * We MAY already have the lock - in which case we are exiting the
+     * instruction due to an exception. Otherwise we better make sure we are not
+     * about to enter a STREX anyway.
+     */
+    env->exclusive_addr = -1;
+    arm_exclusive_unlock();
     cpu_loop_exit(cs);
 }
 
+#ifdef CONFIG_SOFTMMU
+/* NB return 1 for fail, 0 for pass */
+uint32_t HELPER(atomic_cmpxchg64)(CPUARMState *env, uint32_t addr,
+                                  uint64_t newval, uint32_t size)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    CPUState *cs = CPU(cpu);
+
+    uintptr_t retaddr = GETRA();
+    bool result = false;
+    hwaddr len = 1 << size;
+
+    hwaddr paddr;
+    target_ulong page_size;
+    int prot;
+
+    arm_exclusive_lock();
+
+    if (env->exclusive_addr != addr) {
+        arm_exclusive_unlock();
+        return 1;
+    }
+
+    if (arm_get_phys_addr(env, addr, 1, &paddr, &prot, &page_size)) {
+        tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
+                 cpu_mmu_index(env, false), retaddr);
+        if (arm_get_phys_addr(env, addr, 1, &paddr, &prot, &page_size)) {
+            arm_exclusive_unlock();
+            return 1;
+        }
+    }
+
+    switch (size) {
+    case 0:
+    {
+        uint8_t oldval, *p;
+        p = address_space_map(cs->as, paddr, &len, true);
+        if (len == 1 << size) {
+            oldval = (uint8_t)env->exclusive_val;
+            result = atomic_bool_cmpxchg(p, oldval, (uint8_t)newval);
+        }
+        address_space_unmap(cs->as, p, len, true, result ? len : 0);
+    }
+    break;
+    case 1:
+    {
+        uint16_t oldval, *p;
+        p = address_space_map(cs->as, paddr, &len, true);
+        if (len == 1 << size) {
+            oldval = (uint16_t)env->exclusive_val;
+            result = atomic_bool_cmpxchg(p, oldval, (uint16_t)newval);
+        }
+        address_space_unmap(cs->as, p, len, true, result ? len : 0);
+    }
+    break;
+    case 2:
+    {
+        uint32_t oldval, *p;
+        p = address_space_map(cs->as, paddr, &len, true);
+        if (len == 1 << size) {
+            oldval = (uint32_t)env->exclusive_val;
+            result = atomic_bool_cmpxchg(p, oldval, (uint32_t)newval);
+        }
+        address_space_unmap(cs->as, p, len, true, result ? len : 0);
+    }
+    break;
+    case 3:
+    {
+        uint64_t oldval, *p;
+        p = address_space_map(cs->as, paddr, &len, true);
+        if (len == 1 << size) {
+            oldval = (uint64_t)env->exclusive_val;
+            result = atomic_bool_cmpxchg(p, oldval, (uint64_t)newval);
+        }
+        address_space_unmap(cs->as, p, len, true, result ? len : 0);
+    }
+    break;
+    default:
+        abort();
+    break;
+    }
+
+    env->exclusive_addr = -1;
+    arm_exclusive_unlock();
+    if (result) {
+        return 0;
+    } else {
+        return 1;
+    }
+}
+#endif
+
+void HELPER(atomic_clear)(CPUARMState *env)
+{
+    /* make sure no STREX is about to start */
+    arm_exclusive_lock();
+    env->exclusive_addr = -1;
+    arm_exclusive_unlock();
+}
+
+void HELPER(atomic_claim)(CPUARMState *env, uint32_t addr, uint64_t val)
+{
+    CPUState *cpu;
+    CPUARMState *current_cpu;
+
+    /* ensure that there are no STREX's executing */
+    arm_exclusive_lock();
+
+    CPU_FOREACH(cpu) {
+        current_cpu = &ARM_CPU(cpu)->env;
+        if (current_cpu->exclusive_addr  == addr) {
+            /* We steal the atomic of this CPU. */
+            current_cpu->exclusive_addr = -1;
+        }
+    }
+
+    env->exclusive_val = val;
+    env->exclusive_addr = addr;
+    arm_exclusive_unlock();
+}
+
 static int exception_target_el(CPUARMState *env)
 {
     int target_el = MAX(1, arm_current_el(env));
@@ -862,7 +991,6 @@ void HELPER(exception_return)(CPUARMState *env)
 
     aarch64_save_sp(env, cur_el);
 
-    env->exclusive_addr = -1;
 
     /* We must squash the PSTATE.SS bit to zero unless both of the
      * following hold:
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 940ec8d..c946c0e 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7691,6 +7691,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i32 addr, int size)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i64 val = tcg_temp_new_i64();
 
     s->is_ldex = true;
 
@@ -7715,20 +7716,20 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 
         tcg_gen_addi_i32(tmp2, addr, 4);
         gen_aa32_ld32u(s, tmp3, tmp2, get_mem_index(s));
+        tcg_gen_concat_i32_i64(val, tmp, tmp3);
         tcg_temp_free_i32(tmp2);
-        tcg_gen_concat_i32_i64(cpu_exclusive_val, tmp, tmp3);
         store_reg(s, rt2, tmp3);
     } else {
-        tcg_gen_extu_i32_i64(cpu_exclusive_val, tmp);
+        tcg_gen_extu_i32_i64(val, tmp);
     }
-
+    gen_helper_atomic_claim(cpu_env, addr, val);
+    tcg_temp_free_i64(val);
     store_reg(s, rt, tmp);
-    tcg_gen_extu_i32_i64(cpu_exclusive_addr, addr);
 }
 
 static void gen_clrex(DisasContext *s)
 {
-    tcg_gen_movi_i64(cpu_exclusive_addr, -1);
+    gen_helper_atomic_clear(cpu_env);
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -7745,84 +7746,19 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
                                 TCGv_i32 addr, int size)
 {
     TCGv_i32 tmp;
-    TCGv_i64 val64, extaddr;
-    TCGLabel *done_label;
-    TCGLabel *fail_label;
-
-    /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]) {
-         [addr] = {Rt};
-         {Rd} = 0;
-       } else {
-         {Rd} = 1;
-       } */
-    fail_label = gen_new_label();
-    done_label = gen_new_label();
-    extaddr = tcg_temp_new_i64();
-    tcg_gen_extu_i32_i64(extaddr, addr);
-    tcg_gen_brcond_i64(TCG_COND_NE, extaddr, cpu_exclusive_addr, fail_label);
-    tcg_temp_free_i64(extaddr);
-
-    tmp = tcg_temp_new_i32();
-    switch (size) {
-    case 0:
-        gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
-        break;
-    case 1:
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
-        break;
-    case 2:
-    case 3:
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-        break;
-    default:
-        abort();
-    }
-
-    val64 = tcg_temp_new_i64();
-    if (size == 3) {
-        TCGv_i32 tmp2 = tcg_temp_new_i32();
-        TCGv_i32 tmp3 = tcg_temp_new_i32();
-        tcg_gen_addi_i32(tmp2, addr, 4);
-        gen_aa32_ld32u(s, tmp3, tmp2, get_mem_index(s));
-        tcg_temp_free_i32(tmp2);
-        tcg_gen_concat_i32_i64(val64, tmp, tmp3);
-        tcg_temp_free_i32(tmp3);
-    } else {
-        tcg_gen_extu_i32_i64(val64, tmp);
-    }
-    tcg_temp_free_i32(tmp);
-
-    tcg_gen_brcond_i64(TCG_COND_NE, val64, cpu_exclusive_val, fail_label);
-    tcg_temp_free_i64(val64);
+    TCGv_i32 tmp2;
+    TCGv_i64 val = tcg_temp_new_i64();
+    TCGv_i32 tmp_size = tcg_const_i32(size);
 
     tmp = load_reg(s, rt);
-    switch (size) {
-    case 0:
-        gen_aa32_st8(s, tmp, addr, get_mem_index(s));
-        break;
-    case 1:
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
-        break;
-    case 2:
-    case 3:
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-        break;
-    default:
-        abort();
-    }
+    tmp2 = load_reg(s, rt2);
+    tcg_gen_concat_i32_i64(val, tmp, tmp2);
     tcg_temp_free_i32(tmp);
-    if (size == 3) {
-        tcg_gen_addi_i32(addr, addr, 4);
-        tmp = load_reg(s, rt2);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-        tcg_temp_free_i32(tmp);
-    }
-    tcg_gen_movi_i32(cpu_R[rd], 0);
-    tcg_gen_br(done_label);
-    gen_set_label(fail_label);
-    tcg_gen_movi_i32(cpu_R[rd], 1);
-    gen_set_label(done_label);
-    tcg_gen_movi_i64(cpu_exclusive_addr, -1);
+    tcg_temp_free_i32(tmp2);
+
+    gen_helper_atomic_cmpxchg64(cpu_R[rd], cpu_env, addr, val, tmp_size);
+    tcg_temp_free_i64(val);
+    tcg_temp_free_i32(tmp_size);
 }
 #endif
 
-- 
2.7.4
