Received: by 10.25.227.6 with SMTP id a6csp1807236lfh;
        Sun, 2 Jul 2017 21:49:33 -0700 (PDT)
X-Received: by 10.237.52.165 with SMTP id x34mr23947132qtd.55.1499057373268;
        Sun, 02 Jul 2017 21:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499057373; cv=none;
        d=google.com; s=arc-20160816;
        b=mIpgSHCoY4vqIs45KMCGbyDDbLuue+1SCBmXupRQdZ/B2sGygMEtRAAP2yH7bagSu8
         Rhdm/LQNxlNOM1+5dHYzaeQJzZZhXrSH1EwiyoVqmwuPkBwewZ2u883OgAYPl7TOhCtP
         ZB/vO/mHKigce83VU3gEYAr+lOrmBp+9z92I7XJvy+tKEzm3mOqDTJ71BvV0J71ZONo7
         lWBK0VfvJ8bZODuOkqLFQzzc4GdwGqo2YDW+wiWOFBUOfoD1nIY5EdvMwxZzbLBJb/fS
         xg3bHdOGuSWex6r23VzjE4c2LSu5ZQq7d+Jnb8JdOvViGHEIQsggWW+u+IdK67CTXXdt
         S8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9mPQkmafV4ZWSOs9jkNWltNBNqJR0v6kkmwQzXzFkhA=;
        b=PotA6YOekg0C62GbuMHf5ZUj8PnZh7O46REtH3Z3klimaIhVT0q56QjHG44ZeAPyC5
         qAYu/GCntnySH1IF6FOsVH/7fOZQ0VfcJ3kmxacwSW/p6Gw37qjlO/qKPdNCskzwlYfC
         1MSbRlAYbPBkOOENIejLROnHE24zKGS9HA2wohCULsduMVPGd6tZPwadb6aAFmCMvZP0
         YX7wCGa8tAEBKEOyX6a9xl/ndAokFu6XWmkcniprxRB/PnBMUBtAeX3vejzh+SYML3rq
         /NeTw0BkCJ/j0Rn8FGxI/N/FWKQl7WM9GbZdakAH6c5l5YQJTQSzQfsfvONRA7U8yfeT
         rmig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=kWci1uFZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si3669454qti.159.2017.07.02.21.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 21:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=kWci1uFZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRtIg-0002Vc-D3
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 00:49:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFM-00086s-TA
	for qemu-devel@nongnu.org; Mon, 03 Jul 2017 00:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFH-0008Db-TF
	for qemu-devel@nongnu.org; Mon, 03 Jul 2017 00:46:04 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dRtFH-0008Bd-L0; Mon, 03 Jul 2017 00:45:59 -0400
Received: by mail-pg0-x243.google.com with SMTP id u36so21800042pgn.3;
	Sun, 02 Jul 2017 21:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9mPQkmafV4ZWSOs9jkNWltNBNqJR0v6kkmwQzXzFkhA=;
	b=kWci1uFZ69kN3POazM2PvuDWZQbWBEIUAPjBUEJc8XQ8V++E6lCVzNzmgI5Veh54a5
	3ZvgwKgC+TWPs0d2O9PRoDJO1GVo+h0+eGc82roabFijZeMSMWTw1AKQWO/FNRkB8VWp
	ODlnicUz7hHlUxYpzsYjSV2+5McCkwWdOe6jtUdRQz50bIbcywoUk9E3x8QMyFmZbPuw
	w2/Nu2terrtoNkKD0EtmTdyHJjxB9z0DLsDgsIkWcJ4HMe5d6b9a1T48LzpEs2U6c0Wu
	vLPzYA5S2+AEYb77i5omoyht1tyB8x4mum9aaDW9L0ROZU4YcUxbcaOMuNwofxB2ixEi
	PXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9mPQkmafV4ZWSOs9jkNWltNBNqJR0v6kkmwQzXzFkhA=;
	b=oFVzFYSzQlt8HhfZGRQOustGnW9+hUcU581G1xu+RixM1GKNmvAMR1vxsXHfO2Fy1h
	KxT1yUDF4MCUnYPQhozB1ubJ4Ptfr+kgd3rlemBxlZWoJzE07cbdCD4DO2BMQzGUHrK6
	DXlzMLnen9ivWWgiJmnIP7aUYrNlDBDEEVxvLScOeGqwYLkVpkWgGwGxnEXLu1q7yWxk
	4ueZKhll5qbgFXwuef0dLjSkn8A1fQSme+qnSt5SMDacKHzpf5eEorqHNRvarldDygb2
	TXhopL5eqc51lgo5m3ChNllQIqODF5f87hyXH0h3hoVR1rkG62iNvYIh413M4gmQ4aXa
	GeeA==
