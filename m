Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1752339ejb;
        Mon, 2 Oct 2023 22:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIwjOn3gb4Qdk7XDweBRlV3vUY6ukA7Q8LFZuyaKRb2eNPHJdvhS7d02d78sHISbWvx19q
X-Received: by 2002:a0d:d483:0:b0:56c:f547:e058 with SMTP id w125-20020a0dd483000000b0056cf547e058mr1213768ywd.18.1696311301258;
        Mon, 02 Oct 2023 22:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696311301; cv=none;
        d=google.com; s=arc-20160816;
        b=YB/bC8+k0Nz3Wkmjz/kkS9N0tAi+FIPLVuwxtGUNq1ZSnm7OlUNKEGO5MvVYljlxFK
         K6MYexv1BA16kDiJfe7sMZf5OHO/ViFCoUXeyA6FKqQAEPNvyUJKke0TUKsIgjPr153D
         BPIQtu74NG9jTiTFf8GjYW/O9E8xpoqTh2bRt7KI3fxFW1Yw2ahxqSlbtHcblDOTUn2C
         7NkdWHiMushpUfseGf6Sg5YQgzRYPTZO0qY7JBZMr/OROhSFvkGjJmaoOMRyOGz6MihK
         xBYJ6nDWsvKc7rDiLDXQWPaQA7bkiratxn9Bz2Hz++a72qjuIRgxiS55T8oHl1NW9e31
         ZrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pyM7OqyiATgS8HigwYZfJJrs0gBnSktAGCIRTdSZaH4=;
        fh=fuJwIdfu8VPP6GfXn3BVoTVIzyX31MQ6OANRO+kwzA0=;
        b=oarB6V6ZzCg2/4gsSZs7gmfYv/8QegricbSPEclkSxz3opA36iybv1zZ5YPVYYf/wz
         Wl6RKWkWUexLzf0CP4z7o2ec/SJQRovsKAO6GweWCnVVEvPsapEGmVUOEv08HYSKlfQf
         uKlBw9RIbrrQbcyqCtWLKxyEBppUOMrE9gpq4QkGOsM5Qra0r4R9P9yfaPczOPema9Jf
         jQ7DtMvCbIbkMGhlcSu2MhML0G5Glkr0IVZ5Z0/n1Jb2acdTjt9H3YBznzftMGD6gcTH
         V0F+g1jSnJNktdK5AasUHkTp06B3Uvu3gyU2pAfzV+ft4H6oc+fWPdfwj3jJMGs3Ymub
         Ic3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PNbGCzEz;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n5-20020a81bd45000000b005929236946esi227714ywk.113.2023.10.02.22.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 22:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PNbGCzEz;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696311300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyM7OqyiATgS8HigwYZfJJrs0gBnSktAGCIRTdSZaH4=;
	b=PNbGCzEzCVEdBPqw9oTZLSvfVnODDX31VfQC/VUYLdp9bX1R3Ivjtq9et5tu19S2Ibwg9t
	0vfqSAQ3d/1VCLfdcwEBJNN2jwNEFea/hXlOvUmXicaEAZ6llk4z0Tv7utmYzOGxZZ+1Q5
	3DLjJ+kaVwbDZI3oPQ6n7g+KIvq8dGo=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-VW6qw1NHOay88Y6mN1c4XQ-1; Tue, 03 Oct 2023 01:34:49 -0400
X-MC-Unique: VW6qw1NHOay88Y6mN1c4XQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-692bbab7a4fso2891187b3a.1
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 22:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696311288; x=1696916088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyM7OqyiATgS8HigwYZfJJrs0gBnSktAGCIRTdSZaH4=;
        b=R9d+CmAy2qywgyoAQzFlUzOGfU9Z4aHuGrzzQZ7rtpOviKmD807JvDIjcyu0vHs2MN
         5F2YdmhzMzrJAMVXuZD7Fuhkpe/TEQ4xaRQ59YfbrpZdVsBUJYKJ5q1AlLOEUXP2F/SB
         cWIV1T4w7BmgQs7eFnBUo5q7r0xT0M7lmSHp4sIJSWLJgA89LQqw4zTIDGx6Y0y/Asx/
         AV90pZP9e1BCwzp6uQ2ht41cO8Z3iXnGFDc0bk6N/EcXmjjGyhU2eD8mIN9nr9m1VCyD
         mLGCR5/4sGs6V+qeVh6FshXddL9x+gTpyz9fmRRhq/RIf/eBkJeRVZVvFlRaLrmUH0Bw
         bQfQ==
