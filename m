Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp466993wrx;
        Mon, 1 Apr 2019 07:29:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2dFEkDyy4TrhLRqadjNkbDi/geWYIVYJlcosC042jBZz3bmE2MzXdMJtNYd90iyni/3Cb
X-Received: by 2002:a25:4108:: with SMTP id o8mr25357840yba.519.1554128980104;
        Mon, 01 Apr 2019 07:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554128980; cv=none;
        d=google.com; s=arc-20160816;
        b=EaiPBGtxtg7oIRhzOYPYMpAnEKYIJLbodXS57wGlq4YJXFAqpmPAZZUQabFlfCcU7i
         wjQdFgo4livv7OgrNiMv+LXxtyWWjiy51BXJQ94MoxHEoLqj5sYw0f82h8nmFM6zGqTJ
         Ds9krvMBDNxf7g79gCLaNKMV8EcnTfnkiOx/jLbmaE7B+bfRO0Yrwt07e4g1zpwPIe+s
         z2U/HZn7jXeTYmGTIBwDD8YzHaQYfHpEaZ2KlifnajC86kcZ9Rzlm2gdtw37rvPjSMvi
         vAe155Z5Cbb/vXngWkmSwJ1AN8AuFBjJObUHTv4ptcrMcBJllecSm/imfxL9gGfTNI2Q
         lbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=m14wyUG9Mgkt/5Rv4Cme0toahH9y3s6ZCtzGVgIsGFE=;
        b=tasxHiiaQOtOOB2z3okLkwfDUgPvuxz/eDmfRWvW1Wb5I71yqgkrTl9D/Azb1ppf87
         +oSHqctQtcFQRjFHcCmS2/m3zPl6/xct3I7CVSGpcJ4zWYPx7EY2ODO3XtfCgKHsjsdk
         S0s0umlEsZkCTDX7a0FwpAb/79qh3ye7O3xNXHbsELMf1pLV+y2cb8GYY2pwvmf5u+PD
         phmm0nA+b5unCi79SVpqZ8b1W77/JbPUn3JLdJAtcCcd5EUUSndNTg2TDMXLE30sA/4H
         IA68eG4YbRllCpZp1BS3YkdI8n16mt8wVJmiYnnY/9rPLsihhc5bjSCIXqt5hv21Yzau
         Z4Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si5539544ybn.475.2019.04.01.07.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 07:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAxwR-0004qq-Ff
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 10:29:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hAxp3-0007qJ-Au
	for qemu-devel@nongnu.org; Mon, 01 Apr 2019 10:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hAxp1-0002cl-IB
	for qemu-devel@nongnu.org; Mon, 01 Apr 2019 10:22:01 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45382 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hAxov-0002XS-Og; Mon, 01 Apr 2019 10:21:54 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [10.201.108.44])
	by Forcepoint Email with ESMTP id 6223425D1383EFF2F456;
	Mon,  1 Apr 2019 15:21:49 +0100 (IST)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.113]) by
	lhreml703-cah.china.huawei.com ([10.201.108.44]) with mapi id
	14.03.0415.000; Mon, 1 Apr 2019 15:21:42 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI
	device
Thread-Index: AQHU39O3pGz5ONjWFkKOeMcMWF1+QKYhIYqAgAFa4vCABMswAIAAH3Hg
Date: Mon, 1 Apr 2019 14:21:40 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839345569@lhreml524-mbb.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-4-shameerali.kolothum.thodi@huawei.com>
	<52334300-4029-d54d-91de-441d68188e70@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933849C@lhreml524-mbs.china.huawei.com>
	<20190401150836.11c86f26@redhat.com>
