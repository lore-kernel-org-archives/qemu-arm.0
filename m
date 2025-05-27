Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4944955njc;
        Tue, 27 May 2025 09:44:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlNr9YojXvqCtzRm1TiG0jpqYrhdvQaSKsbp0WzCdegJpnvZiSNy1JC3ErpIoJNMNZoXI1+kqX3sAwAA==@linaro.org
X-Received: by 2002:a05:6102:5091:b0:4dd:ba32:3c95 with SMTP id ada2fe7eead31-4e4240bc301mr9241899137.14.1748364279623;
        Tue, 27 May 2025 09:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748364279; cv=none;
        d=google.com; s=arc-20240605;
        b=kVdwb+kVSJVsBKp1g+lkJGmsv2EZSXioKUY+4coxtQykslrNUZs3MXQrKqocJrziNc
         9xjDi4YPVo952+d9BOleF7lSsnWmsCdCWOLJJRQeCnEsmiYED5cVY5+aQEOUhy6vE6ji
         vjil46xDIqirDMl+EVHwFZQhooMiAOR6JfjWXxWdIg6LPxf3ObosDKfhtx00apPovs0o
         gdYukoZFDuaC5tK/Qumr/oD0EzXC1wRSOPIrI89uLBnT1cQ1WRF5sMAJqkghM0+rzXJW
         WbBfWKgUGwrnbJTkT2IqPJTYoaqg56YjJ3KII1L6+/fWEDTO9etqkGMoEYsPWd6IrshV
         UAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fWACtrWaalwAXArq6dkgQ4lC7sW9OgiHvzv/SihIMIE=;
        fh=JW5mZkK4Et2tkZ1uibYPRqfU8Y5Rq94uoLqMtxZBZ7g=;
        b=Mj1Dk7dVD4SSuWCGYZc9x53IDZtSMF7dP0ZVtD0Cm5Ch1m1Tz9Id6tSZg059DxLcN+
         NIIBm1Ey5Vw/Pt1slnnw8RfepuIwZzmSZNADyZcT0rkZCa5rRbCtkpsH38kegMAgvhgr
         1a9stPY5xNIXaYfUODycM1HLcDRv+MIqCnHhnfGoC/DXK6eP3upcaztuhdEr3GLNwZyK
         8wASWcEjO347zy0TBl0wOdHLP9u5mIcMCfHYalqQ+jRp9a6y3JvE47V0JyV+y8qPpni3
         pGsWgehtccGLlpBBWgbthoJilnE/BtQzxfcevnTA4CgbR1aucH/QPxvlFFZWDBzntJxN
         KjVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mpga6/cn";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4e55f2e1d64sor336051137.8.2025.05.27.09.44.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 09:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mpga6/cn";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748364279; x=1748969079; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fWACtrWaalwAXArq6dkgQ4lC7sW9OgiHvzv/SihIMIE=;
        b=mpga6/cnrYvzpKiQ3+ZJzC3/j1UyH1sQCb7bk9o2nSaOCQgGKivI5rQRlTXjp7GsMp
         cDesV0Kyj69aRO/RovRUkN2IW4ixxl4bkhBbR4ABxRwFSW3poN2+7j6WxgXfZGexO5lt
         02Dqk//xPyAS4L+s4tM27gfPNhBGo//smIg/TzK/+zCuWDMAx0uYWD+kqCD3p8MTCk1B
         W2wRgOL/q+d1FMdho7qpQrDukMHENQxJKSPhwmyVI7VzhUJVSIc5LXrsEvdkE16KgQeq
         AnnZE8/ICBbPZYgb4nRzvmfZIgFA+8PLFr68AtRCOvxIMZcKZYiVv53C1VeHaaft5zXI
         MtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748364279; x=1748969079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWACtrWaalwAXArq6dkgQ4lC7sW9OgiHvzv/SihIMIE=;
        b=rZElHdXtcuHXic4Cm3sCdUHNAfT1f697i6b9GM2g6F0n6G7PXsoOrFwGFiRZ2lsuZt
         Gweu3dvE/VKNVKR3udjP/UsbQHEBm8XWuEsTBJC8uTKmZL6DeU/wQq7/rwnE4AL6Nzky
         lQxLRtm1FVxmDDKvrgWHveD/fNRkOlZLLZAV19t/EAT3ex9F69WVgmKJftlVXGBxudL9
         wr9/zPbCQfRMvZ2ig2yqEdxV4Zg9hx1egjjPgNxSPnHUBw1o1HOVY7Swn9lHsQ1WJM7a
         BgllJUUAJbwW6JKRgHnb+zncnpuG/XQ41IPqXoYPogwQkztKh+rTn50LWLamt5MIP+bY
         4usg==
