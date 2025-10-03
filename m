Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCDCCCA472
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jLO-0006uM-2Q; Fri, 03 Oct 2025 13:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIp-0002wO-B9
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:50 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGs-0006Ko-33
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1837044a12.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511313; x=1760116113; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZp1GtoDdoMeK02RQUelaFFnBItq1uP+DayJPw5iAVI=;
 b=fJ0dLL/eri/hkIhS1Mo8W4ENjJcu3QSQKworgSJwLX3uJrE7O6zu2y697Yg4hV/C5H
 7qsR2Vzun8QEfJT/+qafB3tSKEF8SMWarqj2sgbfSlMsa2gRsVauWZ8+2uQMIdQS908+
 HxvP/Y533vG93jw2dC9mHDzx0KxmLzP8wvI0Mh+B8ZIgMCepvUrRjCYbai8CgUny5Jcj
 iV/ry1e2BJkv7CR1xL1UDTdA779XLeew+O8dTBAlLbRNFAYNK1KNXRKesAVdPqckSYlR
 x7rGxZurPYbkkNrsbwZwqNShnBg4vwGf/LgIPrLQDWF4UQs9mt7TCK84qUtwsz7MdHVq
 wvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511313; x=1760116113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZp1GtoDdoMeK02RQUelaFFnBItq1uP+DayJPw5iAVI=;
 b=YvBTLY/ds7qyDf+VNNxwUMCWHPbgp1piB8Eu1wj+pJR/W9Qe1Cj+r0iWAgn444sBdd
 i1a3wSXTP1fMZnPtFtsdpIpybTgdaEF/KozznsL7N5xIWqBqWc3SBo8R4LXNV1UgKHN/
 p6i2lHhKdLSS5M0jD/HjIccRd/b8EMfmTIkExuTm2bKeIOU1jjvMYy8MZgAoyao/oqi6
 yzwh23HDfNWiRk0wXZea/dfA5yYTOIub37kS0sViakcIfNQXp3tUqcgPqYzuz/A12hmL
 JXLOdAn+aNIFfzvxclb1xG3zgQCtWyPUiL+O2/F0qyxvRXIXkfgomQbemvlb+fZdNARl
 MTpA==
X-Gm-Message-State: AOJu0Yw7NiQLFmCgiOVXoJFeW39e+HRkmkEXvew47GZLzUN1ue07t4WQ
 g135aPF00vvmcR6rummYkF8u2xk/jHENBeKEIJa9n5iiEv2h3DYGL/WPo8CN49mYt/WlMjWRVRL
 jdEx7+Pg=
X-Gm-Gg: ASbGncvgwNQHyFbBZP7suvGLfB6+8nF6y0QS5r3XOBkvbr8j+tDbEVO8CePPEEPLBCc
 xO0AFQS9nVAyP65kykRP7Es8DaOOf3UcKE00UKQTYZWOEGwILhCSI+wJi1Qbv3S1mkS+vKQNaeh
 HGSVVYVa1/WN+FSkihR/2W5xzmuEEAtY/8GHVwykTr/68VG96otU/EukBC82yUR73tf/06WKkI/
 zJeggK1Ati7bukBINHgO395xxrRjKFNF4+i91SPjbOcHR3ktNllXYK/7WK8KAXMvyjm4Z68NGdo
 bh7C2czP1D3jOjaUqwrF2z62rNX2H3+GmT7hUCaCJCAn8Kuu5SkYnBfORNjgSXg5eOjg6Q2rapq
 D56PhKpAhGw+0mqUxzVSVSYLkwOr2+LD7TnEMRv6VPVY85HYauHSIheZ4
X-Google-Smtp-Source: AGHT+IGVx7rxr9HSjWKrxNYcJA8nDwGvWcffz2ZRoqojJtEaE9ziwpCYnzk1Q+oa5cYoc0c8S4Vleg==
X-Received: by 2002:a17:903:1b70:b0:24b:2336:e1c5 with SMTP id
 d9443c01a7336-28e9a68dbc3mr43325985ad.55.1759511313116; 
 Fri, 03 Oct 2025 10:08:33 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 36/73] target/arm: Expand pstate to 64 bits
Date: Fri,  3 Oct 2025 10:07:23 -0700
Message-ID: <20251003170800.997167-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The ARM now defines 36 bits in SPSR_ELx in aarch64 mode, so
it's time to bite the bullet and extend PSTATE to match.

Most changes are straightforward, adjusting printf formats,
changing local variable types.  More complex is migration,
where to maintain backward compatibility a new pstate64
record is introduced, and only when one of the extensions
that sets bits 32-35 are active.

