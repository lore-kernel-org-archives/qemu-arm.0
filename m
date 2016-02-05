Received: by 10.25.159.19 with SMTP id i19csp37980lfe;
        Fri, 5 Feb 2016 08:53:04 -0800 (PST)
X-Received: by 10.55.79.86 with SMTP id d83mr17856314qkb.22.1454691184915;
        Fri, 05 Feb 2016 08:53:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u92si16618370qge.31.2016.02.05.08.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:53:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjd2-0002X3-FG
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:53:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcz-0002Sq-Qt
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 11:53:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcy-00077T-Oo
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 11:53:01 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjcw-00076J-Hn; Fri, 05 Feb 2016 11:52:58 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004EY-6G; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:45:01 +0000
Message-Id: <1454690704-16233-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 3/6] target-arm: Implement MDCR_EL3.TDOSA and
	MDCR_EL2.TDOSA traps
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
X-TUID: HnMiYGmYYDty

Implement the traps to EL2 and EL3 controlled by the bits
MDCR_EL2.TDOSA MDCR_EL3.TDOSA. These can configurably trap
accesses to the "powerdown debug" registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h    | 12 ++++++++++++
 target-arm/helper.c | 23 ++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 80391fa..d1d6886 100644
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
index 082701a..18e85fd 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -384,6 +384,24 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
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
@@ -3779,15 +3797,18 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
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

