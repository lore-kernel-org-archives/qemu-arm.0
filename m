Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4572177lfa;
        Tue, 8 Jun 2021 09:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp6vMr/bAKpRiuHiLyxaknB6NHuLbUnv/UKW7b7YXTBxQ6FejCCBFPkVDPNawU26w+Dq3D
X-Received: by 2002:a05:6512:3151:: with SMTP id s17mr16092590lfi.86.1623168788193;
        Tue, 08 Jun 2021 09:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623168788; cv=none;
        d=google.com; s=arc-20160816;
        b=hT7fgs/K3qUusdlqgImgkmWUe402Miry6snpIJtkKKRaas/OF3zIuPUWOu91EVFny3
         bHqX//ZCsZ/ygq0S9POKH4FQHyl1r+0HywSXCLLk+lPzfwzi0dCVZmTW6se92t+HWko9
         CiB0AtyzVUAKfUNS5EiMLy4IZb1Z8g7ljMIyWB33APmS7l+DviB1qvFEFnejJKJ0S3Nh
         Fe9tqWrrQvPIkYWZudtJfkbh1XvL3myhaZbIYg6e0zqjJdvEEDcm2DV32KrVaehINaRx
         wB8z383uy8I9ZB4/U8V5l+mwqzS07Ye9e/XkLWysKh3b+1lSWriOMmL8SCJXiaTwDLPl
         vtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=pbsQVD6Jpw9JoYpiRBpvDP7aBAj7fm+3HcEK/WL3M0Q=;
        b=llHgP8YZZlhNukkDAPS5YEjvd0uKnEfSWk8gayPN8dRiGp0gIqAk+rJ8IlxbB8SRnT
         Onr1e/AFVrbDUcaXUOUEg1KNa54tuIZ5Zgg9T437XEKdOJrDQN+qR6vcDu8zaEyWcJJ0
         juUeKlD6L9eKk4MuXTf2/XfPBAYq+BDumrjvBAWsntYJWho0AdbI8we7fr/6Nhua/2YM
         Ho+685AByKzADsfp0PtGofSp5Pm6WsSZYiV74wyOAWhWD7Ns0wi5utYuKsuYT1gOKrvO
         ubEbNPr5vcWohB6qxc0AkIPYVlRVFCZDLheQXgy3YnYjBsNi3aKYivGZC/pCaSlTZ/y3
         ULYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28si198932lfa.461.2021.06.08.09.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 09:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqeLj-0006W2-2P
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 12:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lqeJv-0003S6-4D; Tue, 08 Jun 2021 12:11:15 -0400
Received: from zamok.crans.org ([185.230.79.1]:50356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lqeJo-0004Ry-77; Tue, 08 Jun 2021 12:11:14 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 7EE18E0126; Tue,  8 Jun 2021 18:10:55 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
Date: Tue,  8 Jun 2021 18:10:27 +0200
Message-Id: <20210608161028.4159582-2-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608161028.4159582-1-erdnaxe@crans.org>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wYXjxGrMzMWe

This SoC is similar to stm32f205 SoC.
This will be used by the STM32VLDISCOVERY to create a machine.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 MAINTAINERS                    |   6 ++
 hw/arm/Kconfig                 |   6 ++
 hw/arm/meson.build             |   1 +
 hw/arm/stm32f100_soc.c         | 182 +++++++++++++++++++++++++++++++++
 include/hw/arm/stm32f100_soc.h |  58 +++++++++++
 5 files changed, 253 insertions(+)
 create mode 100644 hw/arm/stm32f100_soc.c
 create mode 100644 include/hw/arm/stm32f100_soc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..62dfa31800 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -946,6 +946,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/virt-acpi-build.c
 
+STM32F100
+M: Alexandre Iooss <erdnaxe@crans.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/stm32f100_soc.c
+
 STM32F205
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6..0bc3ee3e91 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -326,6 +326,12 @@ config RASPI
     select SDHCI
     select USB_DWC2
 
+config STM32F100_SOC
+    bool
+    select ARM_V7M
+    select STM32F2XX_USART
+    select STM32F2XX_SPI
+
 config STM32F205_SOC
     bool
     select ARM_V7M
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index be39117b9b..0e637e6a9e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -39,6 +39,7 @@ arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
new file mode 100644
index 0000000000..4655aaf05a
--- /dev/null
+++ b/hw/arm/stm32f100_soc.c
@@ -0,0 +1,182 @@
+/*
+ * STM32F100 SoC
+ *
+ * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
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
+#include "qemu/module.h"
+#include "hw/arm/boot.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/stm32f100_soc.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/unimp.h"
+#include "sysemu/sysemu.h"
+
+/* stm32f100_soc implementation is derived from stm32f205_soc */
+
+static const uint32_t usart_addr[STM_NUM_USARTS] = { 0x40013800, 0x40004400,
+    0x40004800 };
+static const uint32_t spi_addr[STM_NUM_SPIS] = { 0x40013000, 0x40003800 };
+
+static const int usart_irq[STM_NUM_USARTS] = {37, 38, 39};
+static const int spi_irq[STM_NUM_SPIS] = {35, 36};
+
+static void stm32f100_soc_initfn(Object *obj)
+{
+    STM32F100State *s = STM32F100_SOC(obj);
+    int i;
+
+    object_initialize_child(obj, "armv7m", &s->armv7m, TYPE_ARMV7M);
+
+    for (i = 0; i < STM_NUM_USARTS; i++) {
+        object_initialize_child(obj, "usart[*]", &s->usart[i],
+                                TYPE_STM32F2XX_USART);
+    }
+
+    for (i = 0; i < STM_NUM_SPIS; i++) {
+        object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
+    }
+}
+
+static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
+{
+    STM32F100State *s = STM32F100_SOC(dev_soc);
+    DeviceState *dev, *armv7m;
+    SysBusDevice *busdev;
+    int i;
+
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
+    MemoryRegion *flash = g_new(MemoryRegion, 1);
+    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
+
+    /*
+     * Init flash region
+     * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
+     */
+    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F100.flash",
+                           FLASH_SIZE, &error_fatal);
+    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
+                             "STM32F100.flash.alias", flash, 0, FLASH_SIZE);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
+    memory_region_add_subregion(system_memory, 0, flash_alias);
+
+    /* Init SRAM region */
+    memory_region_init_ram(sram, NULL, "STM32F100.sram", SRAM_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+
+    /* Init ARMv7m */
+    armv7m = DEVICE(&s->armv7m);
+    qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    object_property_set_link(OBJECT(&s->armv7m), "memory",
+                             OBJECT(get_system_memory()), &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
+        return;
+    }
+
+    /* Attach UART (uses USART registers) and USART controllers */
+    for (i = 0; i < STM_NUM_USARTS; i++) {
+        dev = DEVICE(&(s->usart[i]));
+        qdev_prop_set_chr(dev, "chardev", serial_hd(i));
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usart[i]), errp)) {
+            return;
+        }
+        busdev = SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, usart_addr[i]);
+        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq[i]));
+    }
+
+    /* SPI 1 and 2 */
+    for (i = 0; i < STM_NUM_SPIS; i++) {
+        dev = DEVICE(&(s->spi[i]));
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
+            return;
+        }
+        busdev = SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, spi_addr[i]);
+        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
+    }
+
+    create_unimplemented_device("timer[2]",  0x40000000, 0x400);
+    create_unimplemented_device("timer[3]",  0x40000400, 0x400);
+    create_unimplemented_device("timer[4]",  0x40000800, 0x400);
+    create_unimplemented_device("timer[6]",  0x40001000, 0x400);
+    create_unimplemented_device("timer[7]",  0x40001400, 0x400);
+    create_unimplemented_device("RTC",       0x40002800, 0x400);
+    create_unimplemented_device("WWDG",      0x40002C00, 0x400);
+    create_unimplemented_device("IWDG",      0x40003000, 0x400);
+    create_unimplemented_device("I2C1",      0x40005400, 0x400);
+    create_unimplemented_device("I2C2",      0x40005800, 0x400);
+    create_unimplemented_device("BKP",       0x40006C00, 0x400);
+    create_unimplemented_device("PWR",       0x40007000, 0x400);
+    create_unimplemented_device("DAC",       0x40007400, 0x400);
+    create_unimplemented_device("CEC",       0x40007800, 0x400);
+    create_unimplemented_device("AFIO",      0x40010000, 0x400);
+    create_unimplemented_device("EXTI",      0x40010400, 0x400);
+    create_unimplemented_device("GPIOA",     0x40010800, 0x400);
+    create_unimplemented_device("GPIOB",     0x40010C00, 0x400);
+    create_unimplemented_device("GPIOC",     0x40011000, 0x400);
+    create_unimplemented_device("GPIOD",     0x40011400, 0x400);
+    create_unimplemented_device("GPIOE",     0x40011800, 0x400);
+    create_unimplemented_device("ADC1",      0x40012400, 0x400);
+    create_unimplemented_device("timer[1]",  0x40012C00, 0x400);
+    create_unimplemented_device("timer[15]", 0x40014000, 0x400);
+    create_unimplemented_device("timer[16]", 0x40014400, 0x400);
+    create_unimplemented_device("timer[17]", 0x40014800, 0x400);
+    create_unimplemented_device("DMA",       0x40020000, 0x400);
+    create_unimplemented_device("RCC",       0x40021000, 0x400);
+    create_unimplemented_device("Flash Int", 0x40022000, 0x400);
+    create_unimplemented_device("CRC",       0x40023000, 0x400);
+}
+
+static Property stm32f100_soc_properties[] = {
+    DEFINE_PROP_STRING("cpu-type", STM32F100State, cpu_type),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void stm32f100_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = stm32f100_soc_realize;
+    device_class_set_props(dc, stm32f100_soc_properties);
+}
+
+static const TypeInfo stm32f100_soc_info = {
+    .name          = TYPE_STM32F100_SOC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(STM32F100State),
+    .instance_init = stm32f100_soc_initfn,
+    .class_init    = stm32f100_soc_class_init,
+};
+
+static void stm32f100_soc_types(void)
+{
+    type_register_static(&stm32f100_soc_info);
+}
+
+type_init(stm32f100_soc_types)
diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
new file mode 100644
index 0000000000..c55f7774fa
--- /dev/null
+++ b/include/hw/arm/stm32f100_soc.h
@@ -0,0 +1,58 @@
+/*
+ * STM32F100 SoC
+ *
+ * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
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
+#ifndef HW_ARM_STM32F100_SOC_H
+#define HW_ARM_STM32F100_SOC_H
+
+#include "hw/char/stm32f2xx_usart.h"
+#include "hw/ssi/stm32f2xx_spi.h"
+#include "hw/arm/armv7m.h"
+#include "qom/object.h"
+
+#define TYPE_STM32F100_SOC "stm32f100-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
+
+#define STM_NUM_USARTS 3
+#define STM_NUM_SPIS 2
+
+#define FLASH_BASE_ADDRESS 0x08000000
+#define FLASH_SIZE (128 * 1024)
+#define SRAM_BASE_ADDRESS 0x20000000
+#define SRAM_SIZE (8 * 1024)
+
+struct STM32F100State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    char *cpu_type;
+
+    ARMv7MState armv7m;
+
+    STM32F2XXUsartState usart[STM_NUM_USARTS];
+    STM32F2XXSPIState spi[STM_NUM_SPIS];
+};
+
+#endif
+
-- 
2.25.1

