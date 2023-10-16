Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp2913497ejc;
        Sun, 15 Oct 2023 19:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCl1uu+fQMwVrH8YmbxL9/LQhiyfZsh1cyCFGnJ1uuaKMhxTk0cqn0cPJqwPXAnTCHpC5
X-Received: by 2002:ac8:5885:0:b0:412:1e0a:772a with SMTP id t5-20020ac85885000000b004121e0a772amr40136831qta.17.1697424848570;
        Sun, 15 Oct 2023 19:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697424848; cv=none;
        d=google.com; s=arc-20160816;
        b=yfDK1gUG237ldnoGx62KJQvq+clBeO2EFYk6HAHKbiDGBNBDssnofgnsgIEs9wWy9Q
         8jneJfDmdcp9+e8KmxMRa/llAdLOr2lRxXKF8/bGiHeE+bqdZUp6gdvj0czUyu5acepr
         MBh0/xXbwSWvcwc0YgL8jua/bHWcuqyKZvEbmyF+Hf6HVvJDxW3cUL2yPgYTLwV921r5
         37wbSdQnec542xHvuN9GK5npKaAqYoppBMq6JCl3KYmi/v5Shk4oK75mflx0DmfcDap9
         jZ7SXMlWcAQpVam3v4TeIjDdAFIV8wpz+ABDrq36Tt0CxawFlL9YVNblvyQVwe1DcZZu
         hToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3CnSOxkafbW8YysG8B4qOJrFSGH79eaAZvvG6IPyRao=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=qIrPUs9XLgHBoA+iq9oevaidRDJKzt4bBLbYdypjRRJXPpyy1GdK7qowFTm7viRgZu
         5u0TezEGfNmHLiMpyQ7kCAMxyUAmrUYsVbeXr+v1oWtGVI1JNvhnDPpeNPMTOy5H4XSV
         eI48Jc/N9od/pQjT6alOq7MQp52hVZJNtla63KXZvTMKJH5wSP0S9zSLhL5HiIj+x/Me
         A72TUWVxPkaGjQTrA+Yj3FK+7CiqmKFf/87LzwHIXckcDo3c+4GgX/0xo4tF6Qvjsylh
         1Qw4nlcI3coEjWqL/2e8W1T7LeaPuDa1hevhdJwrjq2crbE3QYnsJFS3ouPvAlKvCh1p
         FduQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SGTEOfWI;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dn26-20020a05622a471a00b00419905d39e7si4487357qtb.517.2023.10.15.19.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 19:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SGTEOfWI;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697424848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3CnSOxkafbW8YysG8B4qOJrFSGH79eaAZvvG6IPyRao=;
	b=SGTEOfWIlMmcp3oao9/h/k5Bn+SypR38FrH+R6Y6NdjqvZfBuznzYV1e+Q7nsebNFQ7HV2
	+RZcvRDeiigTEGm7B+NCKle7hbaALPzkaALhn3yOex3hPRSbP/sT9RoLH19Cwj1rB1Iwwd
	GkaS1zRyMuAPFapWQhIuLAdtAgLw5VQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-lAB8jaLhMBu5qSxOYtOfhA-1; Sun, 15 Oct 2023 22:54:05 -0400
X-MC-Unique: lAB8jaLhMBu5qSxOYtOfhA-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6be0f482eb3so202788b3a.1
        for <alex.bennee@linaro.org>; Sun, 15 Oct 2023 19:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697424844; x=1698029644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CnSOxkafbW8YysG8B4qOJrFSGH79eaAZvvG6IPyRao=;
        b=iX2x9MShHtgf/9BtQzHQ0U0zEYlObc7RLRrQw1/Q/JgnTw28zdNLmg/yEs0Fafjb5A
         c98H318W1+2CkBDqqGUbTSnvg0Fg8KRWsspr9qPjGD7iTLU16uC1qa5+Lpzxll/HhHGw
         ueyqOGCvCuDKPkHE7jZShzmmVgmt/HUJoGgwPqFK6QvpUUAFQdSP08FKSt6MDC+Ivcze
         XEPEz+UnIdIpMBa+JmexIkHpfZKYbGmR0fURT8E5MM/5yUZd2qY5zZ6ItxbMX/C8lxGs
         IvCfCe11hIv6DlrI3jxdA/1G4In0NL+EZYw3RcN9sOdi7LA8gjoX5BVCNouyhI5ilTNY
         r1mw==
