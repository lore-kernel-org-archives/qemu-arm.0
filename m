Received: by 10.25.208.211 with SMTP id h202csp1097613lfg;
        Fri, 19 Feb 2016 03:27:01 -0800 (PST)
X-Received: by 10.140.253.2 with SMTP id y2mr15638237qhc.89.1455881221875;
        Fri, 19 Feb 2016 03:27:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c111si2921485qge.67.2016.02.19.03.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 03:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWjDB-00047j-Bz
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 06:27:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWjCo-0003j2-76
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 06:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWjCm-0003Qg-Sh
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 06:26:38 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:38458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWjCm-0003QN-Kl; Fri, 19 Feb 2016 06:26:36 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWjCk-0002pn-8C; Fri, 19 Feb 2016 11:26:34 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 11:26:34 +0000
Message-Id: <1455881194-10865-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, patches@linaro.org
Subject: [Qemu-devel] [PATCH] target-arm: Implement MDCR_EL3.TPM and
	MDCR_EL2.TPM traps
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
X-TUID: oZrh9t/9G0/1

Implement the performance monitor register traps controlled
by MDCR_EL3.TPM and MDCR_EL2.TPM. Most of the performance
registers already have an access function to deal with the
user-enable bit, and the TPM checks can be added there. We
also need a new access function which only implements the
TPM checks for use by the few not-EL0-accessible registers
and by PMUSERENR_EL0 (which is always EL0-readable).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think this is the last of the EL3 traps we need to implement...

Alistair, now we have these two access functions can you check
that any new perf registers that are added in the patches you've
got pending use the right accessfn? (I'll probably catch it in
code review if you forget, but basing on top of this patch will
hopefully avoid unnecessary merge conflicts.)

thanks
-- PMM

 target-arm/helper.c | 43 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 3d7fda1..e7dbc02 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -439,6 +439,24 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps to performance monitor registers, which are controlled
+ * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
+ */
+static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
+        && !arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -774,11 +792,22 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     /* Performance monitor registers user accessibility is controlled
-     * by PMUSERENR.
+     * by PMUSERENR. MDCR_EL2.TPM and MDCR_EL3.TPM allow configurable
+     * trapping to EL2 or EL3 for other accesses.
      */
-    if (arm_current_el(env) == 0 && !env->cp15.c9_pmuserenr) {
+    int el = arm_current_el(env);
+
+    if (el == 0 && !env->cp15.c9_pmuserenr) {
         return CP_ACCESS_TRAP;
     }
+    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
+        && !arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+
     return CP_ACCESS_OK;
 }
 
@@ -1101,28 +1130,28 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
       .accessfn = pmreg_access },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
-      .access = PL0_R | PL1_RW,
+      .access = PL0_R | PL1_RW, .accessfn = access_tpm,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
       .resetvalue = 0,
       .writefn = pmuserenr_write, .raw_writefn = raw_write },
     { .name = "PMUSERENR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 0,
-      .access = PL0_R | PL1_RW, .type = ARM_CP_ALIAS,
+      .access = PL0_R | PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
       .resetvalue = 0,
       .writefn = pmuserenr_write, .raw_writefn = raw_write },
     { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
-      .access = PL1_RW,
+      .access = PL1_RW, .accessfn = access_tpm,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .resetvalue = 0,
       .writefn = pmintenset_write, .raw_writefn = raw_write },
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write, },
     { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write },
     { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
-- 
1.9.1

