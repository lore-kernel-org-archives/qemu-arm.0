Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp2012204wro;
        Fri, 15 Mar 2019 06:07:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRLWeZM9TNR7RewimB1wmPQLKQgTxqDaR4l//Jp+ZrPv75v6h/x2KWF0PDXGM5QSpzPK5O
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr2184159wma.72.1552655275668;
        Fri, 15 Mar 2019 06:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552655275; cv=none;
        d=google.com; s=arc-20160816;
        b=zkruWzHJciiCgyzs5SW1kTJXNaA/eZShmVVEdmE61JOZ6PA3iIa6RVovgQNQbbj9aW
         ScblQT2deki4NnWI1qSRkcD4uM/SPZZ4LKNt7Luz6e+8wnWtJMCJMugbGqn1zIW8+BwU
         xDX0dLhqXGzbAX7z976ce9w6fqMiac29ecXG8zJvzkZhWyTylhS5XBa4Xta21Yv4kSdZ
         w3/F7H78zzHiPj0EPUiuy/N3moKRQHHpio0vnPnPbWuwTZWZqUVQZqNj5bzLhCRgx6DI
         CqbeqJPq7LAlcCEVQbP2QcaZql19naOhi/hQHkoYLRhZAgz5ey4iEj1YEIElXDR/lNUD
         EaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=6C8tGifBTcEb4tvUEk54paXIpWe7ZE+ff+IYWfY4vmI=;
        b=u4oUEjv6HkQNlkZlRzNskpR3oYgoIsJ93IE2WtYir7Pbtg46i6Kna0hZxGV+eYxyAm
         ZUxcBmpZ+YBDFTNkC4JG73Pb/a6wuECwrmTniqL7HvY0L+GbzoPsSrJwMv47zjqN1KhW
         nD2ak0y3UUAXRo2VVY7eeTh3x4XUVHUo3fqbejjaYQ6EK2Kjf8kLEq+2rCvsWiRReFhF
         G/OneoP684RArz+oOKNPR3/fRo+frdZ+1+3PhzX0ssms0Qu3agg+29m2GKPNo92VV8X7
         z/P+aR4bAcXkitVebUi+V6gzChjxp2X5pPtSz2XSXt8C6F2g2xpmA1XTRYdHFZ4eocIQ
         U3jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si1320427wrp.1.2019.03.15.06.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 06:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4mZ0-0006pA-Id
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 09:07:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h4mTh-0002AM-EX
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 09:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h4mNL-00059D-Ox
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 08:55:53 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45371 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h4mNJ-00056N-Ha; Fri, 15 Mar 2019 08:55:49 -0400
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 40D6F40A739EB158E604;
	Fri, 15 Mar 2019 12:08:52 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.154]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Fri, 15 Mar 2019 12:08:42 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
Thread-Index: AQHU1aRuwKWi3K07OkyNbQWLIMG7oqYIKsqAgAM0Q+CAAQuEAIAAOVLQ
Date: Fri, 15 Mar 2019 12:08:41 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839315700@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
	<20190312164829.7f2c7c0f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839314D1E@lhreml524-mbs.china.huawei.com>
	<20190315094148.7c3f09e2@redhat.com>
