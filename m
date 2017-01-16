Received: by 10.25.205.13 with SMTP id d13csp1291832lfg;
        Mon, 16 Jan 2017 01:35:55 -0800 (PST)
X-Received: by 10.55.153.198 with SMTP id b189mr7043308qke.79.1484559355056;
        Mon, 16 Jan 2017 01:35:55 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q7si13886963qtb.60.2017.01.16.01.35.54;
        Mon, 16 Jan 2017 01:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A53CE40537;
	Mon, 16 Jan 2017 04:34:03 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2g27izXs9ysv; Mon, 16 Jan 2017 04:34:01 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 03EA9405D5;
	Mon, 16 Jan 2017 04:33:51 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 13E44406BB
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:49 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEUZwNP+Tu-5 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:33:40 -0500 (EST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8736540019
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:33:36 -0500 (EST)
Received: from 172.24.1.36 (EHLO SZXEML424-HUB.china.huawei.com)
 ([172.24.1.36])
 by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DTK49617; Mon, 16 Jan 2017 17:34:58 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:34:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH RFC 5/7] ARM64: KVM: Support cross type vCPU
Date: Mon, 16 Jan 2017 17:33:32 +0800
Message-ID: <1484559214-2248-6-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090201.587C93C3.00D4, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3cb719402403c9356298ccd96702e46b
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 4XUHctWjdr3l

From: Shannon Zhao <shannon.zhao@linaro.org>

Add a capability to tell userspace that KVM supports cross type vCPU.
Add a cpu feature for userspace to set when it doesn't use host type
vCPU and kvm_vcpu_preferred_target return the host MIDR register value
so that userspace can check whether its requested vCPU type macthes the
one of physical CPU and if so, KVM will not trap ID registers even
though userspace doesn't specify -cpu host.
Guest accesses MIDR through VPIDR_EL2 so we save/restore it no matter
it's a cross type vCPU.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 arch/arm/kvm/arm.c                   | 10 ++++++++--
 arch/arm64/include/asm/kvm_emulate.h |  3 +++
 arch/arm64/include/asm/kvm_host.h    |  3 ++-
 arch/arm64/include/uapi/asm/kvm.h    |  1 +
 arch/arm64/kvm/guest.c               | 17 ++++++++++++++++-
 arch/arm64/kvm/hyp/sysreg-sr.c       |  2 ++
 include/uapi/linux/kvm.h             |  1 +
 7 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
index 1167678..bdceb19 100644
--- a/arch/arm/kvm/arm.c
+++ b/arch/arm/kvm/arm.c
@@ -207,6 +207,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PSCI_0_2:
 	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_MP_STATE:
+	case KVM_CAP_ARM_CROSS_VCPU:
 		r = 1;
 		break;
 	case KVM_CAP_COALESCED_MMIO:
@@ -809,8 +810,9 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 {
 	unsigned int i;
 	int phys_target = kvm_target_cpu();
+	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
 
-	if (init->target != phys_target)
+	if (!cross_vcpu && init->target != phys_target)
 		return -EINVAL;
 
 	/*
@@ -839,7 +841,11 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 			set_bit(i, vcpu->arch.features);
 	}
 
-	vcpu->arch.target = phys_target;
+	if (!cross_vcpu)
+		vcpu->arch.target = phys_target;
+	else
+		/* Use generic ARMv8 target for cross type vcpu. */
+		vcpu->arch.target = KVM_ARM_TARGET_GENERIC_V8;
 
 	/* Now we know what it is, we can reset it. */
 	return kvm_reset_vcpu(vcpu);
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index f5ea0ba..bca7d3a 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -49,6 +49,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcr_el2 |= HCR_E2H;
 	if (test_bit(KVM_ARM_VCPU_EL1_32BIT, vcpu->arch.features))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
+	if (test_bit(KVM_ARM_VCPU_CROSS, vcpu->arch.features))
+		/* TODO: Set HCR_TID2 and trap cache registers */
+		vcpu->arch.hcr_el2 |= HCR_TID3 | HCR_TID1 | HCR_TID0;
 }
 
 static inline unsigned long vcpu_get_hcr(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 6034f92..d0073d7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -41,10 +41,11 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 4
+#define KVM_VCPU_MAX_FEATURES 5
 
 #define KVM_REQ_VCPU_EXIT	8
 
+bool kvm_vcpu_has_feature_cross_cpu(const struct kvm_vcpu_init *init);
 int __attribute_const__ kvm_target_cpu(void);
 int kvm_reset_vcpu(struct kvm_vcpu *vcpu);
 int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm, long ext);
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 3051f86..7ba7117 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -97,6 +97,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
 #define KVM_ARM_VCPU_PSCI_0_2		2 /* CPU uses PSCI v0.2 */
 #define KVM_ARM_VCPU_PMU_V3		3 /* Support guest PMUv3 */
