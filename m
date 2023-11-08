Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp909979ejv;
        Wed, 8 Nov 2023 02:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR9FAvYfmOjabqMrjHxtasKC4ga0Z1L/lZAkTk/wmwzRZ3H+v5jKW4HCnrFzIsXXAQfw2U
X-Received: by 2002:adf:a447:0:b0:32d:bc7d:c431 with SMTP id e7-20020adfa447000000b0032dbc7dc431mr1138976wra.1.1699441112943;
        Wed, 08 Nov 2023 02:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699441112; cv=none;
        d=google.com; s=arc-20160816;
        b=x7IowsIoTGaBkIPrdu/jps4boa3be/Ka6WmB2q57mxa3aOd8AR2Ohki9/UoI0TIJKN
         x71puJ/s4JyXlqrRsCT72G/DJmShiQm9vAXq3fbcPWzYjdM451IBJa9HfzIw42iKqgXl
         FJtilWHCalDGU9F++e5v+8BCHE5CWnq7KK1hMroXnAHZUm2TpXznQhx3is5kDThYSsZv
         hYHZlEfyElmP+7CNWSSI1Hk8ybcDzhV/Okx+Nh1IX8FXU5ZNEprZq4053+xw9Iml5ENG
         ZqxQMv6I/zmV3z4NHAGMdgh/0RomfQDbGZ3dQJo+dQCKptd5Ov/+bS2Upqxe0L3MhWwP
         oSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=dC8T/FjObZHxZhn9tBAWAoCxfVUyrBsoDEckaecw7ck=;
        fh=kANT3D++wurOQU1BOFSp5pyqxd/rDLTFW2yMBofHfAU=;
        b=SZR9W93MGHm0P25wjgFPJ/Uctf0sSaWF7DknJU14zQLTZnlaUlgL6Tf8SLerqwyMSq
         6oaapgVkKnr4tZ1OLiMSHJHK+cY7baQpAlwSRXpr5vD07oacXWlpNzlU+6tIgO0GL7mO
         lcCjIS1P5EfBJ7K+3/z1+hXyB+yAU4A+GJYw3SS+hkPr3Pt8ShcJBRvOQ8yzGpNsjahB
         2/z9wm9eJ+pw31rcKlsI2D2xF57BkxZyr1hQzygZ8NkqBn6LXSTjDjKF7u/zyZEJKdgj
         iaXRbUBA/koc2wLJFS2AOl/wuPMY3xoz/e3nO+3DZNKOFwYC3RwjtE+BIjB1VfXmHEHb
         v9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id p11-20020a5d59ab000000b0032d5152cc5bsi3429942wrr.332.2023.11.08.02.58.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2023 02:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SQMRp5CdBz67XhB;
	Wed,  8 Nov 2023 18:55:02 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 8 Nov 2023 10:58:31 +0000
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Wed, 8 Nov 2023 10:58:31 +0000
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
Subject: RE: [PATCH V6 7/9] hw/acpi: Update ACPI GED framework to support vCPU
 Hotplug
Thread-Topic: [PATCH V6 7/9] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHZ/cOYufqPrPRhXUanC39HFNBrArBdo9oAgA/gD4A=
Date: Wed, 8 Nov 2023 10:58:30 +0000
Message-ID: <950b9f911fb341dca81ceeaeab6c50b3@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-8-salil.mehta@huawei.com>
 <20231027151828.5c9d499b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231027151828.5c9d499b@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.245.122]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 7IZ6wf+D2oLR

Hi Igor,

> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Friday, October 27, 2023 2:18 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
> lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; andrew.jones@linux.dev; david@redhat.com;
> philmd@linaro.org; eric.auger@redhat.com; oliver.upton@linux.dev;
> pbonzini@redhat.com; mst@redhat.com; will@kernel.org; gshan@redhat.com;
> rafael@kernel.org; alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.co=
m>
> Subject: Re: [PATCH V6 7/9] hw/acpi: Update ACPI GED framework to support
> vCPU Hotplug
>=20
> On Fri, 13 Oct 2023 11:51:27 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > ACPI GED shall be used to convey to the guest kernel about any CPU hot-=
(un)plug
> > events. Therefore, existing ACPI GED framework inside QEMU needs to be =
enhanced
> > to support CPU hotplug state and events.
> >
>=20
> This is a part of hw wiring which you started to introduce in 4/9
> Given patches are small, I'd merge this into 4/9 to avoid broken context.
> So essentially GED improvement would consist from hw and aml parts.
> with some extra refactoring (5/9) in a separate patch.


No issues. Will merge.

Thanks
Salil.

> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Xianglai Li <lixianglai@loongson.cn>
> > ---
> >  hw/acpi/generic_event_device.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_dev=
ice.c
> > index 62d504d231..0d5f0140e5 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -12,6 +12,7 @@
> >  #include "qemu/osdep.h"
> >  #include "qapi/error.h"
> >  #include "hw/acpi/acpi.h"
> > +#include "hw/acpi/cpu.h"
> >  #include "hw/acpi/generic_event_device.h"
> >  #include "hw/irq.h"
> >  #include "hw/mem/pc-dimm.h"
> > @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler =
*hotplug_dev,
> >          } else {
> >              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, err=
p);
> >          }
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> >      } else {
> >          error_setg(errp, "virt: device plug request for unsupported de=
vice"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandl=
er *hotplug_dev,
> >      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
> >                         !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)=
))) {
> >          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, de=
v, errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, =
errp);
> >      } else {
> >          error_setg(errp, "acpi: device unplug request for unsupported =
device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotp=
lug_dev,
> >
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> >          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
> >      } else {
> >          error_setg(errp, "acpi: device unplug for unsupported device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev=
, ACPIOSTInfoList ***list)
> >      AcpiGedState *s =3D ACPI_GED(adev);
> >
> >      acpi_memory_ospm_status(&s->memhp_state, list);
> > +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
> >  }
> >
> >  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBit=
s ev)
> > @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev,=
 AcpiEventStatusBits ev)
> >          sel =3D ACPI_GED_PWR_DOWN_EVT;
> >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> >          sel =3D ACPI_GED_NVDIMM_HOTPLUG_EVT;
> > +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> > +        sel =3D ACPI_GED_CPU_HOTPLUG_EVT;
> >      } else {
> >          /* Unknown event. Return without generating interrupt. */
> >          warn_report("GED: Unsupported event %d. No irq injected", ev);
