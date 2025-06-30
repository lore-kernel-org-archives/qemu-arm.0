Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2447418dye;
        Mon, 30 Jun 2025 05:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNmg8qD3RgHMK92kCbEgAxbR4eLUgqpZKw332+xYoDbGr3gwMWDHL5jgTbnVN5+UFfrbgprrqp+hzW/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFd8UBvrLVc8FV8Uq3oFqWX0cd6Aiw+Yb5iZm4iBkOVGCjSRQTuPmpHK30VXdk9zjQMVIn/
X-Received: by 2002:adf:cb8c:0:b0:3a5:8a68:b81d with SMTP id ffacd0b85a97d-3a8ff520200mr8372478f8f.43.1751287997766;
        Mon, 30 Jun 2025 05:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751287997; cv=none;
        d=google.com; s=arc-20240605;
        b=Md9dFJU6sAfFRXc1liIzKnKSKRxiScpqDRVb/JP2mZzoL0TletXGj7Va5UzFgHGl8j
         8Nce8bZa6x/6SZPOiCHkdH0NCCycOrndi3uYn9dlJpqKXikzVH2ur3XTMefe/Vz9k9WP
         cDyXGYJQ+PE/5nLkgJiBLlMACHL9G/lP/34NQd4rIOvtr1YPEkznlH7HvWAwxY3RfiI7
         z80lwnay+9R+CIxrXEHdOy6IPxds7qEdUmCts0F0mlCkhS11tOZblkOKzW5QXojJ2aqS
         8KU/Vr7oop6X/XwTrTTWT71FjW8zQBHiP2obttIA8ojKnWDZlPhv9YtNNCbtNmfj2pf0
         zwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=YIFiJa1T9SmcA9hzQPyKCn9XRBbxcR6stcBE6XfxPP4=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=VuaS5JyaoEzE4M6BCJKbBUBkpCDyLrkCLBeTEbyjmt+aA0gQpqO6MWHoQ7oMYMXBfP
         dpVNDX7YvxQv/4/rUIves9/RLFkQKDnfZSHhSbb4rYjKt3oH9Daf8zWnV4DnvoDNZzRR
         EYkfKmdQEnoIfJdPxJRxtreiy0D3WRG7eKPwADRhkUdMVryqcV98JeezWcAbAvpiyWN9
         BUn+wVW/WsT6Tn3jLRw+ZONur5FsqbIQuVwMLQiT8hZH1ELreFHpssUN1cF8NVOjvrg6
         DfeQdbFvdskEF/JDeRJXC24cqE4bTj3E/WNMH9vIUz0BwkTYCndR0+dIukTkORVbqUi3
         WQtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a081845csi5858530f8f.712.2025.06.30.05.53.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5fJ3Nz9z6M4dG;
	Mon, 30 Jun 2025 20:52:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B8E01404C4;
	Mon, 30 Jun 2025 20:53:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:53:16 +0200
Date: Mon, 30 Jun 2025 13:53:15 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 29/32] hw/arm/virt: Let virt support pci
 hotplug/unplug GED event
Message-ID: <20250630135315.000041b2@huawei.com>
In-Reply-To: <20250627095620.3300028-30-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-30-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: a+WXdGI/ENNe

On Fri, 27 Jun 2025 11:55:18 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Set up the IO registers used to communicate between QEMU
> and ACPI.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Follow on comment inline.  Otherwise LGTM

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> ---
> v2 -> v3:
> - remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
> - use sysbus_mmio_map_name for all regs (Igor)
> - create_pcie left at its original place
> 
> v1 -> v2:
> - use ACPI_PCIHP_REGION_NAME
> ---
>  hw/arm/virt.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 878c567354..d8706ef9c8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -686,6 +686,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      SysBusDevice *sbdev;
>      int irq = vms->irqmap[VIRT_ACPI_GED];
>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
> +    bool acpi_pcihp;
>  
>      if (ms->ram_slots) {
>          event |= ACPI_GED_MEM_HOTPLUG_EVT;
> @@ -704,6 +705,18 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
>      sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
>                           vms->memmap[VIRT_PCDIMM_ACPI].base);
> +
> +    acpi_pcihp = object_property_get_bool(OBJECT(dev),
> +                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, NULL);
> +
> +    if (acpi_pcihp) {

As mentioned in earlier patch review, with this code you now have means to set the event
bitmap as done in other cases.  Maybe just do that here as well?

> +        int pcihp_region_index;
> +
> +        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
> +                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
> +        assert(pcihp_region_index >= 0);
> +    }
> +
>      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
>  
>      return dev;
