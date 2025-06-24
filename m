Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp274157dyb;
        Tue, 24 Jun 2025 08:51:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtkoVUrmneAKItaOvXlZ8t7LZ7cUcHDvUeltaXsmzbdyxt9dhMOiDuL1ixdZQiUaEGp61NVIoQHwIuDA==@linaro.org
X-Google-Smtp-Source: AGHT+IEfMB5OaPDkUzez2d7AQG7abNGJKKBBsTqbHOKWegcqvHjhngOIkblApgDSYD0l3QXQG8+h
X-Received: by 2002:ac8:5803:0:b0:494:959e:26a3 with SMTP id d75a77b69052e-4a77a25d46fmr275656081cf.34.1750780265804;
        Tue, 24 Jun 2025 08:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750780265; cv=none;
        d=google.com; s=arc-20240605;
        b=GFqWkHno8fCV8znCH0+znVU3YmTdkloRsQalDOg6Vp42d5dmkzn4O4dJkIVwRf9uum
         kC5DkLXPptqeREnNq4ZahiMz5yGq3KGt0BPXO8nI5lMZ3Ju2gp9/Cji0eZUoDeuy+yo+
         rCpd1gH0PSEoqaTtvT0Ybq1Y3FsixITU4Z6CQtOiqYQaLPb1xwuUK+mzBH7+O8+5e7c1
         wNYBT9VdzJF/YJzmGn+3klUYykGaIbqJFNQL79CRMj7uUbV+kOIrG22FfEgu3KycEq8v
         A0WP7psllaHlwz+w0UyoeOH3yOO1AHuZ4ZVc/V/Fn9sbgak7Wa6C+RIZAbLFUc7EbG90
         Jr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4d6CwVf6CCbFw8g0kZm+MXmPsBgqxA+jVU2RZpVtP6o=;
        fh=3rIjDB8Nu8A3XNxylxkYifIVjXRMtLmU0JAcwp0T2Vk=;
        b=ld3Wzlg8zUzEuf/7h6pe7S5sKGuI6DrH8pCjeV2VXyduVVjub9OU8yC6g9B0tI67vl
         /wGW/1u7Qxqj0oZ1w68vebB9AXVcmG8JdsqlWjaNU+6JVypp2yo37XV7efLb05CEMHgZ
         kfegEMKLdotoZgsF/2X2pEZoJSII5SipNkjmVyVLabzMF6ZpDU+wHnOhV/rFre10+FY4
         oJSo90wvR1tGAeTyfp6ItMj/2N53907Z/ko7qIiTPbZLZL9cw9uGKpwo6tvW0Kztzf/3
         GBb5YiatcwZAqA4KZtReleCLREWMAUQjhpjoFbPvVLMqt+Xvxb4RdBrdKxIOqa3etlBR
         38/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUJ2lqMy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0e57desi106653961cf.583.2025.06.24.08.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUJ2lqMy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750780265;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d6CwVf6CCbFw8g0kZm+MXmPsBgqxA+jVU2RZpVtP6o=;
	b=BUJ2lqMykHnKbNGGXD1HTGd83pOC8hmO7mM772GamIld1Tz+/ggHQKHl/zsSKfDSRC20hv
	MtKVJWqMIeIgLYCtNKp751yT+KD3jlPavZIordsSrUVCv4TpneG9eFKiElbkFmYpV1ATnf
	IiTPln0PRUOEAVGFA7qmbdbDBLGX3eU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-XDJ4tA5IPoG2RFLulR7ccA-1; Tue, 24 Jun 2025 11:51:04 -0400
