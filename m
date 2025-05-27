Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5036768njc;
        Tue, 27 May 2025 12:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVE1ED4Vu0qy7Ody4npv7JMX8uGurcVabWjK60jRqvsmrVG55tcGz7utwiWbRCqbAP4A49ggPn1/uYGqQ==@linaro.org
X-Received: by 2002:a05:6122:62e9:b0:526:23d2:6ecd with SMTP id 71dfb90a1353d-5305fdfa549mr1947743e0c.6.1748373413560;
        Tue, 27 May 2025 12:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748373413; cv=none;
        d=google.com; s=arc-20240605;
        b=PlJRrOAG9ke6gaACYJCCsb2jY7dsk//01lPEclYT5jd8Gaou38eYhWTcmHdIArN5Si
         +n45LkGpQEHMuT9uRUMC+wOL5VKrJLlApiukSv0AtP3N7b+9WFOKO/Xfl+0wZEgbhnsm
         H4E6fZN6Q8g0DaZ/+Ie3VXdLKA+dUOuEtPr0b/J9LXbdEmOB4NXkJE9mCXH3NGpq/um5
         HTHRikaNaA+Zvb4eAqY8pJmAg4J07x097amW/oZC81KkRO0gyo8+/EaiPmbvUCXuB0td
         yryKKYAmyF01hXa+OIE5Sn1jmFSNJ+SEZX60HQ1U2VojD6Exg+ZtyO/wF3O4gBGmqL2+
         SvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IAsDWGx8Uo9EscDRhlxrXFB/Hp9p99WkK4bk9lATPmA=;
        fh=SOmwYr31kschGeNmXV9HGsjsMzsMhf0UoiN/J/9QMGo=;
        b=BSAGFwE5GsOUfMzl/JdqxYz3PzSF2GeVzNtV93jZa85Qvf6KUOEgD8q/s3yaSr7CH+
         96Ud551izpD3zkLtpiWfFpERCmlqb5EgRzFTp+8weaOvpJzV1nKLDAwql0C9BNAqDPfv
         Xu8rL/judzFOIe96RDHern6n3y64cN+aTZQk7b5e3WGw/QvZxHq6SapAn2m7YdPax525
         1Zh/zvNNBc/3PZjCxy7TMFoijMe1tNoL2mKXQYqZvNux+rY2B0xtuv4I9QOAw+4ozI9r
         B0oyPPdeJAMKHhqdwdZ+mxK+4gWetNBmqkzyYR7U0lxHASo/99gPDZeLY/e+wcW1Gs3S
         Q4HQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqSFhb05;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-5305b549340sor553440e0c.1.2025.05.27.12.16.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 12:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqSFhb05;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748373413; x=1748978213; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IAsDWGx8Uo9EscDRhlxrXFB/Hp9p99WkK4bk9lATPmA=;
        b=GqSFhb05k5PsFxRdK5164Q1IG3pUAkK/q1Legu1F8bSGQz5t6iHoa4+j6YPMsT0pcS
         1bMNle5m8Ub5oPoStS+g6hCg7tqHniQzO2eB6U/8xzchyUym0WzqsG8hJkqrnjOdz28T
         FMPRBF1HCU3fPB1XNXETkqrlbnWOh4cwanzpSocNFuWmYWqHffUAhgN79VvUq4IGPzVP
         KMHmdH8VSHEvWDUgUiosBg3zstfG7Ph9nvr3bykr1FqmLV8KrpC3Bp4lpyAT0a5pkqp4
         xFO1lovAku2VanLUUbYfjLOt3cWc0+zPSap0PbQvfonoNGfsAPf4xJ8ChLYufoKcPGMO
         18oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748373413; x=1748978213;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAsDWGx8Uo9EscDRhlxrXFB/Hp9p99WkK4bk9lATPmA=;
        b=RVB2cC3ZeZzR1ZPx6ut5uUnHwGXGKK/ak9vIQf7jGkNNomg6TOnRLbM0SKr/C5er1o
         Du8asdt3Q7an9mx1FPbhOQbnJEzYunQZIubnX/8vUzbx4LBOv2Q8ZnC2rX/6IhH+0Tge
         my4V28rIT2aICR/cfjYoiyCIgzWXJp3I0/abQjs3zPmMJ4ni3JiUOBYL8LPVPHFSMbQi
         t9EsyqTks7CYf6FIjiPEqL5NCKdZjdHajlNpx0rbzLrKEyanUbBeH8jiEWZK+3X+Xso3
         4ySgMnId/6lPMmRSP1jzkWC2ow1h/wcUJcNk2NGvogtLeqTUkbYWKbNGAMbGwK3YoaE2
         fWHg==
X-Forwarded-Encrypted: i=1; AJvYcCUazYa0LrZZU7y6SqVDK+/nyx4FJPA7nJvLW12s8upIaijRGpC0CtthPgGydUNvwyCGP9nY4PshuKf8jQ==@linaro.org
X-Gm-Message-State: AOJu0Yy6yD8auF4bSrn+PXR8fnjQz8iI14A2dRRR9TQK3jWjU/U1hKIP
	Ds1YB5jMiMNuR0tIiA8mmDBcjJmRuuDnw6s6tXGSAoGFUfsy/nqYCjiXzc0JyNBaLT+V3A==
