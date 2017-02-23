Received: by 10.25.0.147 with SMTP id 141csp169920lfa;
        Thu, 23 Feb 2017 04:13:23 -0800 (PST)
X-Received: by 10.200.33.194 with SMTP id 2mr17114124qtz.284.1487852003810;
        Thu, 23 Feb 2017 04:13:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si3160608qkh.5.2017.02.23.04.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 04:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgsGv-0007Va-3K
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 07:13:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgs9o-00081z-Qg
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 07:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgrw1-0004Zg-2l
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 06:51:46 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:36803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cgrvz-0004ZF-HT; Thu, 23 Feb 2017 06:51:43 -0500
Received: by mail-pg0-x244.google.com with SMTP id z128so4336950pgb.3;
	Thu, 23 Feb 2017 03:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j8tbZ9viiD4TSkdGgc+2JXm2ns12/XmSBv3lmqM8OLI=;
	b=RaI0K5QIlQaTrZwCeODpN3EeiWOC0uUcwVLsWNdOk2t+kjNJCw0LD3Nb9rwz5r51om
	lIV12tTeynZjiNUtvOM/23s3ZwvoAZBRDpF1idfMbYx24Y9+7fA3W9P/URxpJpQ9cGOJ
	KMnGG3lYmENfcpzzLe4wo2IC16es0tCthZd78RFhmpCN19CJLET/MFb4icjH4egcVEAw
	RQgBoZUOklXavJr1hwtDpr+1zZEpxIyPDPYFuhZmLGzKa3dZ8ia6JO9wFUCWvRr13/DD
	s5l3czVZHH5Sybbl2lrSgQGloCHFl4i8aDuEleFTX/6dXYx5bT0x9lbuiBbm8q/lb+tc
	afog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j8tbZ9viiD4TSkdGgc+2JXm2ns12/XmSBv3lmqM8OLI=;
	b=YtU/6Tqlsw4ZNHXD7IDXwt6IvaqJ5HMddzxiooygleI2IttZ9Qwr2DKOj9TCJCoIlq
	JnUaBHb5lpKSEBT5E4qLnqrQW9oKii1JvmIajyAyo28Y902nwT+WbFAQXljz9vZalEhL
	DJd0TzNKVPAku9DxXd1vktVbI/GJrH45KH2WWvlxuzT2xLqnYRcOl/LEN+HNUVTJqHL5
	l48Ykh9HbVUg13rV3EvvApLR0u+xq41j4LPLDTTcpkOII4CaqFMM72dwtezOeJMTUbFm
	6dhVXjurpP7AQlyol9rsnPwA3PtaHFLIiEG+K6oCqfsAYH8SQKiKh31j9R25sDTNdWVK
	W4xw==
X-Gm-Message-State: AMke39nlzl+De8up3KgEAR7gBGRMI7xzYK+4XVQgvjDWp7PzvgnuZRLiCarw99K2AuQTrg==
X-Received: by 10.99.1.20 with SMTP id 20mr47926594pgb.53.1487850702575;
	Thu, 23 Feb 2017 03:51:42 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm9462026pfg.53.2017.02.23.03.51.38
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 03:51:42 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Thu, 23 Feb 2017 17:21:09 +0530
Message-Id: <1487850673-26455-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [PATCH v9 1/5] kernel: Add definitions for GICv3
 attributes
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
X-TUID: bVQXNMYc8WwH

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

