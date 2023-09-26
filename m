Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1055943ejc;
        Tue, 26 Sep 2023 05:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXg1YMNueyeO79BnAcQ806QN+CdUjkhXqVv1XIGiloCW+yRf6YY6z+VMPI0SpLbqdMErCf
X-Received: by 2002:a17:902:da8e:b0:1c0:d575:d28 with SMTP id j14-20020a170902da8e00b001c0d5750d28mr9145867plx.50.1695731251609;
        Tue, 26 Sep 2023 05:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695731251; cv=none;
        d=google.com; s=arc-20160816;
        b=FUMyK49fVELs7rom8nyDEbME74fUiYyJHxVW4C1FmXvkAw9wHSIDFSFozf5Ad7oURC
         biPvOzOaLZG3P6Uh7MzBRWY8wzbBWWts/wu25MPJIM2W3LIao8ePEVWeNYZM2rmecHRq
         QJLltxqio1c5ezji04xzhL3PDprMbXHa+P8RINzIGBBviJF7bFqdIFip3/LCm5YKBBUS
         6F1GrWf3dSOymF6COBzRLZU+PGjiK4DSCrDKNKTp6s0dsBb0AZvmsrK0kOM22aG0NVLs
         HO/zNkVSI6w6K+TkwZ7Xbug/lJBGzMWGGWhORz1cUDmj1aVOtN1fqc1dlGAhFJpg0SEx
         l7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=CzSHvIzM/hGH84FiWVfcwJHxL360sns85YeJsu42+VY=;
        fh=Aq3q34NnW/oZbX6syaPeiC7znJSsoZbKwwGf15YXaJY=;
        b=ck8yTNQvzFVTV5ErzsrwG8otXx8bXWAGKtttu2p833/z6yQiUMO+KdrhTPlvMRGFOr
         CfkqMuMi2Ufr7SUha8QDmpBecz5Dv76TyrPuS294jGIX13Pf0/meHeVSfxfQQ5UOHdgQ
         Hwoellxkt4fS2dke1nF2Co7QWRKAv845/EyX7eDtIGNkyQfPQSyDe3ShIds3zM8hLLdP
         OUvkHH7Z0fsjdJpMwb2Q3VYYjcEOWNqpoypuTnlD5YOKjhuNuW/ca37wmdjVqq9USM8a
         /xTY+12YqkTit1SJexzEg4q1UjCVqKc4cBIH6jZYwMIwD5E4xOPS1u/JuAnIXqcAaUsi
         JQoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id jg5-20020a17090326c500b001c5fca2e1besi7438300plb.15.2023.09.26.05.27.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 05:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvzQX1cznz6J8DW;
	Tue, 26 Sep 2023 20:22:28 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 13:27:26 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 26 Sep 2023 13:27:26 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: RE: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
 support vCPU Hotplug
Thread-Topic: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
 support vCPU Hotplug
Thread-Index: AQHZ8GICsJ3ODJRpw0CC9UqWfrlu1rAs4EwAgAAXmTD///iQAIAAEiAg
Date: Tue, 26 Sep 2023 12:27:26 +0000
Message-ID: <94b11b88bfe4421ba92c62a44cdaef06@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-25-salil.mehta@huawei.com>
 <20230926070112-mutt-send-email-mst@kernel.org>
 <f68a5ccc153f4971b5fbe681095a7624@huawei.com>
 <20230926075838-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230926075838-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.16]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: KTeixsSpxX2M

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, September 26, 2023 1:00 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
> lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev=
;
> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> will@kernel.org; ardb@kernel.org; oliver.upton@linux.dev;
> pbonzini@redhat.com; gshan@redhat.com; rafael@kernel.org;
> borntraeger@linux.ibm.com; alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn
> Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
> support vCPU Hotplug
>=20
> On Tue, Sep 26, 2023 at 11:37:38AM +0000, Salil Mehta wrote:
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, September 26, 2023 12:02 PM
> > > To: Salil Mehta <salil.mehta@huawei.com>
> > > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> > > philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
> > > lpieralisi@kernel.org; peter.maydell@linaro.org;
> > > richard.henderson@linaro.org; imammedo@redhat.com;
> andrew.jones@linux.dev;
> > > david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> > > will@kernel.org; ardb@kernel.org; oliver.upton@linux.dev;
> > > pbonzini@redhat.com; gshan@redhat.com; rafael@kernel.org;
> > > borntraeger@linux.ibm.com; alex.bennee@linaro.org;
> linux@armlinux.org.uk;
> > > darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> > > vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> > > miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> > > <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com=
>;
> > > wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> > > maobibo@loongson.cn; lixianglai@loongson.cn
> > > Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework =
to
> > > support vCPU Hotplug
> > >
> > > On Tue, Sep 26, 2023 at 11:04:23AM +0100, Salil Mehta wrote:
> > > > ACPI GED shall be used to convey to the guest kernel about any CPU
> hot-
> > > (un)plug
> > > > events. Therefore, existing ACPI GED framework inside QEMU needs to
> be
> > > enhanced
> > > > to support CPU hotplug state and events.
> > > >
> > > > Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> > >
> > > Co-developed with yourself?
> > >
> > > didn't you co-develop this with xianglai li?
> >
> > No, our effort is quite old ARM patch-set existed since the year 2020
> > without any change. Please check the original patch-set here:
> >
> > https://lore.kernel.org/qemu-devel/20200613213629.21984-11-
> salil.mehta@huawei.com/
> >
> >
> > To be fair to the authors, it will not be right to add another SOB here=
.
> >
>=20
> I see. And what's the difference with patches that xianglai li posted?

