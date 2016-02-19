Received: by 10.25.208.211 with SMTP id h202csp1176093lfg;
        Fri, 19 Feb 2016 06:08:26 -0800 (PST)
X-Received: by 10.37.17.202 with SMTP id 193mr6105228ybr.100.1455890906791;
        Fri, 19 Feb 2016 06:08:26 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z126si6602538ywf.69.2016.02.19.06.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 06:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWlj9-0002dX-Ev
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 09:08:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWlik-0002Ho-Sw
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 09:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWlij-0002Z4-9e
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 09:07:46 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:38466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWlii-0002Yz-TJ; Fri, 19 Feb 2016 09:07:45 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWlih-0002vF-0t; Fri, 19 Feb 2016 14:07:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 14:07:43 +0000
Message-Id: <1455890863-11203-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	qemu-stable@nongnu.org, patches@linaro.org
Subject: [Qemu-devel] [PATCH] target-arm: Make reserved ranges in ID_AA64*
	spaces RAZ, not UNDEF
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d+6fKk9QtdZ1

The v8 ARM ARM defines that unused spaces in the ID_AA64* system
register ranges are Reserved and must RAZ, rather than being UNDEF.
Implement this.

In particular, ARM v8.2 adds a new feature register ID_AA64MMFR2,
and newer versions of the Linux kernel will attempt to read this,
which causes them not to boot up on versions of QEMU missing this fix.

Since the encoding .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6
is actually defined in ARMv8 (as ID_MMFR4), we give it an entry in
the ARMCPU struct so CPUs can override it, though since none do
this too will just RAZ.

Cc: qemu-stable@nongnu.org
Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The patch which touches ID_AA64MMFR2 is currently in linux-next...

 target-arm/cpu-qom.h |   1 +
 target-arm/helper.c  | 128 ++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 122 insertions(+), 7 deletions(-)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 1cc4502..1061c08 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -155,6 +155,7 @@ typedef struct ARMCPU {
     uint32_t id_mmfr1;
     uint32_t id_mmfr2;
     uint32_t id_mmfr3;
+    uint32_t id_mmfr4;
     uint32_t id_isar0;
     uint32_t id_isar1;
     uint32_t id_isar2;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 5a0447b..4deea0f 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -4280,12 +4280,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_isar5 },
-            /* 6..7 are as yet unallocated and must RAZ */
-            { .name = "ID_ISAR6", .cp = 15, .crn = 0, .crm = 2,
-              .opc1 = 0, .opc2 = 6, .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = 0 },
-            { .name = "ID_ISAR7", .cp = 15, .crn = 0, .crm = 2,
-              .opc1 = 0, .opc2 = 7, .access = PL1_R, .type = ARM_CP_CONST,
+            { .name = "ID_MMFR4", .state = ARM_CP_STATE_BOTH,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = cpu->id_mmfr4 },
+            /* 7 is as yet unallocated and must RAZ */
+            { .name = "ID_ISAR7_RESERVED", .state = ARM_CP_STATE_BOTH,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 7,
+              .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = 0 },
             REGINFO_SENTINEL
         };
@@ -4339,7 +4341,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V8)) {
-        /* AArch64 ID registers, which all have impdef reset values */
+        /* AArch64 ID registers, which all have impdef reset values.
+         * Note that within the ID register ranges the unused slots
+         * must all RAZ, not UNDEF; future architecture versions may
+         * define new registers here.
+         */
         ARMCPRegInfo v8_idregs[] = {
             { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
@@ -4349,6 +4355,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_aa64pfr1},
+            { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64PFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 3,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64PFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -4362,6 +4392,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_aa64dfr1 },
+            { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64DFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 3,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "ID_AA64AFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -4370,6 +4408,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_aa64afr1 },
+            { .name = "ID_AA64AFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 6,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64AFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 7,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "ID_AA64ISAR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -4378,6 +4424,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_aa64isar1 },
+            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64ISAR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 5,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64ISAR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 6,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64ISAR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 7,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "ID_AA64MMFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -4386,6 +4456,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->id_aa64mmfr1 },
+            { .name = "ID_AA64MMFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64MMFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 3,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64MMFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 4,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64MMFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 5,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64MMFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 6,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "ID_AA64MMFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 7,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "MVFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -4398,6 +4492,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->mvfr2 },
+            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "MVFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 4,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
+            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "PMCEID0", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 6,
               .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
-- 
1.9.1