X-Gm-Message-State: AOJu0YyD2qmeUJYj/6VCnCfrl8LGxwNsDlOrBJpBLIewCsNcXo0zFrA+
	GyzrQMJWJcAQdsPMsPEZ2jZ8QSE++cVY+SFo1U7f7Hag1IwvPeJyMHT89ObMoQsyWgZn1U0EP9l
	wcmY1VsRvVyqAeype
X-Received: by 2002:a17:903:22ce:b0:1bb:83ec:832 with SMTP id y14-20020a17090322ce00b001bb83ec0832mr36082838plg.2.1697424844036;
        Sun, 15 Oct 2023 19:54:04 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:1bb:83ec:832 with SMTP id y14-20020a17090322ce00b001bb83ec0832mr36082800plg.2.1697424843735;
        Sun, 15 Oct 2023 19:54:03 -0700 (PDT)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id ix2-20020a170902f80200b001c61bde04a7sm7340295plb.276.2023.10.15.19.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 19:54:03 -0700 (PDT)
Message-ID: <cf0f3eb5-4dd1-207e-1f15-145603860ac8@redhat.com>
Date: Mon, 16 Oct 2023 10:53:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V5 4/9] hw/acpi: Init GED framework with CPU hotplug
 events
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-5-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231011194355.15628-5-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ne35aV8V4CtB



On 10/12/23 03:43, Salil Mehta via wrote:
> ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
> when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
> then maps or demultiplexes the event by evaluating _EVT method.
> 
> This change adds the support of CPU hotplug event initialization in the
> existing GED framework.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   hw/acpi/generic_event_device.c         | 8 ++++++++
>   include/hw/acpi/generic_event_device.h | 5 +++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index a3d31631fe..d2fa1d0e4a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -25,6 +25,7 @@ static const uint32_t ged_supported_events[] = {
>       ACPI_GED_MEM_HOTPLUG_EVT,
>       ACPI_GED_PWR_DOWN_EVT,
>       ACPI_GED_NVDIMM_HOTPLUG_EVT,
> +    ACPI_GED_CPU_HOTPLUG_EVT,
>   };
>   
>   /*
> @@ -400,6 +401,13 @@ static void acpi_ged_initfn(Object *obj)
>       memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                             TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>       sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    s->cpuhp.device = OBJECT(s);
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);
>   }
>   
>   static void acpi_ged_class_init(ObjectClass *class, void *data)
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index d831bbd889..d0a5a43abf 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -60,6 +60,7 @@
>   #define HW_ACPI_GENERIC_EVENT_DEVICE_H
>   
>   #include "hw/sysbus.h"
> +#include "hw/acpi/cpu_hotplug.h"
>   #include "hw/acpi/memory_hotplug.h"
>   #include "hw/acpi/ghes.h"
>   #include "qom/object.h"
> @@ -97,6 +98,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>   #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>   #define ACPI_GED_PWR_DOWN_EVT      0x2
>   #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>   
>   typedef struct GEDState {
>       MemoryRegion evt;
> @@ -108,6 +110,9 @@ struct AcpiGedState {
>       SysBusDevice parent_obj;
>       MemHotplugState memhp_state;
>       MemoryRegion container_memhp;
> +    CPUHotplugState cpuhp_state;
> +    MemoryRegion container_cpuhp;
> +    AcpiCpuHotplug cpuhp;
>       GEDState ged_state;
>       uint32_t ged_event_bitmap;
>       qemu_irq irq;

-- 
Shaoqin
