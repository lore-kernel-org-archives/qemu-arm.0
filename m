Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp374765wrx;
        Mon, 1 Apr 2019 06:09:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw23OXzh+07QIN3nTkrrPUZ+8qSAXfZB/W2JMr3D3MsIuBX46N6P1LdonxRYHEa3eDNHqti
X-Received: by 2002:a81:6507:: with SMTP id z7mr51313028ywb.440.1554124140772;
        Mon, 01 Apr 2019 06:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554124140; cv=none;
        d=google.com; s=arc-20160816;
        b=AADxrYN8ePQqbiFexo4HF1wMd8ueI7mkJnhtxp7iL+XKdKmuuE+/J5ChtNgYoASc20
         Ruhne4YcMCGaordoRSvUlbI7b0ghF5f7WDpECISdciHVKBMVySJa6Oo/MOgGiCRmkkxU
         xIqsWw1kJs/C6SGDMOkncOto5GctMsIMrxiY/8kUOzYoxi2XRUluGuAbxEQF0G3uw0Wk
         kbsmM9lAVBFpWGSPqP5JBUy1aylAVm2BJiU3AEaJetDqeZqUa22GIXoXeStFO4EBNsLH
         N4sLLkvdBW/ZOhFsQzC6wai5KqgwDymC//lAImaTaEmSt8/Q8h+BQrS2B0vJgzjMhMEU
         L2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=N4ajceoMmWH7U5BkygySm6EwgvgiBHr30yQ+Fp/huYY=;
        b=KnxZyR+LUBa30PvFlVdSVDpDJwBe3TFQ/wVsOLYICzE3gfjusSqbzmKQniXjGDQDUt
         fzxYtFiOx3aLaB0kti2F++k74BXFfBTHN0ozQuHODekQ4v2I8eVidiNktEXAWJUEAdaD
         7QhcjFCarbcGubTSExMzWhi80eqtc94wIqYy7AXOZhU6N5idAsFyTquTMavA8mMhdNoT
         hDfNUGmKouUuc2aO/T/Qp+b5Lf3SNo1nIVkmhq+yzEZNy1bdfasmjJc5SI1H7cYxboW7
         tqlgtNN+LDtJzcafUXpjLJ30hzXWF4DvJg0vZuzohCKDGIvv65/sJJSbLJ1eM+L8X1ut
         ZhPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x62si6127618yba.59.2019.04.01.06.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 06:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAwgO-0002E2-6Z
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 09:09:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hAwgB-0002Dt-SD
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 09:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hAwgA-0007Zf-8S
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 09:08:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hAwg9-0007ZH-IQ; Mon, 01 Apr 2019 09:08:45 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A95F33001565;
	Mon,  1 Apr 2019 13:08:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63EF71001DD1;
	Mon,  1 Apr 2019 13:08:40 +0000 (UTC)
Date: Mon, 1 Apr 2019 15:08:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190401150836.11c86f26@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83933849C@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-4-shameerali.kolothum.thodi@huawei.com>
	<52334300-4029-d54d-91de-441d68188e70@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933849C@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 01 Apr 2019 13:08:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 03/10] hw/arm/virt: Add
 virtual ACPI device
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
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFJK5GDuJbIw

