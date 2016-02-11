Received: by 10.25.159.19 with SMTP id i19csp403019lfe;
        Thu, 11 Feb 2016 11:24:21 -0800 (PST)
X-Received: by 10.140.167.86 with SMTP id n83mr60187563qhn.41.1455218658277;
        Thu, 11 Feb 2016 11:24:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m69si11090548qge.48.2016.02.11.11.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 11:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTwqf-0003TZ-OA
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 14:24:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpU-0001S9-6h
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpT-0006XQ-4b
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:04 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTwpQ-0006W4-Q7; Thu, 11 Feb 2016 14:23:00 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTweb-0007NK-IA; Thu, 11 Feb 2016 19:11:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 19:11:46 +0000
Message-Id: <1455217909-28317-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 1/4] target-arm: Clean up trap/undef handling of
	SRS
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
X-TUID: M/3ODoS2vHFE

The SRS instruction is:
 * UNDEFINED in Hyp mode
 * UNPREDICTABLE in User or System mode
 * UNPREDICTABLE if the specified mode isn't accessible
 * trapped to EL3 if EL3 is AArch64 and we are at Secure EL1

Clean up the code to handle all these cases cleanly, including
picking UNDEF as our choice of UNPREDICTABLE behaviour rather
blindly trusting the mode field passed in the instruction.
As part of this, move the check for IS_USER into gen_srs()
itself rather than having it done by the caller.

The exception is that we don't UNDEF for calls from System
mode, which need a runtime check. This will be dealt with in
the following commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/translate.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index cf3dc33..7bceb05 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7578,8 +7578,67 @@ static void gen_srs(DisasContext *s,
                     uint32_t mode, uint32_t amode, bool writeback)
 {
     int32_t offset;
-    TCGv_i32 addr = tcg_temp_new_i32();
-    TCGv_i32 tmp = tcg_const_i32(mode);
+    TCGv_i32 addr, tmp;
+    bool undef = false;
+
+    /* SRS is:
+     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
+     * - UNDEFINED in Hyp mode
+     * - UNPREDICTABLE in User or System mode
+     * - UNPREDICTABLE if the specified mode is:
+     * -- not implemented
+     * -- not a valid mode number
+     * -- a mode that's at a higher exception level
+     * -- Monitor, if we are Non-secure
+     * For the UNPREDICTABLE cases we choose to UNDEF, except that for
+     * "current mode is System" we will write a garbage SPSR.
+     * (This is because we don't have access to our current mode here
+     * and would have to do a runtime check to UNDEF for System.)
+     */
+    if (s->current_el == 1 && !s->ns) {
+        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
+        return;
+    }
+
+    if (s->current_el == 0 || s->current_el == 2) {
+        undef = true;
+    }
+
+    switch (mode) {
+    case ARM_CPU_MODE_USR:
+    case ARM_CPU_MODE_FIQ:
+    case ARM_CPU_MODE_IRQ:
+    case ARM_CPU_MODE_SVC:
+    case ARM_CPU_MODE_ABT:
+    case ARM_CPU_MODE_UND:
+    case ARM_CPU_MODE_SYS:
+        break;
+    case ARM_CPU_MODE_HYP:
+        if (s->current_el == 1 || !arm_dc_feature(s, ARM_FEATURE_EL2)) {
+            undef = true;
+        }
+        break;
+    case ARM_CPU_MODE_MON:
+        /* No need to check specifically for "are we non-secure" because
+         * we've already made EL0 UNDEF and handled the trap for S-EL1;
+         * so if this isn't EL3 then we must be non-secure.
+         */
+        if (s->current_el != 3) {
+            undef = true;
+        }
+        break;
+    default:
+        undef = true;
+    }
+
+    if (undef) {
+        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+                           default_exception_el(s));
+        return;
+    }
+
+    addr = tcg_temp_new_i32();
+    tmp = tcg_const_i32(mode);
     gen_helper_get_r13_banked(addr, cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     switch (amode) {
@@ -7739,9 +7798,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
         } else if ((insn & 0x0e5fffe0) == 0x084d0500) {
             /* srs */
-            if (IS_USER(s)) {
-                goto illegal_op;
-            }
             ARCH(6);
             gen_srs(s, (insn & 0x1f), (insn >> 23) & 3, insn & (1 << 21));
             return;
-- 
1.9.1

