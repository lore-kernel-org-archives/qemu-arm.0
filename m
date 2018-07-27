Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507434wru;
        Fri, 27 Jul 2018 02:55:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcvhKjQ66WcUGRl0UiaelHM0c6oBAlNi5yhc8x5fkzh/m9Xcg62fn8a/dHTRO1PtZoWNyKK
X-Received: by 2002:a0c:9915:: with SMTP id h21-v6mr5022576qvd.122.1532685351828;
        Fri, 27 Jul 2018 02:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685351; cv=none;
        d=google.com; s=arc-20160816;
        b=JS3MBrX/hzAa+oUwxkDV80YomQcwFpZAF7C6pKz49l1X2JU3WrKorbYjeaW9GaKjNV
         X/SBbHrr6TqcEqJKV5fRT+NA0hlJvytzJweHW5ZnhxWNn+PBShpgM/JnpBlStOJ+QxZ1
         y9S7I6kHdtFAvAgyyecEvT4n4QqoHXRLFyIRZeWSr5+Z5O5epBFk1TNCpGjWP1aX3Snq
         9qrQ/JUGN6i/LHFaZv4iIXWw5EIxuv7MqcqUgLFHe9Fk+8D1HkoIBgfI2s2qw8S9SK7D
         wYs11yhs0mMLA8+PZC0s+XJ47wKdyRCIMGgr1rtp9pQ+TZccuNBLEeGUXfVnMELvwlUo
         r0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=nNrxfoed9V5fFXe97ynqqw2326dBSkO2U/NiqTTPr9I=;
        b=cctqVT87ZCqiiiM/McsBxZgSoGEZNwFhbQre9ftZ5hE1TlV6CjUiktVQnkvzanLcUQ
         vjGddaAIwMKW23sadwdHqFgXcxL+Wvzkf/8I+GFtD30ueXIK1C4J2ewzkUhjJ83orw1g
         tqhrJubyEMaEb5Fbg773RYmTLn8SyTwiHFq8XNr+SQKyCR/oTruIWItQHmVUzhyLlgMJ
         X3jj6FDucd6D2Fm0rKnjCFCM2csN510t+I7xYk8CX8xCWKE4f6An885KgUBHc7JgG80L
         aO4F8BfbQzuTJudS8AdOy4gbCYGXC6+JwA99CUURla342v63EV+HYP89Nn5fCCBz+YYm
         4jmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bHTXOqRH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IAqU9W61;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IAqU9W61;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 57-v6si3782631qtz.128.2018.07.27.02.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bHTXOqRH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IAqU9W61;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IAqU9W61;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTT-0004gq-AR
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003WC-Fx
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006AB-6O
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068b-Ra; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CE8BB443570;
	Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=21cmLP2brOwuMgaEtN0LAagVBK9JRr+/txf5bmVYiXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bHTXOqRHwEyZ43XuBBWPkIjiK5JLVYhpOIQvRet/rg3O7f6PfUqBeCZod2ZiZbwh/
	ro5nazAyrZjjF9fxlVe1bfTcl8iP3Nd0ABmEsdA7cF2tSz5JmiT9Mjdx6vIfinIUSw
	k7ucGdJOp/BlvnipGh5kG0fsAoiDWwyLlv/1se2M=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IAqU9W61;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IAqU9W61
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6crNpTrM_Kz; Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 828FB443555; Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=21cmLP2brOwuMgaEtN0LAagVBK9JRr+/txf5bmVYiXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IAqU9W61LyUTf7iNWgVAAsAVjWo3bA/56Z06gNAQz5z6iFdhzNSA6tQaeZ6PCaPrU
	ktGxbT7OCSM7AYwgZV3xxrVduBDeAgphx6+VpsB1WeCcaFiBVm9hAXhVDEktYEwk8F
	4Gqb20kRb6/AQBMFRcM1f/NJdF1TI7KYQc0MWWjM=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1A29D4434B9;
	Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=21cmLP2brOwuMgaEtN0LAagVBK9JRr+/txf5bmVYiXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IAqU9W61LyUTf7iNWgVAAsAVjWo3bA/56Z06gNAQz5z6iFdhzNSA6tQaeZ6PCaPrU
	ktGxbT7OCSM7AYwgZV3xxrVduBDeAgphx6+VpsB1WeCcaFiBVm9hAXhVDEktYEwk8F
	4Gqb20kRb6/AQBMFRcM1f/NJdF1TI7KYQc0MWWjM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:07 +0200
Message-Id: <20180727095421.386-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 06/20] intc/arm_gic: Add virtual interface
 register definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ysiSsMtBHP91

