Received: by 10.25.208.194 with SMTP id h185csp1930356lfg;
        Tue, 19 Apr 2016 06:40:25 -0700 (PDT)
X-Received: by 10.28.5.85 with SMTP id 82mr25071898wmf.26.1461073195151;
        Tue, 19 Apr 2016 06:39:55 -0700 (PDT)
Return-Path: <a.rigo@virtualopensystems.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id cd8si349339wjc.60.2016.04.19.06.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Apr 2016 06:39:55 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:400c:c09::243 is neither permitted nor denied by best guess record for domain of a.rigo@virtualopensystems.com) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@virtualopensystems-com.20150623.gappssmtp.com;
       spf=neutral (google.com: 2a00:1450:400c:c09::243 is neither permitted nor denied by best guess record for domain of a.rigo@virtualopensystems.com) smtp.mailfrom=a.rigo@virtualopensystems.com
Received: by mail-wm0-x243.google.com with SMTP id e201so3070568wme.2
        for <alex.bennee@linaro.org>; Tue, 19 Apr 2016 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TDjzf6SWP5QvoucfDkm1A3k44xDYyjQv/jI3k17UpIg=;
        b=UrAEV9ql/+W6pK1cTT5Dl4iAR6vHQSkd68+qGixJhu3MwOK7qsTxsgNV7N2ltNpe0j
         LanByRV0pvglWVBwMbogiIbEgghi8a4p1+l7v2TJnhdZ/gfH4Addk75NneVGV8ThUXvu
         IhnFXx7/PRyiHgDYLNqDaH9yHmPdwnPeDXWMDKh51/ODBkd4wEE6ic3fGi5OCAyhd2qi
         6Npjed6OCDqraht0JU+dbP0VvUPOMDXQk12r+XxpwHtFPE5eVzZ1EWgg1jQkIsPfaREX
         SSTZLRk7hWqC3emwWMer0KsHnyoeQKLZTmxWcoegacgZNY1mj/4bLEfVwNer4klwurjN
         tjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TDjzf6SWP5QvoucfDkm1A3k44xDYyjQv/jI3k17UpIg=;
        b=hfK2OK+ctDBvFTQJvw7dsqz96DsNIqJqB5wkvZQVsxNKtul7bINdH89ImqcWm2cynK
         8iJ0wdllrhfjD18b27/iplrHfcGMgguIhQUpKdghynVBgC6Pk2VXmyZk4DhxHBJhEl6E
         uZhYJ3fdDr5+wgi+WxBJhTnj+XwyD1jy3vMXDy+g8I5qCDzCnD2hCZs1JafJchNRLTRM
         kchZXOqV0OtGfPcLLXrEKju0WeJ5PfF4FqhK8ziI/Hm6oQfhGLUbfpCeU7CY1prnpohD
         Tdq/YOKXQegRU6CScnEu0jSi6rPg1XBauEsKcFx9mKSti/XZm7DhoNL62d5u/MTkmP82
         qhag==
X-Gm-Message-State: AOPr4FVooosgwrJi6Sby9piRR3w1wn98Zvy4BRykMi7K6aDBjygMyYAZwsRw3Z82xBzd/g==
X-Received: by 10.28.210.73 with SMTP id j70mr4033999wmg.48.1461073194899;
        Tue, 19 Apr 2016 06:39:54 -0700 (PDT)
Return-Path: <a.rigo@virtualopensystems.com>
Received: from localhost.localdomain (LPuteaux-656-1-278-113.w80-15.abo.wanadoo.fr. [80.15.154.113])
        by smtp.googlemail.com with ESMTPSA id c85sm2789756wmd.0.2016.04.19.06.39.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 06:39:53 -0700 (PDT)
From: Alvise Rigo <a.rigo@virtualopensystems.com>
To: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com
Cc: jani.kokkonen@huawei.com,
	claudio.fontana@huawei.com,
	tech@virtualopensystems.com,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	rth@twiddle.net,
	serge.fdrv@gmail.com,
	Alvise Rigo <a.rigo@virtualopensystems.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [Qemu-devel] [RFC v8 12/14] target-arm: translate: Use ld/st excl for atomic insns
