Received: by 10.25.150.194 with SMTP id y185csp2539900lfd;
        Wed, 23 Nov 2016 04:40:01 -0800 (PST)
X-Received: by 10.200.52.4 with SMTP id u4mr2497056qtb.186.1479904801081;
        Wed, 23 Nov 2016 04:40:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si11875866qtw.163.2016.11.23.04.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 04:40:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9WqF-0007to-VN
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 07:39:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c9WqB-0007tS-Cl
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 07:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c9WqA-0005Bc-B7
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 07:39:55 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36801)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1c9WqA-0005Af-4F; Wed, 23 Nov 2016 07:39:54 -0500
Received: by mail-pg0-x242.google.com with SMTP id x23so1051563pgx.3;
	Wed, 23 Nov 2016 04:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BQxcNvGsJC/MyqrmMhtpB1zfDxa6GDbYO/hPw5HK/0c=;
	b=RfbbcnBP0IXfoSaPQe7pYJMBvMfkOokoaO2pFGkHjZDIAQ3Y+/D4t/HuwihATzt/Ys
	tC7J6DomkXK8t7zL0ahHxzbLgpDODjBYUsjdykVpvrA13opA/dLHofzOoYQoTNbUhgxK
	MerByyZPXwBIxNv3JQMQxiapeqTFoLo/+HMiu3CxbaiobiefkexYG4fw4jlY0UQPQAJS
	y9ZvcLBjut9L5JxnUBN61fMgV4ceVCLlSLMQ8pIKeoLP6NDSHlHi+Ky0WypnJpxftvtj
	VvwrTpJtuUx/jWuS9bP2ZtfvkSfbzLJkjyW6NLnwU09UpVI3v9nY5GDLdKNfZJOiSgFJ
	aIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BQxcNvGsJC/MyqrmMhtpB1zfDxa6GDbYO/hPw5HK/0c=;
	b=CUzfT4RlCn/TIUsy2Uj1AW0UcFVmsf8YMpEaaeYweMnmTeciAAGOZvZ8l6eE2BxskB
	fvO7d4j/8RJAO8RWErUFgJCDVQfXtXCh4++tmpCjDTzME3yFKxY1Gzj9ndJALgfyGcGR
	2G+ncMlbtYdmAyCWdyIbZsMl3iIreKPaL8mMeHX8g1U8Itahgrw5p54Um9AIfukvuF3w
	Iij03ANybeJyhao/vRT742guUvAnt3/UMZg3eoPNCk2irXwPRqBDrLpUx0tQ0vCSLQNN
	Qb1tPcgO5a0Eb4jNY5/0pAzcx8EtD49wByw8ZDv8zwlNcainuZs5+uF2ssm3Km35ZRcb
	1sQw==
X-Gm-Message-State: AKaTC03ow/2OO/Smnu3a/rQueVwKwlTePW/dA0A1HMlLqmQ1B3fagkyY3SyhBsGTqWfFdg==
X-Received: by 10.84.198.67 with SMTP id o61mr6183436pld.67.1479904792867;
	Wed, 23 Nov 2016 04:39:52 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	s65sm34818356pgb.25.2016.11.23.04.39.49
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 04:39:52 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed, 23 Nov 2016 18:09:21 +0530
Message-Id: <1479904764-15532-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v6 1/4] kernel: Add definitions for GICv3
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
Cc: vijay.kilari@gmail.com, marc.zyngier@arm.com, p.fedin@samsung.com,
	qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lWt1ZMwxxlGD

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Vijaya Kumamr K <Vijaya.Kumar@cavium.com>
---
 linux-headers/asm-arm/kvm.h   | 13 +++++++++++++
 linux-headers/asm-arm64/kvm.h | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 541268c..e3dd0e1 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -172,10 +172,23 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
+                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL       4
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
+                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
+#define VGIC_LEVEL_INFO_LINE_LEVEL     0
+
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT    0
 
 /* KVM_IRQ_LINE irq field index values */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index fd5a276..6698bdd 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -201,10 +201,23 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
+#define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
+                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
+                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
+#define VGIC_LEVEL_INFO_LINE_LEVEL	0
+
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
 
 /* Device Control API on vcpu fd */
-- 
1.9.1

