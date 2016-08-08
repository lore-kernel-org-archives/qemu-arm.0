Received: by 10.25.21.156 with SMTP id 28csp102859lfv;
        Mon, 8 Aug 2016 09:51:53 -0700 (PDT)
X-Received: by 10.55.109.198 with SMTP id i189mr30685423qkc.73.1470675113388;
        Mon, 08 Aug 2016 09:51:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si20487452qtd.128.2016.08.08.09.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 09:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWnmK-0000vh-SC
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 12:51:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bWnmD-0000s9-P4
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bWnmB-0004Pj-Jx
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 12:51:44 -0400
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:35697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bWnmB-0004PD-CS; Mon, 08 Aug 2016 12:51:43 -0400
Received: by mail-pa0-x241.google.com with SMTP id cf3so24205908pad.2;
	Mon, 08 Aug 2016 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PENy2okzlmBdCyyFcbm1UBvpzFccco70MArKwTwOR3g=;
	b=hfLixDL2HFOteRDTgIBz/FxPoVGIXDzY87i93apEvFNUw/Kbe8GU6I0c9Hw6654Mab
	BIr34HbASt+XalID1WRTIHe8e12rh2QaNFfeWanZeEM2wHVuplSqarpZceAWWuJty6pu
	fjeBCEMTAvW4F8tchfjiPVE/+lY3/ZJBjL9WuLapUWuZdOiR6dLod3Yu9YRajJXgLL4I
	Zy83hUVsNxjJPfXrHBfeFgU0U/oKHW9ZKmF0ieUQJZYYkPWVCuPvXskMbaAJ7M35ULUi
	GsuLjrLWMqabF6dn/THjusFUqd46cwHrz0CPOJAMhsM2kH1SYJaP3ejT9N5BaLa9fwon
	f7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PENy2okzlmBdCyyFcbm1UBvpzFccco70MArKwTwOR3g=;
	b=elgNfbCPEZh/+8+WgY5GTM5WYt3DQEd/i6yVvFsuhjz7J6dgUYKQ920sngDUh7ASWl
	DKpK3RMlL3fp09DdMcNl0wOU9OtUaWqQHF9qkA9eEOyn9YvT1zVGIoeIhKs8eKzoKtrx
	SfI1J/kAImFXXgyCn9sCcqtp8gb5L+c1jTCV+QqX//JoVZ2KUrtw+1WvRf9JL6u/FleI
	4OmwZWGVd6EsDKTzNMUaHbbhaDYsAnWJ5wEU1ZyX0V+etAeSH76Ej76g6OkCdHmoadj+
	PCy0QyHwzfmhnupzo+nB5O1hJ9X6W7rCeoWW1gip+3pFllM4oc9BFWYNEWhNF3VmRp6y
	6+PQ==
X-Gm-Message-State: AEkoout2sB/UpdawKyF4VW3mxUcMjWW+O/QrbfqfMXUGUSLb6bpzxVHCpEm0mfd1WyWkKA==
X-Received: by 10.66.191.66 with SMTP id gw2mr122880524pac.153.1470675102488; 
	Mon, 08 Aug 2016 09:51:42 -0700 (PDT)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id 6sm40282916pab.11.2016.08.08.09.51.39
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:51:41 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Mon,  8 Aug 2016 22:21:10 +0530
Message-Id: <1470675071-23677-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
References: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Subject: [Qemu-arm] [RFC PATCH v2 1/2] kernel: Add definitions for GICv3
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
X-TUID: Iue65ccdH4hW

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This temporary patch adds kernel API definitions. Use proper header update
procedure after these features are released.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
---
 linux-headers/asm-arm64/kvm.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..396c6f3 100644
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
@@ -199,10 +199,21 @@ struct kvm_arch_memory_slot {
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
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
 
 /* Device Control API on vcpu fd */
-- 
1.9.1

