Received: by 10.25.159.19 with SMTP id i19csp1756244lfe;
        Sun, 17 Jan 2016 23:19:59 -0800 (PST)
X-Received: by 10.140.139.71 with SMTP id 68mr32077020qhl.51.1453101599886;
        Sun, 17 Jan 2016 23:19:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si29592811qkz.111.2016.01.17.23.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL46Z-0007Mk-8Z
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:19:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL404-0003Yo-EQ
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL402-00078G-FX
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 02:13:16 -0500
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:33617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zx-00076n-6b; Mon, 18 Jan 2016 02:13:09 -0500
Received: by mail-pa0-x22c.google.com with SMTP id cy9so429594024pac.0;
	Sun, 17 Jan 2016 23:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HNNt1h/nDWB2MQ6DxyRraWr+k7XbDOLcAxTIOF1fPaY=;
	b=I6K0Q6gmBR3uIiJO/zuqs/o+vkom/uMfclML/kZFk0ffwOSEy9dUhLdKx4Z6ht63mj
	4rcjDmgYCgGX0Vn3fyHqn6jP4CRr/bDT6R2wrS9/KsnuolxPMKms5svgDt4TDstNyXCt
	s9v0gVs3XaYhICRHDb1jyL3NB32MoVvi+Ts3fc3NO9hTfE1d7Yf6NIuvdGYblhreUy6L
	Lr5enbNZZL71eP5qxfgIXfM06CiHWaQAe7igRSVQfMMb4tmqCcpkG+2F2ZIJazRo5RFK
	gu/79sWnAdV2IQ6G+69HyuD4QIbD973Qw/QKy1xHBlJkAZTXNl1FTFyaJuUDtoyjhplb
	iNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HNNt1h/nDWB2MQ6DxyRraWr+k7XbDOLcAxTIOF1fPaY=;
	b=RvLi1IUc3K+LTm4csXr4bVnEDcnd2yISf+MbkXrAgwFvgSEyWabDPdQc29yZQqffP3
	jszQMbRwob48EG/613V4f5g9iomikD73MOrRm1YFMw5oeL0WXbW+WryPl6c4uMlQn3GE
	fv+UlUvEe0OMlZifjZ3TSz6zs7EVQYTLJPRxFkcg878+aaZWtKQ5fskrkpm8UWf8iTAp
	ZQAMuX+DpjraM/NthaqgwWjaE0cPIhJZob0d2n87giL1aMeCo0tZTuY6J2hnkyt0rxmv
	TvSEQEguURdM6uA4ToFSGh9+WcAuPcKbhzo11WHcq0irXtninS2cLuRkDFASLJz9Zs14
	JlOg==
X-Gm-Message-State: ALoCoQl/pJdFsE7Lc3CTZFvQP8YBQ5NrjR5wrK8qlcAVnwnI3yCmWxOCg+PTCwHdCFrq1Eq6ehcQt4gnyGSduhM7tYl2uv5UBw==
X-Received: by 10.66.242.17 with SMTP id wm17mr33863903pac.155.1453101188720; 
	Sun, 17 Jan 2016 23:13:08 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:07 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:39 -0800
Message-Id: <923e454020ea0b713a1225ab81ff0db636c76a4f.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: peter.maydell@linaro.org, alistair.francis@xilinx.com,
	sridhar_kulk@yahoo.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v1 12/17] target-arm: implement SCTLR.B,
	drop bswap_code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8+pl5S40l6nm

From: Paolo Bonzini <pbonzini@redhat.com>

