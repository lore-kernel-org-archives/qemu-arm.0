Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp889099wru;
        Sun, 15 Jul 2018 15:06:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeVijGzeKx5fpWWRg+MefhwEhaPtICsngS44lJ6THIrOrLU/AFr4iLLI4EGCONN04dZ19LZ
X-Received: by 2002:a0c:8485:: with SMTP id m5-v6mr15803844qva.222.1531692391006;
        Sun, 15 Jul 2018 15:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531692391; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5ntdI/FrwwzMVf2Poe8yyGNBTconLQ/1X8zG9GEG70g3rY0iIqW+F73+v7KTwz0XH
         XuPMdPC5i9IpgRqQMJB7uX/5nn5Hui/GYX+49/PmgcNLz+HgE1HnHivWTS1dejDgcp2k
         vnW4VdnY5keXxrZHN8iSxxKptOwdVZeas4emhgJ0IhDmGJYabYJdleWdFC2kRwAFlmHJ
         TbJVgNaw4b/gENdR29UUwmbds0FTm3YgYQvFAtdqV+E5aJFuB0Rjj96MItA8nBYnGBCZ
         G6U+BqGB4CE1nwkZIw51kQorOlm4lLhrH+mZUdNU7bTvbBzJxH7xnw023hANaRW9wvJV
         2pOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=yGJAXI+NZH95QNrq5SWZSQ27SWnuCF3CNRRyQEg9sA4=;
        b=LTGb8PCFgjd7+k/eh/6a1NFKofrYFpNbT3X5jrM7xQIZrJxcK5JW4P6yiJTzruJc80
         gPtQcXBOGyPKum4sbaF9B6fDVrXKnjgX0iMsEwAarzCplxq4JYzavbUokaK3wVTfiWMx
         DQBQqVVkHZB0y5cJWqhtyXXaUEOVeVnalihAi/nCQdOV/lJ70wQVKSBcMWTY1tBSOSVL
         S2G6wyRFj8ZOVts4qP68EzIOBXniTP8jHvEPD7GMyfo5Nk9IICVHc0N+PYigriocmFoE
         VQj+jQ0muItM1CcogdHsQXY+EegyBFy2TqGfdeg7e6ml/YNUhLuxplUt7/h/F+MYdET1
         H8GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TmUQLDwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si6533807qte.29.2018.07.15.15.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Jul 2018 15:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TmUQLDwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fep9y-0005yL-HO
	for alex.bennee@linaro.org; Sun, 15 Jul 2018 18:06:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fep9p-0005y4-VH
	for qemu-arm@nongnu.org; Sun, 15 Jul 2018 18:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fep9l-0005IJ-UY
	for qemu-arm@nongnu.org; Sun, 15 Jul 2018 18:06:21 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:46433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1fep9l-0005H7-Kf; Sun, 15 Jul 2018 18:06:17 -0400
Received: by mail-pf0-x242.google.com with SMTP id l123-v6so25305509pfl.13;
	Sun, 15 Jul 2018 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=yGJAXI+NZH95QNrq5SWZSQ27SWnuCF3CNRRyQEg9sA4=;
	b=TmUQLDwZN5npjfOFPz4oSrJQmmv54wUL0opj0CGDIlG61t2aYOs/JCK3GN1TQF71c2
	BKne2JxR0h6cu9UxlYYiF7SRwvjBNeNAIc5fx9a+p+hTRWC95thtTOptiDzMB0/cnozt
	lcqYMQ/NHsP9QHnNX03Kbq0bYQavQ/n4mYzWajVPvEdb0DfjkXD0Mk/s6g83LnXjK+ql
	wUkhh80gHJNLDHJzwcpga2LYPZMze3r2CoAmfM0rhzq0KpujIwRcIbu2YN+2lX5SwzyQ
	Brpth5KqYY8OdSNeXUidGcsvJp59rxzEJwHykB9RyDqAc6hRKg0l9O395fvvxgHYtac2
	9pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=yGJAXI+NZH95QNrq5SWZSQ27SWnuCF3CNRRyQEg9sA4=;
	b=OEq9QXE2zxPPD9DsCftNhAZU36Oq+fTxGwYJDuSyLG4wgqw2R+Q2DKkzu0CXQHFxgj
	QCLxGfVJFu29VsF0IAR8PPW19XSjZBArdO2Spa4UwNdiyOe471YkW0eLOJCkZPt7cupP
	tLDNw2c5izkRquj8LQZ6LS75n9lxfkMcEUNs/QExzcrBENJQlUJIe0Eml7BCQmRRCUlO
	R6obETJU0Ne2UcY2QwqJ58FWGOFwd7MGLdFSY/0LBaYdUMEFbGnGJP6UYSi+/O1M/qL7
	yB/lnOaUXh/7vdFJXMmQVVn/wN6ujWXLR71ma7Gtf51sCHvofoD0OTWm02YmdargWYkC
	n1VQ==
