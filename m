Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1773203wro;
        Fri, 15 Mar 2019 01:42:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9B5gmn5BVHvCfr7OVTBi+Ed9mNn7VHbIUw6DcZvXmTuLp0XTXZZESKEGhgL4CBe6BchD9
X-Received: by 2002:a1c:38b:: with SMTP id 133mr1259584wmd.26.1552639334986;
        Fri, 15 Mar 2019 01:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552639334; cv=none;
        d=google.com; s=arc-20160816;
        b=RQGiXiOfJp32wm8w0+5WYvXrLEf3s+N6nrF9mxRl9JCGqoIMFc1R0rL3vVLzbnCyQB
         ean86K06INr3ahOyxXLQeBx5b/feP35y9g+Z3NsXeoHFe0gCgDmd3qHGdLmxAJbLDXEU
         hQGYHFo6/m4sane8Ov6a2PEaeN05J96Czeuqo78jURU4JLu+2BKDGuDhW3TJGGt9vLho
         SLSi8Pp+MIkWYfKcVvWZ14XA4PXnqJSBPXozC3SV6Fevgz+49ve6HqtuFUDbykHw3ldy
         q7i3W1XpWWhW/TvOQqgMfNtVbmXRk4ZnJc5U3nIBJVWcXbmTAwgWYWHVioneVOiV0as1
         QPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=9vNl2KVn5H5h3L6vt2DyBjnSrZ6qXjh8b8ucZcKTlew=;
        b=DxxcWM9f2ry73B/IOTUho3VEVCd+ua8mRiyZtQw/jLJDSV+3FGiVQ9+OCkjtCLIq9j
         RRanEWmUvjThekd/EqQ3LA4LgtHMgUo0xfREC9nDaWppNMp5v5gRIjXeznbzCQR/cdsf
         RkNWab/lFy5JiWIq+6OjVH4wvcmPWSyW5nt27vAbUBEi5fh1Ewu+M1EJGO0DJ9diePyc
         fD4hbAuIXNwZY2F9DGjSO+L70FxIMLIuiIwN7AVKXGQ5G9m92O965sJ6Ay5bLCpB3b1K
         3MpXYeLIUYEHEXgZsc3JB403PKU+H7ostcAh410+xsCTXtehyBxzXSBKK/JeojhMLMyv
         5FXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si782461wma.17.2019.03.15.01.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 01:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4iPu-0005Bf-2C
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 04:42:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4iPj-0005BV-3U
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 04:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4iPb-00069y-HY
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 04:42:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h4iPb-00067Z-2W; Fri, 15 Mar 2019 04:41:55 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA7B6309703F;
	Fri, 15 Mar 2019 08:41:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9842D19C57;
	Fri, 15 Mar 2019 08:41:49 +0000 (UTC)
Date: Fri, 15 Mar 2019 09:41:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190315094148.7c3f09e2@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839314D1E@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
	<20190312164829.7f2c7c0f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839314D1E@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 15 Mar 2019 08:41:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKtEFaCpT3wR

On Thu, 14 Mar 2019 16:55:36 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Igor,
> 
> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 12 March 2019 15:48
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> > <xuwei5@huawei.com>
> > Subject: Re: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
> > 
> > On Fri, 8 Mar 2019 11:42:11 +0000
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > From: Samuel Ortiz <sameo@linux.intel.com>
> > >
> > > This is to provide an acpi device interface for Arm/virt.
> > > This will be used by Arm/Virt to add hotplug support via
> > > ACPI GED device.
> > >
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  hw/arm/Makefile.objs  |   2 +-
> > >  hw/arm/virt-acpi.c    | 111  
> > ++++++++++++++++++++++++++++++++++++++++++++++++++
> > 
> > does it have to be ARM specific?
> > could it be shared with future x86/virt? (if it could then it would be better to put
> > into hw/acpi/)
> > also considering it implements vitual 'GED' device
> > why not s/virt-acpi/generic-event-device/ ?  
> 
> I think that's a good idea to make it generic and I had a quick go at it.
> 
> But the problem I am facing is as soon as sysbus_create_simple() is called from
> virt_acpi_init(), the realize() function gets called before it sets the VirtAcpiState
> members.

Lets look at it from the other side, what are the reasons to use inherit device
from TYPE_SYS_BUS_DEVICE and use sysbus_create_simple()?

 
> This creates a problem as acpi_memory_hotplug_init() and acpi_ged_init() are
> invoked from the realize() and it needs to have the base address, irq etc set based
> on the platform.
> 
> I tried using the qdev_prop_set_*() as well, but it also fails saying attempt to set
> property after it was realized.
> 
> Not sure what is the best way to solve this other than introducing a global struct to
> hold the configuration.
Globals are frowned upon, we shouldn't do add more.

