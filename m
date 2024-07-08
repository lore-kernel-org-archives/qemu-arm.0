Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2488731njb;
        Sun, 7 Jul 2024 22:26:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwdT96DQBsmmIsYBxmNj/sf8s5nBmG5SIuEcO8NLh+QwSmCcWjY1Y/kUWWirLHNyBFolBRdQgVU83d/IuMU45vDSzeUUP/
X-Received: by 2002:a05:600c:3ba0:b0:426:6004:cc97 with SMTP id 5b1f17b1804b1-4266004cd86mr37429015e9.38.1720416362978;
        Sun, 07 Jul 2024 22:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720416362; cv=none;
        d=google.com; s=arc-20160816;
        b=Te9ZcsrDydEoHqDXKxVqn0ZAntt/XdQwEpXeYretskioXbNW0dfQDd1pNYTCgapQcr
         UrnoKDGJenD7hCG2ZMfdFnalo+lL6gAcc4qyTQwFvFJG/5/k9gUiUzWXQcg2yXmH98oF
         G8LtkMtFQUwhYTaN3JZVGEK7Di4NwbosItHT47NLylwrWVigxUZPvxps8SipREPJrOC+
         jAGnKyrcDDldmJcaSb1aiwrcuoxxO0poAz1LBFOCHll55munsdZg1TUnRYeCKGSCHzK4
         oL5aYWkrBJYCVhRfOA4vYokYfbls6FYeTEkrEyXEBOGnhOBK9/OMK3lfZhgqsi1hS9LJ
         WukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZpayKAEFxEVZAaH4ZWrn0Q1u51XQ6H3kIZWM2t9BbaA=;
        fh=VuULuEGeNfKb3+OT9qYtMiwobjaUBAldZwL4G6KkI5k=;
        b=nBM9BCyIxsYATzCMZBuih1BK32bJstplT0Z6qwtVnm19giuyICzu0JVOCmk2Z8yAML
         Sg0EAucqBlZF+6FDh1OWBOECda0dXoKiGKGXDZY/S4ZnEBHqSMinSGtEB8pImUl7YvSU
         URVMjQrtrCqp9wexwxBS9Ml4VpkZaeGrbfjXC8k1jRUxxxZg63+wO+qVeRsdejRRs50w
         dNRM84BAeajBvNLG2aIXGBOFmh1rsaEeXAFUGI1+8Hy8QOKmPJM7l0EmhepO97xnSzSO
         92eLWA2qtVfNhHqUbRFrtRxPf8ne3aSlTivirZfX+Mlh5ZYTDQ8f9gLKmrBku8uZLRnv
         J56g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=WxcgTJx3;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42664000f69sor5419125e9.6.2024.07.07.22.26.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=WxcgTJx3;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720416362; x=1721021162; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpayKAEFxEVZAaH4ZWrn0Q1u51XQ6H3kIZWM2t9BbaA=;
        b=WxcgTJx3aZbORIm41s3PvDLr4hpuFa6AWgBtvpGlHn/GD8BFmcg+zR4xVUR/k3VMDy
         E7Fj6iDYCcUnLzPb0WoVg1SNOQDBT9pd1DqkZHVyZw6xnR+ZqwsprNrM8uC98JVIe2tv
         8oS4RrDBSSR+gaMKAGs4zbeJec4KRZm1h6oYT3v57APSbmyKt78wMA9xlb8Uq4TRcB01
         KOktPzJdkDuN7UcweXpR9a3GHBsI0jD3TSqGt+geEicWyz3TKgg6ODIWdpwj2du8jl5S
         IWR7IKZwCB88NbmRwlmT3BEmo+Gsd3n/u9oINbEtpI6E4wkF6R2LyXYFqJvj632Sxsbq
         eL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720416362; x=1721021162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpayKAEFxEVZAaH4ZWrn0Q1u51XQ6H3kIZWM2t9BbaA=;
        b=ejCpXIebt/w2LYxo75nskycJZOC2GNmSu05xvA/6YvrV7wDz2jgo9BgIsT3wpUswB7
         d6SHy3LonelXQsCE4Bp4aOBv+LAT8KkedgHgJ4JeAOwPyiaRirWWNbQdNLcoFE8frHva
         cb6t4QhyxFVknROGSVOVxXW6CJDXj4Uawqp2HpUIZ4+aKdd3FasUVztwBYMbGWZzK7A8
         sRS5cvvDrIF7atKFiqHxokME4wzC4HssJ/zOF/wLp3tvc6kHxO2RYmlDAPZTkX5yHxPY
         LkkitytWQEitEP5nJx5G1ixR0xL5gad+6VMzyDzQnGaaypV8+TzhyOgHP7PzPma7jx6Z
         LbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6aRKV/FJUXD4m70nZ5Han63pJa67zWBgwDg4V3d2V6TJuvZgr/gXFAPIHgLxemt0HIzNyz/3DrDQRhGXPht9GtNUddK5
