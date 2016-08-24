Received: by 10.25.21.156 with SMTP id 28csp273656lfv;
        Wed, 24 Aug 2016 04:26:01 -0700 (PDT)
X-Received: by 10.233.239.149 with SMTP id d143mr2935672qkg.176.1472037961356;
        Wed, 24 Aug 2016 04:26:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e2si5923831qkc.164.2016.08.24.04.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 04:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcWJk-0004De-RV
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 07:26:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcWJg-0004BM-J9
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcWJb-00057T-98
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:25:55 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bcWJb-00057P-3B; Wed, 24 Aug 2016 07:25:51 -0400
Received: by mail-pf0-f193.google.com with SMTP id h186so1072287pfg.2;
	Wed, 24 Aug 2016 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A9b4owYIBt7d1bfI5K8sEFWcwKp9V7mDoZsADEnyJLc=;
	b=njmkXWqxHvDY1grKcC2XNoPamCm/R3jGfyYzDzFg/rUh2cWYREgiAhCDyotIcV5Yvo
	5+5j4Q1P7g4ds+XXNt+favx52MUouZNmQOEVLKuw0bC8bJzfWOjpCv2NiV7JiuU8GQGf
	ZXm0MddQqZk6kus/rcmvuWNmfIwN4iNSWMIkVbzKdL/I41Gxi5QmwY2LPWY6UjAhcbLf
	bIMCW2j8GQPQcGCs2SVSWGL0kjsrkU74fI/E+XA2A4zoosDSYf0UAb/++rg5FYpIijml
	eWCLK7mG8D1LE9JVEjr2gSzoSogzG6tRibZn0jdofInvr8douB2Sh1c5mxYOTTtHENBL
	lGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A9b4owYIBt7d1bfI5K8sEFWcwKp9V7mDoZsADEnyJLc=;
	b=j0Z0STZO3LRmoyHD1UTq0StJgVmoEN8M/3CFXHfQx9CODcJlofVMZZ9v30ya+C0yo/
	czVz8ThxERsw8ZhsefuidErk+O0zrTcWpIWi74qIZnS6gSRBkTZXkCIhwYc2zzmwrG6p
	8j6N0yb0EmX36cR3J4NX16GUU4iVpcAzKzJpg6CuY/FK3qFNdrWKaSwLKxty5J7TfCD2
	0Bbq4mSWBx2Kv0fyul3CfeSNbeALlqPAbcEHai79yAmF9c/6Da79sKWl7C3VY/cK8I7j
	ZmVVeHQ9u16jxxBOwhXg+iYTaBJOcx4djuq494Y0ELy5HUF2ogJjcXz2gL3kp3q+kClM
	rG0Q==
X-Gm-Message-State: AE9vXwM5m2fSOq75h5r2Sh9n39hBMH4mnaBchgUyYPvztvXt5GoaMAJvc1mQeGIWw0hBMA==
X-Received: by 10.98.77.70 with SMTP id a67mr4602297pfb.151.1472037890533;
	Wed, 24 Aug 2016 04:24:50 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	p187sm12919193pfb.5.2016.08.24.04.24.47
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 04:24:50 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed, 24 Aug 2016 16:54:33 +0530
Message-Id: <1472037874-4356-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1472037874-4356-1-git-send-email-vijay.kilari@gmail.com>
References: <1472037874-4356-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.193
Subject: [Qemu-arm] [RFC PATCH v3 1/2] kernel: Add definitions for GICv3
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
Cc: p.fedin@samsung.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +0qb98Gk+gsB

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 linux-headers/asm-arm64/kvm.h | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..dd6c09a 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -180,14 +180,14 @@ struct kvm_arch_memory_slot {
 	KVM_REG_ARM64_SYSREG_ ## n ## _MASK)
 
 #define __ARM64_SYS_REG(op0,op1,crn,crm,op2) \
-	(KVM_REG_ARM64 | KVM_REG_ARM64_SYSREG | \
-	ARM64_SYS_REG_SHIFT_MASK(op0, OP0) | \
+	(ARM64_SYS_REG_SHIFT_MASK(op0, OP0) | \
 	ARM64_SYS_REG_SHIFT_MASK(op1, OP1) | \
 	ARM64_SYS_REG_SHIFT_MASK(crn, CRN) | \
 	ARM64_SYS_REG_SHIFT_MASK(crm, CRM) | \
 	ARM64_SYS_REG_SHIFT_MASK(op2, OP2))
 
-#define ARM64_SYS_REG(...) (__ARM64_SYS_REG(__VA_ARGS__) | KVM_REG_SIZE_U64)
+#define ARM64_SYS_REG(...) (__ARM64_SYS_REG(__VA_ARGS__) | KVM_REG_ARM64 | \
+                           KVM_REG_SIZE_U64 | KVM_REG_ARM64_SYSREG)
 
 #define KVM_REG_ARM_TIMER_CTL		ARM64_SYS_REG(3, 3, 14, 3, 1)
 #define KVM_REG_ARM_TIMER_CNT		ARM64_SYS_REG(3, 3, 14, 3, 2)
@@ -199,10 +199,28 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_V3_CPUID_MASK \
+                              (0xffffffffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_SYSREG_MASK (KVM_REG_ARM64_SYSREG_OP0_MASK | \
+                                        KVM_REG_ARM64_SYSREG_OP1_MASK | \
+                                        KVM_REG_ARM64_SYSREG_CRN_MASK | \
+                                        KVM_REG_ARM64_SYSREG_CRM_MASK | \
+                                        KVM_REG_ARM64_SYSREG_OP2_MASK)
+#define   KVM_DEV_ARM_VGIC_SYSREG(op0,op1,crn,crm,op2) \
+                                       __ARM64_SYS_REG(op0,op1,crn,crm,op2)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 9
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
+                       (0x7fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x1ff
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_VAL   1
+
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
 
 /* Device Control API on vcpu fd */
-- 
1.9.1

