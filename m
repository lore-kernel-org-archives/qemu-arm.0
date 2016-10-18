Received: by 10.80.166.35 with SMTP id d32csp959734edc;
        Tue, 18 Oct 2016 05:23:32 -0700 (PDT)
X-Received: by 10.200.37.11 with SMTP id 11mr200492qtm.12.1476793412451;
        Tue, 18 Oct 2016 05:23:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a42si20806844qtb.82.2016.10.18.05.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 05:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwTQZ-0000Ig-O9
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 08:23:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bwTJb-00033R-1R
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 08:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bwTJZ-0007Il-Ld
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 08:16:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1bwTJZ-0007Hj-DJ; Tue, 18 Oct 2016 08:16:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bwTJW-0005ga-GB; Tue, 18 Oct 2016 13:16:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 18 Oct 2016 13:16:13 +0100
Message-Id: <1476792973-18508-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target-arm: Implement new HLT trap for
 semihosting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ef4fc/VZtvvy

Version 2.0 of the semihosting specification introduces new trap
instructions for AArch32: HLT 0xF000 for A32 and HLT 0x3C for T32.
Implement these (in the same way we implement the existing HLT
semihosting trap for A64).

The old traps via SVC and BKPT are unaffected.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The public doc for the new spec is not quite done yet, but I
wanted to get support for the new trap insns into QEMU 2.8
(they're the only thing where a semihosting user can't probe
to see whether the new-in-2.0 feature they want is present).

I've added support for testing these trap instructions to
the not-very-comprehensive semihosting tests at
https://git.linaro.org/people/peter.maydell/semihosting-tests.git

 linux-user/main.c      |  3 +++
 target-arm/cpu.h       |  2 +-
 target-arm/helper.c    | 11 ++++++++--
 target-arm/translate.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++----
 4 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 0e31dad..b8f7729 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -806,6 +806,9 @@ void cpu_loop(CPUARMState *env)
                 }
             }
             break;
+        case EXCP_SEMIHOST:
+            env->regs[0] = do_arm_semihosting(env);
+            break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 2218c00..ea0d17e 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -52,7 +52,7 @@
 #define EXCP_SMC            13   /* Secure Monitor Call */
 #define EXCP_VIRQ           14
 #define EXCP_VFIQ           15
-#define EXCP_SEMIHOST       16   /* semihosting call (A64 only) */
+#define EXCP_SEMIHOST       16   /* semihosting call */
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
diff --git a/target-arm/helper.c b/target-arm/helper.c
index cb83ee2..25b15dc 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6573,12 +6573,19 @@ static inline bool check_for_semihosting(CPUState *cs)
         /* Only intercept calls from privileged modes, to provide some
          * semblance of security.
          */
-        if (!semihosting_enabled() ||
-            ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR)) {
+        if (cs->exception_index != EXCP_SEMIHOST &&
+            (!semihosting_enabled() ||
+             ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR))) {
             return false;
         }
 
         switch (cs->exception_index) {
+        case EXCP_SEMIHOST:
+            /* This is always a semihosting call; the "is this usermode"
+             * and "is semihosting enabled" checks have been done at
+             * translate time.
+             */
+            break;
         case EXCP_SWI:
             /* Check for semihosting interrupt.  */
             if (env->thumb) {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 164b52a..ef62f8b 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -28,6 +28,7 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
+#include "exec/semihost.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -1144,6 +1145,33 @@ static inline void gen_lookup_tb(DisasContext *s)
     s->is_jmp = DISAS_JUMP;
 }
 
+static inline void gen_hlt(DisasContext *s, int imm)
+{
+    /* HLT. This has two purposes.
+     * Architecturally, it is an external halting debug instruction.
+     * Since QEMU doesn't implement external debug, we treat this as
+     * it is required for halting debug disabled: it will UNDEF.
+     * Secondly, "HLT 0x3C" is a T32 semihosting trap instruction,
+     * and "HLT 0xF000" is an A32 semihosting syscall. These traps
+     * must trigger semihosting even for ARMv7 and earlier, where
+     * HLT was an undefined encoding.
+     * In system mode, we don't allow userspace access to
+     * semihosting, to provide some semblance of security
+     * (and for consistency with our 32-bit semihosting).
+     */
+    if (semihosting_enabled() &&
+#ifndef CONFIG_USER_ONLY
+        s->current_el != 0 &&
+#endif
+        (imm == (s->thumb ? 0x3c : 0xf000))) {
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+        return;
+    }
+
+    gen_exception_insn(s, s->thumb ? 2 : 4, EXCP_UDEF, syn_uncategorized(),
+                       default_exception_el(s));
+}
+
 static inline void gen_add_data_offset(DisasContext *s, unsigned int insn,
                                        TCGv_i32 var)
 {
@@ -8395,6 +8423,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         {
             int imm16 = extract32(insn, 0, 4) | (extract32(insn, 8, 12) << 4);
             switch (op1) {
+            case 0:
+                /* HLT */
+                gen_hlt(s, imm16);
+                break;
             case 1:
                 /* bkpt */
                 ARCH(5);
@@ -8419,7 +8451,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 gen_smc(s);
                 break;
             default:
-                goto illegal_op;
+                g_assert_not_reached();
             }
             break;
         }
@@ -11451,19 +11483,33 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             break;
         }
 
-        case 0xa: /* rev */
+        case 0xa: /* rev, and hlt */
+        {
+            int op1 = extract32(insn, 6, 2);
+
+            if (op1 == 2) {
+                /* HLT */
+                int imm6 = extract32(insn, 0, 6);
+
+                gen_hlt(s, imm6);
+                break;
+            }
+
+            /* Otherwise this is rev */
             ARCH(6);
             rn = (insn >> 3) & 0x7;
             rd = insn & 0x7;
             tmp = load_reg(s, rn);
-            switch ((insn >> 6) & 3) {
+            switch (op1) {
             case 0: tcg_gen_bswap32_i32(tmp, tmp); break;
             case 1: gen_rev16(tmp); break;
             case 3: gen_revsh(tmp); break;
-            default: goto illegal_op;
+            default:
+                g_assert_not_reached();
             }
             store_reg(s, rd, tmp);
             break;
+        }
 
         case 6:
             switch ((insn >> 5) & 7) {
-- 
2.7.4

