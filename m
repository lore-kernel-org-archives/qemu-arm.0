Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1026459ejc;
        Tue, 26 Sep 2023 04:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGrjSorjvi6dhLNRqUAsAriwNmjYsF6baUwiVEeJJJ7MIil77TUwBnSJpxvHrIL23d69G
X-Received: by 2002:a17:902:a9cb:b0:1c5:c36b:e954 with SMTP id b11-20020a170902a9cb00b001c5c36be954mr8634140plr.2.1695728264508;
        Tue, 26 Sep 2023 04:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695728264; cv=none;
        d=google.com; s=arc-20160816;
        b=NXgFoX7BQEWFeOmIriQymgpISMD1pGZ5Ofz307JpvKPtnpEZC/urSTUsqdoteKIpzj
         e+kA5Gp2Zx7kn400ItuAerpXtzyZ1xoEXnLGg1n+I6m+wQMxcPHbyCU1gZHlWozGCACd
         r5LbIdSwkkqad/+15sECaiwn+Uiy/lxbg5+U8nqp0AL85Q1BqvqDZysaWqleoTA84PjX
         TvDBYRikbwyOzTpKDOHhge8rVx22+KaV1QcdIGXAzKh1xsBXjKIEi3CQROFRP0LuXpaw
         WjrGdiXlZnPxAWz3439P2OF8pnYc9eTBU5KENYFzO2stwVPqvmcsqGpmoAsdqOO7wb43
         OLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=2LA00TM5/P+Nni+TgO3dN8g69iJ0VndbI+qenk01fHY=;
        fh=Aq3q34NnW/oZbX6syaPeiC7znJSsoZbKwwGf15YXaJY=;
        b=Nbev11hh/IuAWLV3Zr14ktnGklZgLEIsp7f5ABaBourr2R9xzlSQQqWE/NeEWD4GsA
         Oi6K03XPtRxeVGJTcdtrUOJgiExLZKNx3rj+5aNVZbwUg+d0eBvTL0kvne1zhHg0KjnX
         45KiO4vx20y8qcDBI8IpCyWcC8NQ5fmnEMn9Wf6QmPHQWownSgozg66ZOMiHsq9be7Hk
         5beenXWUVd9cUpaXDoq0vvf/wtzxgly3gTy8FbGJiJohiS6gy1NWpzuSpSq/vap02WOX
         ItCmbW+NFCy19AfFaJjeRTb8y7+5EDP2LhE6D7UhPltOUkvBDfj8z3netTTowQ6z8sUO
         y5Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id jy6-20020a17090342c600b001c589ba4a08si11410264plb.1.2023.09.26.04.37.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 04:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvyN72YY7z6DB19;
	Tue, 26 Sep 2023 19:35:19 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 12:37:38 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 26 Sep 2023 12:37:38 +0100
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
Thread-Index: AQHZ8GICsJ3ODJRpw0CC9UqWfrlu1rAs4EwAgAAXmTA=
Date: Tue, 26 Sep 2023 11:37:38 +0000
Message-ID: <f68a5ccc153f4971b5fbe681095a7624@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-25-salil.mehta@huawei.com>
 <20230926070112-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230926070112-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.16]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: ZLWDX+PAkw0A

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, September 26, 2023 12:02 PM
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
> On Tue, Sep 26, 2023 at 11:04:23AM +0100, Salil Mehta wrote:
> > ACPI GED shall be used to convey to the guest kernel about any CPU hot-
> (un)plug
> > events. Therefore, existing ACPI GED framework inside QEMU needs to be
> enhanced
> > to support CPU hotplug state and events.
> >
> > Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
>=20
> Co-developed with yourself?
>=20
> didn't you co-develop this with xianglai li?

No, our effort is quite old ARM patch-set existed since the year 2020
without any change. Please check the original patch-set here:

https://lore.kernel.org/qemu-devel/20200613213629.21984-11-salil.mehta@huaw=
ei.com/


To be fair to the authors, it will not be right to add another SOB here.



>=20
> Just include his S.O.B then, and drop the non-standard Co-developed-by.

Co-developed-by Tag has been added to ensure main authors of the patch
get highlighted clearly.


>=20
>=20
>=20
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>=20
>=20
>=20
> > ---
> >  hw/acpi/generic_event_device.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/hw/acpi/generic_event_device.c
> b/hw/acpi/generic_event_device.c
> > index ad252e6a91..0266733a54 100644
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
> > @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler
> *hotplug_dev,
> >          } else {
> >              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev,
> errp);
> >          }
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> >      } else {
> >          error_setg(errp, "virt: device plug request for unsupported
> device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandl=
er
> *hotplug_dev,
> >      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
> >                         !(object_dynamic_cast(OBJECT(dev),
> TYPE_NVDIMM)))) {
> >          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, de=
v,
> errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev,
> errp);
> >      } else {
> >          error_setg(errp, "acpi: device unplug request for unsupported
> device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler
> *hotplug_dev,
> >
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> >          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
> >      } else {
> >          error_setg(errp, "acpi: device unplug for unsupported device"
> >                     " type: %s", object_get_typename(OBJECT(dev)));
> > @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev=
,
> ACPIOSTInfoList ***list)
> >      AcpiGedState *s =3D ACPI_GED(adev);
> >
> >      acpi_memory_ospm_status(&s->memhp_state, list);
> > +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
> >  }
> >
> >  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBit=
s
> ev)
> > @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev,
> AcpiEventStatusBits ev)
> >          sel =3D ACPI_GED_PWR_DOWN_EVT;
> >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> >          sel =3D ACPI_GED_NVDIMM_HOTPLUG_EVT;
> > +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> > +        sel =3D ACPI_GED_CPU_HOTPLUG_EVT;
> >      } else {
> >          /* Unknown event. Return without generating interrupt. */
> >          warn_report("GED: Unsupported event %d. No irq injected", ev);
> > --
> > 2.34.1
