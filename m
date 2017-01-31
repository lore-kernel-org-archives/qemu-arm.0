Received: by 10.25.77.65 with SMTP id a62csp51876lfb;
        Tue, 31 Jan 2017 09:21:40 -0800 (PST)
X-Received: by 10.200.43.33 with SMTP id 30mr25446079qtu.107.1485883300787;
        Tue, 31 Jan 2017 09:21:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t26si12395379qkt.266.2017.01.31.09.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 09:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYc7f-0005IA-8v
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 12:21:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDU-0001Ni-3l
	for qemu-devel@nongnu.org; Tue, 31 Jan 2017 11:23:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDT-0001Jl-7K
	for qemu-devel@nongnu.org; Tue, 31 Jan 2017 11:23:36 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYbDQ-0001JA-Q3; Tue, 31 Jan 2017 11:23:32 -0500
Received: by mail-pf0-x241.google.com with SMTP id 19so28543912pfo.3;
	Tue, 31 Jan 2017 08:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z6w8U7dRFiSFVTZtY04U3hYp6bqDZbMdwsD3eXnDVhM=;
	b=JFBQFP916kVBS4Ua9jHBRlVFrqEett6wY1Vyy/08QRomR1fHpNr3MAcoNV5vjyp53H
	inCZ8HqJxxQvqVtd5Za2+oe/sDSu3tbec/lJeP2UmD9mV8K8uoGjrmktyh3A7tcdns21
	aOfl1S1twa0EorixX0f+UvUMW86PCU+D3RTdpZUnACKYt5t+fvVseE8ZbN5mig15VQTL
	J9kygAZkukKP1lKaRRoZ6v6ju5FD7IKI35uq37UfHCHgNxzkCf4cz9urMIcUad9PwPrX
	woJWVAHk7RHGPmSIIQtOGXG+/FGqrRyzXDa6BxVEdhQeyGx9Dh9m6V6Ztecod1AP8SRZ
	u10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z6w8U7dRFiSFVTZtY04U3hYp6bqDZbMdwsD3eXnDVhM=;
	b=K2MQuuzfjbvPnMT+ilClxm2waScvVenz1xQ2mW/d8x0KRhJTRNSlaRtQDtHq47YQBi
	bU7GelPMAoZr/8GOxfEZ0ArdH/q1tABETYvz6z6Gv2pjQ28OjKmblSCw1PZIbzIOJtAL
	oOwC5qW60LCUwtiS64R5M7zhHteZvJU+MhNny0wXxaXHnO+YgVWFrSBk/gxGDUXKoJQ1
	pXgM6NYWKeWTCram0aqVxtqxj09kCMtS+tzaXhrcP3yMIHWWENiuHv8LGMojI8TxUPMp
	KFAMXcdsFcMYTm56WC8amBlbiw4DfMOIit5/kpofB/cErLsjmNYw3Lgsi4Xq9fn00JwI
	QGRQ==
X-Gm-Message-State: AIkVDXLUQHpQYtg3tqE8WgdzzH9cBSQ2VvJLIY6V5qq1Vb7naN33CWjXFa/PIKogemKKeA==
X-Received: by 10.84.248.10 with SMTP id p10mr40258747pll.87.1485879811874;
	Tue, 31 Jan 2017 08:23:31 -0800 (PST)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	z70sm42377261pff.26.2017.01.31.08.23.28
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:23:31 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:53:02 +0530
Message-Id: <1485879782-6075-6-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH v7 RESEND 5/5] hw/intc/arm_gicv3_kvm: Reset
 GICv3 cpu interface registers
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
X-TUID: M0fHGy7fn8N5

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Reset CPU interface registers of GICv3 when CPU is reset.
For this, ARMCPRegInfo struct is registered with one ICC
register whose resetfn is called when cpu is reset.

All the ICC registers are reset under one single register
reset function instead of calling resetfn for each ICC
register.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_kvm.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index f91e0ac..c3f38aa 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -604,6 +604,39 @@ static void kvm_arm_gicv3_get(GICv3State *s)
     }
 }
 
+static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu;
+    GICv3State *s;
+    GICv3CPUState *c;
+
+    c = (GICv3CPUState *)env->gicv3state;
+    if (!c || !c->cpu || !c->gic) {
+        return;
+    }
+
+    s = c->gic;
+    if (!s) {
+        return;
+    }
+
+    cpu = ARM_CPU(c->cpu);
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
@@ -621,6 +654,41 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
     kvm_arm_gicv3_put(s);
 }
 
+static uint64_t icc_cp_reg_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return 0;
+}
+
+static void icc_cp_reg_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    return;
+}
+
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
+      .readfn = icc_cp_reg_read,
+      .writefn = icc_cp_reg_write,
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
@@ -650,6 +718,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
         /* Store GICv3CPUState in CPUARMState gicv3state pointer */
         env->gicv3state = (void *)&s->cpu[i];
+        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
     }
 
     /* Try to create the device via the device control API */
-- 
1.9.1