X-Gm-Message-State: AOJu0Yx0UfbXugh50SGpjHex86IKykBXqGI74VIrxZ0RrfaTmLjIYtEi
	j9n/JkwfNGom9n49ocybmqLBsAioPT0rW6ld/YMeV/tQWcjLMGnlSB7J8oxtoQXfK4CLpQQ3UHH
	JkUms8fROf3N1mQbh
X-Received: by 2002:a05:6a00:895:b0:68e:2c2a:5172 with SMTP id q21-20020a056a00089500b0068e2c2a5172mr2522882pfj.6.1696311288368;
        Mon, 02 Oct 2023 22:34:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:895:b0:68e:2c2a:5172 with SMTP id q21-20020a056a00089500b0068e2c2a5172mr2522840pfj.6.1696311287976;
        Mon, 02 Oct 2023 22:34:47 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id q20-20020a656a94000000b00553dcfc2179sm405677pgu.52.2023.10.02.22.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 22:34:47 -0700 (PDT)
Message-ID: <adb880c1-f90b-30b5-6066-95dff426971e@redhat.com>
Date: Tue, 3 Oct 2023 15:34:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC V2 02/37] cpus-common: Add common CPU utility for
 possible vCPUs
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-3-salil.mehta@huawei.com>
 <44e4f955-ab51-92ca-8d65-e3a38d8d6657@redhat.com>
 <b002d32909f64a048371ff501bcedfc3@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b002d32909f64a048371ff501bcedfc3@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7Ijk+WX0G/qb

Hi Salil,

On 10/2/23 20:21, Salil Mehta wrote:
>> From: Gavin Shan <gshan@redhat.com>
>> Sent: Wednesday, September 27, 2023 4:54 AM
>> To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org
>> Cc: maz@kernel.org; jean-philippe@linaro.org; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; lpieralisi@kernel.org;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> imammedo@redhat.com; andrew.jones@linux.dev; david@redhat.com;
>> philmd@linaro.org; eric.auger@redhat.com; will@kernel.org; ardb@kernel.org;
>> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
>> rafael@kernel.org; borntraeger@linux.ibm.com; alex.bennee@linaro.org;
>> linux@armlinux.org.uk; darren@os.amperecomputing.com;
>> ilkka@os.amperecomputing.com; vishnu@os.amperecomputing.com;
>> karl.heubaum@oracle.com; miguel.luis@oracle.com; salil.mehta@opnsrc.net;
>> zhukeqian <zhukeqian1@huawei.com>; wangxiongfeng (C)
>> <wangxiongfeng2@huawei.com>; wangyanan (Y) <wangyanan55@huawei.com>;
>> jiakernel2@gmail.com; maobibo@loongson.cn; lixianglai@loongson.cn
>> Subject: Re: [PATCH RFC V2 02/37] cpus-common: Add common CPU utility for
>> possible vCPUs
>>
>> Hi Salil,
>>
>> On 9/26/23 20:04, Salil Mehta wrote:
>>> Adds various utility functions which might be required to fetch or check
>> the
>>> state of the possible vCPUs. This also introduces concept of *disabled*
>> vCPUs,
>>> which are part of the *possible* vCPUs but are not part of the *present*
>> vCPU.
>>> This state shall be used during machine init time to check the presence
>> of
>>> vcpus.
>>     ^^^^^
>>
>>     vCPUs
> 
> 
> Yes. Thanks.
> 
> 
>>> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>> ---
>>>    cpus-common.c         | 31 +++++++++++++++++++++++++
>>>    include/hw/core/cpu.h | 53 +++++++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 84 insertions(+)
>>>
>>> diff --git a/cpus-common.c b/cpus-common.c
>>> index 45c745ecf6..24c04199a1 100644
>>> --- a/cpus-common.c
>>> +++ b/cpus-common.c
>>> @@ -24,6 +24,7 @@
>>>    #include "sysemu/cpus.h"
>>>    #include "qemu/lockable.h"
>>>    #include "trace/trace-root.h"
>>> +#include "hw/boards.h"
>>>
>>>    QemuMutex qemu_cpu_list_lock;
>>>    static QemuCond exclusive_cond;
>>> @@ -107,6 +108,36 @@ void cpu_list_remove(CPUState *cpu)
>>>        cpu_list_generation_id++;
>>>    }
>>>
>>> +CPUState *qemu_get_possible_cpu(int index)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +    const CPUArchIdList *possible_cpus = ms->possible_cpus;
>>> +
>>> +    assert((index >= 0) && (index < possible_cpus->len));
>>> +
>>> +    return CPU(possible_cpus->cpus[index].cpu);
>>> +}
>>> +
>>> +bool qemu_present_cpu(CPUState *cpu)
>>> +{
>>> +    return cpu;
>>> +}
>>> +
>>> +bool qemu_enabled_cpu(CPUState *cpu)
>>> +{
>>> +    return cpu && !cpu->disabled;
>>> +}
>>> +
>>
>> I do think it's a good idea to have wrappers to check for CPU's states since
>> these CPU states play important role in this series to support vCPU hotplug.
>> However, it would be nice to move them around into header file (include/hw/boards.h)
>> because all the checks are originated from ms->possible_cpus->cpus[]. It sounds
>> functions to a machine (board) instead of global scope. Besides, it would be
>> nice to have same input (index) for all functions. How about something like
>> below in include/hw/boards.h?
> 
> These are operations related to CPUState and hence cpus-common.c seem to be
> more appropriate to me. You can see similar functions like qemu_get_cpu()
> already exists in the same file.
> 
> Yes, some operation do make use of the possible list which is maintained at
> board level but eventually what we are returning is the CPUState.
> 
> I am open to move some of above to board level not all like present,
> enabled checks should exist in this file only. I would prefer to keep
> all of them in this file.
> 

