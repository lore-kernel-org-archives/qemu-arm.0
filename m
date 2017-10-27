Received: by 10.223.161.27 with SMTP id o27csp913302wro;
        Fri, 27 Oct 2017 09:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RAhaQg57Zaj+EboRu0cwG539CUu+ZTXG0uEuiSKrx+mlZhjkytatIA21UQu7++8Qh8g3o6
X-Received: by 10.37.35.195 with SMTP id j186mr685635ybj.517.1509121751762;
        Fri, 27 Oct 2017 09:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509121751; cv=none;
        d=google.com; s=arc-20160816;
        b=F+FrUW9pbCU80h3iqhyY9F6kFbo33HeEDaRDz08drP1ShHmoJpJfevS8N3d8KANI6E
         KTvD74/MJWJcPlwTcMlZpJb7cJ3b5we6KWIHgkOzs8+zF1hCvhYuayaSMsw0IyoXvfC+
         cfoWrVjdszbbT1DbF9U40TbKi7so86eqTCFim53U5JXPBdptGPAPaUn+1zxQvOkneuAq
         4jVQ9dFGrPwpFCuhpUqR4njigqJHio7Tkn1UdmdHjxnvw2WG83N6Zbao22G8sp/wxssK
         Ttu3nSM7PHeL8B33etfdKLaivRmNyVE2+rsFx6jtTYuKzgtAxKYax2mD++9wBHdRWn1o
         ZDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+7SH2ifWlLr9csUqFRJjPt4QyHZsjn7oRmU3JUtSp3w=;
        b=BPJp8e1o7u5ZflKeF/F9CS8k4Q/pe4IH2CLU2XurZKb0UxiypVjhnyqEpG+pjBF0Th
         SjoBGb28zjbEvrtNAeIpyu8tfbotJrbN18ItWtqiDoCZM4Sf4FYBvD7DamFcOrn9gOC6
         dbv6b+lh5GMgBaB2MU5lREYzc0DY6uUvwNXkbIt/bmM2MxUDOxgTPVx1L4K3gLjw5TiO
         UEvrozBEOJoFMDyrOS37BLNc7Zi4H6Oen5j/yP87TCTmW/GiBFRSd7+HEWw0H42RcMQK
         tjJf4QDRHcN09gsQ+eM0hrQu3Pkq9sJp5izMJFy9hSLshEq5nWaDVaI3r+Df5yBtG9hc
         3eMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=euaWnlEn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w12si1309065ywi.783.2017.10.27.09.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 09:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=euaWnlEn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e87VP-00072P-4J
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 12:29:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e87V9-0006zB-Rk
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 12:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e87V8-0003DR-II
	for qemu-arm@nongnu.org; Fri, 27 Oct 2017 12:28:55 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:56191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e87V3-00039t-JV; Fri, 27 Oct 2017 12:28:49 -0400
Received: by mail-qt0-x243.google.com with SMTP id v41so9069154qtv.12;
	Fri, 27 Oct 2017 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+7SH2ifWlLr9csUqFRJjPt4QyHZsjn7oRmU3JUtSp3w=;
	b=euaWnlEncEgUqVrvlL5hIOBdek8jegQHixCKCOkKdndMBiXTj4DLWuL+ZgmDcdebeW
	bOdKnnbFBmPPofh7KmSXGZJD8bbdX7weNv7ZtQwd+WICTGuw37FGfNYw57bJ8nUecKL5
	aVxCXMcUAN/gbKfrey1hybqNrHEnryowJKlarAqlzyPi3v+P8dwO7LTOomDuUzShIngP
	eUc0Rwk2ABNzMfX2RUPsUYOPbJl0+F1VEM51rvOnUWGHfvFubCw53pBlnSOgFgIeJmGK
	FMHL66oXRxcT0OrYfFgMEnzQIgSknpTOEt2BfV2RYBA1rcCy09T+ZTuskhxGhIGz++18
	rjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+7SH2ifWlLr9csUqFRJjPt4QyHZsjn7oRmU3JUtSp3w=;
	b=rCcDtEPYsrhYyN7v/oo1fiyjGyzb6gvDmYQuxE+Zjx+8npBXE68PkYz7bhxAZlyn2R
	06CijKzXSLt8SBSYCuLFUHiyFB0K2HAgu3vkFTDTdmH3eluCSCsPsQkVX+0CUZQc5ZGY
	mc6x9FnTsBXvs0lF5JDUISSP5VIeeztDlOaQas0uEdWBfxBlBGoNsVd2pCaprBJUzCOw
	HcqsqxKAn1Wzpnu8kYUB7GzVv1VY1YrcEZqvEfPyXMmEfrkerGsChuAeGjQ6F7GcL8oI
	ggDpZB6FR53F/Yu56+iWrk4UtDR7Oi8L7Bl2YaJREKSapMmy8EzkVrqg/xDwZoQL2DoJ
	YrNw==