Date: Tue, 19 Apr 2016 15:39:29 +0200
Message-Id: <1461073171-22953-13-git-send-email-a.rigo@virtualopensystems.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1461073171-22953-1-git-send-email-a.rigo@virtualopensystems.com>
References: <1461073171-22953-1-git-send-email-a.rigo@virtualopensystems.com>
X-TUID: 7tnpXWPrMaiy

Use the new LL/SC runtime helpers to handle the ARM atomic instructions
in softmmu_llsc_template.h.

In general, the helper generator
gen_{ldrex,strex}_{8,16a,32a,64a}() calls the function
helper_{le,be}_{ldlink,stcond}{ub,uw,ul,q}_mmu() implemented in
softmmu_llsc_template.h, doing an alignment check.

In addition, add a simple helper function to emulate the CLREX instruction.

Suggested-by: Jani Kokkonen <jani.kokkonen@huawei.com>
Suggested-by: Claudio Fontana <claudio.fontana@huawei.com>
Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>
---
 target-arm/cpu.h       |   3 +
 target-arm/helper.h    |   2 +
 target-arm/machine.c   |   7 ++
 target-arm/op_helper.c |  14 ++-
 target-arm/translate.c | 258 ++++++++++++++++++++++++++++---------------------
 5 files changed, 174 insertions(+), 110 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index b8b3364..46ab87f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -462,6 +462,9 @@ typedef struct CPUARMState {
         float_status fp_status;
         float_status standard_fp_status;
     } vfp;
+    /* Even if we don't use these values anymore, we still keep them for
+     * retro-compatibility in case of migration toward QEMU versions without
+     * the LoadLink/StoreExclusive backend. */
     uint64_t exclusive_addr;
     uint64_t exclusive_val;
     uint64_t exclusive_high;
diff --git a/target-arm/helper.h b/target-arm/helper.h
index c2a85c7..37cec49 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -532,6 +532,8 @@ DEF_HELPER_2(dc_zva, void, env, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 
+DEF_HELPER_1(atomic_clear, void, env)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #endif
diff --git a/target-arm/machine.c b/target-arm/machine.c
index ed1925a..9660163 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -203,6 +203,7 @@ static const VMStateInfo vmstate_cpsr = {
 static void cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
 
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
@@ -221,6 +222,12 @@ static void cpu_pre_save(void *opaque)
            cpu->cpreg_array_len * sizeof(uint64_t));
     memcpy(cpu->cpreg_vmstate_values, cpu->cpreg_values,
            cpu->cpreg_array_len * sizeof(uint64_t));
+
+    /* Ensure to fail the next STREX for versions of QEMU with the
+     * old backend. */
+    env->exclusive_addr = -1;
+    env->exclusive_val = -1;
+    env->exclusive_high = -1;
 }
 
 static int cpu_post_load(void *opaque, int version_id)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index a5ee65f..3ae0b6a 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -29,11 +29,13 @@ static void raise_exception(CPUARMState *env, uint32_t excp,
                             uint32_t syndrome, uint32_t target_el)
 {
     CPUState *cs = CPU(arm_env_get_cpu(env));
+    CPUClass *cc = CPU_GET_CLASS(cs);
 
     assert(!excp_is_internal(excp));
     cs->exception_index = excp;
     env->exception.syndrome = syndrome;
     env->exception.target_el = target_el;
+    cc->cpu_reset_excl_context(cs);
     cpu_loop_exit(cs);
 }
 
