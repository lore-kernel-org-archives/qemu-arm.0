Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6221AD59D6F
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 17:07:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU6by-0005DD-4c; Fri, 12 Dec 2025 12:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vU6bl-00059T-Pm
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 12:07:11 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vU6be-0007O5-1c
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 12:07:04 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a087b2a9c0so2889735ad.0
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 09:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765559220; x=1766164020; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1NVVZdOVP6E8NLSkxgVuNngmwoczZxrxDt8x+mL5DA4=;
 b=hcU9pnj8zDJ8DVt8vHBrdqfSz0ATXKZ8UjrvDFOBMKH/dt5Htdhl24WYGYfKLsBqcH
 JGIGix1zG30BRr6pIYlI7Y6EzYcy361N3W/Ug81UWJwgRzpCJbUrX7eorO+HRTei9GyZ
 LFUUUck9ycEx9y7A3mfgGjjA9n9xC2C26+sZi+krizLd2D38o/gnWPKvYwcz9mRCYxGn
 FawO/cVQJ4f80I2TZ7O8PDGSh0kMOGx6Kf92KmP2MYyGYRo1iTVautplvs/OS56w4Q+Z
 VSolXwUkGPU5njA8QyXxLLvNOppR9/Uer9ZSoy86nJ7FFsGmIXjd/xHYgHz3LK1EmC7r
 KuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765559220; x=1766164020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1NVVZdOVP6E8NLSkxgVuNngmwoczZxrxDt8x+mL5DA4=;
 b=DTogg9sl8ew4ytgPUHDG94pQY0UozqrIDCRky+07TPMYaXQsMbmsxJMaq/S13wg25p
 wr8rcVBB8fTTqi26RjTFNP782iDKq8JxoRkoFN73R3br31u34RuGluthjcAQw6AkdAe8
 drnzzJTMpBD11MsZTBW/ThxkQ2Xe5ZtyeefeEB3gvnM+0DMGAi2Z9Qll0ilchkxvRNm3
 hMRZgPc+HFlPpFj5F2Da14cK/QV0NRCJppBeOUpjcITKLklvR7kV99Ss0HMngGXJwP1g
 wVz/5AbSILtvWiek+QRXpgwPPi5cKDh9ZbMUDgUnJM/DMH8DKMNb4PF0XJ/MR9WsuX2i
 cXPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkvQLbqKywj8/WHcLZ9Wqe6xC6ObTF4Wv/cVahJrDnNynLbJA+UcOByQKUg/eFItkTJgHzLIOACA==@nongnu.org
X-Gm-Message-State: AOJu0YyPY/Ezdl8sYGtSYAVRX05z73wMedwCo4rDCzWmHTu16IJobNgj
 9CASsIANdAV7rmKgMAD96ZYEm/X45ouTI2JpesKG2cNuxNu2w7YVF9S4dC3GNYBTVw8=
X-Gm-Gg: AY/fxX6pVc9lvGNFFRUgQ/mkeiOBxkOESs4cg68MLHUs2kVaxNqKhg1Cz8e0ienDujk
 /t4G5Knj7iTzhhJFDdp/I43lWtZee9rAKECoidq9vN41LdPFhd0VqmaAR0YoD8e7qSFC4q6szZ/
 yaszPOL9lrhBWuA9Nd/JfzVkp/be2vzsDkxzHgdNcYC3EYfdnKHI1Pr7qfOROoMtLem7coIlK1S
 rUu+JDENP4wT0QIs2DiMGZYPUgPmEYycs5LJO4Vae9QVFN3ilceMAp8PRPUM9xQ2FmHjGnpxtkM
 906KnAGcxPw9RW8BAti/oPEV0JlfBBgIVW9DbzlSsfFDsvofw+zuF36T7t0Dy418mtBUc2lmZd3
 crxdZ2nO2IsP4gu4ZvoZ1Wmw+JjgMfFy2PjqNe8FpsGlQfxSSInLeexhS+UVYBJGLunFJ3mGVnW
 kRWS2MjDRxtwkzu9V1Itwh45RpV8v1xqcKus8toqEwSHim1VgzN14VfOc=
