Received: by 10.25.159.19 with SMTP id i19csp269822lfe;
        Fri, 22 Jan 2016 08:18:08 -0800 (PST)
X-Received: by 10.140.138.145 with SMTP id 139mr5075701qhk.18.1453479488101;
        Fri, 22 Jan 2016 08:18:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t125si7744922qhc.129.2016.01.22.08.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:18:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMePX-0006dp-CH
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:18:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePP-0006SF-3s
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:18:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMePJ-0004ze-47
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:17:57 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeP8-0004xO-Kd; Fri, 22 Jan 2016 11:17:42 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOB-0003sp-Bs; Fri, 22 Jan 2016 16:16:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:40 +0000
Message-Id: <1453479402-14870-9-git-send-email-peter.maydell@linaro.org>
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
Subject: [Qemu-arm] [PATCH v2 08/10] hw/sd/pxa2xx_mmci: Update to use new
	SDBus APIs
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
X-TUID: hs1/U+od07Z8

Now the PXA2xx MMCI device is QOMified itself, we can
update it to use the SDBus APIs to talk to the SD card.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 80 +++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 66 insertions(+), 14 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 30d3aa2..9690c69 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -16,10 +16,14 @@
 #include "hw/sd/sd.h"
 #include "hw/qdev.h"
 #include "hw/qdev-properties.h"
+#include "qemu/error-report.h"
 
 #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
 #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
 
+#define TYPE_PXA2XX_MMCI_BUS "pxa2xx-mmci-bus"
+#define PXA2XX_MMCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
+
 typedef struct PXA2xxMMCIState {
     SysBusDevice parent_obj;
 
@@ -27,9 +31,11 @@ typedef struct PXA2xxMMCIState {
     qemu_irq irq;
     qemu_irq rx_dma;
     qemu_irq tx_dma;
+    qemu_irq inserted;
+    qemu_irq readonly;
 
     BlockBackend *blk;
-    SDState *card;
+    SDBus sdbus;
 
     uint32_t status;
     uint32_t clkrt;
@@ -129,7 +135,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
 
     if (s->cmdat & CMDAT_WR_RD) {
         while (s->bytesleft && s->tx_len) {
-            sd_write_data(s->card, s->tx_fifo[s->tx_start ++]);
+            sdbus_write_data(&s->sdbus, s->tx_fifo[s->tx_start++]);
             s->tx_start &= 0x1f;
             s->tx_len --;
             s->bytesleft --;
@@ -139,7 +145,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
     } else
         while (s->bytesleft && s->rx_len < 32) {
             s->rx_fifo[(s->rx_start + (s->rx_len ++)) & 0x1f] =
-                sd_read_data(s->card);
+                sdbus_read_data(&s->sdbus);
             s->bytesleft --;
             s->intreq |= INT_RXFIFO_REQ;
         }
@@ -173,7 +179,7 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
     request.arg = s->arg;
     request.crc = 0;	/* FIXME */
 
-    rsplen = sd_do_command(s->card, &request, response);
+    rsplen = sdbus_do_command(&s->sdbus, &request, response);
     s->intreq |= INT_END_CMD;
 
     memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
@@ -482,32 +488,59 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 BlockBackend *blk, qemu_irq irq,
                 qemu_irq rx_dma, qemu_irq tx_dma)
 {
-    DeviceState *dev;
+    DeviceState *dev, *carddev;
     SysBusDevice *sbd;
     PXA2xxMMCIState *s;
+    Error *err = NULL;
 
     dev = qdev_create(NULL, TYPE_PXA2XX_MMCI);
     s = PXA2XX_MMCI(dev);
-    /* Reach into the device and initialize the SD card. This is
-     * unclean but will vanish when we update to SDBus APIs.
-     */
-    s->card = sd_init(s->blk, false);
-    if (s->card == NULL) {
-        exit(1);
-    }
-    qdev_init_nofail(dev);
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
+
+    /* Create and plug in the sd card */
+    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &err);
+    if (err) {
+        error_report("failed to init SD card: %s", error_get_pretty(err));
+        return NULL;
+    }
+    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
+    if (err) {
+        error_report("failed to init SD card: %s", error_get_pretty(err));
+        return NULL;
+    }
+
     return s;
 }
 
+static void pxa2xx_mmci_set_inserted(DeviceState *dev, bool inserted)
+{
+    PXA2xxMMCIState *s = PXA2XX_MMCI(dev);
+
+    qemu_set_irq(s->inserted, inserted);
+}
+
+static void pxa2xx_mmci_set_readonly(DeviceState *dev, bool readonly)
+{
+    PXA2xxMMCIState *s = PXA2XX_MMCI(dev);
+
+    qemu_set_irq(s->readonly, readonly);
+}
+
 void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
                           qemu_irq coverswitch)
 {
-    sd_set_cb(s->card, readonly, coverswitch);
+    DeviceState *dev = DEVICE(s);
+
+    s->readonly = readonly;
+    s->inserted = coverswitch;
+
+    pxa2xx_mmci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
+    pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
 }
 
 static void pxa2xx_mmci_instance_init(Object *obj)
@@ -525,6 +558,17 @@ static void pxa2xx_mmci_instance_init(Object *obj)
 
     register_savevm(NULL, "pxa2xx_mmci", 0, 0,
                     pxa2xx_mmci_save, pxa2xx_mmci_load, s);
+
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
+                        TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
+}
+
+static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
+{
+    SDBusClass *sbc = SD_BUS_CLASS(klass);
+
+    sbc->set_inserted = pxa2xx_mmci_set_inserted;
+    sbc->set_readonly = pxa2xx_mmci_set_readonly;
 }
 
 static const TypeInfo pxa2xx_mmci_info = {
@@ -534,9 +578,17 @@ static const TypeInfo pxa2xx_mmci_info = {
     .instance_init = pxa2xx_mmci_instance_init,
 };
 
+static const TypeInfo pxa2xx_mmci_bus_info = {
+    .name = TYPE_PXA2XX_MMCI_BUS,
+    .parent = TYPE_SD_BUS,
+    .instance_size = sizeof(SDBus),
+    .class_init = pxa2xx_mmci_bus_class_init,
+};
+
 static void pxa2xx_mmci_register_types(void)
 {
     type_register_static(&pxa2xx_mmci_info);
+    type_register_static(&pxa2xx_mmci_bus_info);
 }
 
 type_init(pxa2xx_mmci_register_types)
-- 
1.9.1