The fate of gdbstub is left undecided for the moment.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  8 ++--
 target/arm/tcg/translate.h  | 20 ++++-----
 target/arm/cpu.c            |  6 +--
 target/arm/gdbstub64.c      |  2 +
 target/arm/helper.c         | 11 ++---
 target/arm/machine.c        | 81 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper-a64.c |  2 +-
 7 files changed, 107 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6fa94db524..1f9042c7ef 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -268,7 +268,7 @@ typedef struct CPUArchState {
     uint64_t xregs[32];
     uint64_t pc;
     /* PSTATE isn't an architectural register for ARMv8. However, it is
-     * convenient for us to assemble the underlying state into a 32 bit format
+     * convenient for us to assemble the underlying state into a 64 bit format
      * identical to the architectural format used for the SPSR. (This is also
      * what the Linux kernel's 'pstate' field in signal handlers and KVM's
      * 'pstate' register are.) Of the PSTATE bits:
@@ -280,7 +280,7 @@ typedef struct CPUArchState {
      *  SM and ZA are kept in env->svcr
      *  all other bits are stored in their correct places in env->pstate
      */
-    uint32_t pstate;
+    uint64_t pstate;
     bool aarch64; /* True if CPU is in aarch64 state; inverse of PSTATE.nRW */
     bool thumb;   /* True if CPU is in thumb mode; cpsr[5] */
 
@@ -1538,7 +1538,7 @@ static inline unsigned int aarch64_pstate_mode(unsigned int el, bool handler)
  * interprocessing, so we don't attempt to sync with the cpsr state used by
  * the 32 bit decoder.
  */
-static inline uint32_t pstate_read(CPUARMState *env)
+static inline uint64_t pstate_read(CPUARMState *env)
 {
     int ZF;
 
@@ -1548,7 +1548,7 @@ static inline uint32_t pstate_read(CPUARMState *env)
         | env->pstate | env->daif | (env->btype << 10);
 }
 
-static inline void pstate_write(CPUARMState *env, uint32_t val)
+static inline void pstate_write(CPUARMState *env, uint64_t val)
 {
     env->ZF = (~val) & PSTATE_Z;
     env->NF = val;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 761edded52..943dfd45fe 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -378,27 +378,27 @@ static inline TCGv_i32 get_ahp_flag(void)
 }
 
 /* Set bits within PSTATE.  */
-static inline void set_pstate_bits(uint32_t bits)
+static inline void set_pstate_bits(uint64_t bits)
 {
-    TCGv_i32 p = tcg_temp_new_i32();
+    TCGv_i64 p = tcg_temp_new_i64();
 
     tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
 
-    tcg_gen_ld_i32(p, tcg_env, offsetof(CPUARMState, pstate));
-    tcg_gen_ori_i32(p, p, bits);
-    tcg_gen_st_i32(p, tcg_env, offsetof(CPUARMState, pstate));
+    tcg_gen_ld_i64(p, tcg_env, offsetof(CPUARMState, pstate));
+    tcg_gen_ori_i64(p, p, bits);
+    tcg_gen_st_i64(p, tcg_env, offsetof(CPUARMState, pstate));
 }
 
 /* Clear bits within PSTATE.  */
-static inline void clear_pstate_bits(uint32_t bits)
+static inline void clear_pstate_bits(uint64_t bits)
 {
-    TCGv_i32 p = tcg_temp_new_i32();
+    TCGv_i64 p = tcg_temp_new_i64();
 
     tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
 
-    tcg_gen_ld_i32(p, tcg_env, offsetof(CPUARMState, pstate));
-    tcg_gen_andi_i32(p, p, ~bits);
-    tcg_gen_st_i32(p, tcg_env, offsetof(CPUARMState, pstate));
+    tcg_gen_ld_i64(p, tcg_env, offsetof(CPUARMState, pstate));
+    tcg_gen_andi_i64(p, p, ~bits);
+    tcg_gen_st_i64(p, tcg_env, offsetof(CPUARMState, pstate));
 }
 
 /* If the singlestep state is Active-not-pending, advance to Active-pending. */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4d649bb69c..8ecf8a5e4d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -826,7 +826,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    uint32_t psr = pstate_read(env);
+    uint64_t psr = pstate_read(env);
     int i, j;
     int el = arm_current_el(env);
     uint64_t hcr = arm_hcr_el2_eff(env);
@@ -848,7 +848,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     } else {
         ns_status = "";
     }
-    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
+    qemu_fprintf(f, "PSTATE=%016" PRIx64 " %c%c%c%c %sEL%d%c",
                  psr,
                  psr & PSTATE_N ? 'N' : '-',
                  psr & PSTATE_Z ? 'Z' : '-',
@@ -865,7 +865,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                      (FIELD_EX64(env->svcr, SVCR, SM) ? 'S' : '-'));
     }
     if (cpu_isar_feature(aa64_bti, cpu)) {
-        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
+        qemu_fprintf(f, "  BTYPE=%d", (int)(psr & PSTATE_BTYPE) >> 10);
     }
     qemu_fprintf(f, "%s%s%s",
                  (hcr & HCR_NV) ? " NV" : "",
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 3bccde2bf2..65d6bbe65f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -47,6 +47,7 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     case 32:
         return gdb_get_reg64(mem_buf, env->pc);
     case 33:
+        /* pstate is now a 64-bit value; can we simply adjust the xml? */
         return gdb_get_reg32(mem_buf, pstate_read(env));
     }
     /* Unknown register.  */
