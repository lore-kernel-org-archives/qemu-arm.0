Received: by 10.25.159.19 with SMTP id i19csp34853lfe;
        Fri, 5 Feb 2016 08:46:10 -0800 (PST)
X-Received: by 10.140.108.181 with SMTP id j50mr16345856qgf.104.1454690770230;
        Fri, 05 Feb 2016 08:46:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si16587875qkb.7.2016.02.05.08.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:46:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjWL-0000Eo-N0
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:46:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjVQ-0007er-RY
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:45:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjVK-0004zT-UT
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:45:12 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVK-0004xh-KT; Fri, 05 Feb 2016 11:45:06 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004Eg-AJ; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:45:03 +0000
Message-Id: <1454690704-16233-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 5/6] target-arm: Implement MDCR_EL2.TDA and
	MDCR_EL2.TDA traps
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
X-TUID: ld7xH0ZLS+W8

Implement the debug register traps controlled by MDCR_EL2.TDA
and MDCR_EL3.TDA.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8c2adbc..064b415 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -420,6 +420,24 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps to general debug registers, which are controlled
+ * by MDCR_EL2.TDA for EL2 and MDCR_EL3.TDA for EL3.
+ */
+static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDA)
+        && !arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -3385,7 +3403,8 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL2_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns_aa64any,
@@ -3804,7 +3823,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
     { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
-      .access = PL1_RW,
+      .access = PL1_RW, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
       .resetvalue = 0 },
     /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
@@ -3813,7 +3832,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
       .type = ARM_CP_ALIAS,
-      .access = PL1_R,
+      .access = PL1_R, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
     { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
@@ -3835,7 +3854,8 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "DBGVCR",
       .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_NOP },
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_NOP },
     REGINFO_SENTINEL
 };
 
@@ -4100,7 +4120,8 @@ static void define_debug_regs(ARMCPU *cpu)
     int wrps, brps, ctx_cmps;
     ARMCPRegInfo dbgdidr = {
         .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
-        .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = cpu->dbgdidr,
+        .access = PL0_R, .accessfn = access_tda,
+        .type = ARM_CP_CONST, .resetvalue = cpu->dbgdidr,
     };
 
     /* Note that all these register fields hold "number of Xs minus 1". */
@@ -4131,13 +4152,13 @@ static void define_debug_regs(ARMCPU *cpu)
         ARMCPRegInfo dbgregs[] = {
             { .name = "DBGBVR", .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
-              .access = PL1_RW,
+              .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
               .writefn = dbgbvr_write, .raw_writefn = raw_write
             },
             { .name = "DBGBCR", .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
-              .access = PL1_RW,
+              .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
               .writefn = dbgbcr_write, .raw_writefn = raw_write
             },
@@ -4150,13 +4171,13 @@ static void define_debug_regs(ARMCPU *cpu)
         ARMCPRegInfo dbgregs[] = {
             { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
-              .access = PL1_RW,
+              .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
               .writefn = dbgwvr_write, .raw_writefn = raw_write
             },
             { .name = "DBGWCR", .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
-              .access = PL1_RW,
+              .access = PL1_RW, .accessfn = access_tda,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
               .writefn = dbgwcr_write, .raw_writefn = raw_write
             },
-- 
1.9.1

