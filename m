Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1500612ejc;
        Mon, 13 Nov 2023 09:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl0Zt2AZDRweHyBEmVKpO/lr9vCWnQGIKFdaa1d1ChTlPYmX56ft497+0Sc+lM2mYFSzTq
X-Received: by 2002:a05:6000:549:b0:331:4e4e:cb63 with SMTP id b9-20020a056000054900b003314e4ecb63mr1646776wrf.28.1699896975916;
        Mon, 13 Nov 2023 09:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699896975; cv=none;
        d=google.com; s=arc-20160816;
        b=JiOm80j+UOi1aR1Fced+UAXEMGd3cjLpVjdt6ob/y3oLix0eVTjCgSbALDVv5cXS6m
         OEhgWbR2V0JYiiIlT5m6XyeJEonpG60VuHF6wm328sUKB0j/8pIwaJZ3KHS6LiSEzWSZ
         m7KHzZM3jl6KpIik/ptA0vtYTITmEswyYc+vLOiQ04CXorEVPXwjCCMdEC9TPsqBq/+e
         j2oyI9qJg0xpoouwOy36RdsmiwFCQQbCBOEJ/bk3twy0W7fvOqF7Pedbecvqk+OvEWus
         +Swnsfb8nvPJe6nSsHzSunRF6TnRVUqIJDLCiR3jGG2VYBIsJNBAxJzjhGdaDkV5OTHg
         4Eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=gweUhLMFAA4k0VnRgSWgI2aSL42I2hZ7TTZ4Cy7bqcE=;
        fh=kANT3D++wurOQU1BOFSp5pyqxd/rDLTFW2yMBofHfAU=;
        b=qJXJZwVGq4oboVD1BpwqrlCRDIBhvkLHr4LSFScLqlZE3dm37TovhAx844RNXfQqp6
         tXzMvXzqToqrdi37ghabumvnBEVCmSiIy84W+/+spgVurN9C5D6fgfz/p5pxyFJ0fzDj
         f1hV2p+VYrAcv44CYd7UNzRDT39edI7lf7kUw34dihI+azPhIOWDxG2GJmYYWvMoLHlk
         oU9y8Lzb+P8UYHuN+fVAc5nTw3so6OHiChqGe6nH9KJrOvCxukkxeqybb8wpuwCck+T2
         kRr1Ic7BkxT76MnIMh54otUXSGWb8BahQOPcb44x6GOhIkf6SNItcn4WLoYY0WVPee8J
         Lq7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id w12-20020a5d544c000000b0032d892de387si3324880wrv.359.2023.11.13.09.36.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500006.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STc180M7Jz6JB5r;
	Tue, 14 Nov 2023 01:31:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 17:36:13 +0000
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 13 Nov 2023 17:36:13 +0000
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com"
	<gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH V6 4/9] hw/acpi: Init GED framework with CPU hotplug
 events
Thread-Topic: [PATCH V6 4/9] hw/acpi: Init GED framework with CPU hotplug
 events
Thread-Index: AQHZ/cN5nupvt1X/j0S+fZufTSL4urBdscIAgBsAV8A=
Date: Mon, 13 Nov 2023 17:36:13 +0000
Message-ID: <3e559419e87746f0b25850c835c48d2f@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-5-salil.mehta@huawei.com>
 <20231027160814.3f47ff70@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231027160814.3f47ff70@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.147.128]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: Cu/o1T+UXz2g

Hi Igor,
Sorry, I realized I missed to reply this review comment.

> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Friday, October 27, 2023 3:08 PM
> To: Salil Mehta <salil.mehta@huawei.com>
>=20
> On Fri, 13 Oct 2023 11:51:24 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACP=
I events
> > when OSPM/guest receives an interrupt listed in the _CRS object of GED.=
 OSPM
> > then maps or demultiplexes the event by evaluating _EVT method.
> >
> > This change adds the support of CPU hotplug event initialization in the
> > existing GED framework.
> >
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Xianglai Li <lixianglai@loongson.cn>
> > ---
> >  hw/acpi/generic_event_device.c         | 8 ++++++++
> >  include/hw/acpi/generic_event_device.h | 5 +++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_dev=
ice.c
> > index a3d31631fe..d2fa1d0e4a 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -25,6 +25,7 @@ static const uint32_t ged_supported_events[] =3D {
> >      ACPI_GED_MEM_HOTPLUG_EVT,
> >      ACPI_GED_PWR_DOWN_EVT,
> >      ACPI_GED_NVDIMM_HOTPLUG_EVT,
> > +    ACPI_GED_CPU_HOTPLUG_EVT,
> >  };
> >
> >  /*
> > @@ -400,6 +401,13 @@ static void acpi_ged_initfn(Object *obj)
> >      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
> >                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
> >      sysbus_init_mmio(sbd, &ged_st->regs);
> > +
> > +    s->cpuhp.device =3D OBJECT(s);
> ain't OBJECT(s) =3D=3D OBJECT(dev)m


Thanks for pointing. And going deeper to looks this is *stray* and
surprisingly has been lurking since I first floated the RFC V1
in Jun 2020. Sorry I missed it in earlier context although David
did point to this.

Salil.


> > +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp
> container",
> > +                       ACPI_CPU_HOTPLUG_REG_LEN);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> > +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> > +                        &s->cpuhp_state, 0);
>=20
> we really should refactor GED to initfn/realizefn pattern.
> then at create_acpi_ged() one would enable cpu_hotplug event
> and later realizefs would call cpu_hotplug_hw_init() if event is enabled.


Maybe. Why not instance_init() ?


> >  }
> >
> >  static void acpi_ged_class_init(ObjectClass *class, void *data)
> > diff --git a/include/hw/acpi/generic_event_device.h
> b/include/hw/acpi/generic_event_device.h
> > index ba84ce0214..a803ea818e 100644
> > --- a/include/hw/acpi/generic_event_device.h
> > +++ b/include/hw/acpi/generic_event_device.h
> > @@ -60,6 +60,7 @@
> >  #define HW_ACPI_GENERIC_EVENT_DEVICE_H
> >
> >  #include "hw/sysbus.h"
> > +#include "hw/acpi/cpu_hotplug.h"
> >  #include "hw/acpi/memory_hotplug.h"
> >  #include "hw/acpi/ghes.h"
> >  #include "qom/object.h"
> > @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
> >  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
> >  #define ACPI_GED_PWR_DOWN_EVT      0x2
> >  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> > +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
> >
> >  typedef struct GEDState {
> >      MemoryRegion evt;
> > @@ -106,6 +108,9 @@ struct AcpiGedState {
> >      SysBusDevice parent_obj;
> >      MemHotplugState memhp_state;
> >      MemoryRegion container_memhp;
> > +    CPUHotplugState cpuhp_state;
> > +    MemoryRegion container_cpuhp;
> > +    AcpiCpuHotplug cpuhp;
>=20
> how about merging CPUHotplugState and AcpiCpuHotplug
> and isolating AcpiCpuHotplug::sts to x86 legacy hotplug code only?
>=20
> then you won't have to pull in 2 states (one of which includes
> GPE specific array that's not applicable to GED)

To be frank, I do not remember the context what I was trying to do
4 years back. But above looks stray and will remove it.


Thanks
Salil.
