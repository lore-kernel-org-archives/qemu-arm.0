Received: by 10.25.159.131 with SMTP id i125csp2206000lfe;
        Tue, 6 Dec 2016 10:10:02 -0800 (PST)
X-Received: by 10.55.27.141 with SMTP id m13mr65665116qkh.28.1481047802206;
        Tue, 06 Dec 2016 10:10:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 2si12283765qkk.223.2016.12.06.10.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Dec 2016 10:10:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEKBl-0003W0-F6
	for alex.bennee@linaro.org; Tue, 06 Dec 2016 13:10:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cEK9S-0001bm-Db
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 13:07:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cEK9R-0006AR-CK
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 13:07:38 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cEK9R-0006AM-5R; Tue, 06 Dec 2016 13:07:37 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cEJor-0005tA-R7; Tue, 06 Dec 2016 17:46:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Dec 2016 17:46:18 +0000
Message-Id: <1481046379-32632-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
References: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/3] hw/intc/arm_gicv3: Remove incorrect usage of
 fieldoffset
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w0BxoCoQQNvn

In the ARMCPRegInfo definitions for the GICv3 CPU interface
registers, we were trying to use .fieldoffset to specify
the locations of data fields within the GICv3CPUState struct.
This is completely broken, because .fieldoffset is for offsets
into the CPUARMState struct. We didn't notice because we
were only using this for reads to BPR0, AP0R<n>, IGRPEN0
and CTLR_EL3, and Linux doesn't use these registers.

Replace the .fieldoffset uses with explicit read functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bca30c4..35e8eb3 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1118,35 +1118,35 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 3,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .fieldoffset = offsetof(GICv3CPUState, icc_bpr[GICV3_G0]),
+      .readfn = icc_bpr_read,
       .writefn = icc_bpr_write,
     },
     { .name = "ICC_AP0R0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 4,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][0]),
+      .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
     { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][1]),
+      .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
     { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][2]),
+      .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
     { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][3]),
+      .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
     /* All the ICC_AP1R*_EL1 registers are banked */
@@ -1275,7 +1275,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 6,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .fieldoffset = offsetof(GICv3CPUState, icc_igrpen[GICV3_G0]),
+      .readfn = icc_igrpen_read,
       .writefn = icc_igrpen_write,
     },
     /* This register is banked */
@@ -1299,7 +1299,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 12, .opc2 = 4,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL3_RW,
-      .fieldoffset = offsetof(GICv3CPUState, icc_ctlr_el3),
       .readfn = icc_ctlr_el3_read,
       .writefn = icc_ctlr_el3_write,
     },
-- 
2.7.4