On Fri, 29 Mar 2019 11:22:02 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Auger Eric [mailto:eric.auger@redhat.com]
> > Sent: 28 March 2019 14:15
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> > qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
> > peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> > sameo@linux.intel.com; sebastien.boeuf@intel.com
> > Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> > Subject: Re: [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI device
> > 
> > Hi Shameer,
> > 
> > On 3/21/19 11:47 AM, Shameer Kolothum wrote:  
> > > From: Samuel Ortiz <sameo@linux.intel.com>
> > >
> > > This adds the skeleton to support an acpi device interface for
> > > HW-reduced acpi platforms via ACPI GED - Generic Event Device (ACPI
> > > v6.1 5.6.9).
> > >
> > > This will be used by Arm/Virt to add hotplug support.
> > >
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  hw/acpi/Kconfig                        |  4 ++
> > >  hw/acpi/Makefile.objs                  |  1 +
> > >  hw/acpi/generic_event_device.c         | 72  
> > ++++++++++++++++++++++++++++++++++  
> > >  include/hw/acpi/generic_event_device.h | 29 ++++++++++++++
> > >  4 files changed, 106 insertions(+)
> > >  create mode 100644 hw/acpi/generic_event_device.c  create mode  
> > 100644  
> > > include/hw/acpi/generic_event_device.h
> > >
> > > diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig index eca3bee..01a8b41
> > > 100644
> > > --- a/hw/acpi/Kconfig
> > > +++ b/hw/acpi/Kconfig
> > > @@ -27,3 +27,7 @@ config ACPI_VMGENID
> > >      bool
> > >      default y
> > >      depends on PC
> > > +
> > > +config ACPI_HW_REDUCED
> > > +    bool
> > > +    depends on ACPI
> > > diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs index
> > > 2d46e37..b753232 100644
> > > --- a/hw/acpi/Makefile.objs
> > > +++ b/hw/acpi/Makefile.objs
> > > @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) +=
> > > memory_hotplug.o
> > >  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
> > >  common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
> > >  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
> > > +common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
> > >  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
> > >
> > >  common-obj-y += acpi_interface.o
> > > diff --git a/hw/acpi/generic_event_device.c
> > > b/hw/acpi/generic_event_device.c new file mode 100644 index
> > > 0000000..b21a551
> > > --- /dev/null
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -0,0 +1,72 @@
> > > +/*
> > > + *
> > > + * Copyright (c) 2018 Intel Corporation
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > +modify it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2 or later, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but
> > > +WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of  
> > MERCHANTABILITY  
> > > +or
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> > > +License for
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License
> > > +along with
> > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "hw/sysbus.h"
> > > +#include "hw/acpi/acpi.h"
> > > +#include "hw/acpi/generic_event_device.h"  
> > the files are named generic_event_device.c/h while the device is named
> > "virt-acpi". I would suggest to use the same naming as in nemu ie. ged or
> > acpi_ged.  
> 
> Agree. The naming is a bit confusing. In nemu they have a separate virt-acpi
> dev which makes use of GED. Here, we are rolling those two into one. I am
> still not very sure whether we should leave it as virt-acpi, because the actual
> device on which this is implemented can be changed eg, GED vs GPIO. 

I probably lacking context here, could you clarify and maybe compare
differences between x86 and ARM implementations and why it should be different devices?


> > If think you should clarify what is the exact scope of this device. The patch title
> > make think this is bound to be used only in machvirt (+ the virt prefix used in
> > numerous functions?). Is it also bound to be used by other architectures?  
> > > +
> > > +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> > > +                                DeviceState *dev, Error **errp) { }
> > > +
> > > +static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > > +{ }
> > > +
> > > +static void virt_device_realize(DeviceState *dev, Error **errp) { }
> > > +
> > > +static Property virt_acpi_properties[] = {
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > > +static void virt_acpi_class_init(ObjectClass *class, void *data) {
> > > +    DeviceClass *dc = DEVICE_CLASS(class);
> > > +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(class);
> > > +    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> > > +
> > > +    dc->desc = "ACPI";
> > > +    dc->props = virt_acpi_properties;
> > > +    dc->realize = virt_device_realize;
> > > +
> > > +    hc->plug = virt_device_plug_cb;
> > > +
> > > +    adevc->send_event = virt_send_ged; }
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
> > > +static void virt_acpi_register_types(void) {
> > > +    type_register_static(&virt_acpi_info);
> > > +}
> > > +
> > > +type_init(virt_acpi_register_types)
> > > diff --git a/include/hw/acpi/generic_event_device.h
> > > b/include/hw/acpi/generic_event_device.h
> > > new file mode 100644
> > > index 0000000..f314515
> > > --- /dev/null
> > > +++ b/include/hw/acpi/generic_event_device.h
> > > @@ -0,0 +1,29 @@
> > > +/*
> > > + *
> > > + * Copyright (c) 2018 Intel Corporation
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > +modify it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2 or later, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but
> > > +WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of  
> > MERCHANTABILITY  
> > > +or
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> > > +License for
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License
> > > +along with
> > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > + */  
> > Add a comment in the header introducing what is the role of this device?
> > link to GED spec? Explain the subset of the interfaces being implemented by
> > the device.  
> 
> Ok. I have added comments to that effect in patch #10, but I think I will make it
> clear here as well.
> 
> Cheers,
> Shameer
> 
> > > +
> > > +#ifndef HW_ACPI_GED_H
> > > +#define HW_ACPI_GED_H
> > > +
> > > +#define TYPE_VIRT_ACPI "virt-acpi"
> > > +#define VIRT_ACPI(obj) \
> > > +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> > > +
> > > +typedef struct VirtAcpiState {
> > > +    SysBusDevice parent_obj;
> > > +} VirtAcpiState;
> > > +
> > > +#endif
> > >  

