Received: by 10.25.77.65 with SMTP id a62csp57481lfb;
        Tue, 31 Jan 2017 09:34:23 -0800 (PST)
X-Received: by 10.55.130.4 with SMTP id e4mr30244764qkd.65.1485884063547;
        Tue, 31 Jan 2017 09:34:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f37si12425514qte.335.2017.01.31.09.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 09:34:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYcJy-0001em-Va
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 12:34:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDO-0001IU-L4
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDN-0001I0-ML
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:30 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYbDN-0001Hr-Gy; Tue, 31 Jan 2017 11:23:29 -0500
Received: by mail-pf0-x242.google.com with SMTP id y143so28600182pfb.1;
	Tue, 31 Jan 2017 08:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o1KL6CwGzxVGVLJycM8WJRRwSr4lYhp47/OMKzzCd3w=;
	b=GYkWcyU04iX1eJYI/4mXF+pt5S9ZgbuQl5aHbqMxE+U0UC67wpBT2awli9lKm7/knK
	dqdVVJ7vZprTOOFSIT0NlUuQsT/7LDln+/sCk5aCWZHlHJSTWWW2uA5jNXv0VId1OGUV
	lBK31kdQgtOTefMFaE/qEX1+ulesW4UDQxvKdnExm7dE8rjpyjx/LCgZC38R27IfinZJ
	Kk7uPoqF63BRyg6lQiqu0xhbH/pa3YbULDi6BxD5sUAkUiIFcML/tAFPlklJ3EftshOL
	UObYeeMnvOPK2JpfnXh4sHDkYjph6cqUtJhyvN45IvHrq3RKyGVd4566DhIdCo3j2mqP
	S/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o1KL6CwGzxVGVLJycM8WJRRwSr4lYhp47/OMKzzCd3w=;
	b=Cy2NcENOvvt/NPzdukoU1zDrUCmUksCWQTpRBLYwrVFA8rYLCD76hlCCCF/Z4x8xXp
	CGZtb4QqkwTRMf5WUKZpuf9rFhSaxKCYihA3hgjaM0ca3iyarma+nbginJo1GIJDPPBw
	rFkvFQdu3Y+M8dXzTD5sM75K05PRjWmLTWm9BPadLJIWIAE9za/vHxFao5wakAi8JX/B
	TL0OPaeUsR7GtFoQ4Jibb/tsdQFuqqVwe0YuISneDVl2O9K87mGJi6eHvgTtAMq9oeod
	xW9gghBDdAcdj56DIcTB3fP34o+rVrzvspqmKXWVhkgtE/14uzgy5JH/p93dk/XxO4Pb
	L2PQ==
X-Gm-Message-State: AIkVDXJLAxaLQ2e0qCWg82Av7f2cOeWot+XkS4cH2UX5FWQnR0FkvfYJ/enitKxAksfmww==
X-Received: by 10.84.211.7 with SMTP id b7mr40600725pli.82.1485879808678;
	Tue, 31 Jan 2017 08:23:28 -0800 (PST)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	z70sm42377261pff.26.2017.01.31.08.23.25
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:23:28 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:53:01 +0530
Message-Id: <1485879782-6075-5-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v7 RESEND 4/5] target-arm: Add GICv3CPUState in
 CPUARMState struct
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
X-TUID: LSWJcHpRj9rW

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Add gicv3state void pointer to CPUARMState struct
to store GICv3CPUState.

In case of usecase like CPU reset, we need to reset
GICv3CPUState of the CPU. In such scenario, this pointer
becomes handy.

This patch take care of only GICv3.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_kvm.c | 8 ++++++++
 target-arm/cpu.h        | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 77af32d..f91e0ac 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -644,6 +644,14 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
+    for (i = 0; i < s->num_cpu; i++) {
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
+        CPUARMState *env = &cpu->env;
+
+        /* Store GICv3CPUState in CPUARMState gicv3state pointer */
+        env->gicv3state = (void *)&s->cpu[i];
+    }
+
     /* Try to create the device via the device control API */
     s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V3, false);
     if (s->dev_fd < 0) {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849..b1ca064 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -507,6 +507,8 @@ typedef struct CPUARMState {
 
     void *nvic;
     const struct arm_boot_info *boot_info;
+    /* Store GICv3CPUState to access from this struct */
+    void *gicv3state;
 } CPUARMState;
 
 /**
-- 
1.9.1

