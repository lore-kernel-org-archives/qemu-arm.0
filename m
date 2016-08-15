Received: by 10.25.21.156 with SMTP id 28csp1502789lfv;
        Mon, 15 Aug 2016 09:05:52 -0700 (PDT)
X-Received: by 10.55.93.71 with SMTP id r68mr34930587qkb.131.1471277152773;
        Mon, 15 Aug 2016 09:05:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x129si12796311qkd.159.2016.08.15.09.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 09:05:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZKOe-0007tI-5Z
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 12:05:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZKMI-0006P5-4N
	for qemu-devel@nongnu.org; Mon, 15 Aug 2016 12:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZKMF-0002KG-Eu
	for qemu-devel@nongnu.org; Mon, 15 Aug 2016 12:03:25 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZKMF-0002Jy-97
	for qemu-devel@nongnu.org; Mon, 15 Aug 2016 12:03:23 -0400
Received: by mail-ua0-x22f.google.com with SMTP id k90so79667829uak.1
	for <qemu-devel@nongnu.org>; Mon, 15 Aug 2016 09:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9xCyaftqytL/I2Ti34GCZQozDU9vtpwgpKkYa2DHNAw=;
	b=gm6Jq1/tc4ZhJKpMDsquGb34ROSKHpjfhk+t0qRsm/em8ZRX9TVFdSiuiDj4/95zXw
	gpx27Ed2/06TxwO5mDxxouKl45r+oRlY0gjoiSypGTv88Pqdive87OgYosWwCdSzEWIh
	VGyIZ1UTCn7citIa40MDmbuN1ULcVjDfWVah8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9xCyaftqytL/I2Ti34GCZQozDU9vtpwgpKkYa2DHNAw=;
	b=aON3mTxm6B9/Pq9OXsOPBSLg+uzpGPRbWusDQwKOsuTHC0BLmX9U8MG7VCESVkfHi+
	8XkYLWdVD+FjfYr/LAYvJFhrq/r5sskSxQD7GdpMyUaz0hrA1l8RX3E7EnnGG0p9xqPo
	WpWLie0aXcdCHrQpBciEhCtrQywa47k9Cbj7h8/lz0BpVkTb6SvNxN9VnWbgLg3Y4esB
	85TPExrAAPrFZa3O8hUs8QzgA/rE0zln+8XsDO1dCnt0p2cxzcxpo5Imal7Uk8zkSxmA
	sfPa6hsvWZ/paKVjX46hvvnaRfS9RG1pt/hm03i92DO6QikS6UTCO3L0+8Avm5II3cuC
	fnsg==
X-Gm-Message-State: AEkooutFBXriWU197hSS6E3O0jn2bD7A52bQGpYHxin+LScvN/x1nf8lvtMfqzNs1sOozTg06zNkeVyqse8DPAQ5
X-Received: by 10.31.81.134 with SMTP id f128mr169782vkb.139.1471277002430;
	Mon, 15 Aug 2016 09:03:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Mon, 15 Aug 2016 09:03:02 -0700 (PDT)
In-Reply-To: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2016 17:03:02 +0100
Message-ID: <CAFEAcA-d2x2L+ddNPJmGSG82HtvXZzOpTYffVzr49c03yJT+iw@mail.gmail.com>
To: Shanker Donthineni <shankerd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-devel] [PATCH v2] hw/vfio/platform: Add Qualcomm
 Technologies, Inc HIDMA device support
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
Cc: Philip Elcan <pelcan@codeaurora.org>, Vikram Sethi <vikrams@codeaurora.org>,
	qemu-devel <qemu-devel@nongnu.org>, Kaya Sinan <okaya@codeaurora.org>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSn5m5h1GVRb

Just cc'ing Eric on his new email address...

thanks
-- PMM

On 14 August 2016 at 16:42, Shanker Donthineni <shankerd@codeaurora.org> wrote:
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
> +
> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
> +    assert(reg_attr);
> +    for (i = 0; i < vbasedev->num_regions; i++) {
> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
> +        reg_attr[2 * i + 1] = cpu_to_be32(
> +                                memory_region_size(vdev->regions[i]->mem));
> +    }
> +    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
> +                     vbasedev->num_regions * 2 * sizeof(uint32_t));
> +
> +    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
> +    assert(irq_attr);
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
> --
> Qualcomm Datacenter Technologies, Inc. on behalf of the Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
>
