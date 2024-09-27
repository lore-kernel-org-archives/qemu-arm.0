Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp334107njc;
        Fri, 27 Sep 2024 06:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNiAPPO5yBIvvnDGhdJY2CjcghuDqKIDzhiWxjQu8F4q+fPsKqbXtsdg3thwjbJHdBdUxrA+gZ0FwWWA==@linaro.org
X-Google-Smtp-Source: AGHT+IFmcNCokkRBE+z+yUotHIfcLSvaVkKNojMuVqNqtaMaP35ywzMhuC2eSDefFOtn5xJKkZFg
X-Received: by 2002:a05:6102:508c:b0:493:31f9:d14a with SMTP id ada2fe7eead31-4a2e1154c9emr2439928137.27.1727443543396;
        Fri, 27 Sep 2024 06:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727443543; cv=none;
        d=google.com; s=arc-20240605;
        b=EaVgDm1dbkPx3zWOndY+C6/xrBYB6dHMsQ86v7oAmieG0oowiteiBaWZxklnJMeRXq
         yVtV7ZmoG93hf/qvQKfToNdF8BQB65HX8s6CfzcHKMDnQvqSrXVPQhWA9K9heE6wVTbt
         EEnlep8ghFUY8QA+bWXO0/K/ZYVlOK25k5z2Fmm6DjZ/MR0vmHBWQ8xXrvp0C83Uczhl
         il3ERAagCP7+UOXd5K7uMiapPIlSwNIXQXDY/3jTAMru/kXn7AyDRQ+ECWxaZUtaVil0
         f02JesQ6VNZ1lokkbZnhkArAb3yVSkSRLBYqtj25TZwgh9BglQHpTZ71Ay5VxKMVzQuz
         MuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MLbbSCTKBIBq+6Wq2XwVMzDQMwvmH3/6M6EKHflK/kY=;
        fh=6d+eTanCL2MGPqKqRmC05pEVnMW+81FiGliiHSZnk78=;
        b=SPPuYH7M8J72vP1BvgU5HNixPkbNe5QGtJqvXMhF2AE727ti+raeZiZ+FZ5Uxa0dhc
         x6CxIw13m4TqZSSLIoWYGw2iqtMBSDTxEo64UjXPYs0RARBTzE1Of6WI79yBf1vL3lY9
         0YeL+fVEBluI2wYqQSK7OB61tAy365AsWQxoz9rgGxnZca80mmDnj24ckQOG3bpEbFjO
         XYLkPubGpYkzGm7hkB0cPKEA22EHluyAwjPTcGHWDgPosqqilrCVOLwfIE0Cc3hCOusF
         Q/xxQBbDlT8wPjMxVelmblSWcqcZnLAxmMRN9cpyLz899c847sHPE9dixz2IpsIgrUii
         qN3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9wOdfDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a2bbc2bcd9si479415137.720.2024.09.27.06.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 06:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9wOdfDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1suAyW-0002g2-9D; Fri, 27 Sep 2024 09:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1su86e-0006i6-CK
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 06:21:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1su86a-0000p8-KY
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 06:21:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso18268135e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2024 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727432502; x=1728037302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MLbbSCTKBIBq+6Wq2XwVMzDQMwvmH3/6M6EKHflK/kY=;
 b=L9wOdfDwoxZjnzSHFfB/dF0YjzYUvaaykg0W5f8BELhskWWtaHzLVvjVEgyPd3SOol
 /6Esf5GUL+LOFFJ9bsxGHErCrZNVF0TnWfevtdFQHh7ld9fpLf+gGFQxOjrJNQ77YipC
 VONJDtBOI+iYDanWRmwr63GDkX/qxtd4oDXYKh7Fa7Jmyd7b60/Aw90LqeEytulLB+BM
 HBJaIN92r9lOnK92pkg0o1szbo637vN5xp8fj7kcdXCqt59KFGb9t+oZIGyrPe8NjJ9e
 F1BZ7eA6UXeeaOrRKUFAEAHMy5drM5ozDCcwDMf0ccpkSNktnYvFhSjGMxN08tA38dJk
 ShgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727432502; x=1728037302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MLbbSCTKBIBq+6Wq2XwVMzDQMwvmH3/6M6EKHflK/kY=;
 b=jlx4xZeRFDKxwbYCi+IkdUfOC4s3H9lh3+M0Ex0W6JqraWx1mjUwZ+R0MhqZOMDNQj
 TVoyME82mJAkfQ237zBoWC0hvXk7tRpDz9by6yydy8miZpM3zTzp1FBwNtud30pmEUjD
 OPvl0NMydZXJmQy/+zkAB5sZjAntb26YliWKvWYRMkAGwVjl735r+JWjRX8/5CE2vIEn
 RRS6LW24k1dRogwfXwEHCf7CRM5e9A35aGVMggv2viv1Ur/1s5uXnhIhamRZwV0HLp3t
 3NhFHBFlTI3hBri1ufZhM7Ksr7zXjWXyMZIZnlBDyBHKq99fRVsaM/v4Ss5omU69HLHy
 AVvA==
X-Gm-Message-State: AOJu0YzBijVzPZYlnj04dHXUaHy4jmOfYhTgu92UDWN4NJEGvdP9ydSf
 XIxv7mDpxYeZtqxC7nEfj9+OVFqPUqYxUQjCLoABufY54EhNeHlGBmGjymfT
X-Received: by 2002:a05:600c:3b90:b0:42c:b377:3f76 with SMTP id
 5b1f17b1804b1-42f5844b3c1mr19034985e9.17.1727432501568; 
 Fri, 27 Sep 2024 03:21:41 -0700 (PDT)
