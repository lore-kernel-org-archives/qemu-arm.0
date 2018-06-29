Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730603wrq;
        Fri, 29 Jun 2018 06:31:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfFGnhQRCl4jDfwiGZOc2WvI26FU4zqzHn5+kv4p5/x7oit2+3iPWpS0hq8587JR31pxRJ7
X-Received: by 2002:a37:2a62:: with SMTP id q95-v6mr12793102qkh.228.1530279105984;
        Fri, 29 Jun 2018 06:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279105; cv=none;
        d=google.com; s=arc-20160816;
        b=QWVByC1jFc3cHB2Qyr1RZz+t9aZkGDrYzLr++cUjzBO9Oztv3AOtLBjgXYs8tNnKLm
         9tA1VO/rm+QaW3itS2vQ7ut5c37ihUHwuFnwKaJvx1K+7qzTfHi4ovzA5il58q7XrkBO
         7Y6I9y36TV0AzvzNRnDgMYWK8hVhj6LvjzZiZ+ygut88+Bq9rpW3+JSJ8bQGkaDBOEky
         hgjFA2pxiO084f6f9sPzRnF8iq44AlY1sNX6HYrqhBt7mC2xo5F2C+0gKy8WpQy7LdOH
         /KotYVagLiMcCix/Rfqq16hELiPs5IGepWmRPfI+LHsONtgiz5Bz4n3cDPd53GTecxEs
         qo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=28foLpcCnM6+oks8IpyLGo35oUMteC4cawew80r5s4Y=;
        b=OGD2NyJsBwbCb9E11Gxj0Kmb200RCvepZPUSiFK+ICchFHqvTioMRZRu1dW5ZNMBvh
         ajbBNvMFILxAYwfheUp5pPM4qNMjtJOEPr6tGLUb2ggVxvx8uHvS6caQPRuVX/LnigSU
         Asz3Na+n2Z/H2sU7JJ42lj/prda7RPbGYqb3CUqx/dtSbx8MjILyTpblc5CfAgXK6zxT
         PWNTMtT7lfHINOgrrmR4/PgyHpmu76Lfd7tpO5MIBzmfs2ZjpuqnkKA1aTcC/lLG+EhD
         9geGsN9xoZzJtVmBWhczoUu75tqjJFn6UOKAkIuvVHxCT1cvK47Mly6ERJnjUMRM6g5u
         bZCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=RjTMQhog;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4EDH6Ht3;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4EDH6Ht3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j37-v6si9102668qtc.35.2018.06.29.06.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=RjTMQhog;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4EDH6Ht3;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4EDH6Ht3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtV3-0008BX-6T
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtUA-0007aO-A0
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006rj-8q
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:50 -0400
Received: from greensocs.com ([193.104.36.180]:58614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mO-RI; Fri, 29 Jun 2018 09:30:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 82210443496;
	Fri, 29 Jun 2018 15:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279042;
	bh=Tcn8vA+NQ6UjfzqAXfFdIrJgo/nDdngNZUAvIGiaw7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RjTMQhog3E7EN8vBhke1r2HSa3kU57ldblI3vhdwCUj7XpFIwrNHTQ76WYhORA+ty
	x0X0kq3j+2HMInVHIceE7P8xCLWSWcU/nj3izBAFkYpRMiTk3XcVMYn81sN7ud2MPH
	OkXEIKtbuWrXZvqxMjbG3M9xEd0JKyS0LnCFpSgg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4EDH6Ht3;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4EDH6Ht3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RNe5SvmtaYu; Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 905504434B8; Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279041;
	bh=Tcn8vA+NQ6UjfzqAXfFdIrJgo/nDdngNZUAvIGiaw7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4EDH6Ht3BsXdO8vC2TiVt+BN6XLtFjec0gsJt6fJvZV4m2DJYNkqYRwy784cEU8Ci
	SDikZYr6my5GAdEdeTTz+VcoonmTkzsINiVnleF8DvwUv1bcaeCIKf8EnnAewVWQUA
	X0CEfrPW7VhmManBLtmiYGpD7K6XfagZqsW7MbQs=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1A26E4434BD;
	Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279041;
	bh=Tcn8vA+NQ6UjfzqAXfFdIrJgo/nDdngNZUAvIGiaw7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4EDH6Ht3BsXdO8vC2TiVt+BN6XLtFjec0gsJt6fJvZV4m2DJYNkqYRwy784cEU8Ci
	SDikZYr6my5GAdEdeTTz+VcoonmTkzsINiVnleF8DvwUv1bcaeCIKf8EnnAewVWQUA
	X0CEfrPW7VhmManBLtmiYGpD7K6XfagZqsW7MbQs=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:51 +0200
Message-Id: <20180629132954.24269-18-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 17/20] intc/arm_gic: Implement maintenance
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
X-TUID: pWsXXJ3MfVl+

Implement the maintenance interrupt generation that is part of the GICv2
virtualization extensions.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a3ff4b89d1..10300e9b4c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -206,6 +206,94 @@ static inline void gic_update_internal(GICState *s, bool virt)
     }
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
+    int val;
+    int vcpu = cpu + GIC_NCPU;
+
+    int num_eoi, num_valid, num_pending;
+
+    gic_extract_lr_info(s, cpu, &num_eoi, &num_valid, &num_pending);
+
+    /* EOI */
+    val = (num_eoi != 0);
+    s->h_misr[cpu] = FIELD_DP32(0, GICH_MISR, EOI, val);
+
+    /* U: true if only 0 or 1 LR entry is valid */
+    val = s->h_hcr[cpu] & R_GICH_HCR_UIE_MASK &&
+        (num_valid < 2);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, U, val);
+
+    /* LRENP: EOICount is not 0 */
+    val = s->h_hcr[cpu] & R_GICH_HCR_LRENPIE_MASK &&
+        ((s->h_hcr[cpu] & R_GICH_HCR_EOICount_MASK) != 0);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, LRENP, val);
+
+    /* NP: no pending interrupts */
+    val = s->h_hcr[cpu] & R_GICH_HCR_NPIE_MASK &&
+        (num_pending == 0);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, NP, val);
+
+    /* VGrp0E: group0 virq signaling enabled */
+    val = s->h_hcr[cpu] & R_GICH_HCR_VGRP0EIE_MASK &&
+        (s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP0);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, VGrp0E, val);
+
+    /* VGrp0D: group0 virq signaling disabled */
+    val = s->h_hcr[cpu] & R_GICH_HCR_VGRP0DIE_MASK &&
+        !(s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP0);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, VGrp0D, val);
+
+    /* VGrp1E: group1 virq signaling enabled */
+    val = s->h_hcr[cpu] & R_GICH_HCR_VGRP1EIE_MASK &&
+        (s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP1);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, VGrp1E, val);
+
+    /* VGrp1D: group1 virq signaling disabled */
+    val = s->h_hcr[cpu] & R_GICH_HCR_VGRP1DIE_MASK &&
+        !(s->cpu_ctlr[vcpu] & GICC_CTLR_EN_GRP1);
+    s->h_misr[cpu] = FIELD_DP32(s->h_misr[cpu], GICH_MISR, VGrp1D, val);
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
 static void gic_update(GICState *s)
 {
     gic_update_internal(s, false);
@@ -214,6 +302,7 @@ static void gic_update(GICState *s)
 static void gic_update_virt(GICState *s)
 {
     gic_update_internal(s, true);
+    gic_update_maintenance(s);
 }
 
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
-- 
2.17.1