Add the register definitions for the virtual interface of the GICv2.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gic_internal.h | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index c85427c8e3..1aa888a576 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -19,10 +19,11 @@
  */
 
 #ifndef QEMU_ARM_GIC_INTERNAL_H
 #define QEMU_ARM_GIC_INTERNAL_H
 
+#include "hw/registerfields.h"
 #include "hw/intc/arm_gic.h"
 
 #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
 
 #define GIC_BASE_IRQ 0
@@ -62,10 +63,74 @@
 #define GICC_CTLR_FIQ_EN     (1U << 3)
 #define GICC_CTLR_CBPR       (1U << 4) /* GICv1: SBPR */
 #define GICC_CTLR_EOIMODE    (1U << 9)
 #define GICC_CTLR_EOIMODE_NS (1U << 10)
 
+REG32(GICH_HCR, 0x0)
+    FIELD(GICH_HCR, EN, 0, 1)
+    FIELD(GICH_HCR, UIE, 1, 1)
+    FIELD(GICH_HCR, LRENPIE, 2, 1)
+    FIELD(GICH_HCR, NPIE, 3, 1)
+    FIELD(GICH_HCR, VGRP0EIE, 4, 1)
+    FIELD(GICH_HCR, VGRP0DIE, 5, 1)
+    FIELD(GICH_HCR, VGRP1EIE, 6, 1)
+    FIELD(GICH_HCR, VGRP1DIE, 7, 1)
+    FIELD(GICH_HCR, EOICount, 27, 5)
+
+#define GICH_HCR_MASK \
+    (R_GICH_HCR_EN_MASK | R_GICH_HCR_UIE_MASK | \
+     R_GICH_HCR_LRENPIE_MASK | R_GICH_HCR_NPIE_MASK | \
+     R_GICH_HCR_VGRP0EIE_MASK | R_GICH_HCR_VGRP0DIE_MASK | \
+     R_GICH_HCR_VGRP1EIE_MASK | R_GICH_HCR_VGRP1DIE_MASK | \
+     R_GICH_HCR_EOICount_MASK)
+
+REG32(GICH_VTR, 0x4)
+    FIELD(GICH_VTR, ListRegs, 0, 6)
+    FIELD(GICH_VTR, PREbits, 26, 3)
+    FIELD(GICH_VTR, PRIbits, 29, 3)
+
+REG32(GICH_VMCR, 0x8)
+    FIELD(GICH_VMCR, VMCCtlr, 0, 10)
+    FIELD(GICH_VMCR, VMABP, 18, 3)
+    FIELD(GICH_VMCR, VMBP, 21, 3)
+    FIELD(GICH_VMCR, VMPriMask, 27, 5)
+
+REG32(GICH_MISR, 0x10)
+    FIELD(GICH_MISR, EOI, 0, 1)
+    FIELD(GICH_MISR, U, 1, 1)
+    FIELD(GICH_MISR, LRENP, 2, 1)
+    FIELD(GICH_MISR, NP, 3, 1)
+    FIELD(GICH_MISR, VGrp0E, 4, 1)
+    FIELD(GICH_MISR, VGrp0D, 5, 1)
+    FIELD(GICH_MISR, VGrp1E, 6, 1)
+    FIELD(GICH_MISR, VGrp1D, 7, 1)
+
+REG32(GICH_EISR0, 0x20)
+REG32(GICH_EISR1, 0x24)
+REG32(GICH_ELRSR0, 0x30)
+REG32(GICH_ELRSR1, 0x34)
+REG32(GICH_APR, 0xf0)
+
+REG32(GICH_LR0, 0x100)
+    FIELD(GICH_LR0, VirtualID, 0, 10)
+    FIELD(GICH_LR0, PhysicalID, 10, 10)
+    FIELD(GICH_LR0, CPUID, 10, 3)
+    FIELD(GICH_LR0, EOI, 19, 1)
+    FIELD(GICH_LR0, Priority, 23, 5)
+    FIELD(GICH_LR0, State, 28, 2)
+    FIELD(GICH_LR0, Grp1, 30, 1)
+    FIELD(GICH_LR0, HW, 31, 1)
+
+/* Last LR register */
+REG32(GICH_LR63, 0x1fc)
+
+#define GICH_LR_MASK \
+    (R_GICH_LR0_VirtualID_MASK | R_GICH_LR0_PhysicalID_MASK | \
+     R_GICH_LR0_CPUID_MASK | R_GICH_LR0_EOI_MASK | \
+     R_GICH_LR0_Priority_MASK | R_GICH_LR0_State_MASK | \
+     R_GICH_LR0_Grp1_MASK | R_GICH_LR0_HW_MASK)
+
 /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
  * GICv2 and GICv2 with security extensions:
  */
 #define GICC_CTLR_V1_MASK    0x1
 #define GICC_CTLR_V1_S_MASK  0x1f
-- 
2.18.0

