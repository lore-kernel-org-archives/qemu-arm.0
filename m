Received: by 10.25.77.65 with SMTP id a62csp711363lfb;
        Sat, 28 Jan 2017 06:55:59 -0800 (PST)
X-Received: by 10.200.43.201 with SMTP id n9mr13395104qtn.243.1485615359584;
        Sat, 28 Jan 2017 06:55:59 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 53si5856284qtx.279.2017.01.28.06.55.59;
        Sat, 28 Jan 2017 06:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C55504018B;
	Sat, 28 Jan 2017 09:55:44 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgRKkX-K4oTV; Sat, 28 Jan 2017 09:55:43 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D947F401A1;
	Sat, 28 Jan 2017 09:55:43 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4C6CD4018B
 for <kvmarm@lists.cs.columbia.edu>; Sat, 28 Jan 2017 09:55:43 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mc6UXj12WgSd for <kvmarm@lists.cs.columbia.edu>;
 Sat, 28 Jan 2017 09:55:42 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 2B49440187
 for <kvmarm@lists.cs.columbia.edu>; Sat, 28 Jan 2017 09:55:41 -0500 (EST)
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
 (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95B97811A7;
 Sat, 28 Jan 2017 14:55:56 +0000 (UTC)
Received: from hawk.localdomain (vpn1-5-52.ams2.redhat.com [10.36.5.52])
 by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 v0SEtp37029283
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 28 Jan 2017 09:55:54 -0500
Date: Sat, 28 Jan 2017 15:55:51 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Message-ID: <20170128145551.sknp447ieue56xgo@hawk.localdomain>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 28 Jan 2017 14:55:56 +0000 (UTC)
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
X-TUID: 43WgazFKbKoE

On Mon, Jan 16, 2017 at 05:33:33PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> When initializing KVM, check whether physical hardware is a
> heterogeneous system through the MIDR values. If so, force userspace to
> set the KVM_ARM_VCPU_CROSS feature bit. Otherwise, it should fail to
> initialize VCPUs.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  arch/arm/kvm/arm.c       | 26 ++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
> index bdceb19..21ec070 100644
> --- a/arch/arm/kvm/arm.c
> +++ b/arch/arm/kvm/arm.c
> @@ -46,6 +46,7 @@
>  #include <asm/kvm_coproc.h>
>  #include <asm/kvm_psci.h>
>  #include <asm/sections.h>
> +#include <asm/cputype.h>
>  
>  #ifdef REQUIRES_VIRT
>  __asm__(".arch_extension	virt");
> @@ -65,6 +66,7 @@ static unsigned int kvm_vmid_bits __read_mostly;
>  static DEFINE_SPINLOCK(kvm_vmid_lock);
>  
>  static bool vgic_present;
> +static bool heterogeneous_system;
>  
>  static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
>  
> @@ -210,6 +212,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ARM_CROSS_VCPU:
>  		r = 1;
>  		break;
> +	case KVM_CAP_ARM_HETEROGENEOUS:
> +		r = heterogeneous_system;
> +		break;

What's this for? When/why would usespace check it?

>  	case KVM_CAP_COALESCED_MMIO:
>  		r = KVM_COALESCED_MMIO_PAGE_OFFSET;
>  		break;
> @@ -812,6 +817,12 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  	int phys_target = kvm_target_cpu();
>  	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
>  
> +	if (heterogeneous_system && !cross_vcpu) {
> +		kvm_err("%s:Host is a heterogeneous system, set KVM_ARM_VCPU_CROSS bit\n",
> +			__func__);
> +		return -EINVAL;
> +	}

Instead of forcing userspace to set a bit, why not just confirm the
target selected will work? E.g. if only generic works on a heterogeneous
system then just 

 if (heterogeneous_system && init->target != GENERIC)
    return -EINVAL

should work

> +
>  	if (!cross_vcpu && init->target != phys_target)
>  		return -EINVAL;
>  
> @@ -1397,6 +1408,11 @@ static void check_kvm_target_cpu(void *ret)
>  	*(int *)ret = kvm_target_cpu();
>  }
>  
> +static void get_physical_cpu_midr(void *midr)
> +{
> +	*(u32 *)midr = read_cpuid_id();
> +}
> +
>  struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr)
>  {
>  	struct kvm_vcpu *vcpu;
> @@ -1417,6 +1433,7 @@ int kvm_arch_init(void *opaque)
>  {
>  	int err;
>  	int ret, cpu;
> +	u32 current_midr, midr;
>  
>  	if (!is_hyp_mode_available()) {
>  		kvm_err("HYP mode not available\n");
> @@ -1431,6 +1448,15 @@ int kvm_arch_init(void *opaque)
>  		}
>  	}
>  
> +	current_midr = read_cpuid_id();
> +	for_each_online_cpu(cpu) {
> +		smp_call_function_single(cpu, get_physical_cpu_midr, &midr, 1);
> +		if (current_midr != midr) {
> +			heterogeneous_system = true;
> +			break;
> +		}
> +	}

Is there no core kernel API that provides this?

> +
>  	err = init_common_resources();
>  	if (err)
>  		return err;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 46115a2..cc2b63d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -872,6 +872,7 @@ struct kvm_ppc_smmu_info {
>  #define KVM_CAP_MSI_DEVID 131
>  #define KVM_CAP_PPC_HTM 132
>  #define KVM_CAP_ARM_CROSS_VCPU 133
> +#define KVM_CAP_ARM_HETEROGENEOUS 134
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> -- 
> 2.0.4
> 
>

drew 
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
