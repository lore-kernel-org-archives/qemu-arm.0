Received: by 10.25.77.65 with SMTP id a62csp680484lfb;
        Fri, 10 Feb 2017 13:34:37 -0800 (PST)
X-Received: by 10.55.98.5 with SMTP id w5mr10308384qkb.165.1486762477363;
        Fri, 10 Feb 2017 13:34:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c32si2180358qkh.217.2017.02.10.13.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 13:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccIpt-00031v-Qq
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 16:34:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcinch7@gmail.com>) id 1ccFaK-0001Ep-Sn
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 13:06:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcinch7@gmail.com>) id 1ccFaH-0002m4-MC
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 13:06:16 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:36686)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcinch7@gmail.com>)
	id 1ccFaH-0002kP-DB; Fri, 10 Feb 2017 13:06:13 -0500
Received: by mail-wr0-x243.google.com with SMTP id k90so15858938wrc.3;
	Fri, 10 Feb 2017 10:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ygS5G24XACW0CS23F+KkUuxDNDyB/IQKJcOrvsivnN4=;
	b=BSqYYJAUwVwrSLxA0or9YqgColcKp/8iI7851rFQ4obShkiVPingUoNcL2ZeVfgixH
	wPWlHuB/aTsqG4xYYndfIuIHyvQSAXfmzIYGm7tbZxhWmA+XaYxlsmGUVgprJGEXIa0F
	2jSTkqxmQ63CaA2SYSs0KC16tO8BN8VS5bZwxwXD91JvqjCkdzGBKEitZ6WE3L4sGLgW
	4uLlrV7mDb4pLsBOVYljIOznvlc9ojEiAuNLbX2MS/pt6/6uGMV0/t/s8a6Wg51u9CSP
	c1n5HrchV8LxgoG3pcpMe9jfeYRuHFUQFg1hiO1sp0SkDmmKtGtN5tIxpPCk89rqYS9R
	JopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ygS5G24XACW0CS23F+KkUuxDNDyB/IQKJcOrvsivnN4=;
	b=qXPT21ImkOtzYx2Gyf0AXmQm+779O0hja5yHWlqgAyQLYIe+wdLynh71HXaqyxnydc
	Z1Y1Xqahd/xd2346J19+Z7031j9TXbfvoeSEbjLUXsmNt5GKAttTpneI4VW8HchC9kUe
	xmNN5vN8oYmOw5xztOJBBGMe3hr9jPXG4dScstncVvCWsGtJlAIdCs4VqugFhQXuN3SV
	jIRKD8Tsx9mcZ/zB6WuDTT2/v9A6KoBfAR6Et1Uph2XOf9sjohHRhq8XAdIM9j6rP+cR
	we4XjVH/UklSqPUNP/v1K9dn/wGbTyyzOk2tdQr1RDVssmpoyN/L4QcQ+2Kf/1ydV+QO
	/7TQ==
X-Gm-Message-State: AMke39kk4L+NlpNffX/k8q9EzN21NaXc4CTGtuUYbt7boE6VaVnW6QuoyOkp5Uh59YqW2A==
X-Received: by 10.223.164.10 with SMTP id d10mr8374177wra.90.1486749970807;
	Fri, 10 Feb 2017 10:06:10 -0800 (PST)
Received: from localhost.localdomain (cbv156.neoplus.adsl.tpnet.pl.
	[83.30.119.156]) by smtp.gmail.com with ESMTPSA id
	l140sm2479576wmg.12.2017.02.10.10.06.09
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Fri, 10 Feb 2017 10:06:09 -0800 (PST)
From: Marcin Chojnacki <marcinch7@gmail.com>
To: qemu-arm@nongnu.org
Date: Fri, 10 Feb 2017 19:06:00 +0100
Message-Id: <20170210180600.45797-1-marcinch7@gmail.com>
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::243
X-Mailman-Approved-At: Fri, 10 Feb 2017 16:33:47 -0500
Subject: [Qemu-arm] [PATCH] target-arm: Implement BCM2835 hardware RNG
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Marcin Chojnacki <marcinch7@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eTYkx1K+L8av

Recent vanilla Raspberry Pi kernels started to make use of
the hardware random number generator in BCM2835 SoC. As a
result, those kernels wouldn't work anymore under QEMU
but rather just freeze during the boot process.

This patch implements a trivial BCM2835 compatible RNG,
and adds it as a peripheral to BCM2835 platform, which
allows to boot a vanilla Raspberry Pi kernel under Qemu.

Signed-off-by: Marcin Chojnacki <marcinch7@gmail.com>
---
 hw/arm/bcm2835_peripherals.c         |  15 +++++
 hw/misc/Makefile.objs                |   1 +
 hw/misc/bcm2835_rng.c                | 115 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/misc/bcm2835_rng.h        |  23 +++++++
 5 files changed, 156 insertions(+)
 create mode 100644 hw/misc/bcm2835_rng.c
 create mode 100644 include/hw/misc/bcm2835_rng.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 2e641a3..9ed22d5 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -86,6 +86,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
 
