Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6303591wrq;
        Wed, 27 Jun 2018 07:40:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcRdnmDXNnGLmDUQ+PrCO2Xnt3x0JhVKAeaBM7CDhUVE8FJCe6WGuqzCLNsbKJ1C7EWbqtT
X-Received: by 2002:a37:4654:: with SMTP id t81-v6mr5172930qka.82.1530110446056;
        Wed, 27 Jun 2018 07:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530110446; cv=none;
        d=google.com; s=arc-20160816;
        b=UWpEe5oVoyOGwncU6qKpVNV0OyFII8uMB86c+NX2vB4HdFosomdpMFN45kL9kDrgkQ
         rM4/R4klTCm31JWY137LftprFF7F7wFCl6isEATlgS3mDxXU1N0zsDOVLNYspQYwE0HI
         f5nyCwlgWkjDLYyZN1OXLhVC2CVoAMIOCIbYpZsO2SKvuZlOtP5hbyqQueeIHrp+uEEk
         Epa3IrN0CaXNrz90n2bEzJz/jXPi9L62uOIwLA6rPrAYlNQMhkghgMAGEUwMVnnh+GpR
         1rnh1vufp8QxFYrUQkVIShomXUU240fDFR75X41ZJZXIwMhIWhlZm3VxULE1/FH8iStX
         YXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qQewv7LjHW/0bryObaLrIvLfOOWJhF9J872HU/5aCzI=;
        b=qUqQLlkkZt6Ce6Na923ecAW8BkN2fJzG+a54sNZwyROmXXcenJOxEQf2YOJ+Ow/OCh
         RtO71rTpuGTXQW0QQQsXKoZAyQ4g0pXuVMm1FcoU+Tvw/aYzRD7GFaCsKqWLCassjhyo
         YwiHXJhmv7FGMhFOOmGaikzRIKGUjO4y7Jr0tKr0yj6/KRvGdAhWGNu3uwXdyk2CGtZo
         TNmTfJ6KTwc8HrK3yLRFhmheRJQlilhzhn+HdSE8ID7Gc2vGeZqaUASukY4Wivuf6ruh
         Bf6uhdB6lx9teEHWIKcUQlTa3N6h63lVAtaaL1f0NTAkEre3jkRW/uXm+gmdFSdSECG6
         NBmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TQe9Fjhh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20-v6si2587353qtr.180.2018.06.27.07.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 07:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TQe9Fjhh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYBcj-0006Og-E9
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 10:40:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBam-0004ZY-7v
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 10:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBai-0002qr-4L
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 10:38:44 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:45945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fYBah-0002qB-RZ; Wed, 27 Jun 2018 10:38:40 -0400
Received: by mail-pf0-x242.google.com with SMTP id a22-v6so1059926pfo.12;
	Wed, 27 Jun 2018 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qQewv7LjHW/0bryObaLrIvLfOOWJhF9J872HU/5aCzI=;
	b=TQe9FjhhheYFJ8xyINqHI6Dqu5R1zw65E6SORpVVnP6lrXy0AmmqbU4m9ulcq8z3jL
	VncaMLgLhBIUdrj5EPrXONiqB5rlyBf9fjg2NxewoVJGRIxKFjYi0FtRxva+fZaoXvvu
	gSFHBjMeKBGnZKC9PfnQoXrFYccg6g6xjnfVF79PKKLi7a+E9qe0OyquElVY13+cl+bB
	/3aVAQ4S8h8lLJY4YyX/QORl5dwvNPUFTqqDfsWLle1SnEu/2R1SAITBQZJ5hMdRHWId
	Sxctdsn/budvIRQLC0PHy9oRoigKvnIVrceJZYNSg7OsRj1wHFZO7naBfObkMr0KapMv
	7vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=qQewv7LjHW/0bryObaLrIvLfOOWJhF9J872HU/5aCzI=;
	b=ETSAyKYc1lvDnTclLL2ANv+jS7KDacTW4s3YJ5Pim/NEMpFbD8k5eBclZGyi2r7HMy
	f4/s5pFmp5HaJjZyFz+QvNEW5jbc8R8++AoWb4ZfrxhMpD1x6y21dttvppIGgl846v6Z
	YEL8kj8A71VUMfebbIcYTqQSXZ26ExuYL47GBA6uqLicyxJ4jOU95iETe+L9jxtFGQx9
	FpkFyD77MjKdnLoQzWKPiIrDB2IirsWlQlnYwGaOoCrLCGdgtp5zHN89m366Xpg8NTAN
	Oe5AgUJblqh0UpnEzB0CRfCSGMuRJ9SIvPpJ2grC0tih7pnhm0O/oEzFw6wYEYCkNuze
	AeDw==
X-Gm-Message-State: APt69E0nATWQOXq+y9pdFFSwxZjnc4D+3udbwS1ns6IOCy+tm9C5hMey
	dngg+qzjmwHe5DceX/J7ey0=
X-Received: by 2002:a62:152:: with SMTP id 79-v6mr3191418pfb.74.1530110318542; 
	Wed, 27 Jun 2018 07:38:38 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm11093779pgt.46.2018.06.27.07.38.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jun 2018 07:38:37 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Jun 2018 00:08:30 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 00:08:13 +0930