X-Gm-Message-State: AIVw113nX0Gh7MKJnk/7wtLDAxX2JoMRjRlxhPl/tOxmuNcGGw8f1PeT
	74vp6PaQWUZEnDqE
X-Received: by 10.99.116.28 with SMTP id p28mr8362927pgc.262.1499057158476;
	Sun, 02 Jul 2017 21:45:58 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	v70sm9324145pfi.110.2017.07.02.21.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Jul 2017 21:45:58 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon,  3 Jul 2017 10:15:14 +0530
Message-Id: <1499057115-6773-5-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [Qemu devel v6 PATCH 4/5] msf2: Add Smartfusion2 SoC.
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Os25CR0ZD8av

Smartfusion2 SoC has hardened Microcontroller subsystem
and flash based FPGA fabric. This patch adds support for
Microcontroller subsystem in the SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/msf2-soc.c               | 216 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  67 +++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 hw/arm/msf2-soc.c
 create mode 100644 include/hw/arm/msf2-soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 78d7af0..7062512 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -122,3 +122,4 @@ CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
+CONFIG_MSF2=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4c5c4ee..c828061 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
+obj-$(CONFIG_MSF2) += msf2-soc.o
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
new file mode 100644
index 0000000..d45827f
--- /dev/null
+++ b/hw/arm/msf2-soc.c
@@ -0,0 +1,216 @@
+/*
+ * SmartFusion2 SoC emulation.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+#include "hw/char/serial.h"
+#include "hw/boards.h"
+#include "sysemu/block-backend.h"
+#include "hw/arm/msf2-soc.h"
+
+#define MSF2_TIMER_BASE     0x40004000
+#define MSF2_SYSREG_BASE    0x40038000
+
+#define ENVM_BASE_ADDRESS     0x60000000
+
+#define SRAM_BASE_ADDRESS     0x20000000
+
+#define MSF2_ENVM_SIZE        (512 * K_BYTE)
+#define MSF2_ESRAM_SIZE       (64 * K_BYTE)
+
+static const uint32_t spi_addr[MSF2_NUM_SPIS] = { 0x40001000 , 0x40011000 };
+static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
+
+static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
+static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
+static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
+
+static void m2sxxx_soc_initfn(Object *obj)
+{
+    MSF2State *s = MSF2_SOC(obj);
+    int i;
+
+    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
+    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
+
+    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
+    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
+
+    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSS_TIMER);
+    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
+
+    for (i = 0; i < MSF2_NUM_SPIS; i++) {
+        object_initialize(&s->spi[i], sizeof(s->spi[i]),
+                          TYPE_MSS_SPI);
+        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+    }
+}
+
+static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
+{
+    MSF2State *s = MSF2_SOC(dev_soc);
+    DeviceState *dev, *armv7m;
+    SysBusDevice *busdev;
+    Error *err = NULL;
+    int i;
+
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *nvm = g_new(MemoryRegion, 1);
+    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
+
+    memory_region_init_ram(nvm, NULL, "MSF2.eNVM", s->envm_size,
+                           &error_fatal);
+
+    /*
+     * On power-on, the eNVM region 0x60000000 is automatically
+     * remapped to the Cortex-M3 processor executable region
+     * start address (0x0). We do not support remapping other eNVM,
+     * eSRAM and DDR regions by guest(via Sysreg) currently.
+     */
+    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
+                             nvm, 0, s->envm_size);
+    vmstate_register_ram_global(nvm);
+
+    memory_region_set_readonly(nvm, true);
+    memory_region_set_readonly(nvm_alias, true);
+
+    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
+    memory_region_add_subregion(system_memory, 0, nvm_alias);
+
+    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
+                           &error_fatal);
+    vmstate_register_ram_global(sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+
+    armv7m = DEVICE(&s->armv7m);
+    qdev_prop_set_uint32(armv7m, "num-irq", 81);
+    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
+    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
+                                     "memory", &error_abort);
+    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    system_clock_scale = NANOSECONDS_PER_SECOND / s->m3clk;
+
+    for (i = 0; i < MSF2_NUM_UARTS; i++) {
+        if (serial_hds[i]) {
+            serial_mm_init(get_system_memory(), uart_addr[i], 2,
+                           qdev_get_gpio_in(armv7m, uart_irq[i]),
+                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);
+        }
+    }
+
+    dev = DEVICE(&s->timer);
+    /* APB0 clock is the timer input clock */
+    qdev_prop_set_uint32(dev, "clock-frequency", s->m3clk / s->apb0div);
+    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
+    sysbus_connect_irq(busdev, 0,
+                           qdev_get_gpio_in(armv7m, timer_irq[0]));
+    sysbus_connect_irq(busdev, 1,
+                           qdev_get_gpio_in(armv7m, timer_irq[1]));
+
+    dev = DEVICE(&s->sysreg);
+    qdev_prop_set_uint32(dev, "apb0divisor", s->apb0div);
+    qdev_prop_set_uint32(dev, "apb1divisor", s->apb1div);
+    object_property_set_bool(OBJECT(&s->sysreg), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
+
+    for (i = 0; i < MSF2_NUM_SPIS; i++) {
+        gchar *bus_name = g_strdup_printf("spi%d", i);
+
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
+        if (err != NULL) {
+            g_free(bus_name);
+            error_propagate(errp, err);
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                           qdev_get_gpio_in(armv7m, spi_irq[i]));
+
+        /* Alias controller SPI bus to the SoC itself */
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->spi[i]), "spi",
+                                  &error_abort);
+        g_free(bus_name);
+    }
+}
+
+static Property m2sxxx_soc_properties[] = {
+    /*
+     * part name specifies the type of SmartFusion2 device variant(this
+     * property is for information purpose only.
+     */
+    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
+    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_SIZE),
+    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size, MSF2_ESRAM_SIZE),
+    /* Libero GUI shows 100Mhz as default for clocks */
+    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
+    /* default divisors in Libero GUI */
+    DEFINE_PROP_UINT32("apb0div", MSF2State, apb0div, 2),
+    DEFINE_PROP_UINT32("apb1div", MSF2State, apb1div, 2),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = m2sxxx_soc_realize;
+    dc->props = m2sxxx_soc_properties;
+}
+
+static const TypeInfo m2sxxx_soc_info = {
+    .name          = TYPE_MSF2_SOC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MSF2State),
+    .instance_init = m2sxxx_soc_initfn,
+    .class_init    = m2sxxx_soc_class_init,
+};
+
+static void m2sxxx_soc_types(void)
+{
+    type_register_static(&m2sxxx_soc_info);
+}
+
+type_init(m2sxxx_soc_types)
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
new file mode 100644
index 0000000..9ed677a
--- /dev/null
+++ b/include/hw/arm/msf2-soc.h
@@ -0,0 +1,67 @@
+/*
+ * Microsemi Smartfusion2 SoC
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_ARM_MSF2_SOC_H
+#define HW_ARM_MSF2_SOC_H
+
+#include "hw/misc/msf2-sysreg.h"
+#include "hw/timer/mss-timer.h"
+#include "hw/ssi/mss-spi.h"
+#include "hw/arm/armv7m.h"
+#include "qemu/cutils.h"
+
+#define TYPE_MSF2_SOC     "msf2-soc"
+#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
+
+#define MSF2_NUM_SPIS         2
+#define MSF2_NUM_UARTS        2
+
+/*
+ * System timer consists of two programmable 32-bit
+ * decrementing counters that generate individual interrupts to
+ * the Cortex-M3 processor
+ */
+#define MSF2_NUM_TIMERS       2
+
+typedef struct MSF2State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    ARMv7MState armv7m;
+
+    char *part_name;
+    uint64_t envm_size;
+    uint64_t esram_size;
+
+    uint32_t m3clk;
+    uint32_t apb0div;
+    uint32_t apb1div;
+
+    MSF2SysregState sysreg;
+    MSSTimerState timer;
+    MSSSpiState spi[MSF2_NUM_SPIS];
+} MSF2State;
+
+#endif
-- 
2.5.0

