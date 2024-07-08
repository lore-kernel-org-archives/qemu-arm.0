Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2697863njb;
        Mon, 8 Jul 2024 06:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUauIodFb8TCIkXYxPMfgITb+0tPZuVy7hfZTlfuXJwi2ijclS/0xlsRVZ0/Kf7nB4gEg2Zkwcg5e/Lvv7dT2pflMYWk4qy
X-Google-Smtp-Source: AGHT+IHToO2I2dOx5FUkoO8rB7w17jEiEzpMMUNnidBpwjgwiuiGxLBSIl5hxQ1FrzwCrmyjrEsL
X-Received: by 2002:ad4:5ba4:0:b0:6b5:e099:4d69 with SMTP id 6a1803df08f44-6b5ecfb9422mr144272136d6.26.1720446053667;
        Mon, 08 Jul 2024 06:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720446053; cv=none;
        d=google.com; s=arc-20160816;
        b=0vJRcTqip074SwTVBP8u7R0z/8WM4/OcP52EkId/IoPLFqaAB3uSBUzGP6soFeBXPt
         Hkk2kAaWNDHAAV/926taP9xzJu3Zx3GBOWq6YINv/kdrLTmxfjesT8YIqqWvFU7yoSLA
         jU1vyO6g9qxIyV1KUJ6fzpthTgtZglsghsoghNdTXE93NBNArYSlpSAoUbVnJRaj1h6w
         jTIBo/9Y8SONWr4vcvGrmP1zUjswxin4ua7i3fUAcLQlESxx8paHJkF9szVaRiBwrKpX
         wBJnK4IWtz/20yAZxkkqtTc0TGRtqCdDKLJCEI0CED8qJbT/wHHQuGWGX01lRKEeDxqN
         HUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=KMVqANTOrD9ic9nuONWapNY2Nr3eoZGcxSXBq4fKi9Q=;
        fh=MK/Nsjf/bZyvUNygHbxX2UpXflHklKRz+6eBi2G0Rpc=;
        b=bh+BPEQYP7+tzYjUvpSClkwzegUpVFEwA0Iy4HoFhphflChV4Hsml/NVGGzGlYr07y
         XrjpeJThmPOMAwNhuRI7g9lhKfXVzreI9Z4gf2OiMHm8CCjv37sJqgXCvgKs1XNvBHS0
         wqY7hA/jxKg4MiukUS63/OUWPW2ALt/zxdbR/WhcQgDVk+4G5yoSkMp/HHJDBpF3imyc
         uQZqXuvzJpGKDTzcVr/3qws/2MIUDbqobRm2p78y+76w/nOhNJhkuSvScMbb9JekI3RM
         mB+G3MfXQkb4ceGG0gWPk7sMbbWPiJjCjfCFHvwWpe8xl4AA45fuIiD0mW1xWAOcTHuE
         doFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ArecbEP4;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5e8959e80si105505316d6.107.2024.07.08.06.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ArecbEP4;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720446053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMVqANTOrD9ic9nuONWapNY2Nr3eoZGcxSXBq4fKi9Q=;
	b=ArecbEP42/HsnnENpL6Se4garjeXNfeInzVRjkfurSdmw6WT34Ns73xkfx5WIbvjIoXABp
	O3qXAcZoV3OEUykCzYB0APLjwUZAthggF/4XgUc/WWX4D4VAtOaAXF3w2w18di4T8YhD0K
	2D9eVEB8u3IS37XPu+z4ys+/HSZ+DrM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-PIfGqTm0MuqyIieOkhc5GA-1; Mon, 08 Jul 2024 09:40:52 -0400
X-MC-Unique: PIfGqTm0MuqyIieOkhc5GA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4265e9de046so14163095e9.2
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 06:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720446051; x=1721050851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMVqANTOrD9ic9nuONWapNY2Nr3eoZGcxSXBq4fKi9Q=;
        b=l6chZFTvzhZ1L8UTizdIfEnYebXoBUOuFTKeetGlo1zhnpV8Sp2sCOEiC26dPfrSAq
         1TSyoz+eLHO+qOh2jYQJH6oG8vLNTolabeIk8IVkcLJ7W3Pm413TGFxBqhLbA1PqPYkj
         nZj7o/6LP/oKuVWMsmkJ/EcsTQacP6/j1o8uZ8AqqwzrPnmQWtEmTblhKjdQTX8pLwyT
         9CimBILltZcED4d/2t3qlht1563ylXg22vWTG2V69ojG+CnB66tsaKmP9B0S3Od61DJ7
         378aLsQ+pd8wKIHY1y+e8DI2gU1NVvBnYOGAIt9AE50JYqz7se55nTuo798pFzT9fx4Q
         Lxww==
X-Forwarded-Encrypted: i=1; AJvYcCUodmyjjCjy4v2KGiQERNVLtriBs/MnPxOaNOZRqst6UKLx4W2lEneJfeUXwAFnMcbpKoX7Whq/95jkUFOdcLLe33MZVMRI
X-Gm-Message-State: AOJu0YwpWZlcxsgUbXHmXZx3ADNxHAI14DMTPQ4MiJRQi0w5T5UbxuHC
	lSDKKD+GW/6pnF+/AO/m8QzmqNtic3uYqC27RFLZFPuWWoBk0wTJrT9vbFXaKglhQkdfSyD0gJD
	D1TiVmR639kPCzHXI8m97/Np+6RaHSZazyQ2/+B34rL3P/2n6m+0JrQ==
