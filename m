Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp857286dyb;
        Wed, 25 Jun 2025 06:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ/AM5UeETRq/R2e9cR5HYWMwL/TycU5jL4hlQMpXpENkVZx9zZONOZG7L42Q33SZwIrfYYrDHXwm7qw==@linaro.org
X-Google-Smtp-Source: AGHT+IEvEpvInJ+KKYwYoMM6Goo14HeWd27WNMBrR84vzvijV7CVIvTAg2Fks30vP36VZ3YAgkmt
X-Received: by 2002:a17:903:350b:b0:220:c164:6ee1 with SMTP id d9443c01a7336-23824030d1cmr58872075ad.32.1750858626852;
        Wed, 25 Jun 2025 06:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750858626; cv=none;
        d=google.com; s=arc-20240605;
        b=K3Zk5K5xmFPiP51tgTDacixaB50WtTnuQ96JWzrLkezX0cqVzuXsawrRgs3w4ii3hS
         kD92DTvykLRg9ZUTYC2wjDeyW5Es704iNZcAmTi/sp5H+cmSFwLxh82ADJlAIZCg9Ihx
         +vYtW0PKCslLplHxIT5fkHv4spucyymxrjEupseSnldOZ+YCXgFXMTsc8Le0SBTvFEPW
         03wqLTCKmwUKB14yhxJyfmamUAJ0fYFxxzXfaBB0KK2WAjwArQeEio0jti/bs3TXVAAm
         c9pzPknm0zvi36QIxCJ9eYa7RC4BVCW+IGwWrihyQVBR2PlgL8krItHs4c/WzwJi2y/z
         4n/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jaApqlhiblKm5r3TKdO6hVIekuhpSl6yTPCgdm7/cSk=;
        fh=BAGWameGbZsONIXTYYXfN7N0ANRrmQU8Uu1eiw/081g=;
        b=aqkpom2P1o/kzs2ekpKHqkWjdSPrMpQscR6gQLE2T9TKMaGeIRFgdkAI/q6pdUv4TE
         g5pdiQulh4Y0XvkSaXirBoXrohVxteYjNVKamKv0wXl2niqzVzYbO8LXFKeHAtxFjpbU
         9V4Wy0RoPFmk7vjAQUTWtdc8iJ9kyKyOZXHFad9Xhea/cyA4VerC3/OsBm6lmqCvcpx0
         1njs5IcRCnVto7qGnY0jRx+vgmkLm9+HH3ec68JOD/50ODVkhoDnco5weIcApfnnrR7q
         kn2OMbLdOM60sfU8a0QWZHMDnZvvrZed1ZCQ89h6lVW/yOpfozf5dc5owuwWvI2BtMgo
         Y32Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxdOlqud;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-237d85dc088si180872995ad.179.2025.06.25.06.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:37:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LxdOlqud;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750858625;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaApqlhiblKm5r3TKdO6hVIekuhpSl6yTPCgdm7/cSk=;
	b=LxdOlqud+y0onCyEhMYBQ2C9VIzL9J09QUQLo4nlsw7XOImIeWUI2HzgSTeYdiin5KH9z9
	6T3IArzpuD9enJv8O29z1IU7Vtdi31FL4ROiPOLRiwd6kkEeWPHVQGT78O3y6+/9nRn1Zc
	KHmcxs5EK6oHnJvhz/VOjKGYlxNndXc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-hRyBNWwjMaKxbmdv6GslXA-1; Wed, 25 Jun 2025 09:37:04 -0400
X-MC-Unique: hRyBNWwjMaKxbmdv6GslXA-1
X-Mimecast-MFC-AGG-ID: hRyBNWwjMaKxbmdv6GslXA_1750858623
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d64026baso9569975e9.1
        for <alex.bennee@linaro.org>; Wed, 25 Jun 2025 06:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750858623; x=1751463423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaApqlhiblKm5r3TKdO6hVIekuhpSl6yTPCgdm7/cSk=;
        b=fRimkoSFIrJHOLFHrVD+FMQyFEGkQd+8Wv963xgJ6GqnjlyIByhqbKyTM7sgV3VcIH
         fnng4Zo/1iIeexk3dTzjSdsoj4eJjGl7ZEIFxj4YZ7VNr2Irbc4oayV6pW2A/0Y5Q54f
         3qDaQ+3RVf2J1H0MqSwsQ+Kv7tY4krfN7GOkZg718q8pXBcr/XF9FtjENbudMRp0g8U1
         rjFsjmL9EKzf2GDWlPIl9rg7l9SwJKqftBizJ002FmSOmJOedhOZUSu2gCDcddHMosJQ
         bbwYKFxBGhwJssy4Qu1S/KU1ai5zqJ9NKFyorNYawUb8LnNVlnc8qwElapgfsQonLfIC
         ebow==