X-Gm-Gg: ASbGncs0849yReMmiM0TUz62XOfoA1jRYIQng76LxwOaWAsQciV1fKl/EKg/KXJHn1e
	BmymH9+2bIQC0s6xGE7UfTc+B7s0xheI3Uxxnbgnc7H2e9YlKnlNEOZnrgq5cLLR3JV8XJlEJ0Z
	pePbWA1qBOKQC62JdwM6rLNDR/ppZlTO7a4aGNQd9/GhhV/GsCOp4kq+qIls2IDnKMd6S8pHPIv
	Piu3ittmZxzXJRb8Z/beYIz9N9RfBT1qZsSEHW4yvETn28VzJZ9r41c5MEDh/dTliuuhEMenAek
	hch0T22TdBkwTW3uChWtyfHuMZHI6Dwj3tdw/mTAZOJ1PebZqrt5VJzSAH4gWh0YN5wy66CXnxg
	xg8S6LKZKc1THaJZjmJPSwu7ZwSZHHw==
X-Google-Smtp-Source: AGHT+IEDsBo4x6SURdUzmQi6TIN3SQXrxD2ldezqbYa060W7TF7WT49djWBNdn27V12vFhi7ptL7xg==
X-Received: by 2002:a05:6122:3d15:b0:520:4806:a422 with SMTP id 71dfb90a1353d-5305fdd335bmr2336966e0c.3.1748373412987;
        Tue, 27 May 2025 12:16:52 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586? ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6b42esm20112458e0c.40.2025.05.27.12.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 12:16:51 -0700 (PDT)
Message-ID: <8b27d199-7bfa-48f2-b534-42a3a975fbf3@linaro.org>
Date: Tue, 27 May 2025 16:16:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/25] hw/arm/virt: Let virt support pci hotplug/unplug
 GED event
From: Gustavo Romero <gustavo.romero@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-23-eric.auger@redhat.com>
 <20250527175649.5d276bc8@imammedo.users.ipa.redhat.com>
 <363b7862-84b3-4bd1-85d6-781eb9ecf161@linaro.org>
Content-Language: en-US
In-Reply-To: <363b7862-84b3-4bd1-85d6-781eb9ecf161@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Oqk7HOVDp7Cm



On 5/27/25 13:44, Gustavo Romero wrote:
> Hi folks,
> 
> On 5/27/25 12:56, Igor Mammedov wrote:
>> On Tue, 27 May 2025 09:40:24 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> Set up the IO registers used to communicate between QEMU
>>> and ACPI.
>>
>>
>>
>>> Move the create_pcie() call after the creation of the acpi
>>> ged device since hotplug callbacks will soon be called on gpex
>>> realize and will require the acpi pcihp state to be initialized.
>>>
>>> The hacky thing is the root bus has not yet been created on
>>> acpi_pcihp_init() call so it is set later after the gpex realize.
>>
>> can you elaborate on this, preferably with call expected call flows?
> 
> The way I'm understanding it is: because the GED and GPEX are created
> in virt.c, so at the machine "level" (and so a machine hotplug handler is
> used instead of a device hotplug handler, like it's done in PIIX4 and ICH9
> controller in the x86 machines), and they need to be created in that
> order because of dependecy of GPEX of GED, the flow is:
> 
> 1) create_acpi_ged() -> calls acpi_pcihp_init(), which by its turn will inspect the root bus to generate the ACPI code
> 2) create_pcie() -> just in realize the root bus will be created
> 
> and the sequence has to be 1 -> 2, because GED will be used in the GPEX callbacks on hotplug.
> 
> So here we're following a different design from the current one in x86,
> which handles the hotplug at the PCI controller "level".

... where this chicken & egg doesn't exist, I meant.

So one option would be follow the ICH9 design, i.e.,
the call to acpi_pcihp_init() would be from a gpex_root_class_realize() (to be created)
and set in gpex_root_class_init(), like  k->realize = gpex_root_class_realize.
AcpiPciHpState would then be part of GPEXRootState struct. TYPE_GPEX_ROOT_DEVICE would
also define the interfaces TYPE_HOTPLUG_HANDLER and TYPE_ACPI_DEVICE_IF, and
gpex_root_class_init() will set callbacks on these interfaces, for instance:

hc->pre_plug = gpex_device_pre_plug_cb;
hc->plug = gpex_device_plug_cb;
hc->unplug_request = gpex_device_unplug_request_cb;
hc->unplug = gpex_device_unplug_cb;
hc->is_hotpluggable_bus = gpex_is_hotpluggable_bus;

adevc->send_event = gpex_root_acpi_send_event;


Cheers,
Gustavo

