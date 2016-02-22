Received: by 10.25.208.211 with SMTP id h202csp1391833lfg;
        Mon, 22 Feb 2016 13:06:07 -0800 (PST)
X-Received: by 10.140.179.216 with SMTP id z207mr40188215qhz.70.1456175167493;
        Mon, 22 Feb 2016 13:06:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n127si31123831qhb.71.2016.02.22.13.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxgE-0005Rz-T3
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:06:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxgB-0005Ly-Lm
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxgA-0004E6-DE
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:03 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXxg8-0004CT-Et; Mon, 22 Feb 2016 16:06:00 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx2t-0001Qf-20; Mon, 22 Feb 2016 20:25:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 20:25:17 +0000
Message-Id: <1456172720-12650-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Subject: [Qemu-arm] [RFC 2/5] kernel: Add definitions for GICv3 attributes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ntBs7X5zySaA

From: Pavel Fedin <p.fedin@samsung.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 linux-headers/asm-arm64/kvm.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index a2fd4d9..f76a90c 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -179,14 +179,14 @@ struct kvm_arch_memory_slot {
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
+			    KVM_REG_SIZE_U64 | KVM_REG_ARM64_SYSREG)
 
 #define KVM_REG_ARM_TIMER_CTL		ARM64_SYS_REG(3, 3, 14, 3, 1)
 #define KVM_REG_ARM_TIMER_CNT		ARM64_SYS_REG(3, 3, 14, 3, 2)
@@ -197,12 +197,21 @@ struct kvm_arch_memory_slot {
 #define KVM_DEV_ARM_VGIC_GRP_DIST_REGS	1
 #define KVM_DEV_ARM_VGIC_GRP_CPU_REGS	2
 #define   KVM_DEV_ARM_VGIC_CPUID_SHIFT	32
-#define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
+#define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
+#define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
+#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define   KVM_DEV_ARM_VGIC_SYSREG_MASK	(KVM_REG_ARM64_SYSREG_OP0_MASK | \
+					 KVM_REG_ARM64_SYSREG_OP1_MASK | \
+					 KVM_REG_ARM64_SYSREG_CRN_MASK | \
+					 KVM_REG_ARM64_SYSREG_CRM_MASK | \
+					 KVM_REG_ARM64_SYSREG_OP2_MASK)
+#define   KVM_DEV_ARM_VGIC_SYSREG(op0,op1,crn,crm,op2) \
+					__ARM64_SYS_REG(op0,op1,crn,crm,op2)
 
 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_TYPE_SHIFT		24
-- 
1.9.1