X-MC-Unique: XDJ4tA5IPoG2RFLulR7ccA-1
X-Mimecast-MFC-AGG-ID: XDJ4tA5IPoG2RFLulR7ccA_1750780263
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so3735795e9.0
        for <alex.bennee@linaro.org>; Tue, 24 Jun 2025 08:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750780263; x=1751385063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4d6CwVf6CCbFw8g0kZm+MXmPsBgqxA+jVU2RZpVtP6o=;
        b=hL0IScw2JhrJUG0hG4f/edbrQuGsopBrhFPcfaDrFII90l6lf+pSwkQSwGq/1jKkL1
         /crJp+Zd3XqjJyjsMVTsZsHzek4jy9tPhXVIhID6TbNK6OEdTq29a8xNHlUqBDHE8QJ1
         d/tYyavyuR9lvjn11sY3HLW/UwFFyOpcaZWNd266N0Dp8rLM80LEtdz/6HRgNE8cM32e
         Lg1rNF8xm23i5Q2y8ER2zeegoH2ukn1fHibYa0Z5IlXu46zAfq2EDlyfXpWGaHUSfDs1
         UONA3NjM6SmqCHVvHfciY4CofIlOuw9kDTkNS61EpQwbzS2NoXJfxPSO97xosvU9BopW
         gFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeSpS6wZgTy18CyLnlAlYzB9PSc9NdCiENnPZHdlh+Cm4912NyD1UuEKVe3MS9nmYeLuAZ/WhER0l+Zw==@linaro.org
X-Gm-Message-State: AOJu0Yz7FkfQjGkaj6PnNRs1sqUz1zklUqYY3f+dc6y4pzrtSAeyWZhi
	qhpYCh8ePVNFazYp8UKZBkRUf8XVgF/zFTpFGbpFazd5/5Y5xceko/lW1HB90X4HZUCWT6ufIOJ
	vAHHagOVrBU9oK4ZDdSoJwYDPuxZDfvdtJkoziQBnpOGpOtHKAjfH24RteQ==
X-Gm-Gg: ASbGncsIwdk4aZbajETylxHoUYgrpo4R8bJ5USHJQoY+1UlbfdJZYDGecMfPkQE8HO8
	aQm+enkkaQk9Y+cu33vmVi1ziSr2kWFL/Y8nAW3lrK7SXT7cMVu1+9Qyo04raQ8tg/tFcv6r3g1
	rrEbwVu5Z2tCwygB3wtCoGMLTWxE2cU69+l6BPV/n8j9C5TGLXKq8ds5qUGCkDd8ah8zuWC1hzK
	jR/h2vTlZdBrBY8NSVOIgKV5bfhjiM+vOlR3Nckl8zoAtHmocUOg1KUXKsfAHIzOJPdlp46hO8Q
	Ova6A8APzlLiZttunfTwr2gyjQwTNx9p9u2q8lkmn6jJ/JiLYZT9ZVh20oIgNXvgxcmbNg==
X-Received: by 2002:a05:600c:3590:b0:44b:eb56:1d48 with SMTP id 5b1f17b1804b1-45381536414mr626935e9.4.1750780262907;
        Tue, 24 Jun 2025 08:51:02 -0700 (PDT)
X-Received: by 2002:a05:600c:3590:b0:44b:eb56:1d48 with SMTP id 5b1f17b1804b1-45381536414mr626615e9.4.1750780262415;
        Tue, 24 Jun 2025 08:51:02 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2339sm183308495e9.28.2025.06.24.08.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:51:01 -0700 (PDT)
Message-ID: <4545479f-749a-45e5-9743-13f7358c2a25@redhat.com>
Date: Tue, 24 Jun 2025 17:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
To: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-18-eric.auger@redhat.com>
 <20250620103538.000021c1@huawei.com> <20250620143822.7ab69038@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620143822.7ab69038@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mQwdYKdAqSpwHKgemsmDElMJmz9tbXQ0jnwSV7k6otk_1750780263
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: MVLIPKp2//74