Message-Id: <20180627143815.1829-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627143815.1829-1-joel@jms.id.au>
References: <20180627143815.1829-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v2 1/3] arm: Add Nordic Semiconductor nRF51 SoC
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jJ28rkIVfzs/

The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
plus other common ARM SoC peripherals.

 http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf

This defines a basic model of the CPU and memory, with no peripherals
implemented at this stage.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
  put memory as struct fileds in state structure
  pass OBJECT(s) as owner, not NULL
  Add missing addresses for ficr
  Fix flash and sram sizes for microbit
  Embed cpu object in state object an initalise it without use of armv7m_init
  Link to datasheet
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/nrf51_soc.c              | 116 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  41 +++++++++++
 4 files changed, 159 insertions(+)
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 834d45cfaf95..ea63dd2885ed 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -101,6 +101,7 @@ CONFIG_STM32F2XX_SYSCFG=y
 CONFIG_STM32F2XX_ADC=y
 CONFIG_STM32F2XX_SPI=y
 CONFIG_STM32F205_SOC=y
+CONFIG_NRF51_SOC=y
 
 CONFIG_CMSDK_APB_TIMER=y
 CONFIG_CMSDK_APB_UART=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index d51fcecaf242..68be73f1c3ff 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -36,3 +36,4 @@ obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
 obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
new file mode 100644
index 000000000000..f4b04642d656
--- /dev/null
+++ b/hw/arm/nrf51_soc.c
@@ -0,0 +1,116 @@
+/*
+ * Nordic Semiconductor nRF51 SoC
+ * http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.1.pdf
+ *
+ * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/arm/arm.h"
+#include "hw/sysbus.h"
+#include "hw/boards.h"
+#include "hw/devices.h"
+#include "hw/misc/unimp.h"
+#include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+#include "cpu.h"
+
+#include "hw/arm/nrf51_soc.h"
+
+#define IOMEM_BASE      0x40000000
+#define IOMEM_SIZE      0x20000000
+
+#define FICR_BASE       0x10000000
+#define FICR_SIZE       0x000000fc
+
+/* TODO: Flash size should be defined by the board. Microbit uses 256KB */
+#define FLASH_BASE      0x00000000
+#define FLASH_SIZE      (256 * 1024)
+
+/* TODO: Flash size should be defined by the board. Microbit uses 16KB */
+#define SRAM_BASE       0x20000000
+#define SRAM_SIZE       (16 * 1024)
+
+static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
+{
+    NRF51State *s = NRF51_SOC(dev_soc);
+    Error *err = NULL;
+
+    if (!s->board_memory) {
+        error_setg(errp, "memory property was not set");
+        return;
+    }
+
+    object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "memory",
+            &err);
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+
+    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
+
+    memory_region_init_ram(&s->flash, OBJECT(s), "nrf51.flash", FLASH_SIZE, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_set_readonly(&s->flash, true);
+    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
+
+    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", SRAM_SIZE, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
+
+    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
+    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
+    create_unimplemented_device("nrf51_soc.private", 0xF0000000, 0x10000000);
+}
+
+static void nrf51_soc_init(Object *obj)
+{
+    NRF51State *s = NRF51_SOC(obj);
+
+    memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
+
+    /* TODO: implement a cortex m0 and update this */
+    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARMV7M);
+    object_property_add_child(OBJECT(s), "armv7m", OBJECT(&s->cpu), &error_abort);
+    qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
+    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
+    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 96);
+}
+
+static Property nrf51_soc_properties[] = {
+    DEFINE_PROP_LINK("memory", NRF51State, board_memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void nrf51_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = nrf51_soc_realize;
+    dc->props = nrf51_soc_properties;
+}
+
+static const TypeInfo nrf51_soc_info = {
+    .name          = TYPE_NRF51_SOC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NRF51State),
+    .instance_init = nrf51_soc_init,
+    .class_init    = nrf51_soc_class_init,
+};
+
+static void nrf51_soc_types(void)
+{
+    type_register_static(&nrf51_soc_info);
+}
+type_init(nrf51_soc_types)
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
new file mode 100644
index 000000000000..7166b8ea7fbe
--- /dev/null
+++ b/include/hw/arm/nrf51_soc.h
@@ -0,0 +1,41 @@
+/*
+ * Nordic Semiconductor nRF51  SoC
+ *
+ * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef NRF51_SOC_H
+#define NRF51_SOC_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/arm/armv7m.h"
+
+#define TYPE_NRF51_SOC "nrf51-soc"
+#define NRF51_SOC(obj) \
+    OBJECT_CHECK(NRF51State, (obj), TYPE_NRF51_SOC)
+
+typedef struct NRF51State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    char *kernel_filename;
+
+    ARMv7MState cpu;
+
+    MemoryRegion iomem;
+    MemoryRegion sram;
+    MemoryRegion flash;
+
+    MemoryRegion *board_memory;
+
+    MemoryRegion container;
+
+} NRF51State;
+
+#endif
+
-- 
2.17.1

