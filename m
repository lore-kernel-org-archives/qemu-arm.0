Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp237504njk;
        Tue, 16 Jul 2024 08:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQTeM5V2v41yDlT63npicb665xHhEj5sQiHueJdM7/YvUv4RechoRIyU2UR6xaNlJSeCLYd19jeXC4gKZw8YStk8DEoFxO
X-Google-Smtp-Source: AGHT+IHqSo5KNzN4QXFi5iVgaKKJAGHKAPWQPl5VFeHLGwTxAaZQNjvymWwTDeIdJuQco5ZuvrZ8
X-Received: by 2002:a05:6870:b528:b0:254:c777:6327 with SMTP id 586e51a60fabf-260ba6ef6afmr2456335fac.36.1721142355638;
        Tue, 16 Jul 2024 08:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721142355; cv=none;
        d=google.com; s=arc-20160816;
        b=GBY0KOAD4aBBG2jWYTKUXxJ8VG/jHuacna+mvUD5BmRhbXN6oGpJqioor0fk3VP4C2
         SfIpK311hX12MIA6GsSUKi3OnsNhV6y3lliGJInAWMKZvM/LeLx38ka2bsf74xx2Ln8v
         TIEagug0CeW6yB1Fy0gXgWEcO9766+Q9otxkPIHyojc5Gc+63IIpFbojdJE7EoLzkhvE
         PUg2eYKPKhjZOeaDs9chP035GLjJcYFcjK8/prlpEc19RS0SqOHda2kLM4kP/O0cHAd0
         oqIXB06xWRLnwhSxjnY0FyWfzY7Ye1QMP3DWd7pqFoijInPdG6rG4kAoCZzeyAqylOdh
         jmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=NcFW5W4XaOWaScqJ0p6AcTbBoBT0qGw81QtfpnzYUxk=;
        fh=DtExAIOPRLt+BKYSUlzGTbHJwEPb3rSjaXOd9OZV96Y=;
        b=H5ZC8GNghiPTB5IUWhmh473tu5qKb4ksXMuGml04mY/sug4zc8VpogaWoepVUw9ilk
         FkbbREQnN1i7Tug143Je2yQ2mIlZMbboeJKPZkIHgFKJGrz6B4K9b882ksLmFt3LRL2t
         IoV+vVe4dTFdnaXDJ7oT46yc7M2V5jLRASxxxxfJPoIFrFAPnq/+4jGBDuQA7E+JKRtl
         ACHxwpxuOHOr59Q9he53XogyGWHwEYB2zZFYcayQGS9DkMtZLYCnT3d69TxSliDuC3Yo
         WPzRDEL86XoLComYGL32y/h16mEq3KsL1wOVcv85HjHhlCozOCh1ZYOUyBKVbvGW8xkb
         tRMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 586e51a60fabf-260750df835si2974128fac.58.2024.07.16.08.05.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 08:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WNj5x2wjqz67Ct7;
	Tue, 16 Jul 2024 23:04:37 +0800 (CST)
Received: from lhrpeml500002.china.huawei.com (unknown [7.191.160.78])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C143140CB9;
	Tue, 16 Jul 2024 23:05:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 16:05:44 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Tue, 16 Jul 2024 16:05:44 +0100
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
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
	Linuxarm <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
	<zhao1.liu@intel.com>
Subject: RE: [PATCH V16 3/7] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Topic: [PATCH V16 3/7] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHa13GbaBCSg7yfCECaTcsqvJ7Q7LH5YB+AgAAT/3A=
Date: Tue, 16 Jul 2024 15:05:44 +0000
Message-ID: <d2ea492ce0e5476eae53e07bb4d7bbdc@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
	<20240716111502.202344-4-salil.mehta@huawei.com>
 <20240716165315.4862e1a0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240716165315.4862e1a0@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.170.92]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: hPrNgqFDXbml

