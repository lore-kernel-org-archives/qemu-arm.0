Received: by 10.28.4.212 with SMTP id 203csp1660798wme;
        Thu, 3 May 2018 02:06:27 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpUeM7Eo9Jq+xDXpuUy0bImSGMANgkeSlJ80PEANazJdKNLF3zjiYa1X3aZV1HR7mRWypZV
X-Received: by 10.55.17.166 with SMTP id 38mr17402995qkr.389.1525338387019;
        Thu, 03 May 2018 02:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525338387; cv=none;
        d=google.com; s=arc-20160816;
        b=uNnWN7Zh5aR2jqdrvBIJW/FXBWNgjoaGoogzpapNKtJgxSoihb0BqkzJCKeqyIoaTm
         /Zsyulf+Ricmau2lHHFWWRe2RoxLHKadZzVsmoMZSrPNzg6faeGTACkaaY96yz905bNp
         rcO3sep/7bzS1n0Y92uYEo/pbL2hpZuAg7k/MX+wLA8pUCghPbxBvStI/Pe4Xo74/fLv
         jcad+KlvtD8wS1Vi23JM4zBjO0kcYN3S1digeH/24VJzrrz6oUcRgWCrDq4XQvWQQYEG
         Y72gZ72z7SxOLJExvhZtEabSSaPTBGMU2oWSPfj/G5qqYm/yp078mNFnNkMnKj1k9Muk
         y4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QfcGtYvdh1LP6fHXF5WhI0n8ih4lHWIN75xGGwPHdjg=;
        b=c1SRQKTv/qDEH8svydIdriMCIKNknMkcrArDLw6XHhLE+diSnOBpitxkGHROlYvQxH
         Ucrgq1yLoOYa+v8CMoJKKQGgz+T9qa4ywLnDWUE8DbvV46L5BMpP1VpPhPZYOiznpqKQ
         2dzBMP4RBgecYx7vmSik559aPCuY5bnW19MagnEUoAmdUgu/MnBKXpkvpn+177wKiLJB
         E7CwC5L1Yioy6ShrxbQuQvA+TqXPdPwwGXREi9KeyVvsnI3CAIikOHZQmhp+uUWcy2jM
         h77puAtRDRdtHhPBdPoiq3eHcF1x9R7wQntIYPdmzG9KklZuk/9FcbSL5hNu6/nNtsOV
         i9wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LUJAE5mZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d49-v6si310625qvh.230.2018.05.03.02.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 02:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LUJAE5mZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEAC2-0002Dv-FE
	for alex.bennee@linaro.org; Thu, 03 May 2018 05:06:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fEABV-0002BY-7o
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fEABT-0008QJ-Q6
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:05:53 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:42330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fEABT-0008Q0-Ha; Thu, 03 May 2018 05:05:51 -0400
Received: by mail-pg0-x243.google.com with SMTP id p9-v6so9759591pgc.9;
	Thu, 03 May 2018 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QfcGtYvdh1LP6fHXF5WhI0n8ih4lHWIN75xGGwPHdjg=;
	b=LUJAE5mZ2rBO2mzV4nJLSJ2SQD9+bvZx28s4lovl/19SALkPJiL91zyWlIStEy5eNX
	ZSVSAzyvyz2JeptekHj2WPjk7mCbfr/kWdC71IYZ5KZPaTqW2nuR/kGdYiwXDNR8TLhb
	nHo8n/x7eKRiwsuXR3ruR8LpgAzez9Q48gdSvv7hMo/dzlRk9fft2BJjpPWHRkDozMCh
	PA4GASJLIeeOrcy1I3kW1jVv6ZPUwseaNQPhTyfvgcN+5k1vkOUaKyBeAyKv/dIe9PYk
	0KoHJ0nKxhrCBGW5KjwdmW5zSXNojNKyCJ27s0SYxzItoQCzakn+Ty1j2TL8h6LDtUuj
	IhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=QfcGtYvdh1LP6fHXF5WhI0n8ih4lHWIN75xGGwPHdjg=;
	b=rbbbkmfi/IIx/etOZQIs2uGyTAFbQ0OrD/WKsjvc8z8y3uQYeRhU9GngFVZQuYcyyY
	52ggblFKmYkVOH3SqSoS5JOlKv+ZouSFQxLdrQYcG9gT2jUTMSkC5Ud4x9f4fipscxL5
	XGbB7ORmLxp7JepFA7upCBB6AIE8b/huLgddCr29fz1860jl0pXwH4kJ0ZPcnhZcW89s
	nc4q7P209dKKUrLSL5uS25/FhAi+1ViY+74Oa0HCH6KFuAUs2iS0/JCOsTHzyalI7gaY
	HazQNn+PFntZ0EsD4eDxdgkLSq05Hz9j3PwjElSq9b7mOKbbzazcCjZHrFWxtGQO7ktV
	LybA==