I am not sure if there is. But if there is any change then it can be
commented on the architecture agnostic patch-set which I shall be
posting later this week. If that change is a common change to all
the architectures maybe I can pick-up that change and add in the V2
version of the arch agnostic patch-set and then it will make sense
to add the SOBs of the contributing members there.

> Are they both rebases of the same old patch then?

RFC V2 is an extension of RFC V1. We been working with ARM, Oracle
Ampere, Linaro and other companies to get to this stage.

It has already been agreed that Loongson folks shall be rebasing
their patch-set over ARM RFC V2 patch-set which is very big.=20


https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawe=
i.com/T/#m523b37819c4811c7827333982004e07a1ef03879

I have for now pointed the patches in the exact order which can be
used to rebase their patch-set .

I will be sending a separate arch agnostic patch-set later this week
which will be without RFC Tag. This way different companies can work
independently.


Thanks
Salil.

> > > Just include his S.O.B then, and drop the non-standard Co-developed-b=
y.
> >
> > Co-developed-by Tag has been added to ensure main authors of the patch
> > get highlighted clearly.
>=20
> I think I don't know the patch provenance at this point.


It was us from Huawei in the year 2020.

https://lore.kernel.org/qemu-devel/20200613213629.21984-10-salil.mehta@huaw=
ei.com/




> > > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > > > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > >
> > >
> > >
> > > > ---
> > > >  hw/acpi/generic_event_device.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/hw/acpi/generic_event_device.c
> > > b/hw/acpi/generic_event_device.c
> > > > index ad252e6a91..0266733a54 100644
> > > > --- a/hw/acpi/generic_event_device.c
> > > > +++ b/hw/acpi/generic_event_device.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include "qemu/osdep.h"
> > > >  #include "qapi/error.h"
> > > >  #include "hw/acpi/acpi.h"
> > > > +#include "hw/acpi/cpu.h"
> > > >  #include "hw/acpi/generic_event_device.h"
> > > >  #include "hw/irq.h"
> > > >  #include "hw/mem/pc-dimm.h"
> > > > @@ -239,6 +240,8 @@ static void
> acpi_ged_device_plug_cb(HotplugHandler
> > > *hotplug_dev,
> > > >          } else {
> > > >              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev,
> > > errp);
> > > >          }
> > > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > > > +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> > > >      } else {
> > > >          error_setg(errp, "virt: device plug request for unsupporte=
d
> > > device"
> > > >                     " type: %s", object_get_typename(OBJECT(dev)));
> > > > @@ -253,6 +256,8 @@ static void
> acpi_ged_unplug_request_cb(HotplugHandler
> > > *hotplug_dev,
> > > >      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
> > > >                         !(object_dynamic_cast(OBJECT(dev),
> > > TYPE_NVDIMM)))) {
> > > >          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state=
,
> dev,
> > > errp);
> > > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > > > +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state,
> dev,
> > > errp);
> > > >      } else {
> > > >          error_setg(errp, "acpi: device unplug request for
> unsupported
> > > device"
> > > >                     " type: %s", object_get_typename(OBJECT(dev)));
> > > > @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler
> > > *hotplug_dev,
> > > >
> > > >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > >          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> > > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > > > +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
> > > >      } else {
> > > >          error_setg(errp, "acpi: device unplug for unsupported
> device"
> > > >                     " type: %s", object_get_typename(OBJECT(dev)));
> > > > @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf
> *adev,
> > > ACPIOSTInfoList ***list)
> > > >      AcpiGedState *s =3D ACPI_GED(adev);
> > > >
> > > >      acpi_memory_ospm_status(&s->memhp_state, list);
> > > > +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
> > > >  }
> > > >
> > > >  static void acpi_ged_send_event(AcpiDeviceIf *adev,
> AcpiEventStatusBits
> > > ev)
> > > > @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf
> *adev,
> > > AcpiEventStatusBits ev)
> > > >          sel =3D ACPI_GED_PWR_DOWN_EVT;
> > > >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> > > >          sel =3D ACPI_GED_NVDIMM_HOTPLUG_EVT;
> > > > +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> > > > +        sel =3D ACPI_GED_CPU_HOTPLUG_EVT;
> > > >      } else {
> > > >          /* Unknown event. Return without generating interrupt. */
> > > >          warn_report("GED: Unsupported event %d. No irq injected",
> ev);
> > > > --
> > > > 2.34.1
