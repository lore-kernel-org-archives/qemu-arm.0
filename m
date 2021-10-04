Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v17sm4408981wrm.30.2021.10.04.06.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 747B51FF9C;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [PATCH  v1 5/7] hw/arm/bcm2836: Add the BCM2711 which uses a GICv2
Date: Mon,  4 Oct 2021 14:47:39 +0100
Message-Id: <20211004134742.2044280-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fE0HjbCFOTPB

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The BCM2711 is improvement of the BCM2837:
- Cortex-A72 instead of the A53
- peripheral block and local soc controller are mapped differently,
- GICv2
- PCIe block
- exhanced MMU to address over 4GiB of SDRAM

See https://www.raspberrypi.org/forums/viewtopic.php?t=244479&start=25
and https://patchwork.kernel.org/patch/11053097/

This patch starts mapping the GICv2 but interrupt lines are NOT
wired (yet).

This is enough to start running the Ubuntu kernel8.img from [1].

Extract the kernel with:

  $ mkdir bootpart
  $ guestfish \
      --ro \
      -a ubuntu-18.04.3-preinstalled-server-arm64+raspi4.img \
      -m /dev/sda1
  Welcome to guestfish, the guest filesystem shell for
  editing virtual machine filesystems and disk images.

  ><fs> ls /
  COPYING.linux
  LICENCE.broadcom
  System.map
  armstub8-gic.bin
  bcm2710-rpi-3-b-plus.dtb
  bcm2710-rpi-3-b.dtb
  bcm2710-rpi-cm3.dtb
  bcm2711-rpi-4-b.dtb
  bcm2837-rpi-3-b-plus.dtb
  bcm2837-rpi-3-b.dtb
  cmdline.txt
  config.txt
  fixup4.dat
  fixup4cd.dat
  fixup4db.dat
  fixup4x.dat
  kernel8.img
  overlays
  start4.elf
  start4cd.elf
  start4db.elf
  start4x.elf
  ><fs> copy-out / bootpart/
  ><fs> q

Then some progress can be noticed running:

  $ qemu-system-aarch64 -d unimp,guest_errors,int,in_asm \
      -M raspi4 \
      -kernel bootpart/kernel8.img \
      -dtb bootpart/bcm2711-rpi-4-b.dtb \
      -initrd bootpart/boot/initrd.img \
      -append \
         "earlycon=pl011,0xfe201000 console=ttyAMA0 console=tty1 loglevel=8"

Not very interesting, but it runs until configuring the GIC.
(remove 'in_asm' if too verbose).

TODO:

- wire IRQs to the GIC :)

- map the SPI bootrom from [3] (boot sequence: [4])

- per [2] we could try booting without using the GIC, adding "enable_gic=0"
  in config.txt. this variable is parsed by the firmware:

  $ fgrep -r enable_gic bootpart
  Binary file bootpart/start4x.elf matches
  Binary file bootpart/start4.elf matches
  Binary file bootpart/start4db.elf matches
  Binary file bootpart/start4cd.elf matches
  bootpart/config.txt:enable_gic=1

  the stub [5] doesn't seem to check a register for it.
  maybe it falls back to kernel7l?

- decompile start4.elf to check how 'enable_gic' is used
  using vc4 toolchain from [6]

[1] https://github.com/TheRemote/Ubuntu-Server-raspi4-unofficial/releases
[2] https://jamesachambers.com/raspberry-pi-ubuntu-server-18-04-2-installation-guide/
[3] https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md
[4] https://raspberrypi.stackexchange.com/questions/10442/what-is-the-boot-sequence
[5] https://github.com/raspberrypi/tools/commit/7f4a937e1bacbc111a22552169bc890b4bb26a94#diff-8c41083e9fa0c98f1c3015e11b897444
[6] https://github.com/christinaa/rpi-open-firmware

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: QOM fixes and 2711 rename]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:
  - fix QOM operations following refactoring since last post
  - rename to BCM2711
  - use sysbus_realize(SYS_BUS_DEVICE(&s->gic)
  - move peri_base/ctrl to locations pointed to by DTB (0x7e000000/0x40000000)
---
 include/hw/arm/bcm2836.h |  3 ++
 hw/arm/bcm2836.c         | 77 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/raspi.c           |  2 ++
 3 files changed, 82 insertions(+)

diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 6f90cabfa3..c8f64fa06d 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -14,6 +14,7 @@
 
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/intc/bcm2836_control.h"
+#include "hw/intc/arm_gic.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 
@@ -29,6 +30,7 @@ OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)
 #define TYPE_BCM2835 "bcm2835"
 #define TYPE_BCM2836 "bcm2836"
 #define TYPE_BCM2837 "bcm2837"
