Received: by 10.25.159.19 with SMTP id i19csp1227428lfe;
        Wed, 3 Feb 2016 05:39:25 -0800 (PST)
X-Received: by 10.140.106.181 with SMTP id e50mr1594353qgf.30.1454506765187;
        Wed, 03 Feb 2016 05:39:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o206si5545562qho.27.2016.02.03.05.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxeW-0004dR-Mm
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:39:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxdt-0003p3-VX
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:38:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxds-0003SU-U4
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:38:45 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxds-0003SC-N0; Wed, 03 Feb 2016 08:38:44 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035g-3u; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:36 +0000
Message-Id: <1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 2/7] target-arm: Implement MDCR_EL3 and SDCR
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
X-TUID: 9fCUQIq+yv2H

Implement the MDCR_EL3 register (which is SDCR for AArch32).
For the moment we implement it as reads-as-written.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h    |  1 +
 target-arm/helper.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 52284e9..cf2df50 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -382,6 +382,7 @@ typedef struct CPUARMState {
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t mdcr_el2;
+        uint64_t mdcr_el3;
         /* If the counter is enabled, this stores the last time the counter
          * was reset. Otherwise it stores the counter value
          */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index b631b83..8b96b80 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -364,6 +364,23 @@ static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+/* Some secure-only AArch32 registers trap to EL3 if used from
+ * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
+ * We assume that the .access field is set to PL1_RW.
+ */
+static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
+                                            const ARMCPRegInfo *ri)
+{
+    if (arm_current_el(env) == 3) {
+        return CP_ACCESS_OK;
+    }
+    if (arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    /* This will be EL1 NS and EL2 NS, which just UNDEF */
+    return CP_ACCESS_TRAP_UNCATEGORIZED;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -3532,6 +3549,13 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
       .writefn = scr_write },
+    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
+      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
+    { .name = "SDCR", .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
     { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
       .access = PL3_RW, .resetvalue = 0,
-- 
1.9.1

