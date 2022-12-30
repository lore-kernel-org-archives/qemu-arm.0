Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4948636ejb;
        Fri, 30 Dec 2022 06:59:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCpy2QAZtWhgHV3AFaqI1YfnEFxqlUmM5YCyQFOAg4nJG0ydWjCBWhhM4ld73TcsopJAVQ
X-Received: by 2002:a05:6214:3507:b0:4c7:7370:3c07 with SMTP id nk7-20020a056214350700b004c773703c07mr67471089qvb.13.1672412341373;
        Fri, 30 Dec 2022 06:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672412341; cv=none;
        d=google.com; s=arc-20160816;
        b=djZvAjCdesqxGQltoMASq4hJht83j6g27krb7SliuY84egZcWzQJQzxlRrP7C5tKHr
         6qEcTWIz1D+oynWzxNEDNV4ic84ow43jlnuX/1cSZZ4alzBPCT71eqz6WnXG0nAXF5Dy
         eTfHrkbVGyaCrJuJo+TblzHVp/hJTP4udutAmJYCAKz4J3agCNcPZFHn9xtEmLNCXvWL
         IO2+EpEI+Q7GcHxXzzAphfp7bQH03cW2jT06r4M1uUia4k24kaZ9o0WB9RSkS+7ENdtV
         SgLV7KYlHK8GJX9pXk9Am9OfOF1LdVnDzCDyOXx1yZgXXMceWXQBU2myRjccF2FpL3T/
         1meQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iEd3eL+4m8ejz8U5TPHg82yUGGKwxGRJZ7d//uQuNiY=;
        b=YR6ko0Hh/jtCF1xQ8boy5ADzRVLZsIdOVsBduOoOb7kebN0+biAwjdGqHQdXNtPuls
         He6VR3R1apHhvP9f/qfQiI5tfTKdS18ShKvYRaJe29Fqo4wgLq87ihZuUvykvJSzaY0B
         Ip3MICDwmhZHqSk6viWbb1UQAd/5n9fM71uJgubZfOwkWAAXkBAKQM0ml6HI4K/K8pOh
         0S9nTml1y25WFG+MKiYID00T+CdcsuzmNpbR+RM7hoyT6pfo1a+tYPZm6cn98zKNffMz
         wjs2kQVTA4J0nnRqiB7y0DxdVD2+0ksf/tv7zOWajnDIAWDTUTMyCrwviZULI3DBcrn0
         YpAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="H/YDJs/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a05620a146800b006eede8718besi9333733qkl.82.2022.12.30.06.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 06:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="H/YDJs/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBGpY-00006O-N7; Fri, 30 Dec 2022 09:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpX-00005Y-9B; Fri, 30 Dec 2022 09:57:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpV-0000VQ-91; Fri, 30 Dec 2022 09:57:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0322761229;
 Fri, 30 Dec 2022 14:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C574EC433D2;
 Fri, 30 Dec 2022 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672412264;
 bh=tS1h+RoInBuflihKgL7AEisEZQke6048q0BOPbzTk28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H/YDJs/0tRksxxgYWrx6CSptYarZGcHcbg+yglZpSMpRGuBnK5zVBS7pNIEUWb7Of
 1JQflovmgm8BEalWcic5+cC5YqN4RP89mE6/umc9J9UfDIyTG+753mptA7/6pyxaKv
 N4ytSqr6TQ3QSLzDDZVF2KHv5nEIAdU1LJpiar2no9aUbDNznQlpYoCCwOGAOOyw/3
 jkRN48PklCHk9FDT/dg0SGAe3m2kx4PbtrjhKo59OEIAnXzehqTeJVJ3VpDFBC8r3a
 qCf3RCBSbWTXJTPmaRvRxbPioJ2hu11wf0zBKonHGDlsHFsLzgWgUcyYKYmXXpRIoY
 7CVP6dCLjnjnw==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2 2/2] hw/arm: Add Olimex H405
Date: Fri, 30 Dec 2022 16:57:33 +0200
Message-Id: <20221230145733.200496-3-balbi@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230145733.200496-1-balbi@kernel.org>
References: <20221230145733.200496-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=balbi@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y9cJbEjY8omC

Olimex makes a series of low-cost STM32 boards. This commit introduces
the minimum setup to support SMT32-H405. See [1] for details

[1] https://www.olimex.com/Products/ARM/ST/STM32-H405/

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---

Changes since v1:
	- Add a note in stm32.rst
	- Initialize default_cpu_type to cortex-m4
	- 0-initialize default_ram_size

 MAINTAINERS                             |  6 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 docs/system/arm/stm32.rst               |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
 6 files changed, 82 insertions(+)
 create mode 100644 hw/arm/olimex-stm32-h405.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bd433b65a55..e37846df0071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1026,6 +1026,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/netduinoplus2.c
 
+Olimex STM32 H405
+M: Felipe Balbi <balbi@kernel.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/olimex-stm32-h405.c
+
 SmartFusion2
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 6985a25377a0..1b49a7830c7e 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -30,6 +30,7 @@ CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
+CONFIG_OLIMEX_STM32_H405=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
index 508b92cf862b..d7265b763d47 100644
--- a/docs/system/arm/stm32.rst
+++ b/docs/system/arm/stm32.rst
@@ -20,6 +20,7 @@ The STM32F4 series is based on ARM Cortex-M4F core. This series is pin-to-pin
 compatible with STM32F2 series. The following machines are based on this chip :
 
 - ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
+- ``olimex-stm32-h405`` Olimex STM32 H405 board with STM32F405RGT6 microcontroller
 
 There are many other STM32 series that are currently not supported by QEMU.
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 17fcde8e1ccc..9143533ef792 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -119,6 +119,10 @@ config NETDUINOPLUS2
     bool
     select STM32F405_SOC
 
+config OLIMEX_STM32_H405
+    bool
+    select STM32F405_SOC
+
 config NSERIES
     bool
     select OMAP
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 92f9f6e000ea..76d4d650e42e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -12,6 +12,7 @@ arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
+arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
new file mode 100644
index 000000000000..3aa61c91b759
--- /dev/null
+++ b/hw/arm/olimex-stm32-h405.c
@@ -0,0 +1,69 @@
+/*
+ * ST STM32VLDISCOVERY machine
+ * Olimex STM32-H405 machine
+ *
+ * Copyright (c) 2022 Felipe Balbi <balbi@kernel.org>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
+#include "qemu/error-report.h"
+#include "hw/arm/stm32f405_soc.h"
+#include "hw/arm/boot.h"
+
+/* olimex-stm32-h405 implementation is derived from netduinoplus2 */
+
+/* Main SYSCLK frequency in Hz (168MHz) */
+#define SYSCLK_FRQ 168000000ULL
+
+static void olimex_stm32_h405_init(MachineState *machine)
+{
+    DeviceState *dev;
+    Clock *sysclk;
+
+    /* This clock doesn't need migration because it is fixed-frequency */
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
+    dev = qdev_new(TYPE_STM32F405_SOC);
+    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       0, FLASH_SIZE);
+}
+
+static void olimex_stm32_h405_machine_init(MachineClass *mc)
+{
+    mc->desc = "Olimex STM32-H405 (Cortex-M4)";
+    mc->init = olimex_stm32_h405_init;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+
+    /* SRAM pre-allocated as part of the SoC instantiation */
+    mc->default_ram_size = 0;
+}
+
+DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)
-- 
2.39.0

