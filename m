Received: by 10.25.77.65 with SMTP id a62csp22815lfb;
        Tue, 31 Jan 2017 08:18:22 -0800 (PST)
X-Received: by 10.55.113.129 with SMTP id m123mr30161517qkc.47.1485879502130;
        Tue, 31 Jan 2017 08:18:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p39si12292709qkh.112.2017.01.31.08.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 08:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYb8P-0005CI-E7
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 11:18:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawq-0002dM-AK
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawl-0005UV-CE
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:06:24 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYawl-0005Tw-67; Tue, 31 Jan 2017 11:06:19 -0500
Received: by mail-pf0-x241.google.com with SMTP id f144so28529180pfa.2;
	Tue, 31 Jan 2017 08:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z6w8U7dRFiSFVTZtY04U3hYp6bqDZbMdwsD3eXnDVhM=;
	b=Vtka+69KJbhziTaHg61Hdtv7ZS1cUQdUeJwCiWn0Ft7y8L6qqvXDf1AuauwLh6verr
	mK3l0s20rKg0tb8b8YZuZqG3XURlplHhozQvPLj8Vcv2KuMl6CUZLweH7PzV1QbByMeL
	/VXhvuiFHkRB4S9YFxllG8nYN076H9J53+q73huZYMopKLOCYygcA90GNDrQ36CIvuVl
	ENQ3fD5i3tgVD00xf3QEg/3Sr6xedvpfTYirlxHGGlsXFZz5wOI25MgZb7l4zCeY1xnT
	FxJYkk4vrBKYtpWiJJBKk17IMM6QF7TemK2yK10wNedxSHjB9vrny/5GDAOmX5fjQBLQ
	Mepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z6w8U7dRFiSFVTZtY04U3hYp6bqDZbMdwsD3eXnDVhM=;
	b=J45v0XTxLhCM+uBMVJlM0DwnJF9OxkB38qp5oC6b6gfM2/tJ6RnYqnuNpnJeejF3K4
	4IfMb6QUZe7n0VET9HzNc0LUewciRXpKj1j88ftnwnKcMJqHu2lomGYAtft0XnEKWRev
	8t19S0ojRrcBQ4no/q3Ve/tgIKeBdTEvj0yCKtg8GzU9N20nXp+N/hhzce6ofYZ3sDg3
	tlyK29uVguWymtPRqZo1GM6OoNIThkXtTGNmwIIdFpZWEXw0i0GXR4+P4TSEFacXYv2H
	bojH9/ff47SeA7qP2lOgzvtK1nKoMrRrzLwwYCuGS4/USgZvQcN5rOD6s9WLGYga1WEF
	jIHw==
X-Gm-Message-State: AIkVDXIMjnaxFvwqpTlUQVS0Ab07S5iYNYnaf+U7abp5KAeZG4jrixpfXnnHyimSv62d3w==
X-Received: by 10.99.174.4 with SMTP id q4mr31578988pgf.186.1485878778270;
	Tue, 31 Jan 2017 08:06:18 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.200])
	by smtp.gmail.com with ESMTPSA id
	b10sm42699837pga.21.2017.01.31.08.06.15
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:06:17 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:35:49 +0530
Message-Id: <1485878749-5641-5-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
References: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v7 4/4] hw/intc/arm_gicv3_kvm: Reset GICv3 cpu
 interface registers
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rk/pbjqUvOE9

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

