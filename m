Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp637693wrs;
        Tue, 12 Mar 2019 08:49:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznXsR+AFaAqhmscXdIXzfDTJ5rIMkQFXGC2GovukpGLBqbaugGYzJIa+nawxtVzTeoUgkE
X-Received: by 2002:a25:5f01:: with SMTP id t1mr33418803ybb.286.1552405741530;
        Tue, 12 Mar 2019 08:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552405741; cv=none;
        d=google.com; s=arc-20160816;
        b=OMms0LrqImLfSGWk4Be//mm3k8j6QBf5eNH52yNL86L/k7/aCGktcl8gQBPBiV4nMY
         3aRFimTY0MufYUgjm2ICpp0tCWFE12jZ9sJg37ZIYw2TBQKy0sNtyZHMlRf8o9wqvjBp
         HnbMzziCGNrwkrh1aydvpRllsyQCpljk48c/LKl3t924wWY81ReS5sPz6lq8ZQbw4aM8
         /rJ7cGy1hPWbk00gO34fgYnN/LCKU1p1Kf0U8EwutZH7/waQql9fUQgrdcgyCk+YQcu3
         2pYX3EFmSVuCpVckYPQ/MOpcPaU4F8OXrg1bSqdlkHaCauXHJnuGJkt46qcx9zfkmc47
         v3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=VxHDpxmzrX8cKTFvegH1zdQEGARWMEM5vSv5pSEqLmg=;
        b=cWXfiZpXqmqnsnrqN+muzaVHA+dHJwhar1uevoxEE4K2T4GAU4MRfjU6AgGJinn+Vq
         TvytvjbC1Ghhy+V7PgE9DO/pl3tZYZQTq5+3d25AIuHrNKkij5ui58gTUqzxTvyv1m6X
         9R31sXZO2fclc0iqIt79tS/p/cVdmzkWLq8iPJnesAO+YnMaHWm+ua74FzDEf8mCTUru
         Nisca3RTkqdXKIYQDx5RpnVXkghiWfOsmPwgEr+RlrtMRbv81DG9Spf6b/J09xPQd6/X
         isITMISjVXTk2R5DjSUeAY8MhKDaH/gF99zkoDxfUzkBsb7iZDTqINoiAEp5SG0gUQOj
         hMzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s45si5066821ybe.365.2019.03.12.08.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 08:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3jeG-0004LS-VR
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 11:49:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3je0-0004JY-1H
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 11:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3jdy-0003QD-LS
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 11:48:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3jdy-0003Pr-9v; Tue, 12 Mar 2019 11:48:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D55142DA998;
	Tue, 12 Mar 2019 15:48:40 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ED566017D;
	Tue, 12 Mar 2019 15:48:30 +0000 (UTC)
Date: Tue, 12 Mar 2019 16:48:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190312164829.7f2c7c0f@redhat.com>
In-Reply-To: <20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 12 Mar 2019 15:48:41 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, sebastien.boeuf@intel.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Saa0nl/mmtyK

On Fri, 8 Mar 2019 11:42:11 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> This is to provide an acpi device interface for Arm/virt.
> This will be used by Arm/Virt to add hotplug support via
> ACPI GED device.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/Makefile.objs  |   2 +-
>  hw/arm/virt-acpi.c    | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++

does it have to be ARM specific?
could it be shared with future x86/virt? (if it could then it would be better to put into hw/acpi/)
also considering it implements vitual 'GED' device
why not s/virt-acpi/generic-event-device/ ?


>  include/hw/arm/virt.h |   1 +
>  3 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/virt-acpi.c
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index fa57c7c..e0db3cd 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -1,6 +1,6 @@
>  obj-y += boot.o sysbus-fdt.o
>  obj-$(CONFIG_ARM_VIRT) += virt.o
> -obj-$(CONFIG_ACPI) += virt-acpi-build.o
> +obj-$(CONFIG_ACPI) += virt-acpi-build.o virt-acpi.o
>  obj-$(CONFIG_DIGIC) += digic_boards.o
>  obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
>  obj-$(CONFIG_HIGHBANK) += highbank.o
> diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
> new file mode 100644
> index 0000000..df8a02b
> --- /dev/null
> +++ b/hw/arm/virt-acpi.c
> @@ -0,0 +1,111 @@
> +/*
> + *
> + * Copyright (c) 2018 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/range.h"
> +#include "qapi/error.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/hw.h"
> +#include "hw/hotplug.h"
> +#include "hw/sysbus.h"
> +#include "hw/arm/virt.h"
> +
> +#include "hw/acpi/acpi.h"
> +
> +typedef struct VirtAcpiState {
> +    SysBusDevice parent_obj;
> +} VirtAcpiState;
> +
> +#define TYPE_VIRT_ACPI "virt-acpi"
> +#define VIRT_ACPI(obj) \
> +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> +
> +static const VMStateDescription vmstate_acpi = {
> +    .name = "virt_acpi",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +};
> +
> +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> +                                DeviceState *dev, Error **errp)
> +{
> +}
> +
> +static void virt_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                          DeviceState *dev, Error **errp)
> +{
> +}
> +
> +static void virt_device_unplug_cb(HotplugHandler *hotplug_dev,
> +                                  DeviceState *dev, Error **errp)
> +{
> +}
> +
> +static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> +{
> +}
> +
> +static void virt_device_realize(DeviceState *dev, Error **errp)
> +{
> +}
> +
> +DeviceState *virt_acpi_init(void)
> +{
> +    return sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
> +}
> +
> +static Property virt_acpi_properties[] = {
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void virt_acpi_class_init(ObjectClass *class, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(class);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(class);
> +    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> +
> +    dc->desc = "ACPI";
> +    dc->vmsd = &vmstate_acpi;
> +    dc->props = virt_acpi_properties;
> +    dc->realize = virt_device_realize;
> +
> +    hc->plug = virt_device_plug_cb;
> +    hc->unplug_request = virt_device_unplug_request_cb;
> +    hc->unplug = virt_device_unplug_cb;
> +
> +    adevc->send_event = virt_send_ged;
> +}
> +
> +static const TypeInfo virt_acpi_info = {
> +    .name          = TYPE_VIRT_ACPI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(VirtAcpiState),
> +    .class_init    = virt_acpi_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_HOTPLUG_HANDLER },
> +        { TYPE_ACPI_DEVICE_IF },
> +        { }
> +    }
> +};
> +
> +static void virt_acpi_register_types(void)
> +{
> +    type_register_static(&virt_acpi_info);
> +}
> +
> +type_init(virt_acpi_register_types)
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 507517c..6076167 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -145,6 +145,7 @@ typedef struct {
>      OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
>  
>  void virt_acpi_setup(VirtMachineState *vms);
> +DeviceState *virt_acpi_init(void);
>  
>  /* Return the number of used redistributor regions  */
>  static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)

