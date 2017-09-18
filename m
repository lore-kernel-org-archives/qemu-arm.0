Received: by 10.223.172.38 with SMTP id v35csp4113578wrc;
        Mon, 18 Sep 2017 12:25:15 -0700 (PDT)
X-Received: by 10.55.79.74 with SMTP id d71mr21868864qkb.167.1505762715682;
        Mon, 18 Sep 2017 12:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505762715; cv=none;
        d=google.com; s=arc-20160816;
        b=b0Ef4JoRqXXGmCJ23wbFjLACqO2F4XhPCEBz/Cm9a/pBSIbLRKjLlxbiLo/yYHbqBg
         ojuth9pLKSUzzedP5uRLZofwVPIclGnSBGA1nmGymx99InLyAlWapEViDoIxlGXhsOZQ
         ldwI5lAJk4GG6WBZmCB4VPbcqscd/0c4hjIYmj/3giMA0xuI01RPKGKNM3+0cpSdsQmY
         u0d4Rb87xw+iJGeL9ZKAVNla8eP9rt24mChnTFCEnbMEoepzne3qmLci6MbX5ZAdEUqf
         hazDzZrYLp4J2MrceHr2IuQFuuVh45BrX1IR2weDqlHAuER8xW4cxf7vfBAIs/4hHUVG
         MGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fVGBNBWJTThTwntSPpOvRmEEd9m7pLHE1wpdR8G8SUs=;
        b=mD6MTiDn1o0ZKsKM+PbfN/nRREuw+cSegd83dPJKXPgJ4fsXhozQsNba+68LMsPMwk
         WZB062fgwpuLcTAgV5N3cPRFry/lrzqN4RmGTngydUknycygDg/XReQ9JBU/QI5hfr8b
         8vYrluZani+dL2hN4yobUl10zYXmva9RPYPx5qU7Xaoq8SUASIiBCU7fETl4d94u9Xb7
         iFdzD8mqNT9bbsb6HeNjZdt8DhHa5DTXpZtSJvwkBGsxgFaw61f1QLQNDX2vaOWEADMG
         XWJavH6GdF2MIqZJ+xHIK5Zst5GekUNGGds0bq10J7DgTxtaqFD5abqJLHxSOe9B+CNU
         Uyiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IftbViit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o15si7779400qtf.248.2017.09.18.12.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IftbViit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du1fN-0005p5-5P
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1e4-0004hN-Cu
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1e2-0002DX-7P
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:52 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:38654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1du1dw-00029R-BG; Mon, 18 Sep 2017 15:23:44 -0400
Received: by mail-pg0-x242.google.com with SMTP id m30so729926pgn.5;
	Mon, 18 Sep 2017 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fVGBNBWJTThTwntSPpOvRmEEd9m7pLHE1wpdR8G8SUs=;
	b=IftbViityV7oI++3X/e4sBlmdV5YPrsU4k9IKq3SVs2qL6ltjyK6g5nhzt/O6T3QWO
	ywo/CN+djQrZQjW7GLooZTTvFKj/sDUfYyQfhXMj3yUtwJtCVjcwqwWqrbSnC5w5cRJk
	D7os7MbG8R7oOD9lVJIwubZO/V9eXUK9BuK7ub0RR1Ihp4x/HJon/iKcYcoo5DC1cluS
	YwPlYufpzJzij8MKhKT2vot7MWq7xAdXjHjETeC/hiNi8/zY017GQRh8qDzS/m74MLeT
	kYYap/j6/NrDuy3hseJPE8K8b7qfhscZJXyC8m7j9rSWXKyqwPm+TzMx/7p9Q98jApW/
	VAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fVGBNBWJTThTwntSPpOvRmEEd9m7pLHE1wpdR8G8SUs=;
	b=WRqVp0uMq+9+tiR9YTp3urV5R12MbS+6yMfbBwr62YgywK81LoUECFDJ8eYaJEFKJ4
	T8yfoenNRkMR9qvIcwKrAT7qzx+bq6mcCz5o9zmwP2CcPKBIHKcDixOMMSzXSzBuXneC
	teZ6wS6FPRp/88fBDdzzez6I1mC/WQGr3T19uqc4L/0SP/d8nacaCOhwZs9sGCVoQdNQ
	6oLJ91J8pgwPIa0cMc6XugTh3fgXew2DgLI8QmjLcTrYR8qn9pmiI2J8KeoT1ZpnWqWE
	s4/gSLCaH4ivsukAIlkvK8kvxB+F2bmycsCCMUQdE8uBEArAT6HPhFK+3sCS6bWJ6Zsr
	J2nQ==
X-Gm-Message-State: AHPjjUhp7DjbW85lO4eZtj4C5kZgyFTJOYJHwnXm3aJkDdTEUbKuVO2T
	IpNErOCQM0Hc82BG
