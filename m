Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2485118njb;
        Sun, 7 Jul 2024 22:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiXZfd1Vm1jbtpciDcXEVEdoUnTX07tdbevLy/zMm4A+gfcFhrqkz7AD3jzuGvqK45/ffsT+X1quSVvBATwhj8y0H+eLr7
X-Received: by 2002:a19:9152:0:b0:52e:9a91:bba3 with SMTP id 2adb3069b0e04-52ea064b2aamr7723638e87.15.1720415571343;
        Sun, 07 Jul 2024 22:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720415571; cv=none;
        d=google.com; s=arc-20160816;
        b=Tr/5mAFR9Qjb+2HONveMVdxDdMepTt3NLRU9ZNpP21uHrZzzQYjo9b2IXRYmmpONnV
         SFi4JHxZVzukAEkpz4A8AhwNqTKS7D2lGgVDp0LpXCcN9bjYe568ddLZ+WA9utzzezXF
         KsHFyLaHnAjXs143rQKT8H81XE01CjaMxO/95vRRdr0qC/JzxY6/7VIvbjBVQiMVw/QO
         YTXB3K9Z29EW+WV8hcADKOKaOvzbnirYygL0gYkRsIKj6q+F+Ux/cNFK7tgbO7CQhfwx
         0NF6EvGseVeBgrk3FZn5nPpgJ47rFXvBSEkdCjFQw24FWYrARWPxpYgrh32qfUIrp0Am
         2whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jqxTOFeQU2iWq1/HjV4ZOhu8fpH/gfzBGj0nrZu+NQ0=;
        fh=EM3PBx+TS4KiGir4WjPCaIms1c4hzLfRi7KIVQIdUuE=;
        b=R0y9tVPSXkdj6nxP/VWTl8TzpdEnC4ipF46YGnKMvH9nhae+QAPY4LhY8OxGPKSkLE
         W+gX9GZDyq+iqxwb2wpHiSn6jDs/GwzRPBf2WCUmmrtT30bsoAMsTvZA8YyE5mNm2gri
         DCZob+UTOYBkcuA0JFDFBa2c1P0+7F/3XyFBNaIqiSqM1FRMdpgo4l+Kf4kMCzufRw9o
         KkTbAQsWKGXtVR8KN8w4Ej5M7ob/1L7wIMj87IPU/mPrT4Y6dTtEQxuHcu+xNIWhkB6i
         9YR638D87XHIN5DeIK84JVMJm8jSC8iiT+oN7YdfAOH7uueIvYGGZ1cFLzKMVr2I64XS
         /k3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="TEOw+D9/";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52ea6ae60dbsor1942165e87.12.2024.07.07.22.12.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="TEOw+D9/";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720415571; x=1721020371; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqxTOFeQU2iWq1/HjV4ZOhu8fpH/gfzBGj0nrZu+NQ0=;
        b=TEOw+D9/qRc0YbnN58l9RUxoYl5u1+ZNmtYMIfGrtksSKCFvtzKuFUHvd/dzKP+mjn
         elX8BXllIQ4vXYBKKMB8n2nDUKWa793wEktVD+PrBKVySzedCNc9kc556alRmuFgKq2x
         MKgKRUTG4msITc3d2EStMRjhzSh1GmnJuOsQaWWwFeHwfZSpudsv2R1Td71UFd9uREGg
         trX4lF6sCH8UkMdUX9HqK+oWHnHGFbpcKQevEE1hpnjU0muwZ9F6uC3Jpeck2OiIbdYy
         1ldC0VtZi4LcjZoQcLnPOCCMw802zL3Y4KNBPadauGZkQVMJuXOZi4AOyfwkQ/H0s8UA
         0cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720415571; x=1721020371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqxTOFeQU2iWq1/HjV4ZOhu8fpH/gfzBGj0nrZu+NQ0=;
        b=RCnbEGlGfvQySoyv1Zj7kFju43XaE9a1YDVA1rPF7Od/V/Obl3ewnN2knGT45iUj/a
         fkj6nXNULGaS7DK+COu9s6NGiBVNnrZeJPK6BLR1DOuQM0OmNpxpYHXwRmfPdotCJ366
         asEf73jIXBoLX17dEQ8zXODe/+u2FdQOdE+Wg4cpDz2EH+dq20MeM6/F5b0zTWEcycTO
         P6M58WLEIVAv56DP0zwXTcMS1nItqj7myzaJdnpSwwrJVi8nEdpA8an9/mSwPl6E5LLB
         Kut2IKQLKvcJ9NFghb8kDQ0NUwP8HgwAmDAQirhO9H3nwQp+haz+XkJ2pCeKDNEowfbO
         luDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtM0E4Lnw8+8FXioh2obO3aGDLPbyadE9FnApAN7L9T1IQiipXsyVN/rhCS5k7Zz37MFUVksTAGdgM4LWPQSBmHZ3JPvVW
