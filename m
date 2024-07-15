Received: by 2002:a17:505:59aa:b0:1bdf:97ae:c215 with SMTP id ai10csp2097447njc;
        Mon, 15 Jul 2024 06:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwCugT0fmNCJ+q1lUfQsM3cYDpzyrT1PQG0w9f98zyigD8o/QTy/K6BrQh4FPAOheVDpWtPfd+LoJu7w6dmKw+TxKQJFBv
X-Google-Smtp-Source: AGHT+IGNBW7RCSdeWGOJEm8N2cCQr2OnDxuYSHK6Kl70lYr3CAeIqEqKTlDPxeRcDkjdDk8EjJaa
X-Received: by 2002:a05:622a:1b92:b0:447:ea03:4542 with SMTP id d75a77b69052e-447faa4041fmr232911971cf.48.1721049156981;
        Mon, 15 Jul 2024 06:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721049156; cv=none;
        d=google.com; s=arc-20160816;
        b=MoxmTm1XepLfY66aJuzaxjZfGxYI98Hsql31Zwj+if++iffA0KeXIh6UqD71x8/yec
         ephwhFg0d+YS+BUMzwMW/oQ5KvgRZsTtSztdVgQVVI1ulJ2Bq8TgEpgTl7mf86AMP3Cv
         LiHgxsdkF9S37aOlsLTcAesDSEo6ch0Jup4RmUx3MIH3FlUxjW1DYyxSyC+qGZVGzS3N
         84F5uzhSiSSG17uoRGIDU9hYJPy8MCuKbvg5Yi6M8itnRakDeFzAujjkseWaTVux3gW6
         ydBJF/v+OuDio91RGBIwmIsOAEzf7abh7q4ROcSkCSCYAlvMeMPKhw+uWnxPnAVL0q3G
         JlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=1xt3uGPIDJBWbyBlAMkf9wmgaGHAIPk6TxUEUYB+a70=;
        fh=AX7MECuY4lIegTdXNd2MI6Aw1DWk1Ef5IgLJxUaY0NI=;
        b=EuNtZ8HiaE2VXZ4XyAtCgkZr+dbT8dU9gEqGwR4GjS6lDvBNEzCoWgaBCH5/xtX463
         H5EoQ2CbeJzhHEM3LviEU7yeLiVD/PYeas2TnB4xR6TR9nph5aq6c7DyIehLEVJCSZ9B
         oTzLY7LQjYYOQdYGxjH+kWaGdpH7dqCdkw0frbv0QFG5qAEwcnpRfy/euh5Sv4EwMcOE
         DdQfxAwR0IWL575aij2nHuLkrZ8cyEoC60v43nffCHeJRVabysEkpjw0Yig4rdl1BkY7
         ZJxA9aFzHlMpaQZnM8qmEIxecamnK2EeENOQge+RZEd3YfkoxIt8KLvXBQ4t2D549hKe
         kWbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XW4vYCbs;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b81a98csi51133851cf.623.2024.07.15.06.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XW4vYCbs;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721049156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xt3uGPIDJBWbyBlAMkf9wmgaGHAIPk6TxUEUYB+a70=;
	b=XW4vYCbsuxXzOVO8fDQsQzghtUY6n1npEd7UMzx9bkagX0yQuzuX6Uc9rEU/jq6kYBwuHS
	JDLZjpB2mSebPYsNK3GH4IisDeor5KmWewHFwMTwUssV4oT0UU/waQZxuSTSxWMI1FBx09
	8Pp0ZyK1u40U9U5OFBlEeaHjqdEYtyw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-enbrU1cwNwmQ6MjNhLc6_g-1; Mon, 15 Jul 2024 09:12:35 -0400