X-Forwarded-Encrypted: i=1; AJvYcCX7TC7rjUIeMOd86+5AbBRVJLTHpTNmGB2+ccT/RZh50HxxU8gB3HBQmXREL0GkjXZem9eV9d6Qy44CGA==@linaro.org
X-Gm-Message-State: AOJu0YxoHI3cSkeWdthvYDBtcIIcBMmRyMmels/BvtEDiNRPbrUcETTO
	HgW3XmlgEh+onFPpcrUtvYkL1GbnGm0UveGTBF8z3CGeatOnfLcgQw8yE8+GBFgxucleUA==
X-Gm-Gg: ASbGncuzjXeC4eJXQO67arEWle60o7k62vr1j7t5piyHD2G1DSQMyZQxMHvW4p4H/k2
	euOkRHGY6tfKAd4E1x3SLEBIUplbdWF7Dfgvj8FtdSLDqh6o3aQ5sgDZWUJ+KQ57bQOJiqhV4qx
	fdl/y+3R8MhPRecX0mLKG+5Em6ufDRpBfo1XHeXdeXho9ZX2Z2tB1Mecd1zWv2w18g/cH05Neqv
	H5GYf0bCQtMTkz5VeTvgfQpsWY5XNhD8kAKsmlWv+X+cIeq98ydhZqyd1tiI4YH0xPvKrUoeE8J
	9RcEoLB4cqOWf0QLvbGzecwg8oFrsJnbzuT86MCTYlsv80SVerI/zLwPwqo1neHEOOuBc3qRMwI
	BiUJ1FIOF4Kw7lP0TE3Yj0V98fCKflw==
X-Google-Smtp-Source: AGHT+IH/aVe/baAiP+S78+Cd+i2KH+a20RigpR3mjwak07uFiW1Gk2M7EbR3eKXViU9xroP7ZJpCAw==
X-Received: by 2002:a05:6102:3f06:b0:4e2:bacd:9f02 with SMTP id ada2fe7eead31-4e4241609f7mr10014108137.16.1748364279113;
        Tue, 27 May 2025 09:44:39 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586? ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e459aa1ca7sm2938271137.24.2025.05.27.09.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 09:44:38 -0700 (PDT)
Message-ID: <363b7862-84b3-4bd1-85d6-781eb9ecf161@linaro.org>
Date: Tue, 27 May 2025 13:44:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/25] hw/arm/virt: Let virt support pci hotplug/unplug
 GED event
To: Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-23-eric.auger@redhat.com>
 <20250527175649.5d276bc8@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250527175649.5d276bc8@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AQVWoHx1cfA0

Hi folks,

On 5/27/25 12:56, Igor Mammedov wrote:
> On Tue, 27 May 2025 09:40:24 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> Set up the IO registers used to communicate between QEMU
>> and ACPI.
> 
> 
> 
>> Move the create_pcie() call after the creation of the acpi
>> ged device since hotplug callbacks will soon be called on gpex
>> realize and will require the acpi pcihp state to be initialized.
>>
>> The hacky thing is the root bus has not yet been created on
>> acpi_pcihp_init() call so it is set later after the gpex realize.
> 
> can you elaborate on this, preferably with call expected call flows?

The way I'm understanding it is: because the GED and GPEX are created
in virt.c, so at the machine "level" (and so a machine hotplug handler is
used instead of a device hotplug handler, like it's done in PIIX4 and ICH9
controller in the x86 machines), and they need to be created in that
order because of dependecy of GPEX of GED, the flow is:

1) create_acpi_ged() -> calls acpi_pcihp_init(), which by its turn will inspect the root bus to generate the ACPI code
2) create_pcie() -> just in realize the root bus will be created

and the sequence has to be 1 -> 2, because GED will be used in the GPEX callbacks on hotplug.

So here we're following a different design from the current one in x86,
which handles the hotplug at the PCI controller "level".


Cheers,
Gustavo

