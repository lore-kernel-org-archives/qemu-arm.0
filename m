Received: by 10.223.172.38 with SMTP id v35csp622580wrc;
        Thu, 7 Sep 2017 12:29:35 -0700 (PDT)
X-Received: by 10.200.45.73 with SMTP id o9mr627633qta.292.1504812575579;
        Thu, 07 Sep 2017 12:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504812575; cv=none;
        d=google.com; s=arc-20160816;
        b=IliwbNU4L9i8ynplqUe9t+gZDoj1dOtBV7nh/L86+jJIdQzDOEAv2TlxbbNVHg/KMQ
         PTY59TmCW7E/IZouyzWojXeYBXAFDKhI8H972LaKEuM9XmTHpgIQU3eZRhh2KC8cCFbB
         FNpDtHhRgfa0EQhpFguIgtOYeLykgMm+3pTLmXcw/9MJ1UwbONGgLNu5br7asO6TfZ1H
         KOjpp0f48kzVBT1gqXvAR9mCgsCH3NOnzuGAH1xzJmJOwcv3uJqTkB8LabxPkPaVvcYL
         NL8FqDCKahPvkALWmSYqgqn+xAmgxKj/3/V81hYVTlnrMBCVGHIM5NVhs39AC/2sTWDv
         Qfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qY+8bVcYflidYqMyTGC+VNTQVC7Vhfv0Dq5dL2PhWUY=;
        b=Ylz0Na2I6CQdldPgE07x33Yi0hHd6qZ1zHrX/tDPYjgdMEYfKqThD2FJpouC7KL8UL
         bAlJx/+fhXMyBeQ4m7Th7jxds9RdyODep+zZ9l8/XIYYeLqtKmj2xrOp72Izmu6rwR40
         Omi4WSlB7LJYO5Ip+YwhRv8XLBAh8c0cb92MbDG7XVy1kkQcAEss2oyfVWFcLrVKLYR4
         SD753yvFBd7gKGd0kXw0b9qHkQtOKtUNRVKhKdTF6lYqVvvh6LDUC/uD95KfRN9i15br
         sp+ghic3ry5LXPgeddCGGEtg2MisxF1ZllHbxFq2JMI28voXzCQZDKJp3XLeULw+Dod1
         03xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JbdxCTrn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si107393qtw.58.2017.09.07.12.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 12:29:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JbdxCTrn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq2UX-0002D1-6i
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 15:29:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Pt-0006e7-QL
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 15:24:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Po-0004GL-6j
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 15:24:45 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dq2Pn-0004G1-UZ; Thu, 07 Sep 2017 15:24:40 -0400
Received: by mail-pg0-x243.google.com with SMTP id q68so303136pgq.2;
	Thu, 07 Sep 2017 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qY+8bVcYflidYqMyTGC+VNTQVC7Vhfv0Dq5dL2PhWUY=;
	b=JbdxCTrn0qRZEmKhHEJsfpZomYA6QodnE7uUn40NXDb/30Oru9pdzu+mwApHNVllIc
	AJP5IDpRqZOwDYKK9ULyPxG2JD98BDVmQMrKhQwjqxODYeyojWc3HtE8K1eoWapB3G8B
	PqZMSyFzChi8n3dLsQQmwgTzGuetvPRirUogvKZgE1ZOtTTOujfKOhr+ciTnTBJdnoua
	uRmC0DnPWioQrEtGvznlNSAM/4iC7kPI//pO4u2LCWUQjRjd820DD4nTFeR+AucSXgWJ
	2LqBETz3MpLkBDAAlNfkOuPkX+ek85buXmGrIFBLcgOeKwMcm6rN50HCJEIrP5tK0u0H
	0HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qY+8bVcYflidYqMyTGC+VNTQVC7Vhfv0Dq5dL2PhWUY=;
	b=ZIP4biL88hFHp2w+2bGhCimSK6nFYOl79PW6q8HQ4vfhmADLuHOKgw90XE32B6Jggj
	KayNddCfnJQdXaJNs4b6dEr1BIAX0CE8ZMruIyjorIK2CzGu6O9bJhFbnGuXATY7Y9qP
	suWqPBdUJzmfI7zNrx38VnOSXZb0fiX+nYtv0XLB0lN0reVUbdrBPCMTaWIXhIFzuEhk
	7itg5pQbzLY5qwpNUxoLeqvxR2VDxDXjAUNEeL4pOK/vhu6w36ZN47AizChGDzHPiSgJ
	NaYb4Bd35ZPw/toHcaHjGtUn/PT5Y1AUHpzPJn5yx7TjhUM5vFJCuY5aBXTNQl4t6QeO
	4xdQ==
X-Gm-Message-State: AHPjjUgx7AKifpgLwjav/YxedRVY8MIfM0FUDgN4J/IXvf1KCnSDuODn
	kv9l4Zwykq/4wHBR
X-Google-Smtp-Source: ADKCNb5lGvabt5uF+GvXYTKjDrn3aF501wvT3nuiI7SWeVCxsBkNM08dE1RK70ezkUWHzEcG/+mjRA==
X-Received: by 10.84.253.147 with SMTP id a19mr505636plm.14.1504812278798;
	Thu, 07 Sep 2017 12:24:38 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	y74sm462919pfa.164.2017.09.07.12.24.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Sep 2017 12:24:38 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  8 Sep 2017 00:54:10 +0530
Message-Id: <1504812251-23438-5-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [Qemu devel v8 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
X-TUID: OAxpLTRBY6MN

Smartfusion2 SoC has hardened Microcontroller subsystem
and flash based FPGA fabric. This patch adds support for
Microcontroller subsystem in the SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/msf2-soc.c               | 218 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h       |  66 ++++++++++++
 4 files changed, 286 insertions(+)
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
index a2e56ec..df36a03 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,3 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
+obj-$(CONFIG_MSF2) += msf2-soc.o
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
new file mode 100644
index 0000000..47fffa4
--- /dev/null
+++ b/hw/arm/msf2-soc.c
@@ -0,0 +1,218 @@
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
+
+#define MSF2_TIMER_BASE       0x40004000
+#define MSF2_SYSREG_BASE      0x40038000
+
+#define ENVM_BASE_ADDRESS     0x60000000
+
+#define SRAM_BASE_ADDRESS     0x20000000
+
+#define MSF2_ENVM_MAX_SIZE        (512 * K_BYTE)
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
+    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM.alias",
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
index 0000000..eb239fa
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