X-Google-Smtp-Source: ADKCNb6+PPTWxQOJzxDQ/i6Mk8dXn3a06rewuqhAG+hVFY+v6IJJarYCgHUJ+0ysT8+oeooLiZkVEw==
X-Received: by 10.84.130.67 with SMTP id 61mr38110276plc.131.1505762623222;
	Mon, 18 Sep 2017 12:23:43 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id w12sm169701pfk.83.2017.09.18.12.23.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:23:42 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 19 Sep 2017 00:53:20 +0530
Message-Id: <1505762601-27143-5-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [Qemu devel v10 PATCH 4/5] msf2: Add Smartfusion2 SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ojPfpw/BuKOW

Smartfusion2 SoC has hardened Microcontroller subsystem
and flash based FPGA fabric. This patch adds support for
Microcontroller subsystem in the SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/msf2-soc.c               | 232 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  66 ++++++++++++
 4 files changed, 300 insertions(+)
 create mode 100644 hw/arm/msf2-soc.c
 create mode 100644 include/hw/arm/msf2-soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index bbdd3c1..5059d13 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -129,3 +129,4 @@ CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
+CONFIG_MSF2=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 5ee6f7d..a6cf24f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
+obj-$(CONFIG_MSF2) += msf2-soc.o
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
new file mode 100644
index 0000000..313da5d
--- /dev/null
+++ b/hw/arm/msf2-soc.c
@@ -0,0 +1,232 @@
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
+#include "qemu/cutils.h"
+#include "hw/arm/msf2-soc.h"
+#include "hw/misc/unimp.h"
+
+#define MSF2_TIMER_BASE       0x40004000
+#define MSF2_SYSREG_BASE      0x40038000
+
+#define ENVM_BASE_ADDRESS     0x60000000
+
+#define SRAM_BASE_ADDRESS     0x20000000
+
+#define MSF2_ENVM_MAX_SIZE    (512 * K_BYTE)
+
+/*
+ * eSRAM max size is 80k without SECDED(Single error correction and
+ * dual error detection) feature and 64k with SECDED.
+ * We do not support SECDED now.
+ */
+#define MSF2_ESRAM_MAX_SIZE       (80 * K_BYTE)
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
+    memory_region_init_rom(nvm, NULL, "MSF2.eNVM", s->envm_size,
+                           &error_fatal);
+    /*
+     * On power-on, the eNVM region 0x60000000 is automatically
+     * remapped to the Cortex-M3 processor executable region
+     * start address (0x0). We do not support remapping other eNVM,
+     * eSRAM and DDR regions by guest(via Sysreg) currently.
+     */
+    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM",
+                             nvm, 0, s->envm_size);
+
+    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
+    memory_region_add_subregion(system_memory, 0, nvm_alias);
+
+    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
+                           &error_fatal);
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
+        gchar *bus_name;
+
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                           qdev_get_gpio_in(armv7m, spi_irq[i]));
+
+        /* Alias controller SPI bus to the SoC itself */
+        bus_name = g_strdup_printf("spi%d", i);
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->spi[i]), "spi",
+                                  &error_abort);
+        g_free(bus_name);
+    }
+
+    /* Below devices are not modelled yet. */
+    create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
+    create_unimplemented_device("dma", 0x40003000, 0x1000);
+    create_unimplemented_device("watchdog", 0x40005000, 0x1000);
+    create_unimplemented_device("i2c_1", 0x40012000, 0x1000);
+    create_unimplemented_device("gpio", 0x40013000, 0x1000);
+    create_unimplemented_device("hs-dma", 0x40014000, 0x1000);
+    create_unimplemented_device("can", 0x40015000, 0x1000);
+    create_unimplemented_device("rtc", 0x40017000, 0x1000);
+    create_unimplemented_device("apb_config", 0x40020000, 0x10000);
+    create_unimplemented_device("emac", 0x40041000, 0x1000);
+    create_unimplemented_device("usb", 0x40043000, 0x1000);
+}
+
+static Property m2sxxx_soc_properties[] = {
+    /*
+     * part name specifies the type of SmartFusion2 device variant(this
+     * property is for information purpose only.
+     */
+    DEFINE_PROP_STRING("part-name", MSF2State, part_name),
+    DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_MAX_SIZE),
+    DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
+                        MSF2_ESRAM_MAX_SIZE),
+    /* Libero GUI shows 100Mhz as default for clocks */
+    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
+    /* default divisors in Libero GUI */
+    DEFINE_PROP_UINT8("apb0div", MSF2State, apb0div, 2),
+    DEFINE_PROP_UINT8("apb1div", MSF2State, apb1div, 2),
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
index 0000000..afea23d
--- /dev/null
+++ b/include/hw/arm/msf2-soc.h
@@ -0,0 +1,66 @@
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
+#include "hw/arm/armv7m.h"
+#include "hw/timer/mss-timer.h"
+#include "hw/misc/msf2-sysreg.h"
+#include "hw/ssi/mss-spi.h"
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
+    uint8_t apb0div;
+    uint8_t apb1div;
+
+    MSF2SysregState sysreg;
+    MSSTimerState timer;
+    MSSSpiState spi[MSF2_NUM_SPIS];
+} MSF2State;
+
+#endif
-- 
2.5.0

