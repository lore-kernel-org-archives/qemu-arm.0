Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp927307dyb;
        Wed, 25 Jun 2025 08:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQWGLsDYN6kPNWOFzfsnMU0kWqiXlVDQjWO7GnOzneUaJiNt79VZ6KQCgUSj4sCbjbqZp3DaaHK0Xv5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IESH0Epq+TQl4qKNvzP4b5X4Sbg6k6Gvp1BHJF0mAd0bmb8DLQ5K/zn8AF//HYWcVWvIvNQ
X-Received: by 2002:a05:620a:2b47:b0:7ce:b4d4:395a with SMTP id af79cd13be357-7d429725cf1mr476479585a.18.1750865001485;
        Wed, 25 Jun 2025 08:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750865001; cv=none;
        d=google.com; s=arc-20240605;
        b=OZsi+BYGcgecv6eG+xVmtPn4/GO7keh7Tw5oba1hEziMos/nuqIzkrAnvDUe0tPf4H
         TyI2YGFQ3UGGdV7LFX1PKvuoL/PkWfsMnx4XVuEtx5vRqCbzzTR/clAQn3NUiIxVwW9u
         RA82/dhWF7RKxIv0jh1H+qo4BdV8yfBN7brKYqI1lgVQOsb3BfWU7e/x65AHMJlcuref
         I2jQw60paBQ4wJL+RmxKXuTVYc7Hrd1ZIshjt7JngEIsmYOh32mjULNlS1cpucvAJivT
         7fnz9sE7E7y8GGXQ+DHqCkf8UO2S+aFZLA9sje30MSocaUOB5ViFGdaL5zEBtxC7Di73
         5d7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=sgqpt6+LkQyqIfK65io/n4s5hgmJ2bFQ+Ds8DGQQ5HM=;
        fh=GRAguv4PAtCKyRoDewgfLoAo9hSy4G272HjhU5kerW4=;
        b=Kkrt3WMQgydWQZyYRaP6SZEA693otVR1QONN/UXnDo9xbXJsIfpbcu7jcUfQ1KAwR+
         uJw9YPDzUW/TdCZxAhBD4iv8RkTsnodcvGiqv3BWywmeyLwJGrTdm30QZzOmvyAKv5PG
         WBqqB4cdhiC127dkZPmQQF1V33bU5M29jZ7a0iW9P6esgKnFf3ggqy8ObERZxLnlXif3
         yoph3WtbDDoJOBuyz1vjYkoubk6Y8P+CssLa3njNfkyv8RqtqHbY3VoYNCRfWvoZP02S
         50bEIOqOan2r/2LVvETcTjgnPNKxTqKcX9k/wE3kvBpbWayt4L8SJyIrWioommaCvbUr
         2yjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MMc+Z1TT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f999f491si1179450385a.125.2025.06.25.08.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MMc+Z1TT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750865001;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgqpt6+LkQyqIfK65io/n4s5hgmJ2bFQ+Ds8DGQQ5HM=;
	b=MMc+Z1TTEj7JX6VUxEc+tCtNatviqmB10Q0MlNy7JDL044O7++t5kOoBtQKVyy0P0umBD9
	Z/9/H5v7VJ8KH4lKB+5ry7U2QinyMjXrjKHmETwIdSr0OBDvPvMDX+nK1e0RFAnrnz9JIA
	8qmT2lt2y2gJFtzzOVpiyO/6xpnkoE4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-PI_EIc6dO9SFHenUHfjj9A-1; Wed, 25 Jun 2025 11:23:19 -0400
X-MC-Unique: PI_EIc6dO9SFHenUHfjj9A-1
X-Mimecast-MFC-AGG-ID: PI_EIc6dO9SFHenUHfjj9A_1750864999
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450de98b28eso5388625e9.0
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 08:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864998; x=1751469798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgqpt6+LkQyqIfK65io/n4s5hgmJ2bFQ+Ds8DGQQ5HM=;
        b=ArihTIG8C0vE+SAoRg8bZ3BSW3epg2CvXD9P0DaMYuPNJXgpmruEPRnOQ92GNjPbBH
         aSTo71dj8WWPa9+TYSxLIhizDe/xlXIeCVpkyvEHDW2okOZOd0dD+qCHV+dPtJM84WaA
         ARO7kvOyQOJEq3optoio4x9f6jCXXfSfeBEox4rWpey7VvCtMVcMIObdLk/OPTsIM9Yh
         4yqogYD2OxenkCdIpTlnV5kTi6IRDYL8W38AFr8qRnpLfR/bzzuDWO9VRALApMzEiDzN
         R6A1rsi1Lns9FPu6dUSx3ZEgkhx3qxyTV2ZyEKT7AyAGEpHVF5r9IhWn/yFsXeqEh+7f
         Glbg==
