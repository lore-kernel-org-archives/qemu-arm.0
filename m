Received: by 10.25.208.211 with SMTP id h202csp2008281lfg;
        Tue, 1 Mar 2016 22:57:04 -0800 (PST)
X-Received: by 10.140.106.11 with SMTP id d11mr31268973qgf.80.1456901824458;
        Tue, 01 Mar 2016 22:57:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127si34689097qhd.121.2016.03.01.22.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:57:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0iV-0006Jq-UI
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:57:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iR-0006Ak-MD
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:57:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iP-0003SN-Qx
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:56:59 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:34346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iK-0003PQ-8K; Wed, 02 Mar 2016 01:56:52 -0500
Received: by mail-pf0-x22b.google.com with SMTP id 4so50020349pfd.1;
	Tue, 01 Mar 2016 22:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OcFT/UuLmrJBFQaMmQOT1kwBNv1WyIozvhH+wlK8TFY=;
	b=mRA6ab6qVZJuMw+dzXs5OZs5pi1bmfSAxkQ1f4UIWXbdJYh/OMkAiM8PYtxu9yxn3J
	BcPDzLAJdoVHbgOaiG+4wQitGHMvl6r/QySFfdDg/r6JdIF5RulHSFtyJ4KbqXLLnBEV
	yQmrQbY2MGOd2ps8m/J7GYeUIQ9nDm1c2/KPq+I2TggbZrlA+93ht45iYAKdFRpjMaG2
	YLAnd6eyy9TbFqhBRes/gXfl2bLiOi4qWApzOyGSpB9tep+MntErqVHrmN2qX1i0l/m5
	AUvW6IWK/B63q1jq9+LHMX3toM4fSfprFsnp7DIpBmr0xA5Vknik1CXMDu9wKoorUmBP
	W+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OcFT/UuLmrJBFQaMmQOT1kwBNv1WyIozvhH+wlK8TFY=;
	b=SZbRD8QdurIUfseMT65dDcGJIB+839tDqzP7kr0hKGDw+3Jeq8sNFEESEdL5DjNFuJ
	xlMQd0fIqRhS8LctLhwC6yUs13uWWBye2qFRMUX7ir7PJJBuQpnBec/b++4PhfAkLWEJ
	mPLKah1pBnhB0qCmxgPBP2JxS4XvQJFnKtLDs+HAZxvqM2XbU7w3jZc0P4QboY6zvfRY
	/JO66i32QFRL+n7/vFU+ACWgPTqabn9YLAB6+YrGf0NUBAdANdhKG+cwpWoXwzYT2BhB
	su77OGAjHH3+Q6KpJY7L/rsv54l4y+QVfHC4M+MyPqCxbi1FC02KQPB2/Yqp7gB2Pq5M
	j5eA==
X-Gm-Message-State: AD7BkJJ8ADRA6bNJoLFkPVp/Q4uPTmGTBB1UsTwXncB4Sa6qhRcneAlqwUEqmHZ5MBskRA==
X-Received: by 10.98.0.84 with SMTP id 81mr36173274pfa.67.1456901811409;
	Tue, 01 Mar 2016 22:56:51 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:50 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:07 -0800
Message-Id: <f197acd9175c322ff5838fd4a9b2736dadc36786.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22b
Cc: peter.maydell@linaro.org, sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v2 03/18] target-arm: implement SCTLR.B,
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
X-TUID: hI9pvoesM5RY

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
 * s/TARGET_USER_ONLY/CONFIG_USER_ONLY
 * Use bswap_code() for disas_set_info() instead of raw sctlr_b
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
TEST result: 0 (log@ logs/qemu-armeb-BE32-)
TEST result: 0 (log@ logs/qemu-armeb-BE8-)
TEST result: 0 (log@ logs/qemu-arm-LE-)
TEST result: 0 (log@ logs/qemu-system-arm-LE-)
Changed since v1:
Re-added BE32 support

 linux-user/main.c          | 10 +++++++---
 target-arm/arm_ldst.h      |  8 ++++----
 target-arm/cpu.c           |  2 +-
 target-arm/cpu.h           | 47 ++++++++++++++++++++++++++++++++++++++--------
 target-arm/helper.c        |  8 ++++----
 target-arm/translate-a64.c |  6 +++---
 target-arm/translate.c     | 16 ++++++++--------
 target-arm/translate.h     |  2 +-
 8 files changed, 67 insertions(+), 32 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index bcb9f66..fe2a8dd 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -437,7 +437,7 @@ void cpu_loop(CPUX86State *env)
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && (env)->bswap_code) {                \
+        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
             (x) = bswap32(x);                           \
         }                                               \
         __r;                                            \
