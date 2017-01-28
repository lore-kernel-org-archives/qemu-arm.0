Received: by 10.25.77.65 with SMTP id a62csp709171lfb;
        Sat, 28 Jan 2017 06:48:04 -0800 (PST)
X-Received: by 10.55.164.77 with SMTP id n74mr2421014qke.322.1485614884448;
        Sat, 28 Jan 2017 06:48:04 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id i128si5857063qkd.118.2017.01.28.06.48.04;
        Sat, 28 Jan 2017 06:48:04 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7B8EE4019A;
	Sat, 28 Jan 2017 09:47:49 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VK3jeXGDbREN; Sat, 28 Jan 2017 09:47:48 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 14F27401A1;
	Sat, 28 Jan 2017 09:47:48 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id D384D40194
 for <kvmarm@lists.cs.columbia.edu>; Sat, 28 Jan 2017 09:47:46 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fnqKLMoZkHD for <kvmarm@lists.cs.columbia.edu>;
 Sat, 28 Jan 2017 09:47:45 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 71F9C4018B
 for <kvmarm@lists.cs.columbia.edu>; Sat, 28 Jan 2017 09:47:45 -0500 (EST)
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
 (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B61653D958;
 Sat, 28 Jan 2017 14:47:59 +0000 (UTC)
Received: from hawk.localdomain (vpn1-5-52.ams2.redhat.com [10.36.5.52])
 by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 v0SElsTW017959
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 28 Jan 2017 09:47:57 -0500
Date: Sat, 28 Jan 2017 15:47:54 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [PATCH RFC 5/7] ARM64: KVM: Support cross type vCPU
Message-ID: <20170128144754.cl7pikdwxbw7ovwz@hawk.localdomain>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-6-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484559214-2248-6-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sat, 28 Jan 2017 14:48:00 +0000 (UTC)
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com,
 kvmarm@lists.cs.columbia.edu
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
X-TUID: t4wE3t27b+sv

On Mon, Jan 16, 2017 at 05:33:32PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Add a capability to tell userspace that KVM supports cross type vCPU.
> Add a cpu feature for userspace to set when it doesn't use host type
> vCPU and kvm_vcpu_preferred_target return the host MIDR register value
> so that userspace can check whether its requested vCPU type macthes the
> one of physical CPU and if so, KVM will not trap ID registers even
> though userspace doesn't specify -cpu host.
> Guest accesses MIDR through VPIDR_EL2 so we save/restore it no matter
> it's a cross type vCPU.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  arch/arm/kvm/arm.c                   | 10 ++++++++--
>  arch/arm64/include/asm/kvm_emulate.h |  3 +++
>  arch/arm64/include/asm/kvm_host.h    |  3 ++-
>  arch/arm64/include/uapi/asm/kvm.h    |  1 +
>  arch/arm64/kvm/guest.c               | 17 ++++++++++++++++-
>  arch/arm64/kvm/hyp/sysreg-sr.c       |  2 ++
>  include/uapi/linux/kvm.h             |  1 +
>  7 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
> index 1167678..bdceb19 100644
> --- a/arch/arm/kvm/arm.c
> +++ b/arch/arm/kvm/arm.c
> @@ -207,6 +207,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ARM_PSCI_0_2:
>  	case KVM_CAP_READONLY_MEM:
>  	case KVM_CAP_MP_STATE:
> +	case KVM_CAP_ARM_CROSS_VCPU:
>  		r = 1;
>  		break;
>  	case KVM_CAP_COALESCED_MMIO:
> @@ -809,8 +810,9 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  {
>  	unsigned int i;
>  	int phys_target = kvm_target_cpu();
> +	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
>  
> -	if (init->target != phys_target)
> +	if (!cross_vcpu && init->target != phys_target)
>  		return -EINVAL;

I'm not sure we need the vcpu feature bit. I think qemu should be
allowed to try any target (if using -cpu host it will try the
kvm preferred target). kvm should check that the input target is
a known target and that it is compatible with the phys_target,
otherwise -EINVAL.

>  
>  	/*
> @@ -839,7 +841,11 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  			set_bit(i, vcpu->arch.features);
>  	}
>  
> -	vcpu->arch.target = phys_target;
> +	if (!cross_vcpu)
> +		vcpu->arch.target = phys_target;
> +	else
> +		/* Use generic ARMv8 target for cross type vcpu. */
> +		vcpu->arch.target = KVM_ARM_TARGET_GENERIC_V8;

We want to be able to select a specific target type. So, if
init->target is approved by kvm's checking, then this should
just be 
 vcpu->arch.target = init->target

If, for starters, we only want to support preferred and generic,
then kvm's check is easy
 init->target == phys_target || init->target == KVM_ARM_TARGET_GENERIC_V8

>  
>  	/* Now we know what it is, we can reset it. */
>  	return kvm_reset_vcpu(vcpu);
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index f5ea0ba..bca7d3a 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -49,6 +49,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>  		vcpu->arch.hcr_el2 |= HCR_E2H;
>  	if (test_bit(KVM_ARM_VCPU_EL1_32BIT, vcpu->arch.features))
>  		vcpu->arch.hcr_el2 &= ~HCR_RW;
> +	if (test_bit(KVM_ARM_VCPU_CROSS, vcpu->arch.features))
> +		/* TODO: Set HCR_TID2 and trap cache registers */
> +		vcpu->arch.hcr_el2 |= HCR_TID3 | HCR_TID1 | HCR_TID0;

We could optimize this a bit. For each set_one_reg of an ID register
we can check if it matches the host. If it doesn't then we flag that
we'll need that register's group trap enabled (but not the other two
groups). Here we'll then only enable traps for the necessary groups.
Maybe there's little chance that we won't always need all three
though...

>  }
>  
>  static inline unsigned long vcpu_get_hcr(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 6034f92..d0073d7 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -41,10 +41,11 @@
>  
>  #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
>  
> -#define KVM_VCPU_MAX_FEATURES 4
> +#define KVM_VCPU_MAX_FEATURES 5
>  
>  #define KVM_REQ_VCPU_EXIT	8
>  
> +bool kvm_vcpu_has_feature_cross_cpu(const struct kvm_vcpu_init *init);
>  int __attribute_const__ kvm_target_cpu(void);
>  int kvm_reset_vcpu(struct kvm_vcpu *vcpu);
>  int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm, long ext);
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 3051f86..7ba7117 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -97,6 +97,7 @@ struct kvm_regs {
>  #define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
>  #define KVM_ARM_VCPU_PSCI_0_2		2 /* CPU uses PSCI v0.2 */
>  #define KVM_ARM_VCPU_PMU_V3		3 /* Support guest PMUv3 */
> +#define KVM_ARM_VCPU_CROSS		4 /* Support cross type vCPU */
>  
>  struct kvm_vcpu_init {
>  	__u32 target;
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 92abe2b..4a5ccab 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -308,8 +308,15 @@ int __attribute_const__ kvm_target_cpu(void)
>  	return KVM_ARM_TARGET_GENERIC_V8;
>  }
>  
> +bool kvm_vcpu_has_feature_cross_cpu(const struct kvm_vcpu_init *init)
> +{
> +	return init->features[KVM_ARM_VCPU_CROSS / 32] &
> +	       (1 << (KVM_ARM_VCPU_CROSS % 32));
> +}
> +
>  int kvm_vcpu_preferred_target(struct kvm_vcpu_init *init)
>  {
> +	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
>  	int target = kvm_target_cpu();
>  
>  	if (target < 0)
> @@ -323,7 +330,15 @@ int kvm_vcpu_preferred_target(struct kvm_vcpu_init *init)
>  	 * specific features available for the preferred
>  	 * target type.
>  	 */
> -	init->target = (__u32)target;
> +	/* If userspace wants a cross type vcpu other that host, here we return
> +	 * the midr for userspace to check whether the midr value of requeseted
> +	 * vcpu matches the one of host. If they match, we will not trap CPU ID
> +	 * registers even though userspace doesn't specify -cpu host.
> +	 */
> +	if (cross_vcpu)
> +		init->target = read_cpuid_id();
> +	else
> +		init->target = (__u32)target;

This is an API change, so would need a doc update too, but I don't
think it's necessary. kvm can do the checking, it has both the
requested target and the phys target available for comparing. Why
make userspace do it?

>  
>  	return 0;
>  }
> diff --git a/arch/arm64/kvm/hyp/sysreg-sr.c b/arch/arm64/kvm/hyp/sysreg-sr.c
> index 9341376..9461829 100644
> --- a/arch/arm64/kvm/hyp/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/sysreg-sr.c
> @@ -45,6 +45,7 @@ static void __hyp_text __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
>  
>  static void __hyp_text __sysreg_save_state(struct kvm_cpu_context *ctxt)
>  {
> +	ctxt->id_sys_regs[MIDR_EL1]     = read_sysreg(vpidr_el2);
>  	ctxt->sys_regs[MPIDR_EL1]	= read_sysreg(vmpidr_el2);
>  	ctxt->sys_regs[CSSELR_EL1]	= read_sysreg(csselr_el1);
>  	ctxt->sys_regs[SCTLR_EL1]	= read_sysreg_el1(sctlr);
> @@ -98,6 +99,7 @@ static void __hyp_text __sysreg_restore_common_state(struct kvm_cpu_context *ctx
>  
>  static void __hyp_text __sysreg_restore_state(struct kvm_cpu_context *ctxt)
>  {
> +	write_sysreg(ctxt->id_sys_regs[MIDR_EL1],       vpidr_el2);
>  	write_sysreg(ctxt->sys_regs[MPIDR_EL1],		vmpidr_el2);
>  	write_sysreg(ctxt->sys_regs[CSSELR_EL1],	csselr_el1);
>  	write_sysreg_el1(ctxt->sys_regs[SCTLR_EL1],	sctlr);
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index cac48ed..46115a2 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -871,6 +871,7 @@ struct kvm_ppc_smmu_info {
>  #define KVM_CAP_S390_USER_INSTR0 130
>  #define KVM_CAP_MSI_DEVID 131
>  #define KVM_CAP_PPC_HTM 132
> +#define KVM_CAP_ARM_CROSS_VCPU 133
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> -- 
> 2.0.4
> 
> 

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
