Received: by 10.25.159.19 with SMTP id i19csp313517lfe;
        Thu, 11 Feb 2016 08:24:06 -0800 (PST)
X-Received: by 10.55.78.207 with SMTP id c198mr56441145qkb.34.1455207842992;
        Thu, 11 Feb 2016 08:24:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z93si10225490qgd.106.2016.02.11.08.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 08:24:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTu2E-0000e2-DO
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 11:24:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTu1H-0007lM-Dj
	for qemu-devel@nongnu.org; Thu, 11 Feb 2016 11:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTu1C-0005GW-Ir
	for qemu-devel@nongnu.org; Thu, 11 Feb 2016 11:23:03 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:41147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTu1C-0005GI-Bu; Thu, 11 Feb 2016 11:22:58 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTtiL-0007IU-Kb; Thu, 11 Feb 2016 16:03:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 16:03:26 +0000
Message-Id: <1455206609-28009-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
References: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.146
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH v2 3/6] target-arm: Implement MDCR_EL3.TDOSA
	and MDCR_EL2.TDOSA traps
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
X-TUID: eCzxsIqhGPbM

Implement the traps to EL2 and EL3 controlled by the bits
MDCR_EL2.TDOSA MDCR_EL3.TDOSA. These can configurably trap
accesses to the "powerdown debug" registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-arm/cpu.h    | 12 ++++++++++++
 target-arm/helper.c | 23 ++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index afbf366..77f9b51 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -595,6 +595,18 @@ void pmccntr_sync(CPUARMState *env);
 #define CPTR_TTA      (1U << 20)
 #define CPTR_TFP      (1U << 10)
 
+#define MDCR_EPMAD    (1U << 21)
+#define MDCR_EDAD     (1U << 20)
+#define MDCR_SPME     (1U << 17)
+#define MDCR_SDD      (1U << 16)
+#define MDCR_TDRA     (1U << 11)
+#define MDCR_TDOSA    (1U << 10)
+#define MDCR_TDA      (1U << 9)
+#define MDCR_TDE      (1U << 8)
+#define MDCR_HPME     (1U << 7)
+#define MDCR_TPM      (1U << 6)
+#define MDCR_TPMCR    (1U << 5)
+
 #define CPSR_M (0x1fU)
 #define CPSR_T (1U << 5)
 #define CPSR_F (1U << 6)
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4d27c00..b45d596 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -385,6 +385,24 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
+/* Check for traps to "powerdown debug" registers, which are controlled
+ * by MDCR.TDOSA
+ */
+static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDOSA)
+        && !arm_is_secure_below_el3(env)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -3778,15 +3796,18 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
       .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .accessfn = access_tdosa,
       .writefn = oslar_write },
     { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL1_R, .resetvalue = 10,
+      .accessfn = access_tdosa,
       .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
     /* Dummy OSDLR_EL1: 32-bit Linux will read this */
     { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
-      .access = PL1_RW, .type = ARM_CP_NOP },
+      .access = PL1_RW, .accessfn = access_tdosa,
+      .type = ARM_CP_NOP },
     /* Dummy DBGVCR: Linux wants to clear this on startup, but we don't
      * implement vector catch debug events yet.
      */
-- 
1.9.1