+#define KVM_ARM_VCPU_CROSS		4 /* Support cross type vCPU */
 
 struct kvm_vcpu_init {
 	__u32 target;
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 92abe2b..4a5ccab 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -308,8 +308,15 @@ int __attribute_const__ kvm_target_cpu(void)
 	return KVM_ARM_TARGET_GENERIC_V8;
 }
 
+bool kvm_vcpu_has_feature_cross_cpu(const struct kvm_vcpu_init *init)
+{
+	return init->features[KVM_ARM_VCPU_CROSS / 32] &
+	       (1 << (KVM_ARM_VCPU_CROSS % 32));
+}
+
 int kvm_vcpu_preferred_target(struct kvm_vcpu_init *init)
 {
+	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
 	int target = kvm_target_cpu();
 
 	if (target < 0)
@@ -323,7 +330,15 @@ int kvm_vcpu_preferred_target(struct kvm_vcpu_init *init)
 	 * specific features available for the preferred
 	 * target type.
 	 */
-	init->target = (__u32)target;
+	/* If userspace wants a cross type vcpu other that host, here we return
+	 * the midr for userspace to check whether the midr value of requeseted
+	 * vcpu matches the one of host. If they match, we will not trap CPU ID
+	 * registers even though userspace doesn't specify -cpu host.
+	 */
+	if (cross_vcpu)
+		init->target = read_cpuid_id();
+	else
+		init->target = (__u32)target;
 
 	return 0;
 }
diff --git a/arch/arm64/kvm/hyp/sysreg-sr.c b/arch/arm64/kvm/hyp/sysreg-sr.c
index 9341376..9461829 100644
--- a/arch/arm64/kvm/hyp/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/sysreg-sr.c
@@ -45,6 +45,7 @@ static void __hyp_text __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 
 static void __hyp_text __sysreg_save_state(struct kvm_cpu_context *ctxt)
 {
+	ctxt->id_sys_regs[MIDR_EL1]     = read_sysreg(vpidr_el2);
 	ctxt->sys_regs[MPIDR_EL1]	= read_sysreg(vmpidr_el2);
 	ctxt->sys_regs[CSSELR_EL1]	= read_sysreg(csselr_el1);
 	ctxt->sys_regs[SCTLR_EL1]	= read_sysreg_el1(sctlr);
@@ -98,6 +99,7 @@ static void __hyp_text __sysreg_restore_common_state(struct kvm_cpu_context *ctx
 
 static void __hyp_text __sysreg_restore_state(struct kvm_cpu_context *ctxt)
 {
+	write_sysreg(ctxt->id_sys_regs[MIDR_EL1],       vpidr_el2);
 	write_sysreg(ctxt->sys_regs[MPIDR_EL1],		vmpidr_el2);
 	write_sysreg(ctxt->sys_regs[CSSELR_EL1],	csselr_el1);
 	write_sysreg_el1(ctxt->sys_regs[SCTLR_EL1],	sctlr);
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index cac48ed..46115a2 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -871,6 +871,7 @@ struct kvm_ppc_smmu_info {
 #define KVM_CAP_S390_USER_INSTR0 130
 #define KVM_CAP_MSI_DEVID 131
 #define KVM_CAP_PPC_HTM 132
+#define KVM_CAP_ARM_CROSS_VCPU 133
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