@@ -445,7 +445,7 @@ void cpu_loop(CPUX86State *env)
 
 #define get_user_code_u16(x, gaddr, env)                \
     ({ abi_long __r = get_user_u16((x), (gaddr));       \
-        if (!__r && (env)->bswap_code) {                \
+        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
             (x) = bswap16(x);                           \
         }                                               \
         __r;                                            \
@@ -4449,11 +4449,15 @@ int main(int argc, char **argv, char **envp)
         for(i = 0; i < 16; i++) {
             env->regs[i] = regs->uregs[i];
         }
+#ifdef TARGET_WORDS_BIGENDIAN
         /* Enable BE8.  */
         if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
             && (info->elf_flags & EF_ARM_BE8)) {
-            env->bswap_code = 1;
+            /* nothing for now, CPSR.E not emulated yet */
+        } else {
+            env->cp15.sctlr_el[1] |= SCTLR_B;
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
index e95b030..001fccf 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -427,7 +427,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
     } else {
         info->print_insn = print_insn_arm;
     }
-    if (env->bswap_code) {
+    if (bswap_code(arm_sctlr_b(env))) {
 #ifdef TARGET_WORDS_BIGENDIAN
         info->endian = BFD_ENDIAN_LITTLE;
 #else
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 744f052..61b8b03 100644
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
@@ -1898,6 +1895,19 @@ static inline bool arm_singlestep_active(CPUARMState *env)
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
 #include "exec/cpu-all.h"
 
 /* Bit usage in the TB flags field: bit 31 indicates whether we are
@@ -1928,8 +1938,8 @@ static inline bool arm_singlestep_active(CPUARMState *env)
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
@@ -1965,13 +1975,34 @@ static inline bool arm_singlestep_active(CPUARMState *env)
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
     (((F) & ARM_TBFLAG_NS_MASK) >> ARM_TBFLAG_NS_SHIFT)
 
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
@@ -2049,7 +2080,7 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             | (env->vfp.vec_len << ARM_TBFLAG_VECLEN_SHIFT)
             | (env->vfp.vec_stride << ARM_TBFLAG_VECSTRIDE_SHIFT)
             | (env->condexec_bits << ARM_TBFLAG_CONDEXEC_SHIFT)
-            | (env->bswap_code << ARM_TBFLAG_BSWAP_CODE_SHIFT);
+            | (arm_sctlr_b(env) << ARM_TBFLAG_SCTLR_B_SHIFT);
         if (!(access_secure_reg(env))) {
             *flags |= ARM_TBFLAG_NS_MASK;
         }
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 18c8296..32e66c8 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5841,7 +5841,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     case EXCP_BKPT:
         if (semihosting_enabled()) {
             int nr;
-            nr = arm_lduw_code(env, env->regs[15], env->bswap_code) & 0xff;
+            nr = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env)) & 0xff;
             if (nr == 0xab) {
                 env->regs[15] += 2;
                 qemu_log_mask(CPU_LOG_INT,
@@ -6379,13 +6379,13 @@ static inline bool check_for_semihosting(CPUState *cs)
         case EXCP_SWI:
             /* Check for semihosting interrupt.  */
             if (env->thumb) {
-                imm = arm_lduw_code(env, env->regs[15] - 2, env->bswap_code)
+                imm = arm_lduw_code(env, env->regs[15] - 2, arm_sctlr_b(env))
                     & 0xff;
                 if (imm == 0xab) {
                     break;
                 }
             } else {
-                imm = arm_ldl_code(env, env->regs[15] - 4, env->bswap_code)
+                imm = arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_b(env))
                     & 0xffffff;
                 if (imm == 0x123456) {
                     break;
@@ -6395,7 +6395,7 @@ static inline bool check_for_semihosting(CPUState *cs)
         case EXCP_BKPT:
             /* See if this is a semihosting syscall.  */
             if (env->thumb) {
-                imm = arm_lduw_code(env, env->regs[15], env->bswap_code)
+                imm = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env))
                     & 0xff;
                 if (imm == 0xab) {
                     env->regs[15] += 2;
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 7f65aea..f6dd44b 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -10966,7 +10966,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
 {
     uint32_t insn;
 
-    insn = arm_ldl_code(env, s->pc, s->bswap_code);
+    insn = arm_ldl_code(env, s->pc, s->sctlr_b);
     s->insn = insn;
     s->pc += 4;
 
@@ -11031,7 +11031,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
-    dc->bswap_code = 0;
+    dc->sctlr_b = 0;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
@@ -11217,7 +11217,7 @@ done_generating:
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-                         4 | (dc->bswap_code << 1));
+                         4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
         qemu_log("\n");
     }
 #endif
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 413f7de..ee04085 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7770,7 +7770,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         if ((insn & 0x0ffffdff) == 0x01010000) {
             ARCH(6);
             /* setend */
-            if (((insn >> 9) & 1) != s->bswap_code) {
+            if (((insn >> 9) & 1) != bswap_code(s->sctlr_b)) {
                 /* Dynamic endianness switching not implemented. */
                 qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
                 goto illegal_op;
@@ -9286,7 +9286,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
         /* Fall through to 32-bit decode.  */
     }
 
-    insn = arm_lduw_code(env, s->pc, s->bswap_code);
+    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
     s->pc += 2;
     insn |= (uint32_t)insn_hw1 << 16;
 
@@ -10528,7 +10528,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
         }
     }
 
-    insn = arm_lduw_code(env, s->pc, s->bswap_code);
+    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
     s->pc += 2;
 
     switch (insn >> 12) {
@@ -11099,7 +11099,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             case 2:
                 /* setend */
                 ARCH(6);
-                if (((insn >> 3) & 1) != s->bswap_code) {
+                if (((insn >> 3) & 1) != bswap_code(s->sctlr_b)) {
                     /* Dynamic endianness switching not implemented. */
                     qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
                     goto illegal_op;
@@ -11253,7 +11253,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
     }
 
     /* This must be a Thumb insn */
-    insn = arm_lduw_code(env, s->pc, s->bswap_code);
+    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
 
     if ((insn >> 11) >= 0x1d) {
         /* Top five bits 0b11101 / 0b11110 / 0b11111 : this is the
@@ -11307,7 +11307,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
     dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
-    dc->bswap_code = ARM_TBFLAG_BSWAP_CODE(tb->flags);
+    dc->sctlr_b = ARM_TBFLAG_SCTLR_B(tb->flags);
     dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
     dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
     dc->mmu_idx = ARM_TBFLAG_MMUIDX(tb->flags);
@@ -11487,7 +11487,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                 }
             }
         } else {
-            unsigned int insn = arm_ldl_code(env, dc->pc, dc->bswap_code);
+            unsigned int insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
             dc->pc += 4;
             disas_arm_insn(dc, insn);
         }
@@ -11644,7 +11644,7 @@ done_generating:
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-                         dc->thumb | (dc->bswap_code << 1));
+                         dc->thumb | (dc->sctlr_b << 1));
         qemu_log("\n");
     }
 #endif
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 53ef971..0bdc68c 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -16,7 +16,7 @@ typedef struct DisasContext {
     struct TranslationBlock *tb;
     int singlestep_enabled;
     int thumb;
-    int bswap_code;
+    int sctlr_b;
 #if !defined(CONFIG_USER_ONLY)
     int user;
 #endif
-- 
1.9.1