>  From: Igor Mammedov <imammedo@redhat.com>
>  Sent: Tuesday, July 16, 2024 3:53 PM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  On Tue, 16 Jul 2024 12:14:58 +0100
>  Salil Mehta <salil.mehta@huawei.com> wrote:
> =20
>  > ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed
>  > in the _CRS object of GED to intimate OSPM about an event. Later then
>  > demultiplexes the notified event by evaluating ACPI _EVT method to
>  > know the type of event. Use ACPI GED to also notify the guest kernel
>  about any CPU hot(un)plug events.
>  >
>  > Note, GED interface is used by many hotplug events like memory
>  > hotplug, NVDIMM hotplug and non-hotplug events like system power
>  down
>  > event. Each of these can be selected using a bit in the 32 bit GED IO
>  > interface. A bit has been reserved for the CPU hotplug event.
>  >
>  > ACPI CPU hotplug related initialization should only happen if
>  > ACPI_CPU_HOTPLUG support has been enabled for particular
>  architecture.
>  > Add cpu_hotplug_hw_init() stub to avoid compilation break.
>  >
>  > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>  > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>  > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>  > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>  > Reviewed-by: Gavin Shan <gshan@redhat.com>
>  > Reviewed-by: David Hildenbrand <david@redhat.com>
>  > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>  > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>  > Tested-by: Xianglai Li <lixianglai@loongson.cn>
>  > Tested-by: Miguel Luis <miguel.luis@oracle.com>
>  > Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>  > Tested-by: Zhao Liu <zhao1.liu@intel.com>
>  > Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> =20
>  I haven't tested it but looks fine to me, it missing migration bits, but=
 as long
>  as there is no actual users in this release it could be a patch on top l=
ater on.
> =20
>  Acked-by: Igor Mammedov <imammedo@redhat.com>

Many thanks!

Best regards
Salil.

