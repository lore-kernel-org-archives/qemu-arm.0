Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp228322njk;
        Tue, 16 Jul 2024 07:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdNr8i1TMRUeyhuy+KLv9kU1CRTb1t+EWm+C1HGSMeZgbWXaCf3K/KyZEOHL+IECUH8cCiOAGaH6hgTHX+GlgO2sg0DKov
X-Google-Smtp-Source: AGHT+IGfEUyepmhbKoeNIKh6ECjsQINyqPMDAOmIs/3EMhZBaobOBZs6iKQC0hwCYrvAZ5JGgc1T
X-Received: by 2002:a05:6214:19ef:b0:6b5:4e8c:1be0 with SMTP id 6a1803df08f44-6b77f3b9f33mr25756996d6.16.1721141600757;
        Tue, 16 Jul 2024 07:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721141600; cv=none;
        d=google.com; s=arc-20160816;
        b=I8t11WHUx61ayGRvLUB6UgL3rXYrEaADZV+4MX7J7HoH9Spp7I8BRT7bz6mwjss4Q/
         91vjTvb8m+XXssgaULtwxQkC9koyUD8RJ3s2bMv3w3pw0Mq88+TXf4W2rVxlEaiTKSdk
         JMGx1qqEKINJw9wI+LAsJrj1zBdIvOT6xvypkzzH0tAeih7+YV8T9cTO0ct2o6u3sv8o
         1K0msJu27emXiC8aIaQOkwJLnKcoKyB0D2IrF8xVXL+9jOTSIvQ+29amz5WWXa5V3yCY
         7LzsBGRIdJdS+xllAQqGh+KSDW6PoOacRdhoKWhHHUa5NAkO7rRFK4kXBLPA1OMfH8Vt
         5fAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=nYk17DpTXgnKJoJV13J9NrBKiIDX5Oo+kvtC/bXXRxA=;
        fh=WxGmD0yiBccbk2SDXKJWT4qUkj7tv5QorSKdGC1LXEU=;
        b=ogUYUbr7wduYa1d9EAUmbseJR3e2MezzNmx7VPA+Eosn784F5PpWR+N/753hlq/dQZ
         9ru3i80k1AOAlopyYxeZbL9yP6tryMmcsfm3aaaCE461AVSFWcbI4MGFoaCwgMURMUBd
         A9LempDQDuZLsimRyehGfIV3Rb60l4L45Ul9n0NeYbBYcRDiSb3YLrZuFBu6voCDGcWi
         R38tMe2X5zlRlx+Dww45k6raGq44A+DW3K+jh2U64KgFnDhjdpQAyf3LLtfZ4N1vUC9s
         zDO5v1VXWgKTN7A35HDCzsE7ydnVLr2HEL3JPK7916vqLxx8gRi8jm9fYmmjGQB7PD/j
         GT9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W02zI2DX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b76194f328si77992326d6.37.2024.07.16.07.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 07:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W02zI2DX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721141600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYk17DpTXgnKJoJV13J9NrBKiIDX5Oo+kvtC/bXXRxA=;
	b=W02zI2DX80USQIel3vaHZRcT+xGfXT0scpXUEMG7JlHRQRWQzvrRrP8UvM6Gfy3GhZbbW9
	/C0Cfh+VfeKrxOlxBDyV812LduWHbnKWoiJsvIz9hB3KAiM8u41/rrOKwhJyU+GKTzQET/
	Y4qj3SDluDpNsWDd424ghMz4n6GxZoU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-CNtJXjOIM-CzJVeW7Vz8Vg-1; Tue, 16 Jul 2024 10:53:19 -0400
X-MC-Unique: CNtJXjOIM-CzJVeW7Vz8Vg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4279418eb2bso37144625e9.1
        for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 07:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721141598; x=1721746398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYk17DpTXgnKJoJV13J9NrBKiIDX5Oo+kvtC/bXXRxA=;
        b=CwYWxw9QYL47LXZFfBkdTHVqqn8wZXbmJmtIyzU2twyQ7z1XqRCyR87FQs0YSuO3q7
         TIS//0SpR+1oE6XkS//1ej89FdXgwV/8LH1/oDhv8MRSKx7MF3IrpVcg9zOd97qY6WiF
         EXkLNEGQAbGsdsU0Ywebtpt2ZqlygkWm3hUFHVuu5VXhl53Drs0he6D89JKFeIA5wTtK
         w61pbOuIknfyi7iAEHI77vFGy+pgAdrrtctECHnCWT+ew/ynXbnJH2RFlz+4TIs0Ti3Q
         6+MhJf7y9EmgGl099TTW3RU5x1Ks3hwp9c38Qgzr0+BilyLqcPFb0ZUQ/YqYBvCyUrx2
         Z8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbqLJRWzej9FmpFxH3kiekGFeml4MzUgCb/j6BwLvH1qNkWc6kyRRwTjglzmXNglekAQKiPBBDKWrYEUzFhoPrMf/4tqNi
