Received: by 10.25.21.156 with SMTP id 28csp226774lfv;
        Thu, 18 Aug 2016 02:37:38 -0700 (PDT)
X-Received: by 10.55.217.134 with SMTP id q6mr1284759qkl.271.1471513058556;
        Thu, 18 Aug 2016 02:37:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a195si689969qkc.87.2016.08.18.02.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 02:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baJla-0004KY-0n
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 05:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1baJlV-0004KT-PC
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 05:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1baJlR-0001xr-Q4
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 05:37:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1baJlR-0001xe-I5; Thu, 18 Aug 2016 05:37:29 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9413F1B01;
	Thu, 18 Aug 2016 09:37:28 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-91.ams2.redhat.com [10.36.4.91])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u7I9bO3a010424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Aug 2016 05:37:25 -0400
To: Shanker Donthineni <shankerd@codeaurora.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
Date: Thu, 18 Aug 2016 11:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 Aug 2016 09:37:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/vfio/platform: Add
 Qualcomm Technologies, Inc HIDMA device support
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
Cc: Philip Elcan <pelcan@codeaurora.org>, Vikram Sethi <vikrams@codeaurora.org>,
	Eric Auger <eric.auger@linaro.org>, Alexander Graf <agraf@suse.de>,
	Kaya Sinan <okaya@codeaurora.org>,
	Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jWSVnAlgmvXn

Hi Shanker,

Adding Alex in CC for (*)

On 14/08/2016 17:42, Shanker Donthineni wrote:
> This patch introduces the Qualcomm Technologies, Inc HIDMA device and
> allows passthrough the host HIDMA device to a guest machine using the
> vfio-platform framework.
> 
> A platform device tree node is created for the guest machine which
> contains the compat string 'qcom,hidma-1.0', mmio regions, active high
> SPIs, and an optional property dma-coherent.
> 
> Signed-off-by: Vikram Sethi <vikrams@codeaurora.org>
> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
> ---
> Changes sicnce v1:
>   combined patches [v1 1/2] and [v1 2/2].
Some general comments:
- I preferred the previous series organization where we had the creation
of the VFIO device first and its sysbus-fdt dynamic instantiation in a
separate patch.

Peter requested sysbus-fdt stops growing and advised to split the fine
into generic helpers and specific dt creation functions in separate
files. This sounds the right moment to do it with looming new VFIO devices.

(*) Also I am now reconsidering the relevance of creating specific VFIO
devices per compat string. At the begining of VFIO QEMU integration
history we made that choice, advised by Alex (Graf), considering the
QEMU VFIO device could not be generic. With a little more experience now
we could see the specialization is currently done in the dt creation
function (sysbus-fdt) and in the kernel reset module. So I would now
advocate using a non abstract base VFIO device that could be
instantiated passing its compat string as property. Creating
hw/vfio/qcom-hidma.c and include/hw/vfio/vfio-qcom-hidma.h then would
become useless. Alex, what is your feeling now?

I think the split of sysbus-fdt and (*) - if approoved -  shall be
considered before introducing a new QEMU VFIO device. Are you willing to
work on it?