Received: from localhost.localdomain (cm-93-156-192-199.telecable.es.
 [93.156.192.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd5730e9dsm2035187f8f.71.2024.09.27.03.21.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Sep 2024 03:21:41 -0700 (PDT)
From: =?UTF-8?q?Rom=C3=A1n=20C=C3=A1rdenas=20Rodr=C3=ADguez?=
 <rcardenas.rod@gmail.com>
To: qemu-arm@nongnu.org
Cc: alistair@alistair23.me, peter.maydell@linaro.org,
 =?UTF-8?q?Rom=C3=A1n=20C=C3=A1rdenas=20Rodr=C3=ADguez?=
 <rcardenas.rod@gmail.com>
Subject: [PATCH] Add basic GPIO and RCC functionalities to STM32F4
Date: Fri, 27 Sep 2024 12:14:55 +0200
Message-Id: <20240927101453.2569-1-rcardenas.rod@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=rcardenas.rod@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Sep 2024 09:25:33 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XAVad7JP7Y+l

Adds support for GPIO peripherals in STM32F4 targets. Main contributions are:

- Generic GPIO class for STM32 devices. It can be used for most of STM32 chips.
  Note that it does not implement configuration locking mechanisms.
- Generic RCC class for STM32 devices. It can be used for most of STM32 chips.
  Note that it only implements enable and reset capabilities.

I tested this locally with a few examples with LEDs (digital output) and
buttons (digital input)  and works as expected.

Signed-off-by: Roman Cardenas Rodriguez <rcardenas.rod@gmail.com>

---
 docs/system/arm/stm32.rst      |   5 +-
 hw/arm/Kconfig                 |   2 +
 hw/arm/stm32f405_soc.c         |  46 ++++-
 hw/gpio/Kconfig                |   3 +
 hw/gpio/meson.build            |   1 +
 hw/gpio/stm32_gpio.c           | 357 +++++++++++++++++++++++++++++++++
 hw/gpio/trace-events           |   8 +
 hw/misc/Kconfig                |   3 +
 hw/misc/meson.build            |   1 +
 hw/misc/stm32_rcc.c            | 154 ++++++++++++++
 hw/misc/stm32f4xx_syscfg.c     |  23 ++-
 hw/misc/trace-events           |   6 +
 include/hw/arm/stm32.h         |  41 ++++
 include/hw/arm/stm32f405_soc.h |   5 +
 include/hw/gpio/stm32_gpio.h   | 105 ++++++++++
 include/hw/misc/stm32_rcc.h    |  91 +++++++++
 16 files changed, 830 insertions(+), 21 deletions(-)
 create mode 100644 hw/gpio/stm32_gpio.c
 create mode 100644 hw/misc/stm32_rcc.c
 create mode 100644 include/hw/arm/stm32.h
 create mode 100644 include/hw/gpio/stm32_gpio.h
 create mode 100644 include/hw/misc/stm32_rcc.h

diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
index 3b640f3ee0..1ae7694839 100644
--- a/docs/system/arm/stm32.rst
+++ b/docs/system/arm/stm32.rst
@@ -36,6 +36,8 @@ Supported devices
  * SPI controller
  * System configuration (SYSCFG)
  * Timer controller (TIMER)
+ * GPIO controller (GPIO) (STM32F4 only, no lock/unlock capability)
+ * Reset and Clock Controller (RCC) (STM32F4 only, reset and enable only)
 
 Missing devices
 ---------------
@@ -47,13 +49,12 @@ Missing devices
  * DMA controller
  * Ethernet controller
  * Flash Interface Unit
- * GPIO controller
  * I2C controller
  * Inter-Integrated Sound (I2S) controller
  * Power supply configuration (PWR)
  * Random Number Generator (RNG)
  * Real-Time Clock (RTC) controller
- * Reset and Clock Controller (RCC)
+ * Reset and Clock Controller (RCC) (other features than reset and enable)
  * Secure Digital Input/Output (SDIO) interface
  * USB OTG
  * Watchdog controller (IWDG, WWDG)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1ad60da7aa..031fbe0934 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -466,6 +466,8 @@ config STM32F405_SOC
     bool
     select ARM_V7M
     select OR_IRQ
+    select STM32_RCC
+    select STM32_GPIO
     select STM32F4XX_SYSCFG
     select STM32F4XX_EXTI
 
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 2ad5b79a06..49c201c070 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -26,10 +26,12 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "hw/arm/stm32.h"
 #include "hw/arm/stm32f405_soc.h"
 #include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
 
+#define RCC_ADDR                       0x40023800
 #define SYSCFG_ADD                     0x40013800
 static const uint32_t usart_addr[] = { 0x40011000, 0x40004400, 0x40004800,
                                        0x40004C00, 0x40005000, 0x40011400,
@@ -42,6 +44,7 @@ static const uint32_t adc_addr[] = { 0x40012000, 0x40012100, 0x40012200,
 static const uint32_t spi_addr[] =   { 0x40013000, 0x40003800, 0x40003C00,
                                        0x40013400, 0x40015000, 0x40015400 };
 #define EXTI_ADDR                      0x40013C00
+#define GPIOS_BASE_ADDRESS             0x40020000
 
 #define SYSCFG_IRQ               71
 static const int usart_irq[] = { 37, 38, 39, 52, 53, 71, 82, 83 };
@@ -79,6 +82,12 @@ static void stm32f405_soc_initfn(Object *obj)
         object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
     }
 
+    for (i = STM32_GPIO_PORT_A; i <= STM32_GPIO_PORT_I; i++) {
+        object_initialize_child(obj, "gpio[*]", &s->gpio[i], TYPE_STM32_GPIO);
+    }
+
+    object_initialize_child(obj, "rcc", &s->rcc, TYPE_STM32_RCC);
+
     object_initialize_child(obj, "exti", &s->exti, TYPE_STM32F4XX_EXTI);
 
     s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
@@ -160,6 +169,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    /* Reset and clock controller */
+    dev = DEVICE(&s->rcc);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rcc), errp)) {
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, RCC_ADDR);
+
     /* System configuration controller */
     dev = DEVICE(&s->syscfg);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->syscfg), errp)) {
@@ -229,6 +246,25 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
     }
 
