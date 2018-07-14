Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp654199wrq;
        Sat, 14 Jul 2018 10:23:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdfWPa3ziQEUGopjE4Ar20a7TJqJYd3RO3UAkv4GLlInR/1S0ERhE0liDCHpdmQYS9CI2Z6
X-Received: by 2002:a37:85c5:: with SMTP id h188-v6mr8948718qkd.80.1531589021938;
        Sat, 14 Jul 2018 10:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531589021; cv=none;
        d=google.com; s=arc-20160816;
        b=q/5ptQqfKu+4zF5rv/ro0ZZ6qIZpemuTPjoWLRyjx0UigRJux20+CfqCp+ySUNOHft
         Z7fwN3BrIA5LGgNMj28/MZ/yJrLdP2+kCOeBOTHjDIxDT+wYIdUzgWY+8ByHfEBkvEXV
         N0ACPGke6NBM0X8ZbB1RGqJYYEtEqJVWH5VNsVX2t3CjOOxwWsifT2+dV3OjRPYaU6lE
         7dCzjquwDfzOBqZPYVCc+lPSEH0no8gifpTz9+IAxNG8eTu1E7/bb2GAqJZJHsNcZ3QK
         /taQcAwHQRI71romFU44GrdZprNSAA4RNQ10Uyzsrx+bwBl9K/GptDcydy57+2+vvFGz
         hZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=t5zGsV1a/Ih8+2iWrPlLlujXM6+0UNCeiIIek7jt5VA=;
        b=iLBiSwKPkc57vXKq4lmZKrCGedWzFctH9yClkfLuQ1ZOSIybOI92D5XO8AwjxjIdQ0
         u9EtbmaS7I1QFCHRvJeayMDo0Gi7Ns/oH36TIq43fiSdhp54PTm09B9BfI5hV6aOQDc1
         TGesUtLGx/h326O7Rf/HH4PmaSUOdgrwZptIaCkAhKApOCxhc/xJvJ+HrPOJ+Kk1Ur3/
         zY66vZbfz0l8VUFp2L3kSA011Ed3krXgckeDylJrOp9+Jh3S16EIaQCx206zR5jNt5AV
         BfhR2CTfrJ8+hdK+pOGSLhJID2VrRkT8x/qtDEh/+c0xih5OqKJ+xznUD+qDqi2xefCL
         d1lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bYpaGqZo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qbXMgKJ9;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qbXMgKJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i14-v6si8064147qvo.40.2018.07.14.10.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bYpaGqZo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qbXMgKJ9;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qbXMgKJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOGj-0002rf-At
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:23:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9u-0005nF-CV
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9q-0004aY-6s
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:36 -0400
Received: from greensocs.com ([193.104.36.180]:57388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9p-0004Zk-Kn; Sat, 14 Jul 2018 13:16:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 13792C7ADD;
	Sat, 14 Jul 2018 19:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588593;
	bh=i1BwjH3XT+OrsK2Nj8m0xiz7tDcSdqowdxOMe+UKIks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bYpaGqZoxJhsn6zziZvPggjOPVoUEKtRFbrI1QoUA0SsF9R96DdL2sM60rJbqlHvj
	DCgbSm6/Puuhj9Gr18AYkkj/DJZPokntGfnF9vLS9pgJy2SIhS9AJN/hdhFOQ2m0j1
	UtIniTwLzDwyqPBN4zP3y5qikVQlqGlaIUiKvUbY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qbXMgKJ9;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qbXMgKJ9
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5W9HTGdt_srp; Sat, 14 Jul 2018 19:16:32 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 3332AC7AF4; Sat, 14 Jul 2018 19:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588591;
	bh=i1BwjH3XT+OrsK2Nj8m0xiz7tDcSdqowdxOMe+UKIks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qbXMgKJ9ODnQklMe7JiwxtM8ic6iZ04Zpd1d/PEOISyzDpuohcUixgBEkZVva/gf6
	yR9MkF9yzq0QkCS7YUd0yCVCX1iVqvxDRSVL2KNv/GtA7X3MsGKpnPdr+rcRaxa9p2
	lMwuSb4gHxyiwIhDuTWcqkLJATq4bKaG3DYkDuiU=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3BBA8C7AE3;
	Sat, 14 Jul 2018 19:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588591;
	bh=i1BwjH3XT+OrsK2Nj8m0xiz7tDcSdqowdxOMe+UKIks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qbXMgKJ9ODnQklMe7JiwxtM8ic6iZ04Zpd1d/PEOISyzDpuohcUixgBEkZVva/gf6
	yR9MkF9yzq0QkCS7YUd0yCVCX1iVqvxDRSVL2KNv/GtA7X3MsGKpnPdr+rcRaxa9p2
	lMwuSb4gHxyiwIhDuTWcqkLJATq4bKaG3DYkDuiU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:58 +0200
Message-Id: <20180714171601.5734-18-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 17/20] intc/arm_gic: Implement maintenance
 interrupt generation
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
X-TUID: RjZBmGGcykeV

