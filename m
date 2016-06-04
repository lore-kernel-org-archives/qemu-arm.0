Received: by 10.25.27.66 with SMTP id b63csp617366lfb;
        Sat, 4 Jun 2016 01:19:58 -0700 (PDT)
X-Received: by 10.140.16.228 with SMTP id 91mr6642502qgb.51.1465028398013;
        Sat, 04 Jun 2016 01:19:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si5925328qhc.30.2016.06.04.01.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 01:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b96oH-0005XM-Bw
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 04:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jo-00018D-EI
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jg-00025K-3E
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:19 -0400
Received: from m12-18.163.com ([220.181.12.18]:58732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b96jd-0001x3-Sf; Sat, 04 Jun 2016 04:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Y16gqpTXkZtd2WJb52
	LxyhUHt1nMfNBK0J3diEvwfTA=; b=CjgkZe7q05jdELpdjkdLarWJukziHXemck
	OCE3ADVhIdYck4FjDFmaNW4iJrDb1EOJe7X/9YvaX+mL0ss/kjXH/an595RnRrh2
	/ZxwQvsQeY/yoQNAoVLQZCszMA+kP1CuTgzzuyIeJY33JRO7uufhKaGj9izE/Sk+
	SpOewf1cw=
Received: from debian.lan (unknown [114.111.167.200])
	by smtp14 (Coremail) with SMTP id EsCowECpfUbfjVJXKXU9AA--.28040S3;
	Sat, 04 Jun 2016 16:14:34 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 Jun 2016 16:14:20 +0800
Message-Id: <1465028065-5855-2-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
References: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
X-CM-TRANSID: EsCowECpfUbfjVJXKXU9AA--.28040S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3trWDZryfCw4UGw4fWF1xXwb_yoW8Jr1kto
	WfKF4Sgr4rGrsFyrnY9ayUZrsFqr4vgFW7A3s0kr4fGF97JF48XFyxKanrZw43AFyS9as8
	JFW5GryUKw1xu34kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUyyv3UUUUU
X-Originating-IP: [114.111.167.200]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0gt+xlUL-MTTSgAAse
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH v2 1/6] hw/char: QOM'ify pl011 model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: robh@kernel.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	armbru@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com,
	pbonzini@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aJfg6mjhyHA6

* drop qemu_char_get_next_serial and use chardev prop
* add pl011_create wrapper function to create pl011 uart device
* change affected board code to use the new way

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 hw/arm/bcm2835_peripherals.c | 16 +++-----------
 hw/arm/highbank.c            |  3 ++-
 hw/arm/integratorcp.c        |  5 +++--
 hw/arm/realview.c            |  9 ++++----
 hw/arm/stellaris.c           |  6 +++--
 hw/arm/versatilepb.c         |  9 ++++----
 hw/arm/vexpress.c            |  9 ++++----
 hw/arm/virt.c                |  1 +
 hw/char/pl011.c              | 11 +++++-----
 include/hw/char/pl011.h      | 52 ++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 86 insertions(+), 35 deletions(-)
 create mode 100644 include/hw/char/pl011.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 234d518..2e641a3 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -14,6 +14,7 @@
 #include "hw/misc/bcm2835_mbox_defs.h"
 #include "hw/arm/raspi_platform.h"
 #include "sysemu/char.h"
+#include "sysemu/sysemu.h"
 
 /* Peripheral base address on the VC (GPU) system bus */
 #define BCM2835_VC_PERI_BASE 0x7e000000
@@ -106,7 +107,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *ram;
     Error *err = NULL;
     uint32_t ram_size, vcram_size;
-    CharDriverState *chr;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
@@ -147,6 +147,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
 
     /* UART0 */
+    qdev_prop_set_chr(DEVICE(s->uart0), "chardev", serial_hds[0]);
     object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -158,17 +159,8 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(s->uart0, 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_UART));
-
     /* AUX / UART1 */