+#define TYPE_BCM2711 "bcm2711"
 
 struct BCM283XState {
     /*< private >*/
@@ -40,6 +42,7 @@ struct BCM283XState {
     struct {
         ARMCPU core;
     } cpu[BCM283X_NCPUS];
+    GICState gic;
     BCM2836ControlState control;
     BCM2835PeripheralState peripherals;
 };
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 255ba8265a..99dc15e6e4 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -25,6 +25,7 @@ typedef struct BCM283XClass {
     unsigned core_count;
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
+    hwaddr gic_base;
     int clusterid;
 } BCM283XClass;
 
@@ -36,6 +37,15 @@ typedef struct BCM283XClass {
 static Property bcm2836_enabled_cores_property =
     DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus, 0);
 
+#define GIC_NUM_IRQS                256
+
+#define GIC_BASE_OFS                0x0000
+#define GIC_DIST_OFS                0x1000
+#define GIC_CPU_OFS                 0x2000
+#define GIC_VIFACE_THIS_OFS         0x4000
+#define GIC_VIFACE_OTHER_OFS(cpu)  (0x5000 + (cpu) * 0x200)
+#define GIC_VCPU_OFS                0x6000
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -56,6 +66,10 @@ static void bcm2836_init(Object *obj)
                                 TYPE_BCM2836_CONTROL);
     }
 
+    if (bc->gic_base) {
+        object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
+    }
+
     object_initialize_child(obj, "peripherals", &s->peripherals,
                             TYPE_BCM2835_PERIPHERALS);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
@@ -126,6 +140,50 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, bc->ctrl_base);
 
+    /* bcm2838 GICv2 */
+    if (bc->gic_base) {
+        if (!object_property_set_uint(OBJECT(&s->gic), "revision", 2, errp)) {
+            return;
+        }
+
+        if (!object_property_set_uint(OBJECT(&s->gic), "num-cpu",
+                                      BCM283X_NCPUS, errp)) {
+            return;
+        }
+
+        if (!object_property_set_uint(OBJECT(&s->gic), "num-irq",
+                                      32 + GIC_NUM_IRQS, errp)) {
+            return;
+        }
+
+        if (!object_property_set_bool(OBJECT(&s->gic),
+                                      "has-virtualization-extensions",
+                                      true, errp)) {
+            return;
+        }
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 0,
+                        bc->ctrl_base + bc->gic_base + GIC_DIST_OFS);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 1,
+                        bc->ctrl_base + bc->gic_base + GIC_CPU_OFS);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 2,
+                        bc->ctrl_base + bc->gic_base + GIC_VIFACE_THIS_OFS);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 3,
+                        bc->ctrl_base + bc->gic_base + GIC_VCPU_OFS);
+
+        for (n = 0; n < BCM283X_NCPUS; n++) {
+            sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 4 + n,
+                            bc->ctrl_base + bc->gic_base
+                            + GIC_VIFACE_OTHER_OFS(n));
+        }
+
+        /* TODO wire IRQs!!! */
+    }
+
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
@@ -216,6 +274,21 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     bc->clusterid = 0x0;
     dc->realize = bcm2836_realize;
 };
+
+static void bcm2711_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    BCM283XClass *bc = BCM283X_CLASS(oc);
+
+    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a72");
+    bc->core_count = BCM283X_NCPUS;
+    bc->peri_base = 0x7e000000;
+    bc->ctrl_base = 0x40000000;
+    bc->clusterid = 0x0;
+    bc->gic_base = 0x40000,
+    dc->realize = bcm2836_realize;
+}
+
 #endif
 
 static const TypeInfo bcm283x_types[] = {
@@ -232,6 +305,10 @@ static const TypeInfo bcm283x_types[] = {
         .name           = TYPE_BCM2837,
         .parent         = TYPE_BCM283X,
         .class_init     = bcm2837_class_init,
+    }, {
+        .name           = TYPE_BCM2711,
+        .parent         = TYPE_BCM283X,
+        .class_init     = bcm2711_class_init,
 #endif
     }, {
         .name           = TYPE_BCM283X,
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 3fb1c3138b..03f54887f4 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -71,6 +71,7 @@ typedef enum RaspiProcessorId {
     PROCESSOR_ID_BCM2835 = 0,
     PROCESSOR_ID_BCM2836 = 1,
     PROCESSOR_ID_BCM2837 = 2,
+    PROCESSOR_ID_BCM2711 = 3,
 } RaspiProcessorId;
 
 static const struct {
@@ -80,6 +81,7 @@ static const struct {
     [PROCESSOR_ID_BCM2835] = {TYPE_BCM2835, 1},
     [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS},
     [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS},
+    [PROCESSOR_ID_BCM2711] = {TYPE_BCM2711, BCM283X_NCPUS},
 };
 
 static uint64_t board_ram_size(uint32_t board_rev)
-- 
2.30.2
