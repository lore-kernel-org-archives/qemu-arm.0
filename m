Received: by 10.25.208.137 with SMTP id h131csp1996355lfg;
        Tue, 10 May 2016 03:12:14 -0700 (PDT)
X-Received: by 10.140.147.135 with SMTP id 129mr41171072qht.54.1462875133930;
        Tue, 10 May 2016 03:12:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si854666qkb.248.2016.05.10.03.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 03:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b04eD-00088q-CS
	for alex.bennee@linaro.org; Tue, 10 May 2016 06:12:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b04dN-0006NL-GT
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b04dH-0002Ve-WB
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:11:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b04dH-0002VS-P9; Tue, 10 May 2016 06:11:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b04dG-0002xw-4o; Tue, 10 May 2016 11:11:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 May 2016 11:11:13 +0100
Message-Id: <1462875073-7127-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2] target-arm: Avoid unnecessary TLB flush on
 TCR_EL2, TCR_EL3 writes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q80Kjt+wHj4/

The TCR_EL2 and TCR_EL3 regdefs wer incorrectly using the
vmsa_tcr_el1_write function for writes. Since these registers don't
have the A1 bit that TCR_EL1 does, we don't need to do a tlb_flush()
when they are written. Remove the unnecessary .writefn and also the
harmless but unneeded .raw_writefn and .resetfn definitions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2 changes: extend to TCR_EL3 as suggested by Sergey.

 target-arm/helper.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..cbb9d92 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3559,8 +3559,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0 },
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .writefn = vmsa_tcr_el1_write,
-      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
+      .access = PL2_RW,
+      /* no .writefn needed as this can't cause an ASID change;
+       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
+       */
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
@@ -3753,8 +3755,10 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[3]) },
     { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL3_RW, .writefn = vmsa_tcr_el1_write,
-      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
+      .access = PL3_RW,
+      /* no .writefn needed as this can't cause an ASID change;
+       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
+       */
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
     { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
-- 
1.9.1

