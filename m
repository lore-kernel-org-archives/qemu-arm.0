Received: by 10.25.21.156 with SMTP id 28csp1539958lfv;
        Mon, 15 Aug 2016 10:28:50 -0700 (PDT)
X-Received: by 10.55.100.21 with SMTP id y21mr32419246qkb.274.1471282130429;
        Mon, 15 Aug 2016 10:28:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v185si13055585qkc.105.2016.08.15.10.28.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 10:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZLgv-0007Hc-NL
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 13:28:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1bZL3J-0002jU-Ig
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1bZL3F-0002OK-A3
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:47:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>)
	id 1bZL3F-0002OB-01; Mon, 15 Aug 2016 12:47:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 057F061C6C; Mon, 15 Aug 2016 16:47:47 +0000 (UTC)
Received: from [10.228.68.89] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: okaya@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4545D61844;
	Mon, 15 Aug 2016 16:47:45 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
	<CAFEAcA-d2x2L+ddNPJmGSG82HtvXZzOpTYffVzr49c03yJT+iw@mail.gmail.com>
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <3266d53f-49f0-d282-76d4-981437905211@codeaurora.org>
Date: Mon, 15 Aug 2016 12:47:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-d2x2L+ddNPJmGSG82HtvXZzOpTYffVzr49c03yJT+iw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
X-Mailman-Approved-At: Mon, 15 Aug 2016 13:28:44 -0400
Subject: Re: [Qemu-arm] [PATCH v2] hw/vfio/platform: Add Qualcomm
 Technologies, Inc HIDMA device support
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
	qemu-devel <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OFREuaBJfY33

