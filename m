Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp93771wrx;
        Thu, 21 Mar 2019 03:51:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzB/gTNlypvyyksCqqNpOTHfCLksrc+KCdzb1UkbB4ygf/jb4Bj1IX7wtFf+YL3K9qx+JEv
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr1995986wrp.197.1553165478354;
        Thu, 21 Mar 2019 03:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165478; cv=none;
        d=google.com; s=arc-20160816;
        b=W2+0LM+II3ywjF+lOJEEsRetHGdvcr61a4euEqbZSRWeFTSsp7/2sZVYcDqH1E84e4
         NAZWVh5qN9irw4Wv7wMLhoOJ+amsE0AGLfijQ9Av85yC6mGQmZY/L7jV5tJ0gzNWnF7W
         I96uWHyFowdIMA0o1buxKxE79PexaPBaSv8BFRaW4z436Vv+rwEJcOKAB2f3XUf3S7zP
         QulBtyvUWXmC2VzUBxZSTI5x+vSxFoTb0bgHxf+Q41SHHireg06b8MUlfWjMU04Xy6Aa
         dfhmP1g4QkOZJjxng9WGJV2mvJiUZtF5pP21pu6+kN9pBzp4Al6eo3fq0QmbgmbWV8+6
         k2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=JrTBzc9RmoGclKGvuo614QjQAENvax9yzHS6UlB/Ok8=;
        b=Hv4Y16Sw1mtwpSYaHD+awvi8CxnPOuMhI1HC5zdAabxTLpOrVS+A8SeSvYWwNymWKC
         DQmLSz1nFDCrxY1vuq/Y3s279n1HDM2DsQv7oNWxDlh0g4Kbe9fRqhkikyPx1o6Otceh
         HopzitQxf0/x2PSriekdEgjNBlnXpaMLaQ08FeGbgeJQKjk9JEBw18KMwufwc0CZDBCU
         +wIaMESJ2ROwxfrk7Aa3gNmJj3wR15pHlO+smnDVYAOZknc3W2LrcCzroKMDv0723jAr
         l625KuJ/TDcAM5tmgFOM4DaQRDMjIp6naPb5ytGL+XLTLXxgDeIU4yBlSmlJ8mbsYRTO
         hgFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si3313244wrg.180.2019.03.21.03.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vHu-0004Oy-3k
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:51:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHP-0004Og-ES
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vGE-0003ck-RV
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:49:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2197 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vGC-0003RC-AB; Thu, 21 Mar 2019 06:49:20 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E6F44237696FE3E62ADE;
	Thu, 21 Mar 2019 18:49:17 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:49:07 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:44 +0000
Message-ID: <20190321104745.28068-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v3 09/10] hw/acpi: Add ACPI Generic Event
 Device Support
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
X-TUID: xf9B7wWTokAQ

From: Samuel Ortiz <sameo@linux.intel.com>

The ACPI Generic Event Device (GED) is a hardware-reduced specific
device that handles all platform events, including the hotplug ones.
This patch generates the AML code that defines GEDs.

Platforms need to specify their own GedEvent array to describe what
kind of events they want to support through GED.  Also this uses a
a single interrupt for the  GED device, relying on IO memory region
to communicate the type of device affected by the interrupt. This
way, we can support up to 32 events with a unique interrupt.

This is in preparation for making use of GED for ARM/virt
platform and for now supports only memory hotplug.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/generic_event_device.c         | 200 +++++++++++++++++++++++++++++++++
 include/hw/acpi/generic_event_device.h |  34 ++++++
 2 files changed, 234 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 0b32fc9..9deaa33 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -23,6 +23,183 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/mem/pc-dimm.h"
 
