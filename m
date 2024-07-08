Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2488920njb;
        Sun, 7 Jul 2024 22:26:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpjunV9NaV9bXvoSOoLno21ltwp9VqdAJ3tN7TMzEqqwzPigr0p8ZlqUJ/BjmrkkxFydRwSwBVXGPIj2oll4vs7yYsY82g
X-Received: by 2002:a05:6512:2fb:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-52ea06b0f0dmr8728291e87.43.1720416416213;
        Sun, 07 Jul 2024 22:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720416416; cv=none;
        d=google.com; s=arc-20160816;
        b=IImSI69sHnFLQ4jQiz4ooQM6KdkbCdUGrqIFnjRlVyJwS6lV7fHqe2v1dIg2i8PzIj
         /5ejRcIxeh6pvRxlxxvCeiQqzf+g8At5P/ZAJJvOvEQ6GycWtxtyJRxOL1abyQfLvi1j
         er3wEXivfnV9H7/LqyKusq1lTpWKkC5hu7a2rJNPiTUqwsRB2D5VNAqm/rpdCnXySBrJ
         Q5q3iiTYwHedgyobEX3xs2ek4FS1TSsUCTirbO6RlsmDQEO3+Mlm337ufH/Lyb79Ra8M
         GgcIMWC/SOWViSL9bm5nZGcA6TbPnLpwAS9PfrHck8EDrYFVqPxykswpIWxnwuDrz5E2
         IdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R/DeiRpjh0GXdaS/rrFXzjHReveWUeCqSmh6wE1DD64=;
        fh=VTyMdoovp98ggm+wBIhPdvkvWtM2IkGCxJXdOZJC9Y8=;
        b=s1BI7ed7UKvGt0Lh7+W9wVesUxKV5NfzExWWFFvCK5wjhVoP0q6oqwz/g7AGmUb4Z/
         hhyp+emTXGXG4WgxIEG1ydtYbgxt96oLyMu/Q8zeBFpK4jXjKeca9zJ1FgrMQdEElkcZ
         iBMz7HhfPEy7WgX5UW9yyDHYevZhZonuPeDzZZu3PC0fp352McCGkVsJsyS+rM8cMdbc
         96Z/uOkBrKwn7SLJ0J0RmDmKnPYi9pQXMZn70bH03CG83YP2DgEwiEvEHrvwRJyxGCby
         0Dl3w+RKcf4bXb1he292i3NmrSp8KxBTSFbimrDxTuSQ/3Um9/OWndnT1ikk1nvb2ilh
         wjJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=PSrZOaw1;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4265cc381besor11004825e9.7.2024.07.07.22.26.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=PSrZOaw1;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720416416; x=1721021216; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/DeiRpjh0GXdaS/rrFXzjHReveWUeCqSmh6wE1DD64=;
        b=PSrZOaw1I8S13PDQWOD9iF0gDesS098O+XckOfHLHqKsBWjRNb5rZDfhISFG+aUvt4
         v6/cqGVaZPPZ1/qHHqpWiCgTyb67IAQLLuQahwXw5SPl6tbmPNW+1HzqwflgfGDlWocH
         5LKNNvPdWFTitAUL4zrh8yEx2P6Pid5c9a7tAiTC4koE3eTfL21AGCJRZeVZA3xrqZr+
         +0yfT4gx47qIwHxpoWshQlXy0b11Xjr5W3mQoeeFcRzcGGFt2JzWsuAxWbesBaCOmNya
         S/Pd3FkAeAcwwqln0GecEWoSt8CJV3BbXMHRt+Kmm8QnB7ybC3CIFadyO1axjQ/xpmG+
         QEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720416416; x=1721021216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/DeiRpjh0GXdaS/rrFXzjHReveWUeCqSmh6wE1DD64=;
        b=jc5a8C/NUaYBV0if6HrQDFGUwqpxDg2MSkkvEpZal3CDe9iReXGqU74Lv6iwQARKkI
         sT25N0IlIdtDkXp9En9DBQ6ss7mk/jcYZ6+Wgc/iYV/2dsJtk1db1O1SSev627wp0Yy2
         axdxwETiPZPfmst3kF91LIFzSsou1nyGk6jeF+kXqe6yQN+ysuUUkKqxnw6aCINZunRE
         qochHT/qIAUW4rdRojcEzEzCyEZ3sx4epxfLVwcfcSl4FUgrIF5k1w54BzhkVnfwTlc7
         ddkO+2y713mMaHrXBT6Oa/AlSnYZXB2lU9le8rKSTKpgWmLJkczbyiUBvLNh3xMDF0oc
         69tw==
