Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp102675dye;
        Thu, 26 Jun 2025 01:45:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURSjhICmFC+XUBUWTxPnjyLPkPsZkL3uzuFbojWvKw7IrjDdYSgXYJ+ilGxN47E/2qjzIKZlVJBEgZ8g==@linaro.org
X-Google-Smtp-Source: AGHT+IG/fHIwxmeHfQTOvoT4y/5iT1myZRinsTwJ8uagRTlxM4ZnKHXs+N3NCkuFRIll6MIZLs1C
X-Received: by 2002:a05:6214:1bc8:b0:6fa:f94e:6e75 with SMTP id 6a1803df08f44-6fd5ef7f311mr104227746d6.25.1750927505249;
        Thu, 26 Jun 2025 01:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750927505; cv=none;
        d=google.com; s=arc-20240605;
        b=dRu/AO08M9t/NRu7A3fP6qgl4X/PWJvBEkDwxZcV7ojBSCup59uUw3xaQdBsa7twvC
         M11p6qCxQO++AQK6zV5mUALE3JhwpiNHtNotZoo7k++WNBx9sKqeDpgcSxGi/OBX/9iX
         x/Ajhbof1ZjWay5u+FEuDJ1Qa05ED1eGxYG93ITvXdsVgWtLhciN11ffw1LO4pvcB9w8
         rPTiyWCFsSr9Ujzo9is3mRGE9SM7sRI79jJ3b/R1O1X3dgWYBLsIldMsXXcrXgpDAY5+
         l4UtLQfVXlDMHv/c9XRDBFBxlKERy3F2IL5jHdUMHpxzSkZaV69w85WG/790RUWGgZqz
         CyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hKLpQInaFASwAceYYn1afmSoRMGL6bQ/K3rN9lhTxKo=;
        fh=PtCwf2omcLPrI0V00q01mHtQWYEiEZ8m9M7jOKutydg=;
        b=X1HRIDNPrucgUG7ZMxA5x24CoYXl3sc8xxCNIoYtd36RLtY5pxl5H+Y/B7pEjag0Lp
         kQjhE9jAIe1BHtJeKn8GOmV09gfgIHPLBqvd05H0gI7JuutIMHInEg7yYD1FpXQVTgl+
         jWB2PsBOxIm8fYU7wQhcYy7UDW+kfDn9ed91r1wb5vvGnomyOazgfJkfzmgFOn24rKk1
         1IpNfWN7+rkU0fMwElLmwwsJmEGC+pxQt0YGX2ltQEQlQ0QumQuIpG6n8x/h+WeDZXzV
         rdiIivCa0AzjPgBqoEMqDFvBnvRbme2f+3GzG/S6XCXX4XnqjZgDZpQAvfl9cGRO7K5u
         LRlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NEYuMlDT;
       spf=pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eauger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eauger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773548easi11644686d6.176.2025.06.26.01.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:45:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NEYuMlDT;
       spf=pass (google.com: domain of eauger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eauger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750927504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKLpQInaFASwAceYYn1afmSoRMGL6bQ/K3rN9lhTxKo=;
	b=NEYuMlDTpvu2qwYA26bG698NaOC9vyJ1UqxWLOU70PiVD6juUXO9PxOcPnM62m2Scy/SMi
	OJjxj8o0OaEp8R4THLWz/0kiX5vDIOd7nK7Ws7wH4ZyTHDOlIDk3i544TstkcDfCXqsK02
	+N3GJgFiv2wepPmOGxRbpVOdL/NfKV0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-xrqWtTdWP1SLCtU_6mzFEg-1; Thu, 26 Jun 2025 04:45:02 -0400
X-MC-Unique: xrqWtTdWP1SLCtU_6mzFEg-1
X-Mimecast-MFC-AGG-ID: xrqWtTdWP1SLCtU_6mzFEg_1750927502
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a5780e8137so914479f8f.1
        for <alex.bennee@linaro.org>; Thu, 26 Jun 2025 01:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927501; x=1751532301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKLpQInaFASwAceYYn1afmSoRMGL6bQ/K3rN9lhTxKo=;
        b=siZTAAyMpS0noytC+sIHpKTgXPtNqPTe+eaCUp745O8t6+lA/s8m6QJFiUhnmh1C5I
         AEIruCMEZz7vziE5OqcyQCBc/KielM5mUw8qT8OhOOrTqyF7tywPaRBygiUAwzMbnNq7
         N+Hs/gouAcSkogLUiYaGOJa7SjXRDLjzHo/EshCr3wiRSv1b4yLnE25pvJVIzjPY4bjR
         t7d4AnTS+E4PLxuP+O202udWzkmpHN9it7NiXh0X7Qo/wValTQZkykxWBwuOJzdtEFW6
         vHh0j7Rzr+bojADyvwf6IGADn6SLn46wyv5MnvC8gaLnIxBbOR/r/MPZv0AdzkYrr3jE
         QvWg==
X-Forwarded-Encrypted: i=1; AJvYcCUXSo2+TekyYdGkIMROvLgiBYhU2sZy+3X2ksoUDknZHVEKrLvpW3y/m7zqWCfIHLXI2AdnukUMCkWy0Q==@linaro.org
X-Gm-Message-State: AOJu0YxXShJxqStylIpnsoHL1mB+Az74SBRQiFrKvlOEyKdfsj8IZqHg
	N7p7X89YdZyO6ajAu/O2Y7eeVZUv0VSYR4dxTS8pS//tieeKLripQUNlSMwcejkKSJcKDMJ30/I
	gn32lJ4ivEbVWUECSfw+HfdQKWbOL3FWFujmFxdx865onqb9yN2ACUDN6g7OyGKDZ6g==
X-Gm-Gg: ASbGnctg9kZkQtgBQnNhmpJGMxcsQCyfuZtyARxrZkGkv1UxTcVFb9tCmVxtlO69Xij
	GZzk/VwNIOFI5p4z5G+wRQjKHn2KmHfSTVC+ixSFZm0VhczYb70zdJVKnKI6C0ZF2WmUErRO/b7
	4LW1855x5I+IZkJ7pw9HA6KAgNHUpAWuqrRr67r90w+mx77Fm6/s2l2MS7mszaDx/23+eP21uq/
	QI/MSMbdutE/SaGsKIVTk9y/J5GKZJZxbqsO6zgoLYmkZAiFrhD0fbwLISBnlfLlazfprO8veuG
	eOlkB6e2ZO3BkKd4zWAZ0ulh30k/fob6oCnbX235hIT37sU4+qYf2CTcNoo9HM7x
X-Received: by 2002:a05:6000:2407:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a6f311abd1mr2080304f8f.19.1750927501072;
        Thu, 26 Jun 2025 01:45:01 -0700 (PDT)
X-Received: by 2002:a05:6000:2407:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a6f311abd1mr2080288f8f.19.1750927500595;
        Thu, 26 Jun 2025 01:45:00 -0700 (PDT)
Return-Path: <eauger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d21fsm6578031f8f.23.2025.06.26.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:44:59 -0700 (PDT)
Message-ID: <133b5108-85ab-4a32-9e20-7eb1b4492d9b@redhat.com>
Date: Thu, 26 Jun 2025 10:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
To: eric.auger@redhat.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-18-eric.auger@redhat.com>
 <20250620103538.000021c1@huawei.com> <20250620143822.7ab69038@fedora>
 <20250620171351.00004cb0@huawei.com>
 <13edf868-707a-4caa-9b83-8b7ac103ff0a@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <13edf868-707a-4caa-9b83-8b7ac103ff0a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZuKb8q7Fij1YoQMN-xbhoa7whSvYTOLNof_DiH-xx64_1750927502
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9hupqCn80RHL

Hi Igor,

On 6/25/25 5:23 PM, Eric Auger wrote:
> Hi Igor, Jonathan,
> 
> On 6/20/25 6:13 PM, Jonathan Cameron wrote:
>> On Fri, 20 Jun 2025 14:38:22 +0200
>> Igor Mammedov <imammedo@redhat.com> wrote:
>>
>>> On Fri, 20 Jun 2025 10:35:38 +0100
>>> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>>>
>>>> On Mon, 16 Jun 2025 11:46:46 +0200
>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>   
>>>>> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>
>>>>> ---
>>>>> v2 -> v3:
>>>>> - use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
>>>>> - use cihp_state->use_acpi_hotplug_bridge    
>>>> pcihp_state
>>>>
>>>> Takes a bit of searching to find the various bits of the
>>>> same support on x86 but this seems to match up.
>>>> Exactly when things are built does vary but not I think
>>>> in a way that matters.  e.g. I think on x86 the
>>>> EDSM stuff is built whether or not we have pcihp enabled
>>>> whereas here you've made it conditional on using acpi
>>>> hp.  Perhaps a tiny bit more description on that would be
>>>> useful if you do a v4?  
>>> edsm should be built regardless of pcihp
>>> (well intention was there, whether I messed it up or not I don't know)
>>>
>>> idea is that non hotplug ports can have a static acpi-index,
>>> so it doesn't depend on pcihp.
>> That makes sense - so here should that edsm feature be enabled whether
>> or not we have pcihp_state->use_acpi_hotplug_bridge == true
>>
>> i.e. is it really a separate thing from the rest of this series?
> 
> Further studying this comment,
> 
> EDSM is invoked by code generated in aml_pci_static_endpoint_dsm() whcih
> itself is invoked by build_append_pci_bus_devices()
> 
> So to me it means that if we generate edsm unconditionally we also need
> to call the following block unconditionnally
> 
> +    aml_append(pci0_scope, build_pci_bridge_edsm());
> +    build_append_pci_bus_devices(pci0_scope, vms->bus);
> +    if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
> +        build_append_pcihp_slots(pci0_scope, vms->bus);
> +    }
> 
> which seems to be done that way in hw/i386/acpi-build.c/build_dsdt()
> 
> Igor, if I recall correctly you said that addition changes related to
> "S%.02X" could change the guest ABI. And in that case this wouldn't be
> guarded by any new option/compat. So that's annoying.
> 
> By the way I tested static acpi-index on ARM with resulting code and it
> does not not seem to work - maybe I try with a wrong topology though
> (pcie root port + virtio-net acpi-index)-. I have not checked on x86 yet.
I tested on x86 and if you turn off acpi pci hotplug by setting
-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
and you statically instantiate a virtio-net-pci device on a pcie root
port with ,acpi-index=3, acpi-index does not work either.
guest exposes enp5s0.

if you remove the global prop setting (acpi pcihp enabled by default),
guest exposes eno3.

so static acpi-index also seems to be dependent on acpi-pcihp on x86.

So I intend to leave the code as is with edsm added within the
acpi_pcihp conditional block. It is also simpler in terms of ref blob
and most importantly with regards to compat handling.

Thanks

Eric



> 
> So I wonder if it makes sense to do that refinement now. Maybe we can
> check try to improve that afterwards?
> 
> What do you think?
> 
> Eric
> 
> 
> 
>>
>> Thanks,
>>
>> J
>>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>>
>>>>   
>>>>> ---
>>>>>  include/hw/acpi/pcihp.h  |  2 ++
>>>>>  include/hw/arm/virt.h    |  1 +
>>>>>  hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
>>>>>  hw/arm/virt.c            |  2 ++
>>>>>  hw/arm/Kconfig           |  2 ++
>>>>>  5 files changed, 29 insertions(+)
>>>>>
>>>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>>>> index 5506a58862..9ff548650b 100644
>>>>> --- a/include/hw/acpi/pcihp.h
>>>>> +++ b/include/hw/acpi/pcihp.h
>>>>> @@ -38,6 +38,8 @@
>>>>>  #define ACPI_PCIHP_SEJ_BASE 0x8
>>>>>  #define ACPI_PCIHP_BNMR_BASE 0x10
>>>>>  
>>>>> +#define ACPI_PCIHP_SIZE 0x0018
>>>>> +
>>>>>  typedef struct AcpiPciHpPciStatus {
>>>>>      uint32_t up;
>>>>>      uint32_t down;
>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>>> index 9a1b0f53d2..0ed2e6b732 100644
>>>>> --- a/include/hw/arm/virt.h
>>>>> +++ b/include/hw/arm/virt.h
>>>>> @@ -79,6 +79,7 @@ enum {
>>>>>      VIRT_ACPI_GED,
>>>>>      VIRT_NVDIMM_ACPI,
>>>>>      VIRT_PVTIME,
>>>>> +    VIRT_ACPI_PCIHP,
>>>>>      VIRT_LOWMEMMAP_LAST,
>>>>>  };
>>>>>  
>>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>>> index d7547c8d3b..a2e58288f8 100644
>>>>> --- a/hw/arm/virt-acpi-build.c
>>>>> +++ b/hw/arm/virt-acpi-build.c
>>>>> @@ -34,6 +34,7 @@
>>>>>  #include "hw/core/cpu.h"
>>>>>  #include "hw/acpi/acpi-defs.h"
>>>>>  #include "hw/acpi/acpi.h"
>>>>> +#include "hw/acpi/pcihp.h"
>>>>>  #include "hw/nvram/fw_cfg_acpi.h"
>>>>>  #include "hw/acpi/bios-linker-loader.h"
>>>>>  #include "hw/acpi/aml-build.h"
>>>>> @@ -809,6 +810,8 @@ static void
>>>>>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>>  {
>>>>>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>>> +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>>>>> +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
>>>>>      Aml *scope, *dsdt;
>>>>>      MachineState *ms = MACHINE(vms);
>>>>>      const MemMapEntry *memmap = vms->memmap;
>>>>> @@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>>  
>>>>>      aml_append(dsdt, scope);
>>>>>  
>>>>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>>>>> +        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
>>>>> +
>>>>> +        aml_append(pci0_scope, aml_pci_edsm());
>>>>> +        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
>>>>> +                               memmap[VIRT_ACPI_PCIHP].base);
>>>>> +        build_append_pcihp_resources(pci0_scope,
>>>>> +                                     memmap[VIRT_ACPI_PCIHP].base,
>>>>> +                                     memmap[VIRT_ACPI_PCIHP].size);
>>>>> +
>>>>> +        /* Scan all PCI buses. Generate tables to support hotplug. */
>>>>> +        build_append_pci_bus_devices(pci0_scope, vms->bus);
>>>>> +        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
>>>>> +            build_append_pcihp_slots(pci0_scope, vms->bus);
>>>>> +        }
>>>>> +        build_append_notification_callback(pci0_scope, vms->bus);
>>>>> +        aml_append(dsdt, pci0_scope);
>>>>> +    }
>>>>> +
>>>>>      /* copy AML table into ACPI tables blob */
>>>>>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>>>>>      
>>>>   
>>>
> 
