Received: by 10.25.21.156 with SMTP id 28csp1645056lfv;
        Tue, 26 Jul 2016 04:02:44 -0700 (PDT)
X-Received: by 10.129.50.213 with SMTP id y204mr19107785ywy.136.1469530964057;
        Tue, 26 Jul 2016 04:02:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66si137541qks.102.2016.07.26.04.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 04:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS08I-0008Ej-FU
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 07:02:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bS08E-0008E0-Dh
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:02:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bS083-0002pi-AW
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:02:37 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bS083-0002pT-3Z; Tue, 26 Jul 2016 07:02:27 -0400
Received: by mail-pf0-x241.google.com with SMTP id h186so13691254pfg.2;
	Tue, 26 Jul 2016 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qdu52dxxuaYe0bndnPIaer0NANtdZwpFxhrrg9A3FGw=;
	b=dtoNGE+m0n7J+p5YptuR0Li0KoG8vV4ahIHO25wE0kn79YxVLx9bAgnSjrlZpuUmHP
	h1dRBLI4ByD4HlwtyE8YjjDtmHvkd1sZ2bx8FkJwhL/Bll35Q27rgm9TnTnHK/DHK1vh
	WQes5AmpVbmpA+iM3r0i8U6I9UsWmsQO3hkk1P0/4pJBdX72RZ0BvQ6DcirSMW4t6crZ
	PvcJCnuaWBcmNSC4Qt7ARqAALIA9GNp6FofJQWUrRuCIvFOHxhrj7+CvZRUKLY38Ru+o
	kLcRZvN2mtGDvrFK7e0wEfdXWeYyYWvTh4NR0V4PYj26Ja9Qc+fcm0n7p5TpKdV1cu4F
	wN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qdu52dxxuaYe0bndnPIaer0NANtdZwpFxhrrg9A3FGw=;
	b=M9tbxTriKp6NtvHd1GAjASJyYGj4walbvDzdn9KSiIOqQQC77JtiAZd92dQ+0Q4S3W
	rHmM8ePRKRaAC5ii/EMsdj2DEij+sK9FXLhX1KsU3dbVfn8y5+5vpU5YVb6XvVPzBqTq
	HBz/AkPbau2B/LfN50gUzRLCAVAsfFV+VADLoW/Q7dZP3R0x7NXpotITsWygsyMil4hS
	ByS9kFNn5Y5MWUmF4gIniv1frZR/XtzlQf3BwtCKODVbWOsbMwu0zEUQWoiFc6hoepaB
	jyh9fwj97oJ2mY8Ft69JgVpXogtoaKBvHPDqTTOdePlHIjsrQXz4TKz+ep8juULpBzBy
	CaXA==
X-Gm-Message-State: AEkoousSoOx6YWcvgpPTWCozaw0PlRg0ZTqhLMLqC6x3jxKDG2CPs3xqhpH4+dhB38+wDA==
X-Received: by 10.98.19.214 with SMTP id 83mr38657630pft.117.1469530946319;
	Tue, 26 Jul 2016 04:02:26 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm584826pat.27.2016.07.26.04.02.23
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 04:02:25 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Tue, 26 Jul 2016 16:31:55 +0530
Message-Id: <1469530917-13842-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1469530917-13842-1-git-send-email-vijay.kilari@gmail.com>
References: <1469530917-13842-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [RFC PATCH v1 1/2] kernel: Add definitions for GICv3
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
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F/+PI2Q7fIca

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 linux-headers/asm-arm64/kvm.h |   22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..9a21242 100644
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
@@ -197,12 +197,24 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_ADDR	0
 #define KVM_DEV_ARM_VGIC_GRP_DIST_REGS	1
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
+#define   KVM_DEV_ARM_VGIC_64BIT        (1ULL << 63)
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
-#define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_CPUID_MASK	\
+                              (0xffffffffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
-#define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
+#define   KVM_DEV_ARM_VGIC_OFFSET_MASK	\
+                              (0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
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
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
 
 /* Device Control API on vcpu fd */
-- 
1.7.9.5