In-Reply-To: <20190315094148.7c3f09e2@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-devel] [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI
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
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFcevWtPl747



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 15 March 2019 08:42
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
>=20
> On Thu, 14 Mar 2019 16:55:36 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Hi Igor,
> >
> > > -----Original Message-----
> > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > Sent: 12 March 2019 15:48
> > > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > > eric.auger@redhat.com; peter.maydell@linaro.org;
> > > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > > sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> > > <xuwei5@huawei.com>
> > > Subject: Re: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
> > >
> > > On Fri, 8 Mar 2019 11:42:11 +0000
> > > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> > >
> > > > From: Samuel Ortiz <sameo@linux.intel.com>
> > > >
> > > > This is to provide an acpi device interface for Arm/virt.
> > > > This will be used by Arm/Virt to add hotplug support via
> > > > ACPI GED device.
> > > >
> > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > > > ---
> > > >  hw/arm/Makefile.objs  |   2 +-
> > > >  hw/arm/virt-acpi.c    | 111
> > > ++++++++++++++++++++++++++++++++++++++++++++++++++
> > >
> > > does it have to be ARM specific?
> > > could it be shared with future x86/virt? (if it could then it would b=
e better to
> put
> > > into hw/acpi/)
> > > also considering it implements vitual 'GED' device
> > > why not s/virt-acpi/generic-event-device/ ?
> >
> > I think that's a good idea to make it generic and I had a quick go at i=
t.
> >
> > But the problem I am facing is as soon as sysbus_create_simple() is cal=
led
> from
> > virt_acpi_init(), the realize() function gets called before it sets the
> VirtAcpiState
> > members.
>=20
> Lets look at it from the other side, what are the reasons to use inherit =
device
> from TYPE_SYS_BUS_DEVICE and use sysbus_create_simple()?

Right. I think I can solve this by using qdev_create() and qdev_init_nofail=
().

Thanks,
Shameer
=20
>=20
> > This creates a problem as acpi_memory_hotplug_init() and acpi_ged_init(=
)
> are
> > invoked from the realize() and it needs to have the base address, irq e=
tc set
> based
> > on the platform.
> >
> > I tried using the qdev_prop_set_*() as well, but it also fails saying a=
ttempt to
> set
> > property after it was realized.
> >
> > Not sure what is the best way to solve this other than introducing a gl=
obal
> struct to
> > hold the configuration.
> Globals are frowned upon, we shouldn't do add more.
>=20
> >
> > Please let me know.
> >
> > Thanks,
> > Shameer
> >
> > >
> > > >  include/hw/arm/virt.h |   1 +
> > > >  3 files changed, 113 insertions(+), 1 deletion(-)
> > > >  create mode 100644 hw/arm/virt-acpi.c
> > > >
> > > > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > > > index fa57c7c..e0db3cd 100644
> > > > --- a/hw/arm/Makefile.objs
> > > > +++ b/hw/arm/Makefile.objs
> > > > @@ -1,6 +1,6 @@
> > > >  obj-y +=3D boot.o sysbus-fdt.o
> > > >  obj-$(CONFIG_ARM_VIRT) +=3D virt.o
> > > > -obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
> > > > +obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o virt-acpi.o
> > > >  obj-$(CONFIG_DIGIC) +=3D digic_boards.o
> > > >  obj-$(CONFIG_EXYNOS4) +=3D exynos4_boards.o
> > > >  obj-$(CONFIG_HIGHBANK) +=3D highbank.o
> > > > diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
> > > > new file mode 100644
> > > > index 0000000..df8a02b
> > > > --- /dev/null
> > > > +++ b/hw/arm/virt-acpi.c
> > > > @@ -0,0 +1,111 @@
> > > > +/*
> > > > + *
> > > > + * Copyright (c) 2018 Intel Corporation
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or m=
odify it
> > > > + * under the terms and conditions of the GNU General Public Licens=
e,
> > > > + * version 2 or later, as published by the Free Software Foundatio=
n.
> > > > + *
> > > > + * This program is distributed in the hope it will be useful, but =
WITHOUT
> > > > + * ANY WARRANTY; without even the implied warranty of
> > > MERCHANTABILITY or
> > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> > > License for
> > > > + * more details.
> > > > + *
> > > > + * You should have received a copy of the GNU General Public Licen=
se
> along
> > > with
> > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "qemu/range.h"
> > > > +#include "qapi/error.h"
> > > > +#include "exec/address-spaces.h"
> > > > +
> > > > +#include "hw/hw.h"
> > > > +#include "hw/hotplug.h"
> > > > +#include "hw/sysbus.h"
> > > > +#include "hw/arm/virt.h"
> > > > +
> > > > +#include "hw/acpi/acpi.h"
> > > > +
> > > > +typedef struct VirtAcpiState {
> > > > +    SysBusDevice parent_obj;
> > > > +} VirtAcpiState;
> > > > +
> > > > +#define TYPE_VIRT_ACPI "virt-acpi"
> > > > +#define VIRT_ACPI(obj) \
> > > > +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> > > > +
> > > > +static const VMStateDescription vmstate_acpi =3D {
> > > > +    .name =3D "virt_acpi",
> > > > +    .version_id =3D 1,
> > > > +    .minimum_version_id =3D 1,
> > > > +};
> > > > +
> > > > +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> > > > +                                DeviceState *dev, Error **errp)
> > > > +{
> > > > +}
> > > > +
> > > > +static void virt_device_unplug_request_cb(HotplugHandler
> *hotplug_dev,
> > > > +                                          DeviceState *dev,
> Error
> > > **errp)
> > > > +{
> > > > +}
> > > > +
> > > > +static void virt_device_unplug_cb(HotplugHandler *hotplug_dev,
> > > > +                                  DeviceState *dev, Error
> **errp)
> > > > +{
> > > > +}
> > > > +
> > > > +static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits =
ev)
> > > > +{
> > > > +}
> > > > +
> > > > +static void virt_device_realize(DeviceState *dev, Error **errp)
> > > > +{
> > > > +}
> > > > +
> > > > +DeviceState *virt_acpi_init(void)
> > > > +{
> > > > +    return sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
> > > > +}
> > > > +
> > > > +static Property virt_acpi_properties[] =3D {
> > > > +    DEFINE_PROP_END_OF_LIST(),
> > > > +};
> > > > +
> > > > +static void virt_acpi_class_init(ObjectClass *class, void *data)
> > > > +{
> > > > +    DeviceClass *dc =3D DEVICE_CLASS(class);
> > > > +    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(class);
> > > > +    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_CLASS(class);
> > > > +
> > > > +    dc->desc =3D "ACPI";
> > > > +    dc->vmsd =3D &vmstate_acpi;
> > > > +    dc->props =3D virt_acpi_properties;
> > > > +    dc->realize =3D virt_device_realize;
> > > > +
> > > > +    hc->plug =3D virt_device_plug_cb;
> > > > +    hc->unplug_request =3D virt_device_unplug_request_cb;
> > > > +    hc->unplug =3D virt_device_unplug_cb;
> > > > +
> > > > +    adevc->send_event =3D virt_send_ged;
> > > > +}
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
> > > > +static void virt_acpi_register_types(void)
> > > > +{
> > > > +    type_register_static(&virt_acpi_info);
> > > > +}
> > > > +
> > > > +type_init(virt_acpi_register_types)
> > > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > > index 507517c..6076167 100644
> > > > --- a/include/hw/arm/virt.h
> > > > +++ b/include/hw/arm/virt.h
> > > > @@ -145,6 +145,7 @@ typedef struct {
> > > >      OBJECT_CLASS_CHECK(VirtMachineClass, klass,
> > > TYPE_VIRT_MACHINE)
> > > >
> > > >  void virt_acpi_setup(VirtMachineState *vms);
> > > > +DeviceState *virt_acpi_init(void);
> > > >
> > > >  /* Return the number of used redistributor regions  */
> > > >  static inline int virt_gicv3_redist_region_count(VirtMachineState =
*vms)
> >

