Received: by 10.25.159.19 with SMTP id i19csp1234006lfe;
        Wed, 3 Feb 2016 05:53:05 -0800 (PST)
X-Received: by 10.140.226.8 with SMTP id w8mr1736611qhb.83.1454507585002;
        Wed, 03 Feb 2016 05:53:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 145si5590827qhq.28.2016.02.03.05.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:53:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxrk-0000Cy-HW
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:53:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxri-00008d-Ag
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrg-0006gz-Jp
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:02 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxrd-0006eA-W4; Wed, 03 Feb 2016 08:52:58 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035w-Bp; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:40 +0000
Message-Id: <1454506721-11843-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 6/7] target-arm: Implement NSACR trapping
	behaviour
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
X-TUID: zZdxSBvvjWGJ

Implement some corner cases of the behaviour of the NSACR
register on ARMv8:
 * if EL3 is AArch64 then accessing the NSACR from Secure EL1
   with AArch32 should trap to EL3
 * if EL3 is not present or is AArch64 then reads from NS EL1 and
   NS EL2 return constant 0xc00

It would in theory be possible to implement all these with
a single reginfo definition, but for clarity we use three
separate definitions for the three cases and install the
right one based on the CPU feature flags.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8bc3ea3..34dc144 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3562,6 +3562,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
+     * At Secure EL1 it traps to EL3.
+     */
+    if (arm_current_el(env) == 3) {
+        return CP_ACCESS_OK;
+    }
+    if (arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow reads. */
+    if (isread) {
+        return CP_ACCESS_OK;
+    }
+    return CP_ACCESS_TRAP_UNCATEGORIZED;
+}
+
 static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
@@ -3587,10 +3606,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 1,
       .access = PL3_RW, .resetvalue = 0,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.sder) },
-      /* TODO: Implement NSACR trapping of secure EL1 accesses to EL3 */
-    { .name = "NSACR", .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
-      .access = PL3_W | PL1_R, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
     { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = vbar_write, .resetvalue = 0,
@@ -4361,6 +4376,45 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_one_arm_cp_reg(cpu, &rvbar);
     }
+    /* The behaviour of NSACR is sufficiently various that we don't
+     * try to describe it in a single reginfo:
+     *  if EL3 is 64 bit, then trap to EL3 from S EL1,
+     *     reads as constant 0xc00 from NS EL1 and NS EL2
+     *  if EL3 is 32 bit, then RW at EL3, RO at NS EL1 and NS EL2
+     *  if v7 without EL3, register doesn't exist
+     *  if v8 without EL3, reads as constant 0xc00 from NS EL1 and NS EL2
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+            ARMCPRegInfo nsacr = {
+                .name = "NSACR", .type = ARM_CP_CONST,
+                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
+                .access = PL1_RW, .accessfn = nsacr_access,
+                .resetvalue = 0xc00
+            };
+            define_one_arm_cp_reg(cpu, &nsacr);
+        } else {
+            ARMCPRegInfo nsacr = {
+                .name = "NSACR",
+                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
+                .access = PL3_RW | PL1_R,
+                .resetvalue = 0,
+                .fieldoffset = offsetof(CPUARMState, cp15.nsacr)
+            };
+            define_one_arm_cp_reg(cpu, &nsacr);
+        }
+    } else {
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            ARMCPRegInfo nsacr = {
+                .name = "NSACR", .type = ARM_CP_CONST,
+                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
+                .access = PL1_R,
+                .resetvalue = 0xc00
+            };
+            define_one_arm_cp_reg(cpu, &nsacr);
+        }
+    }
+
     if (arm_feature(env, ARM_FEATURE_MPU)) {
         if (arm_feature(env, ARM_FEATURE_V6)) {
             /* PMSAv6 not implemented */
-- 
1.9.1

