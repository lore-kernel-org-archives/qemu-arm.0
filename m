Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8274579wrx;
        Fri, 8 Mar 2019 03:52:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRTdB80y8U7HyKMrMvbTDTZxUEswVsPctKjjRMGcWUzKMQMR6duAw3T2mJWehNTzyGgPtS
X-Received: by 2002:a25:2406:: with SMTP id k6mr15814631ybk.281.1552045948037;
        Fri, 08 Mar 2019 03:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045948; cv=none;
        d=google.com; s=arc-20160816;
        b=iStf2zjmp2CUxmjAEgLHD9p35zNZS+DRRgYh3nE0NVMPFULpzHYy/O8xZopYFHth9S
         S/uDHyM9qv3kVebMUw7B1r96Km/xO1BSFWk20sc1Jk6jo6BFv6uVp+hoRpDZ5NldBHOk
         KYD3dnFuBGkyBS5oQLFYnNvZaunurlRgJRmDJ3deiLUPr8PACdAjgh57+ftkwtAQGmsR
         FJfNcJEkGfvsdppgjW1mDIZRjuMNt6MiKvBXHlMjfm8zhybZPCgjk5oo/9p5YRqywHOd
         jfLmITIGzaaXmdzhBQbVGAYYs8ZnKQFJPt2zJZZGB3qk2WMTYkmUAcZ+za66df4jRIig
         faHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=0NNwfoZyS1SbAu+cQcmgHzKuXlyIqBvp5WKa7Oal7es=;
        b=xP/qpbnBkfWXhCsl5sSc8NUBFL/2NCnn3yrQ1rylUYa5iLGdMtjaxEKSlLB4+J+Zqe
         8uMmu6xN6pmZoUKxncZ/vHh2SNpxA4umJB2L5sOdb4dtROsGQ1BYuR99OiKXrCeNm003
         0Ixie2NmGc9tfTnTVJQlSe2NfODl0Dmjudq0VQvbS7yqJ2T8EppRAZfHcHm9by9nVtNg
         9Fb6AMhrF5CPSvz052qmcEXKqenD15t3NKuFvReUW9gCtBiBX6r3MVC7eZ5BqnHmWrTd
         oy8ImlhNk+f3GdsYsmvHN21x4CoQLhCoiIJoIXZ0tn9zTh+pGa06n1SVja9f0LNoIe9b
         4gQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d184si4196991ybb.61.2019.03.08.03.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:52:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2E36-0005w2-Fd
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:52:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvr-0008T3-6a
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvn-0006yG-Iu
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:55 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43874 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvl-0006Lx-Ui; Fri, 08 Mar 2019 06:44:50 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 5FF69E29E76A163E24C8;
	Fri,  8 Mar 2019 19:44:43 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:33 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:16 +0000
Message-ID: <20190308114218.26692-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event Device
 Support
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
X-TUID: rZVNKx3VlJwe

From: Samuel Ortiz <sameo@linux.intel.com>

The ACPI Generic Event Device (GED) is a hardware-reduced specific
device that handles all platform events, including the hotplug ones.
This patch generate the AML code that defines GEDs.
Platforms need to specify their own GedEvent array to describe what kind
of events they want to support through GED. The build_ged_aml routine
takes a GedEvent array that maps a specific GED event to an IRQ number.
Then we use that array to build both the _CRS and the _EVT section
of the GED device.

This is in preparation for making use of GED for ARM/virt
platform and for now supports only memory hotplug.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/Makefile.objs |   1 +
 hw/acpi/ged.c         | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/ged.h |  61 ++++++++++++++++
 3 files changed, 260 insertions(+)
 create mode 100644 hw/acpi/ged.c
 create mode 100644 include/hw/acpi/ged.h

diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 2d46e37..6cf572b 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
 common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
 common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
 common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
+common-obj-$(CONFIG_ACPI_HW_REDUCED) += ged.o
 common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 
 common-obj-y += acpi_interface.o