On 6/20/25 2:38 PM, Igor Mammedov wrote:
> On Fri, 20 Jun 2025 10:35:38 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>
>> On Mon, 16 Jun 2025 11:46:46 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>> v2 -> v3:
>>> - use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
>>> - use cihp_state->use_acpi_hotplug_bridge  
>> pcihp_state
>>
>> Takes a bit of searching to find the various bits of the
>> same support on x86 but this seems to match up.
>> Exactly when things are built does vary but not I think
>> in a way that matters.  e.g. I think on x86 the
>> EDSM stuff is built whether or not we have pcihp enabled
>> whereas here you've made it conditional on using acpi
>> hp.  Perhaps a tiny bit more description on that would be
>> useful if you do a v4?
> edsm should be built regardless of pcihp
> (well intention was there, whether I messed it up or not I don't know)
>
> idea is that non hotplug ports can have a static acpi-index,
> so it doesn't depend on pcihp.

OK I can make it unconditional. The drawback is that it will oblige to
rebuild reference blobs again with native pci hotplug.

Eric
>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>
>>
>>> ---
>>>  include/hw/acpi/pcihp.h  |  2 ++
>>>  include/hw/arm/virt.h    |  1 +
>>>  hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
>>>  hw/arm/virt.c            |  2 ++
>>>  hw/arm/Kconfig           |  2 ++
>>>  5 files changed, 29 insertions(+)
>>>
>>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>>> index 5506a58862..9ff548650b 100644
>>> --- a/include/hw/acpi/pcihp.h
>>> +++ b/include/hw/acpi/pcihp.h
>>> @@ -38,6 +38,8 @@
>>>  #define ACPI_PCIHP_SEJ_BASE 0x8
>>>  #define ACPI_PCIHP_BNMR_BASE 0x10
>>>  
>>> +#define ACPI_PCIHP_SIZE 0x0018
>>> +
>>>  typedef struct AcpiPciHpPciStatus {
>>>      uint32_t up;
>>>      uint32_t down;
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index 9a1b0f53d2..0ed2e6b732 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -79,6 +79,7 @@ enum {
>>>      VIRT_ACPI_GED,
>>>      VIRT_NVDIMM_ACPI,
>>>      VIRT_PVTIME,
>>> +    VIRT_ACPI_PCIHP,
>>>      VIRT_LOWMEMMAP_LAST,
>>>  };
>>>  
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index d7547c8d3b..a2e58288f8 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -34,6 +34,7 @@
>>>  #include "hw/core/cpu.h"
>>>  #include "hw/acpi/acpi-defs.h"
>>>  #include "hw/acpi/acpi.h"
>>> +#include "hw/acpi/pcihp.h"
>>>  #include "hw/nvram/fw_cfg_acpi.h"
>>>  #include "hw/acpi/bios-linker-loader.h"
>>>  #include "hw/acpi/aml-build.h"
>>> @@ -809,6 +810,8 @@ static void
>>>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>  {
>>>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>> +    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
>>> +    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
>>>      Aml *scope, *dsdt;
>>>      MachineState *ms = MACHINE(vms);
>>>      const MemMapEntry *memmap = vms->memmap;
>>> @@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>  
>>>      aml_append(dsdt, scope);
>>>  
>>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>>> +        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
>>> +
>>> +        aml_append(pci0_scope, aml_pci_edsm());
>>> +        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
>>> +                               memmap[VIRT_ACPI_PCIHP].base);
>>> +        build_append_pcihp_resources(pci0_scope,
>>> +                                     memmap[VIRT_ACPI_PCIHP].base,
>>> +                                     memmap[VIRT_ACPI_PCIHP].size);
>>> +
>>> +        /* Scan all PCI buses. Generate tables to support hotplug. */
>>> +        build_append_pci_bus_devices(pci0_scope, vms->bus);
>>> +        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
>>> +            build_append_pcihp_slots(pci0_scope, vms->bus);
>>> +        }
>>> +        build_append_notification_callback(pci0_scope, vms->bus);
>>> +        aml_append(dsdt, pci0_scope);
>>> +    }
>>> +
>>>      /* copy AML table into ACPI tables blob */
>>>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>>>    
