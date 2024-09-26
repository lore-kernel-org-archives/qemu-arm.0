Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp1016444njb;
        Thu, 26 Sep 2024 08:25:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUc1j7LseHU+tnW5CgBJJ4DEVMUxhOSX4k7R2Lk2QOJX2ryutlE2h6LNPUji/hbjD+lwTF5rX0ZWxIAg==@linaro.org
X-Received: by 2002:a05:6870:9727:b0:277:f301:40ce with SMTP id 586e51a60fabf-28710aaa1b0mr221813fac.20.1727364345771;
        Thu, 26 Sep 2024 08:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727364345; cv=none;
        d=google.com; s=arc-20240605;
        b=du+8XCKR3IOrUVXhsb+PukoPoMivFswfW3AsXuKSuTjcbII2/bVMxXdNGLS36NodQK
         HcZ/pJHrati4X4OfH8Chaf7JujYRiyMSyoEnW7qU6m4Ucwjihgupelc0ywHejqr7hgzj
         LJSOWv3PF/BHcWAVwM5PbvpaPZEyNgUMdktoUkLsu/f4vY5unGaUm9cin8gbbY5LP9fd
         vfbSgpX9GjCLd3itlxzG6CF2gtINRrsy+6lYmI/koOn8lzSBymUPaNOS+Z6XBON/rfDA
         Pfhj6xaPJd+hDc23N3/NE4SenGqnOrJ7rr/yudhoeTQBF1vpb2z6aLhlTS1gmtFuwc3X
         curg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2af62LfA3YaO+ersa+4qbrxEQzuZbXDbfR69g7WoisY=;
        fh=nxEtM34+rkU6Y1OxkcPy4dKnwoUoHxu5xGQM4Q98DZI=;
        b=Va/cfc5b1nSGfGlF9meRvWlMMhcI7CO7NAxGRap/7JHSJh68XOQCFiP/3nr3kQQPnX
         2oN7hkwLe/orAausXzYN++jy1WuOUI5ZH/FMcX2RzZyRkBN/R9qkLWKXUGsBmzZfbSVQ
         azfhWQRG7b1i8djNZ9efq3EjSiLG5HmjNnyp+gKkk63BgD1iqYletlp8/jYETOjounkl
         jYLPdDnvctPvJl5+ZHK0OUinnOfpdCV3ltLKbqaaPyl0g8rQWDLuv+n38owFp1wWi8Wy
         BcRB63Kb7SpW5RQ/B/TdcxazJG7BUTnLkxsPj00XwC+EsNVK5inCfVehRYJcEPgfh70f
         qQgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfGIV96K;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2870fa09fefsor63543fac.20.2024.09.26.08.25.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Sep 2024 08:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfGIV96K;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727364345; x=1727969145; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2af62LfA3YaO+ersa+4qbrxEQzuZbXDbfR69g7WoisY=;
        b=OfGIV96K3btBc6dkMrXSQOMLyZtSRWLDeIMY2LkRJc2ExsDrvc1DIs+U3okmAbCE7v
         IHq6/b+SzUmahQ9EoQTpU/du1V7s8FQ4ck/be2kF5YP9YCSshHXZgnQwXnABx7GLQI8K
         xY+RNAp2/47b5ugq17UItfRP/ohwIoAOqnKPZP28dlGh+g7W2nLurd3y9DC7naC6ZUmc
         qs5rVbdnq34N0NRbK8TQRZZl3YOPwMR6RTjO2/Q8NuyjeDbJSReVr7zi1TLJYf7DOd5l
         rEFUULPqw5FQSFk3vzcvbXlCmqMwHL5rVl2e1ckMVaYeWmGERdRfpoBYNPzkObGz+Jx3
         NtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727364345; x=1727969145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2af62LfA3YaO+ersa+4qbrxEQzuZbXDbfR69g7WoisY=;
        b=RKg8m/e4IUysd+U5x0hQIsBoqeWAuSPPW6t/6Hqwwg7ODIlRYOZdo4vg5j72s75iKT
         Qof6/u3rqCFKA8PM69w3UHlqSEOYCARvLS6DPbPN5EITC2m48dc/QXT5D6fVAnMS5u15
         Zr2cKFwRj9mdw+9GxSrh77k+07LS3Y/KjEhzJwqWv0zYeMB9SDEhIzpUuR6/EtXxrKJq
         JP8bkUToPtlwehjnPcuzgRcXyis17+9emK4QvjzMMHKXWYMYCN6EaJNXY5toSSxrsehD
         6ZJDjXc+WuG+Jyo4UWx7WKzegFZj913+HG0JOODUqgApq/vzbvFbE8PjRNqJ6y84eQoA
         tt2A==
