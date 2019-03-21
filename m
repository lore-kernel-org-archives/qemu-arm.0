Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp96018wrx;
        Thu, 21 Mar 2019 03:54:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJdsBS1TawDaG1VmPV8UMmCBrnAhmwXpIJMTxTb4ntVcEFxIvtimhwxW6f7xoSV2yGbgAu
X-Received: by 2002:adf:f709:: with SMTP id r9mr2069986wrp.301.1553165660716;
        Thu, 21 Mar 2019 03:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165660; cv=none;
        d=google.com; s=arc-20160816;
        b=AVQWOw4nu1dA7+SAOU8u24bj+yatwN9Cc3mxiWHOPUW+ruH8XPnrb9DcXJ8jRjMdWe
         ggbdu8UhRVSkUG7NgY1tcWn7nqfZMPHJCVwUJZsWTPfA3XIOiaD7SBEOxF8jzI46IKP0
         QEV7EuqXEQomju1aylyt5dCunn3OAE2YAaid3aQn2tWNIfStGjRybaXlIFOxud1tmW0k
         ZjiWLK1rKVBiGH3YNQBsLVhawL9liTiFmgzGZzZ/4MU/Mx2Yb/1eJF8VKnBQA8rTVRyM
         wbGIgmgqctlZxyZsvxuyuuU9bpC3pg9T2UcM9rpYxWMn8FOx2bVylvM2vvADI0pEaKRQ
         I80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=tzEirkFiIAa1w8M9qNxPys02O4zaC7AnaVmr44qHbXw=;
        b=x3QHO8psLM46sWquFd93K/B/7JPJZnj+7OhLfl46KVY4ml5D0fZw+7Yp9cLskDuFwV
         3bgmsmtGflPywpxVXd7xONOBz+aDIvdCY3qaQCIZgo14OOQ+N+MEOajvHy8RPYYH3D9/
         G7aey327d4N3co4R6F+G6UD3EuRr0B2+LIzBoSdOH86T5PUdh9Q9TeKpIw40CNjEgD5N
         YIWwG726uJ0owZ3zJ7jrzC/JpBdDQFYO9mB5tLVNBsgwzGvQ+peu2+wf8Ldp7YyVTGQs
         rlIgpctvIXW46dlGU/anBB+/iG4ODszZ2vC5KltnedhJyxOBUKQacT2d2moZ7gDuk9w/
         MC9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si2958708wrx.286.2019.03.21.03.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vL1-00077j-P7
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:54:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHk-0004Td-Oc
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFs-0001cZ-QG
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:49:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56392 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFs-0001H6-2p; Thu, 21 Mar 2019 06:49:00 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9E29957B498EFBCAD080;
	Thu, 21 Mar 2019 18:48:57 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:47 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:38 +0000
Message-ID: <20190321104745.28068-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI device
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
X-TUID: AN/ah1fDWbWR

From: Samuel Ortiz <sameo@linux.intel.com>

This adds the skeleton to support an acpi device interface
for HW-reduced acpi platforms via ACPI GED - Generic Event
Device (ACPI v6.1 5.6.9).

This will be used by Arm/Virt to add hotplug support.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/Kconfig                        |  4 ++
 hw/acpi/Makefile.objs                  |  1 +
 hw/acpi/generic_event_device.c         | 72 ++++++++++++++++++++++++++++++++++
 include/hw/acpi/generic_event_device.h | 29 ++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 hw/acpi/generic_event_device.c
 create mode 100644 include/hw/acpi/generic_event_device.h

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index eca3bee..01a8b41 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -27,3 +27,7 @@ config ACPI_VMGENID
     bool
     default y
     depends on PC
+
+config ACPI_HW_REDUCED
+    bool
+    depends on ACPI
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 2d46e37..b753232 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
 common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
 common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
 common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
+common-obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device.o
 common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 
 common-obj-y += acpi_interface.o
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
new file mode 100644
index 0000000..b21a551
--- /dev/null
+++ b/hw/acpi/generic_event_device.c
@@ -0,0 +1,72 @@
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
+#include "hw/sysbus.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/generic_event_device.h"
+
+static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
+                                DeviceState *dev, Error **errp)
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
+    dc->props = virt_acpi_properties;
+    dc->realize = virt_device_realize;
+
+    hc->plug = virt_device_plug_cb;
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
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
new file mode 100644
index 0000000..f314515
--- /dev/null
+++ b/include/hw/acpi/generic_event_device.h
@@ -0,0 +1,29 @@
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
+#ifndef HW_ACPI_GED_H
+#define HW_ACPI_GED_H
+
+#define TYPE_VIRT_ACPI "virt-acpi"
+#define VIRT_ACPI(obj) \
+    OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
+
+typedef struct VirtAcpiState {
+    SysBusDevice parent_obj;
+} VirtAcpiState;
+
+#endif
-- 
2.7.4


