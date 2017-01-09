Received: by 10.25.205.13 with SMTP id d13csp11566707lfg;
        Mon, 9 Jan 2017 08:14:46 -0800 (PST)
X-Received: by 10.55.106.130 with SMTP id f124mr25555751qkc.117.1483978486480;
        Mon, 09 Jan 2017 08:14:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si56653040qte.329.2017.01.09.08.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcap-0007vP-QT
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:14:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS6-0007se-80
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS5-0003lc-34
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:42 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcS4-0003hC-QG; Mon, 09 Jan 2017 11:05:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRs-0001jZ-1j; Mon, 09 Jan 2017 16:05:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:12 +0000
Message-Id: <1483977924-14522-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 06/18] hw/intc/gicv3: Add defines for ICH
 system register fields
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HsEwcfvnXohL

Add defines to gicv3_internal.h for fields in the ICH_*
system registers which form the GIC virtualization control
interface.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 79 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8f3567e..aeb801d 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -159,6 +159,85 @@
 #define ICC_CTLR_EL3_A3V (1U << 15)
 #define ICC_CTLR_EL3_NDS (1U << 17)
 
+#define ICH_VMCR_EL2_VENG0_SHIFT 0
+#define ICH_VMCR_EL2_VENG0 (1U << ICH_VMCR_EL2_VENG0_SHIFT)
+#define ICH_VMCR_EL2_VENG1_SHIFT 1
+#define ICH_VMCR_EL2_VENG1 (1U << ICH_VMCR_EL2_VENG1_SHIFT)
+#define ICH_VMCR_EL2_VACKCTL (1U << 2)
+#define ICH_VMCR_EL2_VFIQEN (1U << 3)
+#define ICH_VMCR_EL2_VCBPR_SHIFT 4
+#define ICH_VMCR_EL2_VCBPR (1U << ICH_VMCR_EL2_VCBPR_SHIFT)
+#define ICH_VMCR_EL2_VEOIM_SHIFT 9
+#define ICH_VMCR_EL2_VEOIM (1U << ICH_VMCR_EL2_VEOIM_SHIFT)
+#define ICH_VMCR_EL2_VBPR1_SHIFT 18
+#define ICH_VMCR_EL2_VBPR1_LENGTH 3
+#define ICH_VMCR_EL2_VBPR1_MASK (0x7U << ICH_VMCR_EL2_VBPR1_SHIFT)
+#define ICH_VMCR_EL2_VBPR0_SHIFT 21
+#define ICH_VMCR_EL2_VBPR0_LENGTH 3
+#define ICH_VMCR_EL2_VBPR0_MASK (0x7U << ICH_VMCR_EL2_VBPR0_SHIFT)
+#define ICH_VMCR_EL2_VPMR_SHIFT 24
+#define ICH_VMCR_EL2_VPMR_LENGTH 8
+#define ICH_VMCR_EL2_VPMR_MASK (0xffU << ICH_VMCR_EL2_VPMR_SHIFT)
+
+#define ICH_HCR_EL2_EN (1U << 0)
+#define ICH_HCR_EL2_UIE (1U << 1)
+#define ICH_HCR_EL2_LRENPIE (1U << 2)
+#define ICH_HCR_EL2_NPIE (1U << 3)
+#define ICH_HCR_EL2_VGRP0EIE (1U << 4)
+#define ICH_HCR_EL2_VGRP0DIE (1U << 5)
+#define ICH_HCR_EL2_VGRP1EIE (1U << 6)
+#define ICH_HCR_EL2_VGRP1DIE (1U << 7)
+#define ICH_HCR_EL2_TC (1U << 10)
+#define ICH_HCR_EL2_TALL0 (1U << 11)
+#define ICH_HCR_EL2_TALL1 (1U << 12)
+#define ICH_HCR_EL2_TSEI (1U << 13)
+#define ICH_HCR_EL2_TDIR (1U << 14)
+#define ICH_HCR_EL2_EOICOUNT_SHIFT 27
+#define ICH_HCR_EL2_EOICOUNT_LENGTH 5
+#define ICH_HCR_EL2_EOICOUNT_MASK (0x1fU << ICH_HCR_EL2_EOICOUNT_SHIFT)
+
+#define ICH_LR_EL2_VINTID_SHIFT 0
+#define ICH_LR_EL2_VINTID_LENGTH 32
+#define ICH_LR_EL2_VINTID_MASK (0xffffffffULL << ICH_LR_EL2_VINTID_SHIFT)
+#define ICH_LR_EL2_PINTID_SHIFT 32
+#define ICH_LR_EL2_PINTID_LENGTH 10
+#define ICH_LR_EL2_PINTID_MASK (0x3ffULL << ICH_LR_EL2_PINTID_SHIFT)
+/* Note that EOI shares with the top bit of the pINTID field */
+#define ICH_LR_EL2_EOI (1ULL << 41)
+#define ICH_LR_EL2_PRIORITY_SHIFT 48
+#define ICH_LR_EL2_PRIORITY_LENGTH 8
+#define ICH_LR_EL2_PRIORITY_MASK (0xffULL << ICH_LR_EL2_PRIORITY_SHIFT)
+#define ICH_LR_EL2_GROUP (1ULL << 60)
+#define ICH_LR_EL2_HW (1ULL << 61)
+#define ICH_LR_EL2_STATE_SHIFT 62
+#define ICH_LR_EL2_STATE_LENGTH 2
+#define ICH_LR_EL2_STATE_MASK (3ULL << ICH_LR_EL2_STATE_SHIFT)
+/* values for the state field: */
+#define ICH_LR_EL2_STATE_INVALID 0
+#define ICH_LR_EL2_STATE_PENDING 1
+#define ICH_LR_EL2_STATE_ACTIVE 2
+#define ICH_LR_EL2_STATE_ACTIVE_PENDING 3
+#define ICH_LR_EL2_STATE_PENDING_BIT (1ULL << ICH_LR_EL2_STATE_SHIFT)
+#define ICH_LR_EL2_STATE_ACTIVE_BIT (2ULL << ICH_LR_EL2_STATE_SHIFT)
+
+#define ICH_MISR_EL2_EOI (1U << 0)
+#define ICH_MISR_EL2_U (1U << 1)
+#define ICH_MISR_EL2_LRENP (1U << 2)
+#define ICH_MISR_EL2_NP (1U << 3)
+#define ICH_MISR_EL2_VGRP0E (1U << 4)
+#define ICH_MISR_EL2_VGRP0D (1U << 5)
+#define ICH_MISR_EL2_VGRP1E (1U << 6)
+#define ICH_MISR_EL2_VGRP1D (1U << 7)
+
+#define ICH_VTR_EL2_LISTREGS_SHIFT 0
+#define ICH_VTR_EL2_TDS (1U << 19)
+#define ICH_VTR_EL2_NV4 (1U << 20)
+#define ICH_VTR_EL2_A3V (1U << 21)
+#define ICH_VTR_EL2_SEIS (1U << 22)
+#define ICH_VTR_EL2_IDBITS_SHIFT 23
+#define ICH_VTR_EL2_PREBITS_SHIFT 26
+#define ICH_VTR_EL2_PRIBITS_SHIFT 29
+
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
 #define INTID_NONSECURE 1021
-- 
2.7.4

