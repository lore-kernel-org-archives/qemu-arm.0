Received: by 10.25.0.198 with SMTP id 189csp371213lfa;
        Tue, 2 May 2017 08:48:44 -0700 (PDT)
X-Received: by 10.99.128.72 with SMTP id j69mr21777386pgd.28.1493740124270;
        Tue, 02 May 2017 08:48:44 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w26si18737665pfj.253.2017.05.02.08.48.44;
        Tue, 02 May 2017 08:48:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750818AbdEBPsm (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 2 May 2017 11:48:42 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33948 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbdEBPsl (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 2 May 2017 11:48:41 -0400
Received: by mail-wm0-f67.google.com with SMTP id z129so5595116wmb.1
        for <kvm@vger.kernel.org>; Tue, 02 May 2017 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=3uzl7K7IArQVthWPRRIsy7Hy4Cb9J6UBZiiQNbKpFzA=;
        b=LgWv5q6vzb8oDco/IkzkZEWrc9njruYzHtKjUQLTHwmz7xANA4YLNvgB2XqdCUweiv
         5Zvg++JvsbLBPwPRhTvvZK/LVKR+7jSrMOMRlkS1+PPaGAfCpj2mVxqcq49W70hmNpYX
         AwLz2ETvH1psbRpLbuyS2OiKk8ZGnH1NtmABaZKNFKM1cizAAgf0j+BN6GnfKj4lLZEk
         WkwZCvgsVb6mA27Xd1f/PIu46Ti8Atk5Uwbr5iqn+YpP+ebXe6/kkiHEzx9UXOhrJyL+
         fRMf+pa5qpuWqxWq6GhuHO1f9GkpRMmxnlbh4v25iOgnlXYEUs9mKdqYhWP3uVCztiqj
         K5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=3uzl7K7IArQVthWPRRIsy7Hy4Cb9J6UBZiiQNbKpFzA=;
        b=gNoT+hjteWedTzeItufG6WT2LiHlnFSClCEWQ7YgSlQsBcUlfiWGsIinQ7k0EBkc87
         0FGpCgsg0u6mT+HyF2Ds4wxBeKkFq9m+e474/bjR6MqiM4+esenyZWcpvSB3lS9WQf81
         vkU05s5Rb80R5AtqzgKCRqXyMBOKnJs63FbEv5C2dcab6MiZq5DCfenyw3xZ3f/Wndwp
         551fNkkur0twh0UuirkYCfKQwv+9Zs5JhGtKE9uuxz6w4YzyKFPiGhupyweOqzz49rOH
         JE4ioi83Ul40Eux+R0theY554GJyIErDeiAxbWTRERrVpNwrOjBkO5UYQAhhb4ihutB9
         pNzA==
X-Gm-Message-State: AN3rC/73bNofceJnFI2W8fIv0ujPKDgdDeNnCcjXshZ4v2v8aNZ2rHrc
        YuXAr/DwDZ3lVQ==
X-Received: by 10.28.148.3 with SMTP id w3mr3030366wmd.8.1493740119681;
        Tue, 02 May 2017 08:48:39 -0700 (PDT)
Received: from [192.168.10.165] (94-39-148-124.adsl-ull.clienti.tiscali.it. [94.39.148.124])
        by smtp.googlemail.com with ESMTPSA id s29sm11558688wrb.21.2017.05.02.08.48.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2017 08:48:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS
 extension feature
To:     Christoffer Dall <cdall@linaro.org>,
        Dongjiu Geng <gengdongjiu@huawei.com>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <20170502075631.GE16940@cbox>
Cc:     james.morse@arm.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, rkrcmar@redhat.com,
        linux@armlinux.org.uk, tbaicar@codeaurora.org, imammedo@redhat.com,
        zhaoshenglong@huawei.com, peter.maydell@linaro.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, lersek@redhat.com,
        ard.biesheuvel@linaro.org, mtsirkin@redhat.com, drjones@redhat.com,
        ben@skyportsystems.com, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        xiexiuqi@huawei.com, wangxiongfeng2@huawei.com,
        songwenjun@huawei.com, wuquanming@huawei.com,
        huangshaoyu@huawei.com
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8d443da4-d17f-2487-10d5-b6c9639dc5a4@redhat.com>
Date:   Tue, 2 May 2017 17:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170502075631.GE16940@cbox>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 03zBtnrtDycb



On 02/05/2017 09:56, Christoffer Dall wrote:
> Hi Dongjiu,
> 
> Please send a cover letter for patch series with more than a single
> patch.
> 
> The subject and description of these patches are also misleading.
> Hopefully this is in no way tied to kvmtool, but to userspace
> generically, for example also to be used by QEMU?

Yes, QEMU already has a similar capability on x86.

Does ARM support background scrubbing of memory to detect errors?  If
so, are there any plans to support action-optional SIGBUS on ARM?

Paolo

> On Sun, Apr 30, 2017 at 01:37:55PM +0800, Dongjiu Geng wrote:
>> Handle kvmtool's detection for RAS extension, because sometimes
>> the APP needs to know the CPU's capacity
> 
> the APP ?
> 
> the CPU's capacity?
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