X-Gm-Message-State: ALQs6tDemm0b5Ih/nhIPvNMOJGg+29/EDCvwDkOuRyKb8cA/YO9WYJdu
	j7z8AEITU/cfQNcOZF3GmHc=
X-Received: by 10.167.134.20 with SMTP id p20mr22348503pfn.159.1525338350504; 
	Thu, 03 May 2018 02:05:50 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	u4sm23749464pfh.120.2018.05.03.02.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 May 2018 02:05:49 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 03 May 2018 18:35:43 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  3 May 2018 18:35:31 +0930
Message-Id: <20180503090532.3113-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180503090532.3113-1-joel@jms.id.au>
References: <20180503090532.3113-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH 1/2] arm: Add Nordic Semiconductor nRF51 SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDbiDI1gViE4

The nRF51 is a Cortex-M0 microcontroller with an on-board radio module,
plus other common ARM SoC peripherals.

 http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf

This defines a basic model of the CPU and memory, with no peripherals
implemented at this stage.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/nrf51_soc.c              | 101 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  31 ++++++++++
 4 files changed, 134 insertions(+)
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index dd29e741c221..543ea965dae0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -99,6 +99,7 @@ CONFIG_STM32F2XX_SYSCFG=y
 CONFIG_STM32F2XX_ADC=y
 CONFIG_STM32F2XX_SPI=y
 CONFIG_STM32F205_SOC=y
+CONFIG_NRF51_SOC=y
 
 CONFIG_CMSDK_APB_TIMER=y
 CONFIG_CMSDK_APB_UART=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2885e3e2340b..1d7211850454 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -35,3 +35,4 @@ obj-$(CONFIG_MPS2) += mps2-tz.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
 obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
new file mode 100644
index 000000000000..a2e3d6f013f0
--- /dev/null
+++ b/hw/arm/nrf51_soc.c
@@ -0,0 +1,101 @@
+/*
+ * Nordic Semiconductor nRF51 SoC
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
+#define FLASH_BASE      0x00000000
+#define FLASH_SIZE      (144 * 1024)
+
+#define SRAM_BASE       0x20000000
+#define SRAM_SIZE       (6 * 1024)
+
+static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
+{
+    NRF51State *s = NRF51_SOC(dev_soc);
+    DeviceState *nvic;
+    Error *err = NULL;
+
+    /* IO space */
+    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
+
+    /* FICR */
+    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
+
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
+    MemoryRegion *flash = g_new(MemoryRegion, 1);
+
+    memory_region_init_ram_nomigrate(flash, NULL, "nrf51.flash", FLASH_SIZE,
+            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    vmstate_register_ram_global(flash);
+    memory_region_set_readonly(flash, true);
+
+    memory_region_add_subregion(system_memory, FLASH_BASE, flash);
+
+    memory_region_init_ram_nomigrate(sram, NULL, "nrf51.sram", SRAM_SIZE,
+            &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    vmstate_register_ram_global(sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE, sram);
+
+    /* TODO: implement a cortex m0 and update this */
+    nvic = armv7m_init(get_system_memory(), FLASH_SIZE, 96,
+            s->kernel_filename, ARM_CPU_TYPE_NAME("cortex-m3"));
+}
+
+static Property nrf51_soc_properties[] = {
+    DEFINE_PROP_STRING("kernel-filename", NRF51State, kernel_filename),
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
+    .class_init    = nrf51_soc_class_init,
+};
+
+static void nrf51_soc_types(void)
+{
+    type_register_static(&nrf51_soc_info);
+}
+type_init(nrf51_soc_types)
+
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
new file mode 100644
index 000000000000..422224bf1b0a
--- /dev/null
+++ b/include/hw/arm/nrf51_soc.h
@@ -0,0 +1,31 @@
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
+    MemoryRegion iomem;
+} NRF51State;
+
+#endif
+
-- 
2.17.0

