Received: by 10.25.0.147 with SMTP id 141csp59081lfa;
        Mon, 20 Feb 2017 07:36:13 -0800 (PST)
X-Received: by 10.25.205.3 with SMTP id d3mr6151644lfg.65.1487604973591;
        Mon, 20 Feb 2017 07:36:13 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id t17si9672386ljd.194.2017.02.20.07.36.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0a-0005jl-Qj; Mon, 20 Feb 2017 15:36:12 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 11/11] stm32f205: Rename 'nvic' local to 'armv7m'
Date: Mon, 20 Feb 2017 15:36:05 +0000
Message-Id: <1487604965-23220-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Xo1ol31uTKOV

The local variable 'nvic' in stm32f205_soc_realize() no longer
holds a direct pointer to the NVIC device; it is a pointer to
the ARMv7M container object. Rename it 'armv7m' accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stm32f205_soc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index e6bd73a..6e1260d 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -85,7 +85,7 @@ static void stm32f205_soc_initfn(Object *obj)
 static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     STM32F205State *s = STM32F205_SOC(dev_soc);
-    DeviceState *dev, *nvic;
+    DeviceState *dev, *armv7m;
     SysBusDevice *busdev;
     Error *err = NULL;
     int i;
@@ -113,9 +113,9 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     vmstate_register_ram_global(sram);
     memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
 
-    nvic = DEVICE(&s->armv7m);
-    qdev_prop_set_uint32(nvic, "num-irq", 96);
-    qdev_prop_set_string(nvic, "cpu-model", s->cpu_model);
+    armv7m = DEVICE(&s->armv7m);
+    qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
                                      "memory", &error_abort);
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
@@ -133,7 +133,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, 0x40013800);
-    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, 71));
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, 71));
 
     /* Attach UART (uses USART registers) and USART controllers */
     for (i = 0; i < STM_NUM_USARTS; i++) {
@@ -147,7 +147,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
         }
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_mmio_map(busdev, 0, usart_addr[i]);
-        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, usart_irq[i]));
+        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq[i]));
     }
 
     /* Timer 2 to 5 */
@@ -161,7 +161,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
         }
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_mmio_map(busdev, 0, timer_addr[i]);
-        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, timer_irq[i]));
+        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer_irq[i]));
     }
 
     /* ADC 1 to 3 */
@@ -173,7 +173,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
     qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
-                          qdev_get_gpio_in(nvic, ADC_IRQ));
+                          qdev_get_gpio_in(armv7m, ADC_IRQ));
 
     for (i = 0; i < STM_NUM_ADCS; i++) {
         dev = DEVICE(&(s->adc[i]));
@@ -198,7 +198,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
         }
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_mmio_map(busdev, 0, spi_addr[i]);
-        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, spi_irq[i]));
+        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
     }
 }
 
-- 
2.7.4
