Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp448077ejc;
        Wed, 11 Oct 2023 17:04:32 -0700 (PDT)
X-Received: by 2002:a05:6000:60f:b0:329:6b3e:d87d with SMTP id bn15-20020a056000060f00b003296b3ed87dmr15381386wrb.42.1697069072523;
        Wed, 11 Oct 2023 17:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697069072; cv=none;
        d=google.com; s=arc-20160816;
        b=N+gnTdUOLUsI0ItHz7QtUGH799CqCYk0GnNjH/crym2fyCx7hGsSuDSbcxbcK9Tfb0
         MpMV+CLF0GqSD4Ap5VycBkQV3/DKwSvej+YAHCEZL1lUqMqjK61amduNCrHHRCGcRROf
         uYgOKEHKFyuaG9jk7XFzPep3gPohqS6z/xffusW48x5cEdDxLqrUWcSv0fCsvyZKwDDd
         w96i3+Yfi638Iahqfb0fbDS50s84CeJMFdiwPpG+J78b9DDGgFxklgI8JD1TY2rhX59p
         Vf1mpjLn8Rp6fV5xtXtmUtVJ9Jbem/2yqk75ZiHhKi9AJ+CV+fu54mINsaOE3wJWPcVq
         XSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=HupSkrEWNHMj1fERoz4SiEugGSlMx1IhoH/Ah1hz8KU=;
        fh=3xWa5j29J1Wrudhs12TTuzoFWLiWQy9CjQNY+tCzbSc=;
        b=TvWAZEQdgefW7iFFzWItziffoZTjddHgYaVxcmTnsFrlfiv3/FrH3JSh5V2E4AHiVO
         9MtZ2rPysEQWpDw6Cy7+NaNLU8SkeyEjbScBw3rNhxL+jcLXldSgUU4yXAVDNpFWnwtA
         g2k9kVRILDMpgUwP9OqPkeosZIYfvL2v5zHj0Mle7LFVBZFJYWlws6cskUpO36yO3ysO
         Dw7G2ho+7Q71qneTr6t1gB60/zz7R44rjAAKKU6xkAlDKbx0lHm6W8o8E1v6AthTkQYG
         +unosoGB5oFVBoW1WJ4JLeKRPIaOx5lvjXpE1wN+V8FdZE1ukTW7xu3UgJ3kvkNUgPq7
         xdjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=YHniHPan;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m22-20020a056000175600b0032d89b4bf77sor569571wrf.4.2023.10.11.17.04.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 17:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=YHniHPan;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1697069072; x=1697673872; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HupSkrEWNHMj1fERoz4SiEugGSlMx1IhoH/Ah1hz8KU=;
        b=YHniHPandYgiLMF2RzGcYH5VPBhqKJT176XpNNiggwV2bEUGs2QbjmIRdmWo3o0t67
         CcjZ//vEsG2sULpuk8tycmVOof3oJXiZwJm/Jf0sxVfW6/WiZwcDEBZ6fmXHab6T4kEZ
         UOF1LEnjHO/bjNiYEMiFBgkInhYoebm4IUBCOHXOszCx4D6kvx0UFx7ONwhPnC2V+Vb7
         ZvaynuypHc/z8gCFywEuKnkduOKQkQb6x5+II2sVkSz/fjCEDQAU4G/8m+fuFX3LrTAf
         7T9gPcl/ivnGyMqMEm1psI5TR7UKDNYDlHUmDO5WTIuqhXO/qb3ZZTQWhgWY1uIP+Lbx
         1v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697069072; x=1697673872;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HupSkrEWNHMj1fERoz4SiEugGSlMx1IhoH/Ah1hz8KU=;
        b=ZbSEkOx8vAGINtZbC5QbKWN2J0GpaVJKAv29PI0BU2X3Uxhcr4dXdgkd3ni/2lv0/o
         FBVilP7mIzzf7PK1L1zqSwR4cC7beXkpgY84DHVJglsrV7UCoQMV2WjAARyjdkOY/ciM
         97jfd/cz9/EEMacKvJqYXcBv/r0Zjqt+5LluT/xO2NXjiT1eZ2woxuxgwZEnqINtTNE2
         3fdvP7XCQDl7TaOsyJOJxkKP7YXIz7pXTDOYpRyNNC9sVnL2aMWy41vpLFzODvLhvnfL
         rBn9Kn7d2gFB+jRu2SePsnkP+ByZajUfSb70ezjvQpq6Y1YTpMXsMjY3gAA/WmDhUFGq
         1F7A==
X-Gm-Message-State: AOJu0YxvTSDOEGu3wEyS224nMeU2ndXWBE/fBRwYIWaoe57Ps7aHSeUa
	+c2PaDcODebHO5ju/iGCeS2DDQ==
X-Google-Smtp-Source: AGHT+IFOmWM/9hH+3k2udZcOlNFMutJ0qoGhgEP4ILSNOIbn0YBjKItBOQD9mEhZ3hnICZV4pOEWcg==
X-Received: by 2002:adf:fdd0:0:b0:321:6fe4:d4eb with SMTP id i16-20020adffdd0000000b003216fe4d4ebmr18813209wrs.2.1697069071887;
        Wed, 11 Oct 2023 17:04:31 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.8.0.16] ([185.223.232.243])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d4389000000b0031ad5fb5a0fsm16689726wrq.58.2023.10.11.17.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 17:04:31 -0700 (PDT)
