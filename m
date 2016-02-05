Received: by 10.25.159.19 with SMTP id i19csp38189lfe;
        Fri, 5 Feb 2016 08:53:29 -0800 (PST)
X-Received: by 10.140.101.201 with SMTP id u67mr17901408qge.33.1454691209808;
        Fri, 05 Feb 2016 08:53:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si16600572qgt.89.2016.02.05.08.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjdR-00032q-E4
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:53:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcx-0002SB-FK
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcw-00076N-E3
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:52:59 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjcw-00076J-6r; Fri, 05 Feb 2016 11:52:58 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004Ec-8J; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:45:02 +0000
Message-Id: <1454690704-16233-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 4/6] target-arm: Implement MDCR_EL2.TDRA traps
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
X-TUID: ESvaHlZiPVpW

Implement trapping of the "debug ROM" registers, which are controlled
by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 18e85fd..8c2adbc 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -402,6 +402,24 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps to "debug ROM" registers, which are controlled
+ * by MDCR_EL2.TDRA for EL2 but by the more general MDCR_EL3.TDA for EL3.
+ */
+static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDRA)
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
@@ -3774,12 +3792,15 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      * accessor.
      */
     { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL0_R, .accessfn = access_tdra,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
-      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_R, .accessfn = access_tdra,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL0_R, .accessfn = access_tdra,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
     { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
-- 
1.9.1

