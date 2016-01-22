Received: by 10.25.159.19 with SMTP id i19csp269789lfe;
        Fri, 22 Jan 2016 08:18:04 -0800 (PST)
X-Received: by 10.55.78.207 with SMTP id c198mr4650399qkb.34.1453479484202;
        Fri, 22 Jan 2016 08:18:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 87si2769997qku.93.2016.01.22.08.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMePT-0006Xl-J2
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:18:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePN-0006Rd-5x
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:18:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePJ-0004zX-3B
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:17:57 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeP7-0004xO-UD; Fri, 22 Jan 2016 11:17:42 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOB-0003sZ-4h; Fri, 22 Jan 2016 16:16:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:36 +0000
Message-Id: <1453479402-14870-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 04/10] hw/sd: Add QOM bus which SD cards plug
	in to
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HxjlaLmhHBx1

Add a QOM bus for SD cards to plug in to.

Note that since sd_enable() is used only by one board and there
only as part of a broken implementation, we do not provide it in
the SDBus API (but instead add a warning comment about the old
function). Whoever converts OMAP and the nseries boards to QOM
will need to either implement the card switch properly or move
the enable hack into the OMAP MMC controller model.

In the SDBus API, the old-style use of sd_set_cb to register some
qemu_irqs for notification of card insertion and write-protect
toggling is replaced with methods in the SDBusClass which the
card calls on status changes and methods in the SDClass which
the controller can call to find out the current status. The
query methods will allow us to remove the abuse of the 'register
irqs' API by controllers in their reset methods to trigger
the card to tell them about the current status again.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/Makefile.objs |   2 +-
 hw/sd/core.c        | 146 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/sd.c          |  46 +++++++++++++++--
 include/hw/sd/sd.h  |  62 ++++++++++++++++++++++
 4 files changed, 251 insertions(+), 5 deletions(-)
 create mode 100644 hw/sd/core.c

diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index f1aed83..31c8330 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -1,6 +1,6 @@
 common-obj-$(CONFIG_PL181) += pl181.o
 common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
-common-obj-$(CONFIG_SD) += sd.o
+common-obj-$(CONFIG_SD) += sd.o core.o
 common-obj-$(CONFIG_SDHCI) += sdhci.o
 
 obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
diff --git a/hw/sd/core.c b/hw/sd/core.c
new file mode 100644
index 0000000..14c2bdf
--- /dev/null
+++ b/hw/sd/core.c
@@ -0,0 +1,146 @@
+/*
+ * SD card bus interface code.
+ *
+ * Copyright (c) 2015 Linaro Limited
+ *
+ * Author:
+ *  Peter Maydell <peter.maydell@linaro.org>
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
+#include "hw/qdev-core.h"
+#include "sysemu/block-backend.h"
+#include "hw/sd/sd.h"
+
+static SDState *get_card(SDBus *sdbus)
+{
+    /* We only ever have one child on the bus so just return it */
+    BusChild *kid = QTAILQ_FIRST(&sdbus->qbus.children);
+
+    if (!kid) {
+        return NULL;
+    }
+    return SD_CARD(kid->child);
+}
+
+int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint8_t *response)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->do_command(card, req, response);
+    }
+
+    return 0;
+}
+
+void sdbus_write_data(SDBus *sdbus, uint8_t value)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        sc->write_data(card, value);
+    }
+}
+
+uint8_t sdbus_read_data(SDBus *sdbus)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->read_data(card);
+    }
+
+    return 0;
+}
+
+bool sdbus_data_ready(SDBus *sdbus)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->data_ready(card);
+    }
+
+    return false;
+}
+
+bool sdbus_get_inserted(SDBus *sdbus)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->get_inserted(card);
+    }
+
+    return false;
+}
+
+bool sdbus_get_readonly(SDBus *sdbus)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->get_readonly(card);
+    }
+
+    return false;
+}
+
+void sdbus_set_inserted(SDBus *sdbus, bool inserted)
+{
+    SDBusClass *sbc = SD_BUS_GET_CLASS(sdbus);
+    BusState *qbus = BUS(sdbus);
+
+    if (sbc->set_inserted) {
+        sbc->set_inserted(qbus->parent, inserted);
+    }
+}
+
+void sdbus_set_readonly(SDBus *sdbus, bool readonly)
+{
+    SDBusClass *sbc = SD_BUS_GET_CLASS(sdbus);
+    BusState *qbus = BUS(sdbus);
+
+    if (sbc->set_readonly) {
+        sbc->set_readonly(qbus->parent, readonly);
+    }
+}
+
+static const TypeInfo sd_bus_info = {
+    .name = TYPE_SD_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(SDBus),
+    .class_size = sizeof(SDBusClass),
+};
+
+static void sd_bus_register_types(void)
+{
+    type_register_static(&sd_bus_info);
+}
+
+type_init(sd_bus_register_types)
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b62f7f5..1016aa5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -430,14 +430,41 @@ static void sd_reset(DeviceState *dev)
     sd->expecting_acmd = false;
 }
 
