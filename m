Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E94CA1001
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:46:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxp-0005bq-Pi; Sat, 30 Aug 2025 11:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQc-0007Ff-1U
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:08 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQW-0004ql-7d
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:03 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2445806e03cso29839065ad.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532818; x=1757137618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APFM5mjm/10n5J+KtKVCrzvfw+w3wn4sm2ZqcCK7Dck=;
 b=t7s/W9/uErsJL9HQ9OYlZvacEnmXVBzmbXqf3jd+2u8eHHg4/NMbfooUH9IrjmQqkN
 oLQM5v1ezLTzfh0n4Jljs5wlBAB2ngeUpo0Dj9ifx27kdORK7rQI6SXnKrIsRc90zkcK
 I+t0VnDEKYf2W2dvQkrzoCXkqyLRx0zxNhdgk52eqxtbGcDGSX7yuq8m7WBGHKsvrLAQ
 7XNkTQHd3RGRPSuvpawvrMAanPq/jNCHfVZkYqIf3jJnLF8egkVs1onREwH3jWr3GLjN
 OielGbtyuLgxmxoxVZ1zfF7IaQkDAYt3GKtWh8pj8hkhsVfbvx6tqnjg0lMMhGfu2t2P
 GkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532818; x=1757137618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APFM5mjm/10n5J+KtKVCrzvfw+w3wn4sm2ZqcCK7Dck=;
 b=c+xSgDt/DzLLZjgEETOmOzs55ZrGxohsv1NW18PAwN6NizqX5zioLBJsC7vOmfR42R
 xGt4IcK73fT6biltrlbEMrSepQeaecol3ufuEm5bST+LEGehBseKVcqsqN86GuUd7H7T
 nwmK8JcGbbKjy2eCaL8RAflqE07hj3ZPt9OCpycdyJD6pHg6C5zUB+TnZhyWuOVKXlP+
 IJrnDLqPkHW8R0v4BjRy2qy/c6LHbp4oRrp8S2lZ/o1YXYB8KYmDQjZsgV+7XXPBBgc6
 fyIGTjnNVl4qfoy5XgDVBJxQWZzMk52/XUdRxojzbsDjNSg+XL5MDzVE3VzwuD3AEYk/
 f0pw==
X-Gm-Message-State: AOJu0YywDA7/U/0RwkVlugpvLktE0b1lmfbw2VgrG94KOR4FZZlkx7w8
 DZk1wfVFX9osixUlMCuwNSjcunnwdoqe4P1dp0GK3CL97ldPQIQ9rfT4HmKr9TnSn2o=
X-Gm-Gg: ASbGncuE2J0jnzglN9xVCB75x4RR9hZhcnQupJa8VBlddQXr0VqsuTGi0n7wjPg9slk
 dIH+9U+8g2hckAUoLtQGCPl8tHi1AtG+PWtTMmtW5+Wh9fRG00yxhM1YOGb2VD7KsSR6dKIXnvi
 De3nWJKXQtv+uCp8jieDSluQEyVWEp/Tkx9nRTXu9X/ubR0yR9j849ZZ/FHXg4tGDiVIiO8xKkp
 A5kwOACT/Zhu1ZV0DJbJJSmq/TKPchN/9dI8EKhB6UIMfqUVic/3L7sqX46hl9TySpX9SPoGZWm
 4AN0ogvdGltBkVb6BOtbSDu22UE6N16yv3Hknsxo2vgqpLgC+VSl21Sk+TrrHyIQkJV7gdqXX0O
 3R+6ZNwJCN5X1ab9VuXzvBAC0pXLR0ORyspW4oDpQN+k7XEPwXogxOIACbQWVo+16oOsYxsOQ8w
 ==
X-Google-Smtp-Source: AGHT+IGOpRhE9pQLGDhZcr2o6Z6SojgAcyfqYi6vsTQdOqpj+tDYl93J6/UoPZpvt6pTlxxcgq6Ktg==
X-Received: by 2002:a17:903:2cf:b0:248:9e56:e806 with SMTP id
 d9443c01a7336-24944870a36mr17350975ad.12.1756532818082; 
 Fri, 29 Aug 2025 22:46:58 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:46:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 50/84] target/arm: Expand pstate to 64 bits
Date: Sat, 30 Aug 2025 15:40:54 +1000
Message-ID: <20250830054128.448363-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 target/arm/cpu.h            |  8 +++---
 target/arm/tcg/translate.h  | 20 ++++++-------
 target/arm/cpu.c            |  6 ++--
 target/arm/gdbstub64.c      |  2 ++
 target/arm/helper.c         | 11 ++++----
 target/arm/machine.c        | 56 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper-a64.c |  2 +-
 7 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6568bca5f9..d5a5152a9c 100644
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
 
