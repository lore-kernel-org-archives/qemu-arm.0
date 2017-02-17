Received: by 10.25.77.65 with SMTP id a62csp23839lfb;
        Thu, 16 Feb 2017 22:33:53 -0800 (PST)
X-Received: by 10.200.36.81 with SMTP id d17mr5598657qtd.99.1487313232915;
        Thu, 16 Feb 2017 22:33:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65si6867053qtd.192.2017.02.16.22.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 22:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cec76-0001SX-7S
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 01:33:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec60-0001P0-4e
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 01:32:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5z-0005nw-4G
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 01:32:44 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:35048)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cec5t-0005kq-N7; Fri, 17 Feb 2017 01:32:37 -0500
Received: by mail-pg0-x242.google.com with SMTP id y6so2993184pgy.2;
	Thu, 16 Feb 2017 22:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q1wWk3Mznmsc8B88h1gLt404RprH34au3a2kSJUgY7c=;
	b=s+xhWc2ac1/BUzd0bAK/ys4jksG9LfWnE/hfol4LQL+eaQNiZKpxR34LxyUknJdpGM
	Gx1pB4iEe/v5H6f1daWU/amDur61lGuBVoIXcgBGgXhiBjztkGEqIDbqYpBczE+JEMaC
	ACRNSzPmQT8AiQZmM4NXkzqhfBFkamJ+sfhoDsTgM6l8yrLqMhx3ZF02f/O2I+T/eman
	PSIge4lOQBk+JmWbMAD0MG+jvcKQKzKD4OIJeQnDzgdyPGdmN9VEh4tLUBYyyZDcneCw
	/vWqAsGmFZrkxt1RvN+lA0epyVhglvJMT24IZ3IRGxfi+AHYG2rB30WR+2veE52eaEsJ
	xkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q1wWk3Mznmsc8B88h1gLt404RprH34au3a2kSJUgY7c=;
	b=qcpaejZPljfj6M7D9NX/LBj5CIkG4neaw/ETgDI7QYyOJHaQuRjLWXiS2iZnWe+RnD
	N4PjOvHQPWXtZ4ZGaccEXUPs/pk9Z7Kt6hvqIFwCu+iv+WUlett9B8EqWBOzbDX3Phst
	prM8iciw6JACc1nAGJk1HIwnwZAHtPN8bMJq7l8GQt0jma03A0O2lwdhZBopdwaE7CHt
	Vwl8rJjdgn3wDNpy2Zy6dw9Z2ik41Z0i1ssm2z+klXfDxq0Se0owj0YPWUDMLCtuR+Q1
	I16LRqD6O8iNJ3RYpjxZ/QHFnOvue3kJt7k5gMtewfvknplKkZgwKQpSJiyCd756zLCV
	LkKw==
X-Gm-Message-State: AMke39mp5B/abmjiZgAdePX1NO1VNUFLryh8omQaZb3vRyOxR/H6+bNy04FABdPHIjPeCA==
X-Received: by 10.84.140.36 with SMTP id 33mr8305902pls.136.1487313156873;
	Thu, 16 Feb 2017 22:32:36 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	89sm17074808pfo.40.2017.02.16.22.32.33
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 22:32:35 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Fri, 17 Feb 2017 12:01:55 +0530
Message-Id: <1487313115-9510-6-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v8 5/5] hw/intc/arm_gicv3_kvm: Reset GICv3 cpu
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
X-TUID: K6sH6Jiz1ny0

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Reset CPU interface registers of GICv3 when CPU is reset.
For this, ARMCPRegInfo struct is registered with one ICC
register whose resetfn is called when cpu is reset.

All the ICC registers are reset under one single register
reset function instead of calling resetfn for each ICC
register.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_kvm.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index cda1af4..6377dc3 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -604,6 +604,34 @@ static void kvm_arm_gicv3_get(GICv3State *s)
     }
 }
 
+static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu;
+    GICv3State *s;
+    GICv3CPUState *c;
+
+    c = (GICv3CPUState *)env->gicv3state;
+    assert(!(!c || !c->cpu || !c->gic));
+
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
@@ -621,6 +649,30 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
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
@@ -644,6 +696,12 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
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

