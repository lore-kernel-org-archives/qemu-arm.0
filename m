Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1908731wru;
        Thu, 16 Aug 2018 07:18:19 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw2a80CCZZarpjQ+lDqCILa5GHks4FCWLucQdAhidhJ6AzbsvP6rfZJDowChYw9wgbbEMOg
X-Received: by 2002:ac8:2ddd:: with SMTP id q29-v6mr29062992qta.3.1534429099023;
        Thu, 16 Aug 2018 07:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429099; cv=none;
        d=google.com; s=arc-20160816;
        b=sOmKEW3gL3mhKe/iey1cc6+7AYrnYQqPDVkxKk0+gx8z3XTU+Rbplde7t8TimfkvZS
         Mp/wRHpWDFNhOiKupC1lRyrUE/v9dbkf+fgbWu2wEr2t3HDjE91mlYkl8wmoPpRBK1UB
         9l9JrnoNYz54XVtCdKaf34lyYt9HzfeZyH4rS55pDUOX6zqhVxKb60Nk+9GcnlPy3l2B
         vsYzTV84kwMsnLy7OER/cIDvX/ypBqFYfN8Laa4gbDPAJY57yWGfIvWysnzklQuGGSj0
         RmnP8KLGI4/SPrkzH3A+hB5aZLzWQ1IIFfyiGinSxLXhBLuE1THm8sj1WWoHyQDSMKc5
         z3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HD9livxLG0d3HiRBZ02LtrmS9pKMvLvMeGEh1xLS3aw=;
        b=LrYG4+lIR9kp8RLy0zOT9faoxVleZvPt4bIGm3t1hMROnrvkLi68lJXM0/Nci6zQw5
         XIc8V7zp1li/R/XVPHgjFvShAhPDIiklRe8/4G1UkZIyAC03o/NgSNMVfE5UFNFLtwGR
         DmBBCnT2VUypxPhtIJ+lNteF0N2uN/ktoH9OYBCAtSQjVwNZZTHpawtVpdsf3fEGjTxp
         I2OIauntrOdsSXtygxVY82lq+Rky4mvIiqaia9iyOTpyUUMtiHtQ9hRuc0SgFDAWlujt
         zziniYPHppRgAJlSDnh6Wxvig6ANCPQ5tMVfI8rYBGvAy+1sSRQEgwxxh0+tE0QaRFR5
         vy4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h6JltKWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185-v6si9456390qkf.234.2018.08.16.07.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h6JltKWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJ6Q-0001gc-Gs
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:18:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ20-0006f9-GL
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:13:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ1x-0004Tj-Q0
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:13:43 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fqJ1u-0004Qa-6w; Thu, 16 Aug 2018 10:13:38 -0400
Received: by mail-pf1-x442.google.com with SMTP id j8-v6so2089613pff.6;
	Thu, 16 Aug 2018 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HD9livxLG0d3HiRBZ02LtrmS9pKMvLvMeGEh1xLS3aw=;
	b=h6JltKWH5kDTmmCjEou04HUYLweMqhVqL9e3FxYTYycgWrwKL8s5ZJQ/yKvfGpsHsD
	o8TbloukfayjKoW+TkVIJXfWP0Q3ni9Onmrlb2gB6cJAsA+MwWrDr6rnk3AHuY7Qr5Ek
	lDDfZ6vC0dIhxLWFBfSO0U5oFcCuY2Pd/nL/+DHEtboYVrCMAOkNCo8vke+pYAYvIcIN
	VWOO7QEYGYyb5X8k15zN06iM7rVhUcWZkXE1GPI43FOnOGNAV3tcCGiQyHU6DsJ7DHYj
	vcdsBkVmgj8Edyer4kYKBbwLN1hrO6Ffj3SQk1wwtAqk7svjLli965evVnFjcRXGLwqs
	1Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=HD9livxLG0d3HiRBZ02LtrmS9pKMvLvMeGEh1xLS3aw=;
	b=R9TD1Mb1vhz6eBdj+KIrgFu72sDtZjaNymQBdrzsX4YiISdFdkpXzdGbJP150NfaPn
	gqH0tBug/yIcvsiAB77oI598i/9cxbEwKjG2j8lgEnuMWJs/d5t/i+/2L4CMABHRnloM
	AeDp1FVJvPsBjSTyZ5Fb/sz4gCvS0oL4hEmeguXpF4LE1vLmvthFjCZI9yyMbBNVJgFQ
	tqW46TW3XnZK1tyxZd/jrCdkIxy7yA/Eaq/0kRsPwfg1GbzWAoppUhAy+bemErPIWnKA
	3Ou+Er1tvE4E7aT3EW4G21QUBztC7CA+XuHBScAewg9K2fcPKjMB1GiJrK3tMU5UB0Eq
	L0gQ==
X-Gm-Message-State: AOUpUlHYVdvkLK3qtLx5u/wHkwylHaXRQ+tnlLyBwGkfz/FI0ONDSZoU
	We5NWCIICOd0uSSnaataEG8=
X-Received: by 2002:a63:dd49:: with SMTP id
	g9-v6mr28992501pgj.356.1534428816982; 
	Thu, 16 Aug 2018 07:13:36 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm24614163pgp.3.2018.08.16.07.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 07:13:36 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 16 Aug 2018 23:43:28 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 23:43:02 +0930
Message-Id: <20180816141303.20518-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816141303.20518-1-joel@jms.id.au>
References: <20180816141303.20518-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v5 2/3] arm: Add Nordic Semiconductor nRF51 SoC
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
X-TUID: dlp81ZKi1/D4

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
v5:
 move back to armv7m calls, as v4 of Stefan's patch removed the
 m_profile changes
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  42 +++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 311584fd74eb..2ff27c2e1d5a 100644
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
index 000000000000..9f9649c7807d
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
+    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARMV7M);
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
index 000000000000..e380ec26b8eb
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