diff --git a/hw/acpi/ged.c b/hw/acpi/ged.c
new file mode 100644
index 0000000..5076fbc
--- /dev/null
+++ b/hw/acpi/ged.c
@@ -0,0 +1,198 @@
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
+#include "hw/acpi/ged.h"
+
+static hwaddr ged_io_base;
+
+static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint64_t val = 0;
+    GEDState *ged_st = opaque;
+
+    switch (addr) {
+    case ACPI_GED_IRQ_SEL_OFFSET:
+        /* Read the selector value and reset it */
+        qemu_mutex_lock(&ged_st->lock);
+        val = ged_st->sel;
+        ged_st->sel = ACPI_GED_IRQ_SEL_INIT;
+        qemu_mutex_unlock(&ged_st->lock);
+        break;
+    default:
+        break;
+    }
+
+    return val;
+}
+
+/* Nothing is expected to be written to the GED memory region */
+static void ged_write(void *opaque, hwaddr addr, uint64_t data,
+                      unsigned int size)
+{
+}
+
+static const MemoryRegionOps ged_ops = {
+    .read = ged_read,
+    .write = ged_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+void acpi_ged_init(MemoryRegion *as, Object *owner, GEDState *ged_st,
+                   hwaddr base_addr, uint32_t ged_irq)
+{
+
+    assert(!ged_io_base);
+
+    ged_io_base = base_addr;
+    ged_st->irq = ged_irq;
+    qemu_mutex_init(&ged_st->lock);
+    memory_region_init_io(&ged_st->io, owner, &ged_ops, ged_st,
+                          "acpi-ged-event", ACPI_GED_REG_LEN);
+    memory_region_add_subregion(as, base_addr, &ged_st->io);
+}
+
+void acpi_ged_event(GEDState *ged_st, qemu_irq *irq, uint32_t ged_irq_sel)
+{
+    /*
+     * Set the GED IRQ selector to the expected device type value. This
+     * way, the ACPI method will be able to trigger the right code based
+     * on a unique IRQ.
+     */
+    qemu_mutex_lock(&ged_st->lock);
+    ged_st->sel |= ged_irq_sel;
+    qemu_mutex_unlock(&ged_st->lock);
+
+    /* Trigger the event by sending an interrupt to the guest. */
+    qemu_irq_pulse(irq[ged_st->irq]);
+}
+
+static Aml *ged_event_aml(GedEvent *event)
+{
+
+    if (!event) {
+        return NULL;
+    }
+
+    switch (event->event) {
+    case GED_MEMORY_HOTPLUG:
+        /* We run a complete memory SCAN when getting a memory hotplug event */
+        return aml_call0("\\_SB.MHPC." MEMORY_SLOT_SCAN_METHOD);
+    default:
+        break;
+    }
+
+    return NULL;
+}
+
+void build_ged_aml(Aml *table, const char *name, uint32_t ged_irq,
+                   GedEvent *events, uint32_t events_size,
+                   AmlRegionSpace rs)
+{
+    Aml *crs = aml_resource_template();
+    Aml *evt, *field;
+    Aml *zero = aml_int(0);
+    Aml *dev = aml_device("%s", name);
+    Aml *irq_sel = aml_local(0);
+    Aml *isel = aml_name(AML_GED_IRQ_SEL);
+    uint32_t i;
+
+    if (!ged_io_base) {
+        return;
+    }
+
+    /* _CRS interrupt */
+    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
+                                  AML_EXCLUSIVE, &ged_irq, 1));
+    /*
+     * For each GED event we:
+     * - Add an interrupt to the CRS section.
+     * - Add a conditional block for each event, inside a while loop.
+     *   This is semantically equivalent to a switch/case implementation.
+     */
+    evt = aml_method("_EVT", 1, AML_SERIALIZED);
+    {
+        Aml *ged_aml;
+        Aml *if_ctx;
+
+        /* Local0 = ISEL */
+        aml_append(evt, aml_store(isel, irq_sel));
+
+        /*
+         * Here we want to call a method for each supported GED event type.
+         * The resulting ASL code looks like:
+         *
+         * Local0 = ISEL
+         * If ((Local0 & irq0) == irq0)
+         * {
+         *     MethodEvent0()
+         * }
+         *
+         * If ((Local0 & irq1) == irq1)
+         * {
+         *     MethodEvent1()
+         * }
+         *
+         * If ((Local0 & irq2) == irq2)
+         * {
+         *     MethodEvent2()
+         * }
+         */
+
+        for (i = 0; i < events_size; i++) {
+            ged_aml = ged_event_aml(&events[i]);
+            if (!ged_aml) {
+                continue;
+            }
+
+            /* If ((Local1 == irq))*/
+            if_ctx = aml_if(aml_equal(aml_and(irq_sel, aml_int(events[i].selector), NULL), aml_int(events[i].selector)));
+            {
+                /* AML for this specific type of event */
+                aml_append(if_ctx, ged_aml);
+            }
+
+            /*
+             * We append the first if to the while context.
+             * Other ifs will be elseifs.
+             */
+            aml_append(evt, if_ctx);
+        }
+    }
+
+    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0013")));
+    aml_append(dev, aml_name_decl("_UID", zero));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    /* Append IO region */
+    aml_append(dev, aml_operation_region(AML_GED_IRQ_REG, rs,
+               aml_int(ged_io_base + ACPI_GED_IRQ_SEL_OFFSET),
+               ACPI_GED_IRQ_SEL_LEN));
+    field = aml_field(AML_GED_IRQ_REG, AML_DWORD_ACC, AML_NOLOCK,
+                      AML_WRITE_AS_ZEROS);
+    aml_append(field, aml_named_field(AML_GED_IRQ_SEL,
+                                      ACPI_GED_IRQ_SEL_LEN * 8));
+    aml_append(dev, field);
+
+    /* Append _EVT method */
+    aml_append(dev, evt);
+
+    aml_append(table, dev);
+}
diff --git a/include/hw/acpi/ged.h b/include/hw/acpi/ged.h
new file mode 100644
index 0000000..60689b0
--- /dev/null
+++ b/include/hw/acpi/ged.h
@@ -0,0 +1,61 @@
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
+#include "qemu/osdep.h"
+#include "exec/memory.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/memory_hotplug.h"
+
+#define ACPI_GED_IRQ_SEL_OFFSET 0x0
+#define ACPI_GED_IRQ_SEL_LEN    0x4
+#define ACPI_GED_IRQ_SEL_INIT   0x0
+#define ACPI_GED_IRQ_SEL_MEM    0x1
+#define ACPI_GED_REG_LEN        0x4
+
+#define GED_DEVICE      "GED"
+#define AML_GED_IRQ_REG "IREG"
+#define AML_GED_IRQ_SEL "ISEL"
+
+typedef struct Aml Aml;
+
+typedef enum {
+    GED_MEMORY_HOTPLUG = 1,
+} GedEventType;
+
+typedef struct GedEvent {
+    uint32_t     selector;
+    GedEventType event;
+} GedEvent;
+
+typedef struct GEDState {
+    MemoryRegion io;
+    uint32_t     sel;
+    uint32_t     irq;
+    QemuMutex    lock;
+} GEDState;
+
+void acpi_ged_init(MemoryRegion *as, Object *owner, GEDState *ged_st,
+                   hwaddr base_addr, uint32_t ged_irq);
+void acpi_ged_event(GEDState *ged_st, qemu_irq *irq, uint32_t ged_irq_sel);
+void build_ged_aml(Aml *table, const char* name, uint32_t ged_irq,
+                   GedEvent *events, uint32_t events_size,
+                   AmlRegionSpace rs);
+
+#endif
-- 
2.7.4