>   added '#include "qemu/osdep.h'.
>   changed compact string to 'qcom,hidma-1.0' to match the host driver.
>   set dma-coherent property based on the IOMMU coherency status.
> 
>  hw/arm/sysbus-fdt.c               | 67 +++++++++++++++++++++++++++++++++++++++
>  hw/vfio/Makefile.objs             |  1 +
>  hw/vfio/qcom-hidma.c              | 58 +++++++++++++++++++++++++++++++++
>  include/hw/vfio/vfio-qcom-hidma.h | 50 +++++++++++++++++++++++++++++
>  4 files changed, 176 insertions(+)
>  create mode 100644 hw/vfio/qcom-hidma.c
>  create mode 100644 include/hw/vfio/vfio-qcom-hidma.h
> 
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 5debb33..bdf8cbb 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -27,6 +27,7 @@
>  #include "qemu-common.h"
>  #ifdef CONFIG_LINUX
>  #include <linux/vfio.h>
> +#include <sys/ioctl.h>
>  #endif
>  #include "hw/arm/sysbus-fdt.h"
>  #include "qemu/error-report.h"
> @@ -36,6 +37,7 @@
>  #include "hw/vfio/vfio-platform.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>  #include "hw/vfio/vfio-amd-xgbe.h"
> +#include "hw/vfio/vfio-qcom-hidma.h"
>  #include "hw/arm/fdt.h"
>  
>  /*
> @@ -262,6 +264,70 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
>      return 0;
>  }
>  
> +/**
> + * add_qcom_hidma_fdt_node
> + *
> + * Generates a simple node with following properties:
> + * compatible string, regs, active-high interrupts, and optional dma-coherent
> + */
> +static int add_qcom_hidma_fdt_node(SysBusDevice *sbdev, void *opaque)
> +{
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
> +    struct VFIOGroup *group = vdev->vbasedev.group;
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +    PlatformBusFDTData *data = opaque;
> +    const char *parent_node = data->pbus_node_name;
> +    PlatformBusDevice *pbus = data->pbus;
> +    uint32_t *irq_attr, *reg_attr;
> +    uint64_t mmio_base, irq_number;
> +    void *fdt = data->fdt;
> +    int compat_str_len, i, ret;
> +    char *nodename;
> +
> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
> +                               vbasedev->name, mmio_base);
> +    assert(nodename);
although not very explicit in the glib documentation, I think
g_strdup_printf already handles OOM errors so assert should be safely
removed I think.
> +    qemu_fdt_add_subnode(fdt, nodename);
> +
> +    compat_str_len = strlen(vdev->compat) + 1;
> +    qemu_fdt_setprop(fdt, nodename, "compatible",
> +                          vdev->compat, compat_str_len);
> +
> +    /* Check if the DMA cache coherency was enabled in IOMMU */
> +    ret = ioctl(group->container->fd, VFIO_CHECK_EXTENSION, VFIO_DMA_CC_IOMMU);
> +    if (ret > 0) {
> +        qemu_fdt_setprop(fdt, nodename, "dma-coherent", "", 0);
> +    }
This checks the IOMMU enforces DMA cache coherence -> ie. all the vfio
groups support IOMMU_CACHE property -> depends on whether the host bus
supports cache coherency. This does not tell whether the host device is
dma-capable.

In current xgmac dt node creation function I only check the host dt node
features the dma-coherent property. Maybe we should check both the
device and the bus support the capability? Can we have the dma-coherent
property set in the host dt device node while the bus does not support it?

> +
> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
> +    assert(reg_attr);
same here
> +    for (i = 0; i < vbasedev->num_regions; i++) {
> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
> +        reg_attr[2 * i + 1] = cpu_to_be32(
> +                                memory_region_size(vdev->regions[i]->mem));
> +    }
We evoked using a helper function to minimize the code duplication
between devices.
> +    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
> +                     vbasedev->num_regions * 2 * sizeof(uint32_t));
> +
> +    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
> +    assert(irq_attr);
same here

Thanks