X-MC-Unique: enbrU1cwNwmQ6MjNhLc6_g-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52e98c1a9d2so4631709e87.3
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 06:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721049153; x=1721653953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xt3uGPIDJBWbyBlAMkf9wmgaGHAIPk6TxUEUYB+a70=;
        b=qjEn9rOo6iSZvswouXM+KEL19YbBPvkRNwXiEGDBP2ROwLcYuYE4thzXrPIgDUeULM
         mJQhLIwaww+gLv4iVwaBElBX6LwFp7LgfGloYCnyr4SOYVDA4qrqPmAOctmbh7DH1ngx
         ynaZBsTb4XONy5+3j5gHfKhokrPv3CN5oLEjXZW21KD4FxqEOqMtg57cPhat+q82KERX
         jNMa4oychc4ayU8MmD6gj4F2BfD2DfnaU5jd062OkA3BuSKv4r16ec6Qouq+uf9whP6/
         ba13kCSP9YgwAl2kf7P62jSjeTcxei5+FNPQsdovP6JWKHfO2c5fTXTrC/QLKx+3BfgM
         22PA==
X-Forwarded-Encrypted: i=1; AJvYcCXi1lCFfSIUrXJ89RL2Gj8ZJDzy+1KiyZVoiXCTcgtMsc5Lup6j5pIi/daLLx7DMsdvvJao1dgIKbpMFwKicz8KuvZbFdvn
X-Gm-Message-State: AOJu0Yxp4pNHvuRsA0xvdzJcTr08GL/uBDFb5KLvJgbOETSwQdEqmwYc
	YIeBrFAjXekKiDh2mpmvKv9QTxkLsXjzCGmScGMPDvrWNz1gYyb8zaQLTlZZn8t7+jRNT0X9YS1
	zri0kAGSDygObcknXK8DxPLH+E7tDkTKYlAQv9CG/pvFbORraiUqD5Q==
X-Received: by 2002:ac2:5f74:0:b0:52b:bd90:29c8 with SMTP id 2adb3069b0e04-52eb99d59camr9469799e87.60.1721049153649;
        Mon, 15 Jul 2024 06:12:33 -0700 (PDT)
X-Received: by 2002:ac2:5f74:0:b0:52b:bd90:29c8 with SMTP id 2adb3069b0e04-52eb99d59camr9469707e87.60.1721049151203;
        Mon, 15 Jul 2024 06:12:31 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf445sm6443636f8f.46.2024.07.15.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:12:30 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:12:29 +0200
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
Subject: Re: [PATCH V15 3/7] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20240715151229.7f934357@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240713182516.1457-4-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240713182516.1457-4-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: +KDy2Lo5erkc

On Sat, 13 Jul 2024 19:25:12 +0100
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

> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.

so any target (and machines in it) that has ACPI_CPU_HOTPLUG enabled will use have all CPU hotplug
machinery builtin which is fine.

However any machine that uses GED but do not opt-in into CPU hotplug,
will still have CPU hotplug registers/memory regions enabled/mapped. 

It's not much concern for upstream as migration from new to older QEMU
is not supported, however it will break migration downstream (arm/virt) as
new QEMU will try to migrate memory regions/state that do not exists
in older QEMU. Se below for suggestion.

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
> ---
>  docs/specs/acpi_hw_reduced_hotplug.rst |  3 ++-
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++++
>  hw/acpi/generic_event_device.c         | 24 ++++++++++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  4 ++++
>  4 files changed, 36 insertions(+), 1 deletion(-)
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
> index 2d6e91b124..1b31d633ba 100644
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
> @@ -371,6 +381,19 @@ static const VMStateDescription vmstate_acpi_ged = {
>      }
>  };
>  
> +static void acpi_ged_realize(DeviceState *dev, Error **errp)
> +{
> +    AcpiGedState *s = ACPI_GED(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +

> +    /* initialize CPU Hotplug related regions */
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(sbd, &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);

how about making it conditional on supported events
see hw/arm/virt.c: create_acpi_ged()
    if (ms->ram_slots) {                                                         
        event |= ACPI_GED_MEM_HOTPLUG_EVT;                                       
    }                                                                            
                                                                                 
    if (ms->nvdimms_state->is_enabled) {                                         
        event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;                                    
    } 

so cpu hotplug would have similar section
and ged realize could use ged-event to enable/disable
cpuhp feature registers and hwinit.

> +}
> +
>  static void acpi_ged_initfn(Object *obj)
>  {
>      DeviceState *dev = DEVICE(obj);
> @@ -411,6 +434,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
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
