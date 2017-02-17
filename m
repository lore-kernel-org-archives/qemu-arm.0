Received: by 10.25.77.65 with SMTP id a62csp23482lfb;
        Thu, 16 Feb 2017 22:32:30 -0800 (PST)
X-Received: by 10.200.42.47 with SMTP id k44mr5870566qtk.56.1487313150422;
        Thu, 16 Feb 2017 22:32:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n1si6847048qte.336.2017.02.16.22.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 22:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cec5l-0001AM-QK
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 01:32:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5g-00019W-4z
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5e-0005cs-Ny
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:24 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:34206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cec5e-0005cc-Ie; Fri, 17 Feb 2017 01:32:22 -0500
Received: by mail-pg0-x241.google.com with SMTP id v184so4102211pgv.1;
	Thu, 16 Feb 2017 22:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j8tbZ9viiD4TSkdGgc+2JXm2ns12/XmSBv3lmqM8OLI=;
	b=E0g2ST4VVg3E8oCYyiMr1ta8KMmvMx8Bipm1Hn7JARnY5SACtoLk3h9aE+ic7+eAMI
	/8AG1yWVjLWafaXf2AUHDcwTOIt9DQiHzyswfppcDEhHCRcPt2TcAC4xzVPAdO1kBRJ0
	TUWgDZDOGIsydLGq362bdy4SVDxpeY9gfy5KoZNy3VanpbCz3z9zNLPSgu1ZHADNvaC4
	JRTIjsparE8bnlIhZoYTpljjrE4kMWpQyQ1VLBUGRwBX6AC0uMKLN2iFyynStsGMx2lN
	GuioqZvdVSflnEFY8xRBPVqQDVK6cOUVs7LSYVzMarIb9QKWlbf7I0ODImsx8ocEz79Q
	lvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j8tbZ9viiD4TSkdGgc+2JXm2ns12/XmSBv3lmqM8OLI=;
	b=kijGQ8MDcgBOTY2K/1tjZSxnO4ozJEdgFQoI79/u0pMxTZtgwKJ+QAbMwXhwvOAi0l
	+/5YByn85nQn91h7l2rb9mxzdaBiyv9Xpib8+YLSLRUa4tNE/8dGfuasU4+oCvHnVlUd
	091F018/8KbyU4Xm2iElC/wCyo0BsINfr1zRzAuYYj8Dl1BfhLUQb7+QExL7uyZBk1aB
	bGQLf5rntxLRUTmAWfUt+KwfytbA1829Qh5kS9//DEJXyQoCLrTMgC8JIf3jecJEHGDn
	MbmJSa175OpR5BP5b7dgEZnQMp2WDlmW7qNjCp82GHLL1EQjJS0BAcxb+z0FZmPexY3A
	3nDA==
X-Gm-Message-State: AMke39lupfzoNwbIPoLQfaXi9ciAa+rLMsLapZbI1QD+IyhnQEB24qzdPLTWkiLaVLv06A==
X-Received: by 10.99.163.2 with SMTP id s2mr8127398pge.43.1487313141668;
	Thu, 16 Feb 2017 22:32:21 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	89sm17074808pfo.40.2017.02.16.22.32.18
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 22:32:20 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Fri, 17 Feb 2017 12:01:51 +0530
Message-Id: <1487313115-9510-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v8 1/5] kernel: Add definitions for GICv3
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
X-TUID: ABZOQ87C4Cgq

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
index 2fb7859..1798c93 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -179,10 +179,22 @@ struct kvm_arch_memory_slot {
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

