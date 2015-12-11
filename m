Received: by 10.182.158.201 with SMTP id ww9csp177276obb;
        Fri, 11 Dec 2015 08:49:48 -0800 (PST)
X-Received: by 10.55.72.70 with SMTP id v67mr10642353qka.47.1449852587914;
        Fri, 11 Dec 2015 08:49:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 98si3211492qgx.98.2015.12.11.08.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 08:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7Qt9-0006l4-JA
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 11:49:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrE-00036Z-VI
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 11:47:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a7QrD-0000nd-Lc
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 11:47:48 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:59105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7QrA-0000m5-Q1; Fri, 11 Dec 2015 11:47:44 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a7Qgx-0001Ix-Ic; Fri, 11 Dec 2015 16:37:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 11 Dec 2015 16:37:07 +0000
Message-Id: <1449851831-4966-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:8b0:1d0::1
Cc: Kevin O'Connor <kevin@koconnor.net>, patches@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH 06/10] sdhci_sysbus: Create SD card device in
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
X-TUID: chS6cQ8cBhi8

Move the creation of the SD card device from the sdhci_sysbus
device itself into the boards that create these devices.
This allows us to remove the cannot_instantiate_with_device_add
notation because we no longer call drive_get_next in the device
model.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xilinx_zynq.c | 17 ++++++++++++++++-
 hw/arm/xlnx-ep108.c  | 19 +++++++++++++++++++
 hw/sd/sdhci.c        | 22 ----------------------
 3 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1c1a445..3195055 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -27,6 +27,7 @@
 #include "hw/misc/zynq-xadc.h"
 #include "hw/ssi.h"
 #include "qemu/error-report.h"
+#include "hw/sd/sd.h"
 
 #define NUM_SPI_FLASHES 4
 #define NUM_QSPI_FLASHES 2
@@ -153,8 +154,10 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
-    DeviceState *dev;
+    DeviceState *dev, *carddev;
     SysBusDevice *busdev;
+    DriveInfo *di;
+    BlockBackend *blk;
     qemu_irq pic[64];
     Error *err = NULL;
     int n;
@@ -260,11 +263,23 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
 
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+
     dev = qdev_create(NULL, "generic-sdhci");
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
 
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+
     dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 85b978f..cb95d32 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -34,6 +34,7 @@ static void xlnx_ep108_init(MachineState *machine)
 {
     XlnxEP108 *s = g_new0(XlnxEP108, 1);
     Error *err = NULL;
+    int i;
 
     object_initialize(&s->soc, sizeof(s->soc), TYPE_XLNX_ZYNQMP);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
@@ -45,6 +46,24 @@ static void xlnx_ep108_init(MachineState *machine)
         exit(1);
     }
 
+    /* Create and plug in the SD cards */
+    for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
+        BusState *bus;
+        DriveInfo *di = drive_get_next(IF_SD);
+        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+        DeviceState *carddev;
+
+        bus = qdev_get_child_bus(DEVICE(&s->soc.sdhci[i]), "sd-bus");
+        if (!bus) {
+            error_report("No SD bus found for SD card %d", i);
+            exit(1);
+        }
+        carddev = qdev_create(bus, TYPE_SD);
+        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+        object_property_set_bool(OBJECT(carddev), true, "realized",
+                                 &error_fatal);
+    }
+
     if (machine->ram_size > EP108_MAX_RAM_SIZE) {
         error_report("WARNING: RAM size " RAM_ADDR_FMT " above max supported, "
                      "reduced to %llx", machine->ram_size, EP108_MAX_RAM_SIZE);
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 17e08a2..c8e3865 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1296,26 +1296,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
 {
     SDHCIState *s = SYSBUS_SDHCI(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    DriveInfo *di;
-    BlockBackend *blk;
-    DeviceState *carddev;
-
-    /* Create and plug in the sd card.
-     * FIXME: this should be done by the users of this device so we
-     * do not use drive_get_next() here.
-     */
-    di = drive_get_next(IF_SD);
-    blk = di ? blk_by_legacy_dinfo(di) : NULL;
-
-    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD);
-    qdev_prop_set_drive(carddev, "drive", blk, errp);
-    if (*errp) {
-        return;
-    }
-    object_property_set_bool(OBJECT(carddev), true, "realized", errp);
-    if (*errp) {
-        return;
-    }
 
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
@@ -1333,8 +1313,6 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &sdhci_vmstate;
     dc->props = sdhci_sysbus_properties;
     dc->realize = sdhci_sysbus_realize;
-    /* Reason: instance_init() method uses drive_get_next() */
-    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo sdhci_sysbus_info = {
-- 
1.9.1

