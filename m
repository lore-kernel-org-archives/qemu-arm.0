Received: by 10.25.77.4 with SMTP id a4csp444543lfb;
        Thu, 9 Mar 2017 07:21:53 -0800 (PST)
X-Received: by 10.237.37.197 with SMTP id y5mr14408041qtc.168.1489072913778;
        Thu, 09 Mar 2017 07:21:53 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id j25si5846899qtc.327.2017.03.09.07.21.53;
        Thu, 09 Mar 2017 07:21:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BD05140B3E;
	Thu,  9 Mar 2017 10:20:27 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z02y7DOY5b4f; Thu,  9 Mar 2017 10:20:26 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BD5FB40B58;
	Thu,  9 Mar 2017 10:20:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4B57C40AF9
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 10:20:26 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plKLfi+m5rtn for <kvmarm@lists.cs.columbia.edu>;
 Thu,  9 Mar 2017 10:20:22 -0500 (EST)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B804C40AE8
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 10:20:22 -0500 (EST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7212713D5;
 Thu,  9 Mar 2017 07:21:47 -0800 (PST)
Received: from [10.1.206.28] (e107814-lin.cambridge.arm.com [10.1.206.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55EE63F220;
 Thu,  9 Mar 2017 07:21:46 -0800 (PST)
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
To: Andrew Jones <drjones@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
 <20170128145551.sknp447ieue56xgo@hawk.localdomain>
From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Message-ID: <ee72bba1-65a6-d0c4-7f71-79d707a62ed2@arm.com>
Date: Thu, 9 Mar 2017 15:21:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170128145551.sknp447ieue56xgo@hawk.localdomain>
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 wu.wubin@huawei.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: PA7kPamGZyXL

On 28/01/17 14:55, Andrew Jones wrote:
> On Mon, Jan 16, 2017 at 05:33:33PM +0800, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> When initializing KVM, check whether physical hardware is a
>> heterogeneous system through the MIDR values. If so, force userspace to
>> set the KVM_ARM_VCPU_CROSS feature bit. Otherwise, it should fail to
>> initialize VCPUs.
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>>  arch/arm/kvm/arm.c       | 26 ++++++++++++++++++++++++++
>>  include/uapi/linux/kvm.h |  1 +
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/arch/arm/kvm/arm.c b/arch/arm/kvm/arm.c
>> index bdceb19..21ec070 100644
>> --- a/arch/arm/kvm/arm.c
>> +++ b/arch/arm/kvm/arm.c
>> @@ -46,6 +46,7 @@
>>  #include <asm/kvm_coproc.h>
>>  #include <asm/kvm_psci.h>
>>  #include <asm/sections.h>
>> +#include <asm/cputype.h>
>>
>>  #ifdef REQUIRES_VIRT
>>  __asm__(".arch_extension	virt");
>> @@ -65,6 +66,7 @@ static unsigned int kvm_vmid_bits __read_mostly;
>>  static DEFINE_SPINLOCK(kvm_vmid_lock);
>>
>>  static bool vgic_present;
>> +static bool heterogeneous_system;
>>
>>  static DEFINE_PER_CPU(unsigned char, kvm_arm_hardware_enabled);
>>
>> @@ -210,6 +212,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  	case KVM_CAP_ARM_CROSS_VCPU:
>>  		r = 1;
>>  		break;
>> +	case KVM_CAP_ARM_HETEROGENEOUS:
>> +		r = heterogeneous_system;
>> +		break;
>
> What's this for? When/why would usespace check it?
>
>>  	case KVM_CAP_COALESCED_MMIO:
>>  		r = KVM_COALESCED_MMIO_PAGE_OFFSET;
>>  		break;
>> @@ -812,6 +817,12 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>>  	int phys_target = kvm_target_cpu();
>>  	bool cross_vcpu = kvm_vcpu_has_feature_cross_cpu(init);
>>
>> +	if (heterogeneous_system && !cross_vcpu) {
>> +		kvm_err("%s:Host is a heterogeneous system, set KVM_ARM_VCPU_CROSS bit\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	}
>
> Instead of forcing userspace to set a bit, why not just confirm the
> target selected will work? E.g. if only generic works on a heterogeneous
> system then just
>
>  if (heterogeneous_system && init->target != GENERIC)
>     return -EINVAL
>
> should work
>
>> +
>>  	if (!cross_vcpu && init->target != phys_target)
>>  		return -EINVAL;
>>
>> @@ -1397,6 +1408,11 @@ static void check_kvm_target_cpu(void *ret)
>>  	*(int *)ret = kvm_target_cpu();
>>  }
>>
>> +static void get_physical_cpu_midr(void *midr)
>> +{
>> +	*(u32 *)midr = read_cpuid_id();
>> +}
>> +
>>  struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr)
>>  {
>>  	struct kvm_vcpu *vcpu;
>> @@ -1417,6 +1433,7 @@ int kvm_arch_init(void *opaque)
>>  {
>>  	int err;
>>  	int ret, cpu;
>> +	u32 current_midr, midr;
>>
>>  	if (!is_hyp_mode_available()) {
>>  		kvm_err("HYP mode not available\n");
>> @@ -1431,6 +1448,15 @@ int kvm_arch_init(void *opaque)
>>  		}
>>  	}
>>
>> +	current_midr = read_cpuid_id();
>> +	for_each_online_cpu(cpu) {
>> +		smp_call_function_single(cpu, get_physical_cpu_midr, &midr, 1);
>> +		if (current_midr != midr) {
>> +			heterogeneous_system = true;
>> +			break;
>> +		}
>> +	}
>
> Is there no core kernel API that provides this?

On arm64, there is a per-cpu cpuinfo structure kept for each online CPU, which keeps
cached values of the ID registers. May be we could use that here.
See arch/arm64/kernel/cpuinfo.c::__cpuinfo_store_cpu()

Suzuki

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
