Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2821201wru;
        Thu, 2 Aug 2018 22:23:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpehJyHlXn3jaoRAby6CtEhpJh3uqDbkqCxZVPTQv4ht81ETEdCQ1afwjT5DO0BGOPH8rURw
X-Received: by 2002:ac8:3872:: with SMTP id r47-v6mr2347521qtb.69.1533273832968;
        Thu, 02 Aug 2018 22:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533273832; cv=none;
        d=google.com; s=arc-20160816;
        b=Mx5POBoCOEzC6j2tMR3mJoLUBt2ay686lUdwq9lQk7tpbNz+fIlev+4dy3GZKaYYxv
         g2sY96TJ+yqsmxK1nY2rHpxMiZ7XUISI7crcHRzIcvhD3MlObt7ox0V2A9GoH3L81A+c
         k6D6ZAQm3VJKT2nyveIw92g1Td07t5DWzbcdnWZVPu1bifw1jKGNUZIWCmrCvyZ9KWRr
         jWg2BhNL2RcN6jmGtXcVlb888t2ad2fxX3kl3sSsle9J86vmgXIYgwACU7hEMkFJ6BwI
         MoIBrwqGGrJhuI8azoXFEgtfXSQBg2dr3eAQEh7jqagYzz9biOdPdR46Muh5INIclkb/
         Uxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=th/eolquJgzA4DlWC5APMPqqPtdXm2JcWzD8RmtGkw0=;
        b=f31cilhd5/qKZBB5mgQYJZSm32mfEHprnww6UensfsL9QvqjDMbcLc31rUdrvnCXK6
         TNG3xk1K3GyBMjWOdzAhWPfvs3eLJfC380a4EL5dp8JGYG7bKqVHzTGM5W4HyEZ+Bwcq
         AN+aeCy6XVkGbDnIbbn3kl1OoqZhJrk0cbOkBTWwgxgg2dVFfYjuD7ooF/kZ9xP19Ga0
         cJu97RCIACqiRXlC2+GnsRUyNPuSE/VlkzlDuYf4KiQh5VRI5PtX5HTjOi68Hvr0e03L
         yEQlTSwEGoxVGgYdKk0WLGwS9nWvmxab08bzHHD9TFKq0R/lchAdwnf+O3ebAItCG89f
         3ygg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FVcU0+iZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si4428687qkh.211.2018.08.02.22.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 22:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FVcU0+iZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flSZ6-0002rz-CE
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 01:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXS-0001kx-MQ
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXP-0004tp-HH
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:22:10 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1flSXM-0004tF-CT; Fri, 03 Aug 2018 01:22:04 -0400
Received: by mail-pg1-x542.google.com with SMTP id z8-v6so2282792pgu.8;
	Thu, 02 Aug 2018 22:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=th/eolquJgzA4DlWC5APMPqqPtdXm2JcWzD8RmtGkw0=;
	b=FVcU0+iZqPTOqRp3NrpGNkVx3Zb3Kmv+xSOtUYrpiY8tB1BebLdp5DShz4sgLF2JwB
	jw03sFlb0DNEsLiZjUVm8aExBks8OilmitTYLMbD6jGWcq2RT8b/1qcvROrtNlmy2T/2
	dmLlE+EzLV8tDDjtLEGbVuR77jwUm2duAU5BMMFJ0wNpsBkN+SLGwNdVLoVUBotQvnd8
	NWGu/mtYe1/nzHVVi6r+YUFN8/5QNWqGiKNw7UM+E+q8csH3Km2e7NYTnLrArjRk5fRo
	Sxu3egG5H3jOXOqZo8Mga93YQ5X3xtMB8xDwxga9T05At8qZRdlcGpIDQ/9s67f+YZQS
	F6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=th/eolquJgzA4DlWC5APMPqqPtdXm2JcWzD8RmtGkw0=;
	b=R1p1T3uYMVlJFwXnt0fNAIddcNcIrbc/Fju7NI+YcZUPWpblwvlj5JvczEYNrH74im
	mHP0M4X1H7/sPQk1/TUcS+Db2vF9i7OAHcVs6gslFFXER6PW/FqmBR5oIzLV1Nu08Cx/
	RNuebzF5j//j9BgRyjZ0j1k0e1laDt31XkqFIBMpy+SUrmUPIrIiRql4fekRaZIIK0SX
	L99r7YNOnphYUUmynxf8WHqeUYjwkKWvvitNroKPi4Rcc075sFsVohCJqr1Uo8XUu0l5
	dkraKvkgDDWsGU+I87QDWFMMhGliB/qSo6NF2HwevEZIP/Re1j9RBWQiRy5pgQyJX1Zt
	tMVw==
X-Gm-Message-State: AOUpUlH64CQ/ToRNtuu7AZXPx7zU6uvXhNRiACNQTrTykubVfNh9Io8G
	JqIC5sjFWC+oXPgWDjZS+TA=
X-Received: by 2002:a63:d946:: with SMTP id e6-v6mr2280774pgj.24.1533273723271;
	Thu, 02 Aug 2018 22:22:03 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	y4-v6sm4900520pfm.137.2018.08.02.22.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 22:22:02 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 03 Aug 2018 14:51:56 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  3 Aug 2018 14:51:36 +0930
Message-Id: <20180803052137.10602-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803052137.10602-1-joel@jms.id.au>
References: <20180803052137.10602-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v4 2/3] arm: Add Nordic Semiconductor nRF51 SoC
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
X-TUID: 1fW5bny+TEuy

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
v3:
  rebase nrf51 on m0 changes
  remove unused kernel_filename
  clarify flash and sram size
  make flash and sram size properties of the soc state
v4:
  set the number of interrupts to 32
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  42 +++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index e704cb6e34d7..3432721d7d08 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -102,6 +102,7 @@ CONFIG_STM32F2XX_SYSCFG=y
 CONFIG_STM32F2XX_ADC=y
 CONFIG_STM32F2XX_SPI=y
 CONFIG_STM32F205_SOC=y
+CONFIG_NRF51_SOC=y
 
 CONFIG_CMSDK_APB_TIMER=y
 CONFIG_CMSDK_APB_UART=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index b1e4f8f006aa..e31875ec69bc 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -36,3 +36,4 @@ obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
 obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
new file mode 100644
index 000000000000..27b57e64735c
--- /dev/null
+++ b/hw/arm/nrf51_soc.c
@@ -0,0 +1,119 @@
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
+/* The size and base is for the NRF51822 part. If other parts
+ * are supported in the future, add a sub-class of NRF51SoC for
+ * the specific variants */
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
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+
+    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
+
+    memory_region_init_ram(&s->flash, OBJECT(s), "nrf51.flash", s->flash_size,
+            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_set_readonly(&s->flash, true);
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
+    create_unimplemented_device("nrf51_soc.private", 0xF0000000, 0x10000000);
+}
+
+static void nrf51_soc_init(Object *obj)
+{
+    NRF51State *s = NRF51_SOC(obj);
+
+    memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
+
+    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARM_M_PROFILE);
+    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu), &error_abort);
+    qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
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
index 000000000000..838bccd815df
--- /dev/null
+++ b/include/hw/arm/nrf51_soc.h
@@ -0,0 +1,42 @@
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
+#include "hw/arm/arm-m-profile.h"
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
+    ARMMProfileState cpu;
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