X-Forwarded-Encrypted: i=1; AJvYcCW1qiKQ0Eg1dJuLOyQV9wlXnlaJcPhUISEpbdtYzXhCsoJ9eE3ZVzQixrq6IIssMVep37b3Kg8/gDx9utrQb52NBQ4G/6dp
X-Gm-Message-State: AOJu0YzCP6ta/zJKF5fujz1J2cF6vqb1AOwi9PUeFLKz5qGwy5F3s5Oy
	Ktvh4IqhaTqFLKccRe1CAM2OG+xCQloQh3g5pIZeoHnucq74QuSxUU09pJxB2YI=
X-Google-Smtp-Source: AGHT+IEXDtT0MJkQ0T3ZZFmiaEmN65ghdH9fEeb9RuZmHgK605Z4GpIm0fEwoyzzqHM7WG80cCiTnw==
X-Received: by 2002:a05:600c:4202:b0:426:66fe:8051 with SMTP id 5b1f17b1804b1-42666fe8219mr21466175e9.24.1720416415459;
        Sun, 07 Jul 2024 22:26:55 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266dd5eca3sm841795e9.21.2024.07.07.22.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:26:55 -0700 (PDT)
Message-ID: <3ff1db66-0947-4876-96f6-53f228e0b74d@opnsrc.net>
Date: Mon, 8 Jul 2024 05:26:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
To: Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-7-salil.mehta@huawei.com>
 <20240706163704.524ba618@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706163704.524ba618@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vkT/dKv09hdk

On 06/07/2024 14:37, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:47 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
>> involves destruction of the CPU AddressSpace. Add common function to help
>> destroy the CPU AddressSpace.
>>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
Thanks, Salil.
>
>> ---
>>   include/exec/cpu-common.h |  8 ++++++++
>>   include/hw/core/cpu.h     |  1 +
>>   system/physmem.c          | 29 +++++++++++++++++++++++++++++
>>   3 files changed, 38 insertions(+)
>>
>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> index 815342d043..240ee04369 100644
>> --- a/include/exec/cpu-common.h
>> +++ b/include/exec/cpu-common.h
>> @@ -129,6 +129,14 @@ size_t qemu_ram_pagesize_largest(void);
>>    */
>>   void cpu_address_space_init(CPUState *cpu, int asidx,
>>                               const char *prefix, MemoryRegion *mr);
>> +/**
>> + * cpu_address_space_destroy:
>> + * @cpu: CPU for which address space needs to be destroyed
>> + * @asidx: integer index of this address space
>> + *
>> + * Note that with KVM only one address space is supported.
>> + */
>> +void cpu_address_space_destroy(CPUState *cpu, int asidx);
>>   
>>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>>                               hwaddr len, bool is_write);
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index bb398e8237..60b160d0b4 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -486,6 +486,7 @@ struct CPUState {
>>       QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>>   
>>       struct CPUAddressSpace *cpu_ases;
>> +    int cpu_ases_count;
>>       int num_ases;
>>       AddressSpace *as;
>>       MemoryRegion *memory;
>> diff --git a/system/physmem.c b/system/physmem.c
>> index 342b7a8fd4..146f17826a 100644
>> --- a/system/physmem.c
>> +++ b/system/physmem.c
>> @@ -763,6 +763,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>>   
>>       if (!cpu->cpu_ases) {
>>           cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
>> +        cpu->cpu_ases_count = cpu->num_ases;
>>       }
>>   
>>       newas = &cpu->cpu_ases[asidx];
>> @@ -776,6 +777,34 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>>       }
>>   }
>>   
>> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
>> +{
>> +    CPUAddressSpace *cpuas;
>> +
>> +    assert(cpu->cpu_ases);
>> +    assert(asidx >= 0 && asidx < cpu->num_ases);
>> +    /* KVM cannot currently support multiple address spaces. */
>> +    assert(asidx == 0 || !kvm_enabled());
>> +
>> +    cpuas = &cpu->cpu_ases[asidx];
>> +    if (tcg_enabled()) {
>> +        memory_listener_unregister(&cpuas->tcg_as_listener);
>> +    }
>> +
>> +    address_space_destroy(cpuas->as);
>> +    g_free_rcu(cpuas->as, rcu);
>> +
>> +    if (asidx == 0) {
>> +        /* reset the convenience alias for address space 0 */
>> +        cpu->as = NULL;
>> +    }
>> +
>> +    if (--cpu->cpu_ases_count == 0) {
>> +        g_free(cpu->cpu_ases);
>> +        cpu->cpu_ases = NULL;
>> +    }
>> +}
>> +
>>   AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>>   {
>>       /* Return the AddressSpace corresponding to the specified index */