>> How to fix this chicken & egg issue?
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - use ACPI_PCIHP_REGION_NAME
>> ---
>>   include/hw/arm/virt.h    |  1 +
>>   hw/arm/virt-acpi-build.c |  1 +
>>   hw/arm/virt.c            | 42 +++++++++++++++++++++++++++++++++++-----
>>   3 files changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 1b2e2e1284..a4c4e3a67a 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -35,6 +35,7 @@
>>   #include "hw/boards.h"
>>   #include "hw/arm/boot.h"
>>   #include "hw/arm/bsa.h"
>> +#include "hw/acpi/pcihp.h"
>>   #include "hw/block/flash.h"
>>   #include "system/kvm.h"
>>   #include "hw/intc/arm_gicv3_common.h"
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 9d88ffc318..cd49f67d60 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -44,6 +44,7 @@
>>   #include "hw/acpi/generic_event_device.h"
>>   #include "hw/acpi/tpm.h"
>>   #include "hw/acpi/hmat.h"
>> +#include "hw/acpi/pcihp.h"
>>   #include "hw/pci/pcie_host.h"
>>   #include "hw/pci/pci.h"
>>   #include "hw/pci/pci_bus.h"
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 4aa40c8e8b..cdcff0a984 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -682,6 +682,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>   {
>>       DeviceState *dev;
>>       MachineState *ms = MACHINE(vms);
>> +    SysBusDevice *sbdev;
>> +
>>       int irq = vms->irqmap[VIRT_ACPI_GED];
>>       uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>>   
>> @@ -693,12 +695,28 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>           event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
>>       }
>>   
>> +    if (vms->acpi_pcihp) {
>> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
>> +    }
>> +
>>       dev = qdev_new(TYPE_ACPI_GED);
>>       qdev_prop_set_uint32(dev, "ged-event", event);
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    sbdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(sbdev, &error_fatal);
>>   
>> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
>> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
>> +    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
>> +    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
> 
> 
> Perhaps move out sbdev renaming into a separate patch, as it's not really related.
> 
>> +    if (vms->acpi_pcihp) {
>> +        AcpiGedState *acpi_ged_state = ACPI_GED(dev);
>> +        int i;
>> +
>> +        i = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
>> +                                 vms->memmap[VIRT_ACPI_PCIHP].base);
> 
> I don't like mix of old way (index based) above and new name based mapping,
> can we use the same, please?
> 
>> +        assert(i >= 0);
> g_assert(sysbus_mmio_map_name...) to get more meaning-full crash
> that is not compiled out.
> 
>> +        acpi_pcihp_init(OBJECT(dev), &acpi_ged_state->pcihp_state,
>> +                        vms->bus, sysbus_mmio_get_region(sbdev, i), 0);
> 
> hmm, looks broken..
>   region mapping must happen after acpi_pcihp_init().
> 
> if we after making sysbus_mmio_map() sane and easier to use
> (which is a bit on tangent to this series).
> We could feed sysbus owner device a memory map (ex: name based),
> and then use [pre_]plug handlers on sysbus to map children
> automatically.
> That will alleviate need to do all mapping manually in every board.
> (frankly speaking it deserves its own series, with tree wide cleanup).
> 
> As it is I'd use old index based approach like the rest.
> (unless you feel adventurous about sysbus refactoring)
> 
> 
>> +        acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
>> +    }
>>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
>>   
>>       return dev;
>> @@ -1758,6 +1776,13 @@ void virt_machine_done(Notifier *notifier, void *data)
>>       pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
>>                                          &error_abort);
> 
> 
>> +
>> +    if (vms->acpi_pcihp) {
>> +        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>> +
>> +        acpi_pcihp_reset(&acpi_ged_state->pcihp_state);
>> +    }
>> +
>>       virt_acpi_setup(vms);
>>       virt_build_smbios(vms);
>>   }
>> @@ -2395,8 +2420,6 @@ static void machvirt_init(MachineState *machine)
>>   
>>       create_rtc(vms);
>>   
>> -    create_pcie(vms);
>> -
>>       if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>>           vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
>>           vms->acpi_dev = create_acpi_ged(vms);
>> @@ -2405,6 +2428,15 @@ static void machvirt_init(MachineState *machine)
>>           create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>       }
>>   
>> +    create_pcie(vms);
>> +
>> +    if (vms->acpi_dev) {
>> +        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>> +
>> +        acpi_ged_state = ACPI_GED(vms->acpi_dev);
>> +        acpi_ged_state->pcihp_state.root = vms->bus;
>> +    }
>> +
>>       if (vms->secure && !vmc->no_secure_gpio) {
>>           create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
>>       }
> 
> I don't like pulling acpi_pcihp_init()/reset (and issues it causes) into board code,
> on x86 it's a part of host bridge device model.
> The same should apply to GED device.
> 
> The only thing board has to do is map regions into IO space like we do
> everywhere else.
> 
> with current code, may be add link<pci_bus> property to GED,
> and set it before GED realize in create_acpi_ged(),
> then just follow existing sysbus_mmio_map() pattern.
> 