X-Gm-Message-State: AOUpUlFn6vwVA+bpEPPjJWAV3p8Gdhrmo0LbtsxASmZLI4mrYbZore5S
	+10fI7mGYu+MNEL8AUTCqAw=
X-Received: by 2002:a63:b445:: with SMTP id
	n5-v6mr13700632pgu.104.1531692376171; 
	Sun, 15 Jul 2018 15:06:16 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
	[108.223.40.66]) by smtp.gmail.com with ESMTPSA id
	k27-v6sm10625376pfg.34.2018.07.15.15.06.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 15:06:15 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Jul 2018 15:06:09 -0700
Message-Id: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman (clock
 subsystem)
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 540kCUZgDV5J

Add basic support for BCM283x CPRMAN. Provide support for reading and
writing CPRMAN registers and initialize registers with sensible default
values. During runtime retain any written values.

Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
and raspi3 systems.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I don't seriously expect this patch to get accepted, but I thought
it might be valuable enough for others to use it when playing with
raspi2 and raspi3 emulations.

 hw/arm/bcm2835_peripherals.c         |  15 +++++
 hw/misc/Makefile.objs                |   1 +
 hw/misc/bcm2835_cprman.c             | 126 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/arm/raspi_platform.h      |   1 +
 include/hw/misc/bcm2835_cprman.h     |  28 ++++++++
 6 files changed, 173 insertions(+)
 create mode 100644 hw/misc/bcm2835_cprman.c
 create mode 100644 include/hw/misc/bcm2835_cprman.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6be7660..1a8993f 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -85,6 +85,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
 
+    /* Clock subsystem */
+    object_initialize(&s->cprman, sizeof(s->cprman), TYPE_BCM2835_CPRMAN);
+    object_property_add_child(obj, "cprman", OBJECT(&s->cprman), NULL);
+    qdev_set_parent_bus(DEVICE(&s->cprman), sysbus_get_default());
+
     /* Random Number Generator */
     object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
     object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
@@ -244,6 +249,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
 
+    /* Clock subsystem */
+    object_property_set_bool(OBJECT(&s->cprman), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* Random Number Generator */
     object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
     if (err) {
@@ -251,6 +263,9 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    memory_region_add_subregion(&s->peri_mr, CPRMAN_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cprman), 0));
+
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 9350900..ae5fc8a 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -52,6 +52,7 @@ obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_RASPI) += bcm2835_mbox.o
 obj-$(CONFIG_RASPI) += bcm2835_property.o
 obj-$(CONFIG_RASPI) += bcm2835_rng.o
