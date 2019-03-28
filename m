Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp680329wrx;
        Thu, 28 Mar 2019 07:15:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws1b1EFw47wmoVRsKDFiXq7NJHBvchedgVDBmKup/oEcnao60h+rH6t/REdce/3eD2iFVz
X-Received: by 2002:a5d:9742:: with SMTP id c2mr4662259ioo.215.1553782527788;
        Thu, 28 Mar 2019 07:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553782527; cv=none;
        d=google.com; s=arc-20160816;
        b=aeNe35kqYonWoF3SkcrQ6FOXxV5EIzpjoKsH2CTApFAKUXcRquI+s/0RBpg8SNY5fW
         AUSltmk42/JqBYDaSUN/fcfnM+oYE0Y2QNhsXWtti5qvCNnblYfd0TPQp3smk66fFvEo
         RuE+dzmSP3b5ZZAqhN+nSFiFwuPV1I5lTxsuTrEo1vH6/wrXmyaIxJ7LxlAbp9+Tpz0R
         f7sniwWIe1FE00tDgD5jOuI2GFydAvfdv4ZypkNaFTkX1sSRMR7GDQuAQ3VAHuUDSUl1
         ns+vNcsGh9+8dV4e93r9t8ZFqmtFvlnEBUqGnxxctne1/ViPvp4b8OjM6M/pX4tuPI/r
         2ftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=lPQ2pW2Es5vcoea80l27Xoliw/Y9aKw+hCtMt4AZDj4=;
        b=Db7B3VF3d2RRil1v0cbGgn0C9mCJFfyvF2pbV4FJ/o2YYsyeRKS+odJn6LMtjW3PZj
         BUsaIyH5aGDMcR4xeCD4sbQnhOFS9H8paPS9tuZnsqUalUZTTdP553lWs3IO8d6nQW/F
         cfN+8dgSLLl9TL2hIT01EgYN016XW8CBwta58VxBbcAuhExSQ17BGHv9YLhnP10GHb5G
         d1cpSOMpIdZRwc2bRGkEUAlwtWZjJDh4fXDwK2utE/D2g6RslR6fj93ZxOAuABE0XWIl
         +PFkUTo6SStOxkeH/vgqxZx/l2pcxniLlm6lo64lSDSFSdv6XHdSaNzq32Q4Eb73JBP1
         0LFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b133si1793373itc.28.2019.03.28.07.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 07:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9VoU-0000TW-V9
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 10:15:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9VoB-0000TJ-HT
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9Vo9-0005rH-Du
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:15:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9Vo9-0005qz-2g; Thu, 28 Mar 2019 10:15:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0A943087BAB;
	Thu, 28 Mar 2019 14:14:53 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF6B1001E6B;
	Thu, 28 Mar 2019 14:14:48 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-4-shameerali.kolothum.thodi@huawei.com>
Message-ID: <52334300-4029-d54d-91de-441d68188e70@redhat.com>
Date: Thu, 28 Mar 2019 15:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321104745.28068-4-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 28 Mar 2019 14:14:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI device
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lefbf/2JZWa4

Hi Shameer,

On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> This adds the skeleton to support an acpi device interface
> for HW-reduced acpi platforms via ACPI GED - Generic Event
> Device (ACPI v6.1 5.6.9).
> 
> This will be used by Arm/Virt to add hotplug support.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/acpi/Kconfig                        |  4 ++
>  hw/acpi/Makefile.objs                  |  1 +
>  hw/acpi/generic_event_device.c         | 72 ++++++++++++++++++++++++++++++++++
>  include/hw/acpi/generic_event_device.h | 29 ++++++++++++++
>  4 files changed, 106 insertions(+)
>  create mode 100644 hw/acpi/generic_event_device.c
>  create mode 100644 include/hw/acpi/generic_event_device.h
> 
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index eca3bee..01a8b41 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -27,3 +27,7 @@ config ACPI_VMGENID
>      bool
>      default y
>      depends on PC
> +
> +config ACPI_HW_REDUCED
> +    bool
> +    depends on ACPI
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 2d46e37..b753232 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
>  common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
>  common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
>  common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
> +common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
>  
>  common-obj-y += acpi_interface.o
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> new file mode 100644
> index 0000000..b21a551
> --- /dev/null
> +++ b/hw/acpi/generic_event_device.c
> @@ -0,0 +1,72 @@
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
> +#include "hw/sysbus.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/generic_event_device.h"
the files are named generic_event_device.c/h while the device is named
"virt-acpi". I would suggest to use the same naming as in nemu ie. ged
or acpi_ged.

If think you should clarify what is the exact scope of this device. The
patch title make think this is bound to be used only in machvirt (+ the
virt prefix used in numerous functions?). Is it also bound to be used by
other architectures?
> +
> +static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> +                                DeviceState *dev, Error **errp)
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
> +    dc->props = virt_acpi_properties;
> +    dc->realize = virt_device_realize;
> +
> +    hc->plug = virt_device_plug_cb;
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
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> new file mode 100644
> index 0000000..f314515
> --- /dev/null
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -0,0 +1,29 @@
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
Add a comment in the header introducing what is the role of this device?
link to GED spec? Explain the subset of the interfaces being implemented
by the device.
> +
> +#ifndef HW_ACPI_GED_H
> +#define HW_ACPI_GED_H
> +
> +#define TYPE_VIRT_ACPI "virt-acpi"
> +#define VIRT_ACPI(obj) \
> +    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> +
> +typedef struct VirtAcpiState {
> +    SysBusDevice parent_obj;
> +} VirtAcpiState;
> +
> +#endif
> 
