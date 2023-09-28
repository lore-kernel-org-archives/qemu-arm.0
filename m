Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2220343ejc;
        Wed, 27 Sep 2023 17:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9w07CTzIhHFHro/aYWx5tRr8MQVcN+an/MoUqsvWRZ/ZPQ6uvZrbQEbN/tXKEhudOD4N4
X-Received: by 2002:a05:6402:549:b0:530:bbeb:571 with SMTP id i9-20020a056402054900b00530bbeb0571mr3246881edx.36.1695862629185;
        Wed, 27 Sep 2023 17:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695862629; cv=none;
        d=google.com; s=arc-20160816;
        b=ABLqTxIyhNioxAwq9K+F9GdyO70yiDY/3VNnGpXgXGR/2CbWv5nXicDvuRfU3En+LO
         9FvSqMK8Y7ckUom2+tdz//1LB/9UKiyv/fspwUAOQgpzat7aJq6enRx9HcCa0eujt526
         XHTmAJuXLvTOJ+v3Y3Sl2XdlX/7dpLFMJrICIGIcd0A7ZPVZBqyG8RODpJC4c1llTYlC
         eGrLY25km2cCSc6ibKQeOepaSaVBdoO0lld3FEq7Oz3HQIxAB4qgHQQLRqHmJyyfgKUW
         jVW5Apw6UAMo5mByJ53htogfefXWsTz14+Lkz6PL3ZvugbVyHJFsu8c9zGB5lTWpi3TI
         5hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Gbrsl00JxY9Mm0XVtA3ZtJCnbtkROL6hKRpyD9Lw29c=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=0LNnGbm6rwxrrYb6QzJRjW/e9kRLQUnrq9oqVjtNQzzcj4++H9lP6to1wGFMTAFVFS
         ACMqEHUL7X8zct98U6X1zbpGN6b7DZDqKeqCYREufxVOZ1179gfKZeTihauAhDpFW/qg
         j823vBsvpJQG6+vVaqij/VC0bYAZWmS3TzPj6sYjDCL2vN++elwzOC4BG/kyAvTjvmZz
         9Lw1T+4fE+u3sweiUbdoW11WnMYcfIcNh9GBYHZNiHp5oMmJ9V0zbpVSHnmfYEV/EQU9
         I06GgiaE/Nq0Qcn74jL+0KKKMMSNn6vZ/E/8hJIVW8eVRTE7taqUmPymDT2EZha1mS7o
         OOkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TflqxsJ5;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i24-20020a056402055800b005330f24bfcdsi13620108edx.575.2023.09.27.17.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 17:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TflqxsJ5;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695862628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gbrsl00JxY9Mm0XVtA3ZtJCnbtkROL6hKRpyD9Lw29c=;
	b=TflqxsJ5vv/Hqc2v8/gZhImLnRHbnQdSj4L0KYap4GMI8SxSCKRb9YnL1zfmqpIr8L7w5T
	ep9Qq839j5L0cqyUNf3I6qQ/VZ7IAgfP4m04ULWUk9HdKoLi79HoyGTRJKKMbjC7wNyd5T
	E6ivBm4mVmdLf02gRti2tqVdUMb6xG8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-0HRP1x5kPsSJ5u_N7Pd_dw-1; Wed, 27 Sep 2023 20:57:06 -0400
X-MC-Unique: 0HRP1x5kPsSJ5u_N7Pd_dw-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-57b6753e601so21906981eaf.3
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 17:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695862626; x=1696467426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbrsl00JxY9Mm0XVtA3ZtJCnbtkROL6hKRpyD9Lw29c=;
        b=JThvk7DkrlviJUkcmACE+7mMo4Y8x75/28TCyPOLuyN3gj9Nws3iiaYQxj+Qi3MPjR
         j6dij+eHXQUx2A3Sc83QokYbe238dETIxY0vUFmf5kcs/VTNqm9PQgTKD6ywyuFBhkPj
         SFt9Ktq0I4VKloa00kj/Bo+gFM0bqX08aaDMPmm84cVqDv17X2Z4IREHGRqPMzCLgT0I
         ZN/lWNkhp2wkoMW6FsMrzVN/AU5x3eYef66buCuhooXzkAMFC8oIvYCXW1/m48/89Z0q
         sfzTipQ8OsAajhpwVrMRjvojMQvhcGqsZJQslfzU3N5pVRjZiPf8OtwLR6c0cnxhwwTK
         PIaA==
X-Gm-Message-State: AOJu0YwPB9O3RqvJZ1vAjLXabZ1/r80Xq6fHM5HLSaf4ddRAehjQvii+
	a3P4Xy/k2x2HCMPqVHmuvuggYO54YpQ00xZeHLnLHlmiUPllah00yhVm/oKg0R34jquVYqVYKIn
	uStiuMvGSuje31uvT
X-Received: by 2002:a05:6358:2484:b0:143:3179:1a67 with SMTP id m4-20020a056358248400b0014331791a67mr3786552rwc.29.1695862625878;
        Wed, 27 Sep 2023 17:57:05 -0700 (PDT)
X-Received: by 2002:a05:6358:2484:b0:143:3179:1a67 with SMTP id m4-20020a056358248400b0014331791a67mr3786537rwc.29.1695862625493;
        Wed, 27 Sep 2023 17:57:05 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id b25-20020aa78719000000b00690cd981652sm12328863pfo.61.2023.09.27.17.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 17:57:04 -0700 (PDT)
Message-ID: <f3db9fe9-2fbb-003e-3da4-26c401d09c1f@redhat.com>
Date: Thu, 28 Sep 2023 10:56:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 13/37] hw/acpi: Init GED framework with cpu hotplug
 events
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
 <20230926100436.28284-14-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-14-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ep4NHeP/E7mB

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
> when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
> then maps or demultiplexes the event by evaluating _EVT method.
> 
> This change adds the support of cpu hotplug event initialization in the
> existing GED framework.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/generic_event_device.c         | 8 ++++++++
>   include/hw/acpi/generic_event_device.h | 5 +++++
>   2 files changed, 13 insertions(+)
> 

It looks a bit strange you're co-developing the patch with yourself.
It seems all patches follow this particular pattern. I could be changed
to:

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

The code changes look good to me with the following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

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

Can we move ACPI_GED_CPU_HOTPLUG_EVT ahead of ACPI_GED_MEM_HOTPLUG_EVT?

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

#define ACPI_GED_CPU_HOTPLUG_EVT  0x1
#define ACPI_GED_MEM_HOTPLUG_EVT  0x2
   :

If the adjustment is friendly to live migration.

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

Thanks,
Gavin
