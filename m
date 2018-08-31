Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1082210wrd;
        Fri, 31 Aug 2018 15:10:18 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYG6TQukRhOc6SGcSZ4LE8R+dq1UihbarPDz4Wd0B+XRDmYaprowcgtjVEB5UjLPu2EOeT4
X-Received: by 2002:ac8:2e87:: with SMTP id h7-v6mr17641208qta.135.1535753418710;
        Fri, 31 Aug 2018 15:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535753418; cv=none;
        d=google.com; s=arc-20160816;
        b=nkydk2HgnfRCZ1zbWopS9gAmQgc9KEUou4xTzkQOMlD30jfy067mU3RA/Uim8SjUjc
         pANTMA07F4+ln1ey0DD1kuyvMpi9AE8sa10+NQnSPw+1JhlCDclU4PJCnNeVFc6SEr0W
         AUaB1+hPuuwXhKNxL/0SrESxYS8Radys22QSaW15zgi7OrxdQRTS8a43L6k1gHymE/be
         fopZCSOOT3dQpaCb8L2uyl6vXMrTMY7mHlKv/sdBrUl0AoWQLApz3LvUY9qSYOYlYaU7
         5wBxuAwwHnQpJ/H7oS7IzPXzvT7aCyGzkX77Zogw34VZnvXDy2y80B1p55G7HfCNWHt1
         lYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vqBx8fhtdob4tL4BQMb9LSVcapgn+tNBIHmgUnd5aBA=;
        b=NvJAkILRZanWvj4Q7WmE89raQ8QGXxXksREzQulnU8lUPfi1AscnpD8nzbLb6YBuuL
         N5lYW2we05PaUmMPeFcpSt3l2hh0MqOsjVVXTdsu658cpIuYQ9XpJlayOVBcCcUoHVZm
         yIopxGTz70E+swuYLXP8hpVavAqPI2SFNiK9KwZTdY3Q9d7s4R/B17kpCYr4sSWHsL46
         9PlgTYHHl4/9FCfAY/8vx2QeuQ9LfUzUV6dY74d/FGw0eajEhY9o1SiD7DXx33wxGzq6
         letcmfK2cGJ1FithQi0rLHy6NTSgxkHtvb9DHISWW9OtMdWjfxN3O0xSsN2Os3mJ6roy
         m0Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="rpPgTc1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k55-v6si844340qta.193.2018.08.31.15.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 15:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="rpPgTc1/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvrcQ-0004vF-5f
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 18:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbu-0004hY-Fm
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbr-0004up-MS
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:09:46 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fvrbh-0004jx-26; Fri, 31 Aug 2018 18:09:33 -0400
Received: by mail-pl1-x641.google.com with SMTP id j8-v6so6020235pll.12;
	Fri, 31 Aug 2018 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vqBx8fhtdob4tL4BQMb9LSVcapgn+tNBIHmgUnd5aBA=;
	b=rpPgTc1/Hza0fLWPQTXpEVsqjRfWTDCsYGNnp8jaJ761XgZckwJedJzlr8Gbs4SHlF
	Fdk1l3yPvzaaAqD96Ka4QO8hChl5QKp+23fUtc+ZODFLgoMMfUhgdtLKaSUoh172sM8W
	NNgvUdHKMiEf8v4xxeAWJDYXbWEkWopjZPN41hCYBrRkK/ZGNp+kACih1WZSjzN3OK+o
	Hf+JPU+53gOrhALrRcpUl1gftgoMB8J2ct+ObYI9H1argcePGHrsbUR68WfGZRs5ZwA7
	cmjf1AYIQxeER3PgulhRr1xBXVlGDrusEGZecSmkW/f6x1ETSx4dWKgnCjMIBy/5wjqj
	ohXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=vqBx8fhtdob4tL4BQMb9LSVcapgn+tNBIHmgUnd5aBA=;
	b=S38P3/Ww47XZ0IVZk1C2YW+2/VkClBlf6plmFP/0Lwu6sgu2Xmw4rQ4UsfNERbV2u0
	yh81+Yg6xsAmUgxORIAkQPl/8DQP3KIcAuQq1nzWSSh2g/r1UALESC3nKCkkFlfI/yTR
	IWRKulOBWwHCu17QErIxGz2tI0KTiDFinFGdJ73rP32H6wpQ0w7QN0kjzCnsbkOUQ5kx
	f0LJ3Bf8q3UvHUCk9wDRBNF5ohu3QVpNcrcH91TPdcPUwwb9rwSVKsZ3Qb38KtrfJPuN
	lSBcMcj7CH+4XggPMSGogIws7b4cjNuWYryVbCDLJqdVCi2IyZqboDr4e2fsgeTgxG0p
	EXjg==