>  >  docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
>  >  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++
>  >  hw/acpi/generic_event_device.c         | 47
>  ++++++++++++++++++++++++++
>  >  include/hw/acpi/generic_event_device.h |  4 +++
>  >  4 files changed, 59 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst
>  > b/docs/specs/acpi_hw_reduced_hotplug.rst
>  > index 0bd3f9399f..3acd6fcd8b 100644
>  > --- a/docs/specs/acpi_hw_reduced_hotplug.rst
>  > +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
>  > @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>  >         0: Memory hotplug event
>  >         1: System power down event
>  >         2: NVDIMM hotplug event
>  > -    3-31: Reserved
>  > +       3: CPU hotplug event
>  > +    4-31: Reserved
>  >
>  >  **write_access:**
>  >
>  > diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c
>  > b/hw/acpi/acpi-cpu-hotplug-stub.c index 3fc4b14c26..c6c61bb9cd 100644
>  > --- a/hw/acpi/acpi-cpu-hotplug-stub.c
>  > +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
>  > @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion
>  *parent, Object *owner,
>  >      return;
>  >  }
>  >
>  > +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>  > +                         CPUHotplugState *state, hwaddr base_addr) {
>  > +    return;
>  > +}
>  > +
>  >  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList
>  > ***list)  {
>  >      return;
>  > diff --git a/hw/acpi/generic_event_device.c
>  > b/hw/acpi/generic_event_device.c index 2d6e91b124..4641933a0f 100644
>  > --- a/hw/acpi/generic_event_device.c
>  > +++ b/hw/acpi/generic_event_device.c
>  > @@ -25,6 +25,7 @@ static const uint32_t ged_supported_events[] =3D {
>  >      ACPI_GED_MEM_HOTPLUG_EVT,
>  >      ACPI_GED_PWR_DOWN_EVT,
>  >      ACPI_GED_NVDIMM_HOTPLUG_EVT,
>  > +    ACPI_GED_CPU_HOTPLUG_EVT,
>  >  };
>  >
>  >  /*
>  > @@ -234,6 +235,8 @@ static void
>  acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>  >          } else {
>  >              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev,
>  errp);
>  >          }
>  > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>  > +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>  >      } else {
>  >          error_setg(errp, "virt: device plug request for unsupported d=
evice"
>  >                     " type: %s", object_get_typename(OBJECT(dev)));
>  > @@ -248,6 +251,8 @@ static void
>  acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>  >      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>  >                         !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM=
)))) {
>  >          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state,
>  > dev, errp);
>  > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>  > +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev,
>  > + errp);
>  >      } else {
>  >          error_setg(errp, "acpi: device unplug request for unsupported
>  device"
>  >                     " type: %s", object_get_typename(OBJECT(dev)));
>  > @@ -261,6 +266,8 @@ static void acpi_ged_unplug_cb(HotplugHandler
>  > *hotplug_dev,
>  >
>  >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>  >          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
>  > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>  > +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>  >      } else {
>  >          error_setg(errp, "acpi: device unplug for unsupported device"
>  >                     " type: %s", object_get_typename(OBJECT(dev)));
>  > @@ -272,6 +279,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf
>  *adev, ACPIOSTInfoList ***list)
>  >      AcpiGedState *s =3D ACPI_GED(adev);
>  >
>  >      acpi_memory_ospm_status(&s->memhp_state, list);
>  > +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>  >  }
>  >
>  >  static void acpi_ged_send_event(AcpiDeviceIf *adev,
>  > AcpiEventStatusBits ev) @@ -286,6 +294,8 @@ static void
>  acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  >          sel =3D ACPI_GED_PWR_DOWN_EVT;
>  >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>  >          sel =3D ACPI_GED_NVDIMM_HOTPLUG_EVT;
>  > +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
>  > +        sel =3D ACPI_GED_CPU_HOTPLUG_EVT;
>  >      } else {
>  >          /* Unknown event. Return without generating interrupt. */
>  >          warn_report("GED: Unsupported event %d. No irq injected",
>  > ev); @@ -371,6 +381,42 @@ static const VMStateDescription
>  vmstate_acpi_ged =3D {
>  >      }
>  >  };
>  >
>  > +static void acpi_ged_realize(DeviceState *dev, Error **errp) {
>  > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>  > +    AcpiGedState *s =3D ACPI_GED(dev);
>  > +    uint32_t ged_events;
>  > +    int i;
>  > +
>  > +    ged_events =3D ctpop32(s->ged_event_bitmap);
>  > +
>  > +    for (i =3D 0; i < ARRAY_SIZE(ged_supported_events) && ged_events;=
 i++)
>  {
>  > +        uint32_t event =3D s->ged_event_bitmap &
>  > + ged_supported_events[i];
>  > +
>  > +        if (!event) {
>  > +            continue;
>  > +        }
>  > +
>  > +        switch (event) {
>  > +        case ACPI_GED_CPU_HOTPLUG_EVT:
>  > +            /* initialize CPU Hotplug related regions */
>  > +            memory_region_init(&s->container_cpuhp, OBJECT(dev),
>  > +                                "cpuhp container",
>  > +                                ACPI_CPU_HOTPLUG_REG_LEN);
>  > +            sysbus_init_mmio(sbd, &s->container_cpuhp);
>  > +            cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>  > +                                &s->cpuhp_state, 0);
>  > +            break;
>  > +        }
>  > +        ged_events--;
>  > +    }
>  > +
>  > +    if (ged_events) {
>  > +        error_report("Unsupported events specified");
>  > +        abort();
>  > +    }
>  > +}
>  > +
>  >  static void acpi_ged_initfn(Object *obj)  {
>  >      DeviceState *dev =3D DEVICE(obj);
>  > @@ -411,6 +457,7 @@ static void acpi_ged_class_init(ObjectClass *class=
,
>  void *data)
>  >      dc->desc =3D "ACPI Generic Event Device";
>  >      device_class_set_props(dc, acpi_ged_properties);
>  >      dc->vmsd =3D &vmstate_acpi_ged;
>  > +    dc->realize =3D acpi_ged_realize;
>  >
>  >      hc->plug =3D acpi_ged_device_plug_cb;
>  >      hc->unplug_request =3D acpi_ged_unplug_request_cb; diff --git
>  > a/include/hw/acpi/generic_event_device.h
>  > b/include/hw/acpi/generic_event_device.h
>  > index ba84ce0214..e091ac2108 100644
>  > --- a/include/hw/acpi/generic_event_device.h
>  > +++ b/include/hw/acpi/generic_event_device.h
>  > @@ -62,6 +62,7 @@
>  >  #include "hw/sysbus.h"
>  >  #include "hw/acpi/memory_hotplug.h"
>  >  #include "hw/acpi/ghes.h"
>  > +#include "hw/acpi/cpu.h"
>  >  #include "qom/object.h"
>  >
>  >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  > @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState,
>  ACPI_GED)
>  >  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>  >  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  >  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>  > +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>  >
>  >  typedef struct GEDState {
>  >      MemoryRegion evt;
>  > @@ -106,6 +108,8 @@ struct AcpiGedState {
>  >      SysBusDevice parent_obj;
>  >      MemHotplugState memhp_state;
>  >      MemoryRegion container_memhp;
>  > +    CPUHotplugState cpuhp_state;
>  > +    MemoryRegion container_cpuhp;
>  >      GEDState ged_state;
>  >      uint32_t ged_event_bitmap;
>  >      qemu_irq irq;
> =20