X-Forwarded-Encrypted: i=1; AJvYcCWlwjjMynjjILegxBDNU8zTuskbTOGGgVbSCHAgBqc4/3QUqRpkU1yVWbmatmmLuVQjM6pppH96iXwEYA==@linaro.org
X-Gm-Message-State: AOJu0YxtCIh9o5zq+5n+91xbiZbQ/Zt8YUgFK00azzH4a9ScgkLAGp9e
	5TDnJtjsQcaSxbXWbMWWPbzUlh4H8qW2ad0qGNgejZPqxJGnGoDgZmS8xzpfulRaeXADuvnACTd
	9U2j1m7H/J3TB8B+KSD4vaMc9mKH8Tp4ZyAyRYWlhAZlC2Me5LvbTW7BAhw==
X-Gm-Gg: ASbGnctcKL0RITZC1v/k2q/JpG7QqVSBG3Ni1u3PbrsIKCuvlppV4xetkWklnW8+cj3
	BfoAESSuUDApSKk6x1PzpnH2JahAd0UueCi3TjZ585xoc5XuteaxvaqpCqFIKmBUxkCiyxa9HpP
	CfTyeLwUjRkG240kkmaHIvw5yJKHGNQtEa5AIyeqj7Q+S4AtIdM5PLyEmNGoG6OUew9zMNC/9M5
	aGa7t4IjwxWvk3nn8nyCsbqEkxraBIOzZc8zOmV6mlIPLTd4liJjHwIhfuUIFbn0+fQn9mquk1G
	TbwA0x5tzKToFsEMqfUtNOuA+UpMCPBUOOnSVu+Num5iwsCyHqm7jrLhN7H4MjD7GtVHpQ==
X-Received: by 2002:a05:6000:2409:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6e71c5b54mr6453899f8f.7.1750864998393;
        Wed, 25 Jun 2025 08:23:18 -0700 (PDT)
X-Received: by 2002:a05:6000:2409:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6e71c5b54mr6453857f8f.7.1750864997815;
        Wed, 25 Jun 2025 08:23:17 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382363f7fsm23617965e9.27.2025.06.25.08.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:23:17 -0700 (PDT)
Message-ID: <13edf868-707a-4caa-9b83-8b7ac103ff0a@redhat.com>
Date: Wed, 25 Jun 2025 17:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-18-eric.auger@redhat.com>
 <20250620103538.000021c1@huawei.com> <20250620143822.7ab69038@fedora>
 <20250620171351.00004cb0@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620171351.00004cb0@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6OaT8-6r34MrufXxKYzhROFdutx3m1bIRrPf2AY0utY_1750864999
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o7lhgSsYe7Gx

Hi Igor, Jonathan,

On 6/20/25 6:13 PM, Jonathan Cameron wrote:
> On Fri, 20 Jun 2025 14:38:22 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
>
>> On Fri, 20 Jun 2025 10:35:38 +0100
>> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>>
>>> On Mon, 16 Jun 2025 11:46:46 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>   
>>>> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>> v2 -> v3:
>>>> - use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
>>>> - use cihp_state->use_acpi_hotplug_bridge    
>>> pcihp_state
>>>
>>> Takes a bit of searching to find the various bits of the
>>> same support on x86 but this seems to match up.
>>> Exactly when things are built does vary but not I think
>>> in a way that matters.  e.g. I think on x86 the
>>> EDSM stuff is built whether or not we have pcihp enabled
>>> whereas here you've made it conditional on using acpi
>>> hp.  Perhaps a tiny bit more description on that would be
>>> useful if you do a v4?  
>> edsm should be built regardless of pcihp
>> (well intention was there, whether I messed it up or not I don't know)
>>
>> idea is that non hotplug ports can have a static acpi-index,
>> so it doesn't depend on pcihp.
> That makes sense - so here should that edsm feature be enabled whether
> or not we have pcihp_state->use_acpi_hotplug_bridge == true
>
> i.e. is it really a separate thing from the rest of this series?

Further studying this comment,

EDSM is invoked by code generated in aml_pci_static_endpoint_dsm() whcih
itself is invoked by build_append_pci_bus_devices()

So to me it means that if we generate edsm unconditionally we also need
to call the following block unconditionnally

+    aml_append(pci0_scope, build_pci_bridge_edsm());
+    build_append_pci_bus_devices(pci0_scope, vms->bus);
+    if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pcihp_slots(pci0_scope, vms->bus);
+    }

