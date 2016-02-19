Received: by 10.25.208.211 with SMTP id h202csp1192618lfg;
        Fri, 19 Feb 2016 06:40:33 -0800 (PST)
X-Received: by 10.55.198.129 with SMTP id s1mr15885400qkl.18.1455892832269;
        Fri, 19 Feb 2016 06:40:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x130si14591331qka.101.2016.02.19.06.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 06:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWmER-0008W6-PL
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 09:40:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWmDo-0007dR-R0
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 09:39:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aWmDn-00037A-O9
	for qemu-devel@nongnu.org; Fri, 19 Feb 2016 09:39:52 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:38468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWmDn-00036i-Gn; Fri, 19 Feb 2016 09:39:51 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aWmDg-0002xJ-AJ; Fri, 19 Feb 2016 14:39:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 14:39:43 +0000
Message-Id: <1455892784-11328-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH v2 1/2] target-arm: Fix handling of SDCR for
	32-bit code
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
X-TUID: cUHWqzCve8Tj

Fix two issues with our implementation of the SDCR:
 * it is only present from ARMv8 onwards
 * it does not contain several of the trap bits present in its 64-bit
   counterpart the MDCR_EL3

Put the register description in the right place so that it does not
get enabled for ARMv7 and earlier, and give it a write function so that
we can mask out the bits which should not be allowed to have an effect
if EL3 is 32-bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h    |  4 ++++
 target-arm/helper.c | 23 +++++++++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index e72e33b..a729ae0 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -599,6 +599,7 @@ void pmccntr_sync(CPUARMState *env);
 #define MDCR_EDAD     (1U << 20)
 #define MDCR_SPME     (1U << 17)
 #define MDCR_SDD      (1U << 16)
+#define MDCR_SPD      (3U << 14)
 #define MDCR_TDRA     (1U << 11)
 #define MDCR_TDOSA    (1U << 10)
 #define MDCR_TDA      (1U << 9)
@@ -607,6 +608,9 @@ void pmccntr_sync(CPUARMState *env);
 #define MDCR_TPM      (1U << 6)
 #define MDCR_TPMCR    (1U << 5)
 
+/* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
+#define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
+
 #define CPSR_M (0x1fU)
 #define CPSR_T (1U << 5)
 #define CPSR_F (1U << 6)
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 3d7fda1..e9b89e6 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3037,6 +3037,12 @@ static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
+}
+
 static const ARMCPRegInfo v8_cp_reginfo[] = {
     /* Minimal set of EL0-visible registers. This will need to be expanded
      * significantly for system emulation of AArch64 CPUs.
@@ -3331,6 +3337,15 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 3,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
+    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
+      .resetvalue = 0,
+      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
+    { .name = "SDCR", .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
+      .writefn = sdcr_write,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
     REGINFO_SENTINEL
 };
 
@@ -3688,14 +3703,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
       .writefn = scr_write },
-    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
-      .resetvalue = 0,
-      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
-    { .name = "SDCR", .type = ARM_CP_ALIAS,
-      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
-      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
     { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
       .access = PL3_RW, .resetvalue = 0,
-- 
1.9.1