X-Forwarded-Encrypted: i=1; AJvYcCVOTzEoS/Dgu6qzZU8q64ccx5P5BPAAv9AhZsUeFLC+GuZ3OykJbmoLR0LP4cKh7LrD+XaImQE27JJO7w==@linaro.org
X-Gm-Message-State: AOJu0YzHM4Re+7y4mbfypKBQx0SAZpdYHoubQ3+qruau7JqnM6EPTOUj
	pEIBhD/t5t70fC+ceuz+yUQze0L7XIEPNgnAlpV8+h8wcUFP/78OKoymW19tZl6+NpLHboNgz4o
	B8SeKlU8vc4yV/Wnorb4z2XToxBjeDVtpKrJSlNE4uhd/s4sgthL3QRf+Ow==
X-Gm-Gg: ASbGncupuOFT+9HIcQe0RGIDH/fcSI97ahTO6Z3O7/aYgx30UFFM48p9BHec5hShDBS
	m1s7fgBzdhtnTVPHOLKu7eOyUF4uK7O8ir1sVQ8vTaqLgEF7STVZIITtOQRj1Q54xfmhtU6dUGM
	saOmlBztxTNx0psfooJl7pF6DFqLbVIrJ7o4TJAfuokDXTF1uNNjqdIkc1PQ46DyDbROOw+s8N3
	DRFu5Lzx1YzG7fF4Phn6suMrVb+LtQXbvsiDSJYj5GEKuD8NbmShtk1TnZxEAKfPfkr4FCVMxh0
	4XGidecz7n6NhetAIf0V5cYQfIFN5K9IXTlGXmhfANlU5GTmQbj9oZxIO2xwiNHWVR3GMw==
X-Received: by 2002:a05:600c:8508:b0:451:dee4:cd08 with SMTP id 5b1f17b1804b1-45381ae9db8mr27150995e9.23.1750858623046;
        Wed, 25 Jun 2025 06:37:03 -0700 (PDT)
X-Received: by 2002:a05:600c:8508:b0:451:dee4:cd08 with SMTP id 5b1f17b1804b1-45381ae9db8mr27150645e9.23.1750858622439;
        Wed, 25 Jun 2025 06:37:02 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8063a5dsm4806861f8f.35.2025.06.25.06.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:37:01 -0700 (PDT)
Message-ID: <f90d8aa1-74bc-46e1-b4a6-9a4f54854d86@redhat.com>
Date: Wed, 25 Jun 2025 15:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 25/29] hw/arm/virt: Let virt support pci hotplug/unplug
 GED event
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-26-eric.auger@redhat.com>
 <20250620150648.09dab163@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620150648.09dab163@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k0sK8DkTFca-B4sL_-Vpd_nOhI3Mk8WB7ybkt89zGGo_1750858623
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: LFkHDSmuEEPT

Hi Igor,

On 6/20/25 3:06 PM, Igor Mammedov wrote:
> On Mon, 16 Jun 2025 11:46:54 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Set up the IO registers used to communicate between QEMU
>> and ACPI.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v2 -> v3:
>> - remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
>> - use sysbus_mmio_map_name for all regs (Igor)
>> - create_pcie left at its original place
>>
>> v1 -> v2:
>> - use ACPI_PCIHP_REGION_NAME
>> ---
>>  include/hw/acpi/generic_event_device.h |  1 +
>>  hw/arm/virt.c                          | 19 +++++++++++++++++--
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
>> index ec8e1abe0a..8f5d903146 100644
>> --- a/include/hw/acpi/generic_event_device.h
>> +++ b/include/hw/acpi/generic_event_device.h
>> @@ -111,6 +111,7 @@ typedef struct GEDState {
>>  } GEDState;
>>  
>>  #define ACPI_PCIHP_REGION_NAME "pcihp container"
>> +#define ACPI_MEMHP_REGION_NAME "memhp container"
>>  
>>  struct AcpiGedState {
>>      SysBusDevice parent_obj;
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 41be8f6dbb..8c882e0794 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -684,6 +684,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>      DeviceState *dev;
>>      MachineState *ms = MACHINE(vms);
>>      SysBusDevice *sbdev;
>> +    AcpiGedState *acpi_ged_state;
>> +    AcpiPciHpState *pcihp_state;
>>      int irq = vms->irqmap[VIRT_ACPI_GED];
>>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>>  
>> @@ -696,13 +698,26 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>      }
>>  
>>      dev = qdev_new(TYPE_ACPI_GED);
>> +    acpi_ged_state = ACPI_GED(dev);
>> +    pcihp_state = &acpi_ged_state->pcihp_state;
>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
>> +    }
> Doesn't it belong to ged_realize()?
moved there
>
>>      qdev_prop_set_uint32(dev, "ged-event", event);
>>      object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
>>      sbdev = SYS_BUS_DEVICE(dev);
>>      sysbus_realize_and_unref(sbdev, &error_fatal);
>>  
>> -    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
>> -    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
>> +    sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
>> +    sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
>> +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> like elsewhere, use property accessor
yup

Thanks!

Eric
>
>> +        int pcihp_region_index;
>> +
>> +        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
>> +                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
>> +        assert(pcihp_region_index >= 0);
>> +    }
>>      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
>>  
>>      return dev;
