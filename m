Received: by 10.182.158.201 with SMTP id ww9csp178741obb;
        Fri, 11 Dec 2015 08:52:28 -0800 (PST)
X-Received: by 10.55.80.138 with SMTP id e132mr23389317qkb.74.1449852748396;
        Fri, 11 Dec 2015 08:52:28 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f144si20829695qhc.96.2015.12.11.08.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 08:52:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7Qvk-0002Lu-4v
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 11:52:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrI-0003DT-R0
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrH-0000ob-Hn
	for qemu-devel@nongnu.org; Fri, 11 Dec 2015 11:47:52 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7QrH-0000oF-Al; Fri, 11 Dec 2015 11:47:51 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qgx-0001J1-Kb; Fri, 11 Dec 2015 16:37:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2015 16:37:08 +0000
Message-Id: <1449851831-4966-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	patches@linaro.org, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [Qemu-devel] [PATCH 07/10] hw/sd/pxa2xx_mmci: convert to
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
X-TUID: BcOBoNUW+EB6

Convert the pxa2xx_mmci device to be a sysbus device.

In this commit we only change the device itself, and leave
the interface to the SD card using the old non-SDBus APIs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pxa2xx_mmci.c | 73 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index b217080..b6bb390 100644
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
@@ -474,31 +482,60 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
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
+    sysbus_connect_irq(sbd, 1, rx_dma);
+    sysbus_connect_irq(sbd, 2, tx_dma);
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
+
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_mmci_ops, s,
+                          "pxa2xx-mmci", 0x00100000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->rx_dma);
+    sysbus_init_irq(sbd, &s->tx_dma);
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