Subject: Re: [PATCH V5 8/9] physmem: Add helper function to destroy CPU
 AddressSpace
To: Gavin Shan <gshan@redhat.com>, Salil Mehta <salil.mehta@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-9-salil.mehta@huawei.com>
 <69098d56-8b68-2734-ef40-7338386d7fa9@redhat.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Message-ID: <e73217f7-e6c2-81e7-0174-54ef575ebbce@opnsrc.net>
Date: Thu, 12 Oct 2023 01:04:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <69098d56-8b68-2734-ef40-7338386d7fa9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LSccIg+/UCH7

Hi Gavin,

On 12/10/2023 00:31, Gavin Shan wrote:
> Hi Salil,
> 
> On 10/12/23 05:43, Salil Mehta wrote:
>> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
>> involves destruction of the CPU AddressSpace. Add common function to help
>> destroy the CPU AddressSpace.
>>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> ---
>>   include/exec/cpu-common.h |  8 ++++++++
>>   include/hw/core/cpu.h     |  1 +
>>   softmmu/physmem.c         | 25 +++++++++++++++++++++++++
>>   3 files changed, 34 insertions(+)
>>
> 
> I guess you need another respin since 'softmmu/physmem.c' has been
> renamed to 'system/physmem.c' by 8d7f2e767d ("system: Rename softmmu/
> directory as system/"). 


Gosh. Will do.

So please consider leveraging the respin chance
> to address the following minor comments. With that,
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> index 41788c0bdd..eb56a228a2 100644
>> --- a/include/exec/cpu-common.h
>> +++ b/include/exec/cpu-common.h
>> @@ -120,6 +120,14 @@ size_t qemu_ram_pagesize_largest(void);
>>    */
>>   void cpu_address_space_init(CPUState *cpu, int asidx,
>>                               const char *prefix, MemoryRegion *mr);
>> +/**
>> + * cpu_address_space_destroy:
>> + * @cpu: CPU for which address space needs to be destroyed
>> + * @asidx: integer index of this address space
>> + *
>> + * Note that with KVM only one address space is supported.
>> + */
>> +void cpu_address_space_destroy(CPUState *cpu, int asidx);
>>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>>                               hwaddr len, bool is_write);
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 648b5b3586..65d2ae4581 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -355,6 +355,7 @@ struct CPUState {
>>       QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>>       CPUAddressSpace *cpu_ases;
>> +    int cpu_ases_count;
> 
> The prefix 'cpu_' is duplicate here because the container (CPUState)
> indicates it explicitly. I think it was inherited from @cpu_ases.
> Besides, @ases_count seems not better than @remaining_ases. If it
> makes sense, please rename it to @remaining_ases
> 
>>       int num_ases;
>>       AddressSpace *as;
>>       MemoryRegion *memory;
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 4f6ca653b3..4dfa0ca66f 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>>       if (!cpu->cpu_ases) {
>>           cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
>> +        cpu->cpu_ases_count = cpu->num_ases;
>>       }
>>       newas = &cpu->cpu_ases[asidx];
>> @@ -774,6 +775,30 @@ void cpu_address_space_init(CPUState *cpu, int 
>> asidx,
>>       }
>>   }
>> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
>> +{
>> +    CPUAddressSpace *cpuas;
>> +
>> +    assert(asidx < cpu->num_ases);
>> +    assert(asidx == 0 || !kvm_enabled());
>> +    assert(cpu->cpu_ases);
>> +
> 
> The two asserts on @asidx and @cpu->cpu_ases can be combined
> to one so that these 3 asserts can be combined to two.
> 
>         /* Only one address space is supported by KVM */
>         assert(asidx == 0 || !kvm_enabled());
>         assert(asidx >= 0 && asidx < cpu->cpu_ases_count)

We can do that.

I am not in favor to remove  'assert(cpu->cpu_ases);' as this can save 
lot of debugging.


> 
>> +    cpuas = &cpu->cpu_ases[asidx];
>> +    if (tcg_enabled()) {
>> +        memory_listener_unregister(&cpuas->tcg_as_listener);
>> +    }
>> +
> 
> We need to detach CPUState::as here if @asidx == 0 because the alias was
> populated in cpu_address_space_init(). Even the CPUState is going to be
> release pretty soon, we have inconsistent states temporarily.
> 
>         /* Detach the alias to address space 0 */
>         if (asidx == 0) {
>             cpu->as = NULL;
>         }


Yes. Good catch.

Thanks.


>> +    address_space_destroy(cpuas->as);
>> +    g_free_rcu(cpuas->as, rcu);
>> +
>> +    if (cpu->cpu_ases_count == 1) {
>> +        g_free(cpu->cpu_ases);
>> +        cpu->cpu_ases = NULL;
>> +    }
>> +
>> +    cpu->cpu_ases_count--;
>> +}
>> +
> 
> I'm not sure, but Linux's kref_put() decreases the reference count before
> the object is released. In order to follow that pattern, we need something
> like below. However, it's something related to personal taste, I guess :)
> 
>         if (--cpu->cpu_ases_count == 0) {
>             g_free(cpu->cpu_ases);
>             cpu->cpu_ases = NULL;
>         }

I can see your point but the only way this can cause race is when 
multiple CPUs are being destroyed simultaneously. I am not sure that 
will ever happen. Hence, this code might not either be required or will 
be insufficient to avoid the race you are pointing at.

Anyway, I do not mind changing to above.

Thanks
Salil.
