Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp653091wrt;
        Mon, 11 Mar 2019 06:31:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEQ0/OD+65/wNZVowaOjEmjqsk1l638DVnCndpRClbA0KNHU3xRGuBNh0FuYJ7Q0H3A10f
X-Received: by 2002:a81:a342:: with SMTP id a63mr25884225ywh.362.1552311102361;
        Mon, 11 Mar 2019 06:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552311102; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKczBMCckB0N59XF2bCF2dtpIMCHhGzh1ZGTa7DCe0Je1vlYwpLs1JBDt+dBqS8rAJ
         cLn+1kr+HQ1qG1+/p+8DSxGogNax+wkcf5ocN0/v0AMSjo9F+dQ2bF+pt0VFD13uViTe
         crLCnpI+6yqXghrGvI4oNoKD1k0qKa1gnEB7FjQmc4In6jDHfS+9cmWh4NpzKsEmhw0K
         WL+yoAatSmphjWYiFiSApxUPAdHSOhJptVpVnXtnKnI2SA3ONpC9imH2x9SScTWFJ0xX
         JQ5EuLLLD1GrPmdew9no1IeCU0+AK69tV0QNGF0z4l1rtm6IP5zuzQQdfVe5Eef7LfXB
         NuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ecPEzP6OjHa3B+XE/S1fyz+Y9oxKTFoc8x+daPmoGAg=;
        b=ipF4ktfeSX3wu/v+g4CE2R1DwQXATh61RV+LFaaSUKfUSxZhYF9PbOykUKCgeUZO/9
         BWo7zRdcabgJgHJWTNcH/EkEkUbyyQrhD2w3tS6lfwQqsR8isP6P73pGIrkRs8IFz6/j
         ToA8lf6ACo8bJVUyYOIbhnNA833wYiBhlodBSaIuMFHUfYGwI+alELyWS787s5E6AiXJ
         tAh+XkeqypStbO6ouvcRznXe8ZvAaITmrGfHmlTCDhmcw2UeIm4sinuarbQvycNrDL+3
         g0U9IAh6z27tRsWpBPNnbi0snKKbCLL3+P7OdCeuVVQTp6cpxAPlmvHK/N23ZjGuCQ6N
         2rUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si3128535ywj.463.2019.03.11.06.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 06:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3L1p-0003jw-OG
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 09:31:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3L11-0003gh-6G
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 09:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3L0w-0001fk-2P
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 09:30:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3L0m-0001b2-2m; Mon, 11 Mar 2019 09:30:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98CA9308A953;
	Mon, 11 Mar 2019 13:24:15 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8BC5D70E;
	Mon, 11 Mar 2019 13:24:13 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7cea0bf3-2eba-d649-fb33-a84648f856e0@redhat.com>
Date: Mon, 11 Mar 2019 14:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 11 Mar 2019 13:24:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mDT3oTMiQ6fm

Hi Shameer,

On 3/8/19 12:42 PM, Shameer Kolothum wrote:
> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> This is to provide an acpi device interface for Arm/virt.
> This will be used by Arm/Virt to add hotplug support via
> ACPI GED device.

I think this would deserves to mention this is a skeleton or,
wouldn't it make sense to merge the virt-acpi part of "hw/arm/virt: Add
ACPI support for device memory cold-plug" inside this patch; and keep
its instantiation in machvirt in a separate patch?

> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/Makefile.objs  |   2 +-
>  hw/arm/virt-acpi.c    | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++
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
do we really need the vmsd field as of now?
> +    dc->props = virt_acpi_properties;> +    dc->realize = virt_device_realize;
> +
> +    hc->plug = virt_device_plug_cb;
> +    hc->unplug_request = virt_device_unplug_request_cb;
> +    hc->unplug = virt_device_unplug_cb;
unplug_request and unplug still aren't implemented at the end of the
series. Maybe we can ignore them at the moment?
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
> 

Thanks

Eric