Eric
> +    for (i = 0; i < vbasedev->num_irqs; i++) {
> +        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
> +                         + data->irq_start;
> +        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
> +        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
> +        irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +    }
> +    qemu_fdt_setprop(fdt, nodename, "interrupts",
> +                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
> +    g_free(irq_attr);
> +    g_free(reg_attr);
> +    g_free(nodename);
> +    return 0;
> +}
> +
>  /* AMD xgbe properties whose values are copied/pasted from host */
>  static HostProperty amd_xgbe_copied_properties[] = {
>      {"compatible", false},
> @@ -420,6 +486,7 @@ static const NodeCreationPair add_fdt_node_functions[] = {
>  #ifdef CONFIG_LINUX
>      {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
>      {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
> +    {TYPE_VFIO_QCOM_HIDMA, add_qcom_hidma_fdt_node},
>  #endif
>      {"", NULL}, /* last element */
>  };
> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
> index c25e32b..ac38c8f 100644
> --- a/hw/vfio/Makefile.objs
> +++ b/hw/vfio/Makefile.objs
> @@ -5,4 +5,5 @@ obj-$(CONFIG_SOFTMMU) += platform.o
>  obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
>  obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
>  obj-$(CONFIG_SOFTMMU) += spapr.o
> +obj-$(CONFIG_SOFTMMU) += qcom-hidma.o
>  endif
> diff --git a/hw/vfio/qcom-hidma.c b/hw/vfio/qcom-hidma.c
> new file mode 100644
> index 0000000..ddb3c34
> --- /dev/null
> +++ b/hw/vfio/qcom-hidma.c
> @@ -0,0 +1,58 @@
> +/*
> + * Qualcomm Technologies, Inc VFIO HiDMA platform device
> + *
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +#include "qemu/osdep.h"
> +#include "hw/vfio/vfio-qcom-hidma.h"
> +
> +static void qcom_hidma_realize(DeviceState *dev, Error **errp)
> +{
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
> +    VFIOQcomHidmaDeviceClass *k = VFIO_QCOM_HIDMA_DEVICE_GET_CLASS(dev);
> +
> +    vdev->compat = g_strdup("qcom,hidma-1.0");
> +
> +    k->parent_realize(dev, errp);
> +}
> +
> +static const VMStateDescription vfio_platform_vmstate = {
> +    .name = TYPE_VFIO_QCOM_HIDMA,
> +    .unmigratable = 1,
> +};
> +
> +static void vfio_qcom_hidma_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VFIOQcomHidmaDeviceClass *vcxc = VFIO_QCOM_HIDMA_DEVICE_CLASS(klass);
> +
> +    vcxc->parent_realize = dc->realize;
> +    dc->realize = qcom_hidma_realize;
> +    dc->desc = "VFIO QCOM HIDMA";
> +    dc->vmsd = &vfio_platform_vmstate;
> +}
> +
> +static const TypeInfo vfio_qcom_hidma_dev_info = {
> +    .name = TYPE_VFIO_QCOM_HIDMA,
> +    .parent = TYPE_VFIO_PLATFORM,
> +    .instance_size = sizeof(VFIOQcomHidmaDevice),
> +    .class_init = vfio_qcom_hidma_class_init,
> +    .class_size = sizeof(VFIOQcomHidmaDeviceClass),
> +};
> +
> +static void register_qcom_hidma_dev_type(void)
> +{
> +    type_register_static(&vfio_qcom_hidma_dev_info);
> +}
> +
> +type_init(register_qcom_hidma_dev_type)
> diff --git a/include/hw/vfio/vfio-qcom-hidma.h b/include/hw/vfio/vfio-qcom-hidma.h
> new file mode 100644
> index 0000000..23cd66c
> --- /dev/null
> +++ b/include/hw/vfio/vfio-qcom-hidma.h
> @@ -0,0 +1,50 @@
> +/*
> + * Qualcomm Technologies, Inc VFIO HiDMA platform device
> + *
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef HW_VFIO_VFIO_QCOM_HIDMA_H
> +#define HW_VFIO_VFIO_QCOM_HIDMA_H
> +
> +#include "hw/vfio/vfio-platform.h"
> +
> +#define TYPE_VFIO_QCOM_HIDMA "vfio-qcom-hidma"
> +
> +/**
> + * This device exposes:
> + * - MMIO regions corresponding to its register space
> + * - Active high IRQs
> + * - Optional property 'dma-coherent'
> + */
> +typedef struct VFIOQcomHidmaDevice {
> +    VFIOPlatformDevice vdev;
> +} VFIOQcomHidmaDevice;
> +
> +typedef struct VFIOQcomHidmaDeviceClass {
> +    /*< private >*/
> +    VFIOPlatformDeviceClass parent_class;
> +    /*< public >*/
> +    DeviceRealize parent_realize;
> +} VFIOQcomHidmaDeviceClass;
> +
> +#define VFIO_QCOM_HIDMA_DEVICE(obj) \
> +     OBJECT_CHECK(VFIOQcomHidmaDevice, (obj), TYPE_VFIO_QCOM_HIDMA)
> +#define VFIO_QCOM_HIDMA_DEVICE_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(VFIOQcomHidmaDeviceClass, (klass), \
> +                        TYPE_VFIO_QCOM_HIDMA)
> +#define VFIO_QCOM_HIDMA_DEVICE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(VFIOQcomHidmaDeviceClass, (obj), \
> +                      TYPE_VFIO_QCOM_HIDMA)
> +
> +#endif
> 