+    /* GPIO devices */
+    for (i = STM32_GPIO_PORT_A; i <= STM32_GPIO_PORT_I; i++) {
+        dev = DEVICE(&(s->gpio[i]));
+        qdev_prop_set_uint32(dev, "family", STM32_F4);
+        qdev_prop_set_uint32(dev, "port", i);
+        qdev_prop_set_uint32(dev, "ngpio", STM32_GPIO_NPINS);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), errp)) {
+            return;
+        }
+        busdev = SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, GPIOS_BASE_ADDRESS + (i * STM32_GPIO_PERIPHERAL_SIZE));
+
+        qdev_connect_gpio_out(DEVICE(&s->rcc), STM32_RCC_GPIO_IRQ_OFFSET + i, qdev_get_gpio_in_named(dev, "reset-in", 0));
+        qdev_connect_gpio_out(DEVICE(&s->rcc), STM32_RCC_GPIO_IRQ_OFFSET + i + STM32_RCC_NIRQS, qdev_get_gpio_in_named(dev, "enable-in", 0));
+        for (int j = 0; j < STM32_GPIO_NPINS; j++) {
+            qdev_connect_gpio_out_named(dev, "input-out", j, qdev_get_gpio_in(DEVICE(&s->syscfg), i * STM32_GPIO_NPINS + j));
+        }
+    }
+
     /* EXTI device */
     dev = DEVICE(&s->exti);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->exti), errp)) {
@@ -266,17 +302,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("timer[9]",    0x40014000, 0x400);
     create_unimplemented_device("timer[10]",   0x40014400, 0x400);
     create_unimplemented_device("timer[11]",   0x40014800, 0x400);
-    create_unimplemented_device("GPIOA",       0x40020000, 0x400);
-    create_unimplemented_device("GPIOB",       0x40020400, 0x400);
-    create_unimplemented_device("GPIOC",       0x40020800, 0x400);
-    create_unimplemented_device("GPIOD",       0x40020C00, 0x400);
-    create_unimplemented_device("GPIOE",       0x40021000, 0x400);
-    create_unimplemented_device("GPIOF",       0x40021400, 0x400);
-    create_unimplemented_device("GPIOG",       0x40021800, 0x400);
-    create_unimplemented_device("GPIOH",       0x40021C00, 0x400);
-    create_unimplemented_device("GPIOI",       0x40022000, 0x400);
     create_unimplemented_device("CRC",         0x40023000, 0x400);
-    create_unimplemented_device("RCC",         0x40023800, 0x400);
     create_unimplemented_device("Flash Int",   0x40023C00, 0x400);
     create_unimplemented_device("BKPSRAM",     0x40024000, 0x400);
     create_unimplemented_device("DMA1",        0x40026000, 0x400);
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index 19c97cc823..9601b7d1bf 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -17,6 +17,9 @@ config GPIO_PWR
 config SIFIVE_GPIO
     bool
 
+config STM32_GPIO
+    bool
+
 config STM32L4X5_GPIO
     bool
 
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index a7495d196a..42f10c577b 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -16,6 +16,7 @@ system_ss.add(when: 'CONFIG_RASPI', if_true: files(
     'bcm2838_gpio.c'
 ))
 system_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_gpio.c'))
+system_ss.add(when: 'CONFIG_STM32_GPIO', if_true: files('stm32_gpio.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 system_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
 system_ss.add(when: 'CONFIG_PCF8574', if_true: files('pcf8574.c'))
diff --git a/hw/gpio/stm32_gpio.c b/hw/gpio/stm32_gpio.c
new file mode 100644
index 0000000000..4a4d15bfbd
--- /dev/null
+++ b/hw/gpio/stm32_gpio.c
@@ -0,0 +1,357 @@
+/*
+ * STM32 System-on-Chip general purpose input/output register definition
+ *
+ * Copyright 2024 Román Cárdenas <rcardenas.rod@gmail.com>
+ *
+ * Based on sifive_gpio.c:
+ *
+ * Copyright 2019 AdaCore
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <stdio.h>
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/arm/stm32.h"
+#include "hw/gpio/stm32_gpio.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static void stm32_gpio_update_state(STM32GPIOState *s)
+{
+    bool prev_id, new_id, od, in, in_mask;
+    uint8_t mode, pupd;
+
+    for (size_t i = 0; i < s->ngpio; i++) {
+        prev_id = extract32(s->idr, i, 1);
+        od      = extract32(s->odr, i, 1);
+        in      = extract32(s->in, i, 1);
+        in_mask = extract32(s->in_mask, i, 1);
+
+        mode    = extract32(s->moder, i * 2, 2);
+        pupd    = extract32(s->pupdr, i * 2, 2);
+
+        /* Pin both driven externally and internally */
+        if (mode == STM32_GPIO_MODE_OUTPUT && in_mask) {
+            qemu_log_mask(LOG_GUEST_ERROR, "GPIO pin %zu short circuited\n", i);
+        }
+
+        if (in_mask) {
+            /* The pin is driven by external device */
+            new_id = in;
+        } else if (mode == STM32_GPIO_MODE_OUTPUT) {
+            /* The pin is driven by internal circuit */
+            new_id = od;
+        } else {
+            /* Floating? Apply pull-up resistor */
+            new_id = pupd == STM32_GPIO_PULL_UP;
+        }
+
+        /* Update IDR */
+        s->idr = deposit32(s->idr, i, 1, new_id);
+
+        /* If pin is in input mode and IDR has changed, trigger an IRQ */
+        if (new_id != prev_id) {
+            if (mode == STM32_GPIO_MODE_INPUT) {
+                qemu_set_irq(s->input_irq[i], new_id);
+            }
+        }
+    }
+    /* Notify that GPIO has changed its state */
+    qemu_irq_pulse(s->state_irq);
+}
+
+static void stm32_gpio_reset(DeviceState *dev)
+{
+    STM32GPIOState *s = STM32_GPIO(dev);
+
+    // enabled is not affected by reset. It is ruled by RCC
+    // IDR is not directly reset. It is updated at the end by update_state
+
+    // By default, we set all the registers to 0
+    s->moder = 0;
+    s->otyper = 0;
+    s->ospeedr = 0;
+    s->pupdr = 0;
+    s->odr = 0;
+    s->lckr = 0;
+    s->aflr = 0;
+    s->afhr = 0;
+
+    // Next, we check model particularities
+    if (s->family == STM32_F4) {
+        if (s->port == STM32_GPIO_PORT_A) {
+            s->moder     = 0xA8000000;
+            s->pupdr   = 0x64000000;
+        } else if (s->port == STM32_GPIO_PORT_B) {
+            s->moder     = 0x00000280;
+            s->ospeedr = 0x000000C0;
+            s->pupdr   = 0x00000100;
+        }
+    }
+
+    stm32_gpio_update_state(s);
+}
+
+static void stm32_gpio_irq_reset(void *opaque, int line, int value)
+{
+    STM32GPIOState *s = STM32_GPIO(opaque);
+
+    trace_stm32_gpio_irq_reset(line, value);
+
+    bool prev_reset = s->reset;
+    s->reset = value != 0;
+    if (prev_reset != s->reset) {
+        if (s->reset) {
+            stm32_gpio_reset(DEVICE(s));
+        } else {
+            stm32_gpio_update_state(s);
+        }
+    }
+}
+
+static void stm32_gpio_irq_enable(void *opaque, int line, int value)
+{
+    STM32GPIOState *s = STM32_GPIO(opaque);
+
+    trace_stm32_gpio_irq_enable(line, value);
+
+    bool prev_enable = s->enable;
+    s->enable = value != 0;
+    if (prev_enable != s->enable) {
+        stm32_gpio_update_state(s);
+    }
+}
+
+static void stm32_gpio_irq_set(void *opaque, int line, int value)
+{
+    STM32GPIOState *s = STM32_GPIO(opaque);
+
+    trace_stm32_gpio_irq_set(line, value);
+
+    assert(line >= 0 && line < s->ngpio);
+
+    s->in_mask = deposit32(s->in_mask, line, 1, value >= 0); // <0 is unconnected/connected to load
+    if (value >= 0) {
+        s->in = deposit32(s->in, line, 1, value != 0); // 0 is low, >0 is high
+    }
+
+    stm32_gpio_update_state(s);
+}
+
+
+static uint64_t stm32_gpio_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    STM32GPIOState *s = STM32_GPIO(opaque);
+    uint64_t r = 0;
+
+    if (!s->enable) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: GPIO peripheral is disabled\n", __func__);
+        return 0;
+    }
+
+    switch (offset) {
+    case STM32_GPIO_REG_MODER:
+        r = s->moder;
+        break;
+
+    case STM32_GPIO_REG_OTYPER:
+        r = s->otyper;
+        break;
+
+    case STM32_GPIO_REG_OSPEEDR:
+        r = s->ospeedr;
+        break;
+
+    case STM32_GPIO_REG_PUPDR:
+        r = s->pupdr;
+        break;
+
+    case STM32_GPIO_REG_IDR:
+        r = s->idr;
+        break;
+
+    case STM32_GPIO_REG_ODR:
+        r = s->odr;
+        break;
+
+    case STM32_GPIO_REG_BSRR:
+        break; // BSRR is write-only
+
+    case STM32_GPIO_REG_LCKR:
+        r = s->lckr;
+        break;
+
+    case STM32_GPIO_REG_AFRL:
+        r = s->aflr;
+        break;
+
+    case STM32_GPIO_REG_AFRH:
+        r = s->afhr;
+        break;
+    
+    case STM32_GPIO_REG_BRR:
+        if (s->family != STM32_F4) { // STM32F4xx SoCs do not have this register
+            break; // BRR is write-only
+        }
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read offset 0x%" HWADDR_PRIx "\n",  __func__, offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read offset 0x%" HWADDR_PRIx "\n",  __func__, offset);
+    }
+
+    trace_stm32_gpio_read(offset, r);
+
+    return r;
+}
+
+static void stm32_gpio_write(void *opaque, hwaddr offset, uint64_t value, unsigned int size)
+{
+    STM32GPIOState *s = STM32_GPIO(opaque);
+
+    trace_stm32_gpio_write(offset, value);
+
+    if (!s->enable) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: GPIO peripheral is disabled\n", __func__);
+        return;
+    }
+
+    switch (offset) {
+
+    case STM32_GPIO_REG_MODER:
+        s->moder = value;
+        break;
+
+    case STM32_GPIO_REG_OTYPER:
+        s->otyper = value;
+        break;
+
+    case STM32_GPIO_REG_OSPEEDR:
+        s->ospeedr = value;
+        break;
+
+    case STM32_GPIO_REG_PUPDR:
+        s->pupdr = value;
+        break;
+    
+    case STM32_GPIO_REG_IDR:
+        break; // IDR is read-only
+
+    case STM32_GPIO_REG_ODR:
+        s->odr = value; // IDR is updated in update_state
+        break;
+
+    case STM32_GPIO_REG_BSRR:
+        s->odr &= ~((value >> 16) & 0xFFFF);
+        s->odr |= value & 0xFFFF; // set bits have higher priority than reset bits
+        break;
+
+    case STM32_GPIO_REG_LCKR:
+        s->lckr = value;
+        break;
+
+    case STM32_GPIO_REG_AFRL:
+        s->aflr = value;
+        break;
+
+    case STM32_GPIO_REG_AFRH:
+        s->afhr = value;
+        break;
+    
+    case STM32_GPIO_REG_BRR:
+        if (s->family != STM32_F4) { // STM32F4xx SoCs do not have this register
+            s->odr &= ~(value & 0xFFFF);
+            break;
+        }
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write offset 0x%" HWADDR_PRIx "\n", __func__, offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write offset 0x%" HWADDR_PRIx "\n", __func__, offset);
+    }
+
+    stm32_gpio_update_state(s);
+}
+
+static const MemoryRegionOps stm32_gpio_ops = {
+    .read =  stm32_gpio_read,
+    .write = stm32_gpio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_stm32_gpio = {
+    .name = TYPE_STM32_GPIO,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(moder,   STM32GPIOState),
+        VMSTATE_UINT32(otyper,  STM32GPIOState),
+        VMSTATE_UINT32(ospeedr, STM32GPIOState),
+        VMSTATE_UINT32(pupdr,   STM32GPIOState),
+        VMSTATE_UINT32(idr,     STM32GPIOState),
+        VMSTATE_UINT32(odr,     STM32GPIOState),
+        VMSTATE_UINT32(lckr,    STM32GPIOState),
+        VMSTATE_UINT32(aflr,    STM32GPIOState),
+        VMSTATE_UINT32(afhr,    STM32GPIOState),
+        VMSTATE_BOOL(reset,     STM32GPIOState),
+        VMSTATE_BOOL(enable,    STM32GPIOState),
+        VMSTATE_UINT32(in,      STM32GPIOState),
+        VMSTATE_UINT32(in_mask, STM32GPIOState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property stm32_gpio_properties[] = {
+    DEFINE_PROP_UINT32("family", STM32GPIOState, family, STM32_F2),
+    DEFINE_PROP_UINT32("port", STM32GPIOState, port, STM32_GPIO_PORT_A),
+    DEFINE_PROP_UINT32("ngpio", STM32GPIOState, ngpio, STM32_GPIO_NPINS),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void stm32_gpio_realize(DeviceState *dev, Error **errp)
+{
+    STM32GPIOState *s = STM32_GPIO(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &stm32_gpio_ops, s, TYPE_STM32_GPIO, STM32_GPIO_PERIPHERAL_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+    
+    qdev_init_gpio_in_named(DEVICE(s), stm32_gpio_irq_reset, "reset-in", 1);
+    qdev_init_gpio_in_named(DEVICE(s), stm32_gpio_irq_enable, "enable-in", 1);
+    qdev_init_gpio_in_named(DEVICE(s), stm32_gpio_irq_set, "input-in", STM32_GPIO_NPINS);
+
+    qdev_init_gpio_out_named(DEVICE(s), &s->state_irq, "state-out", 1);
+    qdev_init_gpio_out_named(DEVICE(s), s->input_irq, "input-out", STM32_GPIO_NPINS);
+}
+
+static void stm32_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, stm32_gpio_properties);
+    dc->vmsd = &vmstate_stm32_gpio;
+    dc->realize = stm32_gpio_realize;
+    device_class_set_legacy_reset(dc, stm32_gpio_reset);
+    dc->desc = "STM32 GPIO";
+}
+
+static const TypeInfo stm32_gpio_info = {
+    .name = TYPE_STM32_GPIO,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(STM32GPIOState),
+    .class_init = stm32_gpio_class_init
+};
+
+static void stm32_gpio_register_types(void)
+{
+    type_register_static(&stm32_gpio_info);
+}
+
+type_init(stm32_gpio_register_types)
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index b91cc7e9a4..b469c5dec1 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -36,6 +36,14 @@ sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " val
 aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
 aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
 
+# stm32_gpio.c
+stm32_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
+stm32_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
+stm32_gpio_irq_enable(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+stm32_gpio_irq_reset(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+stm32_gpio_irq_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+stm32_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+
 # stm32l4x5_gpio.c
 stm32l4x5_gpio_read(char *gpio, uint64_t addr) "GPIO%s addr: 0x%" PRIx64 " "
 stm32l4x5_gpio_write(char *gpio, uint64_t addr, uint64_t data) "GPIO%s addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 1e08785b83..6bdc77cbe5 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -82,6 +82,9 @@ config IMX
     select SSI
     select USB_EHCI_SYSBUS
 
+config STM32_RCC
+    bool
+
 config STM32F2XX_SYSCFG
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 2ca8717be2..e3cc4c34e3 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -106,6 +106,7 @@ system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
 system_ss.add(when: 'CONFIG_XLNX_VERSAL_TRNG', if_true: files(
   'xlnx-versal-trng.c',
 ))
+system_ss.add(when: 'CONFIG_STM32_RCC', if_true: files('stm32_rcc.c'))
 system_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
 system_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
 system_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
diff --git a/hw/misc/stm32_rcc.c b/hw/misc/stm32_rcc.c
new file mode 100644
index 0000000000..5229c2df66
--- /dev/null
+++ b/hw/misc/stm32_rcc.c
@@ -0,0 +1,154 @@
+/*
+ * STM32 RCC (only reset and enable registers are implemented)
+ *
+ * Copyright (c) 2024 Román Cárdenas <rcardenas.rod@gmail.com>
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
+#include "qemu/log.h"
+#include "trace.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "hw/misc/stm32_rcc.h"
+
+static void stm32_rcc_reset(DeviceState *dev)
+{
+    STM32RccState *s = STM32_RCC(dev);
+
+    for (int i = 0; i < STM32_RCC_NREGS; i++) {
+        s->regs[i] = 0;
+    }
+}
+
+static uint64_t stm32_rcc_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    STM32RccState *s = STM32_RCC(opaque);
+    
+    uint32_t value = 0;
+    if (addr > STM32_RCC_DCKCFGR2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    } else {
+        value = s->regs[addr >> 2];
+    }
+    trace_stm32_rcc_read(addr, value);
+    return value;
+}
+
+static void stm32_rcc_write(void *opaque, hwaddr addr,  uint64_t val64, unsigned int size)
+{
+    STM32RccState *s = STM32_RCC(opaque);
+    uint32_t value = val64;
+    uint32_t prev_value, new_value, irq_offset;
+
+    trace_stm32_rcc_write(value, addr);
+
+    if (addr > STM32_RCC_DCKCFGR2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+        return;
+    }
+
+    switch (addr) {
+    case STM32_RCC_AHB1_RSTR...STM32_RCC_APB2_RSTR:
+        prev_value = s->regs[addr / 4];
+        s->regs[addr / 4] = value;
+
+        irq_offset = ((addr - STM32_RCC_AHB1_RSTR) / 4) * 32;
+        for (int i = 0; i < 32; i++) {
+            new_value = extract32(value, i, 1);
+            if (extract32(prev_value, i, 1) && !new_value) {
+                trace_stm32_rcc_pulse_reset(irq_offset + i, new_value);
+                qemu_set_irq(s->reset_irq[irq_offset + i], new_value);
+            }
+        }
+        return;
+    case STM32_RCC_AHB1_ENR...STM32_RCC_APB2_ENR:
+        prev_value = s->regs[addr / 4];
+        s->regs[addr / 4] = value;
+
+        irq_offset = ((addr - STM32_RCC_AHB1_ENR) / 4) * 32;
+        for (int i = 0; i < 32; i++) {
+            new_value = extract32(value, i, 1);
+            if (!extract32(prev_value, i, 1) && new_value) {
+                trace_stm32_rcc_pulse_enable(irq_offset + i, new_value);
+                qemu_set_irq(s->enable_irq[irq_offset + i], new_value);
+            }
+        }
+        return;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: The RCC peripheral only supports enable and reset in QEMU\n", __func__);
+        s->regs[addr >> 2] = value;
+    }
+}
+
+static const MemoryRegionOps stm32_rcc_ops = {
+    .read = stm32_rcc_read,
+    .write = stm32_rcc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void stm32_rcc_init(Object *obj)
+{
+    STM32RccState *s = STM32_RCC(obj);
+
+    memory_region_init_io(&s->mmio, obj, &stm32_rcc_ops, s, TYPE_STM32_RCC, STM32_RCC_PERIPHERAL_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    qdev_init_gpio_out(DEVICE(obj), s->reset_irq, STM32_RCC_NIRQS);
+    qdev_init_gpio_out(DEVICE(obj), s->enable_irq, STM32_RCC_NIRQS);
+
+    for (int i = 0; i < STM32_RCC_NIRQS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->reset_irq[i]);
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->enable_irq[i]);
+    }
+}
+
+static const VMStateDescription vmstate_stm32_rcc = {
+    .name = TYPE_STM32_RCC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, STM32RccState, STM32_RCC_NREGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void stm32_rcc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_stm32_rcc;
+    device_class_set_legacy_reset(dc, stm32_rcc_reset);
+}
+
+static const TypeInfo stm32_rcc_info = {
+    .name          = TYPE_STM32_RCC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(STM32RccState),
+    .instance_init = stm32_rcc_init,
+    .class_init    = stm32_rcc_class_init,
+};
+
+static void stm32_rcc_register_types(void)
+{
+    type_register_static(&stm32_rcc_info);
+}
+
+type_init(stm32_rcc_register_types)
diff --git a/hw/misc/stm32f4xx_syscfg.c b/hw/misc/stm32f4xx_syscfg.c
index 7d0f3eb5f5..332210b713 100644
--- a/hw/misc/stm32f4xx_syscfg.c
+++ b/hw/misc/stm32f4xx_syscfg.c
@@ -27,6 +27,7 @@
 #include "trace.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "hw/gpio/stm32_gpio.h"
 #include "hw/misc/stm32f4xx_syscfg.h"
 
 static void stm32f4xx_syscfg_reset(DeviceState *dev)
@@ -45,17 +46,21 @@ static void stm32f4xx_syscfg_reset(DeviceState *dev)
 static void stm32f4xx_syscfg_set_irq(void *opaque, int irq, int level)
 {
     STM32F4xxSyscfgState *s = opaque;
-    int icrreg = irq / 4;
-    int startbit = (irq & 3) * 4;
-    uint8_t config = irq / 16;
+    uint8_t pin = irq & 0xF; // first 4 bits encode the pin number (0-15)
+    uint8_t port = irq >> 4; // the rest encode the port number (0-8)
 
-    trace_stm32f4xx_syscfg_set_irq(irq / 16, irq % 16, level);
+    g_assert(port <= STM32_GPIO_PORT_I); // stm32f4xx only has ports A-I
+
+    int icrreg = pin / 4;
+    int startbit = (pin % 4) * 4;
+
+    trace_stm32f4xx_syscfg_set_irq(port, pin, level);
 
     g_assert(icrreg < SYSCFG_NUM_EXTICR);
 
-    if (extract32(s->syscfg_exticr[icrreg], startbit, 4) == config) {
-        qemu_set_irq(s->gpio_out[irq], level);
-        trace_stm32f4xx_pulse_exti(irq);
+    if (extract32(s->syscfg_exticr[icrreg], startbit, 4) == port) {
+        qemu_set_irq(s->gpio_out[pin], level);
+        trace_stm32f4xx_pulse_exti(pin);
    }
 }
 
@@ -129,8 +134,8 @@ static void stm32f4xx_syscfg_init(Object *obj)
                           TYPE_STM32F4XX_SYSCFG, 0x400);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
-    qdev_init_gpio_in(DEVICE(obj), stm32f4xx_syscfg_set_irq, 16 * 9);
-    qdev_init_gpio_out(DEVICE(obj), s->gpio_out, 16);
+    qdev_init_gpio_in(DEVICE(obj), stm32f4xx_syscfg_set_irq, STM32_GPIO_NPINS * (STM32_GPIO_PORT_I + 1));
+    qdev_init_gpio_out(DEVICE(obj), s->gpio_out, STM32_GPIO_NPINS);
 }
 
 static const VMStateDescription vmstate_stm32f4xx_syscfg = {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 1be0717c0c..b9fbcb0924 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -156,6 +156,12 @@ npcm7xx_pwm_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0
 npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Freq: old_freq: %u, new_freq: %u"
 npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Duty: old_duty: %u, new_duty: %u"
 
+# stm32_rcc.c
+stm32_rcc_read(uint64_t addr, uint64_t data) "reg read: addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
+stm32_rcc_write(uint64_t addr, uint64_t data) "reg write: addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
+stm32_rcc_pulse_enable(int line, int level) "Enable: %d to %d"
+stm32_rcc_pulse_reset(int line, int level) "Reset: %d to %d"
+
 # stm32f4xx_syscfg.c
 stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interrupt: GPIO: %d, Line: %d; Level: %d"
 stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
diff --git a/include/hw/arm/stm32.h b/include/hw/arm/stm32.h
new file mode 100644
index 0000000000..3df582e521
--- /dev/null
+++ b/include/hw/arm/stm32.h
@@ -0,0 +1,41 @@
+/*
+ * STM32 chip configuration parameters.
+ * These enums are used to configure STM32 chips, as well as their peripherals.
+ *
+ * Copyright 2024 Román Cárdenas <rcardenas.rod@gmail.com>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef STM32_H
+#define STM32_H
+
+enum {
+    // High Performance
+    STM32_F2,
+    STM32_F4,
+    STM32_H5,
+    STM32_F7,
+    STM32_H7,
+    // Mainstream
+    STM32_C0,
+    STM32_F0,
+    STM32_G0,
+    STM32_F1,
+    STM32_F3,
+    STM32_G4,
+    // Ultra Low Power
+    STM32_L0,
+    STM32_L4,
+    STM32_L4P,
+    STM32_L5,
+    STM32_U5,
+    // Wireless
+    STM32_WL,
+    STM32_WB0,
+    STM32_WB,
+    STM32_WBA,
+};
+
+#endif /* STM32_H */
diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index d15c03c4b5..62072815a7 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -25,6 +25,8 @@
 #ifndef HW_ARM_STM32F405_SOC_H
 #define HW_ARM_STM32F405_SOC_H
 
+#include "hw/misc/stm32_rcc.h"
+#include "hw/gpio/stm32_gpio.h"
 #include "hw/misc/stm32f4xx_syscfg.h"
 #include "hw/timer/stm32f2xx_timer.h"
 #include "hw/char/stm32f2xx_usart.h"
@@ -42,6 +44,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
 #define STM_NUM_TIMERS 4
 #define STM_NUM_ADCS 6
 #define STM_NUM_SPIS 6
+#define STM_NUM_GPIOS (STM32_GPIO_PORT_I - STM32_GPIO_PORT_A + 1)
 
 #define FLASH_BASE_ADDRESS 0x08000000
 #define FLASH_SIZE (1024 * 1024)
@@ -55,6 +58,7 @@ struct STM32F405State {
 
     ARMv7MState armv7m;
 
+    STM32RccState rcc;
     STM32F4xxSyscfgState syscfg;
     STM32F4xxExtiState exti;
     STM32F2XXUsartState usart[STM_NUM_USARTS];
@@ -62,6 +66,7 @@ struct STM32F405State {
     OrIRQState adc_irqs;
     STM32F2XXADCState adc[STM_NUM_ADCS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
+    STM32GPIOState gpio[STM_NUM_GPIOS];
 
     MemoryRegion ccm;
     MemoryRegion sram;
diff --git a/include/hw/gpio/stm32_gpio.h b/include/hw/gpio/stm32_gpio.h
new file mode 100644
index 0000000000..4e63fc2664
--- /dev/null
+++ b/include/hw/gpio/stm32_gpio.h
@@ -0,0 +1,105 @@
+/*
+ * STM32 System-on-Chip general purpose input/output register definition.
+ * While this implementation should work for most of STM32 SoCs, there are
+ * a few chips with different GPIO peripheral. For example, STM32F1 series.
+ *
+ * Copyright 2024 Román Cárdenas <rcardenas.rod@gmail.com>
+ *
+ * Based on sifive_gpio.c:
+ * 
+ * Copyright 2019 AdaCore
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef STM32_GPIO_H
+#define STM32_GPIO_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_STM32_GPIO "stm32.gpio"
+
+typedef struct STM32GPIOState STM32GPIOState;
+
+DECLARE_INSTANCE_CHECKER(STM32GPIOState, STM32_GPIO, TYPE_STM32_GPIO)
+
+#define STM32_GPIO_REG_MODER       0x000
+#define STM32_GPIO_REG_OTYPER      0x004
+#define STM32_GPIO_REG_OSPEEDR     0x008
+#define STM32_GPIO_REG_PUPDR       0x00C
+#define STM32_GPIO_REG_IDR         0x010
+#define STM32_GPIO_REG_ODR         0x014
+#define STM32_GPIO_REG_BSRR        0x018
+#define STM32_GPIO_REG_LCKR        0x01C
+#define STM32_GPIO_REG_AFRL        0x020
+#define STM32_GPIO_REG_AFRH        0x024
+#define STM32_GPIO_REG_BRR         0x028
+
+#define STM32_GPIO_NPINS           16
+#define STM32_GPIO_PERIPHERAL_SIZE 0x400
+
+struct STM32GPIOState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+
+    /* GPIO registers */
+    uint32_t moder;
+    uint32_t otyper;
+    uint32_t ospeedr;
+    uint32_t pupdr;
+    uint32_t idr;      /* Actual value of the pin */
+    uint32_t odr;      /* Pin value requested by the user */
+    uint32_t lckr;     // TODO implement locking sequence
+    uint32_t aflr;
+    uint32_t afhr;
+
+    /* state flags from RCC */
+    bool reset;
+    bool enable;
+
+    /* External input */
+    uint32_t in;
+    uint32_t in_mask; /* 0: pin disconnected/connected to load; 1: pin connected to value in in */
+
+    /* IRQ to notify that the GPIO has updated its state */
+    qemu_irq state_irq;
+    /* IRQs to relay each input pin changes to other STM32 peripherals */
+    qemu_irq input_irq[STM32_GPIO_NPINS];
+
+    /* config */
+    uint32_t family; // e.g. STM32_F4
+    uint32_t port;   // e.g. STM32_GPIO_PORT_A
+    uint32_t ngpio;  // e.g. 16
+};
+
+enum STM32GPIOPort {
+    STM32_GPIO_PORT_A = 0,
+    STM32_GPIO_PORT_B = 1,
+    STM32_GPIO_PORT_C = 2,
+    STM32_GPIO_PORT_D = 3,
+    STM32_GPIO_PORT_E = 4,
+    STM32_GPIO_PORT_F = 5,
+    STM32_GPIO_PORT_G = 6,
+    STM32_GPIO_PORT_H = 7,
+    STM32_GPIO_PORT_I = 8,
+    STM32_GPIO_PORT_J = 9,
+    STM32_GPIO_PORT_K = 10,
+};
+
+enum STM32GPIOMode {
+    STM32_GPIO_MODE_INPUT  = 0,
+    STM32_GPIO_MODE_OUTPUT = 1,
+    STM32_GPIO_MODE_AF     = 2,
+    STM32_GPIO_MODE_ANALOG = 3,
+};
+
+enum STM32GPIOPull {
+    STM32_GPIO_PULL_NONE = 0,
+    STM32_GPIO_PULL_UP   = 1,
+    STM32_GPIO_PULL_DOWN = 2,
+};
+
+#endif /* STM32_GPIO_H */
diff --git a/include/hw/misc/stm32_rcc.h b/include/hw/misc/stm32_rcc.h
new file mode 100644
index 0000000000..94836fac94
--- /dev/null
+++ b/include/hw/misc/stm32_rcc.h
@@ -0,0 +1,91 @@
+/*
+ * STM32 RCC (only reset and enable registers are implemented)
+ *
+ * Copyright (c) 2024 Román Cárdenas <rcardenas.rod@gmail.com>
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
+#ifndef HW_STM32_RCC_H
+#define HW_STM32_RCC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define STM32_RCC_CR              0x00
+#define STM32_RCC_PLL_CFGR        0x04
+#define STM32_RCC_CFGR            0x08
+#define STM32_RCC_CIR             0x0C
+#define STM32_RCC_AHB1_RSTR       0x10
+#define STM32_RCC_AHB2_RSTR       0x14
+#define STM32_RCC_AHB3_RSTR       0x18
+
+#define STM32_RCC_APB1_RSTR       0x20
+#define STM32_RCC_APB2_RSTR       0x24
+
+#define STM32_RCC_AHB1_ENR        0x30
+#define STM32_RCC_AHB2_ENR        0x34
+#define STM32_RCC_AHB3_ENR        0x38
+
+#define STM32_RCC_APB1_ENR        0x40
+#define STM32_RCC_APB2_ENR        0x44
+
+#define STM32_RCC_AHB1_LPENR      0x50
+#define STM32_RCC_AHB2_LPENR      0x54
+#define STM32_RCC_AHB3_LPENR      0x58
+
+#define STM32_RCC_APB1_LPENR      0x60
+#define STM32_RCC_APB2_LPENR      0x64
+
+#define STM32_RCC_BDCR            0x70
+#define STM32_RCC_CSR             0x74
+
+#define STM32_RCC_SSCGR           0x80
+#define STM32_RCC_PLLI2SCFGR      0x84
+#define STM32_RCC_PLLSAI_CFGR     0x88
+#define STM32_RCC_DCKCFGR         0x8C
+#define STM32_RCC_CKGATENR        0x90
+#define STM32_RCC_DCKCFGR2        0x94
+
+#define STM32_RCC_NREGS           ((STM32_RCC_DCKCFGR2 >> 2) + 1)
+#define STM32_RCC_PERIPHERAL_SIZE 0x400
+#define STM32_RCC_NIRQS (32 * 5) // 32 bits per register, 5 enable/reset registers
+
+#define STM32_RCC_GPIO_IRQ_OFFSET 0
+
+#define TYPE_STM32_RCC "stm32.rcc"
+
+typedef struct STM32RccState STM32RccState;
+
+DECLARE_INSTANCE_CHECKER(STM32RccState, STM32_RCC, TYPE_STM32_RCC)
+
+#define NUM_GPIO_EVENT_IN_LINES 16
+
+struct STM32RccState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+
+    uint32_t regs[STM32_RCC_NREGS];
+
+    qemu_irq enable_irq[STM32_RCC_NIRQS];
+    qemu_irq reset_irq[STM32_RCC_NIRQS];
+};
+
+#endif /* HW_STM32_RCC_H */
-- 
2.39.3 (Apple Git-146)

