Received: by 10.182.158.201 with SMTP id ww9csp254268obb;
        Thu, 3 Dec 2015 14:48:15 -0800 (PST)
X-Received: by 10.55.77.203 with SMTP id a194mr14327962qkb.85.1449182895175;
        Thu, 03 Dec 2015 14:48:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v28si589943qkl.123.2015.12.03.14.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 14:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4cfe-0004lW-S3
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 17:48:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4cfB-00049i-KY
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 17:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4cfA-00029E-IA
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 17:47:45 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4cfA-000293-B4; Thu, 03 Dec 2015 17:47:44 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4cIq-0005mk-E6; Thu, 03 Dec 2015 22:24:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  3 Dec 2015 22:24:38 +0000
Message-Id: <1449181480-22209-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449181480-22209-1-git-send-email-peter.maydell@linaro.org>
References: <1449181480-22209-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, patches@linaro.org
Subject: [Qemu-devel] [PATCH v2 1/3] hw/sd/pxa2xx_mmci: convert to
	SysBusDevice object
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
X-TUID: 7CcqMmX5akfn

Convert the pxa2xx_mmci device to be a sysbus device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 89 +++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 17 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index b217080..39ca309 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -11,16 +11,24 @@
  */
 
 #include "hw/hw.h"
+#include "hw/sysbus.h"
 #include "hw/arm/pxa.h"
 #include "hw/sd/sd.h"
 #include "hw/qdev.h"
+#include "hw/qdev-properties.h"
+
+#define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
+#define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
+
+typedef struct PXA2xxMMCIState {
+    SysBusDevice parent_obj;
 
-struct PXA2xxMMCIState {
     MemoryRegion iomem;
     qemu_irq irq;
     qemu_irq rx_dma;
     qemu_irq tx_dma;
 
+    BlockBackend *blk;
     SDState *card;
 
     uint32_t status;
@@ -48,7 +56,7 @@ struct PXA2xxMMCIState {
     int resp_len;
 
     int cmdreq;
-};
+} PXA2xxMMCIState;
 
 #define MMC_STRPCL	0x00	/* MMC Clock Start/Stop register */
 #define MMC_STAT	0x04	/* MMC Status register */
@@ -474,31 +482,78 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 BlockBackend *blk, qemu_irq irq,
                 qemu_irq rx_dma, qemu_irq tx_dma)
 {
-    PXA2xxMMCIState *s;
+    DeviceState *dev;
+    SysBusDevice *sbd;
+
+    dev = qdev_create(NULL, TYPE_PXA2XX_MMCI);
+    qdev_prop_set_drive_nofail(dev, "drive", blk);
+    qdev_init_nofail(dev);
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(sbd, 0, base);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_connect_irq(sbd, 1, rx_dma);
+    sysbus_connect_irq(sbd, 2, tx_dma);
+    return PXA2XX_MMCI(dev);
+}
 
-    s = (PXA2xxMMCIState *) g_malloc0(sizeof(PXA2xxMMCIState));
-    s->irq = irq;
-    s->rx_dma = rx_dma;
-    s->tx_dma = tx_dma;
+void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
+                qemu_irq coverswitch)
+{
+    sd_set_cb(s->card, readonly, coverswitch);
+}
+
+static void pxa2xx_mmci_instance_init(Object *obj)
+{
+    PXA2xxMMCIState *s = PXA2XX_MMCI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, NULL, &pxa2xx_mmci_ops, s,
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_mmci_ops, s,
                           "pxa2xx-mmci", 0x00100000);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->rx_dma);
+    sysbus_init_irq(sbd, &s->tx_dma);
+
+    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
+                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
+}
+
+static void pxa2xx_mmci_realize(DeviceState *dev, Error **errp)
+{
+    PXA2xxMMCIState *s = PXA2XX_MMCI(dev);
 
     /* Instantiate the actual storage */
-    s->card = sd_init(blk, false);
+    s->card = sd_init(s->blk, false);
     if (s->card == NULL) {
-        exit(1);
+        error_setg(errp, "Could not initialize SD card with specified drive");
+        return;
     }
+}
 
-    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
-                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
+static Property pxa2xx_mmci_properties[] = {
+    DEFINE_PROP_DRIVE("drive", PXA2xxMMCIState, blk),
+    DEFINE_PROP_END_OF_LIST(),
+};
 
-    return s;
+static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = pxa2xx_mmci_realize;
+    dc->props = pxa2xx_mmci_properties;
 }
 
-void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
-                qemu_irq coverswitch)
+static const TypeInfo pxa2xx_mmci_info = {
+    .name = TYPE_PXA2XX_MMCI,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PXA2xxMMCIState),
+    .class_init = pxa2xx_mmci_class_init,
+    .instance_init = pxa2xx_mmci_instance_init,
+};
+
+static void pxa2xx_mmci_register_types(void)
 {
-    sd_set_cb(s->card, readonly, coverswitch);
+    type_register_static(&pxa2xx_mmci_info);
 }
+
+type_init(pxa2xx_mmci_register_types)
-- 
1.9.1