@@ -51,6 +53,14 @@ static int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
+void HELPER(atomic_clear)(CPUARMState *env)
+{
+    CPUState *cs = ENV_GET_CPU(env);
+    CPUClass *cc = CPU_GET_CLASS(cs);
+
+    cc->cpu_reset_excl_context(cs);
+}
+
 uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
                           uint32_t rn, uint32_t maxindex)
 {
@@ -681,6 +691,8 @@ static int el_from_spsr(uint32_t spsr)
 
 void HELPER(exception_return)(CPUARMState *env)
 {
+    CPUState *cs = ENV_GET_CPU(env);
+    CPUClass *cc = CPU_GET_CLASS(cs);
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
     uint32_t spsr = env->banked_spsr[spsr_idx];
@@ -689,7 +701,7 @@ void HELPER(exception_return)(CPUARMState *env)
 
     aarch64_save_sp(env, cur_el);
 
-    env->exclusive_addr = -1;
+    cc->cpu_reset_excl_context(cs);
 
     /* We must squash the PSTATE.SS bit to zero unless both of the
      * following hold:
diff --git a/target-arm/translate.c b/target-arm/translate.c
index cff511b..9c2b197 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -60,6 +60,7 @@ TCGv_ptr cpu_env;
 static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 static TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
+/* The following two variables are still used by the aarch64 front-end */
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
 #ifdef CONFIG_USER_ONLY
@@ -7413,57 +7414,139 @@ static void gen_logicq_cc(TCGv_i32 lo, TCGv_i32 hi)
     tcg_gen_or_i32(cpu_ZF, lo, hi);
 }
 
-/* Load/Store exclusive instructions are implemented by remembering
-   the value/address loaded, and seeing if these are the same
-   when the store is performed. This should be sufficient to implement
-   the architecturally mandated semantics, and avoids having to monitor
-   regular stores.
+/* If the softmmu is enabled, the translation of Load/Store exclusive
+   instructions will rely on the gen_helper_{ldlink,stcond} helpers,
+   offloading most of the work to the softmmu_llsc_template.h functions.
+   All the accesses made by the exclusive instructions include an
+   alignment check.
+
+   In user emulation mode we throw an exception and handle the atomic
+   operation elsewhere.  */
+
+#if TARGET_LONG_BITS == 32
+#define DO_GEN_LDREX(SUFF)                                             \
+static inline void gen_ldrex_##SUFF(TCGv_i32 dst, TCGv_i32 addr,       \
+                                    TCGv_i32 index)                    \
+{                                                                      \
+    gen_helper_ldlink_##SUFF(dst, cpu_env, addr, index);               \
+}
+
+#define DO_GEN_STREX(SUFF)                                             \
+static inline void gen_strex_##SUFF(TCGv_i32 dst, TCGv_i32 addr,       \
+                                    TCGv_i32 val, TCGv_i32 index)      \
+{                                                                      \
+    gen_helper_stcond_##SUFF(dst, cpu_env, addr, val, index);          \
+}
+
+static inline void gen_ldrex_i64a(TCGv_i64 dst, TCGv_i32 addr, TCGv_i32 index)
+{
+    gen_helper_ldlink_i64a(dst, cpu_env, addr, index);
+}
+
+static inline void gen_strex_i64a(TCGv_i32 dst, TCGv_i32 addr, TCGv_i64 val,
+                                  TCGv_i32 index)
+{
+
+    gen_helper_stcond_i64a(dst, cpu_env, addr, val, index);
+}
+#else
+#define DO_GEN_LDREX(SUFF)                                             \
+static inline void gen_ldrex_##SUFF(TCGv_i32 dst, TCGv_i32 addr,       \
+                                         TCGv_i32 index)               \
+{                                                                      \
+    TCGv addr64 = tcg_temp_new();                                      \
+    tcg_gen_extu_i32_i64(addr64, addr);                                \
+    gen_helper_ldlink_##SUFF(dst, cpu_env, addr64, index);             \
+    tcg_temp_free(addr64);                                             \
+}
+
+#define DO_GEN_STREX(SUFF)                                             \
+static inline void gen_strex_##SUFF(TCGv_i32 dst, TCGv_i32 addr,       \
+                                    TCGv_i32 val, TCGv_i32 index)      \
+{                                                                      \
+    TCGv addr64 = tcg_temp_new();                                      \
+    TCGv dst64 = tcg_temp_new();                                       \
+    tcg_gen_extu_i32_i64(addr64, addr);                                \
+    gen_helper_stcond_##SUFF(dst64, cpu_env, addr64, val, index);      \
+    tcg_gen_extrl_i64_i32(dst, dst64);                                 \
+    tcg_temp_free(dst64);                                              \
+    tcg_temp_free(addr64);                                             \
+}
+
+static inline void gen_ldrex_i64a(TCGv_i64 dst, TCGv_i32 addr, TCGv_i32 index)
+{
+    TCGv addr64 = tcg_temp_new();
+    tcg_gen_extu_i32_i64(addr64, addr);
+    gen_helper_ldlink_i64a(dst, cpu_env, addr64, index);
+    tcg_temp_free(addr64);
+}
+
+static inline void gen_strex_i64a(TCGv_i32 dst, TCGv_i32 addr, TCGv_i64 val,
+                                  TCGv_i32 index)
+{
+    TCGv addr64 = tcg_temp_new();
+    TCGv dst64 = tcg_temp_new();
+
+    tcg_gen_extu_i32_i64(addr64, addr);
+    gen_helper_stcond_i64a(dst64, cpu_env, addr64, val, index);
+    tcg_gen_extrl_i64_i32(dst, dst64);
+
+    tcg_temp_free(dst64);
+    tcg_temp_free(addr64);
+}
+#endif
+
+DO_GEN_LDREX(i8)
+DO_GEN_LDREX(i16a)
+DO_GEN_LDREX(i32a)
+
+DO_GEN_STREX(i8)
+DO_GEN_STREX(i16a)
+DO_GEN_STREX(i32a)
 
