Received: by 10.223.161.27 with SMTP id o27csp789173wro;
        Thu, 26 Oct 2017 07:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R4JVhJkeTpDlc+ZLmp8lo9NQMPrIiADPN0kOiWPjqmM3xTzDDMYzPgtOJyOfcReUHzM/NP
X-Received: by 10.13.242.6 with SMTP id b6mr16664014ywf.6.1509029223152;
        Thu, 26 Oct 2017 07:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509029223; cv=none;
        d=google.com; s=arc-20160816;
        b=yuvX+nl5nPt9Tufq4j5somkiZXRoLNtOroeteYtULGvQOMcaBjyDE718eciwZmmS7q
         WLPHV3mJ88pAwaMee3Mkpqv0zZUSazippZc0hdnM8HaTQbcrw5kNss4xCaqZwJI1skhb
         UiWxoJ35igUn/Mpdt6NsEmwq0BGPBI2fZyAyrDNZFhsSmDRIJd/OaOHXTJROuftsVGGT
         hOE30T01ItJmH8zUdOUpnmesS9ADkYBppm50mlbX7/h4YQBh9GONTDwn18D1MeAhYASi
         c/gYBmlyaXdlZglIYWk6heU4rvqvp4RLLFWSxobU6Srd2bptQEX44+ZrfD/TMrrrNOX4
         3HoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DUPaMI1f9YK8ksDahTVrIhkMJMSBOfpv7KoWuSSWkDM=;
        b=o/p8Fa0LeYQyQ7KiLX59bb5eNubHt0WCyl/qBu/PiO4sMdCsYvbmOY5NHfbVXFbtY2
         xlSibbUXKOO8CQHp52iH4x01geHiBIKXpiGDBwn5QDaFwDzz/PRLpQ+NH5wf/6iaalHc
         AulCA8uRJsX6nnvKDueB9cotTT8r+2zXL1MTwd4BlpcBoxiJ/a6yN/ITlY9T7wFz1KuC
         Gad4U09dsor977QHhaVvrrAa26IxLbxF+FqeWeq9fuVN1+0ZMjFnehe/dPzR0VMUpEtY
         Nu/r/1PxtstoKlNcUyA+fIVM9PlmLpV81pLmpwTQ39YxW4o04r666sIiktYuRBTCc29M
         miUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=morFZNJH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z142si851174ywg.253.2017.10.26.07.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 07:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=morFZNJH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7jR0-0005JJ-Jh
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 10:47:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIy-0007JE-LI
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIx-0007ke-8n
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:44 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:51806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e7jIx-0007kB-4q; Thu, 26 Oct 2017 10:38:43 -0400
Received: by mail-qt0-x242.google.com with SMTP id h4so4536890qtk.8;
	Thu, 26 Oct 2017 07:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DUPaMI1f9YK8ksDahTVrIhkMJMSBOfpv7KoWuSSWkDM=;
	b=morFZNJHTVgD/MFCET3j1JY+9XgHDXCMVI5CG506WISOEz3104Ip8QJ32CLk5WcWki
	B0br4dNJjmdP6lY5b4Y0Dxuw29IKWWw9m7vGkcyEUBm19IYrqRf7R7A9daG8KoosaHhu
	sNhdoEu/epKvMQl02DPdwTklOFHJr9+n5XkrBEEdNA3bAiAqFxhr9GC8Tb37c5lro8hH
	poNTwM1pJyr0gsvUW1/V3qPsFDW6V/2+oAWcoEtz908l1dN4HcWDI6BI+C5KxCKE0ATd
	9OLg1vqVbA3bVFRzjc+iY1Mbl9/7+z8dvtQhHwDAXCSc+dbW4q0kyAG50mtQvf1frnHW
	48ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DUPaMI1f9YK8ksDahTVrIhkMJMSBOfpv7KoWuSSWkDM=;
	b=SPkcbYGKv9Rmk4I/HE/PyvaFvYzQ0OogF5AXXO6Dc81dKZI48uV4ZTI4nUO9s0lc4P
	ucBL54WL3VQ4YfZLCKbF4Pkgku8oy9cgdVdnXPeGHVs56qxsVy3V6jUJOaeOb2rmE7j+
	iol83yGu0jT1C+Oft17N6vRvp+CL03DUEAKkUkUUg6uz6xmAnXDirPx1blEdPjcexqld
	dERcow0d4vH1L3kIZ4+U90Wdxoio9asp2NNibC3qbBuSl6lJ9d/KieNauOuDB1Q9hcQm
	Rhf4QEHgv1It5GAFDwcZU9YAFn/yniiO4Aj3souUEr6zSH0LNBUIITXpVIZElHf36tlN
	ozfg==
X-Gm-Message-State: AMCzsaXFw1CBfMbGhqWhGdMZzuEWBdgzzhbFUQj3c0h2a0VIXKdHJEJ0
	vRqWeRMYrfhvocvoRF1zulh66x2D
X-Received: by 10.200.1.20 with SMTP id e20mr33407837qtg.243.1509028722341;
	Thu, 26 Oct 2017 07:38:42 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	l126sm3352746qkf.96.2017.10.26.07.38.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Oct 2017 07:38:41 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Thu, 26 Oct 2017 06:34:12 -0400
Message-Id: <1509014053-28134-6-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1509014053-28134-1-git-send-email-costa@advantech.ca>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v5 5/5]arm: mk64fn1m0
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vW/k+HjanTJc

From: Gabriel Augusto Costa <gabriel291075@gmail.com>

This Patch include mk64fn1m0.c that describe the kinetis k64 machine and
some peripherals.

Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
---
 hw/arm/mk64fn1m0.c | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 hw/arm/mk64fn1m0.c

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