> 
> Please let me know.
> 
> Thanks,
> Shameer
>  
> >   
> > >  include/hw/arm/virt.h |   1 +
> > >  3 files changed, 113 insertions(+), 1 deletion(-)
> > >  create mode 100644 hw/arm/virt-acpi.c
> > >
> > > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > > index fa57c7c..e0db3cd 100644
> > > --- a/hw/arm/Makefile.objs
> > > +++ b/hw/arm/Makefile.objs
> > > @@ -1,6 +1,6 @@
> > >  obj-y += boot.o sysbus-fdt.o
> > >  obj-$(CONFIG_ARM_VIRT) += virt.o
> > > -obj-$(CONFIG_ACPI) += virt-acpi-build.o
> > > +obj-$(CONFIG_ACPI) += virt-acpi-build.o virt-acpi.o
> > >  obj-$(CONFIG_DIGIC) += digic_boards.o
> > >  obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
> > >  obj-$(CONFIG_HIGHBANK) += highbank.o
> > > diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
> > > new file mode 100644
> > > index 0000000..df8a02b
> > > --- /dev/null
> > > +++ b/hw/arm/virt-acpi.c
> > > @@ -0,0 +1,111 @@
> > > +/*
> > > + *
> > > + * Copyright (c) 2018 Intel Corporation
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2 or later, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of  
> > MERCHANTABILITY or  
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public  
> > License for  
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License along  
> > with  
> > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu/range.h"
> > > +#include "qapi/error.h"
> > > +#include "exec/address-spaces.h"
> > > +
> > > +#include "hw/hw.h"
> > > +#include "hw/hotplug.h"
> > > +#include "hw/sysbus.h"
> > > +#include "hw/arm/virt.h"
> > > +
> > > +#include "hw/acpi/acpi.h"
> > > +
> > > +typedef struct VirtAcpiState {
> > > +    SysBusDevice parent_obj;
> > > +} VirtAcpiState;
> > > +
> > > +#define TYPE_VIRT_ACPI "virt-acpi"
> > > +#define VIRT_ACPI(obj) \
> > > +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> > > +
> > > +static const VMStateDescription vmstate_acpi = {
> > > +    .name = "virt_acpi",
> > > +    .version_id = 1,
> > > +    .minimum_version_id = 1,
> > > +};
> > > +
> > > +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> > > +                                DeviceState *dev, Error **errp)
> > > +{
> > > +}
> > > +
> > > +static void virt_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > +                                          DeviceState *dev, Error  
> > **errp)  
> > > +{
> > > +}
> > > +
> > > +static void virt_device_unplug_cb(HotplugHandler *hotplug_dev,
> > > +                                  DeviceState *dev, Error **errp)
> > > +{
> > > +}
> > > +
> > > +static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > > +{
> > > +}
> > > +
> > > +static void virt_device_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +}
> > > +
> > > +DeviceState *virt_acpi_init(void)
> > > +{
> > > +    return sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
> > > +}
> > > +
> > > +static Property virt_acpi_properties[] = {
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > > +static void virt_acpi_class_init(ObjectClass *class, void *data)
> > > +{
> > > +    DeviceClass *dc = DEVICE_CLASS(class);
> > > +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(class);
> > > +    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> > > +
> > > +    dc->desc = "ACPI";
> > > +    dc->vmsd = &vmstate_acpi;
> > > +    dc->props = virt_acpi_properties;
> > > +    dc->realize = virt_device_realize;
> > > +
> > > +    hc->plug = virt_device_plug_cb;
> > > +    hc->unplug_request = virt_device_unplug_request_cb;
> > > +    hc->unplug = virt_device_unplug_cb;
> > > +
> > > +    adevc->send_event = virt_send_ged;
> > > +}
> > > +
> > > +static const TypeInfo virt_acpi_info = {
> > > +    .name          = TYPE_VIRT_ACPI,
> > > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > > +    .instance_size = sizeof(VirtAcpiState),
> > > +    .class_init    = virt_acpi_class_init,
> > > +    .interfaces = (InterfaceInfo[]) {
> > > +        { TYPE_HOTPLUG_HANDLER },
> > > +        { TYPE_ACPI_DEVICE_IF },
> > > +        { }
> > > +    }
> > > +};
> > > +
> > > +static void virt_acpi_register_types(void)
> > > +{
> > > +    type_register_static(&virt_acpi_info);
> > > +}
> > > +
> > > +type_init(virt_acpi_register_types)
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > index 507517c..6076167 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -145,6 +145,7 @@ typedef struct {
> > >      OBJECT_CLASS_CHECK(VirtMachineClass, klass,  
> > TYPE_VIRT_MACHINE)  
> > >
> > >  void virt_acpi_setup(VirtMachineState *vms);
> > > +DeviceState *virt_acpi_init(void);
> > >
> > >  /* Return the number of used redistributor regions  */
> > >  static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)  
> 