@@ -75,6 +76,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         return 8;
     case 33:
         /* CPSR */
+        /* pstate is now a 64-bit value; can we simply adjust the xml? */
         pstate_write(env, tmp);
         return 4;
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1c3e88aaf5..ffb6ab63ed 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8955,8 +8955,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
     vaddr addr = env->cp15.vbar_el[new_el];
-    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
-    unsigned int old_mode;
+    uint64_t new_mode = aarch64_pstate_mode(new_el, true);
+    uint64_t old_mode;
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
@@ -9104,7 +9104,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
                  * If NV2 is disabled, change SPSR when NV,NV1 == 1,0 (I_ZJRNN)
                  * If NV2 is enabled, change SPSR when NV is 1 (I_DBTLM)
                  */
-                old_mode = deposit32(old_mode, 2, 2, 2);
+                old_mode = deposit64(old_mode, 2, 2, 2);
             }
         }
     } else {
@@ -9117,7 +9117,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
     env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
 
-    qemu_log_mask(CPU_LOG_INT, "...with SPSR 0x%x\n", old_mode);
+    qemu_log_mask(CPU_LOG_INT, "...with SPSR 0x%" PRIx64 "\n", old_mode);
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
@@ -9171,7 +9171,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 
     env->pc = addr;
 
-    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
+    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64
+                  " PSTATE 0x%" PRIx64 "\n",
                   new_el, env->pc, pstate_read(env));
 }
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index ce20b46f50..44a0cf844b 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -816,6 +816,80 @@ static const VMStateInfo vmstate_cpsr = {
     .put = put_cpsr,
 };
 
+static int get_pstate64(QEMUFile *f, void *opaque, size_t size,
+                        const VMStateField *field)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    uint64_t val = qemu_get_be64(f);
+
+    env->aarch64 = ((val & PSTATE_nRW) == 0);
+    if (is_a64(env)) {
+        pstate_write(env, val);
+    } else {
+        cpsr_write_from_spsr_elx(env, val);
+    }
+    return 0;
+}
+
+static int put_pstate64(QEMUFile *f, void *opaque, size_t size,
+                        const VMStateField *field, JSONWriter *vmdesc)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    uint64_t val;
+
+    if (is_a64(env)) {
+        val = pstate_read(env);
+    } else {
+        val = cpsr_read_for_spsr_elx(env);
+    }
+    qemu_put_be64(f, val);
+    return 0;
+}
+
+static bool pstate64_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    uint64_t val;
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (is_a64(env)) {
+        val = pstate_read(env);
+    } else {
+        val = cpsr_read_for_spsr_elx(env);
+        if (val & PSTATE_SS) {
+            return true;
+        }
+    }
+    return val > UINT32_MAX;
+}
+
+static const VMStateDescription vmstate_pstate64 = {
+    .name = "cpu/pstate64",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pstate64_needed,
+    .fields = (const VMStateField[]) {
+        {
+            .name = "pstate64",
+            .version_id = 0,
+            .size = sizeof(uint64_t),
+            .info = &(const VMStateInfo) {
+                .name = "pstate64",
+                .get = get_pstate64,
+                .put = put_pstate64,
+            },
+            .flags = VMS_SINGLE,
+            .offset = 0,
+        },
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int get_power(QEMUFile *f, void *opaque, size_t size,
                     const VMStateField *field)
 {
@@ -1052,6 +1126,12 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT32_ARRAY(env.regs, ARMCPU, 16),
         VMSTATE_UINT64_ARRAY(env.xregs, ARMCPU, 32),
         VMSTATE_UINT64(env.pc, ARMCPU),
+        /*
+         * If any bits are set in the upper 32 bits of cpsr/pstate,
+         * or if the cpu is in aa32 mode and PSTATE.SS is set, then
+         * the cpu/pstate64 subsection will override this with the
+         * full 64 bit state.
+         */
         {
             .name = "cpsr",
             .version_id = 0,
@@ -1128,6 +1208,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
         &vmstate_syndrome64,
+        &vmstate_pstate64,
         NULL
     }
 };
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index eaea7859d3..08b7db7c46 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -620,7 +620,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     ARMCPU *cpu = env_archcpu(env);
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
-    uint32_t spsr = env->banked_spsr[spsr_idx];
+    uint64_t spsr = env->banked_spsr[spsr_idx];
     int new_el;
     bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
-- 
2.43.0