X-Google-Smtp-Source: AGHT+IEODwVNb1RY3NyLpxSOXnqK3e+KGY9JqV4JxrNBup3kpIZvyCdLPoO3GTsMBxhGNlQhgBkBOg==
X-Received: by 2002:a17:902:ebd1:b0:298:3aa6:c03d with SMTP id
 d9443c01a7336-29f244cca9emr29682185ad.57.1765559220294; 
 Fri, 12 Dec 2025 09:07:00 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29f1eff8481sm27892715ad.80.2025.12.12.09.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 09:06:59 -0800 (PST)
Message-ID: <ca2a2c61-6209-4736-b537-a9657f5e5dd2@linaro.org>
Date: Fri, 12 Dec 2025 09:06:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmu: add memory regions as property for an SMMU
 instance
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 tangtao1634@phytium.com.cn, qemu-arm@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>
References: <20251211221715.2206662-1-pierrick.bouvier@linaro.org>
 <87a479e9-21eb-4c4c-8e64-32744eea1f96@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87a479e9-21eb-4c4c-8e64-32744eea1f96@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/11/25 10:16 PM, Philippe Mathieu-Daudé wrote:
> Hi Pierrick,
> 
> On 11/12/25 23:17, Pierrick Bouvier wrote:
>> This will be used to access non-secure and secure memory. Secure support
>> and Granule Protection Check (for RME) for SMMU need to access secure
>> memory.
> 
> Sorry yesterday it was late for me and I forgot to post the similar
> patch :/
> 
>>
>> As well, it allows to remove usage of global address_space_memory,
>> allowing different SMMU instances to have a specific view of memory.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/hw/arm/smmu-common.h |  4 ++++
>>    hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>>    hw/arm/smmu-common.c         | 24 ++++++++++++++++++++++++
>>    hw/arm/virt.c                | 16 +++++++++++-----
>>    4 files changed, 51 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index a6bdb67a983..0f08ae080c9 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -227,6 +227,10 @@ struct SMMUState {
>>        uint8_t bus_num;
>>        PCIBus *primary_bus;
>>        bool smmu_per_bus; /* SMMU is specific to the primary_bus */
>> +    MemoryRegion *memory;
>> +    AddressSpace as_memory;
>> +    MemoryRegion *secure_memory;
>> +    AddressSpace as_secure_memory;
> 
> Has SMMU concept of "secure memory"? My understanding is just a
> different memory to access GPT, so I'd name it "gpt_memory".
>

Yes, it has the concept of secure state, secure devices that can make 
transactions that target secure memory. The fact GPT is kept there is a 
detail of implementation, so secure_memory is the right term to use 
here, and match how we call it for cpu implementation.

>>    };
>>    
>>    struct SMMUBaseClass {
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 45d2e3e946d..840b1a216f4 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -616,7 +616,9 @@ static void create_xhci(const SBSAMachineState *sms)
>>        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(sms->gic, irq));
>>    }
>>    
>> -static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>> +static void create_smmu(const SBSAMachineState *sms, PCIBus *bus,
>> +                        MemoryRegion *sysmem,
>> +                        MemoryRegion *secure_sysmem)
>>    {
>>        hwaddr base = sbsa_ref_memmap[SBSA_SMMU].base;
>>        int irq =  sbsa_ref_irqmap[SBSA_SMMU];
>> @@ -628,6 +630,10 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>>        object_property_set_str(OBJECT(dev), "stage", "nested", &error_abort);
>>        object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>>                                 &error_abort);
>> +    object_property_set_link(OBJECT(dev), "memory", OBJECT(sysmem),
>> +                             &error_abort);
>> +    object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
>> +                             &error_abort);
>>        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>        for (i = 0; i < NUM_SMMU_IRQS; i++) {
>> @@ -636,7 +642,9 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>>        }
>>    }
>>    
>> -static void create_pcie(SBSAMachineState *sms)
>> +static void create_pcie(SBSAMachineState *sms,
>> +                        MemoryRegion *sysmem,
>> +                        MemoryRegion *secure_sysmem)
>>    {
>>        hwaddr base_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].base;
>>        hwaddr size_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].size;
>> @@ -692,7 +700,7 @@ static void create_pcie(SBSAMachineState *sms)
>>    
>>        pci_create_simple(pci->bus, -1, "bochs-display");
>>    
>> -    create_smmu(sms, pci->bus);
>> +    create_smmu(sms, pci->bus, sysmem, secure_sysmem);
> 
> As a preliminary cleanup create_pcie() returns the PCI bus, so the
> machine_init() can call create_smmu() itself. I'll post later.
> 
>>    }
>>    
>>    static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>> @@ -831,7 +839,7 @@ static void sbsa_ref_init(MachineState *machine)
>>    
>>        create_xhci(sms);
>>    
>> -    create_pcie(sms);
>> +    create_pcie(sms, sysmem, secure_sysmem);
>>    
>>        create_secure_ec(secure_sysmem);
>>    
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 66367adc2a4..5fbfe825fd0 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -1171,6 +1171,12 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>>            return;
>>        }
>>    
>> +    g_assert(s->memory);
>> +    address_space_init(&s->as_memory, s->memory, "memory");
>> +    if (s->secure_memory) {
>> +        address_space_init(&s->as_secure_memory, s->secure_memory, "secure-memory");
>> +    }
> 
> Allocating AddressSpaces on the heap:
> 
>          else {
>              s->as_secure_memory = s->as_memory;
>          }
>

