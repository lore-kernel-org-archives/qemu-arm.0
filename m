Received: by 10.25.0.147 with SMTP id 141csp174253lfa;
        Thu, 23 Feb 2017 04:23:51 -0800 (PST)
X-Received: by 10.55.162.138 with SMTP id l132mr34641486qke.204.1487852631255;
        Thu, 23 Feb 2017 04:23:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o65si3171647qte.100.2017.02.23.04.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 04:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgsR2-0008Ve-BA
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 07:23:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgs9j-0007ow-LI
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 07:06:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgrwH-0004cq-34
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 06:52:04 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cgrwD-0004cE-M3; Thu, 23 Feb 2017 06:51:57 -0500
Received: by mail-pg0-x241.google.com with SMTP id 1so4339447pgz.2;
	Thu, 23 Feb 2017 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D0COQR4F+Ta/TuAf6smBo42cabGgTGvm8aJxfFJSY/0=;
	b=aoW9ml30G332p/oOrBsSGre5bcKHzGU4Z8LdWkIZmsTAG523BWHVJzT536txg9BCAL
	UeqPJxEgB7qI2h2cyaVsj8BAVz8VUsOsnQNYPrd8hGR7B2QXpqFmic7Q+MAyU5W0SpCk
	d3hahsWncWOP07zhrObdn6SrwZkOTVLWRBIOt6rAOuT9SFu8pz33loYt/zvQwAi0/Tu1
	to1Vd3iOrHDdPt6XyolUVI35D28jktjezZ1Qqo/JQeIUfmMjpSynwa8R4SRbg4D4hJqJ
	oAEVDqtqWqsbmdFv6SEf1zkprE9misovd/ZGdFqcrq/P2W/RgKC+FQi3pMdnCFyoS1J4
	qm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D0COQR4F+Ta/TuAf6smBo42cabGgTGvm8aJxfFJSY/0=;
	b=AfASOFIBrRykSTmn5raGuKFSTOysvBIxcfmc7lfASAnZTCDezwDHSyKO0mrvszyq+m
	gWzvVB0YqBHrupnLiKPdemozkqsF0AvfRMZT9YJvUUAyzC0gpxFMN1IL1frThktmbXiP
	SIsC3CxkyqtiuGgFnVA1U+LBwQqjY7aVk6PItFyaLZIIUwHFrXRau/rbIFHorScafvsI
	LF0xahk1b6r8aKfnbzjyk99UmGilkfsdOIlB8ovLixVdBKFBUT2hPL8Pfnz9Sz+FY45d
	7Q0SNomoqHNXszn7KdRl/1lO8qk6w0O8CdJWJ1TZH23FWSzI+2hAErAUgAgVHZoCwAAE
	Q3Sw==
X-Gm-Message-State: AMke39krsTVHKTnCOAURtHAxIdWt4vPOYnc1TXapZRO0DiJh8lgJ67YHtFn2jtmt+v+ISw==
X-Received: by 10.99.213.81 with SMTP id v17mr47270098pgi.130.1487850716733;
	Thu, 23 Feb 2017 03:51:56 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm9462026pfg.53.2017.02.23.03.51.54
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 03:51:56 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Thu, 23 Feb 2017 17:21:13 +0530
Message-Id: <1487850673-26455-6-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v9 5/5] hw/intc/arm_gicv3_kvm: Reset GICv3 cpu
 interface registers
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qzuEyq6Gkvmy

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Reset CPU interface registers of GICv3 when CPU is reset.
For this, ARMCPRegInfo struct is registered with one ICC
register whose resetfn is called when cpu is reset.

All the ICC registers are reset under one single register
reset function instead of calling resetfn for each ICC
register.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_kvm.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index cda1af4..81f0403 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -604,6 +604,32 @@ static void kvm_arm_gicv3_get(GICv3State *s)
     }
 }
 
+static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu;
+    GICv3State *s;
+    GICv3CPUState *c;
+
+    c = (GICv3CPUState *)env->gicv3state;
+    s = c->gic;
+    cpu = ARM_CPU(c->cpu);
+
+    /* Initialize to actual HW supported configuration */
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+                      KVM_VGIC_ATTR(ICC_CTLR_EL1, cpu->mp_affinity),
+                      &c->icc_ctlr_el1[GICV3_NS], false);
+
+    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
+    c->icc_pmr_el1 = 0;
+    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
+    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
+    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+
+    c->icc_sre_el1 = 0x7;
+    memset(c->icc_apr, 0, sizeof(c->icc_apr));
+    memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
+}
+
 static void kvm_arm_gicv3_reset(DeviceState *dev)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
@@ -621,6 +647,34 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
     kvm_arm_gicv3_put(s);
 }
 
+/*
+ * CPU interface registers of GIC needs to be reset on CPU reset.
+ * For the calling arm_gicv3_icc_reset() on CPU reset, we register
+ * below ARMCPRegInfo. As we reset the whole cpu interface under single
+ * register reset, we define only one register of CPU interface instead
+ * of defining all the registers.
+ */
+static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
+    { .name = "ICC_CTLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 4,
+      /*
+       * If ARM_CP_NOP is used, resetfn is not called,
+       * So ARM_CP_NO_RAW is appropriate type.
+       */
+      .type = ARM_CP_NO_RAW,
+      .access = PL1_RW,
+      .readfn = arm_cp_read_zero,
+      .writefn = arm_cp_write_ignore,
+      /*
+       * We hang the whole cpu interface reset routine off here
+       * rather than parcelling it out into one little function
+       * per register
+       */
+      .resetfn = arm_gicv3_icc_reset,
+    },
+    REGINFO_SENTINEL
+};
+
 static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = KVM_ARM_GICV3(dev);
@@ -644,6 +698,12 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
+    for (i = 0; i < s->num_cpu; i++) {
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
+
+        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+    }
+
     /* Try to create the device via the device control API */
     s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V3, false);
     if (s->dev_fd < 0) {
-- 
1.9.1

