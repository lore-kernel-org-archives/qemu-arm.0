Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp1047989njb;
        Thu, 26 Sep 2024 09:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNVXxvRSkxltbpqGqA4sSb6dlpHsfr9Ri7FeLFBdc3n3UcOSidvEwlVKuSvhS6jKD2ZPGKpY+BiWPFRA==@linaro.org
X-Received: by 2002:a05:6a00:3e1c:b0:718:e062:bd7e with SMTP id d2e1a72fcca58-71b2607a1f8mr443574b3a.24.1727367090288;
        Thu, 26 Sep 2024 09:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727367089; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXlV2rVlTpXz12AV4jg3lA4+96vbtXfHwDJkkh4Tuj/ZUuTo1VI6DERFJWfK0ByFKb
         qK5x01KTSGM7iK4l9rs4Ov8gi5J/RktKcR+DGxYsML9dQawp9yZJEydG9Th6ALiiaJ1A
         muoLJfT4GcJqPrMwlifFg2s8/UTdbd0CsKlM3ooNZvB+Y2o6RIjGW2HjVPo1pYOE4GuW
         hN+6ghWYkN39q2GSJojVsYL0T1ohrvFBRzfV+rm1CusIFClXoBPtL9Y0JmUmMjjhH9rI
         ULC8+IZncRZx6Q5RbSsG0Yeeitv2BiJolfEppgaS59KdIYi4bZShR0LbU71zlWOXS5CS
         zXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pUgF7KKnjKozU+bAXljfkafMdBi6K6GocohJYE3eMHk=;
        fh=FxSkBNdiqbrsWKPBAumAPumBSf/2oBz0e2BY8j11qrI=;
        b=VXQrHfXYMKgCrmsziGwMGzMWLL7oixE+hu7gfuL5JJnDaU3vqWUC+5hk/DFnMKZ05s
         IZPsel80KFWSVNFkQFTf3BvQKgb7Y3C0F4JUp+yih1bDd3Ywe4vrKbiNGhwmYPMmOJ5F
         YG9gbcoBXmlb+qdCZpttD+lylLrb8+s9a0MwjFT+j1pHqmSc6frLIduLpNzPkaMkbNJu
         I/TgLgyi1t3MAWRKyJM2SM9efESB36Idjn1OndzTPLY1EiVif0TCqEboOeJOFXr20dv/
         otX5TePW1vxhaGd5e8xmWurdxCHNMEN3kaF2zRjK55CrwS7Fejum3Udq9hRKyeCfWF+E
         E0GQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdokZrR4;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71b265063e1sor94717b3a.7.2024.09.26.09.11.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Sep 2024 09:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdokZrR4;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727367089; x=1727971889; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUgF7KKnjKozU+bAXljfkafMdBi6K6GocohJYE3eMHk=;
        b=IdokZrR4lpgXhgwut9Xgw1I7Hf/DNrZcznLTnvrznfYg6s0L39JLdMIRU7Qo4eP8Sz
         u4kwAOUWqcB0WOSAll1bQTKxiJwrWK9fi6nhtxWhy6LRVrEr19XIY41SExt7OCl+YeD7
         kXygt7L3sz3q2C38NtjfymXWRG142QX9qcXopOPGlzWtZaKq6QOjpLtQ21+LBlqHMVnL
         2QD1zbx0KVg/xCQpEN4ckGjPRsseKiFT5O4TXsjzoAAiYoK5vi0du/pXWBAmXC3BFINx
         5D0af1Q8hpj9LTDtNLlbkAiftGw46ynskeI8XGKChKtKXP0w902eqXxEqAGmQsXGwMfG
         Ra6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367089; x=1727971889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUgF7KKnjKozU+bAXljfkafMdBi6K6GocohJYE3eMHk=;
        b=Gd8f2gpT2BfEEwCTfin6ONospPWFCJrCEn7e15U1NUuAD7N4M6tZDff4lPMa09MZzZ
         VW9BT+f11s+mbSm6Zi6AJmq9YuiuNRBfpCnl7s3ZzTBQ8JX7zWCnyjIDEZvXzATVkgZ+
         q9Ss/f58aXhyWbcDHvQwBQuEnT43oRYdljEw+9OyC9usJ2EdphHALxANgwl3u5gByigU
         bqTI3sPIciaYL+5bDIOU+O/FVU/i2r152O1QUcquE2fKXXyzhTxHZUQg0DR7QSRrDX1w
         rPHJ5NetIpzjxxQ6UGMxGXbGQOIXxo74XQv+MoBw9D/DfNNEbb9Eniunyb4Fohcbx4Y5
         Tcag==
X-Forwarded-Encrypted: i=1; AJvYcCUzl7QJic7wVsNdGMR1guUEOXXBcwPZR5t7m3lhskIb1m1lbTK4SaoAslkDYc2QVVG8zxXw8b21pBCxOA==@linaro.org
X-Gm-Message-State: AOJu0YxGknNePxzgPlhHVc4CNgCdrh23quI9IjSXns1peYTabaJRWjuK
	j5V8IFPRSRBYoZ4a96vho4siBgQqwQIictft6bPpmVZu5rOmJo0uxFavJXPek1Xf1A==