@@ -1547,7 +1547,7 @@ static inline unsigned int aarch64_pstate_mode(unsigned int el, bool handler)
  * interprocessing, so we don't attempt to sync with the cpsr state used by
  * the 32 bit decoder.
  */
-static inline uint32_t pstate_read(CPUARMState *env)
+static inline uint64_t pstate_read(CPUARMState *env)
 {
     int ZF;
 
@@ -1557,7 +1557,7 @@ static inline uint32_t pstate_read(CPUARMState *env)
         | env->pstate | env->daif | (env->btype << 10);
 }
 
-static inline void pstate_write(CPUARMState *env, uint32_t val)
+static inline void pstate_write(CPUARMState *env, uint64_t val)
 {
     env->ZF = (~val) & PSTATE_Z;
     env->NF = val;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3e63dad2b6..1479f5bf74 100644
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
index 6673d536bf..1c2ff87b89 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1205,7 +1205,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    uint32_t psr = pstate_read(env);
+    uint64_t psr = pstate_read(env);
     int i, j;
     int el = arm_current_el(env);
     uint64_t hcr = arm_hcr_el2_eff(env);
@@ -1227,7 +1227,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     } else {
         ns_status = "";
     }
-    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
+    qemu_fprintf(f, "PSTATE=%016" PRIx64 " %c%c%c%c %sEL%d%c",
                  psr,
                  psr & PSTATE_N ? 'N' : '-',
                  psr & PSTATE_Z ? 'Z' : '-',
@@ -1244,7 +1244,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                      (FIELD_EX64(env->svcr, SVCR, SM) ? 'S' : '-'));
     }
     if (cpu_isar_feature(aa64_bti, cpu)) {
-        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
+        qemu_fprintf(f, "  BTYPE=%d", (int)(psr & PSTATE_BTYPE) >> 10);
     }
     qemu_fprintf(f, "%s%s%s",
                  (hcr & HCR_NV) ? " NV" : "",
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 08e2858539..d0d769df53 100644
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
index 7a23730299..83a7d6ae36 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9079,8 +9079,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
     vaddr addr = env->cp15.vbar_el[new_el];
-    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
-    unsigned int old_mode;
+    uint64_t new_mode = aarch64_pstate_mode(new_el, true);
+    uint64_t old_mode;
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
@@ -9228,7 +9228,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
                  * If NV2 is disabled, change SPSR when NV,NV1 == 1,0 (I_ZJRNN)
                  * If NV2 is enabled, change SPSR when NV is 1 (I_DBTLM)
                  */
-                old_mode = deposit32(old_mode, 2, 2, 2);
+                old_mode = deposit64(old_mode, 2, 2, 2);
             }
         }
     } else {
@@ -9241,7 +9241,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
     env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
 
-    qemu_log_mask(CPU_LOG_INT, "...with SPSR 0x%x\n", old_mode);
+    qemu_log_mask(CPU_LOG_INT, "...with SPSR 0x%" PRIx64 "\n", old_mode);
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
@@ -9295,7 +9295,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 
     env->pc = addr;
 
-    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
+    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64
+                  " PSTATE 0x%" PRIx64 "\n",
                   new_el, env->pc, pstate_read(env));
 }
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 8dbeca2867..9b00c14b4a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -836,6 +836,61 @@ static const VMStateInfo vmstate_cpsr = {
     .put = put_cpsr,
 };
 
+static int get_pstate64_1(QEMUFile *f, void *opaque, size_t size,
+                          const VMStateField *field)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    uint64_t val = qemu_get_be64(f);
+
+    env->aarch64 = ((val & PSTATE_nRW) == 0);
+    pstate_write(env, val);
+    return 0;
+}
+
+static int put_pstate64_1(QEMUFile *f, void *opaque, size_t size,
+                          const VMStateField *field, JSONWriter *vmdesc)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    uint64_t val = pstate_read(env);
+
+    qemu_put_be64(f, val);
+    return 0;
+}
+
+static const VMStateInfo vmstate_pstate64_1 = {
+    .name = "pstate64",
+    .get = get_pstate64_1,
+    .put = put_pstate64_1,
+};
+
+static bool pstate64_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return is_a64(env) && pstate_read(env) > UINT32_MAX;
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
+            .info = &vmstate_pstate64_1,
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
@@ -1119,6 +1174,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
+        &vmstate_pstate64,
         NULL
     }
 };
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 71c6c44ee8..f61adf1f80 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -639,7 +639,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
     ARMCPU *cpu = env_archcpu(env);
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
-    uint32_t spsr = env->banked_spsr[spsr_idx];
+    uint64_t spsr = env->banked_spsr[spsr_idx];
     int new_el;
     bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
-- 
2.43.0