which seems to be done that way in hw/i386/acpi-build.c/build_dsdt()

Igor, if I recall correctly you said that addition changes related to
"S%.02X" could change the guest ABI. And in that case this wouldn't be
guarded by any new option/compat. So that's annoying.

By the way I tested static acpi-index on ARM with resulting code and it
does not not seem to work - maybe I try with a wrong topology though
(pcie root port + virtio-net acpi-index)-. I have not checked on x86 yet.

So I wonder if it makes sense to do that refinement now. Maybe we can
check try to improve that afterwards?

What do you think?

Eric



>
> Thanks,
>
> J
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>
>>>   
>>>> ---
>>>>  include/hw/acpi/pcihp.h  |  2 ++
>>>>  include/hw/arm/virt.h    |  1 +
>>>>  hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
>>>>  hw/arm/virt.c            |  2 ++
>>>>  hw/arm/Kconfig           |  2 ++
>>>>  5 files changed, 29 insertions(+)
>>>>
>>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>>> index 5506a58862..9ff548650b 100644
>>>> --- a/include/hw/acpi/pcihp.h
>>>> +++ b/include/hw/acpi/pcihp.h
>>>> @@ -38,6 +38,8 @@
>>>>  #define ACPI_PCIHP_SEJ_BASE 0x8
>>>>  #define ACPI_PCIHP_BNMR_BASE 0x10
>>>>  
>>>> +#define ACPI_PCIHP_SIZE 0x0018
>>>> +
>>>>  typedef struct AcpiPciHpPciStatus {
>>>>      uint32_t up;
>>>>      uint32_t down;
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index 9a1b0f53d2..0ed2e6b732 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -79,6 +79,7 @@ enum {
>>>>      VIRT_ACPI_GED,
>>>>      VIRT_NVDIMM_ACPI,
>>>>      VIRT_PVTIME,
>>>> +    VIRT_ACPI_PCIHP,
>>>>      VIRT_LOWMEMMAP_LAST,
>>>>  };
>>>>  
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index d7547c8d3b..a2e58288f8 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -34,6 +34,7 @@
>>>>  #include "hw/core/cpu.h"
>>>>  #include "hw/acpi/acpi-defs.h"
>>>>  #include "hw/acpi/acpi.h"
>>>> +#include "hw/acpi/pcihp.h"
>>>>  #include "hw/nvram/fw_cfg_acpi.h"
>>>>  #include "hw/acpi/bios-linker-loader.h"
>>>>  #include "hw/acpi/aml-build.h"
>>>> @@ -809,6 +810,8 @@ static void
>>>>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>  {
>>>>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>> +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>>>> +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
>>>>      Aml *scope, *dsdt;
>>>>      MachineState *ms = MACHINE(vms);
>>>>      const MemMapEntry *memmap = vms->memmap;
>>>> @@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>  
>>>>      aml_append(dsdt, scope);
>>>>  
>>>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>>>> +        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
>>>> +
>>>> +        aml_append(pci0_scope, aml_pci_edsm());
>>>> +        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
>>>> +                               memmap[VIRT_ACPI_PCIHP].base);
>>>> +        build_append_pcihp_resources(pci0_scope,
>>>> +                                     memmap[VIRT_ACPI_PCIHP].base,
>>>> +                                     memmap[VIRT_ACPI_PCIHP].size);
>>>> +
>>>> +        /* Scan all PCI buses. Generate tables to support hotplug. */
>>>> +        build_append_pci_bus_devices(pci0_scope, vms->bus);
>>>> +        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
>>>> +            build_append_pcihp_slots(pci0_scope, vms->bus);
>>>> +        }
>>>> +        build_append_notification_callback(pci0_scope, vms->bus);
>>>> +        aml_append(dsdt, pci0_scope);
>>>> +    }
>>>> +
>>>>      /* copy AML table into ACPI tables blob */
>>>>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>>>>      
>>>   
>>
