Received: by 10.25.21.156 with SMTP id 28csp1032869lfv;
        Sun, 14 Aug 2016 08:44:00 -0700 (PDT)
X-Received: by 10.55.64.21 with SMTP id n21mr2907120qka.137.1471189440000;
        Sun, 14 Aug 2016 08:44:00 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2si10891638qtc.106.2016.08.14.08.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Aug 2016 08:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYxZv-0002h1-Ee
	for alex.bennee@linaro.org; Sun, 14 Aug 2016 11:43:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>) id 1bYxYy-0002Go-NC
	for qemu-devel@nongnu.org; Sun, 14 Aug 2016 11:43:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>) id 1bYxYw-0006j9-4Y
	for qemu-devel@nongnu.org; Sun, 14 Aug 2016 11:42:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>)
	id 1bYxYq-0006id-RJ; Sun, 14 Aug 2016 11:42:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 57AD161BE7; Sun, 14 Aug 2016 15:42:50 +0000 (UTC)
Received: from shankerd-ubuntu.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: shankerd@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F5AB61B7B;
	Sun, 14 Aug 2016 15:42:48 +0000 (UTC)
From: Shanker Donthineni <shankerd@codeaurora.org>
To: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Sun, 14 Aug 2016 10:42:21 -0500
Message-Id: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH v2] hw/vfio/platform: Add Qualcomm Technologies,
 Inc HIDMA device support
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
Cc: Kaya Sinan <okaya@codeaurora.org>, Philip Elcan <pelcan@codeaurora.org>,
	Shanker Donthineni <shankerd@codeaurora.org>,
	Vikram Sethi <vikrams@codeaurora.org>, Eric Auger <eric.auger@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ZlGS6IG2H1S

This patch introduces the Qualcomm Technologies, Inc HIDMA device and
allows passthrough the host HIDMA device to a guest machine using the
vfio-platform framework.

A platform device tree node is created for the guest machine which
contains the compat string 'qcom,hidma-1.0', mmio regions, active high
SPIs, and an optional property dma-coherent.