X-Gm-Message-State: AOJu0YyFLsbXxvMOsERnwVhTQhq1JOobbFmiUxr3KpgsbN0saAquqe11
	oB0IPphz5YnpefTMEjhD212QEGMQeDMZhuMeosVWz03YmXBAQtKdxkzZ+Tshbqc=
X-Google-Smtp-Source: AGHT+IGXInKd71qlZaOrrT33sRSJ3LwomIsUbQoWs4hd29kncEf36qVRpQzmAIZ4hNmYtAjTa0zd8g==
X-Received: by 2002:a19:434a:0:b0:52e:9f17:8418 with SMTP id 2adb3069b0e04-52ea06368eemr7085022e87.12.1720415570505;
        Sun, 07 Jul 2024 22:12:50 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266c3650f4sm8846945e9.1.2024.07.07.22.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:12:50 -0700 (PDT)
Message-ID: <c74b6d5e-1939-48df-ae21-9cdd4158a683@opnsrc.net>
Date: Mon, 8 Jul 2024 05:12:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
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
 <20240607115649.214622-4-salil.mehta@huawei.com>
 <20240706154640.0a45c5d6@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706154640.0a45c5d6@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5N9+8oT6QfCC


On 06/07/2024 13:46, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:44 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
>> _CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
>> notified event by evaluating ACPI _EVT method to know the type of event. Use
>> ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.
>>
>> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
>> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
>> stub to avoid compilation break.
>>
>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Tested-by: Xianglai Li <lixianglai@loongson.cn>
>> Tested-by: Miguel Luis <miguel.luis@oracle.com>
>> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>> ---
>>   hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++++
>>   hw/acpi/cpu.c                          |  6 +++++-
>>   hw/acpi/generic_event_device.c         | 17 +++++++++++++++++
>>   include/hw/acpi/generic_event_device.h |  4 ++++
>>   4 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
>> index 3fc4b14c26..c6c61bb9cd 100644
>> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
>> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
>> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>>       return;
>>   }
>>   
>> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>> +                         CPUHotplugState *state, hwaddr base_addr)
>> +{
>> +    return;
>> +}
>> +
>>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>>   {
>>       return;
>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>> index 69aaa563db..473b37ba88 100644
>> --- a/hw/acpi/cpu.c
>> +++ b/hw/acpi/cpu.c
>> @@ -221,7 +221,11 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>>       const CPUArchIdList *id_list;
>>       int i;
>>   
>> -    assert(mc->possible_cpu_arch_ids);
>> +    /* hotplug might not be available for all types like x86/microvm etc. */
>> +    if (!mc->possible_cpu_arch_ids) {
>> +        return;
>> +    }
> if hotplug is not supported, this function shouldn't be called at all.

True. But none the less this gets called for Intel/microvm and causes 
qtest to fail.

I think, we've had this discussion before last year as well. Please 
check below:

https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-820f4a254607@opnsrc.net/

>
> [...]
>> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>>       memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>>                             TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>>       sysbus_init_mmio(sbd, &ged_st->regs);
>> +
>> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
>> +                       ACPI_CPU_HOTPLUG_REG_LEN);
>> +    sysbus_init_mmio(sbd, &s->container_cpuhp);
>> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>> +                        &s->cpuhp_state, 0);
> suggest to move this call to realize time, and gate it on
> ACPI_GED_CPU_HOTPLUG_EVT being set.
> Platform that supports cpu hotplug must optin, setting ACPI_GED_CPU_HOTPLUG_EVT,
> while for the rest it will be ignored.
>
> for example: create_acpi_ged() : event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;

Similar case applies to the Memory hotplug as well and any cleaning here

will mean going beyond the realms of this patch-set. But I can definitely

take this activity in a separate patch-set if you wish?

Thanks

>
>>   }
>>   
>>   static void acpi_ged_class_init(ObjectClass *class, void *data)
>> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
>> index ba84ce0214..90fc41cbb8 100644
>> --- a/include/hw/acpi/generic_event_device.h
>> +++ b/include/hw/acpi/generic_event_device.h
>> @@ -60,6 +60,7 @@
>>   #define HW_ACPI_GENERIC_EVENT_DEVICE_H
>>   
>>   #include "hw/sysbus.h"
>> +#include "hw/acpi/cpu_hotplug.h"
>>   #include "hw/acpi/memory_hotplug.h"
>>   #include "hw/acpi/ghes.h"
>>   #include "qom/object.h"
>> @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>>   #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>>   #define ACPI_GED_PWR_DOWN_EVT      0x2
>>   #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>>   
>>   typedef struct GEDState {
>>       MemoryRegion evt;
>> @@ -106,6 +108,8 @@ struct AcpiGedState {
>>       SysBusDevice parent_obj;
>>       MemHotplugState memhp_state;
>>       MemoryRegion container_memhp;
>> +    CPUHotplugState cpuhp_state;
>> +    MemoryRegion container_cpuhp;
>>       GEDState ged_state;
>>       uint32_t ged_event_bitmap;
>>       qemu_irq irq;