+    /* Random Number Generator */
+    object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
+    object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
+    qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
+
     /* Extended Mass Media Controller */
     object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
@@ -226,6 +231,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
 
+    /* Random Number Generator */
+    object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
+
     /* Extended Mass Media Controller */
     object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
                             &err);
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 898e4cc..57a4406 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -42,6 +42,7 @@ obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_RASPI) += bcm2835_mbox.o
 obj-$(CONFIG_RASPI) += bcm2835_property.o
+obj-$(CONFIG_RASPI) += bcm2835_rng.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
new file mode 100644
index 0000000..00fb083
--- /dev/null
+++ b/hw/misc/bcm2835_rng.c
@@ -0,0 +1,115 @@
+/*
+ * Raspberry Pi emulation (c) 2017 Marcin Chojnacki
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/misc/bcm2835_rng.h"
+
+static uint64_t bcm2835_rng_read(void *opaque, hwaddr offset,
+    unsigned size)
+{
+    BCM2835RngState *s = (BCM2835RngState *)opaque;
+    uint32_t res = 0;
+
+    assert(size == 4);
+
+    switch (offset) {
+    case 0x0:    /* rng_ctrl */
+        res = s->rng_ctrl;
+        break;
+    case 0x4:    /* rng_status */
+        res = s->rng_status | (1 << 24);
+        break;
+    case 0x8:    /* rng_data */
+        res = rand();
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_rng_read: Bad offset %x\n", (int)offset);
+        res = 0;
+        break;
+    }
+
+    return res;
+}
+
+static void bcm2835_rng_write(void *opaque, hwaddr offset,
+    uint64_t value, unsigned size)
+{
+    BCM2835RngState *s = (BCM2835RngState *)opaque;
+
+    assert(size == 4);
+
+    switch (offset) {
+    case 0x0:    /* rng_ctrl */
+        s->rng_ctrl = value;
+        break;
+    case 0x4:    /* rng_status */
+        s->rng_status = value;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "bcm2835_rng_write: Bad offset %x\n", (int)offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps bcm2835_rng_ops = {
+    .read = bcm2835_rng_read,
+    .write = bcm2835_rng_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_bcm2835_rng = {
+    .name = TYPE_BCM2835_RNG,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_rng_init(Object *obj)
+{
+    BCM2835RngState *s = BCM2835_RNG(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_rng_ops, s,
+                          TYPE_BCM2835_RNG, 0x10);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void bcm2835_rng_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835RngState *s = BCM2835_RNG(dev);
+
+    s->rng_ctrl = 0;
+    s->rng_status = 0;
+}
+
+static void bcm2835_rng_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2835_rng_realize;
+    dc->vmsd = &vmstate_bcm2835_rng;
+}
+
+static TypeInfo bcm2835_rng_info = {
+    .name          = TYPE_BCM2835_RNG,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835RngState),
+    .class_init    = bcm2835_rng_class_init,
+    .instance_init = bcm2835_rng_init,
+};
+
+static void bcm2835_rng_register_types(void)
+{
+    type_register_static(&bcm2835_rng_info);
+}
+
+type_init(bcm2835_rng_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index e12ae37..31241c7 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -19,6 +19,7 @@
 #include "hw/dma/bcm2835_dma.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
+#include "hw/misc/bcm2835_rng.h"
 #include "hw/misc/bcm2835_mbox.h"
 #include "hw/sd/sdhci.h"
 
@@ -41,6 +42,7 @@ typedef struct BCM2835PeripheralState {
     BCM2835DMAState dma;
     BCM2835ICState ic;
     BCM2835PropertyState property;
+    BCM2835RngState rng;
     BCM2835MboxState mboxes;
     SDHCIState sdhci;
 } BCM2835PeripheralState;
diff --git a/include/hw/misc/bcm2835_rng.h b/include/hw/misc/bcm2835_rng.h
new file mode 100644
index 0000000..3ef816e
--- /dev/null
+++ b/include/hw/misc/bcm2835_rng.h
@@ -0,0 +1,23 @@
+/*
+ * Raspberry Pi emulation (c) 2017 Marcin Chojnacki
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_RNG_H
+#define BCM2835_RNG_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_BCM2835_RNG "bcm2835-rng"
+#define BCM2835_RNG(obj) \
+        OBJECT_CHECK(BCM2835RngState, (obj), TYPE_BCM2835_RNG)
+
+typedef struct {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    uint32_t rng_ctrl;
+    uint32_t rng_status;
+} BCM2835RngState;
+
+#endif
-- 
2.10.1 (Apple Git-78)