Implement the maintenance interrupt generation that is part of the GICv2
virtualization extensions.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 85f1a03147..4155fbe667 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -240,9 +240,106 @@ static inline bool gic_lr_entry_is_eoi(uint32_t entry)
         && !GICH_LR_HW(entry) && GICH_LR_EOI(entry);
 }
 
+static inline void gic_extract_lr_info(GICState *s, int cpu,
+                                int *num_eoi, int *num_valid, int *num_pending)
+{
+    int lr_idx;
+
+    *num_eoi = 0;
+    *num_valid = 0;
+    *num_pending = 0;
+
+    for (lr_idx = 0; lr_idx < s->num_lrs; lr_idx++) {
+        uint32_t *entry = &s->h_lr[lr_idx][cpu];
+
+        if (gic_lr_entry_is_eoi(*entry)) {
+            (*num_eoi)++;
+        }
+
+        if (GICH_LR_STATE(*entry) != GICH_LR_STATE_INVALID) {
+            (*num_valid)++;
+        }
+
+        if (GICH_LR_STATE(*entry) == GICH_LR_STATE_PENDING) {
+            (*num_pending)++;
+        }
+    }
+}
+
+static void gic_compute_misr(GICState *s, int cpu)
+{
+    uint32_t value = 0;
+    int vcpu = cpu + GIC_NCPU;
+
+    int num_eoi, num_valid, num_pending;
+
+    gic_extract_lr_info(s, cpu, &num_eoi, &num_valid, &num_pending);
+
+    /* EOI */
+    if (num_eoi) {
+        value |= R_GICH_MISR_EOI_MASK;
+    }
+
+    /* U: true if only 0 or 1 LR entry is valid */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_UIE_MASK) && (num_valid < 2)) {
+        value |= R_GICH_MISR_U_MASK;
+    }
+
+    /* LRENP: EOICount is not 0 */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_LRENPIE_MASK) &&
+        ((s->h_hcr[cpu] & R_GICH_HCR_EOICount_MASK) != 0)) {
+        value |= R_GICH_MISR_LRENP_MASK;
+    }
+
+    /* NP: no pending interrupts */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_NPIE_MASK) && (num_pending == 0)) {
+        value |= R_GICH_MISR_NP_MASK;
+    }
+
+    /* VGrp0E: group0 virq signaling enabled */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_VGRP0EIE_MASK) &&
+        (s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP0)) {
+        value |= R_GICH_MISR_VGrp0E_MASK;
+    }
+
+    /* VGrp0D: group0 virq signaling disabled */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_VGRP0DIE_MASK) &&
+        !(s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP0)) {
+        value |= R_GICH_MISR_VGrp0D_MASK;
+    }
+
+    /* VGrp1E: group1 virq signaling enabled */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_VGRP1EIE_MASK) &&
+        (s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP1)) {
+        value |= R_GICH_MISR_VGrp1E_MASK;
+    }
+
+    /* VGrp1D: group1 virq signaling disabled */
+    if ((s->h_hcr[cpu] & R_GICH_HCR_VGRP1DIE_MASK) &&
+        !(s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP1)) {
+        value |= R_GICH_MISR_VGrp1D_MASK;
+    }
+
+    s->h_misr[cpu] = value;
+}
+
+static void gic_update_maintenance(GICState *s)
+{
+    int cpu = 0;
+    int maint_level;
+
+    for (cpu = 0; cpu < s->num_cpu; cpu++) {
+        gic_compute_misr(s, cpu);
+        maint_level = (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK) && s->h_misr[cpu];
+
+        qemu_set_irq(s->maintenance_irq[cpu], maint_level);
+    }
+}
+
 static void gic_update_virt(GICState *s)
 {
     gic_update_internal(s, true);
+    gic_update_maintenance(s);
 }
 
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
-- 
2.18.0

