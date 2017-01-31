Received: by 10.25.77.65 with SMTP id a62csp46355lfb;
        Tue, 31 Jan 2017 09:10:15 -0800 (PST)
X-Received: by 10.55.122.194 with SMTP id v185mr25550010qkc.99.1485882615315;
        Tue, 31 Jan 2017 09:10:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a25si12399953qte.122.2017.01.31.09.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 09:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYbwc-0003Pi-Jr
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 12:10:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDE-00018d-If
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDD-0001EP-Mw
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:20 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYbDD-0001ED-HU; Tue, 31 Jan 2017 11:23:19 -0500
Received: by mail-pf0-x243.google.com with SMTP id y143so28599467pfb.1;
	Tue, 31 Jan 2017 08:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iBT9zuyn/kNZjgFy8yYpgtAxHW+IJGZEdDqlXic81Ac=;
	b=UxkPC67H9t4j2cWW1stPzp3KsSwKzfuVkte4ZYh75IYu1bgJd2yJwzNWvNxqQVdTyx
	P9RPXVfIUplHndRDeoU4EbJc8h/XEAnt2c6ddNLJXpyrwanvMuCLUbr8pgBPKuaaaDm/
	d6g3nZB5QSButs15fhUedQIvWqyf23ss9Ih7CPm6CGgXjxc2HPG52kYQteJTU5ueJvG/
	Ktgqp1d3j+hIkHDZYIUkQ8Wbq3SxgibdcijEunXlUoTQgbX8hBKQxicDoz8agfzMX87p
	33kKe5udHLNNYmgiepDKDlnHVbs9qEGs0P7sEH5Tn/GY/QWyJ9wL25akZAJ0GvgDpv/V
	Xnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iBT9zuyn/kNZjgFy8yYpgtAxHW+IJGZEdDqlXic81Ac=;
	b=gy9pH7Tj0jsdj11/EZGg9XppT0rkyYtPQqTtjUzwl0JJz/zUVbfSjakReg/Lmp/GeS
	QSISzd5OsVdBvyxFzeR1LGyYeZ463UQdjTVb8/Uzoiu4lJeNvVbf4+F2RBBkoqR7QW75
	oEBOR8xAhU4F1CJfV5zE+HMkOy1BhGEu6gLLDakHSdB9kNdABIUr6azqoXpL74snetSp
	if4oHcqoYc0dH19seFeYvn/LhO3+0HjrsJATQnt7UakGmJxrpoUVrlpWQuCGjjjK1/sV
	+WnSeaO0GUrY0TYUuTlJN9OtQGnIXtP2sQhEjDNYzZzUxTJTZMcoUBTbJp0aF0r+ffNI
	QZOg==
X-Gm-Message-State: AIkVDXI2v1XMeCtWd2yhPAwvGfVCQeK0m1IoFgQojwvplZhW/lq5SMYOMtCC3CDO2V6ulw==
X-Received: by 10.99.51.76 with SMTP id z73mr31644588pgz.137.1485879798763;
	Tue, 31 Jan 2017 08:23:18 -0800 (PST)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	z70sm42377261pff.26.2017.01.31.08.23.15
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:23:18 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:52:58 +0530
Message-Id: <1485879782-6075-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v7 RESEND 1/5] kernel: Add definitions for GICv3
 attributes
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
X-TUID: 1cPIbvzwnPUK

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This temporary patch adds kernel API definitions.
Use proper header update procedure after these features
are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 linux-headers/asm-arm/kvm.h   | 12 ++++++++++++
 linux-headers/asm-arm64/kvm.h | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 541268c..1ba7d8d 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -172,10 +172,22 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
+			(0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL       4
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
+			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
+#define VGIC_LEVEL_INFO_LINE_LEVEL	0
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT    0
 
 /* KVM_IRQ_LINE irq field index values */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index fd5a276..b3f02ce 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -201,10 +201,22 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
+			(0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
+			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK	0x3ff
+#define VGIC_LEVEL_INFO_LINE_LEVEL	0
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
 
 /* Device Control API on vcpu fd */
-- 
1.9.1

