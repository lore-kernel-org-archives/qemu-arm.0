Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2223449ejc;
        Wed, 27 Sep 2023 18:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC1SBkkOm+AXNn/hvQc7BZSK0taYDk9mElKKtAGyNy/J9bh9u58EZf5mXtTTM/RMKA71EC
X-Received: by 2002:a0c:b446:0:b0:64a:9308:3016 with SMTP id e6-20020a0cb446000000b0064a93083016mr4114263qvf.56.1695863029609;
        Wed, 27 Sep 2023 18:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695863029; cv=none;
        d=google.com; s=arc-20160816;
        b=FsqR4UzVcenb1C3vHGaY1Vfbk8cQDgaONql+KBFWkrH16dyQ+KrW3gCbZ2QyORoas3
         rFlFkePYIAShGDJgpWDP4KCA7H03Ow/zBRt/JiUwjItxEk99HNhKVSvEAEa9siMt2M0j
         SQNUPGVSrQWD4J+W1IqZyaIzhINMtxL6AkLNQ3b1k6OfPg5wYnry90+fXuoXjuQThSta
         SbjLSA10pErsZsTO0MU+p28EUp4oOQDU7xrUlF6yHxaYIj65nc6t6NvVawqiD0GxVnXd
         658Xw0cqR8Fnpqr628ES2rC52ZwNrJOD+dIdDHcey14S3D82fB0GgJc8hU7tOCqQNc9S
         tRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VljtfhAY9I3PsuiP8Db42I9M0WaDXHXX8rt5liSX3io=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=BCetyXa0kHxX+kQUQtrUD8Uo4bYEeUasvfDj7lgP8Zz4Ktv5P01z7PdZINjY4CmhoQ
         y6TIc6wLoGmJedgTz0zwSV5D68MHoGrDkBAj5O3QeWVsxxaEjD/yXlFu4T34WRv/gMTO
         8QXO4D8xi1l5KrxU3DzAU0pob3LqDKaJDC9ML6kq30XZO/LReZJsBFvXZzNrxEGSuC07
         Yh+FHdButyNcxmjiy90Zmozb9dYSp6oorEt67gZywbsz7bn+zeCDcbCPAYEx6NGNDODq
         ibsGOfJwAIzaE1w6MThfNRVLv07MXYDDO4IxDAH/638SzUXvI6ZbTSBrmtOblsnLJSgM
         3Zuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PH1+EsuT;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x19-20020a05620a0b5300b0077262b2e26fsi8496048qkg.68.2023.09.27.18.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 18:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PH1+EsuT;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695863029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VljtfhAY9I3PsuiP8Db42I9M0WaDXHXX8rt5liSX3io=;
	b=PH1+EsuTrYNaxZ0V3Y36p6LUX+Zu85M27qRjRaf4wtpqcj1+sTtxr3ITgE7Rm5xPoPdYdj
	gWKuKqyU2DStKCKKB6r8KEr6KQ9Ccwctd8R2PxDWTqx+g1j5i40e94oT3H24qfl4AaD7Xx
	FsIg2rYHFMB2T6OlNqXUa3XmuuKUhIs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-fDzGjI7oNDaZfG_rtUBBwQ-1; Wed, 27 Sep 2023 21:03:47 -0400
X-MC-Unique: fDzGjI7oNDaZfG_rtUBBwQ-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-584b0e2365aso5770124a12.0
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 18:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695863027; x=1696467827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VljtfhAY9I3PsuiP8Db42I9M0WaDXHXX8rt5liSX3io=;
        b=sECK5jccPh+85niH4d7u2jIqdQ9IeRU0fsyzMqWWArC02aDq7/ikxRHMU7vGr2LQWh
         DUG5dim848f29g4qflnKN8aCg2j0aYBotP++mYfvyyUCvMbkCeFpEy9K1yqnKXY/UBQO
         7PdeHnJI9jCk5Pj6vgaHpbY6TQxWBJvtD2y+vTtCb0hZrDAQdzR3lJnRJFlTgQ4Rca9k
         Dnxi0LF2qVPoilw4aAU7o4/PtJIhztwMqxi1imqL3q/+wgOx4CdaV/aW3BJ9hLggx/W1
         u7diBCy36yPHjHI/asAjh+e6OImOAH/eQwqsoihqUz/GMK2yvBfLK3ZU4FKs9MAyw39M
         YQzA==
X-Gm-Message-State: AOJu0YxBttdbUjX5zmMI7BrL/OPP7VWtlTSyp4fIMvENgYsJr7hF5tco
	5tmj2ehpfG2dOriLaQTwEVaJTQT0GmwWDoNayAFTsHrRbRnOFTTaufwspAAlwh8Glb4A0hRm+9P
	cZDPHlsSUdo/+3HOV
X-Received: by 2002:a05:6a20:9191:b0:15c:d925:aaaf with SMTP id v17-20020a056a20919100b0015cd925aaafmr3710153pzd.5.1695863026395;
        Wed, 27 Sep 2023 18:03:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:9191:b0:15c:d925:aaaf with SMTP id v17-20020a056a20919100b0015cd925aaafmr3710136pzd.5.1695863026085;
        Wed, 27 Sep 2023 18:03:46 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id jc1-20020a17090325c100b001b8a3e2c241sm6738688plb.14.2023.09.27.18.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 18:03:45 -0700 (PDT)
Message-ID: <1e526a50-7001-a15b-79cb-e223048b52ce@redhat.com>
Date: Thu, 28 Sep 2023 11:03:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 14/37] arm/virt: Add cpu hotplug events to GED
 during creation
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-15-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-15-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: HK1/azsCK1ZN

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> Add CPU Hotplug event to the set of supported ged-events during the creation of
> GED device during VM init. Also initialize the memory map for CPU Hotplug
              ^^^^^^^^^^^^^^
              it can be dropped.
> control device used in event exchanges between Qemu/VMM and the guest.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c         | 5 ++++-
>   include/hw/arm/virt.h | 1 +
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 

The changes look good to me:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 070c36054e..5c8a0672dc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -76,6 +76,7 @@
>   #include "hw/mem/pc-dimm.h"
>   #include "hw/mem/nvdimm.h"
>   #include "hw/acpi/generic_event_device.h"
> +#include "hw/acpi/cpu_hotplug.h"
>   #include "hw/virtio/virtio-md-pci.h"
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/char/pl011.h"
> @@ -155,6 +156,7 @@ static const MemMapEntry base_memmap[] = {
>       [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
>       [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
>       [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> +    [VIRT_CPUHP_ACPI] =         { 0x090c0000, ACPI_CPU_HOTPLUG_REG_LEN},
>       [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>       /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>       [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -640,7 +642,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>       DeviceState *dev;
>       MachineState *ms = MACHINE(vms);
>       int irq = vms->irqmap[VIRT_ACPI_GED];
> -    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
> +    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_CPU_HOTPLUG_EVT;
>   
>       if (ms->ram_slots) {
>           event |= ACPI_GED_MEM_HOTPLUG_EVT;
> @@ -655,6 +657,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>   
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 3, vms->memmap[VIRT_CPUHP_ACPI].base);
>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
>   
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index fc0469c33f..09a0b2d4f0 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -85,6 +85,7 @@ enum {
>       VIRT_PCDIMM_ACPI,
>       VIRT_ACPI_GED,
>       VIRT_NVDIMM_ACPI,
> +    VIRT_CPUHP_ACPI,
>       VIRT_PVTIME,
>       VIRT_LOWMEMMAP_LAST,
>   };

Thanks,
Gavin