There are two lists (arrays): ms->possible_cpus->cpus[] and cpus-common.c::cpus.
The former one is a board's property and the later is a global property. In our
implementation, the vCPU state depends on ms->possible_cpus->cpus[], for example:

- The possible vCPU is determined by checking its index falls in the range of
   [0, ms->possible_cpus->len]
- The present vCPU is determined by checking ms->possible_cpus->cpus[index].cpu

However, other two states have to be determined by checking CPUState

- CPUState::acpi_persistent, for always-present vCPUs
- CPUState::disabled, for enabled vCPU

As suggested in other replies, we may manage the vCPU states from board level
due the fact: the vCPU state changes on Creation, hot-add or hot-remove, which
are all driven by a board. Besides, the hotplug handler is managed by board.
Lastly, scatting the information in different places (ms->possible_cpus->cpus[]
and CPUState), which helps to determine vCPU states, seems not a good idea.

In order to maintain all the information in board level, 'struct CPUArchId'
need some adaption like below. With it, the vCPU states can be determined
from ms->possible_cpus.

#define CPU_ARCH_ID_FLAG_ALWAYS_PRESENT		(1UL << 0)
#define CPU_ARCH_ID_FLAG_ENABLED		(1UL << 1)
typedef struct CPUArchId {
     unsigned long flags
        :
};

> 
>>
>> static inline  bool machine_has_possible_cpu(int index)
>> {
>>       MachineState *ms = MACHINE(qdev_get_machine());
>>
>>       if (!ms || !ms->possible_cpus || index < 0 || index >= ms-
>>> possible_cus->len) {
>>           return false;
>>       }
>>
>>       return true;
>> }
>>
>> static inline bool machine_has_present_cpu(int index)
>> {
>>       MachineState *ms = MACHINE(qdev_get_machine());
>>
>>       if (!machine_is_possible_cpu(index) ||
>>           !ms->possible_cpus->cpus[index].cpu) {
>>           return false;
>>       }
>>
>>       return true;
>> }
>>
>> static inline bool machine_has_enabled_cpu(int index)
>> {
>>       MachineState *ms = MACHINE(qdev_get_machine());
>>       CPUState *cs;
>>
>>       if (!machine_is_present_cpu(index)) {
>>           return false;
>>       }
>>
>>       cs = CPU(ms->possible_cpus->cpus[index].cpu);
>>       return !cs->disabled
>> }
>>
>>> +uint64_t qemu_get_cpu_archid(int cpu_index)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +    const CPUArchIdList *possible_cpus = ms->possible_cpus;
>>> +
>>> +    assert((cpu_index >= 0) && (cpu_index < possible_cpus->len));
>>> +
>>> +    return possible_cpus->cpus[cpu_index].arch_id;
>>> +}
>>> +
>>
>> I think it's unnecessary to keep it since it's called for once by
>> hw/arm/virt-acpi-build.c::build_madt. The architectural ID can be
>> directly fetched from possible_cpus->cpus[i].arch_id. It's fine
>> to drop this function and fold the logic to the following patch.
> 
> It is a very useful accessor API. I can see this code is being
> replicated everywhere which also means many time its related
> variables are repeatedly defined.
> 
> Maybe this is being used once now. But this can be used across
> architectures later.
> 

