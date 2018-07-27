Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507215wru;
        Fri, 27 Jul 2018 02:55:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc7HbjFRjXsFEq/ziR6qh415UpKQYrEaKyObZBiLI3tbMhFcKDykFSJEAHhF8174on4pzYb
X-Received: by 2002:ac8:5144:: with SMTP id h4-v6mr5323553qtn.290.1532685334121;
        Fri, 27 Jul 2018 02:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685334; cv=none;
        d=google.com; s=arc-20160816;
        b=tDHPKM1UfmFbmBzb4GoWc0mVHrSdcDpLawoL/2+v9Q7efoUTeqxpNB8TxCSwtggKQj
         1T4TFuwNc7cRHb/yn/Dfb1lGRlF5/6GmlZsNeD8xlH6IRTjyVvwCWIPmdzekY26EVuZF
         0KPsj/2cp5S083ES8u2A8y0mRpYUH8ttcSxk7EnJkhJzWkltZVMhV2GnhPv28V06XVhr
         VIsvJXK6Do3T8nW72u1UVXKyWgl8bUY4hhNAwz2tMaIb36qKC0SF7ouXV9UKxh1kLSDo
         INE+k01m8k4KIGQuoS+2pUJFDjW9gk83nU0q9gU8+IKxyBPqNqgwa5sp+WyRY86f5stJ
         OSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=UxOD5AdyG/y/5C8b7/5OU7HDmpYZ2SdHXBOBblxSh4s=;
        b=jl9gZqZMcPjaiPRQFoO9arnHxei8xY6lPd3+o1gtkYNqRgn+CZlQxWGHCADkpsdD8D
         b98xsqgp9ZugEw6jObteXQpCsi+k8Xmn9OcvH699MEe8tvVayHjQmnkhnt3dx0FSzx9a
         aflUu+rdHI9pR9ZndzGw0xSFO313YCTSWfr1X8cMWdIzBHHg9SDJGrQS9FcFrWpxYmy9
         5AA3KII8vgUP6FEn7yvlQqub2u+GV7g7ZEPrb9/uyOnwxNi0NEAz8TNsIkSoNrOh5nNj
         WYxOLR0RX6NjEHcg25NrPipm/v3YKJ/4CXF7pYwP2OfqJ3GXQY6q+NA+479ftZ0MGZC9
         LSSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=u+PUit6G;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=PGJK69mD;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Gcf6C9Bw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z199-v6si3335093qkb.92.2018.07.27.02.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=u+PUit6G;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=PGJK69mD;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Gcf6C9Bw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTB-0004Ne-Ik
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSe-0003ZV-Dy
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006Bw-MJ
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:00 -0400
Received: from greensocs.com ([193.104.36.180]:47518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-00068j-CA; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6921B443485;
	Fri, 27 Jul 2018 11:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685292;
	bh=pNNl64R+LFdPfExuU2lnihGUsf+QguDPJQcNXojg8Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=u+PUit6G7pP3VmVfL8MI+sRQAMp/Jn5W+vtniikjHIlrxrz0QPn68Hg/jt6ArKAwh
	4Ns7LEm04L78MWnD3C/J+yO/oJbX+2x2r9uxfscpkwTqyM3Hm5G4zqQQaFmYG3BPgR
	4m31gCZIA/OsAZk2hpnLi6IBxyC9qW8Po/CHULLs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=PGJK69mD;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Gcf6C9Bw
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jw1QZl8GHk3W; Fri, 27 Jul 2018 11:54:51 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 10D1A443555; Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=pNNl64R+LFdPfExuU2lnihGUsf+QguDPJQcNXojg8Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PGJK69mDR4kCu8sotVGhvDMFko89FY5pCZiaK6bfUtafd/V2niMec4lRWZ+8IDg08
	X3iTv/SxJZZdTqf1L+mM1gPHtSG5hVNfCPIVtGJeNfjUIT+SDrxCYGeKawlmg7sydR
	YtK5XFx+olgVZ9A3oM6Sb4cT2dmyZU/jER0HsdHI=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 80E5D443557;
	Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685289;
	bh=pNNl64R+LFdPfExuU2lnihGUsf+QguDPJQcNXojg8Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gcf6C9Bw8qsQXLuyinNH5XwTu8SSvyhrXaFLhp5Q2Mq43kVafoWdvXTZEBmRY1IOD
	22b5noRYeLs+1LmeAJhBWt1Tm+OJ5VyoVnRDApQZovqV9b2TpfprucMRanAUdMJxbP
	oHNmds/sEp87acJYbn0FIaVR4H9oUD5oP/2ZaXtA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:18 +0200
Message-Id: <20180727095421.386-18-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 17/20] intc/arm_gic: Implement maintenance
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
X-TUID: 7kgDzd36f6rU

Implement the maintenance interrupt generation that is part of the GICv2
virtualization extensions.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 6b97e19796..6ff7da3e5d 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -238,13 +238,110 @@ static inline bool gic_lr_entry_is_eoi(uint32_t entry)
 {
     return (GICH_LR_STATE(entry) == GICH_LR_STATE_INVALID)
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
                                  int cm, int target)
 {
-- 
2.18.0

