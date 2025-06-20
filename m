Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp783064njc;
        Fri, 20 Jun 2025 03:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9PVHVprkAP5bYgdyTrImYGI22eHs8KlTiWvIvKXkJYsfUhY2lc8t7V+oTwyykr5focaZx8ZcfAVNp0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGCEi4Mkr45jA4aFa+3JXdEdXtht41319mRuRHMkLnP4/Z6GlF5BgJIgsV8pk77otHdbdHf
X-Received: by 2002:a05:600c:1c1d:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-453656c2bfcmr19159195e9.25.1750414668416;
        Fri, 20 Jun 2025 03:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750414668; cv=none;
        d=google.com; s=arc-20240605;
        b=J2IDObR2Cbfeogvbfj2Pu/Cd/+QRC0hijDziyPoWEJv7xe8ScJo6tC4Iyan3kVoy5m
         HVIX8hK9dHvIVwKetUYfn0jFfvBim9VQJOg5D9OaZEqcF5GWDZTWugq6kA549WqsZqO9
         pBC0RE/JUvlSeRUiaEPdkIEADTVGX4X6/UoUT7kxVPFWkpfVPY1mYZVUSOgEAVNA9MX3
         MsT+iN3OtqX1m39+E0sac+YuctOMP7ChBmrZvMBo55+2x1aYpYKNaBWYyZ94ODdlM9VJ
         n+8UTscr/K9wjVZoKzbQhohlj0aW4R0HH3kS64PxtOZD/Mc01QvCF13g2cmp+ywPhqff
         eYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=OIb3TtMzqJ4I954J3gglV9NR/uMzTorwd226u/ND6K8=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=Epj2o/d781/WkbIlFOfvswLgwCJYUEwslrGV7pJkIPyFtJVYBrv3KacJWAT9TbNEzs
         dc1sUU8e2JUY43yfdMLjtq1HMgazyU7PTxnyZqboaE9XY1slcj1a7aW1A+HG7+/RPVwo
         9Y1yEXqbqN2htS4DW/FePCVEna2e2ng2q1Aed4xTx0RhccGjtf2syCPzl9RS+Ljl1u70
         8cPeftDV9rNnFtD0srqWJiKfJWHnnRoiMc2Ut9fK/066Mkrat1NxbjNpfHVY8TvYWDTA
         4/ACjR4OaA3UH6CaviSFoyCTrvMy60iuCoP5AyX5x9kbB3QR/siCKc47YmsW0CwnFL8Y
         0wLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d118d8desi1121960f8f.470.2025.06.20.03.17.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNtb13Ksbz6L5GL;
	Fri, 20 Jun 2025 18:13:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C04D1402FE;
	Fri, 20 Jun 2025 18:17:47 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:17:46 +0200
Date: Fri, 20 Jun 2025 11:17:45 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 25/29] hw/arm/virt: Let virt support pci
 hotplug/unplug GED event
Message-ID: <20250620111745.00004018@huawei.com>
In-Reply-To: <20250616094903.885753-26-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-26-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: k33AMC27TKUb

On Mon, 16 Jun 2025 11:46:54 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Set up the IO registers used to communicate between QEMU
> and ACPI.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
> - use sysbus_mmio_map_name for all regs (Igor)

I'm very much in favor of this change but maybe break them out to
a separate patch - perhaps even one that can run ahead of the rest
of this series?

Mind you if this is going to land shortly perhaps not worth the bother.

Either way

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> - create_pcie left at its original place
> 
> v1 -> v2:
> - use ACPI_PCIHP_REGION_NAME
> ---
>  include/hw/acpi/generic_event_device.h |  1 +
>  hw/arm/virt.c                          | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ec8e1abe0a..8f5d903146 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -111,6 +111,7 @@ typedef struct GEDState {
>  } GEDState;
>  
>  #define ACPI_PCIHP_REGION_NAME "pcihp container"
> +#define ACPI_MEMHP_REGION_NAME "memhp container"
>  
>  struct AcpiGedState {
>      SysBusDevice parent_obj;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 41be8f6dbb..8c882e0794 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -684,6 +684,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      DeviceState *dev;
>      MachineState *ms = MACHINE(vms);
>      SysBusDevice *sbdev;
> +    AcpiGedState *acpi_ged_state;
> +    AcpiPciHpState *pcihp_state;
>      int irq = vms->irqmap[VIRT_ACPI_GED];
>      uint32_t event = ACPI_GED_PWR_DOWN_EVT;
>  
> @@ -696,13 +698,26 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      }
>  
>      dev = qdev_new(TYPE_ACPI_GED);
> +    acpi_ged_state = ACPI_GED(dev);
> +    pcihp_state = &acpi_ged_state->pcihp_state;
> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> +        event |= ACPI_GED_PCI_HOTPLUG_EVT;
> +    }
>      qdev_prop_set_uint32(dev, "ged-event", event);
>      object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
>      sbdev = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(sbdev, &error_fatal);
>  
> -    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
> -    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
> +    sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
> +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> +        int pcihp_region_index;
> +
> +        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
> +                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
> +        assert(pcihp_region_index >= 0);
> +    }
>      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
>  
>      return dev;
