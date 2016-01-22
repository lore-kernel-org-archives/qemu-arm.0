Received: by 10.25.159.19 with SMTP id i19csp269292lfe;
        Fri, 22 Jan 2016 08:17:07 -0800 (PST)
X-Received: by 10.141.5.213 with SMTP id h204mr5010508qhd.43.1453479427556;
        Fri, 22 Jan 2016 08:17:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o33si7789044qge.42.2016.01.22.08.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 08:17:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMeOY-0005Zd-UE
	for alex.bennee@linaro.org; Fri, 22 Jan 2016 11:17:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMeOT-0005Sn-88
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:17:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aMeOO-0004t1-Gr
	for qemu-arm@nongnu.org; Fri, 22 Jan 2016 11:17:01 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOD-0004rz-Ur; Fri, 22 Jan 2016 11:16:46 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aMeOB-0003sh-8K; Fri, 22 Jan 2016 16:16:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jan 2016 16:16:38 +0000
Message-Id: <1453479402-14870-7-git-send-email-peter.maydell@linaro.org>
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
Subject: [Qemu-arm] [PATCH v2 06/10] sdhci_sysbus: Create SD card device in
	users, not the device itself
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
X-TUID: 1ufxpyQoeL/R

Move the creation of the SD card device from the sdhci_sysbus
device itself into the boards that create these devices.
This allows us to remove the cannot_instantiate_with_device_add
notation because we no longer call drive_get_next in the device
model.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xilinx_zynq.c | 17 ++++++++++++++++-
 hw/arm/xlnx-ep108.c  | 21 +++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c |  8 ++++++++
 hw/sd/sdhci.c        | 25 -------------------------
 4 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 66e7f27..a35983a 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -28,6 +28,7 @@
 #include "hw/misc/zynq-xadc.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/error-report.h"
+#include "hw/sd/sd.h"
 
 #define NUM_SPI_FLASHES 4
 #define NUM_QSPI_FLASHES 2
@@ -154,8 +155,10 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
-    DeviceState *dev;
+    DeviceState *dev, *carddev;
     SysBusDevice *busdev;
+    DriveInfo *di;
+    BlockBackend *blk;
     qemu_irq pic[64];
     int n;
 
@@ -245,11 +248,23 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
 
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+
     dev = qdev_create(NULL, "generic-sdhci");
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
 
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+
     dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 2cd69b5..d294581 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -64,6 +64,27 @@ static void xlnx_ep108_init(MachineState *machine)
         exit(1);
     }
 
+    /* Create and plug in the SD cards */
+    for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
+        BusState *bus;
+        DriveInfo *di = drive_get_next(IF_SD);
+        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+        DeviceState *carddev;
+        char *bus_name;
+
+        bus_name = g_strdup_printf("sd-bus%d", i);
+        bus = qdev_get_child_bus(DEVICE(&s->soc), bus_name);
+        g_free(bus_name);
+        if (!bus) {
+            error_report("No SD bus found for SD card %d", i);
+            exit(1);
+        }
+        carddev = qdev_create(bus, TYPE_SD_CARD);
+        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+        object_property_set_bool(OBJECT(carddev), true, "realized",
+                                 &error_fatal);
+    }
+
     for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
         SSIBus *spi_bus;
         DeviceState *flash_dev;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 1508d08..4fbb635 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -327,6 +327,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
+        char *bus_name;
+
         object_property_set_bool(OBJECT(&s->sdhci[i]), true,
                                  "realized", &err);
         if (err) {
@@ -337,6 +339,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                         sdhci_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
                            gic_spi[sdhci_intr[i]]);
+        /* Alias controller SD bus to the SoC itself */
+        bus_name = g_strdup_printf("sd-bus%d", i);
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->sdhci[i]), "sd-bus",
+                                  &error_abort);
+        g_free(bus_name);
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index ad3a91c..f40f500 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1296,29 +1296,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
 {
     SDHCIState *s = SYSBUS_SDHCI(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    DriveInfo *di;
-    BlockBackend *blk;
-    DeviceState *carddev;
-    Error *err = NULL;
-
-    /* Create and plug in the sd card.
-     * FIXME: this should be done by the users of this device so we
-     * do not use drive_get_next() here.
-     */
-    di = drive_get_next(IF_SD);
-    blk = di ? blk_by_legacy_dinfo(di) : NULL;
-
-    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
-    qdev_prop_set_drive(carddev, "drive", blk, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
 
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
@@ -1335,8 +1312,6 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &sdhci_vmstate;
     dc->props = sdhci_sysbus_properties;
     dc->realize = sdhci_sysbus_realize;
-    /* Reason: instance_init() method uses drive_get_next() */
-    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo sdhci_sysbus_info = {
-- 
1.9.1

