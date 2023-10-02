Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1416310ejb;
        Mon, 2 Oct 2023 09:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzAv8jnX7HT5wefMLECsQMk8JGlueFAKMuRV3K+lHQJkQ+eFmpCfD2rNpzz5WKSu+SuNwP
X-Received: by 2002:a7b:c456:0:b0:401:eb0:a98d with SMTP id l22-20020a7bc456000000b004010eb0a98dmr11588803wmi.24.1696262781394;
        Mon, 02 Oct 2023 09:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696262781; cv=none;
        d=google.com; s=arc-20160816;
        b=FT/pgf8SC7+mhxRk6ApwWagb4Yu9X3cuzBrUxalgLQGLg92nbPStdHi6UInLXZxLsT
         8rnLitj9zOpm56tWx0N0hXxEP18uvefzoUKQaLveKoNALiZrZA+kVuxFdJGmaILGKa6h
         KXQiMubCuSliWUFg3+Hoa4TbTt09nrGOocBt0Ouh6DtndmgHCj7QvxDYP7HHAufC76ps
         dkdnCrNjVkXhTLyA3WofrDmF3bIa2ji+qOqjYmAAeXmhdQVS/PkkJJS8kC8PCJOIaGaZ
         8a7EaKF/Cr4aDZ1BPc6lDzE1IuKpnvYwPjAni53Ul0h8P1KkI8kBLZM27+7+7yJXuna6
         YVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=IE1V873uOcIMwXPhEUR4O3qxwJCGlGmWq1qyNrlgo6g=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=N0RLATnt8HBKNAS8W15NO6t4CHC5J6Jmu69xDN7vNZXcDZkXTdQr2TKmOek6s2yzyQ
         jr+wSibTc8KB0EfC2kZKecrGJydYUgWYVpkMjTaNzOxvd7NjI76l/KJPIhWD8YGuB/1n
         u1AJnLdkd54T4/HS4AOBl6+zkA3Du9hsf+0geVvhTebsOmhtSqk8R8S/E93PCIrlsEVJ
         TGh9F1KdHGCZf+rUIQ4kMw6AL/BRqDytEyjnKzRgPBFketepD338J0TWIhih34ueMvQZ
         BunSXuOPYiV26N7dphObQOPEflun5UjZjpNA9EfJc10R6TEczAJQpTFlXp4dB2E8mNTH
         yeig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m34-20020a05600c3b2200b003fe24e7fb5asi4161906wms.32.2023.10.02.09.06.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rzm5w0Jg7z6K7G0;
	Tue,  3 Oct 2023 00:06:12 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 17:06:18 +0100
Date: Mon, 2 Oct 2023 17:06:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH 4/9] hw/acpi: Init GED framework with cpu hotplug events
Message-ID: <20231002170617.000044f2@Huawei.com>
In-Reply-To: <20230929124304.13672-5-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
	<20230929124304.13672-5-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: e+MoH9SUf+eC

On Fri, 29 Sep 2023 13:42:59 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
> when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
> then maps or demultiplexes the event by evaluating _EVT method.
> 
> This change adds the support of cpu hotplug event initialization in the
> existing GED framework.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
FWIW this looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/generic_event_device.c         | 8 ++++++++
>  include/hw/acpi/generic_event_device.h | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index a3d31631fe..d2fa1d0e4a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -25,6 +25,7 @@ static const uint32_t ged_supported_events[] = {
>      ACPI_GED_MEM_HOTPLUG_EVT,
>      ACPI_GED_PWR_DOWN_EVT,
>      ACPI_GED_NVDIMM_HOTPLUG_EVT,
> +    ACPI_GED_CPU_HOTPLUG_EVT,
>  };
>  
>  /*
> @@ -400,6 +401,13 @@ static void acpi_ged_initfn(Object *obj)
>      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>      sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    s->cpuhp.device = OBJECT(s);
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);
>  }
>  
>  static void acpi_ged_class_init(ObjectClass *class, void *data)
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index d831bbd889..d0a5a43abf 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -60,6 +60,7 @@
>  #define HW_ACPI_GENERIC_EVENT_DEVICE_H
>  
>  #include "hw/sysbus.h"
> +#include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/ghes.h"
>  #include "qom/object.h"
> @@ -97,6 +98,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>  
>  typedef struct GEDState {
>      MemoryRegion evt;
> @@ -108,6 +110,9 @@ struct AcpiGedState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
>      MemoryRegion container_memhp;
> +    CPUHotplugState cpuhp_state;
> +    MemoryRegion container_cpuhp;
> +    AcpiCpuHotplug cpuhp;
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