X-Google-Smtp-Source: AGHT+IEJbs/+y2kvBZT5K9RNqmHitNVfxN8iWiNnRdDcbl0U57rVo5tfUUbKbKAHQUJUkhEC2PfnBg==
X-Received: by 2002:a05:6a20:3b19:b0:1cf:53ea:7fbc with SMTP id adf61e73a8af0-1d4fa6a1496mr271005637.18.1727367089198;
        Thu, 26 Sep 2024 09:11:29 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.100] ([187.75.38.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2c8704sm83269a12.52.2024.09.26.09.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 09:11:28 -0700 (PDT)
Message-ID: <f3da8f58-615b-42ed-a99d-20bfd9ec6b56@linaro.org>
Date: Thu, 26 Sep 2024 13:11:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
References: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
 <87tte3sxkx.fsf@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <87tte3sxkx.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5M0iPdVk+V5s

Hi Cornelia and Ganapatrao,

On 9/25/24 14:54, Cornelia Huck wrote:
> On Fri, Sep 20 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
>
> Mostly nit-picking below, otherwise LGTM.
>
>> Extend the 'mte' property for the virt machine to cover KVM as
>> well. For KVM, we don't allocate tag memory, but instead enable
>> the capability.
>>
>> If MTE has been enabled, we need to disable migration, as we do not
>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>> off with KVM unless requested explicitly.
>>
>> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
>> which broke TCG since it made the TCG -cpu max
>> report the presence of MTE to the guest even if the board hadn't
>> enabled MTE by wiring up the tag RAM. This meant that if the guest
>> then tried to use MTE QEMU would segfault accessing the
>> non-existent tag RAM.
> I think the more canonical way to express this would be
>
> [$AUTHOR: reworked original patch by doing X to avoid problem Y]
>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> Also, the S-o-b chain is a bit confusing that way, because you are
> listed as author of the patch, but I'm in the chain in front of you -- I
> think I should still be listed as the author?
>
>> ---
>>
>> Changes since V2:
>> 	Updated with review comments.
>>
>> Changes since V1:
>> 	Added code to enable MTE before reading register
>> id_aa64pfr1 (unmasked MTE bits).
>>
>> This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
>> and default case(i.e, no mte).
>>
>>   hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>>   target/arm/cpu.c     | 11 +++++--
>>   target/arm/cpu.h     |  2 ++
>>   target/arm/kvm.c     | 57 +++++++++++++++++++++++++++++++++++
>>   target/arm/kvm_arm.h | 19 ++++++++++++
>>   5 files changed, 129 insertions(+), 32 deletions(-)
>>
> (...)
>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 19191c2391..8a2fc471ce 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2390,14 +2390,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>   
>>   #ifndef CONFIG_USER_ONLY
>>           /*
>> -         * If we do not have tag-memory provided by the machine,
>> +         * If we do not have tag-memory provided by the TCG,
> Maybe
>
> "If we run with TCG and do not have tag-memory provided by the machine"
>
> ?

Yep, I agree, this is better.


>>            * reduce MTE support to instructions enabled at EL0.
>>            * This matches Cortex-A710 BROADCASTMTE input being LOW.
>>            */
>> -        if (cpu->tag_memory == NULL) {
>> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>>               cpu->isar.id_aa64pfr1 =
>>                   FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>>           }
>> +
>> +        /*
>> +         * Clear MTE bits, if not enabled in KVM mode.
> Maybe add "This matches the MTE bits being masked by KVM in that case."?

Clearing the MTE bits is also necessary when MTE is supported by the
host (and so KVM can enable the MTE capability - so won't mask the MTE
bits, but the user didn't want MTE enabled in the guest (mte=on no given
or explicitly set to =off), so this comment is not always true?

How about something like:

"If MTE is supported by the host but could not be enabled on KVM mode or
MTE should not be enabled on the guest (e.i. mte=off), clear guest's MTE 
bits."

I do assume MTE is supported by the host (i.e. MTE bits >= 2 in the host)
because otherwise condition "if (cpu_isar_feature(aa64_mte, cpu)) { ... 
}" is not
taken; and at this point cpu->isar->id_aa64pfr1 is set from the host's 
bits via
kvm_arm_set_cpu_features_from_host() and kvm_arm_get_host_cpu_features ().


>> +         */
>> +        if (kvm_enabled() && !cpu->kvm_mte) {
>> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
>> +        }
>>   #endif
>>       }
>>   
> (...)
>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 849e2e21b3..af7a98517d 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -39,6 +39,7 @@
>>   #include "hw/acpi/acpi.h"
>>   #include "hw/acpi/ghes.h"
>>   #include "target/arm/gtimer.h"
>> +#include "migration/blocker.h"
>>   
>>   const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>       KVM_CAP_LAST_INFO
>> @@ -119,6 +120,20 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>>       if (vmfd < 0) {
>>           goto err;
>>       }
>> +
>> +    /*
>> +     * MTE capability must be enabled by the VMM before creating
>> +     * any VCPUs. The MTE bits of the ID_AA64PFR1 register are masked
>> +     * if MTE is not enabled, allowing them to be probed correctly.
> This reads a bit confusing. Maybe
>
> "The MTE capability must be enabled by the VMM before creating any VCPUs
> in order to allow the MTE bits of the ID_AA64PFR1 register to be probed
> correctly, as they are masked if MTE is not enabled."

I agree.


>
>> +     */
>> +    if (kvm_arm_mte_supported()) {
>> +        KVMState kvm_state;
>> +
>> +        kvm_state.fd = kvmfd;
>> +        kvm_state.vmfd = vmfd;
>> +        kvm_vm_enable_cap(&kvm_state, KVM_CAP_ARM_MTE, 0);
>> +    }
>> +
>>       cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>>       if (cpufd < 0) {
>>           goto err;
> (...)
>

Comments aside:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