X-Gm-Message-State: AMCzsaUCfBe/5ysVK0VxSX0plwSwvuUehKtGXeZtZk0GX0F0HuMj/d/c
	HzOIbhLwofHRkcCxZWRfHLW/Y5Wb
X-Received: by 10.237.59.198 with SMTP id s6mr1755146qte.281.1509121728667;
	Fri, 27 Oct 2017 09:28:48 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	t126sm5152568qke.36.2017.10.27.09.28.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Oct 2017 09:28:46 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Fri, 27 Oct 2017 08:24:15 -0400
Message-Id: <1509107055-21978-6-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1509107055-21978-1-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 5/5] arm: kinetis_mk64fn1m0
 machine
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7GyteeCz0ld+

This Patch include mk64fn1m0.c that describe the kinetis k64 machine and
some peripherals.
Also, include changes in Makefile.objs and arm-softmmu.mak to compile
this machine.

Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/mk64fn1m0.c              | 136 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 hw/arm/mk64fn1m0.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 5059d13..a835d4f 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -130,3 +130,4 @@ CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
+CONFIG_KINETIS_K64=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2794e08..874a38a 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
+obj-$(CONFIG_KINETIS_K64) += mk64fn1m0.o
diff --git a/hw/arm/mk64fn1m0.c b/hw/arm/mk64fn1m0.c
new file mode 100644
index 0000000..618791c
--- /dev/null
+++ b/hw/arm/mk64fn1m0.c
@@ -0,0 +1,136 @@
+/*
+ * Kinetis K64 MK64FN1M0 microcontroller emulation.
+ *
+ * Copyright (c) 2017 Advantech Wireless
+ * Written by Gabriel Costa <gabriel291075@gmail.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "hw/ssi/ssi.h"
+#include "hw/arm/arm.h"
+#include "hw/devices.h"
+#include "qemu/timer.h"
+#include "hw/i2c/i2c.h"
+#include "net/net.h"
+#include "hw/boards.h"
+#include "qemu/log.h"
+#include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
+#include "hw/char/pl011.h"
+#include "hw/misc/unimp.h"
+#include "cpu.h"
+#include "hw/char/kinetis_k64_uart.h"
+#include "hw/misc/kinetis_k64_system.h"
+#include "hw/misc/kinetis_k64_mcg.h"
+#include "hw/misc/kinetis_k64_pmux.h"
+
+#define FLASH_SIZE              (1024 * 1024)
+#define FLASH_BASE_ADDRESS      (0x00000000)
+#define SRAM_SIZE               (192 * 1024)
+#define SRAM_BASE_ADDRESS       (0x20000000)
+
+#define NUM_IRQ_LINES 85
+
+/* System controller.  */
+
+static void do_sys_reset(void *opaque, int n, int level)
+{
+    if (level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+/* Interruptions at pag.77 of K64P144M120F5RM.pdf */
+
+static void mk64fn1m0_init_mach(MachineState *ms, const char *kernel_filename)
+{
+    DeviceState *nvic;
+
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
+    MemoryRegion *flash = g_new(MemoryRegion, 1);
+
+    memory_region_init_ram(flash, NULL, "k64.flash", FLASH_SIZE, &error_fatal);
+    memory_region_set_readonly(flash, true);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
+    memory_region_init_ram(sram, NULL, "k64.sram", SRAM_SIZE, &error_fatal);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    nvic = armv7m_init(system_memory, FLASH_SIZE, NUM_IRQ_LINES,
+            ms->kernel_filename, ms->cpu_type);
+    qdev_connect_gpio_out_named(nvic, "SYSRESETREQ", 0,
+            qemu_allocate_irq(&do_sys_reset, NULL, 0));
+
+    sysbus_create_simple(TYPE_KINETIS_K64_SIM, 0x40048000, NULL);
+    sysbus_create_simple(TYPE_KINETIS_K64_MCG, 0x40064000, NULL);
+    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x40049000,
+            qdev_get_gpio_in(nvic, 59));
+    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004A000,
+            qdev_get_gpio_in(nvic, 60));
+    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004B000,
+            qdev_get_gpio_in(nvic, 61));
+    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004C000,
+            qdev_get_gpio_in(nvic, 62));
+    sysbus_create_simple(TYPE_KINETIS_K64_PMUX, 0x4004D000,
+            qdev_get_gpio_in(nvic, 63));
+    create_unimplemented_device("kinetis_k64_spi0",  0x4002C000, 0x1000);
+    create_unimplemented_device("kinetis_k64_spi1",  0x4002D000, 0x1000);
+    create_unimplemented_device("kinetis_k64_adc0",  0x4003B000, 0x1000);
+    create_unimplemented_device("kinetis_k64_dac",   0x4002F000, 0x1000);
+    create_unimplemented_device("kinetis_k64_i2c0",  0x40066000, 0x1000);
+    create_unimplemented_device("kinetis_k64_i2c1",  0x40067000, 0x1000);
+    kinetis_k64_uart_create(0x4006A000, qdev_get_gpio_in(nvic, 31),
+            serial_hds[0]);
+    create_unimplemented_device("kinetis_k64_uart1", 0x4006B000, 0x1000);
+    create_unimplemented_device("kinetis_k64_uart2", 0x4006C000, 0x1000);
+    create_unimplemented_device("kinetis_k64_uart3", 0x4006D000, 0x1000);
+    create_unimplemented_device("kinetis_k64_spi2",  0x400AC000, 0x1000);
+    create_unimplemented_device("kinetis_k64_adc1",  0x400BB000, 0x1000);
+    create_unimplemented_device("kinetis_k64_i2c2",  0x400E6000, 0x1000);
+    create_unimplemented_device("kinetis_k64_uart4", 0x400EA000, 0x1000);
+    create_unimplemented_device("kinetis_k64_uart5", 0x400EB000, 0x1000);
+    create_unimplemented_device("peripheral_brdg_0", 0x40000000, 0x1000);
+    create_unimplemented_device("Crossbar_Switch",   0x40004000, 0x1000);
+    create_unimplemented_device("DMA_Controller",    0x40008000, 0x1000);
+    create_unimplemented_device("DMA_Controller_t",  0x40009000, 0x1000);
+    create_unimplemented_device("FlexBus",           0x4000C000, 0x1000);
+    create_unimplemented_device("MPU",               0x4000D000, 0x1000);
+    create_unimplemented_device("Flash_mem_ctrl",    0x4001F000, 0x1000);
+    create_unimplemented_device("Flash_mem",         0x40020000, 0x1000);
+    create_unimplemented_device("DMA_ch_multiplx",   0x40021000, 0x1000);
+}
+
+static void mk64fn1m0_init(MachineState *machine)
+{
+    const char *kernel_filename = machine->kernel_filename;
+    mk64fn1m0_init_mach(machine, kernel_filename);
+}
+
+static void mk64fn1m0_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Kinetis K64 MCU (Cortex-M4)";
+    mc->init = mk64fn1m0_init;
+    mc->ignore_memory_transaction_failures = true;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mc->max_cpus = 1;
+}
+
+static const TypeInfo mk64_type = {
+    .name = MACHINE_TYPE_NAME("mk64fn1m0"),
+    .parent = TYPE_MACHINE,
+    .class_init = mk64fn1m0_class_init,
+};
+
+static void mk64fn1m0_machine_init(void)
+{
+    type_register_static(&mk64_type);
+}
+
+type_init(mk64fn1m0_machine_init)
-- 
2.1.4

