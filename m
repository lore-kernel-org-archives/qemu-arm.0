Received: by 10.25.208.137 with SMTP id h131csp1683136lfg;
        Mon, 9 May 2016 10:30:22 -0700 (PDT)
X-Received: by 10.140.102.140 with SMTP id w12mr35743831qge.6.1462815022132;
        Mon, 09 May 2016 10:30:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u184si19340280qhe.36.2016.05.09.10.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp0f-000407-L2
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:30:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0d-0003xf-K3
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0c-0000GR-CC
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0c-00005k-3I; Mon, 09 May 2016 13:30:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0O-0001WH-Gs; Mon, 09 May 2016 18:30:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:48 +0100
Message-Id: <1462814989-24360-23-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 22/23] NOT-FOR-UPSTREAM: kernel: Add definitions
 for GICv3 attributes
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8WO5eO2iVCoS

From: Pavel Fedin <p.fedin@samsung.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

FIXME: not-for-upstream

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 linux-headers/asm-arm64/kvm.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..c0924c4 100644
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
+			    KVM_REG_SIZE_U64 | KVM_REG_ARM64_SYSREG)
 
 #define KVM_REG_ARM_TIMER_CTL		ARM64_SYS_REG(3, 3, 14, 3, 1)
 #define KVM_REG_ARM_TIMER_CNT		ARM64_SYS_REG(3, 3, 14, 3, 2)
@@ -198,12 +198,21 @@ struct kvm_arch_memory_slot {
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
 
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
-- 
1.9.1

