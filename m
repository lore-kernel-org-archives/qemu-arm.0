Received: by 10.25.0.147 with SMTP id 141csp766264lfa;
        Fri, 24 Feb 2017 08:40:45 -0800 (PST)
X-Received: by 10.237.36.208 with SMTP id u16mr3801031qtc.105.1487954445057;
        Fri, 24 Feb 2017 08:40:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p53si5985858qte.223.2017.02.24.08.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 08:40:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:38420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chIvC-0003YA-8x
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 11:40:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chIuw-0003NU-Sh
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 11:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chIuv-0001By-Rj
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 11:40:26 -0500
Received: from bee.antfield.fr ([188.165.75.195]:53544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1chIuv-0001BG-JH; Fri, 24 Feb 2017 11:40:25 -0500
From: Clement Deschamps <clement.deschamps@antfield.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487954424; bh=gzw5WfhNkMnGyOJYHheNsdRSN/zO9n6T7QV0JKSxLfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WkL50tgcvVwHn6roEq3yE+tshmrrnnAy8DplZgH25AVMkAByn792vmtY8GIzbQLMO
	leZXrayQ+wvZBVFHiV4tauUwjaVPMJsF6qbDBpYrnjLbJ2PeGGphM7Wg0zL5+3d7ZS
	L+6lnn4EGhVP5HkmeqxYtgonGD2RDAuvL5fZagRM=
To: qemu-devel@nongnu.org
Date: Fri, 24 Feb 2017 17:40:21 +0100
Message-Id: <20170224164021.9066-5-clement.deschamps@antfield.fr>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170224164021.9066-1-clement.deschamps@antfield.fr>
References: <20170224164021.9066-1-clement.deschamps@antfield.fr>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: [Qemu-arm] [PATCH v3 4/4] bcm2835: add sdhost and gpio controllers
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	andrew.baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dfm15Fm0Mg9Q

This adds the bcm2835_sdhost and bcm2835_gpio to the BCM2835 platform.

For supporting the SD controller selection (alternate function of GPIOs
48-53), the bcm2835_gpio now exposes an sdbus.
It also has a link to both the sdbus of sdhci and sdhost controllers,
and the card is reparented from one bus to another when the alternate
function of GPIOs 48-53 is modified.

Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
---
 hw/arm/bcm2835_peripherals.c         | 43 ++++++++++++++++++++++++++++++++++--
 include/hw/arm/bcm2835_peripherals.h |  4 ++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 2e641a3989..33398b04db 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -91,6 +91,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
     qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
 
+    /* SDHOST */
+    object_initialize(&s->sdhost, sizeof(s->sdhost), TYPE_BCM2835_SDHOST);
+    object_property_add_child(obj, "sdhost", OBJECT(&s->sdhost), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sdhost), sysbus_get_default());
+
     /* DMA Channels */
     object_initialize(&s->dma, sizeof(s->dma), TYPE_BCM2835_DMA);
     object_property_add_child(obj, "dma", OBJECT(&s->dma), NULL);
@@ -98,6 +103,16 @@ static void bcm2835_peripherals_init(Object *obj)
 
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
+
+    /* GPIO */
+    object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
+    object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
+    qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
+                                   OBJECT(&s->sdhci.sdbus), &error_abort);
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
+                                   OBJECT(&s->sdhost.sdbus), &error_abort);
 }
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -252,13 +267,20 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_ARASANSDIO));
-    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->sdhci), "sd-bus",
-                              &err);
+
+    /* SDHOST */
+    object_property_set_bool(OBJECT(&s->sdhost), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
+    memory_region_add_subregion(&s->peri_mr, MMCI0_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhost), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhost), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_SDIO));
+
     /* DMA Channels */
     object_property_set_bool(OBJECT(&s->dma), true, "realized", &err);
     if (err) {
@@ -277,6 +299,23 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                                                   BCM2835_IC_GPU_IRQ,
                                                   INTERRUPT_DMA0 + n));
     }
+
+    /* GPIO */
+    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, GPIO_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
+
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus",
+                              &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
 }
 
 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index e12ae3721a..4c87859e31 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -21,6 +21,8 @@
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_mbox.h"
 #include "hw/sd/sdhci.h"
+#include "hw/sd/bcm2835_sdhost.h"
+#include "hw/gpio/bcm2835_gpio.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
 #define BCM2835_PERIPHERALS(obj) \
@@ -43,6 +45,8 @@ typedef struct BCM2835PeripheralState {
     BCM2835PropertyState property;
     BCM2835MboxState mboxes;
     SDHCIState sdhci;
+    BCM2835SDHostState sdhost;
+    BCM2835GpioState gpio;
 } BCM2835PeripheralState;
 
 #endif /* BCM2835_PERIPHERALS_H */
-- 
2.11.1

