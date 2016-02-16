Received: by 10.25.208.211 with SMTP id h202csp1452626lfg;
        Tue, 16 Feb 2016 10:20:06 -0800 (PST)
X-Received: by 10.141.3.86 with SMTP id f83mr30653116qhd.98.1455646805176;
        Tue, 16 Feb 2016 10:20:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si41752372qkb.86.2016.02.16.10.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkEG-0002Ib-Ik
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:20:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4X-00024O-WF
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVk4W-0005t5-Qa
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 13:10:01 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4W-0005sC-J4; Tue, 16 Feb 2016 13:10:00 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003SZ-Ha; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:50 +0000
Message-Id: <1455646193-13238-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-devel] [PATCH v3 08/10] hw/sd/pxa2xx_mmci: Update to use new
	SDBus APIs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PcVFdpWmZwl0

Now the PXA2xx MMCI device is QOMified itself, we can
update it to use the SDBus APIs to talk to the SD card.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 80 +++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 66 insertions(+), 14 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index cadbba3..75986ea 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -17,10 +17,14 @@
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
 
@@ -28,9 +32,11 @@ typedef struct PXA2xxMMCIState {
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
@@ -130,7 +136,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
 
     if (s->cmdat & CMDAT_WR_RD) {
         while (s->bytesleft && s->tx_len) {
-            sd_write_data(s->card, s->tx_fifo[s->tx_start ++]);
+            sdbus_write_data(&s->sdbus, s->tx_fifo[s->tx_start++]);
             s->tx_start &= 0x1f;
             s->tx_len --;
             s->bytesleft --;
@@ -140,7 +146,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
     } else
         while (s->bytesleft && s->rx_len < 32) {
             s->rx_fifo[(s->rx_start + (s->rx_len ++)) & 0x1f] =
-                sd_read_data(s->card);
+                sdbus_read_data(&s->sdbus);
             s->bytesleft --;
             s->intreq |= INT_RXFIFO_REQ;
         }
@@ -174,7 +180,7 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
     request.arg = s->arg;
     request.crc = 0;	/* FIXME */
 
-    rsplen = sd_do_command(s->card, &request, response);
+    rsplen = sdbus_do_command(&s->sdbus, &request, response);
     s->intreq |= INT_END_CMD;
 
     memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
@@ -483,32 +489,59 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
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
@@ -526,6 +559,17 @@ static void pxa2xx_mmci_instance_init(Object *obj)
 
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
@@ -535,9 +579,17 @@ static const TypeInfo pxa2xx_mmci_info = {
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