+static hwaddr ged_io_base;
+static GedEvent *ged_events;
+static uint32_t ged_events_size;
+
+static Aml *ged_event_aml(const GedEvent *event)
+{
+
+    if (!event) {
+        return NULL;
+    }
+
+    switch (event->event) {
+    case GED_MEMORY_HOTPLUG:
+        /* We run a complete memory SCAN when getting a memory hotplug event */
+        return aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD);
+    default:
+        break;
+    }
+
+    return NULL;
+}
+
+/*
+ * The ACPI Generic Event Device (GED) is a hardware-reduced specific
+ * device[ACPI v6.1 Section 5.6.9] that handles all platform events,
+ * including the hotplug ones. Platforms need to specify their own
+ * GedEvent array to describe what kind of events they want to support
+ * through GED. This routine uses a single interrupt for the GED device,
+ * relying on IO memory region to communicate the type of device
+ * affected by the interrupt. This way, we can support up to 32 events
+ * with a unique interrupt.
+ */
+void build_ged_aml(Aml *table, const char *name, uint32_t ged_irq,
+                   AmlRegionSpace rs)
+{
+    Aml *crs = aml_resource_template();
+    Aml *evt, *field;
+    Aml *dev = aml_device("%s", name);
+    Aml *irq_sel = aml_local(0);
+    Aml *isel = aml_name(AML_GED_IRQ_SEL);
+    uint32_t i;
+
+    if (!ged_io_base || !ged_events || !ged_events_size) {
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
+        for (i = 0; i < ged_events_size; i++) {
+            ged_aml = ged_event_aml(&ged_events[i]);
+            if (!ged_aml) {
+                continue;
+            }
+
+            /* If ((Local1 == irq))*/
+            if_ctx = aml_if(aml_equal(aml_and(irq_sel, aml_int(ged_events[i].selector), NULL), aml_int(ged_events[i].selector)));
+            {
+                /* AML for this specific type of event */
+                aml_append(if_ctx, ged_aml);
+            }
+
+            /*
+             * We append the first "if" to the "while" context.
+             * Other "ifs" will be "elseifs".
+             */
+            aml_append(evt, if_ctx);
+        }
+    }
+
+    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0013")));
+    aml_append(dev, aml_name_decl("_UID", aml_string(GED_DEVICE)));
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
+
+/* Memory read by the GED _EVT AML dynamic method */
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
+        ged_st->sel = 0;
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
+static void acpi_ged_event(GEDState *ged_st, uint32_t ged_irq_sel)
+{
+    /*
+     * Set the GED IRQ selector to the expected device type value. This
+     * way, the ACPI method will be able to trigger the right code based
+     * on a unique IRQ.
+     */
+    qemu_mutex_lock(&ged_st->lock);
+    ged_st->sel = ged_irq_sel;
+    qemu_mutex_unlock(&ged_st->lock);
+
+    /* Trigger the event by sending an interrupt to the guest. */
+    qemu_irq_pulse(ged_st->gsi[ged_st->irq]);
+}
+
 static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
                                 DeviceState *dev, Error **errp)
 {
@@ -40,6 +217,21 @@ static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
 
 static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
+    VirtAcpiState *s = VIRT_ACPI(adev);
+    uint32_t sel;
+
+    if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
+        sel = ACPI_GED_IRQ_SEL_MEM;
+    } else {
+        /* Unknown event. Return without generating interrupt. */
+        return;
+    }
+
+    /*
+     * We inject the hotplug interrupt. The IRQ selector will make
+     * the difference from the ACPI table.
+     */
+    acpi_ged_event(&s->ged_state, sel);
 }
 
 static void virt_device_realize(DeviceState *dev, Error **errp)
@@ -57,6 +249,11 @@ static Property virt_acpi_properties[] = {
     DEFINE_PROP_UINT64("memhp_base", VirtAcpiState, memhp_base, 0),
     DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
                      memhp_state.is_enabled, true),
+    DEFINE_PROP_PTR("gsi", VirtAcpiState, gsi),
+    DEFINE_PROP_UINT64("ged_base", VirtAcpiState, ged_base, 0),
+    DEFINE_PROP_UINT32("ged_irq", VirtAcpiState, ged_irq, 0),
+    DEFINE_PROP_PTR("ged_events", VirtAcpiState, ged_events),
+    DEFINE_PROP_UINT32("ged_events_size", VirtAcpiState, ged_events_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -70,6 +267,9 @@ static void virt_acpi_class_init(ObjectClass *class, void *data)
     dc->props = virt_acpi_properties;
     dc->realize = virt_device_realize;
 
+    /* Reason: pointer properties "gsi" and "gde_events" */
+    dc->user_creatable = false;
+
     hc->plug = virt_device_plug_cb;
 
     adevc->send_event = virt_send_ged;
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 262ca7d..7f130f3 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -24,11 +24,45 @@
 #define VIRT_ACPI(obj) \
     OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
 
+#define ACPI_GED_IRQ_SEL_OFFSET 0x0
+#define ACPI_GED_IRQ_SEL_LEN    0x4
+#define ACPI_GED_IRQ_SEL_MEM    0x1
+#define ACPI_GED_REG_LEN        0x4
+
+#define GED_DEVICE      "GED"
+#define AML_GED_IRQ_REG "IREG"
+#define AML_GED_IRQ_SEL "ISEL"
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
+    qemu_irq     *gsi;
+    QemuMutex    lock;
+} GEDState;
+
 typedef struct VirtAcpiState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
     hwaddr memhp_base;
+    void *gsi;
+    hwaddr ged_base;
+    GEDState ged_state;
+    uint32_t ged_irq;
+    void *ged_events;
+    uint32_t ged_events_size;
 } VirtAcpiState;
 
+void build_ged_aml(Aml *table, const char* name, uint32_t ged_irq,
+                   AmlRegionSpace rs);
 
 #endif
-- 
2.7.4


