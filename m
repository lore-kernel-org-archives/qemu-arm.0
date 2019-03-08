Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8271029wrx;
        Fri, 8 Mar 2019 03:48:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzz6iDMPSCnAKlaZzDY5DqFIy1JlXa9W936crKfMXNSja72jo+RRRI3sumFDRxuUFlUCzRf
X-Received: by 2002:a81:984c:: with SMTP id p73mr1061798ywg.18.1552045692442;
        Fri, 08 Mar 2019 03:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045692; cv=none;
        d=google.com; s=arc-20160816;
        b=UU0kU00n+p2jVhqGvX4i6L98xD5AwwqBfBf2Poqgv2FU0BwcYBg79CV4ClwkskuMAG
         IQAvY+MzKSGBFh6KdMG120G2ovRN/ui0iCwG5unisCXRWh0oUy/fSpPgrCTFjE8Qslkh
         ObRkd8qt+vkmYdHO2VzrmzB+FRt40kMcN6SYRPcSqZknHlZnR534gAsvo8lvYGW2XhSd
         uGmpVxkEcGwWbLkJ1Of9cnX66mndMB7SwP/C3X5aEYhR+XohlhRlAeNMNWzEUDmpRzXT
         5qZj5JtU4VZ3021XxgkfFG0hGOA7BN2HrjklTsEXBMMkbgj5imx7e9RCYJvTiKJMeHhS
         CcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=qUFxfLue9kPDLmQXqjTNvy7+EG4wwjc7T8u3YWDLtyg=;
        b=BfAG1819TMayyq9sVuwZzUcBylLRQOLiGomqOWECJSHpdsFfBYis3zCiJK/sqETquT
         wCP4AXU8hhTntYbR4mOSyzOyOWloQIpks/lV3ImZWJEI+KCUX+Qd0YalIJhHASkD3MFs
         ChU8oOrNNBlS4nVHsHQSZEEAkWWiB8NEydjeoYFlnaw2Cu/Q6ms+yOn67uKJlcKe7yZB
         qYL3h++vF531BVeS5MHS9llDss6zPeqn5DEgFza9CqD7Z6V10Vkja9qZZLvtXJp+9GbR
         KLzro8iTDhBgl46qWP2SSsRCvQKKCSfO+8ClUjxiig/L5Jj6TmbSdzg9lIh6gNlnr2//
         8RrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n130si4410532ywd.37.2019.03.08.03.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Dz1-0002YF-SO
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvV-00086W-SC
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvU-0005JI-IH
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:33 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43388 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvU-00051I-3q; Fri, 08 Mar 2019 06:44:32 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 281A5CF44E85DC7BA650;
	Fri,  8 Mar 2019 19:44:28 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:17 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:11 +0000
Message-ID: <20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
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
X-TUID: JTr7MngqisIP

From: Samuel Ortiz <sameo@linux.intel.com>

This is to provide an acpi device interface for Arm/virt.
This will be used by Arm/Virt to add hotplug support via
ACPI GED device.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/Makefile.objs  |   2 +-
 hw/arm/virt-acpi.c    | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |   1 +
 3 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/virt-acpi.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fa57c7c..e0db3cd 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,6 +1,6 @@
 obj-y += boot.o sysbus-fdt.o
 obj-$(CONFIG_ARM_VIRT) += virt.o
-obj-$(CONFIG_ACPI) += virt-acpi-build.o
+obj-$(CONFIG_ACPI) += virt-acpi-build.o virt-acpi.o
 obj-$(CONFIG_DIGIC) += digic_boards.o
 obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
 obj-$(CONFIG_HIGHBANK) += highbank.o
diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
new file mode 100644
index 0000000..df8a02b
--- /dev/null
+++ b/hw/arm/virt-acpi.c
@@ -0,0 +1,111 @@
+/*
+ *
+ * Copyright (c) 2018 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/range.h"
+#include "qapi/error.h"
+#include "exec/address-spaces.h"
+
+#include "hw/hw.h"
+#include "hw/hotplug.h"
+#include "hw/sysbus.h"
+#include "hw/arm/virt.h"
+
+#include "hw/acpi/acpi.h"
+
+typedef struct VirtAcpiState {
+    SysBusDevice parent_obj;
+} VirtAcpiState;
+
+#define TYPE_VIRT_ACPI "virt-acpi"
+#define VIRT_ACPI(obj) \
+    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
+
+static const VMStateDescription vmstate_acpi = {
+    .name = "virt_acpi",
+    .version_id = 1,
+    .minimum_version_id = 1,
+};
+
+static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
+                                DeviceState *dev, Error **errp)
+{
+}
+
+static void virt_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+}
+
+static void virt_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                  DeviceState *dev, Error **errp)
+{
+}
+
+static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
+{
+}
+
+static void virt_device_realize(DeviceState *dev, Error **errp)
+{
+}
+
+DeviceState *virt_acpi_init(void)
+{
+    return sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
+}
+
+static Property virt_acpi_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virt_acpi_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(class);
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
+
+    dc->desc = "ACPI";
+    dc->vmsd = &vmstate_acpi;
+    dc->props = virt_acpi_properties;
+    dc->realize = virt_device_realize;
+
+    hc->plug = virt_device_plug_cb;
+    hc->unplug_request = virt_device_unplug_request_cb;
+    hc->unplug = virt_device_unplug_cb;
+
+    adevc->send_event = virt_send_ged;
+}
+
+static const TypeInfo virt_acpi_info = {
+    .name          = TYPE_VIRT_ACPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VirtAcpiState),
+    .class_init    = virt_acpi_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { TYPE_ACPI_DEVICE_IF },
+        { }
+    }
+};
+
+static void virt_acpi_register_types(void)
+{
+    type_register_static(&virt_acpi_info);
+}
+
+type_init(virt_acpi_register_types)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 507517c..6076167 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -145,6 +145,7 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
+DeviceState *virt_acpi_init(void);
 
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
-- 
2.7.4


