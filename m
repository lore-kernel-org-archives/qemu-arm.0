Received: by 10.25.208.211 with SMTP id h202csp204339lfg;
        Thu, 31 Mar 2016 07:54:25 -0700 (PDT)
X-Received: by 10.140.20.104 with SMTP id 95mr16729820qgi.40.1459436064221;
        Thu, 31 Mar 2016 07:54:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si8035951qkb.84.2016.03.31.07.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 07:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aldzL-0002Le-Qf
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 10:54:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldzI-0002I8-LY
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldzE-00061B-GR
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:54:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldzE-00060U-94; Thu, 31 Mar 2016 10:54:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldul-0001lm-SY; Thu, 31 Mar 2016 15:49:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 15:49:35 +0100
Message-Id: <1459435778-5526-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>
Subject: [Qemu-arm] [PATCH 1/4] target-arm: Correctly reset SCTLR_EL3 for
	64-bit CPUs
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
X-TUID: 6P2Monlf2aIc

The regdef for SCTRL_EL3 was incorrectly marked as being an
ARM_CP_ALIAS, with the remark that this was because the 32-bit
definition would take care of reset and migration. However the
intention for banked registers as documented in the comment in
add_cpreg_to_hashtable() is:

 * 2) If ARMv8 is enabled then we can count on a 64-bit version
 *    taking care of the secure bank.  This requires that separate
 *    32 and 64-bit definitions are provided.

and so it marks the 32-bit secure banked version as an alias.
This results in the sctlr_s/sctlr_el[3] field never being reset
or migrated for a 64-bit CPU with EL3 enabled.

Fix this by removing the ARM_CP_ALIAS annotation from SCTLR_EL3.
Since this means it now needs a real reset value, move the regdef
into the same place that we define the 32-bit SCTLR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 19d5d52..e583e6a 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3744,11 +3744,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = vbar_write, .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
-    { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS, /* reset handled by AArch32 view */
-      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
-      .access = PL3_RW, .raw_writefn = raw_write, .writefn = sctlr_write,
-      .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]) },
     { .name = "TTBR0_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 0,
       .access = PL3_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
@@ -4641,12 +4636,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         define_arm_cp_regs(cpu, el3_cp_reginfo);
-        ARMCPRegInfo rvbar = {
-            .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
-            .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
-            .type = ARM_CP_CONST, .access = PL3_R, .resetvalue = cpu->rvbar
+        ARMCPRegInfo el3_regs[] = {
+            { .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
+              .type = ARM_CP_CONST, .access = PL3_R, .resetvalue = cpu->rvbar },
+            { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
+              .access = PL3_RW,
+              .raw_writefn = raw_write, .writefn = sctlr_write,
+              .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]),
+              .resetvalue = cpu->reset_sctlr },
+            REGINFO_SENTINEL
         };
-        define_one_arm_cp_reg(cpu, &rvbar);
+
+        define_arm_cp_regs(cpu, el3_regs);
     }
     /* The behaviour of NSACR is sufficiently various that we don't
      * try to describe it in a single reginfo:
-- 
1.9.1

