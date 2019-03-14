Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1086142wro;
        Thu, 14 Mar 2019 10:10:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNJiad+WKejNTnPTrAXQFDwOaaUD7+QU4aSX/nkc9wFRL6sNTFwbv0kKcWH0cI5HafGv18
X-Received: by 2002:a81:6f03:: with SMTP id k3mr10983833ywc.42.1552583420538;
        Thu, 14 Mar 2019 10:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552583420; cv=none;
        d=google.com; s=arc-20160816;
        b=tkaMLanhbJB9jMzYBGoCIy9jIQjwPLP0uHM4Xgnw3OpOQF/BS9FYgZMStA/ukPYR81
         5pIEawi0VCk8/bxsmwlrnFDy0jVPwahk0H8GDq0V08xLBZw5jaC03rMP0LydtF1LuvAj
         rjO8C+nrPd+PlO6zuPweR0jrYR1QwXwxrtqtHS7OJIQiQr9K7XbH6z9OllW+5DqmvxEK
         P6VQDZzwnTCjYKoalIpyDjD+cK0AKSsl6AYK2EPKuWbt112sGLDIeGUJofqK8xHFHQgD
         CdVeTDa8ynFjyXEE6vA/yDlwNY2v7Q1jpTEGKFUKJqwnG9XCrnmZgdkHUdkXSV5HfENl
         5C4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=d3wls1topf71wcov9NPJvGxRCCNRnISZ50I1ctSXz1M=;
        b=scPRsOBtfH9ErdESZEC7RtKFz+zzcT4Gs554PausEchbU9xQMw/5ISpV8LiYVzwsii
         +bUMvMsr31HDzHRlIPSntEDXdgQzdG2KHceIN69XgjZ5IU2rUtfBWl67BOQUsrrCOukX
         XVZkd67Kej6bCfjGb1vOaqSSCbItYrc+Hld6RRyJynDoYlGlNsXwufeMKqv0bHRWmiQH
         EHS/AGQ9fpsqNgpPbIG8EZ/cu/bi9XfY5LKkw47GqQ4HFuIvdrfOOgZEplPELev6YToF
         OI63HNu0Y5JnBer9SkDaqaNL+4CSnNUauJ0bngaqsaCFgBg7W3+lqdIuDf4l0NwjKCxJ
         C8ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si8648684ybk.277.2019.03.14.10.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Ts3-0005f3-ST
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:10:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h4ToL-00036z-1H
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h4TeO-00067i-DK
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 12:56:13 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45368 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h4TeK-0005gQ-Tp; Thu, 14 Mar 2019 12:56:10 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 2A81DF9D5FDEC261D12F;
	Thu, 14 Mar 2019 16:55:44 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.154]) by
	lhreml703-cah.china.huawei.com ([10.201.108.44]) with mapi id
	14.03.0415.000; Thu, 14 Mar 2019 16:55:37 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
Thread-Index: AQHU1aRuwKWi3K07OkyNbQWLIMG7oqYIKsqAgAM0Q+A=
Date: Thu, 14 Mar 2019 16:55:36 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839314D1E@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
	<20190312164829.7f2c7c0f@redhat.com>
In-Reply-To: <20190312164829.7f2c7c0f@redhat.com>
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
X-TUID: j34/cvTfFjvx

Hi Igor,

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 12 March 2019 15:48
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
>=20
> On Fri, 8 Mar 2019 11:42:11 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > From: Samuel Ortiz <sameo@linux.intel.com>
> >
> > This is to provide an acpi device interface for Arm/virt.
> > This will be used by Arm/Virt to add hotplug support via
> > ACPI GED device.
> >
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/Makefile.objs  |   2 +-
> >  hw/arm/virt-acpi.c    | 111
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>=20
> does it have to be ARM specific?
> could it be shared with future x86/virt? (if it could then it would be be=
tter to put
> into hw/acpi/)
> also considering it implements vitual 'GED' device
> why not s/virt-acpi/generic-event-device/ ?

I think that's a good idea to make it generic and I had a quick go at it.

But the problem I am facing is as soon as sysbus_create_simple() is called =
from
virt_acpi_init(), the realize() function gets called before it sets the Vir=
tAcpiState
members.

This creates a problem as acpi_memory_hotplug_init() and acpi_ged_init() ar=
e
invoked from the realize() and it needs to have the base address, irq etc s=
et based
on the platform.

