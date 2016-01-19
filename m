Received: by 10.25.159.19 with SMTP id i19csp2652677lfe;
        Tue, 19 Jan 2016 10:23:37 -0800 (PST)
X-Received: by 10.140.242.216 with SMTP id n207mr42223396qhc.37.1453227817356;
        Tue, 19 Jan 2016 10:23:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u142si38694288qka.40.2016.01.19.10.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 10:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLawK-0007nP-Pp
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 13:23:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aLawH-0007jT-VT
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:23:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aLawG-0004bz-Oz
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 13:23:33 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aLawE-0004YP-9d; Tue, 19 Jan 2016 13:23:30 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aLaw6-0002bc-PK; Tue, 19 Jan 2016 18:23:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 19 Jan 2016 18:23:22 +0000
Message-Id: <1453227802-9991-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH] target-arm: Make various system registers
	visible to EL3
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
X-TUID: qRG6xArcvJb5

The AArch64 system registers DACR32_EL2, IFSR32_EL2, SPSR_IRQ,
SPSR_ABT, SPSR_UND and SPSR_FIQ are visible and fully functional from
EL3 even if the CPU has no EL2 (unlike some others which are RES0
from EL3 in that configuration).  Move them from el2_cp_reginfo[] to
v8_cp_reginfo[] so they are always present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 58 ++++++++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e8ede3f..999c617 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3166,6 +3166,35 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
       .access = PL2_RW, .accessfn = fpexc32_access },
+    { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
+      .access = PL2_RW, .resetvalue = 0,
+      .writefn = dacr_write, .raw_writefn = raw_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.dacr32_el2) },
+    { .name = "IFSR32_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 0, .opc2 = 1,
+      .access = PL2_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.ifsr32_el2) },
+    { .name = "SPSR_IRQ", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_ALIAS,
+      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 0,
+      .access = PL2_RW,
+      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_IRQ]) },
+    { .name = "SPSR_ABT", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_ALIAS,
+      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 1,
+      .access = PL2_RW,
+      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_ABT]) },
+    { .name = "SPSR_UND", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_ALIAS,
+      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 2,
+      .access = PL2_RW,
+      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_UND]) },
+    { .name = "SPSR_FIQ", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_ALIAS,
+      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 3,
+      .access = PL2_RW,
+      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
     REGINFO_SENTINEL
 };
 
@@ -3293,11 +3322,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_write },
-    { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0,
-      .writefn = dacr_write, .raw_writefn = raw_write,
-      .fieldoffset = offsetof(CPUARMState, cp15.dacr32_el2) },
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
@@ -3307,10 +3331,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
-    { .name = "IFSR32_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 0, .opc2 = 1,
-      .access = PL2_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.ifsr32_el2) },
     { .name = "FAR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.far_el[2]) },
@@ -3319,26 +3339,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_HYP]) },
-    { .name = "SPSR_IRQ", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
-      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 0,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_IRQ]) },
-    { .name = "SPSR_ABT", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
-      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 1,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_ABT]) },
-    { .name = "SPSR_UND", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
-      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 2,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_UND]) },
-    { .name = "SPSR_FIQ", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
-      .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 3,
-      .access = PL2_RW,
-      .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
     { .name = "VBAR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
       .access = PL2_RW, .writefn = vbar_write,
-- 
1.9.1