+obj-$(CONFIG_RASPI) += bcm2835_cprman.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
new file mode 100644
index 0000000..4051f2b
--- /dev/null
+++ b/hw/misc/bcm2835_cprman.c
@@ -0,0 +1,126 @@
+/*
+ * BCM2835 Clock subsystem (poor man's version)
+ *
+ * Copyright (C) 2018 Guenter Roeck <linux@roeck-us.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "crypto/random.h"
+#include "hw/misc/bcm2835_cprman.h"
+
+static uint64_t bcm2835_cprman_read(void *opaque, hwaddr offset,
+                                 unsigned size)
+{
+    BCM2835CprmanState *s = (BCM2835CprmanState *)opaque;
+    uint32_t res = 0;
+
+    assert(size == 4);
+
+    if (offset / 4 < CPRMAN_NUM_REGS) {
+        res = s->regs[offset / 4];
+    }
+
+    return res;
+}
+
+#define CM_PASSWORD             0x5a000000
+#define CM_PASSWORD_MASK        0xff000000
+
+static void bcm2835_cprman_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size)
+{
+    BCM2835CprmanState *s = (BCM2835CprmanState *)opaque;
+
+    assert(size == 4);
+
+    if ((value & 0xff000000) == CM_PASSWORD &&
+        offset / 4 < CPRMAN_NUM_REGS)
+            s->regs[offset / 4] = value & ~CM_PASSWORD_MASK;
+}
+
+static const MemoryRegionOps bcm2835_cprman_ops = {
+    .read = bcm2835_cprman_read,
+    .write = bcm2835_cprman_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_bcm2835_cprman = {
+    .name = TYPE_BCM2835_CPRMAN,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, BCM2835CprmanState, CPRMAN_NUM_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_cprman_init(Object *obj)
+{
+    BCM2835CprmanState *s = BCM2835_CPRMAN(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_cprman_ops, s,
+                          TYPE_BCM2835_CPRMAN, 0x2000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+#define CM_GNRICCTL        (0x000 / 4)
+#define CM_VECCTL        (0x0f8 / 4)
+#define CM_DFTCTL        (0x168 / 4)
+#define CM_EMMCCTL        (0x1c0 / 4)
+#define A2W_PLLA_CTRL        (0x1100 / 4)
+#define A2W_PLLB_CTRL        (0x11e0 / 4)
+
+static void bcm2835_cprman_reset(DeviceState *dev)
+{
+    BCM2835CprmanState *s = BCM2835_CPRMAN(dev);
+    int i;
+
+    /*
+     * Available information suggests that CPRMAN registers have default
+     * values which are not overwritten by ROMMON (u-boot). The hardware
+     * default values are unknown at this time.
+     * The default values selected here are necessary and sufficient
+     * to boot Linux directly (on raspi2 and raspi3). The selected
+     * values enable all clocks and set clock rates to match their
+     * parent rates.
+     */
+    for (i = CM_GNRICCTL; i <= CM_VECCTL; i += 2) {
+        s->regs[i] = 0x11;
+        s->regs[i + 1] = 0x1000;
+    }
+    for (i = CM_DFTCTL; i <= CM_EMMCCTL; i += 2) {
+        s->regs[i] = 0x11;
+        s->regs[i + 1] = 0x1000;
+    }
+    for (i = A2W_PLLA_CTRL; i <= A2W_PLLB_CTRL; i += 8) {
+        s->regs[i] = 0x10001;
+    }
+}
+
+static void bcm2835_cprman_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bcm2835_cprman_reset;
+    dc->vmsd = &vmstate_bcm2835_cprman;
+}
+
+static TypeInfo bcm2835_cprman_info = {
+    .name          = TYPE_BCM2835_CPRMAN,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835CprmanState),
+    .class_init    = bcm2835_cprman_class_init,
+    .instance_init = bcm2835_cprman_init,
+};
+
+static void bcm2835_cprman_register_types(void)
+{
+    type_register_static(&bcm2835_cprman_info);
+}
+
+type_init(bcm2835_cprman_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index f5b193f..f9f53e3 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -19,6 +19,7 @@
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_rng.h"
+#include "hw/misc/bcm2835_cprman.h"
 #include "hw/misc/bcm2835_mbox.h"
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
@@ -44,6 +45,7 @@ typedef struct BCM2835PeripheralState {
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835RngState rng;
+    BCM2835CprmanState cprman;
     BCM2835MboxState mboxes;
     SDHCIState sdhci;
     BCM2835SDHostState sdhost;
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 6467e88..412d010 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -36,6 +36,7 @@
                                                       * Doorbells & Mailboxes */
 #define PM_OFFSET               0x100000 /* Power Management, Reset controller
                                           * and Watchdog registers */
+#define CPRMAN_OFFSET           0x101000
 #define PCM_CLOCK_OFFSET        0x101098
 #define RNG_OFFSET              0x104000
 #define GPIO_OFFSET             0x200000
diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
new file mode 100644
index 0000000..db250b3
--- /dev/null
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -0,0 +1,28 @@
+/*
+ * BCM2835 Poor-man's version of CPRMAN
+ *
+ * Copyright (C) 2018 Guenter Roeck <linux@roeck-us.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2835_CPRMAN_H
+#define BCM2835_CPRMAN_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_BCM2835_CPRMAN "bcm2835-cprman"
+#define BCM2835_CPRMAN(obj) \
+        OBJECT_CHECK(BCM2835CprmanState, (obj), TYPE_BCM2835_CPRMAN)
+
+#define CPRMAN_NUM_REGS         (0x1200 / 4)
+
+typedef struct {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    uint32_t regs[CPRMAN_NUM_REGS];
+} BCM2835CprmanState;
+
+#endif
-- 
2.7.4