I tried using the qdev_prop_set_*() as well, but it also fails saying attem=
pt to set
property after it was realized.

Not sure what is the best way to solve this other than introducing a global=
 struct to
hold the configuration.

Please let me know.

Thanks,
Shameer
=20
>=20
> >  include/hw/arm/virt.h |   1 +
> >  3 files changed, 113 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/arm/virt-acpi.c
> >
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index fa57c7c..e0db3cd 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -1,6 +1,6 @@
> >  obj-y +=3D boot.o sysbus-fdt.o
> >  obj-$(CONFIG_ARM_VIRT) +=3D virt.o
> > -obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
> > +obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o virt-acpi.o
> >  obj-$(CONFIG_DIGIC) +=3D digic_boards.o
> >  obj-$(CONFIG_EXYNOS4) +=3D exynos4_boards.o
> >  obj-$(CONFIG_HIGHBANK) +=3D highbank.o
> > diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
> > new file mode 100644
> > index 0000000..df8a02b
> > --- /dev/null
> > +++ b/hw/arm/virt-acpi.c
> > @@ -0,0 +1,111 @@
> > +/*
> > + *
> > + * Copyright (c) 2018 Intel Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITH=
OUT
> > + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long
> with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/range.h"
> > +#include "qapi/error.h"
> > +#include "exec/address-spaces.h"
> > +
> > +#include "hw/hw.h"
> > +#include "hw/hotplug.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/arm/virt.h"
> > +
> > +#include "hw/acpi/acpi.h"
> > +
> > +typedef struct VirtAcpiState {
> > +    SysBusDevice parent_obj;
> > +} VirtAcpiState;
> > +
> > +#define TYPE_VIRT_ACPI "virt-acpi"
> > +#define VIRT_ACPI(obj) \
> > +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> > +
> > +static const VMStateDescription vmstate_acpi =3D {
> > +    .name =3D "virt_acpi",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +};
> > +
> > +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> > +                                DeviceState *dev, Error **errp)
> > +{
> > +}
> > +
> > +static void virt_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > +                                          DeviceState *dev, Error
> **errp)
> > +{
> > +}
> > +
> > +static void virt_device_unplug_cb(HotplugHandler *hotplug_dev,
> > +                                  DeviceState *dev, Error **errp)
> > +{
> > +}
> > +
> > +static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > +{
> > +}
> > +
> > +static void virt_device_realize(DeviceState *dev, Error **errp)
> > +{
> > +}
> > +
> > +DeviceState *virt_acpi_init(void)
> > +{
> > +    return sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
> > +}
> > +
> > +static Property virt_acpi_properties[] =3D {
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void virt_acpi_class_init(ObjectClass *class, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(class);
> > +    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(class);
> > +    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_CLASS(class);
> > +
> > +    dc->desc =3D "ACPI";
> > +    dc->vmsd =3D &vmstate_acpi;
> > +    dc->props =3D virt_acpi_properties;
> > +    dc->realize =3D virt_device_realize;
> > +
> > +    hc->plug =3D virt_device_plug_cb;
> > +    hc->unplug_request =3D virt_device_unplug_request_cb;
> > +    hc->unplug =3D virt_device_unplug_cb;
> > +
> > +    adevc->send_event =3D virt_send_ged;
> > +}
> > +
> > +static const TypeInfo virt_acpi_info =3D {
> > +    .name          =3D TYPE_VIRT_ACPI,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(VirtAcpiState),
> > +    .class_init    =3D virt_acpi_class_init,
> > +    .interfaces =3D (InterfaceInfo[]) {
> > +        { TYPE_HOTPLUG_HANDLER },
> > +        { TYPE_ACPI_DEVICE_IF },
> > +        { }
> > +    }
> > +};
> > +
> > +static void virt_acpi_register_types(void)
> > +{
> > +    type_register_static(&virt_acpi_info);
> > +}
> > +
> > +type_init(virt_acpi_register_types)
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 507517c..6076167 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -145,6 +145,7 @@ typedef struct {
> >      OBJECT_CLASS_CHECK(VirtMachineClass, klass,
> TYPE_VIRT_MACHINE)
> >
> >  void virt_acpi_setup(VirtMachineState *vms);
> > +DeviceState *virt_acpi_init(void);
> >
> >  /* Return the number of used redistributor regions  */
> >  static inline int virt_gicv3_redist_region_count(VirtMachineState *vms=
)