-    /* TODO: don't call qemu_char_get_next_serial() here, instead set
-     * chardev properties for each uart at the board level, once pl011
-     * (uart0) has been updated to avoid qemu_char_get_next_serial()
-     */
-    chr = qemu_char_get_next_serial();
-    if (chr == NULL) {
-        chr = qemu_chr_new("bcm2835.uart1", "null", NULL);
-    }
-    qdev_prop_set_chr(DEVICE(&s->aux), "chardev", chr);
+    qdev_prop_set_chr(DEVICE(&s->aux), "chardev", serial_hds[1]);
 
     object_property_set_bool(OBJECT(&s->aux), true, "realized", &err);
     if (err) {
@@ -292,8 +284,6 @@ static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = bcm2835_peripherals_realize;
-    /* Reason: realize() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo bcm2835_peripherals_type_info = {
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 41029a6..80e5fd4 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -30,6 +30,7 @@
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/char/pl011.h"
 
 #define SMP_BOOT_ADDR           0x100
 #define SMP_BOOT_REG            0x40
@@ -326,7 +327,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, 0xfff34000);
     sysbus_connect_irq(busdev, 0, pic[18]);
-    sysbus_create_simple("pl011", 0xfff36000, pic[20]);
+    pl011_create(0xfff36000, pic[20], serial_hds[0]);
 
     dev = qdev_create(NULL, "highbank-regs");
     qdev_init_nofail(dev);
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 24f1687..96dc150 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -20,6 +20,7 @@
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
+#include "hw/char/pl011.h"
 
 #define TYPE_INTEGRATOR_CM "integrator_core"
 #define INTEGRATOR_CM(obj) \
@@ -588,8 +589,8 @@ static void integratorcp_init(MachineState *machine)
     sysbus_create_varargs("integrator_pit", 0x13000000,
                           pic[5], pic[6], pic[7], NULL);
     sysbus_create_simple("pl031", 0x15000000, pic[8]);
-    sysbus_create_simple("pl011", 0x16000000, pic[1]);
-    sysbus_create_simple("pl011", 0x17000000, pic[2]);
+    pl011_create(0x16000000, pic[1], serial_hds[0]);
+    pl011_create(0x17000000, pic[2], serial_hds[1]);
     icp = sysbus_create_simple(TYPE_ICP_CONTROL_REGS, 0xcb000000,
                                qdev_get_gpio_in(sic, 3));
     sysbus_create_simple("pl050_keyboard", 0x18000000, pic[3]);
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 3222b36..7d0aa6f 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -23,6 +23,7 @@
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/char/pl011.h"
 
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
@@ -202,10 +203,10 @@ static void realview_init(MachineState *machine,
     sysbus_create_simple("pl050_keyboard", 0x10006000, pic[20]);
     sysbus_create_simple("pl050_mouse", 0x10007000, pic[21]);
 
-    sysbus_create_simple("pl011", 0x10009000, pic[12]);
-    sysbus_create_simple("pl011", 0x1000a000, pic[13]);
-    sysbus_create_simple("pl011", 0x1000b000, pic[14]);
-    sysbus_create_simple("pl011", 0x1000c000, pic[15]);
+    pl011_create(0x10009000, pic[12], serial_hds[0]);
+    pl011_create(0x1000a000, pic[13], serial_hds[1]);
+    pl011_create(0x1000b000, pic[14], serial_hds[2]);
+    pl011_create(0x1000c000, pic[15], serial_hds[3]);
 
     /* DMA controller is optional, apparently.  */
     sysbus_create_simple("pl081", 0x10030000, pic[24]);
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 4459171..794a3ad 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -20,6 +20,7 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "hw/char/pl011.h"
 
 #define GPIO_A 0
 #define GPIO_B 1
@@ -1303,8 +1304,9 @@ static void stellaris_init(const char *kernel_filename, const char *cpu_model,
 
     for (i = 0; i < 4; i++) {
         if (board->dc2 & (1 << i)) {
-            sysbus_create_simple("pl011_luminary", 0x4000c000 + i * 0x1000,
-                                 qdev_get_gpio_in(nvic, uart_irq[i]));
+            pl011_luminary_create(0x4000c000 + i * 0x1000,
+                                  qdev_get_gpio_in(nvic, uart_irq[i]),
+                                  serial_hds[i]);
         }
     }
     if (board->dc2 & (1 << 4)) {
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index d079bc9..20dd356 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -23,6 +23,7 @@
 #include "exec/address-spaces.h"
 #include "hw/block/flash.h"
 #include "qemu/error-report.h"
+#include "hw/char/pl011.h"
 
 #define VERSATILE_FLASH_ADDR 0x34000000
 #define VERSATILE_FLASH_SIZE (64 * 1024 * 1024)
@@ -284,10 +285,10 @@ static void versatile_init(MachineState *machine, int board_id)
         n--;
     }
 
-    sysbus_create_simple("pl011", 0x101f1000, pic[12]);
-    sysbus_create_simple("pl011", 0x101f2000, pic[13]);
-    sysbus_create_simple("pl011", 0x101f3000, pic[14]);
-    sysbus_create_simple("pl011", 0x10009000, sic[6]);
+    pl011_create(0x101f1000, pic[12], serial_hds[0]);
+    pl011_create(0x101f2000, pic[13], serial_hds[1]);
+    pl011_create(0x101f3000, pic[14], serial_hds[2]);
+    pl011_create(0x10009000, sic[6], serial_hds[3]);
 
     sysbus_create_simple("pl080", 0x10130000, pic[17]);
     sysbus_create_simple("sp804", 0x101e2000, pic[4]);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 70b3e70..58760f4 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -39,6 +39,7 @@
 #include "sysemu/device_tree.h"
 #include "qemu/error-report.h"
 #include <libfdt.h>
+#include "hw/char/pl011.h"
 
 #define VEXPRESS_BOARD_ID 0x8e0
 #define VEXPRESS_FLASH_SIZE (64 * 1024 * 1024)
@@ -631,10 +632,10 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("pl050_keyboard", map[VE_KMI0], pic[12]);
     sysbus_create_simple("pl050_mouse", map[VE_KMI1], pic[13]);
 
-    sysbus_create_simple("pl011", map[VE_UART0], pic[5]);
-    sysbus_create_simple("pl011", map[VE_UART1], pic[6]);
-    sysbus_create_simple("pl011", map[VE_UART2], pic[7]);
-    sysbus_create_simple("pl011", map[VE_UART3], pic[8]);
+    pl011_create(map[VE_UART0], pic[5], serial_hds[0]);
+    pl011_create(map[VE_UART1], pic[6], serial_hds[1]);
+    pl011_create(map[VE_UART2], pic[7], serial_hds[2]);
+    pl011_create(map[VE_UART3], pic[8], serial_hds[3]);
 
     sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
     sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e77ed88..883d89c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -536,6 +536,7 @@ static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic, int uart,
     DeviceState *dev = qdev_create(NULL, "pl011");
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
 
+    qdev_prop_set_chr(dev, "chardev", serial_hds[0]);
     qdev_init_nofail(dev);
     memory_region_add_subregion(mem, base,
                                 sysbus_mmio_get_region(s, 0));
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6876ea6..c0fbf8a 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -274,6 +274,11 @@ static const VMStateDescription vmstate_pl011 = {
     }
 };
 
+static Property pl011_properties[] = {
+    DEFINE_PROP_CHR("chardev", PL011State, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pl011_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -295,9 +300,6 @@ static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
 
-    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
-    s->chr = qemu_char_get_next_serial();
-
     if (s->chr) {
         qemu_chr_add_handlers(s->chr, pl011_can_receive, pl011_receive,
                               pl011_event, s);
@@ -310,8 +312,7 @@ static void pl011_class_init(ObjectClass *oc, void *data)
 
     dc->realize = pl011_realize;
     dc->vmsd = &vmstate_pl011;
-    /* Reason: realize() method uses qemu_char_get_next_serial() */
-    dc->cannot_instantiate_with_device_add_yet = true;
+    dc->props = pl011_properties;
 }
 
 static const TypeInfo pl011_arm_info = {
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
new file mode 100644
index 0000000..93bd7ee
--- /dev/null
+++ b/include/hw/char/pl011.h
@@ -0,0 +1,52 @@
+/*
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
+#ifndef PL011_UART_H
+#define PL011_UART_H
+
+static inline DeviceState *pl011_create(hwaddr addr,
+                                        qemu_irq irq,
+                                        CharDriverState *chr)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_create(NULL, "pl011");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(s, 0, addr);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
+
+static inline DeviceState *pl011_luminary_create(hwaddr addr,
+                                                 qemu_irq irq,
+                                                 CharDriverState *chr)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_create(NULL, "pl011_luminary");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(s, 0, addr);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
+
+#endif
-- 
2.8.1