X-Gm-Message-State: APzg51BwSOLUvvIXl1Ktk8pyGL3ktY40YqpTLP9d0QyqneMcG+BxhHz6
	5R5tD90P9AdQRjtAJ9RNENs=
X-Received: by 2002:a17:902:3a5:: with SMTP id
	d34-v6mr17403676pld.98.1535753372032; 
	Fri, 31 Aug 2018 15:09:32 -0700 (PDT)
Received: from aurora.jms.id.au ([72.28.92.217])
	by smtp.gmail.com with ESMTPSA id
	a2-v6sm12794119pgc.68.2018.08.31.15.09.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 Aug 2018 15:09:31 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 31 Aug 2018 15:09:29 -0700
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Aug 2018 15:09:19 -0700
Message-Id: <20180831220920.27113-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831220920.27113-1-joel@jms.id.au>
References: <20180831220920.27113-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v6 2/3] arm: Add Nordic Semiconductor nRF51 SoC
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Dr92i11Ly4M

The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
plus other common ARM SoC peripherals.

 http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf

This defines a basic model of the CPU and memory, with no peripherals
implemented at this stage.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
  - put memory as struct fileds in state structure
  - pass OBJECT(s) as owner, not NULL
  - Add missing addresses for ficr
  - Fix flash and sram sizes for microbit
  - Embed cpu object in state object an initalise it without use of armv7m_init
  - Link to datasheet
v3:
  - rebase nrf51 on m0 changes
  - remove unused kernel_filename
  - clarify flash and sram size
  - make flash and sram size properties of the soc state
v4:
  - set the number of interrupts to 32
v5:
 - move back to armv7m calls, as v4 of Stefan's patch removed the
 m_profile changes
v6:
 - Split comment open and closing to it's own line
 - Check err after every call
 - Change flash _init_ram + _set_readonly to _init_rom
 - Add defines for 'private' region
 - Use sysbus_init_child_obj instead of _initalise, _property_add_child,
 _set_parent_bus
 - remove osdep.h include from header
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/nrf51_soc.c              | 130 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  41 ++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 0483d548d96a..2420491aacd4 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -101,6 +101,7 @@ CONFIG_STM32F2XX_SYSCFG=y
 CONFIG_STM32F2XX_ADC=y
 CONFIG_STM32F2XX_SPI=y
 CONFIG_STM32F205_SOC=y
+CONFIG_NRF51_SOC=y
 
 CONFIG_CMSDK_APB_TIMER=y
 CONFIG_CMSDK_APB_DUALTIMER=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2902f47b4c4c..ae4e20373b9e 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -37,3 +37,4 @@ obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
new file mode 100644
index 000000000000..874051b26853
--- /dev/null
+++ b/hw/arm/nrf51_soc.c
@@ -0,0 +1,130 @@
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
+#define FLASH_BASE      0x00000000
+#define SRAM_BASE       0x20000000
+
+#define PRIVATE_BASE    0xF0000000
+#define PRIVATE_SIZE    0x10000000
+
+/*
+ * The size and base is for the NRF51822 part. If other parts
+ * are supported in the future, add a sub-class of NRF51SoC for
+ * the specific variants
+ */
+#define NRF51822_FLASH_SIZE     (256 * 1024)
+#define NRF51822_SRAM_SIZE      (16 * 1024)
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
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
+
+    memory_region_init_rom(&s->flash, OBJECT(s), "nrf51.flash", s->flash_size,
+            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
+
+    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
+
+    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
+    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
+    create_unimplemented_device("nrf51_soc.private", PRIVATE_BASE, PRIVATE_SIZE);
+}
+
+static void nrf51_soc_init(Object *obj)
+{
+    NRF51State *s = NRF51_SOC(obj);
+
+    memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
+
+    sysbus_init_child_obj(OBJECT(s), "armv6m", OBJECT(&s->cpu), sizeof(s->cpu),
+                          TYPE_ARMV7M);
+    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type", ARM_CPU_TYPE_NAME("cortex-m0"));
+    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 32);
+}
+
+static Property nrf51_soc_properties[] = {
+    DEFINE_PROP_LINK("memory", NRF51State, board_memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("sram-size", NRF51State, sram_size, NRF51822_SRAM_SIZE),
+    DEFINE_PROP_UINT32("flash-size", NRF51State, flash_size, NRF51822_FLASH_SIZE),
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
index 000000000000..f4e092b554e0
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
+    ARMv7MState cpu;
+
+    MemoryRegion iomem;
+    MemoryRegion sram;
+    MemoryRegion flash;
+
+    uint32_t sram_size;
+    uint32_t flash_size;
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