X-Gm-Message-State: AOJu0YxGcj9VnUbJrjlplrv5LVSvq4BahzLCobRtyZ1aMw+HAVjk25Lr
	UqkfVJgVMHG7IpZaMZ1ouBQTjzvckfEQXy7nhtEs0bHwwoL8TWWePdS0gXf2CsUAYUWuJ/07rCU
	3n9YDjHRVFxBpWJIcBb4DslzbvqVlhrTMj9lUB3Uog0uhnFJSMaZZ4Q==
X-Received: by 2002:a05:600c:4e4a:b0:426:618f:1a31 with SMTP id 5b1f17b1804b1-427ba71dae7mr17135805e9.34.1721141597746;
        Tue, 16 Jul 2024 07:53:17 -0700 (PDT)
X-Received: by 2002:a05:600c:4e4a:b0:426:618f:1a31 with SMTP id 5b1f17b1804b1-427ba71dae7mr17135605e9.34.1721141597279;
        Tue, 16 Jul 2024 07:53:17 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc306sm167570505e9.30.2024.07.16.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 07:53:16 -0700 (PDT)
Date: Tue, 16 Jul 2024 16:53:15 +0200
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
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V16 3/7] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20240716165315.4862e1a0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240716111502.202344-4-salil.mehta@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
	<20240716111502.202344-4-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 9r1mqlob0PiG

On Tue, 16 Jul 2024 12:14:58 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
> _CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
> notified event by evaluating ACPI _EVT method to know the type of event. Use
> ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.
> 
> Note, GED interface is used by many hotplug events like memory hotplug, NVDIMM
> hotplug and non-hotplug events like system power down event. Each of these can
> be selected using a bit in the 32 bit GED IO interface. A bit has been reserved
> for the CPU hotplug event.
> 
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
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

I haven't tested it but looks fine to me,
it missing migration bits, but as long as there is no actual users
in this release it could be a patch on top later on.

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++
>  hw/acpi/generic_event_device.c         | 47 ++++++++++++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  4 +++
>  4 files changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 0bd3f9399f..3acd6fcd8b 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>         0: Memory hotplug event
>         1: System power down event
>         2: NVDIMM hotplug event
> -    3-31: Reserved
> +       3: CPU hotplug event
> +    4-31: Reserved
>  
>  **write_access:**
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
> index 2d6e91b124..4641933a0f 100644
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
> @@ -234,6 +235,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>          } else {
>              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -248,6 +251,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>                         !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
>          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -261,6 +266,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -272,6 +279,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
>      AcpiGedState *s = ACPI_GED(adev);
>  
>      acpi_memory_ospm_status(&s->memhp_state, list);
> +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>  }
>  
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> @@ -286,6 +294,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_PWR_DOWN_EVT;
>      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
> @@ -371,6 +381,42 @@ static const VMStateDescription vmstate_acpi_ged = {
>      }
>  };
>  
> +static void acpi_ged_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AcpiGedState *s = ACPI_GED(dev);
> +    uint32_t ged_events;
> +    int i;
> +
> +    ged_events = ctpop32(s->ged_event_bitmap);
> +
> +    for (i = 0; i < ARRAY_SIZE(ged_supported_events) && ged_events; i++) {
> +        uint32_t event = s->ged_event_bitmap & ged_supported_events[i];
> +
> +        if (!event) {
> +            continue;
> +        }
> +
> +        switch (event) {
> +        case ACPI_GED_CPU_HOTPLUG_EVT:
> +            /* initialize CPU Hotplug related regions */
> +            memory_region_init(&s->container_cpuhp, OBJECT(dev),
> +                                "cpuhp container",
> +                                ACPI_CPU_HOTPLUG_REG_LEN);
> +            sysbus_init_mmio(sbd, &s->container_cpuhp);
> +            cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                                &s->cpuhp_state, 0);
> +            break;
> +        }
> +        ged_events--;
> +    }
> +
> +    if (ged_events) {
> +        error_report("Unsupported events specified");
> +        abort();
> +    }
> +}
> +
>  static void acpi_ged_initfn(Object *obj)
>  {
>      DeviceState *dev = DEVICE(obj);
> @@ -411,6 +457,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      dc->desc = "ACPI Generic Event Device";
>      device_class_set_props(dc, acpi_ged_properties);
>      dc->vmsd = &vmstate_acpi_ged;
> +    dc->realize = acpi_ged_realize;
>  
>      hc->plug = acpi_ged_device_plug_cb;
>      hc->unplug_request = acpi_ged_unplug_request_cb;
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ba84ce0214..e091ac2108 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -62,6 +62,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/ghes.h"
> +#include "hw/acpi/cpu.h"
>  #include "qom/object.h"
>  
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
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
