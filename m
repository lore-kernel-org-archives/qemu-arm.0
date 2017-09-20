Received: by 10.223.172.38 with SMTP id v35csp1112333wrc;
        Wed, 20 Sep 2017 13:21:39 -0700 (PDT)
X-Received: by 10.55.43.65 with SMTP id r62mr9022033qkh.250.1505938899138;
        Wed, 20 Sep 2017 13:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505938899; cv=none;
        d=google.com; s=arc-20160816;
        b=DD+53Yvyb3h6s7b/CfgCec2X8BiaB/mJ+J+MEMoWhaiUr3gP70LobZrOI2MJRWxX0M
         bcdYB8EbxRQCFaOj2RFLvJ2fa3E+y0X4CnjMLb8aNHLfc24nH/jVmWFbqmziY3Cesg6Y
         xCS6LCDSWiREV5zMrkThvGMNhWnOygGuTbNCE1yzPHX6J2xONvp1202QETywhmC5jbQB
         S/YVKh0uDPUITzOtCUwPHWeFEvuJUEJeN2kDBdXcF+eVKu7xUuLS6DVcTKpVdbWVmNXY
         lwzUzt45EZxUHGNSnF3AQkCofoH4uABtkge4w9Epbn9EdVLviyakV/TGnA58Ay/d4zBN
         dTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hC8Ui+2j3hfjbjX3SNECOzEftLhGMyI4ZYr5UWqxC1w=;
        b=Wl+S+/AiDJTyjfTGIQvz9AvHx3K+910cl7EChNXcfS3VJcOh2wOlw/AgHyD8E9H9a7
         RhVmTLxnUoWXrTjgMT6F8g1T3sBrE1VKT8+wwsOuJganlR1mMpvQ7/1lyXs7nEwEsd+Q
         1vIvF4nH9MXdCBzdAVCb6vVMVx9Aw887ZvK3Jum3Zr6xcFmDTHeRTf3QzbGg+p/rXXzZ
         CM3giqIiVLWDL0fdqSBa9epbOiKTqPoqS4mfR/Gl/nBIXmKiHdgCFrrI3UG1r5zPqrCf
         jFaZ4uoc/mIGHqslXrJTWuzn68Uts2Toj1Ir0mBsZVbYViGlWJhin8Rv5vHN5VHYVeI2
         tNoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uDX6w7e4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si2520760qkc.254.2017.09.20.13.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 13:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uDX6w7e4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dulV2-0002A8-Rb
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 16:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRj-0007xA-6B
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:18:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRf-0002iF-Uy
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:18:11 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRb-0002ec-BC; Wed, 20 Sep 2017 16:18:03 -0400
Received: by mail-qk0-x241.google.com with SMTP id g128so2390616qke.0;
	Wed, 20 Sep 2017 13:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hC8Ui+2j3hfjbjX3SNECOzEftLhGMyI4ZYr5UWqxC1w=;
	b=uDX6w7e45sGYa8PAN5so4ciOvzcUGF+m06qPVSiKFZqsadIKXifLh512DxIlgOYti3
	gbY9NDZA91kYrh/fIAl+eQAk//FOyK6G0+cvL6y3/jkpwCXGYLesbR7XbntGVybRGDmz
	u197YcPV3iJZhZs0fqPH3X7uosUY5wWbxXhBK0kPIy8c/JYvvtO8bSEiPfZ8WWLqYq29
	8nz/Ls3M/UATDMKnGBnjBmDPIjrHXn2uBefn3QcLv7uI/OblfLqdOWf3lwEKIMMrzU7T
	w6R6iDBLUU76+t5uin771j/wkrfgUt3ObKk0HjcSLzzdB1wj8Pv+nfItB2RA1Wo9/k0b
	kkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hC8Ui+2j3hfjbjX3SNECOzEftLhGMyI4ZYr5UWqxC1w=;
	b=aKVPhTGCKBfdavYv3vT12BRgx4xiGnnKORy4AZQTzwI9uvuSvOlJ8IMJ+G/nVYQzXo
	qkImwa7/L0bli2vV55ijKfwplIYuaTPHkS1oDcecGyn67mCws8LS5i8C3fgy/m/lOGnp
	htS66P5HiFaONHg5Rsihrp2DJb3BIExWAeyghpfcHgoMbBlzB9JE+VrRz23Za8HBKjjC
	c7QEn48HOcKBJr1PQt/iuMeft5qbimN9+U/Up5uQjYGMg5bg073OGhfRiVGp0k9FTUrc
	yvNAOUZAbgg6svui48m8iWW+luv2HA+/i57dW3lFWtkaEwSqFMzxqKE4LEHj2rvfEJOG
	zXRA==
X-Gm-Message-State: AHPjjUhaIiOq8jJqDrL6QlPcm5bWofQtzcEgHK/tpBH5wtp3sUJrGOqn
	QGKeDrL/Xda4U4VJ7b4jPUU=
X-Google-Smtp-Source: AOwi7QBoVzRvtMFbugYp7AdyG5f8H073qb9w+DNT+cdR1RhW7kO71cgw1I2uneJY5FUa8YaXXZZWVQ==
X-Received: by 10.55.74.133 with SMTP id x127mr8401286qka.239.1505938682775;
	Wed, 20 Sep 2017 13:18:02 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u52sm1953092qtb.34.2017.09.20.13.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 13:18:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Sep 2017 17:17:36 -0300
Message-Id: <20170920201737.25723-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920201737.25723-1-f4bug@amsat.org>
References: <20170920201737.25723-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v11 4/5] msf2: Add Smartfusion2 SoC
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kfyokrj3Z4+k

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

Smartfusion2 SoC has hardened Microcontroller subsystem
and flash based FPGA fabric. This patch adds support for
Microcontroller subsystem in the SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: drop cpu_model to directly use cpu type, check m3clk non null]
---
 default-configs/arm-softmmu.mak |   1 +
 include/hw/arm/msf2-soc.h       |  67 +++++++++++
 hw/arm/msf2-soc.c               | 238 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |   1 +
 4 files changed, 307 insertions(+)
 create mode 100644 include/hw/arm/msf2-soc.h
 create mode 100644 hw/arm/msf2-soc.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index bbdd3c1d8b..5059d134c8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -129,3 +129,4 @@ CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
+CONFIG_MSF2=y
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
new file mode 100644
index 0000000000..3cfe5c76ee
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
+    char *cpu_type;
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
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
new file mode 100644
index 0000000000..6f97fa9fe3
--- /dev/null
+++ b/hw/arm/msf2-soc.c
@@ -0,0 +1,238 @@
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
+    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
+                                     "memory", &error_abort);
+    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (!s->m3clk) {
+        error_setg(errp, "Invalid m3clk value");
+        error_append_hint(errp, "m3clk can not be zero\n");
+        return;
+    }
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
+    DEFINE_PROP_STRING("cpu-type", MSF2State, cpu_type),
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
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 5ee6f7da5b..a6cf24f6ac 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
+obj-$(CONFIG_MSF2) += msf2-soc.o
-- 
2.14.1

