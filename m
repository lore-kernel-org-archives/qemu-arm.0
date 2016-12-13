Received: by 10.25.205.13 with SMTP id d13csp2117262lfg;
        Tue, 13 Dec 2016 02:38:03 -0800 (PST)
X-Received: by 10.200.38.50 with SMTP id u47mr95129940qtu.288.1481625483162;
        Tue, 13 Dec 2016 02:38:03 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a17si27890825qte.223.2016.12.13.02.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkTA-00050G-Ev
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:38:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkRv-0004oS-M2
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 05:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkRu-0008Df-KA
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 05:36:43 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkRr-0008AM-Lz; Tue, 13 Dec 2016 05:36:39 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRl-0002KV-JY; Tue, 13 Dec 2016 10:36:33 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:14 +0000
Message-Id: <1481625384-15077-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 13/23] hw/intc/gicv3: Add defines for ICH
 system register fields
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7iioayjuNFu0

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