X-Received: by 2002:a05:600c:2e54:b0:426:627d:5542 with SMTP id 5b1f17b1804b1-426627d5616mr34654095e9.28.1720446050773;
        Mon, 08 Jul 2024 06:40:50 -0700 (PDT)
X-Received: by 2002:a05:600c:2e54:b0:426:627d:5542 with SMTP id 5b1f17b1804b1-426627d5616mr34653735e9.28.1720446050324;
        Mon, 08 Jul 2024 06:40:50 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1668sm167550995e9.1.2024.07.08.06.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:40:49 -0700 (PDT)
Date: Mon, 8 Jul 2024 15:40:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20240708154048.254e1036@imammedo.users.ipa.redhat.com>
In-Reply-To: <c74b6d5e-1939-48df-ae21-9cdd4158a683@opnsrc.net>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-4-salil.mehta@huawei.com>
	<20240706154640.0a45c5d6@imammedo.users.ipa.redhat.com>
	<c74b6d5e-1939-48df-ae21-9cdd4158a683@opnsrc.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: baOlssR+NxCg

On Mon, 8 Jul 2024 05:12:48 +0000
Salil Mehta <salil.mehta@opnsrc.net> wrote:

> On 06/07/2024 13:46, Igor Mammedov wrote:
> > On Fri, 7 Jun 2024 12:56:44 +0100
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> >  
> >> ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
> >> _CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
> >> notified event by evaluating ACPI _EVT method to know the type of event. Use
> >> ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.
> >>
> >> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> >> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> >> stub to avoid compilation break.
> >>
> >> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> >> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >> Reviewed-by: David Hildenbrand <david@redhat.com>
> >> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> >> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> >> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> >> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> >> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> >> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> >> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> >> ---
> >>   hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++++
> >>   hw/acpi/cpu.c                          |  6 +++++-
> >>   hw/acpi/generic_event_device.c         | 17 +++++++++++++++++
> >>   include/hw/acpi/generic_event_device.h |  4 ++++
> >>   4 files changed, 32 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> >> index 3fc4b14c26..c6c61bb9cd 100644
> >> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> >> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> >> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> >>       return;
> >>   }
> >>   
> >> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> >> +                         CPUHotplugState *state, hwaddr base_addr)
> >> +{
> >> +    return;
> >> +}
> >> +
> >>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
> >>   {
> >>       return;
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index 69aaa563db..473b37ba88 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -221,7 +221,11 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> >>       const CPUArchIdList *id_list;
> >>       int i;
> >>   
> >> -    assert(mc->possible_cpu_arch_ids);
> >> +    /* hotplug might not be available for all types like x86/microvm etc. */
> >> +    if (!mc->possible_cpu_arch_ids) {
> >> +        return;
> >> +    }  
> > if hotplug is not supported, this function shouldn't be called at all.  
> 
> True. But none the less this gets called for Intel/microvm and causes 
> qtest to fail.
> 
> I think, we've had this discussion before last year as well. Please 
> check below:
> 
> https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-820f4a254607@opnsrc.net/

And I see that I had the same objection, 
'
cpu_hotplug_hw_init() should not be called at initfn time,
but rather at realize time.
'


> >
> > [...]  
> >> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
> >>       memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
> >>                             TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
> >>       sysbus_init_mmio(sbd, &ged_st->regs);
> >> +
> >> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> >> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> >> +    sysbus_init_mmio(sbd, &s->container_cpuhp);
> >> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> >> +                        &s->cpuhp_state, 0);  

> > suggest to move this call to realize time, and gate it on
> > ACPI_GED_CPU_HOTPLUG_EVT being set.
> > Platform that supports cpu hotplug must optin, setting ACPI_GED_CPU_HOTPLUG_EVT,
> > while for the rest it will be ignored.

which I've just suggested again ^^^.

> >
> > for example: create_acpi_ged() : event |= ACPI_GED_NVDIMM_HOTPLUG_EVT; 
 
> 
> Similar case applies to the Memory hotplug as well and any cleaning here
> 
> will mean going beyond the realms of this patch-set. But I can definitely
> 
> take this activity in a separate patch-set if you wish?

For memory hotplug cleanup it's fine to be separate series,
but for cpu hotplug parts you are touching I'd very much prefer
done it right from the start.

That might also help to reduce code churn within this series.

> 
> Thanks
> 
> >  
> >>   }
> >>   
> >>   static void acpi_ged_class_init(ObjectClass *class, void *data)
> >> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> >> index ba84ce0214..90fc41cbb8 100644
> >> --- a/include/hw/acpi/generic_event_device.h
> >> +++ b/include/hw/acpi/generic_event_device.h
> >> @@ -60,6 +60,7 @@
> >>   #define HW_ACPI_GENERIC_EVENT_DEVICE_H
> >>   
> >>   #include "hw/sysbus.h"
> >> +#include "hw/acpi/cpu_hotplug.h"
> >>   #include "hw/acpi/memory_hotplug.h"
> >>   #include "hw/acpi/ghes.h"
> >>   #include "qom/object.h"
> >> @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
> >>   #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
> >>   #define ACPI_GED_PWR_DOWN_EVT      0x2
> >>   #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> >> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
> >>   
> >>   typedef struct GEDState {
> >>       MemoryRegion evt;
> >> @@ -106,6 +108,8 @@ struct AcpiGedState {
> >>       SysBusDevice parent_obj;
> >>       MemHotplugState memhp_state;
> >>       MemoryRegion container_memhp;
> >> +    CPUHotplugState cpuhp_state;
> >> +    MemoryRegion container_cpuhp;
> >>       GEDState ged_state;
> >>       uint32_t ged_event_bitmap;
> >>       qemu_irq irq;  
> 