In-Reply-To: <20190401150836.11c86f26@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-devel] [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI
 device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LfuVFXOTJFI0

Hi Igor,

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 01 April 2019 14:09
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Auger Eric <eric.auger@redhat.com>; qemu-devel@nongnu.org;
> qemu-arm@nongnu.org; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [Qemu-devel] [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI
> device
>=20
> On Fri, 29 Mar 2019 11:22:02 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Auger Eric [mailto:eric.auger@redhat.com]
> > > Sent: 28 March 2019 14:15
> > > To: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>;
> > > qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> imammedo@redhat.com;
> > > peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> > > sameo@linux.intel.com; sebastien.boeuf@intel.com
> > > Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> > > Subject: Re: [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI device
> > >
> > > Hi Shameer,
> > >
> > > On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> > > > From: Samuel Ortiz <sameo@linux.intel.com>
> > > >
> > > > This adds the skeleton to support an acpi device interface for
> > > > HW-reduced acpi platforms via ACPI GED - Generic Event Device (ACPI
> > > > v6.1 5.6.9).
> > > >
> > > > This will be used by Arm/Virt to add hotplug support.
> > > >
> > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > > > ---
> > > >  hw/acpi/Kconfig                        |  4 ++
> > > >  hw/acpi/Makefile.objs                  |  1 +
> > > >  hw/acpi/generic_event_device.c         | 72
> > > ++++++++++++++++++++++++++++++++++
> > > >  include/hw/acpi/generic_event_device.h | 29 ++++++++++++++
> > > >  4 files changed, 106 insertions(+)
> > > >  create mode 100644 hw/acpi/generic_event_device.c  create mode
> > > 100644
> > > > include/hw/acpi/generic_event_device.h
> > > >
> > > > diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig index eca3bee..01a8b=
41
> > > > 100644
> > > > --- a/hw/acpi/Kconfig
> > > > +++ b/hw/acpi/Kconfig
> > > > @@ -27,3 +27,7 @@ config ACPI_VMGENID
> > > >      bool
> > > >      default y
> > > >      depends on PC
> > > > +
> > > > +config ACPI_HW_REDUCED
> > > > +    bool
> > > > +    depends on ACPI
> > > > diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs index
> > > > 2d46e37..b753232 100644
> > > > --- a/hw/acpi/Makefile.objs
> > > > +++ b/hw/acpi/Makefile.objs
> > > > @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG)
> +=3D
> > > > memory_hotplug.o
> > > >  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) +=3D cpu.o
> > > >  common-obj-$(CONFIG_ACPI_NVDIMM) +=3D nvdimm.o
> > > >  common-obj-$(CONFIG_ACPI_VMGENID) +=3D vmgenid.o
> > > > +common-obj-$(CONFIG_ACPI_HW_REDUCED) +=3D
> generic_event_device.o
> > > >  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) +=3D acpi-stub.o
> > > >
> > > >  common-obj-y +=3D acpi_interface.o
> > > > diff --git a/hw/acpi/generic_event_device.c
> > > > b/hw/acpi/generic_event_device.c new file mode 100644 index
> > > > 0000000..b21a551
> > > > --- /dev/null
> > > > +++ b/hw/acpi/generic_event_device.c
> > > > @@ -0,0 +1,72 @@
> > > > +/*
> > > > + *
> > > > + * Copyright (c) 2018 Intel Corporation
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or
> > > > +modify it
> > > > + * under the terms and conditions of the GNU General Public Licens=
e,
> > > > + * version 2 or later, as published by the Free Software Foundatio=
n.
> > > > + *
> > > > + * This program is distributed in the hope it will be useful, but
> > > > +WITHOUT
> > > > + * ANY WARRANTY; without even the implied warranty of
> > > MERCHANTABILITY
> > > > +or
> > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> > > > +License for
> > > > + * more details.
> > > > + *
> > > > + * You should have received a copy of the GNU General Public Licen=
se
> > > > +along with
> > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "hw/sysbus.h"
> > > > +#include "hw/acpi/acpi.h"
> > > > +#include "hw/acpi/generic_event_device.h"
> > > the files are named generic_event_device.c/h while the device is name=
d
> > > "virt-acpi". I would suggest to use the same naming as in nemu ie. ge=
d or
> > > acpi_ged.
> >
> > Agree. The naming is a bit confusing. In nemu they have a separate virt=
-acpi
> > dev which makes use of GED. Here, we are rolling those two into one. I =
am
> > still not very sure whether we should leave it as virt-acpi, because th=
e actual
> > device on which this is implemented can be changed eg, GED vs GPIO.
>=20
> I probably lacking context here, could you clarify and maybe compare
> differences between x86 and ARM implementations and why it should be
> different devices?
>=20

Right. I was not comparing against x86, but just pointing out how Nemu has
done this. They seems to have a virt-acpi dev specific to virt platforms
(hw/i386/virt/acpi.c) and then moved all GED related code in a separate fil=
e
(hw/acpi/ged.c) [1].

I was just thinking whether that approach makes any sense going forward whe=
re
there are cases where platforms support GED or GPIO for hotplug support and
virt-acpi dev can be configured to use either of those. May be not.

Thanks,
Shameer

[1]https://github.com/intel/nemu/commit/bcff7ee8588f7049cd919ee8b349f219a87=
3ec41#diff-82ce92e28467c5894c90311f0e6a75fb

>=20
> > > If think you should clarify what is the exact scope of this device. T=
he patch
> title
> > > make think this is bound to be used only in machvirt (+ the virt pref=
ix used in
> > > numerous functions?). Is it also bound to be used by other architectu=
res?
> > > > +
> > > > +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> > > > +                                DeviceState *dev, Error **errp)
> { }
> > > > +
> > > > +static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits =
ev)
> > > > +{ }
> > > > +
> > > > +static void virt_device_realize(DeviceState *dev, Error **errp) { =
}
> > > > +
> > > > +static Property virt_acpi_properties[] =3D {
> > > > +    DEFINE_PROP_END_OF_LIST(),
> > > > +};
> > > > +
> > > > +static void virt_acpi_class_init(ObjectClass *class, void *data) {
> > > > +    DeviceClass *dc =3D DEVICE_CLASS(class);
> > > > +    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(class);
> > > > +    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_CLASS(class);
> > > > +
> > > > +    dc->desc =3D "ACPI";
> > > > +    dc->props =3D virt_acpi_properties;
> > > > +    dc->realize =3D virt_device_realize;
> > > > +
> > > > +    hc->plug =3D virt_device_plug_cb;
> > > > +
> > > > +    adevc->send_event =3D virt_send_ged; }
> > > > +
> > > > +static const TypeInfo virt_acpi_info =3D {
> > > > +    .name          =3D TYPE_VIRT_ACPI,
> > > > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > > > +    .instance_size =3D sizeof(VirtAcpiState),
> > > > +    .class_init    =3D virt_acpi_class_init,
> > > > +    .interfaces =3D (InterfaceInfo[]) {
> > > > +        { TYPE_HOTPLUG_HANDLER },
> > > > +        { TYPE_ACPI_DEVICE_IF },
> > > > +        { }
> > > > +    }
> > > > +};
> > > > +
> > > > +static void virt_acpi_register_types(void) {
> > > > +    type_register_static(&virt_acpi_info);
> > > > +}
> > > > +
> > > > +type_init(virt_acpi_register_types)
> > > > diff --git a/include/hw/acpi/generic_event_device.h
> > > > b/include/hw/acpi/generic_event_device.h
> > > > new file mode 100644
> > > > index 0000000..f314515
> > > > --- /dev/null
> > > > +++ b/include/hw/acpi/generic_event_device.h
> > > > @@ -0,0 +1,29 @@
> > > > +/*
> > > > + *
> > > > + * Copyright (c) 2018 Intel Corporation
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or
> > > > +modify it
> > > > + * under the terms and conditions of the GNU General Public Licens=
e,
> > > > + * version 2 or later, as published by the Free Software Foundatio=
n.
> > > > + *
> > > > + * This program is distributed in the hope it will be useful, but
> > > > +WITHOUT
> > > > + * ANY WARRANTY; without even the implied warranty of
> > > MERCHANTABILITY
> > > > +or
> > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> > > > +License for
> > > > + * more details.
> > > > + *
> > > > + * You should have received a copy of the GNU General Public Licen=
se
> > > > +along with
> > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > + */
> > > Add a comment in the header introducing what is the role of this devi=
ce?
> > > link to GED spec? Explain the subset of the interfaces being implemen=
ted by
> > > the device.
> >
> > Ok. I have added comments to that effect in patch #10, but I think I wi=
ll make
> it
> > clear here as well.
> >
> > Cheers,
> > Shameer
> >
> > > > +
> > > > +#ifndef HW_ACPI_GED_H
> > > > +#define HW_ACPI_GED_H
> > > > +
> > > > +#define TYPE_VIRT_ACPI "virt-acpi"
> > > > +#define VIRT_ACPI(obj) \
> > > > +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> > > > +
> > > > +typedef struct VirtAcpiState {
> > > > +    SysBusDevice parent_obj;
> > > > +} VirtAcpiState;
> > > > +
> > > > +#endif
> > > >