> 
> Cheers,
> Gustavo
> 
>>> How to fix this chicken & egg issue?
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>>
>>> v1 -> v2:
>>> - use ACPI_PCIHP_REGION_NAME
>>> ---
>>>   include/hw/arm/virt.h    |  1 +
>>>   hw/arm/virt-acpi-build.c |  1 +
>>>   hw/arm/virt.c            | 42 +++++++++++++++++++++++++++++++++++-----
>>>   3 files changed, 39 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index 1b2e2e1284..a4c4e3a67a 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -35,6 +35,7 @@
>>>   #include "hw/boards.h"
>>>   #include "hw/arm/boot.h"
>>>   #include "hw/arm/bsa.h"
>>> +#include "hw/acpi/pcihp.h"
>>>   #include "hw/block/flash.h"
>>>   #include "system/kvm.h"
>>>   #include "hw/intc/arm_gicv3_common.h"
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 9d88ffc318..cd49f67d60 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -44,6 +44,7 @@
>>>   #include "hw/acpi/generic_event_device.h"
>>>   #include "hw/acpi/tpm.h"
>>>   #include "hw/acpi/hmat.h"
>>> +#include "hw/acpi/pcihp.h"
>>>   #include "hw/pci/pcie_host.h"
>>>   #include "hw/pci/pci.h"
>>>   #include "hw/pci/pci_bus.h"
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 4aa40c8e8b..cdcff0a984 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -682,6 +682,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>>   {
>>>       DeviceState *dev;
>>>       MachineState *ms = MACHINE(vms);
>>> +    SysBusDevice *sbdev;
>>> +
>>>       int irq = vms->irqmap[VIRT_ACPI_GED];
>>>       uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>>> @@ -693,12 +695,28 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>>           event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
>>>       }
>>> +    if (vms->acpi_pcihp) {
>>> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
>>> +    }
>>> +
>>>       dev = qdev_new(TYPE_ACPI_GED);
>>>       qdev_prop_set_uint32(dev, "ged-event", event);
>>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> +    sbdev = SYS_BUS_DEVICE(dev);
>>> +    sysbus_realize_and_unref(sbdev, &error_fatal);
>>> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
>>> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
>>> +    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
>>> +    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
>>
>>
>> Perhaps move out sbdev renaming into a separate patch, as it's not really related.
>>
>>> +    if (vms->acpi_pcihp) {
>>> +        AcpiGedState *acpi_ged_state = ACPI_GED(dev);
>>> +        int i;
>>> +
>>> +        i = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
>>> +                                 vms->memmap[VIRT_ACPI_PCIHP].base);
>>
>> I don't like mix of old way (index based) above and new name based mapping,
>> can we use the same, please?
>>
>>> +        assert(i >= 0);
>> g_assert(sysbus_mmio_map_name...) to get more meaning-full crash
>> that is not compiled out.
>>
>>> +        acpi_pcihp_init(OBJECT(dev), &acpi_ged_state->pcihp_state,
>>> +                        vms->bus, sysbus_mmio_get_region(sbdev, i), 0);
>>
>> hmm, looks broken..
>>   region mapping must happen after acpi_pcihp_init().
>>
>> if we after making sysbus_mmio_map() sane and easier to use
>> (which is a bit on tangent to this series).
>> We could feed sysbus owner device a memory map (ex: name based),
>> and then use [pre_]plug handlers on sysbus to map children
>> automatically.
>> That will alleviate need to do all mapping manually in every board.
>> (frankly speaking it deserves its own series, with tree wide cleanup).
>>
>> As it is I'd use old index based approach like the rest.
>> (unless you feel adventurous about sysbus refactoring)
>>
>>
>>> +        acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
>>> +    }
>>>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
>>>       return dev;
>>> @@ -1758,6 +1776,13 @@ void virt_machine_done(Notifier *notifier, void *data)
>>>       pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
>>>                                          &error_abort);
>>
>>
>>> +
>>> +    if (vms->acpi_pcihp) {
>>> +        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>>> +
>>> +        acpi_pcihp_reset(&acpi_ged_state->pcihp_state);
>>> +    }
>>> +
>>>       virt_acpi_setup(vms);
>>>       virt_build_smbios(vms);
>>>   }
>>> @@ -2395,8 +2420,6 @@ static void machvirt_init(MachineState *machine)
>>>       create_rtc(vms);
>>> -    create_pcie(vms);
>>> -
>>>       if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>>>           vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
>>>           vms->acpi_dev = create_acpi_ged(vms);
>>> @@ -2405,6 +2428,15 @@ static void machvirt_init(MachineState *machine)
>>>           create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>>       }
>>> +    create_pcie(vms);
>>> +
>>> +    if (vms->acpi_dev) {
>>> +        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>>> +
>>> +        acpi_ged_state = ACPI_GED(vms->acpi_dev);
>>> +        acpi_ged_state->pcihp_state.root = vms->bus;
>>> +    }
>>> +
>>>       if (vms->secure && !vmc->no_secure_gpio) {
>>>           create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
>>>       }
>>
>> I don't like pulling acpi_pcihp_init()/reset (and issues it causes) into board code,
>> on x86 it's a part of host bridge device model.
>> The same should apply to GED device.
>>
>> The only thing board has to do is map regions into IO space like we do
>> everywhere else.
>>
>> with current code, may be add link<pci_bus> property to GED,
>> and set it before GED realize in create_acpi_ged(),
>> then just follow existing sysbus_mmio_map() pattern.
>>
> 
