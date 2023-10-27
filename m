Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp225401ejc;
        Fri, 27 Oct 2023 07:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5DdtFipGMk8wX+i92OxFeFLODjgbWNa+v7Pk8+JBDnmD/ACKyO+3DyDcrfEBABHI8tQM0
X-Received: by 2002:a05:6214:411c:b0:66d:373f:32d4 with SMTP id kc28-20020a056214411c00b0066d373f32d4mr3267417qvb.16.1698415700295;
        Fri, 27 Oct 2023 07:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698415700; cv=none;
        d=google.com; s=arc-20160816;
        b=HdioGWEq7pcKlZEixHTWYpdvt9+Ht7EbOShqT4avfF9OpRFOW9YVlS4tD74rLTBMFs
         eLlmDsgOnu6DjnwoZIItbb5dWCBxNupJGKCVCkjTF3jIuA0bVOe4ahCIDGsuzlOaYvGe
         c6DBHdsCnkxukNvOhdmM4tu8I1SIaL/Z+ee6AZuQuBe6SsUAWD6R++tPaE6IVQp7385c
         Xv/Ocd273lLy3vDQ/NvIapf49obYqoB7UJG1e2OBAQxDSTl+RJKOFDYiSNvWdfQAfhB+
         VoU5BN2vF7R5Xy+GKYi+duDEx1cp1sDX5Anj6pY1+FM6MPMCqWbjKfYdAGdeJ3/6VCwC
         zSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=wTN7KSSZRiqxZF+BOn09UPcbaYB9WIihV9g9+3NAX/s=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=RB66WxxIiqYU8sifcy/+npfYzcZQ0RDWBlrA/lrQiNtvFt+01NNGaDm53tymQRtIc7
         +uLrLSXPLB/h1kajbGGDWZ6MDQE1qJZM4BBfcfI2fev8qKPqfmyst+d+9UtBnLMWJ5Yi
         Kz3Ivxgn5RpUDKFrg2h3I65rJBntHOF1NcH423BRYsoI2Jl6/CyorUEMPgzSMW34/6Wf
         6pw0crVHCQgK+gHJuPA92r4fE57BLK7I80FfnIdPhafcFZRlttW/YnHNLVhjTfCkc/yG
         AVqm0d15PCg8JOT7jVvnBZ6u9hVWJcb5KENfeRet9AbfYYg3Mh4Z4hVcQ05rRX/OCR5Q
         ZbdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrxNAbwj;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6-20020a05620a040600b00775784f9d2csi689006qkp.437.2023.10.27.07.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrxNAbwj;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698415699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wTN7KSSZRiqxZF+BOn09UPcbaYB9WIihV9g9+3NAX/s=;
	b=JrxNAbwjW/MiaVK5j/l62fodJS0wIjmW9EjTe5FCjyE0EhDb4HpqdTqp/1qKW573QyVOKC
	RbVuz8yw3UX14w9cvfOlkdK+C2tjbd66EcMHPNas+Wtom/DEhL/kpva3Oob6iMZMUV4zjo
	EAGekxUxbrqwEu5B0ZvD29p8axyDwzg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-G6bOYKIdOrKI3mm1CH0Czg-1; Fri, 27 Oct 2023 10:08:18 -0400
X-MC-Unique: G6bOYKIdOrKI3mm1CH0Czg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-540e79ccf3cso1581278a12.3
        for <alex.bennee@linaro.org>; Fri, 27 Oct 2023 07:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698415697; x=1699020497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTN7KSSZRiqxZF+BOn09UPcbaYB9WIihV9g9+3NAX/s=;
        b=B7FM+yIR1kyN1Qi0nrQOLZe6BDYda66Pm5GG43spJ1B0Xj+1rVjieSnqJO52P2g8fA
         Brv+1C3t14nB+uIbJm2Keh5Fvwm36b92/wLFXny3Sg9CVLCC4A2WEH1z+xUQt51TSPCe
         sEYwjsYK6+1RVcTesbWGSem/DdeLtKY5IWgCoZkg3Q+aoHmp1JH9MC4i9St1A+MOQVQd
         gDf/QPnBzmrWtGK9TYN8ux2i8MmOKufR/4dogAocaZNLgCu0+n6+W932iZwMXrB3b656
         pSM92Pu10/LmKftAw/4Jj/Z7HNVdlzBX9VYe3jnZ0WhfYPapA24Ka9xtYu+ZMFd7Mubk
         veXw==
X-Gm-Message-State: AOJu0YwKKY44fa/LrxBL1J0lWmUcIl8spoLs1OW08tFaAJZshZ/Kt8Hm
	TuXPEQB3DL48k0Ljb33/x2wrgQCk5/Ngqf2YptZ9Ud5gC2XlMDxmObuCozQp+mJrkgIRzOncZTr
	551GTMgB/gfpGTZg/
X-Received: by 2002:a05:6402:40c5:b0:53d:983c:2672 with SMTP id z5-20020a05640240c500b0053d983c2672mr2831773edb.38.1698415697264;
        Fri, 27 Oct 2023 07:08:17 -0700 (PDT)
X-Received: by 2002:a05:6402:40c5:b0:53d:983c:2672 with SMTP id z5-20020a05640240c500b0053d983c2672mr2831724edb.38.1698415696923;
        Fri, 27 Oct 2023 07:08:16 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id s20-20020a056402165400b0053e37d13f4fsm1273490edx.52.2023.10.27.07.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:08:16 -0700 (PDT)
Date: Fri, 27 Oct 2023 16:08:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V6 4/9] hw/acpi: Init GED framework with CPU hotplug
 events
Message-ID: <20231027160814.3f47ff70@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231013105129.25648-5-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-5-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: y29pGyVNWUG0

On Fri, 13 Oct 2023 11:51:24 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

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
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
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
ain't OBJECT(s) == OBJECT(dev)m


> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);

we really should refactor GED to initfn/realizefn pattern.
then at create_acpi_ged() one would enable cpu_hotplug event
and later realizefs would call cpu_hotplug_hw_init() if event is enabled.

>  }
>  
>  static void acpi_ged_class_init(ObjectClass *class, void *data)
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ba84ce0214..a803ea818e 100644
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
> @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>  
>  typedef struct GEDState {
>      MemoryRegion evt;
> @@ -106,6 +108,9 @@ struct AcpiGedState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
>      MemoryRegion container_memhp;
> +    CPUHotplugState cpuhp_state;
> +    MemoryRegion container_cpuhp;
> +    AcpiCpuHotplug cpuhp;

how about merging CPUHotplugState and AcpiCpuHotplug
and isolating AcpiCpuHotplug::sts to x86 legacy hotplug code only?

then you won't have to pull in 2 states (one of which includes
GPE specific array that's not applicable to GED)

>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
