Received: by 10.25.0.198 with SMTP id 189csp246678lfa;
        Tue, 2 May 2017 04:13:13 -0700 (PDT)
X-Received: by 10.200.35.73 with SMTP id b9mr25667962qtb.268.1493723593225;
        Tue, 02 May 2017 04:13:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si16982288qtf.37.2017.05.02.04.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 May 2017 04:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5Vk0-0000gC-OD
	for alex.bennee@linaro.org; Tue, 02 May 2017 07:13:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1d5Vjt-0000g5-Gu
	for qemu-arm@nongnu.org; Tue, 02 May 2017 07:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1d5Vjp-0004z7-IM
	for qemu-arm@nongnu.org; Tue, 02 May 2017 07:13:05 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1d5Vjo-0004uJ-Vc; Tue, 02 May 2017 07:13:01 -0400
Received: from 172.30.72.56 (EHLO DGGEML404-HUB.china.huawei.com)
	([172.30.72.56])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AMU58949; Tue, 02 May 2017 19:06:05 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML404-HUB.china.huawei.com
	(10.3.17.39) with Microsoft SMTP Server id 14.3.301.0; Tue, 2 May 2017
	19:05:51 +0800
To: Christoffer Dall <cdall@linaro.org>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
	<20170502075631.GE16940@cbox>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c56b7b8f-3fa6-ed03-acb2-a2af1fcd5237@huawei.com>
Date: Tue, 2 May 2017 19:05:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170502075631.GE16940@cbox>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.59086820.0301, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 29ff11dbc02fc2cfc505e5889d3955c1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [PATCH v3 1/3] arm64: kvm: support kvmtool to detect
 RAS extension feature
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
Cc: peter.maydell@linaro.org, mtsirkin@redhat.com, kvm@vger.kernel.org,
	rkrcmar@redhat.com, tbaicar@codeaurora.org,
	qemu-devel@nongnu.org, wangxiongfeng2@huawei.com,
	ben@skyportsystems.com, linux@armlinux.org.uk,
	kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, lersek@redhat.com,
	songwenjun@huawei.com, drjones@redhat.com, wuquanming@huawei.com,
	xiexiuqi@huawei.com, marc.zyngier@arm.com, qemu-arm@nongnu.org,
	imammedo@redhat.com, linux-arm-kernel@lists.infradead.org,
	ard.biesheuvel@linaro.org, james.morse@arm.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ufr9XBM1JLoA

Hi Christoffer,
   thanks for your review and comments

On 2017/5/2 15:56, Christoffer Dall wrote:
> Hi Dongjiu,
> 
> Please send a cover letter for patch series with more than a single
> patch.
  OK, got it.

> 
> The subject and description of these patches are also misleading.
> Hopefully this is in no way tied to kvmtool, but to userspace
> generically, for example also to be used by QEMU?
 yes, it is also used by QEMU, it should be userspace.


> 
> On Sun, Apr 30, 2017 at 01:37:55PM +0800, Dongjiu Geng wrote:
>> Handle kvmtool's detection for RAS extension, because sometimes
>> the APP needs to know the CPU's capacity
> 
> the APP ?
> 
> the CPU's capacity?
  I will fix it.

> 
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  arch/arm64/kvm/reset.c   | 11 +++++++++++
>>  include/uapi/linux/kvm.h |  1 +
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
>> index d9e9697..1004039 100644
>> --- a/arch/arm64/kvm/reset.c
>> +++ b/arch/arm64/kvm/reset.c
>> @@ -64,6 +64,14 @@ static bool cpu_has_32bit_el1(void)
>>  	return !!(pfr0 & 0x20);
>>  }
>>  
>> +static bool kvm_arm_support_ras_extension(void)
>> +{
>> +	u64 pfr0;
>> +
>> +	pfr0 = read_system_reg(SYS_ID_AA64PFR0_EL1);
>> +	return !!(pfr0 & 0x10000000);
>> +}
>> +
>>  /**
>>   * kvm_arch_dev_ioctl_check_extension
>>   *
>> @@ -87,6 +95,9 @@ int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm, long ext)
>>  	case KVM_CAP_ARM_PMU_V3:
>>  		r = kvm_arm_support_pmu_v3();
>>  		break;
>> +	case KVM_CAP_ARM_RAS_EXTENSION:
>> +		r = kvm_arm_support_ras_extension();
>> +		break;
> 
> You need to document this capability and API in
> Documentation/virtual/kvm/api.txt and explain how this works.
  Ok, thanks for your suggestion.

> 
> 
> 
>>  	case KVM_CAP_SET_GUEST_DEBUG:
>>  	case KVM_CAP_VCPU_ATTRIBUTES:
>>  		r = 1;
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index f51d508..27fe556 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -883,6 +883,7 @@ struct kvm_ppc_resize_hpt {
>>  #define KVM_CAP_PPC_MMU_RADIX 134
>>  #define KVM_CAP_PPC_MMU_HASH_V3 135
>>  #define KVM_CAP_IMMEDIATE_EXIT 136
>> +#define KVM_CAP_ARM_RAS_EXTENSION 137
>>  
>>  #ifdef KVM_CAP_IRQ_ROUTING
>>  
>> -- 
>> 2.10.1
>>
> 
> Thanks,
> -Christoffer
> 
> .
> 

