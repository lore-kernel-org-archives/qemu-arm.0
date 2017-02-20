Received: by 10.25.0.147 with SMTP id 141csp113293lfa;
        Mon, 20 Feb 2017 09:36:23 -0800 (PST)
X-Received: by 10.200.50.92 with SMTP id y28mr14842643qta.289.1487612183397;
        Mon, 20 Feb 2017 09:36:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si13371841qtn.280.2017.02.20.09.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 09:36:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:40130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfrss-00054v-RU
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 12:36:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cfrrQ-0004O6-2V
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cfrrO-0007Fq-UK
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:34:52 -0500
Received: from bee.antfield.fr ([188.165.75.195]:46354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1cfrrL-0007Ev-8j; Mon, 20 Feb 2017 12:34:47 -0500
From: Clement Deschamps <clement.deschamps@antfield.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487612086; bh=nDUagjgfm0blswDBYlsYUV4nUwjSXhKdcYJxTYb3pi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yuQ008ZuOB9b+1WhSVsd8/1zldCv29+1qABXLHR4cAxXNZprgM+00UESy8RRSHVTt
	Resd77j7Wh+UUqXDYjvV6+5ackctyUa5gTJJR3cNrK2aEQaGxXakYXfyzKjF1E4HFg
	6BHi9Y/dvfzChM+LMSuMVHYLZk3Uf3Py2B2UPmLY=
To: qemu-devel@nongnu.org
Date: Mon, 20 Feb 2017 18:34:30 +0100
Message-Id: <20170220173430.31630-3-clement.deschamps@antfield.fr>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170220173430.31630-1-clement.deschamps@antfield.fr>
References: <20170220173430.31630-1-clement.deschamps@antfield.fr>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: [Qemu-devel] [PATCH 2/2] bcm2835: add bcm2835_sdhost to bcm2835
 platform
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	andrew.baumann@microsoft.com, gregory.estrade@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aoau51moD6R3

Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
---
 hw/arm/bcm2835_peripherals.c         | 24 ++++++++++++++++++++++++
 hw/arm/bcm2836.c                     |  7 +++++++
 hw/arm/raspi.c                       | 13 ++++++++++++-
 hw/sd/Makefile.objs                  |  1 +
 include/hw/arm/bcm2835_peripherals.h |  2 ++
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 2e641a3989..9306c8c5f3 100644
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
@@ -259,6 +264,25 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* SDHOST */
+    object_property_set_bool(OBJECT(&s->sdhost), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, MMCI0_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhost), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhost), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_SDIO));
+    object_property_add_alias(OBJECT(s), "sd-bus-2", OBJECT(&s->sdhost),
+                              "sd-bus", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* DMA Channels */
     object_property_set_bool(OBJECT(&s->dma), true, "realized", &err);
     if (err) {
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8451190a19..e69c49cf1d 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -85,6 +85,13 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    object_property_add_alias(OBJECT(s), "sd-bus-2", OBJECT(&s->peripherals),
+                              "sd-bus-2", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
                             BCM2836_PERI_BASE, 1);
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 2b295f14c4..cdb7a2bbac 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -142,7 +142,7 @@ static void raspi2_init(MachineState *machine)
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
 
     /* Create and plug in the SD cards */
-    di = drive_get_next(IF_SD);
+    di = drive_get_by_index(IF_SD, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
     bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
     if (bus == NULL) {
@@ -153,6 +153,17 @@ static void raspi2_init(MachineState *machine)
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
 
+    di = drive_get_by_index(IF_SD, 1);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus-2");
+    if (bus == NULL) {
+        error_report("No secondary SD bus found in SOC object");
+        exit(1);
+    }
+    carddev = qdev_create(bus, TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+
     vcram_size = object_property_get_int(OBJECT(&s->soc), "vcram-size",
                                          &error_abort);
     setup_boot(machine, 2, machine->ram_size - vcram_size);
diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index 31c83308f2..c2b7664264 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -6,3 +6,4 @@ common-obj-$(CONFIG_SDHCI) += sdhci.o
 obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
 obj-$(CONFIG_OMAP) += omap_mmc.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
+obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index e12ae3721a..3243038559 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -20,6 +20,7 @@
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_mbox.h"
+#include "hw/sd/bcm2835_sdhost.h"
 #include "hw/sd/sdhci.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
@@ -42,6 +43,7 @@ typedef struct BCM2835PeripheralState {
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835MboxState mboxes;
+    BCM2835SDHostState sdhost;
     SDHCIState sdhci;
 } BCM2835PeripheralState;
 
-- 
2.11.0