Ok, then please make it inline at least.

>>
>> [PATCH RFC V2 21/37] hw/arm: MADT Tbl change to size the guest with
>> possible vCPUs
>>
>>
>>>    CPUState *qemu_get_cpu(int index)
>>>    {
>>>        CPUState *cpu;
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index fdcbe87352..e5af79950c 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -413,6 +413,17 @@ struct CPUState {
>>>        SavedIOTLB saved_iotlb;
>>>    #endif
>>>
>>> +    /*
>>> +     * Some architectures do not allow *presence* of vCPUs to be changed
>>> +     * after guest has booted using information specified by VMM/firmware
>>> +     * via ACPI MADT at the boot time. Thus to enable vCPU hotplug on these
>>> +     * architectures possible vCPU can have CPUState object in 'disabled'
>>> +     * state or can also not have CPUState object at all. This is possible
>>> +     * when vCPU Hotplug is supported and vCPUs are 'yet-to-be-plugged' in
>>> +     * the QOM or have been hot-unplugged.
>>> +     * By default every CPUState is enabled as of now across all archs.
>>> +     */
>>> +    bool disabled;
>>>        /* TODO Move common fields from CPUArchState here. */
>>>        int cpu_index;
>>>        int cluster_index;
>>
>> I guess the comments can be simplified a bit. How about something like
>> below?
>>       /*
>>        * In order to support vCPU hotplug on architectures like aarch64,
>>        * the vCPU states fall into possible, present or enabled. This field
>>        * is added to distinguish present and enabled vCPUs. By default, all
>>        * vCPUs are present and enabled.
>>        */
> 
> I can definitely try to simplify it but above is not properly conveying the
> reason why we require the disabled state.
> 

Ok, I think the association between this field and MDAT still need to be
mentioned.
  
>>
>>> @@ -770,6 +781,48 @@ static inline bool cpu_in_exclusive_context(const
>> CPUState *cpu)
>>>     */
>>>    CPUState *qemu_get_cpu(int index);
>>>
>>> +/**
>>> + * qemu_get_possible_cpu:
>>> + * @index: The CPUState@cpu_index value of the CPU to obtain.
>>> + *         Input index MUST be in range [0, Max Possible CPUs)
>>> + *
>>> + * If CPUState object exists,then it gets a CPU matching
>>> + * @index in the possible CPU array.
>>> + *
>>> + * Returns: The possible CPU or %NULL if CPU does not exist.
>>> + */
>>> +CPUState *qemu_get_possible_cpu(int index);
>>> +
>>> +/**
>>> + * qemu_present_cpu:
>>> + * @cpu: The vCPU to check
>>> + *
>>> + * Checks if the vCPU is amongst the present possible vcpus.
>>> + *
>>> + * Returns: True if it is present possible vCPU else false
>>> + */
>>> +bool qemu_present_cpu(CPUState *cpu);
>>> +
>>> +/**
>>> + * qemu_enabled_cpu:
>>> + * @cpu: The vCPU to check
>>> + *
>>> + * Checks if the vCPU is enabled.
>>> + *
>>> + * Returns: True if it is 'enabled' else false
>>> + */
>>> +bool qemu_enabled_cpu(CPUState *cpu);
>>> +
>>> +/**
>>> + * qemu_get_cpu_archid:
>>> + * @cpu_index: possible vCPU for which arch-id needs to be retreived
>>> + *
>>> + * Fetches the vCPU arch-id from the present possible vCPUs.
>>> + *
>>> + * Returns: arch-id of the possible vCPU
>>> + */
>>> +uint64_t qemu_get_cpu_archid(int cpu_index);
>>> +

Thanks,
Gavin
