Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v23sm5945882wmj.4.2021.10.01.10.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:42:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CB3991FF96;
	Fri,  1 Oct 2021 18:42:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Bishop <cleverca22@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [RFC PATCH] hw/arm: fix the position of vcram for raspi
Date: Fri,  1 Oct 2021 18:42:42 +0100
Message-Id: <20211001174243.128157-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pIqxdejJ7pd4

The previous calculation fell over when I tried to create a 8gb Pi 4
because the values where only 32 bit. However the quirk of the Pi
hardware is the vcram can only appear in the first 1gb of address
space. This also limits where the initial kernel and DTB can be
loaded (notice the DTS for the 8gb Pi4 still only uses 32 bit sizes).
Fix this cleaning up setup_boot to directly use vcram_base and
documenting what is going on.

NB: the aliases are confusing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Michael Bishop <cleverca22@gmail.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 14 +++++++++++---
 hw/arm/bcm2836.c             |  2 ++
 hw/arm/raspi.c               | 19 ++++++++++++-------
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 1f2f0ad486..3856c7d267 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/units.h"
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
 #include "hw/arm/raspi_platform.h"
@@ -74,6 +75,7 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Framebuffer */
     object_initialize_child(obj, "fb", &s->fb, TYPE_BCM2835_FB);
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->fb), "vcram-base");
 
     object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
@@ -138,7 +140,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     Object *obj;
     MemoryRegion *ram;
     Error *err = NULL;
-    uint64_t ram_size, vcram_size;
+    uint64_t ram_size, vcram_size, vcram_base;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &error_abort);
@@ -235,15 +237,21 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
                                INTERRUPT_ARM_MAILBOX));
 
-    /* Framebuffer */
+    /*
+     * The framebuffer has to live in the first 1gb of addressable
+     * space which is fine for older Pi's with less than 1gb of RAM
+     * but we need to take care not to put it too high otherwise
+     */
     vcram_size = object_property_get_uint(OBJECT(s), "vcram-size", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
+    vcram_base = MIN(ram_size, 1 * GiB) - vcram_size;
+
     if (!object_property_set_uint(OBJECT(&s->fb), "vcram-base",
-                                  ram_size - vcram_size, errp)) {
+                                  vcram_base, errp)) {
         return;
     }
 
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 34aaaa77f1..18034c4131 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -79,6 +79,8 @@ static void bcm2836_init(Object *obj)
                               "board-rev");
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->peripherals),
+                              "vcram-base");
 }
 
 static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 50462bc04c..0342aeab03 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -198,14 +198,19 @@ static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
+/*
+ * NB: ram_limit isn't the same as ram_size - it indicates the portion
+ * of RAM that boot components can live in (up to the first 1gb - the
+ * vcram_size, aka vcram_base)
+ */
 static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
-                       size_t ram_size)
+                       size_t ram_limit)
 {
     RaspiMachineState *s = RASPI_MACHINE(machine);
     int r;
 
     s->binfo.board_id = MACH_TYPE_BCM2708;
-    s->binfo.ram_size = ram_size;
+    s->binfo.ram_size = ram_limit;
     s->binfo.nb_cpus = machine->smp.cpus;
 
     if (processor_id <= PROCESSOR_ID_BCM2836) {
@@ -241,7 +246,7 @@ static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
                              ? FIRMWARE_ADDR_2 : FIRMWARE_ADDR_3;
         /* load the firmware image (typically kernel.img) */
         r = load_image_targphys(machine->firmware, firmware_addr,
-                                ram_size - firmware_addr);
+                                ram_limit - firmware_addr);
         if (r < 0) {
             error_report("Failed to load firmware from %s", machine->firmware);
             exit(1);
@@ -260,7 +265,7 @@ static void raspi_machine_init(MachineState *machine)
     RaspiMachineState *s = RASPI_MACHINE(machine);
     uint32_t board_rev = mc->board_rev;
     uint64_t ram_size = board_ram_size(board_rev);
-    uint32_t vcram_size;
+    uint32_t vcram_base;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
@@ -297,10 +302,10 @@ static void raspi_machine_init(MachineState *machine)
     qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
     qdev_realize_and_unref(carddev, bus, &error_fatal);
 
-    vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
+    vcram_base = object_property_get_uint(OBJECT(&s->soc), "vcram-base",
                                           &error_abort);
-    setup_boot(machine, board_processor_id(mc->board_rev),
-               machine->ram_size - vcram_size);
+
+    setup_boot(machine, board_processor_id(mc->board_rev), vcram_base);
 }
 
 static void raspi_machine_class_common_init(MachineClass *mc,
-- 
2.30.2