On 8/15/2016 12:03 PM, Peter Maydell wrote:
> Just cc'ing Eric on his new email address...
> 
> thanks
> -- PMM
> 
> On 14 August 2016 at 16:42, Shanker Donthineni <shankerd@codeaurora.org> wrote:
>> This patch introduces the Qualcomm Technologies, Inc HIDMA device and
>> allows passthrough the host HIDMA device to a guest machine using the
>> vfio-platform framework.
>>
>> A platform device tree node is created for the guest machine which
>> contains the compat string 'qcom,hidma-1.0', mmio regions, active high
>> SPIs, and an optional property dma-coherent.
>>
>> Signed-off-by: Vikram Sethi <vikrams@codeaurora.org>
>> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
>> ---
>> Changes sicnce v1:
>>   combined patches [v1 1/2] and [v1 2/2].
>>   added '#include "qemu/osdep.h'.
>>   changed compact string to 'qcom,hidma-1.0' to match the host driver.
>>   set dma-coherent property based on the IOMMU coherency status.
>>
>>  hw/arm/sysbus-fdt.c               | 67 +++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/Makefile.objs             |  1 +
>>  hw/vfio/qcom-hidma.c              | 58 +++++++++++++++++++++++++++++++++
>>  include/hw/vfio/vfio-qcom-hidma.h | 50 +++++++++++++++++++++++++++++
>>  4 files changed, 176 insertions(+)
>>  create mode 100644 hw/vfio/qcom-hidma.c
>>  create mode 100644 include/hw/vfio/vfio-qcom-hidma.h
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index 5debb33..bdf8cbb 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -27,6 +27,7 @@
>>  #include "qemu-common.h"
>>  #ifdef CONFIG_LINUX
>>  #include <linux/vfio.h>
>> +#include <sys/ioctl.h>
>>  #endif
>>  #include "hw/arm/sysbus-fdt.h"
>>  #include "qemu/error-report.h"
>> @@ -36,6 +37,7 @@
>>  #include "hw/vfio/vfio-platform.h"
>>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>>  #include "hw/vfio/vfio-amd-xgbe.h"
>> +#include "hw/vfio/vfio-qcom-hidma.h"
>>  #include "hw/arm/fdt.h"
>>
>>  /*
>> @@ -262,6 +264,70 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
>>      return 0;
>>  }
>>
>> +/**
>> + * add_qcom_hidma_fdt_node
>> + *
>> + * Generates a simple node with following properties:
>> + * compatible string, regs, active-high interrupts, and optional dma-coherent
>> + */
>> +static int add_qcom_hidma_fdt_node(SysBusDevice *sbdev, void *opaque)
>> +{
>> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
>> +    struct VFIOGroup *group = vdev->vbasedev.group;
>> +    VFIODevice *vbasedev = &vdev->vbasedev;
>> +    PlatformBusFDTData *data = opaque;
>> +    const char *parent_node = data->pbus_node_name;
>> +    PlatformBusDevice *pbus = data->pbus;
>> +    uint32_t *irq_attr, *reg_attr;
>> +    uint64_t mmio_base, irq_number;
>> +    void *fdt = data->fdt;
>> +    int compat_str_len, i, ret;
>> +    char *nodename;
>> +
>> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
>> +    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
>> +                               vbasedev->name, mmio_base);
>> +    assert(nodename);
>> +    qemu_fdt_add_subnode(fdt, nodename);
>> +
>> +    compat_str_len = strlen(vdev->compat) + 1;
>> +    qemu_fdt_setprop(fdt, nodename, "compatible",
>> +                          vdev->compat, compat_str_len);
>> +
>> +    /* Check if the DMA cache coherency was enabled in IOMMU */
>> +    ret = ioctl(group->container->fd, VFIO_CHECK_EXTENSION, VFIO_DMA_CC_IOMMU);
>> +    if (ret > 0) {
>> +        qemu_fdt_setprop(fdt, nodename, "dma-coherent", "", 0);
>> +    }
>> +
>> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
>> +    assert(reg_attr);
>> +    for (i = 0; i < vbasedev->num_regions; i++) {
>> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
>> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
>> +        reg_attr[2 * i + 1] = cpu_to_be32(
>> +                                memory_region_size(vdev->regions[i]->mem));
>> +    }
>> +    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
>> +                     vbasedev->num_regions * 2 * sizeof(uint32_t));
>> +
>> +    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
>> +    assert(irq_attr);
>> +    for (i = 0; i < vbasedev->num_irqs; i++) {
>> +        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
>> +                         + data->irq_start;
>> +        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
>> +        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
>> +        irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>> +    }
>> +    qemu_fdt_setprop(fdt, nodename, "interrupts",
>> +                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
>> +    g_free(irq_attr);
>> +    g_free(reg_attr);
>> +    g_free(nodename);
>> +    return 0;
>> +}
>> +
>>  /* AMD xgbe properties whose values are copied/pasted from host */
>>  static HostProperty amd_xgbe_copied_properties[] = {
>>      {"compatible", false},
>> @@ -420,6 +486,7 @@ static const NodeCreationPair add_fdt_node_functions[] = {
>>  #ifdef CONFIG_LINUX
>>      {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
>>      {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
>> +    {TYPE_VFIO_QCOM_HIDMA, add_qcom_hidma_fdt_node},
>>  #endif
>>      {"", NULL}, /* last element */
>>  };
>> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
>> index c25e32b..ac38c8f 100644
>> --- a/hw/vfio/Makefile.objs
>> +++ b/hw/vfio/Makefile.objs
>> @@ -5,4 +5,5 @@ obj-$(CONFIG_SOFTMMU) += platform.o
>>  obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
>>  obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
>>  obj-$(CONFIG_SOFTMMU) += spapr.o
>> +obj-$(CONFIG_SOFTMMU) += qcom-hidma.o
>>  endif
>> diff --git a/hw/vfio/qcom-hidma.c b/hw/vfio/qcom-hidma.c
>> new file mode 100644
>> index 0000000..ddb3c34
>> --- /dev/null
>> +++ b/hw/vfio/qcom-hidma.c
>> @@ -0,0 +1,58 @@
>> +/*
>> + * Qualcomm Technologies, Inc VFIO HiDMA platform device
>> + *
>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +#include "qemu/osdep.h"
>> +#include "hw/vfio/vfio-qcom-hidma.h"
>> +
>> +static void qcom_hidma_realize(DeviceState *dev, Error **errp)
>> +{
>> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
>> +    VFIOQcomHidmaDeviceClass *k = VFIO_QCOM_HIDMA_DEVICE_GET_CLASS(dev);
>> +
>> +    vdev->compat = g_strdup("qcom,hidma-1.0");
>> +
>> +    k->parent_realize(dev, errp);
>> +}
>> +
>> +static const VMStateDescription vfio_platform_vmstate = {
>> +    .name = TYPE_VFIO_QCOM_HIDMA,
>> +    .unmigratable = 1,
>> +};
>> +
>> +static void vfio_qcom_hidma_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    VFIOQcomHidmaDeviceClass *vcxc = VFIO_QCOM_HIDMA_DEVICE_CLASS(klass);
>> +
>> +    vcxc->parent_realize = dc->realize;
>> +    dc->realize = qcom_hidma_realize;
>> +    dc->desc = "VFIO QCOM HIDMA";
>> +    dc->vmsd = &vfio_platform_vmstate;
>> +}
>> +
>> +static const TypeInfo vfio_qcom_hidma_dev_info = {
>> +    .name = TYPE_VFIO_QCOM_HIDMA,
>> +    .parent = TYPE_VFIO_PLATFORM,
>> +    .instance_size = sizeof(VFIOQcomHidmaDevice),
>> +    .class_init = vfio_qcom_hidma_class_init,
>> +    .class_size = sizeof(VFIOQcomHidmaDeviceClass),
>> +};
>> +
>> +static void register_qcom_hidma_dev_type(void)
>> +{
>> +    type_register_static(&vfio_qcom_hidma_dev_info);
>> +}
>> +
>> +type_init(register_qcom_hidma_dev_type)
>> diff --git a/include/hw/vfio/vfio-qcom-hidma.h b/include/hw/vfio/vfio-qcom-hidma.h
>> new file mode 100644
>> index 0000000..23cd66c
>> --- /dev/null
>> +++ b/include/hw/vfio/vfio-qcom-hidma.h
>> @@ -0,0 +1,50 @@
>> +/*
>> + * Qualcomm Technologies, Inc VFIO HiDMA platform device
>> + *
>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef HW_VFIO_VFIO_QCOM_HIDMA_H
>> +#define HW_VFIO_VFIO_QCOM_HIDMA_H
>> +
>> +#include "hw/vfio/vfio-platform.h"
>> +
>> +#define TYPE_VFIO_QCOM_HIDMA "vfio-qcom-hidma"
>> +
>> +/**
>> + * This device exposes:
>> + * - MMIO regions corresponding to its register space
>> + * - Active high IRQs
>> + * - Optional property 'dma-coherent'
>> + */
>> +typedef struct VFIOQcomHidmaDevice {
>> +    VFIOPlatformDevice vdev;
>> +} VFIOQcomHidmaDevice;
>> +
>> +typedef struct VFIOQcomHidmaDeviceClass {
>> +    /*< private >*/
>> +    VFIOPlatformDeviceClass parent_class;
>> +    /*< public >*/
>> +    DeviceRealize parent_realize;
>> +} VFIOQcomHidmaDeviceClass;
>> +
>> +#define VFIO_QCOM_HIDMA_DEVICE(obj) \
>> +     OBJECT_CHECK(VFIOQcomHidmaDevice, (obj), TYPE_VFIO_QCOM_HIDMA)
>> +#define VFIO_QCOM_HIDMA_DEVICE_CLASS(klass) \
>> +     OBJECT_CLASS_CHECK(VFIOQcomHidmaDeviceClass, (klass), \
>> +                        TYPE_VFIO_QCOM_HIDMA)
>> +#define VFIO_QCOM_HIDMA_DEVICE_GET_CLASS(obj) \
>> +     OBJECT_GET_CLASS(VFIOQcomHidmaDeviceClass, (obj), \
>> +                      TYPE_VFIO_QCOM_HIDMA)
>> +
>> +#endif
>> --
>> Qualcomm Datacenter Technologies, Inc. on behalf of the Qualcomm Technologies, Inc.
>> Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
> 
> 

Tested-by: Sinan Kaya <okaya@codeaurora.org>


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