Signed-off-by: Vikram Sethi <vikrams@codeaurora.org>
Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
---
Changes sicnce v1:
  combined patches [v1 1/2] and [v1 2/2].
  added '#include "qemu/osdep.h'.
  changed compact string to 'qcom,hidma-1.0' to match the host driver.
  set dma-coherent property based on the IOMMU coherency status.

 hw/arm/sysbus-fdt.c               | 67 +++++++++++++++++++++++++++++++++++++++
 hw/vfio/Makefile.objs             |  1 +
 hw/vfio/qcom-hidma.c              | 58 +++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-qcom-hidma.h | 50 +++++++++++++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 hw/vfio/qcom-hidma.c
 create mode 100644 include/hw/vfio/vfio-qcom-hidma.h

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 5debb33..bdf8cbb 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
+#include <sys/ioctl.h>
 #endif
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
@@ -36,6 +37,7 @@
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
+#include "hw/vfio/vfio-qcom-hidma.h"
 #include "hw/arm/fdt.h"
 
 /*
@@ -262,6 +264,70 @@ static int add_calxeda_midway_xgmac_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+/**
+ * add_qcom_hidma_fdt_node
+ *
+ * Generates a simple node with following properties:
+ * compatible string, regs, active-high interrupts, and optional dma-coherent
+ */
+static int add_qcom_hidma_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    struct VFIOGroup *group = vdev->vbasedev.group;
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    PlatformBusFDTData *data = opaque;
+    const char *parent_node = data->pbus_node_name;
+    PlatformBusDevice *pbus = data->pbus;
+    uint32_t *irq_attr, *reg_attr;
+    uint64_t mmio_base, irq_number;
+    void *fdt = data->fdt;
+    int compat_str_len, i, ret;
+    char *nodename;
+
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               vbasedev->name, mmio_base);
+    assert(nodename);
+    qemu_fdt_add_subnode(fdt, nodename);
+
+    compat_str_len = strlen(vdev->compat) + 1;
+    qemu_fdt_setprop(fdt, nodename, "compatible",
+                          vdev->compat, compat_str_len);
+
+    /* Check if the DMA cache coherency was enabled in IOMMU */
+    ret = ioctl(group->container->fd, VFIO_CHECK_EXTENSION, VFIO_DMA_CC_IOMMU);
+    if (ret > 0) {
+        qemu_fdt_setprop(fdt, nodename, "dma-coherent", "", 0);
+    }
+
+    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
+    assert(reg_attr);
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
+        reg_attr[2 * i] = cpu_to_be32(mmio_base);
+        reg_attr[2 * i + 1] = cpu_to_be32(
+                                memory_region_size(vdev->regions[i]->mem));
+    }
+    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
+                     vbasedev->num_regions * 2 * sizeof(uint32_t));
+
+    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
+    assert(irq_attr);
+    for (i = 0; i < vbasedev->num_irqs; i++) {
+        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
+                         + data->irq_start;
+        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
+        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
+        irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    }
+    qemu_fdt_setprop(fdt, nodename, "interrupts",
+                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
+    g_free(irq_attr);
+    g_free(reg_attr);
+    g_free(nodename);
+    return 0;
+}
+
 /* AMD xgbe properties whose values are copied/pasted from host */
 static HostProperty amd_xgbe_copied_properties[] = {
     {"compatible", false},
@@ -420,6 +486,7 @@ static const NodeCreationPair add_fdt_node_functions[] = {
 #ifdef CONFIG_LINUX
     {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
     {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
+    {TYPE_VFIO_QCOM_HIDMA, add_qcom_hidma_fdt_node},
 #endif
     {"", NULL}, /* last element */
 };
diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
index c25e32b..ac38c8f 100644
--- a/hw/vfio/Makefile.objs
+++ b/hw/vfio/Makefile.objs
@@ -5,4 +5,5 @@ obj-$(CONFIG_SOFTMMU) += platform.o
 obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
 obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
 obj-$(CONFIG_SOFTMMU) += spapr.o
+obj-$(CONFIG_SOFTMMU) += qcom-hidma.o
 endif
diff --git a/hw/vfio/qcom-hidma.c b/hw/vfio/qcom-hidma.c
new file mode 100644
index 0000000..ddb3c34
--- /dev/null
+++ b/hw/vfio/qcom-hidma.c
@@ -0,0 +1,58 @@
+/*
+ * Qualcomm Technologies, Inc VFIO HiDMA platform device
+ *
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+#include "qemu/osdep.h"
+#include "hw/vfio/vfio-qcom-hidma.h"
+
+static void qcom_hidma_realize(DeviceState *dev, Error **errp)
+{
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
+    VFIOQcomHidmaDeviceClass *k = VFIO_QCOM_HIDMA_DEVICE_GET_CLASS(dev);
+
+    vdev->compat = g_strdup("qcom,hidma-1.0");
+
+    k->parent_realize(dev, errp);
+}
+
+static const VMStateDescription vfio_platform_vmstate = {
+    .name = TYPE_VFIO_QCOM_HIDMA,
+    .unmigratable = 1,
+};
+
+static void vfio_qcom_hidma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VFIOQcomHidmaDeviceClass *vcxc = VFIO_QCOM_HIDMA_DEVICE_CLASS(klass);
+
+    vcxc->parent_realize = dc->realize;
+    dc->realize = qcom_hidma_realize;
+    dc->desc = "VFIO QCOM HIDMA";
+    dc->vmsd = &vfio_platform_vmstate;
+}
+
+static const TypeInfo vfio_qcom_hidma_dev_info = {
+    .name = TYPE_VFIO_QCOM_HIDMA,
+    .parent = TYPE_VFIO_PLATFORM,
+    .instance_size = sizeof(VFIOQcomHidmaDevice),
+    .class_init = vfio_qcom_hidma_class_init,
+    .class_size = sizeof(VFIOQcomHidmaDeviceClass),
+};
+
+static void register_qcom_hidma_dev_type(void)
+{
+    type_register_static(&vfio_qcom_hidma_dev_info);
+}
+
+type_init(register_qcom_hidma_dev_type)
diff --git a/include/hw/vfio/vfio-qcom-hidma.h b/include/hw/vfio/vfio-qcom-hidma.h
new file mode 100644
index 0000000..23cd66c
--- /dev/null
+++ b/include/hw/vfio/vfio-qcom-hidma.h
@@ -0,0 +1,50 @@
+/*
+ * Qualcomm Technologies, Inc VFIO HiDMA platform device
+ *
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef HW_VFIO_VFIO_QCOM_HIDMA_H
+#define HW_VFIO_VFIO_QCOM_HIDMA_H
+
+#include "hw/vfio/vfio-platform.h"
+
+#define TYPE_VFIO_QCOM_HIDMA "vfio-qcom-hidma"
+
+/**
+ * This device exposes:
+ * - MMIO regions corresponding to its register space
+ * - Active high IRQs
+ * - Optional property 'dma-coherent'
+ */
+typedef struct VFIOQcomHidmaDevice {
+    VFIOPlatformDevice vdev;
+} VFIOQcomHidmaDevice;
+
+typedef struct VFIOQcomHidmaDeviceClass {
+    /*< private >*/
+    VFIOPlatformDeviceClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+} VFIOQcomHidmaDeviceClass;
+
+#define VFIO_QCOM_HIDMA_DEVICE(obj) \
+     OBJECT_CHECK(VFIOQcomHidmaDevice, (obj), TYPE_VFIO_QCOM_HIDMA)
+#define VFIO_QCOM_HIDMA_DEVICE_CLASS(klass) \
+     OBJECT_CLASS_CHECK(VFIOQcomHidmaDeviceClass, (klass), \
+                        TYPE_VFIO_QCOM_HIDMA)
+#define VFIO_QCOM_HIDMA_DEVICE_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(VFIOQcomHidmaDeviceClass, (obj), \
+                      TYPE_VFIO_QCOM_HIDMA)
+
+#endif
-- 
Qualcomm Datacenter Technologies, Inc. on behalf of the Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.