bswap_code is a CPU property of sorts ("is the iside endianness the
opposite way round to TARGET_WORDS_BIGENDIAN?") but it is not the
actual CPU state involved here which is SCTLR.B (set for BE32
binaries, clear for BE8).

Replace bswap_code with SCTLR.B, and pass that to arm_ld*_code.
The next patches will make data fetches honor both SCTLR.B and
CPSR.E appropriately.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[PC changes:
 * rebased on master (Jan 2016)
 * Dropped comment about CPSR.E being unimplemented
 * s/TARGET_USER_ONLY/CONFIG_USER_ONLY
 * Use bswap_code() for disas_set_info() instead of raw sctlr_b
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 linux-user/main.c          | 13 ++++++++-----
 target-arm/arm_ldst.h      |  8 ++++----
 target-arm/cpu.c           |  2 +-
 target-arm/cpu.h           | 47 ++++++++++++++++++++++++++++++++++++++--------
 target-arm/helper.c        |  8 ++++----
 target-arm/translate-a64.c |  6 +++---
 target-arm/translate.c     | 12 ++++++------
 target-arm/translate.h     |  2 +-
 8 files changed, 66 insertions(+), 32 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 2157774..d481458 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -441,7 +441,7 @@ void cpu_loop(CPUX86State *env)
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && (env)->bswap_code) {                \
+        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
             (x) = bswap32(x);                           \
         }                                               \
         __r;                                            \
@@ -449,7 +449,7 @@ void cpu_loop(CPUX86State *env)
 
 #define get_user_code_u16(x, gaddr, env)                \
     ({ abi_long __r = get_user_u16((x), (gaddr));       \
-        if (!__r && (env)->bswap_code) {                \
+        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
             (x) = bswap16(x);                           \
         }                                               \
         __r;                                            \
@@ -4489,14 +4489,17 @@ int main(int argc, char **argv, char **envp)
             env->regs[i] = regs->uregs[i];
         }
 #ifdef TARGET_WORDS_BIGENDIAN
-        env->uncached_cpsr |= CPSR_E;
         env->cp15.sctlr_el[1] |= SCTLR_E0E;
-#endif
         /* Enable BE8.  */
         if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
             && (info->elf_flags & EF_ARM_BE8)) {
-            env->bswap_code = 1;
+            env->uncached_cpsr |= CPSR_E;
+        } else {
+            env->cp15.sctlr_el[1] |= SCTLR_B;
+            /* We model BE32 as regular BE, so set CPSR_E */
+            env->uncached_cpsr |= CPSR_E;
         }
+#endif
     }
 #elif defined(TARGET_UNICORE32)
     {
diff --git a/target-arm/arm_ldst.h b/target-arm/arm_ldst.h
index b1ece01..35c2c43 100644
--- a/target-arm/arm_ldst.h
+++ b/target-arm/arm_ldst.h
@@ -25,10 +25,10 @@
 
 /* Load an instruction and return it in the standard little-endian order */
 static inline uint32_t arm_ldl_code(CPUARMState *env, target_ulong addr,
-                                    bool do_swap)
+                                    bool sctlr_b)
 {
     uint32_t insn = cpu_ldl_code(env, addr);
-    if (do_swap) {
+    if (bswap_code(sctlr_b)) {
         return bswap32(insn);
     }
     return insn;
@@ -36,10 +36,10 @@ static inline uint32_t arm_ldl_code(CPUARMState *env, target_ulong addr,
 
 /* Ditto, for a halfword (Thumb) instruction */
 static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
-                                     bool do_swap)
+                                     bool sctlr_b)
 {
     uint16_t insn = cpu_lduw_code(env, addr);
-    if (do_swap) {
+    if (bswap_code(sctlr_b)) {
         return bswap16(insn);
     }
     return insn;
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index d3b73bf..cec5147 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -413,7 +413,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
     } else {
         info->print_insn = print_insn_arm;
     }
-    if (env->bswap_code) {
+    if (bswap_code(arm_sctlr_b(env))) {
 #ifdef TARGET_WORDS_BIGENDIAN
         info->endian = BFD_ENDIAN_LITTLE;
 #else
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 74048d1..3edd56b 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -478,9 +478,6 @@ typedef struct CPUARMState {
         uint32_t cregs[16];
     } iwmmxt;
 
-    /* For mixed endian mode.  */
-    bool bswap_code;
-
 #if defined(CONFIG_USER_ONLY)
     /* For usermode syscall translation.  */
     int eabi;
@@ -1795,6 +1792,19 @@ static inline bool arm_singlestep_active(CPUARMState *env)
         && arm_generate_debug_exceptions(env);
 }
 
+static inline bool arm_sctlr_b(CPUARMState *env)
+{
+    return
+        /* We need not implement SCTLR.ITD in user-mode emulation, so
+         * let linux-user ignore the fact that it conflicts with SCTLR_B.
+         * This lets people run BE32 binaries with "-cpu any".
+         */
+#ifndef CONFIG_USER_ONLY
+        !arm_feature(env, ARM_FEATURE_V7) &&
+#endif
+        (env->cp15.sctlr_el[1] & SCTLR_B) != 0;
+}
+
 /* Return true if the processor is in big-endian mode. */
 static bool arm_cpu_is_big_endian(CPUARMState *env)
 {
@@ -1844,8 +1854,8 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
 #define ARM_TBFLAG_VFPEN_MASK       (1 << ARM_TBFLAG_VFPEN_SHIFT)
 #define ARM_TBFLAG_CONDEXEC_SHIFT   8
 #define ARM_TBFLAG_CONDEXEC_MASK    (0xff << ARM_TBFLAG_CONDEXEC_SHIFT)
-#define ARM_TBFLAG_BSWAP_CODE_SHIFT 16
-#define ARM_TBFLAG_BSWAP_CODE_MASK  (1 << ARM_TBFLAG_BSWAP_CODE_SHIFT)
+#define ARM_TBFLAG_SCTLR_B_SHIFT    16
+#define ARM_TBFLAG_SCTLR_B_MASK     (1 << ARM_TBFLAG_SCTLR_B_SHIFT)
 /* We store the bottom two bits of the CPAR as TB flags and handle
  * checks on the other bits at runtime
  */
@@ -1883,8 +1893,8 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
     (((F) & ARM_TBFLAG_VFPEN_MASK) >> ARM_TBFLAG_VFPEN_SHIFT)
 #define ARM_TBFLAG_CONDEXEC(F) \
     (((F) & ARM_TBFLAG_CONDEXEC_MASK) >> ARM_TBFLAG_CONDEXEC_SHIFT)
-#define ARM_TBFLAG_BSWAP_CODE(F) \
-    (((F) & ARM_TBFLAG_BSWAP_CODE_MASK) >> ARM_TBFLAG_BSWAP_CODE_SHIFT)
+#define ARM_TBFLAG_SCTLR_B(F) \
+    (((F) & ARM_TBFLAG_SCTLR_B_MASK) >> ARM_TBFLAG_SCTLR_B_SHIFT)
 #define ARM_TBFLAG_XSCALE_CPAR(F) \
     (((F) & ARM_TBFLAG_XSCALE_CPAR_MASK) >> ARM_TBFLAG_XSCALE_CPAR_SHIFT)
 #define ARM_TBFLAG_NS(F) \
@@ -1892,6 +1902,27 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
 #define ARM_TBFLAG_MOE(F) \
     (((F) & ARM_TBFLAG_MOE_MASK) >> ARM_TBFLAG_MOE_SHIFT)
 
+static inline bool bswap_code(bool sctlr_b)
+{
+#ifdef CONFIG_USER_ONLY
+    /* BE8 (SCTLR.B = 0, TARGET_WORDS_BIGENDIAN = 1) is mixed endian.
+     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_WORDS_BIGENDIAN=0
+     * would also end up as a mixed-endian mode with BE code, LE data.
+     */
+    return
+#ifdef TARGET_WORDS_BIGENDIAN
+        1 ^
+#endif
+        sctlr_b;
+#else
+    /* We do not implement BE32 mode for system-mode emulation, but
+     * anyway it would always do little-endian accesses with
+     * TARGET_WORDS_BIGENDIAN = 0.
+     */
+    return 0;
+#endif
+}
+
 /* Return the exception level to which FP-disabled exceptions should
  * be taken, or 0 if FP is enabled.
  */
@@ -1990,7 +2021,7 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             | (env->vfp.vec_len << ARM_TBFLAG_VECLEN_SHIFT)
             | (env->vfp.vec_stride << ARM_TBFLAG_VECSTRIDE_SHIFT)
             | (env->condexec_bits << ARM_TBFLAG_CONDEXEC_SHIFT)
-            | (env->bswap_code << ARM_TBFLAG_BSWAP_CODE_SHIFT);
+            | (arm_sctlr_b(env) << ARM_TBFLAG_SCTLR_B_SHIFT);
         if (!(access_secure_reg(env))) {
             *flags |= ARM_TBFLAG_NS_MASK;
         }
diff --git a/target-arm/helper.c b/target-arm/helper.c
index afac1b2..a69a82c 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5452,7 +5452,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     case EXCP_BKPT:
         if (semihosting_enabled()) {
             int nr;
-            nr = arm_lduw_code(env, env->regs[15], env->bswap_code) & 0xff;
+            nr = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env)) & 0xff;
             if (nr == 0xab) {
                 env->regs[15] += 2;
                 qemu_log_mask(CPU_LOG_INT,
@@ -5767,10 +5767,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
         if (semihosting_enabled()) {
             /* Check for semihosting interrupt.  */
             if (env->thumb) {
-                mask = arm_lduw_code(env, env->regs[15] - 2, env->bswap_code)
+                mask = arm_lduw_code(env, env->regs[15] - 2, arm_sctlr_b(env))
                     & 0xff;
             } else {
-                mask = arm_ldl_code(env, env->regs[15] - 4, env->bswap_code)
+                mask = arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_b(env))
                     & 0xffffff;
             }
             /* Only intercept calls from privileged modes, to provide some
@@ -5794,7 +5794,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     case EXCP_BKPT:
         /* See if this is a semihosting syscall.  */
         if (env->thumb && semihosting_enabled()) {
-            mask = arm_lduw_code(env, env->regs[15], env->bswap_code) & 0xff;
+            mask = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env)) & 0xff;
             if (mask == 0xab
                   && (env->uncached_cpsr & CPSR_M) != ARM_CPU_MODE_USR) {
                 env->regs[15] += 2;
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index db68662..4fd266b 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -10978,7 +10978,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
 {
     uint32_t insn;
 
-    insn = arm_ldl_code(env, s->pc, s->bswap_code);
+    insn = arm_ldl_code(env, s->pc, s->sctlr_b);
     s->insn = insn;
     s->pc += 4;
 
@@ -11043,7 +11043,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
-    dc->bswap_code = 0;
+    dc->sctlr_b = 0;
     dc->mo_endianness = ARM_TBFLAG_MOE(tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
@@ -11230,7 +11230,7 @@ done_generating:
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-                         4 | (dc->bswap_code << 1));
+                         4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
         qemu_log("\n");
     }
 #endif
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 192a5d6..44c3ac9 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -9251,7 +9251,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
         /* Fall through to 32-bit decode.  */
     }
 
-    insn = arm_lduw_code(env, s->pc, s->bswap_code);
+    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
     s->pc += 2;
     insn |= (uint32_t)insn_hw1 << 16;
 
@@ -10493,7 +10493,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         }
     }
 
-    insn = arm_lduw_code(env, s->pc, s->bswap_code);
+    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
     s->pc += 2;
 
     switch (insn >> 12) {
@@ -11218,7 +11218,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
     }
 
     /* This must be a Thumb insn */
-    insn = arm_lduw_code(env, s->pc, s->bswap_code);
+    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
 
     if ((insn >> 11) >= 0x1d) {
         /* Top five bits 0b11101 / 0b11110 / 0b11111 : this is the
@@ -11273,7 +11273,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
     dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
-    dc->bswap_code = ARM_TBFLAG_BSWAP_CODE(tb->flags);
+    dc->sctlr_b = ARM_TBFLAG_SCTLR_B(tb->flags);
     dc->mo_endianness = ARM_TBFLAG_MOE(tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
     dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
@@ -11454,7 +11454,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                 }
             }
         } else {
-            unsigned int insn = arm_ldl_code(env, dc->pc, dc->bswap_code);
+            unsigned int insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
             dc->pc += 4;
             disas_arm_insn(dc, insn);
         }
@@ -11611,7 +11611,7 @@ done_generating:
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-                         dc->thumb | (dc->bswap_code << 1));
+                         dc->thumb | (dc->sctlr_b << 1));
         qemu_log("\n");
     }
 #endif
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 95c3b94..7d7f449 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -16,7 +16,7 @@ typedef struct DisasContext {
     struct TranslationBlock *tb;
     int singlestep_enabled;
     int thumb;
-    int bswap_code;
+    int sctlr_b;
     TCGMemOp mo_endianness;
 #if !defined(CONFIG_USER_ONLY)
     int user;
-- 
1.9.1