What's the benefit?
SMMUState is already heap allocated.

>>        /*
>>         * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
>>         * root complexes to be associated with SMMU.
>> @@ -1235,10 +1241,28 @@ static void smmu_base_class_init(ObjectClass *klass, const void *data)
>>        rc->phases.exit = smmu_base_reset_exit;
>>    }
>>    
>> +static void smmu_base_instance_init(Object *obj)
>> +{
>> +    SMMUState *s = ARM_SMMU(obj);
>> +
>> +    object_property_add_link(obj, "memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
>> +
>> +    object_property_add_link(obj, "secure-memory",
>> +                             TYPE_MEMORY_REGION,
>> +                             (Object **)&s->secure_memory,
>> +                             qdev_prop_allow_set_link_before_realize,
>> +                             OBJ_PROP_LINK_STRONG);
>> +}
>> +
>>    static const TypeInfo smmu_base_info = {
>>        .name          = TYPE_ARM_SMMU,
>>        .parent        = TYPE_SYS_BUS_DEVICE,
>>        .instance_size = sizeof(SMMUState),
>> +    .instance_init = smmu_base_instance_init,
>>        .class_data    = NULL,
>>        .class_size    = sizeof(SMMUBaseClass),
>>        .class_init    = smmu_base_class_init,
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 5d205eff3a1..d446c3349e9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1514,8 +1514,9 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms,
>>                               0x0, vms->iommu_phandle, 0x0, 0x10000);
>>    }
>>    
>> -static void create_smmu(const VirtMachineState *vms,
>> -                        PCIBus *bus)
>> +static void create_smmu(const VirtMachineState *vms, PCIBus *bus,
>> +                        MemoryRegion *sysmem,
>> +                        MemoryRegion *secure_sysmem)
>>    {
>>        VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>        int irq =  vms->irqmap[VIRT_SMMU];
>> @@ -1549,6 +1550,10 @@ static void create_smmu(const VirtMachineState *vms,
>>        object_property_set_str(OBJECT(dev), "stage", stage, &error_fatal);
>>        object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>>                                 &error_abort);
>> +    object_property_set_link(OBJECT(dev), "memory", OBJECT(sysmem),
>> +                             &error_abort);
>> +    object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
>> +                             &error_abort);
>>        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>        for (i = 0; i < NUM_SMMU_IRQS; i++) {
>> @@ -1587,7 +1592,8 @@ static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
>>        }
>>    }
>>    
>> -static void create_pcie(VirtMachineState *vms)
>> +static void create_pcie(VirtMachineState *vms,
>> +                        MemoryRegion *sysmem, MemoryRegion *secure_sysmem)
>>    {
>>        hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
>>        hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
>> @@ -1706,7 +1712,7 @@ static void create_pcie(VirtMachineState *vms)
>>    
>>            switch (vms->iommu) {
>>            case VIRT_IOMMU_SMMUV3:
>> -            create_smmu(vms, vms->bus);
>> +            create_smmu(vms, vms->bus, sysmem, secure_sysmem);
>>                if (!vms->default_bus_bypass_iommu) {
>>                    qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
>>                                           0x0, vms->iommu_phandle, 0x0, 0x10000);
>> @@ -2520,7 +2526,7 @@ static void machvirt_init(MachineState *machine)
>>    
>>        create_rtc(vms);
>>    
>> -    create_pcie(vms);
>> +    create_pcie(vms, sysmem, secure_sysmem);
>>        create_cxl_host_reg_region(vms);
>>    
>>        if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
> 