X-Forwarded-Encrypted: i=1; AJvYcCWQKE+FACKGgPyLYE8d8PxZyRu8LUBaLGrEx/xD0JHzVHxBxRBrUXBID065jwGweR0+wAqHdAdQ/hGv4g==@linaro.org
X-Gm-Message-State: AOJu0YzDG+uIcwISAgTIkXoNb+Sl/Q9xs3RkPpI72JrpXhm1oZpwu2pS
	bXRa0r1hEU+7HCZ+BHKVXjy8vgwl3R/tWeza6OloLY4Nc0HebePQmZPPIbASOpnM8w==
X-Google-Smtp-Source: AGHT+IG8U0j8XEl6RQyFHFPSvdZ/v4Zrq7IYzv6i4wbxRVfA03cXBhoXaXbujZFtUbxioglA2PTlZg==
X-Received: by 2002:a05:6870:f2a8:b0:27c:cf52:dc76 with SMTP id 586e51a60fabf-28710c45be3mr186782fac.45.1727364344819;
        Thu, 26 Sep 2024 08:25:44 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.100] ([187.75.38.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5ed0e9sm19960a12.57.2024.09.26.08.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 08:25:43 -0700 (PDT)
Message-ID: <96406bf3-731b-49aa-a2e4-a43259bfbb57@linaro.org>
Date: Thu, 26 Sep 2024 12:25:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm/kvm: add support for MTE
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, cohuck@redhat.com, darren@os.amperecomputing.com
References: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
 <4b1a7f9b-4a69-4c0a-93be-4ecd27b08196@linaro.org>
 <29815c60-a246-4be3-9685-4d192efcf037@os.amperecomputing.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <29815c60-a246-4be3-9685-4d192efcf037@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sWK4+ln1A4rr

Hi Ganapatrao,

On 9/25/24 19:40, Ganapatrao Kulkarni wrote:
>
> Hi Gustavo,
>
> On 25-09-2024 09:17 pm, Gustavo Romero wrote:
>> Hi Ganapatrao,
>>
>> Sorry for the delay on replying it. I was attending KVM Forum and 
>> commuting.
>>
>> On 9/20/24 09:37, Ganapatrao Kulkarni wrote:
>>> Extend the 'mte' property for the virt machine to cover KVM as
>>> well. For KVM, we don't allocate tag memory, but instead enable
>>> the capability.
>>>
>>> If MTE has been enabled, we need to disable migration, as we do not
>>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>>> off with KVM unless requested explicitly.
>>>
>>> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
>>> which broke TCG since it made the TCG -cpu max
>>> report the presence of MTE to the guest even if the board hadn't
>>> enabled MTE by wiring up the tag RAM. This meant that if the guest
>>> then tried to use MTE QEMU would segfault accessing the
>>> non-existent tag RAM.
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
>>> ---
>>>
>>> Changes since V2:
>>>     Updated with review comments.
>>>
>>> Changes since V1:
>>>     Added code to enable MTE before reading register
>>> id_aa64pfr1 (unmasked MTE bits).
>>>
>>> This patch is boot tested on ARM64 with KVM and on X86 with TCG for 
>>> mte=on
>>> and default case(i.e, no mte).
>>>
>>>   hw/arm/virt.c        | 72 
>>> ++++++++++++++++++++++++++------------------
>>>   target/arm/cpu.c     | 11 +++++--
>>>   target/arm/cpu.h     |  2 ++
>>>   target/arm/kvm.c     | 57 +++++++++++++++++++++++++++++++++++
>>>   target/arm/kvm_arm.h | 19 ++++++++++++
>>>   5 files changed, 129 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 7934b23651..a33af7d996 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -2211,7 +2211,7 @@ static void machvirt_init(MachineState *machine)
>>>           exit(1);
>>>       }
>>> -    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>>> +    if (vms->mte && hvf_enabled()) {
>>>           error_report("mach-virt: %s does not support providing "
>>>                        "MTE to the guest CPU",
>>>                        current_accel_name());
>>> @@ -2281,39 +2281,51 @@ static void machvirt_init(MachineState 
>>> *machine)
>>>           }
>>>           if (vms->mte) {
>>> -            /* Create the memory region only once, but link to all 
>>> cpus. */
>>> -            if (!tag_sysmem) {
>>> -                /*
>>> -                 * The property exists only if MemTag is supported.
>>> -                 * If it is, we must allocate the ram to back that up.
>>> -                 */
>>> -                if (!object_property_find(cpuobj, "tag-memory")) {
>>> -                    error_report("MTE requested, but not supported "
>>> -                                 "by the guest CPU");
>>> -                    exit(1);
>>> +            if (tcg_enabled()) {
>>> +                /* Create the memory region only once, but link to 
>>> all cpus. */
>>> +                if (!tag_sysmem) {
>>> +                    /*
>>> +                     * The property exists only if MemTag is 
>>> supported.
>>> +                     * If it is, we must allocate the ram to back 
>>> that up.
>>> +                     */
>>> +                    if (!object_property_find(cpuobj, "tag-memory")) {
>>> +                        error_report("MTE requested, but not 
>>> supported "
>>> +                                     "by the guest CPU");
>>> +                        exit(1);
>>> +                    }
>>> +
>>> +                    tag_sysmem = g_new(MemoryRegion, 1);
>>> +                    memory_region_init(tag_sysmem, OBJECT(machine),
>>> +                                       "tag-memory", UINT64_MAX / 32);
>>> +
>>> +                    if (vms->secure) {
>>> +                        secure_tag_sysmem = g_new(MemoryRegion, 1);
>>> +                        memory_region_init(secure_tag_sysmem, 
>>> OBJECT(machine),
>>> + "secure-tag-memory",
>>> +                                           UINT64_MAX / 32);
>>> +
>>> +                        /* As with ram, secure-tag takes precedence 
>>> over tag. */
>>> + memory_region_add_subregion_overlap(secure_tag_sysmem,
>>> + 0, tag_sysmem, -1);
>>> +                    }
>>>                   }
>>> -                tag_sysmem = g_new(MemoryRegion, 1);
>>> -                memory_region_init(tag_sysmem, OBJECT(machine),
>>> -                                   "tag-memory", UINT64_MAX / 32);
>>> -
>>> +                object_property_set_link(cpuobj, "tag-memory",
>>> +                                         OBJECT(tag_sysmem), 
>>> &error_abort);
>>>                   if (vms->secure) {
>>> -                    secure_tag_sysmem = g_new(MemoryRegion, 1);
>>> -                    memory_region_init(secure_tag_sysmem, 
>>> OBJECT(machine),
>>> -                                       "secure-tag-memory", 
>>> UINT64_MAX / 32);
>>> -
>>> -                    /* As with ram, secure-tag takes precedence 
>>> over tag.  */
>>> - memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
>>> - tag_sysmem, -1);
>>> +                    object_property_set_link(cpuobj, 
>>> "secure-tag-memory",
>>> + OBJECT(secure_tag_sysmem),
>>> + &error_abort);
>>>                   }
>>> -            }
>>> -
>>> -            object_property_set_link(cpuobj, "tag-memory", 
>>> OBJECT(tag_sysmem),
>>> -                                     &error_abort);
>>> -            if (vms->secure) {
>>> -                object_property_set_link(cpuobj, "secure-tag-memory",
>>> - OBJECT(secure_tag_sysmem),
>>> -                                         &error_abort);
>>> +            } else if (kvm_enabled()) {
>>> +                if (!kvm_arm_mte_supported()) {
>>> +                    error_report("MTE requested, but not supported 
>>> by KVM");
>>> +                    exit(1);
>>> +                }
>>> +                kvm_arm_enable_mte(cpuobj, &error_abort);
>>> +            } else {
>>> +                    error_report("MTE requested, but not supported ");
>>> +                    exit(1);
>>>               }
>>>           }
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 19191c2391..8a2fc471ce 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -2390,14 +2390,21 @@ static void arm_cpu_realizefn(DeviceState 
>>> *dev, Error **errp)
>>>   #ifndef CONFIG_USER_ONLY
>>>           /*
>>> -         * If we do not have tag-memory provided by the machine,
>>> +         * If we do not have tag-memory provided by the TCG,
>>>            * reduce MTE support to instructions enabled at EL0.
>>>            * This matches Cortex-A710 BROADCASTMTE input being LOW.
>>>            */
>>> -        if (cpu->tag_memory == NULL) {
>>> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>>>               cpu->isar.id_aa64pfr1 =
>>>                   FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, 
>>> MTE, 1);
>>>           }
>>> +
>>> +        /*
>>> +         * Clear MTE bits, if not enabled in KVM mode.
>>> +         */
>>> +        if (kvm_enabled() && !cpu->kvm_mte) {
>>> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 
>>> 0);
>>> +        }
>>
>> I 've discussed a bit with Richard about the need of setting the MTE 
>> field here
>>
>> to 0. This is already a reduction since it's inside the condition block:
>>
>> if (cpu_isar_feature(aa64_mte, cpu)) { ... }, which is only taken if 
>> we already
>>
>> have MTE field >= 1. At this point the MTE bits 
>> in cpu->isar.id_aa64pfr1 should
>>
>> already be set correctly accordingly to the host bits since 
>> kvm_arm_get_host_cpu_features()
>>
>> was called.
>>
>>
>> The check for TCG (cpu->tag_memory == NULL) exists because even if 
>> MTE instructions
>>
>> are supported by the CPU it's possible that the machine's memory does 
>> not support tags,
>>
>> but we don't check for that in KVM afaics.
>>
>>
>> For KVM, isn't the cpu->isar.id_aa64pfr1 MTE bits already correct 
>> here so we don't need to touch them?
>
> id_aa64pfr1.MTE bits are masked/zero when we read without enabling the 
> MTE(KVM_CAP_ARM_MTE). Hence to read the real value we are enabling MTE 
> while reading the register.
>
> Later, If user is not passed argument "mte=on", we want to revert the 
> value that is read with MTE enabled since we are enabling MTE on 
> actual VM  only if "mte=on".
>
> Are you saying, let us have the MTE enabled for KVM by default and 
> disable only if user passes mte=off?.

No, it's ok the way it is. I missed one obvious case: host supports MTE 
but user _didn't_ ask to enable it.


Thanks for the clarifications. It makes sense to me.


I think it would be good to explain this in the comment, i.e. explain 
the rationale for the reduction

(I'm calling  reduction the fact that we check for aa64pfr1.MTE bits and 
then we mask them (set to zero, in this case).

I'll comment it inline in the other thread were Cornelia suggests a 
change on it too.


Cheers,

Gustavo


>>
>> cpu->kvm_mte is false here only if kvm_check_extension(kvm_state, 
>> KVM_CAP_ARM_MTE) is true but
>>
>> kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0) is false -- can that 
>> happen ever happen? _or_ when
>
> This can be, if hardware is not supporting it.
> Since user is trying to enable with mte=on but hardware is not 
> capable, in that case qemu aborts with error message.
>
>>
>> we can't block migration? So basically we are telling to the guest 
>> that MTE is not supported if we have
>>
>> MTE supported in the host _but_ we can't block migration?
>>
>>
>>
>> Cheers,
>>
>> Gustavo
>>
>
