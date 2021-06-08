Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4571638lfa;
        Tue, 8 Jun 2021 09:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx7Nvj5xxvaOoRfWBp6SJkE/zDJ3vg26M7CslNuU7KlV1GL6U9kUvwGXHyk9DXnx+HiOSZ
X-Received: by 2002:a17:906:e10d:: with SMTP id gj13mr24048554ejb.150.1623168755592;
        Tue, 08 Jun 2021 09:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623168755; cv=none;
        d=google.com; s=arc-20160816;
        b=Gk7P9Uxbv83qDTe98RsOkb313iHvHy/R+6vqX7RPBH/hBCfOEUx5Xsx7Auwvs0KQ5o
         bhNwPElTOnBdaMM3+Go3ggqY5SEqhSdamTKdRac5lt0CE8I+KYhZU5rNRTwSS35p4p8N
         pRnG4N+WoG2ukEqY0vHLNI8qNX1Z250ZktqATq2i5QhL7mjal4g8/LoiWM493MPtFKTT
         Rumlkjo81T95DCbC3A/dTyBYSBDzt1axzOhocGM5e2LULGwwzOEcnqfi4sUUJIA8wTGe
         1AQM+DqR1X88rQPIMSu4AO1WtA9LBKzHqHjbsjgf1JaeLNuAiKDMEgCtFuwNSu7FwaqR
         /myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lgvO4jE9XJSMvl0bHMIATMybt1zrFSHSjxojJDiKwcg=;
        b=GrXLvn1+BL499E6NMvY/Rke+GHTZxmqef0Q9jU0Dxek2JuBWgcpPXyDlRX4HREt/io
         9noylfYGSgKdutp6ZGTBCUSOn2z1yOZfDcRoPugeS+CGLxTEQmsEuWrXkyUDetTeEICo
         R2RgfY4xUnerMPDN8jOgpkxOw/J7hvpGO780ym0S0eL3PlLRmqmdD8MH9f7l1Vy3ZfZ4
         4V0KKb2y4BdEscmad3aLkB9SMICgmhLnogJzLl3OPdgXTKO2jmIWkylcq5n+pp3hKT4B
         t5URwkXplwam7ACVQod2ptESw+UuMbxj5DxiNCaiHqE4mP7WLdIAQT57L656y9H7GPxg
         3zxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si126529edx.42.2021.06.08.09.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 09:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqeLC-0005Tw-Lh
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 12:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lqeJs-0003QE-29; Tue, 08 Jun 2021 12:11:13 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:40968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lqeJo-0004S8-72; Tue, 08 Jun 2021 12:11:11 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 5736AE0117; Tue,  8 Jun 2021 18:10:56 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
Date: Tue,  8 Jun 2021 18:10:28 +0200
Message-Id: <20210608161028.4159582-3-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608161028.4159582-1-erdnaxe@crans.org>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0c:700:2:0:ec4:7aff:fe59:a1ad;
 envelope-from=erdnaxe@crans.org; helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ApEQnpdgB4aw

This is a Cortex-M3 based machine. Information can be found at:
https://www.st.com/en/evaluation-tools/stm32vldiscovery.html

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 MAINTAINERS                             |  6 +++
 default-configs/devices/arm-softmmu.mak |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 hw/arm/stm32vldiscovery.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62dfa31800..0aa8016936 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -891,6 +891,12 @@ F: hw/*/stellaris*
 F: include/hw/input/gamepad.h
 F: docs/system/arm/stellaris.rst
 
+STM32VLDISCOVERY
+M: Alexandre Iooss <erdnaxe@crans.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/stm32vldiscovery.c
+
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..cdc0e97f9d 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -18,6 +18,7 @@ CONFIG_CHEETAH=y
 CONFIG_SX1=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
+CONFIG_STM32VLDISCOVERY=y
 CONFIG_REALVIEW=y
 CONFIG_VERSATILE=y
 CONFIG_VEXPRESS=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0bc3ee3e91..dc4e47b721 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -239,6 +239,10 @@ config STELLARIS
     select STELLARIS_ENET # ethernet
     select UNIMP
 
+config STM32VLDISCOVERY
+    bool
+    select STM32F100_SOC
+
 config STRONGARM
     bool
     select PXA2XX
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0e637e6a9e..721a8eb8be 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -24,6 +24,7 @@ arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
+arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
new file mode 100644
index 0000000000..ab9297bc38
--- /dev/null
+++ b/hw/arm/stm32vldiscovery.c
@@ -0,0 +1,66 @@
+/*
+ * ST STM32VLDISCOVERY machine
+ *
+ * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
+ * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
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
+#include "qemu/error-report.h"
+#include "hw/arm/stm32f100_soc.h"
+#include "hw/arm/boot.h"
+
+/* stm32vldiscovery implementation is derived from netduinoplus2 */
+
+/* Main SYSCLK frequency in Hz (24MHz) */
+#define SYSCLK_FRQ 24000000ULL
+
+static void stm32vldiscovery_init(MachineState *machine)
+{
+    DeviceState *dev;
+
+    /*
+     * TODO: ideally we would model the SoC RCC and let it handle
+     * system_clock_scale, including its ability to define different
+     * possible SYSCLK sources.
+     */
+    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
+
+    dev = qdev_new(TYPE_STM32F100_SOC);
+    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       FLASH_SIZE);
+}
+
+static void stm32vldiscovery_machine_init(MachineClass *mc)
+{
+    mc->desc = "ST STM32VLDISCOVERY (Cortex-M4)";
+    mc->init = stm32vldiscovery_init;
+}
+
+DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
+
-- 
2.25.1