-   In system emulation mode only one CPU will be running at once, so
-   this sequence is effectively atomic.  In user emulation mode we
-   throw an exception and handle the atomic operation elsewhere.  */
 static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i32 addr, int size)
-{
+ {
     TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i32 mem_idx = tcg_temp_new_i32();
 
-    s->is_ldex = true;
-
-    switch (size) {
-    case 0:
-        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
-        break;
-    case 1:
-        gen_aa32_ld16ua(tmp, addr, get_mem_index(s));
-        break;
-    case 2:
-    case 3:
-        gen_aa32_ld32ua(tmp, addr, get_mem_index(s));
-        break;
-    default:
-        abort();
-    }
+    tcg_gen_movi_i32(mem_idx, get_mem_index(s));
 
-    if (size == 3) {
-        TCGv_i32 tmp2 = tcg_temp_new_i32();
-        TCGv_i32 tmp3 = tcg_temp_new_i32();
+    if (size != 3) {
+        switch (size) {
+        case 0:
+            gen_ldrex_i8(tmp, addr, mem_idx);
+            break;
+        case 1:
+            gen_ldrex_i16a(tmp, addr, mem_idx);
+            break;
+        case 2:
+            gen_ldrex_i32a(tmp, addr, mem_idx);
+            break;
+        default:
+            abort();
+        }
 
-        tcg_gen_addi_i32(tmp2, addr, 4);
-        gen_aa32_ld32u(tmp3, tmp2, get_mem_index(s));
-        tcg_temp_free_i32(tmp2);
-        tcg_gen_concat_i32_i64(cpu_exclusive_val, tmp, tmp3);
-        store_reg(s, rt2, tmp3);
+        store_reg(s, rt, tmp);
     } else {
-        tcg_gen_extu_i32_i64(cpu_exclusive_val, tmp);
+        TCGv_i64 tmp64 = tcg_temp_new_i64();
+        TCGv_i32 tmph = tcg_temp_new_i32();
+
+        gen_ldrex_i64a(tmp64, addr, mem_idx);
+        tcg_gen_extr_i64_i32(tmp, tmph, tmp64);
+
+        store_reg(s, rt, tmp);
+        store_reg(s, rt2, tmph);
+
+        tcg_temp_free_i64(tmp64);
     }
 
-    store_reg(s, rt, tmp);
-    tcg_gen_extu_i32_i64(cpu_exclusive_addr, addr);
+    tcg_temp_free_i32(mem_idx);
 }
 
 static void gen_clrex(DisasContext *s)
 {
-    tcg_gen_movi_i64(cpu_exclusive_addr, -1);
+    gen_helper_atomic_clear(cpu_env);
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -7479,85 +7562,42 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
 static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
                                 TCGv_i32 addr, int size)
 {
-    TCGv_i32 tmp;
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
+    TCGv_i32 tmp, mem_idx;
 
-    tmp = tcg_temp_new_i32();
-    switch (size) {
-    case 0:
-        gen_aa32_ld8u(tmp, addr, get_mem_index(s));
-        break;
-    case 1:
-        gen_aa32_ld16u(tmp, addr, get_mem_index(s));
-        break;
-    case 2:
-    case 3:
-        gen_aa32_ld32u(tmp, addr, get_mem_index(s));
-        break;
-    default:
-        abort();
-    }
+    mem_idx = tcg_temp_new_i32();
 
-    val64 = tcg_temp_new_i64();
-    if (size == 3) {
-        TCGv_i32 tmp2 = tcg_temp_new_i32();
-        TCGv_i32 tmp3 = tcg_temp_new_i32();
-        tcg_gen_addi_i32(tmp2, addr, 4);
-        gen_aa32_ld32u(tmp3, tmp2, get_mem_index(s));
-        tcg_temp_free_i32(tmp2);
-        tcg_gen_concat_i32_i64(val64, tmp, tmp3);
-        tcg_temp_free_i32(tmp3);
+    tcg_gen_movi_i32(mem_idx, get_mem_index(s));
+    tmp = load_reg(s, rt);
+
+    if (size != 3) {
+        switch (size) {
+        case 0:
+            gen_strex_i8(cpu_R[rd], addr, tmp, mem_idx);
+            break;
+        case 1:
+            gen_strex_i16a(cpu_R[rd], addr, tmp, mem_idx);
+            break;
+        case 2:
+            gen_strex_i32a(cpu_R[rd], addr, tmp, mem_idx);
+            break;
+        default:
+            abort();
+        }
     } else {
-        tcg_gen_extu_i32_i64(val64, tmp);
-    }
-    tcg_temp_free_i32(tmp);
+        TCGv_i64 tmp64;
+        TCGv_i32 tmp2;
 
-    tcg_gen_brcond_i64(TCG_COND_NE, val64, cpu_exclusive_val, fail_label);
-    tcg_temp_free_i64(val64);
+        tmp64 = tcg_temp_new_i64();
+        tmp2 = load_reg(s, rt2);
+        tcg_gen_concat_i32_i64(tmp64, tmp, tmp2);
+        gen_strex_i64a(cpu_R[rd], addr, tmp64, mem_idx);
 
-    tmp = load_reg(s, rt);
-    switch (size) {
-    case 0:
-        gen_aa32_st8(tmp, addr, get_mem_index(s));
-        break;
-    case 1:
-        gen_aa32_st16(tmp, addr, get_mem_index(s));
-        break;
-    case 2:
-    case 3:
-        gen_aa32_st32(tmp, addr, get_mem_index(s));
-        break;
-    default:
-        abort();
+        tcg_temp_free_i32(tmp2);
+        tcg_temp_free_i64(tmp64);
     }
+
     tcg_temp_free_i32(tmp);
-    if (size == 3) {
-        tcg_gen_addi_i32(addr, addr, 4);
-        tmp = load_reg(s, rt2);
-        gen_aa32_st32(tmp, addr, get_mem_index(s));
-        tcg_temp_free_i32(tmp);
-    }
-    tcg_gen_movi_i32(cpu_R[rd], 0);
-    tcg_gen_br(done_label);
-    gen_set_label(fail_label);
-    tcg_gen_movi_i32(cpu_R[rd], 1);
-    gen_set_label(done_label);
-    tcg_gen_movi_i64(cpu_exclusive_addr, -1);
+    tcg_temp_free_i32(mem_idx);
 }
 #endif
 
-- 
2.8.0