X-Gm-Message-State: AOJu0YzrrNxsus97E0CLe4pO+9FamIkgrbqILHWACbPb7S13N4OKO9F9
	tpN+gavm2NvC4DdnqvPQU43+LhFOr2V/eDtAsHE/8dCam5MLIY3ZhkdIKTOdZnI=
X-Google-Smtp-Source: AGHT+IHqcypsvI4nhxIkIUzc4evH06LudLehZUsBxEDIKMu4wz5KFX4ie3ZXJIa/HoXZV6mWoci0tQ==
X-Received: by 2002:a05:600c:4393:b0:426:5de3:2ae5 with SMTP id 5b1f17b1804b1-4265de32becmr47748575e9.10.1720416362366;
        Sun, 07 Jul 2024 22:26:02 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d50f5sm148779385e9.9.2024.07.07.22.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:26:01 -0700 (PDT)
Message-ID: <020c731c-8bfc-4524-9750-879dd44b6cfe@opnsrc.net>
Date: Mon, 8 Jul 2024 05:26:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
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
 <20240607115649.214622-6-salil.mehta@huawei.com>
 <20240706163524.012b6caf@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706163524.012b6caf@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4nBy0T8JE8Kk

On 06/07/2024 14:35, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:46 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
>> based and existing CPUs AML code assumes _CRS objects would evaluate to a system
>> resource which describes IO Port address. But on ARM arch CPUs control
>> device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
>> evaluate to system resource which describes memory-mapped base address. Update
>> build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
>> update the _CRS object.
> ack for above change
Thanks
>
>
> but below part is one too many different changes withing 1 patch.
> anyways, GPE part probably won't be needed if you follow suggestion made
> on previous patch.

The change mentioned in the earlier patches might end up creating

noise for this patch-set as one will have to touch the Memory Hotplug

part as well. I'm willing to do that change but I think it is a noise for

this patch-set, really.

>   
>> On x86, CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
>> notify OSPM about any CPU hot(un)plug events. Latest CPU Hotplug is based on
>> ACPI Generic Event Device framework and uses ACPI GED device for the same. Not
>> all architectures support GPE based CPU Hotplug event handler. Hence, make AML
>> for GPE.2 event handler conditional.
>>
>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>>   hw/acpi/cpu.c         | 23 ++++++++++++++++-------
>>   hw/i386/acpi-build.c  |  3 ++-
>>   include/hw/acpi/cpu.h |  5 +++--
>>   3 files changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index af2b6655d2..4c63514b16 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -343,9 +343,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
>>   #define CPU_FW_EJECT_EVENT "CEJF"
>>   
>>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>> -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
>> +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
>>                       const char *res_root,
>> -                    const char *event_handler_method)
>> +                    const char *event_handler_method,
>> +                    AmlRegionSpace rs)
>>   {
>>       Aml *ifctx;
>>       Aml *field;
>> @@ -370,13 +371,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>           aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
>>   
>>           crs = aml_resource_template();
>> -        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
>> +        if (rs == AML_SYSTEM_IO) {
>> +            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
>>                                  ACPI_CPU_HOTPLUG_REG_LEN));
>> +        } else {
> else
>   if (rs == yours type)
>> +            aml_append(crs, aml_memory32_fixed(base_addr,
>> +                               ACPI_CPU_HOTPLUG_REG_LEN, AML_READ_WRITE));
>> +        }
> else assert on not supported input

Sure, no problem. I can incorporate the change.

Thanks, Salil.

>
>> +
>>           aml_append(cpu_ctrl_dev, aml_name_decl("_CRS", crs));
>>   
>>           /* declare CPU hotplug MMIO region with related access fields */
>>           aml_append(cpu_ctrl_dev,
>> -            aml_operation_region("PRST", AML_SYSTEM_IO, aml_int(io_base),
>> +            aml_operation_region("PRST", rs, aml_int(base_addr),
>>                                    ACPI_CPU_HOTPLUG_REG_LEN));
>>   
>>           field = aml_field("PRST", AML_BYTE_ACC, AML_NOLOCK,
>> @@ -700,9 +707,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>       aml_append(sb_scope, cpus_dev);
>>       aml_append(table, sb_scope);
>>   
>> -    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
>> -    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
>> -    aml_append(table, method);
>> +    if (event_handler_method) {
>> +        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
>> +        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
>> +        aml_append(table, method);
>> +    }
>>   
>>       g_free(cphp_res_path);
>>   }
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 53f804ac16..b73b136605 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1537,7 +1537,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>               .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>>           };
>>           build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
>> -                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
>> +                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02",
>> +                       AML_SYSTEM_IO);
>>       }
>>   
>>       if (pcms->memhp_io_base && nr_mem) {
>> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
>> index e6e1a9ef59..48cded697c 100644
>> --- a/include/hw/acpi/cpu.h
>> +++ b/include/hw/acpi/cpu.h
>> @@ -61,9 +61,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
>>                                     GArray *entry, bool force_enabled);
>>   
>>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>> -                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
>> +                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
>>                       const char *res_root,
>> -                    const char *event_handler_method);
>> +                    const char *event_handler_method,
>> +                    AmlRegionSpace rs);
>>   
>>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
>>   