+static bool sd_get_inserted(SDState *sd)
+{
+    return blk_is_inserted(sd->blk);
+}
+
+static bool sd_get_readonly(SDState *sd)
+{
+    return sd->wp_switch;
+}
+
 static void sd_cardchange(void *opaque, bool load)
 {
     SDState *sd = opaque;
+    DeviceState *dev = DEVICE(sd);
+    SDBus *sdbus = SD_BUS(qdev_get_parent_bus(dev));
+    bool inserted = sd_get_inserted(sd);
+    bool readonly = sd_get_readonly(sd);
 
-    qemu_set_irq(sd->inserted_cb, blk_is_inserted(sd->blk));
-    if (blk_is_inserted(sd->blk)) {
-        sd_reset(DEVICE(sd));
-        qemu_set_irq(sd->readonly_cb, sd->wp_switch);
+    if (inserted) {
+        sd_reset(dev);
+    }
+
+    /* The IRQ notification is for legacy non-QOM SD controller devices;
+     * QOMified controllers use the SDBus APIs.
+     */
+    if (sdbus) {
+        sdbus_set_inserted(sdbus, inserted);
+        if (inserted) {
+            sdbus_set_readonly(sdbus, readonly);
+        }
+    } else {
+        qemu_set_irq(sd->inserted_cb, inserted);
+        if (inserted) {
+            qemu_set_irq(sd->readonly_cb, readonly);
+        }
     }
 }
 
@@ -1799,17 +1826,28 @@ static Property sd_properties[] = {
 static void sd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    SDCardClass *sc = SD_CARD_CLASS(klass);
 
     dc->realize = sd_realize;
     dc->props = sd_properties;
     dc->vmsd = &sd_vmstate;
     dc->reset = sd_reset;
+    dc->bus_type = TYPE_SD_BUS;
+
+    sc->do_command = sd_do_command;
+    sc->write_data = sd_write_data;
+    sc->read_data = sd_read_data;
+    sc->data_ready = sd_data_ready;
+    sc->enable = sd_enable;
+    sc->get_inserted = sd_get_inserted;
+    sc->get_readonly = sd_get_readonly;
 }
 
 static const TypeInfo sd_info = {
     .name = TYPE_SD_CARD,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(SDState),
+    .class_size = sizeof(SDCardClass),
     .class_init = sd_class_init,
     .instance_init = sd_instance_init,
 };
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 404d589..d5d273a 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -67,10 +67,51 @@ typedef struct {
 } SDRequest;
 
 typedef struct SDState SDState;
+typedef struct SDBus SDBus;
 
 #define TYPE_SD_CARD "sd-card"
 #define SD_CARD(obj) OBJECT_CHECK(SDState, (obj), TYPE_SD_CARD)
+#define SD_CARD_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SDCardClass, (klass), TYPE_SD_CARD)
+#define SD_CARD_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SDCardClass, (obj), TYPE_SD_CARD)
 
+typedef struct {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+
+    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
+    void (*write_data)(SDState *sd, uint8_t value);
+    uint8_t (*read_data)(SDState *sd);
+    bool (*data_ready)(SDState *sd);
+    void (*enable)(SDState *sd, bool enable);
+    bool (*get_inserted)(SDState *sd);
+    bool (*get_readonly)(SDState *sd);
+} SDCardClass;
+
+#define TYPE_SD_BUS "sd-bus"
+#define SD_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SD_BUS)
+#define SD_BUS_CLASS(klass) OBJECT_CLASS_CHECK(SDBusClass, (klass), TYPE_SD_BUS)
+#define SD_BUS_GET_CLASS(obj) OBJECT_GET_CLASS(SDBusClass, (obj), TYPE_SD_BUS)
+
+struct SDBus {
+    BusState qbus;
+};
+
+typedef struct {
+    /*< private >*/
+    BusClass parent_class;
+    /*< public >*/
+
+    /* These methods are called by the SD device to notify the controller
+     * when the card insertion or readonly status changes
+     */
+    void (*set_inserted)(DeviceState *dev, bool inserted);
+    void (*set_readonly)(DeviceState *dev, bool readonly);
+} SDBusClass;
+
+/* Legacy functions to be used only by non-qdevified callers */
 SDState *sd_init(BlockBackend *bs, bool is_spi);
 int sd_do_command(SDState *sd, SDRequest *req,
                   uint8_t *response);
@@ -78,6 +119,27 @@ void sd_write_data(SDState *sd, uint8_t value);
 uint8_t sd_read_data(SDState *sd);
 void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
 bool sd_data_ready(SDState *sd);
+/* sd_enable should not be used -- it is only used on the nseries boards,
+ * where it is part of a broken implementation of the MMC card slot switch
+ * (there should be two card slots which are multiplexed to a single MMC
+ * controller, but instead we model it with one card and controller and
+ * disable the card when the second slot is selected, so it looks like the
+ * second slot is always empty).
+ */
 void sd_enable(SDState *sd, bool enable);
 
+/* Functions to be used by qdevified callers (working via
+ * an SDBus rather than directly with SDState)
+ */
+int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
+void sdbus_write_data(SDBus *sd, uint8_t value);
+uint8_t sdbus_read_data(SDBus *sd);
+bool sdbus_data_ready(SDBus *sd);
+bool sdbus_get_inserted(SDBus *sd);
+bool sdbus_get_readonly(SDBus *sd);
+
+/* Functions to be used by SD devices to report back to qdevified controllers */
+void sdbus_set_inserted(SDBus *sd, bool inserted);
+void sdbus_set_readonly(SDBus *sd, bool inserted);
+
 #endif	/* __hw_sd_h */
-- 
1.9.1

