Received: by 10.25.208.211 with SMTP id h202csp1454100lfg;
        Tue, 16 Feb 2016 10:23:13 -0800 (PST)
X-Received: by 10.55.215.131 with SMTP id t3mr13477998qkt.97.1455646993416;
        Tue, 16 Feb 2016 10:23:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si41746438qkb.102.2016.02.16.10.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkHI-0007Dv-Rm
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:23:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVkHG-0007B2-OI
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:23:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVkHF-0000qm-Mv
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:23:10 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVkHA-0000pz-Bt; Tue, 16 Feb 2016 13:23:04 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVk4P-0003SV-FL; Tue, 16 Feb 2016 18:09:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 18:09:49 +0000
Message-Id: <1455646193-13238-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH v3 07/10] hw/sd/pxa2xx_mmci: convert to
	SysBusDevice object
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
X-TUID: iwljWxMPvCiw

Convert the pxa2xx_mmci device to be a sysbus device.

In this commit we only change the device itself, and leave
the interface to the SD card using the old non-SDBus APIs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/sd/pxa2xx_mmci.c | 74 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 81da7b7..cadbba3 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -12,16 +12,24 @@
 
 #include "qemu/osdep.h"
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
@@ -49,7 +57,7 @@ struct PXA2xxMMCIState {
     int resp_len;
 
     int cmdreq;
-};
+} PXA2xxMMCIState;
 
 #define MMC_STRPCL	0x00	/* MMC Clock Start/Stop register */
 #define MMC_STAT	0x04	/* MMC Status register */
@@ -475,31 +483,61 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 BlockBackend *blk, qemu_irq irq,
                 qemu_irq rx_dma, qemu_irq tx_dma)
 {
+    DeviceState *dev;
+    SysBusDevice *sbd;
     PXA2xxMMCIState *s;
 
-    s = (PXA2xxMMCIState *) g_malloc0(sizeof(PXA2xxMMCIState));
-    s->irq = irq;
-    s->rx_dma = rx_dma;
-    s->tx_dma = tx_dma;
-
-    memory_region_init_io(&s->iomem, NULL, &pxa2xx_mmci_ops, s,
-                          "pxa2xx-mmci", 0x00100000);
-    memory_region_add_subregion(sysmem, base, &s->iomem);
-
-    /* Instantiate the actual storage */
-    s->card = sd_init(blk, false);
+    dev = qdev_create(NULL, TYPE_PXA2XX_MMCI);
+    s = PXA2XX_MMCI(dev);
+    /* Reach into the device and initialize the SD card. This is
+     * unclean but will vanish when we update to SDBus APIs.
+     */
+    s->card = sd_init(s->blk, false);
     if (s->card == NULL) {
         exit(1);
     }
-
-    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
-                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
-
+    qdev_init_nofail(dev);
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(sbd, 0, base);
+    sysbus_connect_irq(sbd, 0, irq);
+    qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
+    qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
     return s;
 }
 
 void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
-                qemu_irq coverswitch)
+                          qemu_irq coverswitch)
 {
     sd_set_cb(s->card, readonly, coverswitch);
 }
+
+static void pxa2xx_mmci_instance_init(Object *obj)
+{
+    PXA2xxMMCIState *s = PXA2XX_MMCI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_mmci_ops, s,
+                          "pxa2xx-mmci", 0x00100000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_out_named(dev, &s->rx_dma, "rx-dma", 1);
+    qdev_init_gpio_out_named(dev, &s->tx_dma, "tx-dma", 1);
+
+    register_savevm(NULL, "pxa2xx_mmci", 0, 0,
+                    pxa2xx_mmci_save, pxa2xx_mmci_load, s);
+}
+
+static const TypeInfo pxa2xx_mmci_info = {
+    .name = TYPE_PXA2XX_MMCI,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PXA2xxMMCIState),
+    .instance_init = pxa2xx_mmci_instance_init,
+};
+
+static void pxa2xx_mmci_register_types(void)
+{
+    type_register_static(&pxa2xx_mmci_info);
+}
+
+type_init(pxa2xx_mmci_register_types)
-- 
1.9.1

