Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1329232ejj;
        Fri, 24 Nov 2023 08:14:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVy5g56suedX5FJ2MBHggmS/B5/TVLbz7WkQq+y5g7uwc5lU38x2JQcjEIxtEYGy0GFTWW
X-Received: by 2002:a05:620a:4883:b0:77d:7843:a06b with SMTP id ea3-20020a05620a488300b0077d7843a06bmr3961293qkb.4.1700842493828;
        Fri, 24 Nov 2023 08:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700842493; cv=none;
        d=google.com; s=arc-20160816;
        b=dxrnJShVoxtmsUEhEB3dkVfyo11aR8M4ijTiWRyN1k2jve/nJfwRst+gubrA6LPeD/
         YldDUMFyZ67GFgNN3s98dQTRVW9TahYogkE10wEW49qoodnGlQOwtvdmydvT20auz+9U
         nFiQSYieOuvUDblWumdL5UzN9HXmM0sAvpl4DMhQ7WUaYh0Jw0aCtQqDIBqco2FDXI/l
         WYZWDgxR9Lyp47oBtTbrJrHM6QnCXl9bi5WuUcAJd6Aq9eQb+yc+56YimbTeBEIhN/uC
         E5iYej5ATN29p9DX4xt+Uyf/d5flw4K9k7mU4s9Z3D40smNzRtOyS85QcEZqrNE3p2DJ
         0RkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=6WUOrrb6xP1Htbjp9XvoNsdP/T1rDhFiIotX0hUCLbY=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=q/51EKMlIt7NJJNcjjVdL2E8JEm9Zd/hcF2SEwnprq/ztkzRBC0ThZR/i/OI31lLa/
         Dn+Q2nXQs+sZ8gV3xf6TERoK6WRUhIh0dlZn+CB8ZRv3WHdmOOVIzRYSXp0lzT8NdLzw
         JeLDb5mIZkYJv26lRVBxtVEnePsj40AHVNBSQPP1mN5uEiG6xE2D6XYBCWtVymvmjHZ5
         0nnrcMlBjKnr46jTsu8UlqUiUsOssDgoAOnN3i5+mH/5xtr/nPIeOhqCzmNDzW/t09cs
         ly98SR0ZIIf/pxk3kQVXTSRw1dkEJJUSXqoFangqsqR2uUUoOvS5tnKXdNpd3kj+xxob
         xP7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOpjA3UC;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id pr13-20020a05620a86cd00b00778b115b7b4si3615749qkn.440.2023.11.24.08.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOpjA3UC;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700842493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6WUOrrb6xP1Htbjp9XvoNsdP/T1rDhFiIotX0hUCLbY=;
	b=GOpjA3UCNXutjZgtw/pD+wyJWjbROpG/VyM1+f9VY0usUzixQFUu8DW5hz/SZJR26isu8g
	dgJpwtXih5QseTtiGpNkwfKoJlds8K8XeOjgqvujIcxXTDcpBZmJVzmozvmvpgfy9HsEHx
	SsA+Gndm877qpbmnEZxaGtVUT9hiHNQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-RgY2VnDAMV-q7j4rZtfx2Q-1; Fri, 24 Nov 2023 11:14:52 -0500
X-MC-Unique: RgY2VnDAMV-q7j4rZtfx2Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a02a5fdddcfso142331766b.2
        for <alex.bennee@linaro.org>; Fri, 24 Nov 2023 08:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700842491; x=1701447291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WUOrrb6xP1Htbjp9XvoNsdP/T1rDhFiIotX0hUCLbY=;
        b=gNmBJWUdLhMM0yH0Io8JC1nY9f7gmMJ2UTUvhuFJRuOls+S29MnydQvzZ1rp3EaKnd
         oJF/UtibfL2qmrctVgcbNnZ/qrpJu6jnjZCpPtznHId5SmN7kpeL0TQ6g1oKE6KVvPV2
         r6BRhjy6/MvdNykCQ36ewAZe6mRZGZ2I8Xd27wJqc4r1SEneF48sRiWbLOAdIJAqDE+4
         LEgUfdwkON/mmHfbdgnn6Ah2mH4MGgETLZGBwniPSj5TKn2VIgpLMIjY3RGNBmu1umdu
         WAph+svAZ3twxIhoY0AET57sl2BPAFNzmDHvg9L7bHcJPItUwkxr2hkjXJpxLirMpEBH
         cIeQ==
X-Gm-Message-State: AOJu0YzGM1mM44q4M+NfgL6kBiEytaJrBch+bt+wM8K1U4XWlQOE1N2f
	TvHOSf4wnBOW2J6/NZGt2GBvcwjK1to9XDm7iO8fIalWg2V0Bbm4hrNMq5qvK0WiH0euJpw5eLG
	FcurTxlHsXO9LKycO
X-Received: by 2002:a17:906:5ad8:b0:a01:e916:714c with SMTP id x24-20020a1709065ad800b00a01e916714cmr2666049ejs.61.1700842491011;
        Fri, 24 Nov 2023 08:14:51 -0800 (PST)
X-Received: by 2002:a17:906:5ad8:b0:a01:e916:714c with SMTP id x24-20020a1709065ad800b00a01e916714cmr2666003ejs.61.1700842490613;
        Fri, 24 Nov 2023 08:14:50 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
        by smtp.gmail.com with ESMTPSA id q13-20020a1709060e4d00b009fe16be6a65sm2231216eji.63.2023.11.24.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:14:50 -0800 (PST)
Date: Fri, 24 Nov 2023 17:14:48 +0100
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
Subject: Re: [PATCH V7 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20231124171448.7cb2084f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231113201236.30668-4-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
	<20231113201236.30668-4-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: dUwnVqOD5SzF

On Mon, 13 Nov 2023 20:12:31 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
> _CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
                        ^^^ typo?

> notified event by evaluating ACPI _EVT method to know the type of event. Use
                                                                          ^ new line/paragraph ?

> ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.
 
> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> ---

FYI,
add per version changes here, ex:

v7:
  - Add cpu_hotplug_hw_init() stub ...
      (instigated@by)

this way reviewer isn't forced to check previous versions of it.
otherwise:

Reviewed-by:Igor Mammedov <imammedo@redhat.com>

>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++++
>  hw/acpi/generic_event_device.c         | 17 +++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  4 ++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>      return;
>  }
>  
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
> +}
> +
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>  {
>      return;
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index a3d31631fe..57b0c2815b 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/cpu.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
> @@ -25,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
>      ACPI_GED_MEM_HOTPLUG_EVT,
>      ACPI_GED_PWR_DOWN_EVT,
>      ACPI_GED_NVDIMM_HOTPLUG_EVT,
> +    ACPI_GED_CPU_HOTPLUG_EVT,
>  };
>  
>  /*
> @@ -234,6 +236,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>          } else {
>              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -248,6 +252,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>                         !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
>          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -261,6 +267,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -272,6 +280,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
>      AcpiGedState *s = ACPI_GED(adev);
>  
>      acpi_memory_ospm_status(&s->memhp_state, list);
> +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>  }
>  
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> @@ -286,6 +295,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_PWR_DOWN_EVT;
>      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>      sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);
>  }
>  static void acpi_ged_class_init(ObjectClass *class, void *data)
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ba84ce0214..90fc41cbb8 100644
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
> @@ -106,6 +108,8 @@ struct AcpiGedState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
>      MemoryRegion container_memhp;
> +    CPUHotplugState cpuhp_state;
> +    MemoryRegion container_cpuhp;
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;
