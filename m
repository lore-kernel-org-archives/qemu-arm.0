Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1359897wru;
        Wed, 25 Jul 2018 19:37:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcXxa1DggWdx9YD/q570YOsRfYDcE28geLKm6iCJ8qyuml2Th0t4wlDMauFjRYBSUeIuXIU
X-Received: by 2002:ac8:3111:: with SMTP id g17-v6mr88840qtb.312.1532572666118;
        Wed, 25 Jul 2018 19:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532572666; cv=none;
        d=google.com; s=arc-20160816;
        b=Yd49+35DCb4UN6EjxYEYyRl32Ods4opb6Z+ZpyhL9tbTjKhyHpZryhY2DUIHFuiPOv
         lO+1H7KcMQmHU0bsxHTnn/Jv+GrhzmTJ3J0uYRaYRCT5JbliWTnu9tCTnzyl7UNc4/iQ
         GrHPWP34jBitm1KR76fCM0eOESoq664czbvlXFOS/yAib8OqogmL5gxJDDmdP3enCkVC
         kTqflRKTOK/AEWkIi4cxZfC7q/uYS38/NVJt5vMLECY8uF+YcCggfyZc2sV5cZ42tGNi
         3FrltQAy27GTtui8H37Er+WvbkHnj4yOmFKVUUb5OOIHaPExZnWqxkJSbhM1OzNmYvG8
         w6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=2i1+Cu/59CCCTmqjBSM6Ly+EMPHBZRYPxijqsvtLTrc=;
        b=o/kU/vF/YHAGi3GL4+k95jwOoalYPWK/nAoTnCTTwVFUpi0r20u/30/i2ugB6ixHUM
         Zny+TLyL0cV2FWkWhVlr+QFls2wLOo0+2Vksdyv19TsFmQETOnhCqrnC/kKdltF4Rodi
         AbMDLPb2e6LdoB7fLFa7arxZSfiy+2JGD+f3SSJTLh1GN0aY2FEg4Qj8Fud4NvgeJaMi
         crWhaSp3XFvisyFlz//0Bn3HFFo/VFpmgAdjgXLrJ7Ooi0iDsTMcWSJpXSnRZ/uPyNGQ
         30U8D57AHipM+PA1oeOJBP2U0CV7kIXt2F39HPFZAD+c2Vq1N74Wy2paQCe4sZbjxL6M
         iQXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LtuiPLSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3-v6si130434qtc.166.2018.07.25.19.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 19:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LtuiPLSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiW9x-0005sD-K0
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 22:37:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9j-0005na-OI
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 22:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9g-0003JY-Oz
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 22:37:31 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fiW9a-0003AF-8j; Wed, 25 Jul 2018 22:37:22 -0400
Received: by mail-pg1-x543.google.com with SMTP id z8-v6so147372pgu.8;
	Wed, 25 Jul 2018 19:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2i1+Cu/59CCCTmqjBSM6Ly+EMPHBZRYPxijqsvtLTrc=;
	b=LtuiPLSwtB9SN2K6Vb7mBK+JuAcf5VNFsCozyz8gBLuSL8z/91/iQ8NN1RpInsf55p
	y6GitdrmUyKfW2J6kbE8Y9ac6aVPYDuNno6da73YMaAHgA2P9kki4SLIhXuR5iI2jlm2
	TgoZ0V8b05EQ+Szow6Vw1WhSypQJYogYbmpxir3gUMqxqewWAUvtJqqYudSJ1X5AmFku
	smBzTPKNjN8i1sAAJDKnRSeZGQrrB+wnvJvAkLOGBhsvfmk0fk5FxXfv9tfoBCvyqdlw
	Bsiw26fA0WxaxF6sNxy1V2fcLYneD//shcfId44ql6sN0IacQQXhlC65ebQodYvkzbMO
	wXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=2i1+Cu/59CCCTmqjBSM6Ly+EMPHBZRYPxijqsvtLTrc=;
	b=U7Y0PigEG+axhPyGyDDaDZAXb4fJWtpQnVqHEgishluMFar13PPopbTy+snmb4g2gS
	PIbUTe0mA5EN7jQtWu5IhCJTquhoKrwgD3osXiMEj3faCovJjFQpZc25hi2w7bI2ywZw
	3aEDm7FvL0IKcraMciKBUTFUFF0L4FKniDQhNFwygZ0aSdncDZu9aef9pYAs3hiaFmC8
	gCmX40KoMVYpjCmJuh8j3vFuinIfgq7nQd7QLfe46RMYxrPYCpwJTy8x5L6QRp8DeDZK
	esNTxdHCazsE0Ml/jg709VxODAQkgS3HLFQsu0h0qxir2PtGYAhSwaRB5rbEIfyZxDdw
	fStQ==
X-Gm-Message-State: AOUpUlEp3BZy+5yMwEDqOJkMHRoex5w2dbuopD9IRN9obkN/iahwNcZy
	/6VjjYcAVD2O2pk1Pd5JcUc=
X-Received: by 2002:a62:990f:: with SMTP id
	d15-v6mr138055pfe.162.1532572640973; 
	Wed, 25 Jul 2018 19:37:20 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	v3-v6sm97677pgb.54.2018.07.25.19.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 19:37:19 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 26 Jul 2018 12:07:11 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 12:06:44 +0930
Message-Id: <20180726023645.13927-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180726023645.13927-1-joel@jms.id.au>
References: <20180726023645.13927-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v3 2/3] arm: Add Nordic Semiconductor nRF51 SoC
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
X-TUID: Kk0j76YyqXJg

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
index 000000000000..03fa1dfc7456
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
+    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 96);
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

