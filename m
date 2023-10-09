Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1928435ejb;
        Mon, 9 Oct 2023 05:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt11KIiAqx8wlnwu4FW9GVhJfw5pj2QvRf8SekRSfWYd1/K5RQOJwzL6NO3AyCdU0QAoRn
X-Received: by 2002:a0d:e656:0:b0:589:fb69:a4ef with SMTP id p83-20020a0de656000000b00589fb69a4efmr17875340ywe.3.1696854395667;
        Mon, 09 Oct 2023 05:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696854395; cv=none;
        d=google.com; s=arc-20160816;
        b=VN1qVU4KcjD2CAw2fo3qG8ZM3QtxtzzkEY61JblEXytRfExNcacyt+1ia/W8qJ37s8
         9xnpFzU5NTkiGktFPsXzgeoRByGfhPlEInUqoENmPpv/0EcYe2IJnOKxbeB9+VKe+zbi
         Ez0ayWFn/5JRqAk+JYv4tWLiHeWFJWhPB/a5ma6MxMXIW59nWS9Vyee5fJz8wOSjvdDp
         hTdVLO3G1GedaZINewMFDQo5LbaXPpBiCjloabtsM7lo7qWEkaHz0L3LAMQPurffrzIh
         +AaGBAH+lUVQAw6Ba31PEReFw+pVLQfnKq0J4jReaTKd6VKRGX8gG4PQGAl7JLTSufj/
         pi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=lqeG/eYhKSmT3TW3cux7RQo1uBjM+0ZAehmt4uQL7zQ=;
        fh=GPxWsKePQQOQbx3DUz1WcTM7+aHXsm9W/SdNx32dskg=;
        b=LJvWh9mxB2gPy4rcC+C2awdH2CmfYbzc5ahHrEJ3kocIqtw6A6FUya1tsP/zIJFHey
         ky5aHB9MbPqMasMgUgMSd3Bkh+UddqUen6Mqyxwnu0TIeGEcwaN2kYmMjIhnbn0MT9nV
         KdAhtJ8HRU3XPS2jbbzAjXo2PmHiW62MceCWwopD4/4L20m1L/YBB+Z/LVG6wTwXrhBS
         rGoNaMzU4DkQTx5Egrh/FQZBoXXYIs/5mmzOzZdK8BcDZAJGs8BRjoCzBWjxlqmOaHSE
         K916iXPKT8PGCO3uHUUQWx/gQK5qB94nSYEsQ9wlsDkwpm1zyXqJLAnxWv35NOKehxqw
         Xiaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WB/zBhGg";
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f20-20020ac859d4000000b0041991ecc7dcsi6144839qtf.682.2023.10.09.05.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WB/zBhGg";
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696854395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqeG/eYhKSmT3TW3cux7RQo1uBjM+0ZAehmt4uQL7zQ=;
	b=WB/zBhGgJoWxSecd9/PwM/rBRIR1iReEHwxbuyxDezKG+M6PlDSdz9GRHGR7R9jXCvp1aH
	DPX6493JzR3yBNRHsqyUVyJDdnKLn+hXXDEvqC3kZ483QKRhQEGC849jUIt+01GcrWivrp
	CoYJn5RK1MtMhlz4MgedikXbvSQV4aY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-iuk-kZplPy6A6H7JjR63Cw-1; Mon, 09 Oct 2023 08:26:34 -0400
X-MC-Unique: iuk-kZplPy6A6H7JjR63Cw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-327cd5c7406so2928597f8f.3
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 05:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854393; x=1697459193;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqeG/eYhKSmT3TW3cux7RQo1uBjM+0ZAehmt4uQL7zQ=;
        b=anPKIRfAY50vUZPLAe1PDL52ECpjJHxOrIeI7giqAhKUzcFpEwrceKSpgpYWGRtKy7
         YuIIw3SXcL4IEnYpgVA/rSQTnbZYKE18ACuPweQYHuDajMQqMOhiyjySQMM07JiMp1VF
         MhCuTLDhRixZ6yDYTfP2lt0ix5QDu2b+5w0O2Ajm0QDfgM2eFZkdUUg0BaIreB4ttgJH
         bIibrlVk9T+cQfRmvjzXNLKBIpZDkvWUhRcuD9CnaRcQBZQXL5kvW34/w3Yv5igIdh/c
         wcKMtp65P4Jcv+VfC0UxHHeF30McSdIPoLe/UJI1wVpt8tzQDISC1X3ZDmOdMM4Ca73r
         d/BQ==
X-Gm-Message-State: AOJu0YyhVJFnlFJZwYMskIX4c+r8seGWYdSZxFi6K8cPxXHWD0hyfBFI
	ZT3oXmd6nsvnGnjkwvInzCjs77mFVJvaxBc+Cfz5rr4XtWP0XZm1aeA7YeYG9fKXcSG69JUZd0i
	RAQRknWrnCJuFtNMY
X-Received: by 2002:a5d:6145:0:b0:31f:ec91:39a7 with SMTP id y5-20020a5d6145000000b0031fec9139a7mr14037616wrt.14.1696854392977;
        Mon, 09 Oct 2023 05:26:32 -0700 (PDT)
X-Received: by 2002:a5d:6145:0:b0:31f:ec91:39a7 with SMTP id y5-20020a5d6145000000b0031fec9139a7mr14037568wrt.14.1696854392584;
        Mon, 09 Oct 2023 05:26:32 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d638b000000b00317a04131c5sm9442175wru.57.2023.10.09.05.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:26:31 -0700 (PDT)
Message-ID: <794b07a3-6004-23e2-189a-f76952751112@redhat.com>
Date: Mon, 9 Oct 2023 14:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-5-salil.mehta@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20231009112812.10612-5-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NERSsYHqXWKJ

On 09.10.23 13:28, Salil Mehta wrote:
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
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
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

Am I wrong or is that member completely unused/uninitialized?

-- 
Cheers,

David / dhildenb
