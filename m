Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp130603lfq;
        Fri, 15 Jan 2021 02:11:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnEkh2YbvbscYaUoyuz955jxYbbLT5lX5mnnMdtx0cPPJt1r2KAiKeOI2+ssHMd4xoa+o+
X-Received: by 2002:a25:bd91:: with SMTP id f17mr17203648ybh.427.1610705506920;
        Fri, 15 Jan 2021 02:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610705506; cv=none;
        d=google.com; s=arc-20160816;
        b=TaMT3dZZe2U/24brpvOQQg8M4F/7DcXUxyVNMawCOKDPIIlloNeyJmD42nhuUMuGbW
         olpISqQO2461icmK4OT7KB/9z9iM8PZ2d8pHT15/q0zxnXiLZuVtdsOvLAq+e3UTsHkX
         QviGedD0YstG0/b58xd5yJBTdrC5VM0BpMSR+LvchZVfhlV6OIqmYZkTj00+7w46m9iT
         y/pOcPskSrDRFW2zQ6eWYgpyztmLYEdRtN5IgBJ25InuVONo34L8b7lVxpX/ZnOe0GPj
         MV11s28EA8VAc7f2tQupWbX4ry3rbGaP4gMmnPZn+1qF9U46NFHq8YWs07Ep/CSE7p86
         3JJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
        b=03uelfc39M1j869GezF0oraV7tm8Z/p56FvAD/JlHYfzqiv4RsoDZdPJLfJgm2pqOB
         7sz/yMR1cxSXOYmNFGEMwfLXyBr0D3wryRsYXpUxPbnm2028FexXmtIbaYynQ9ThvOgY
         AJx8Ny7BsmvSNgJIvOQrPmt8Q/98T/SIYetOi4j42VhzAiIyay8lXFs75oRniuNF+BlA
         9et0xu+OInUgiI9UV7gaFCoxwMjLUKbUOtqqJFo2JX+vDnPfgkyPfsKtlQ5Ycu1qPpHi
         0anfy4LWalhrOPbPhOi4PFxlCZ8z4aPu0rLo3GRTvaqAdMfl1vIJUlcY3fV8odB0ixHV
         qyvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GyH5cAgj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si7726048ybj.345.2021.01.15.02.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 02:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GyH5cAgj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0M54-00047f-9N
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 05:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4u-00046E-Tb
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 05:11:36 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:37526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4r-0001yf-Lm
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 05:11:36 -0500
Received: by mail-lj1-x22c.google.com with SMTP id w26so9782870ljo.4
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 02:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
 b=GyH5cAgj8gBMOB9g6vIMa6uul6ha6L4Hbw0pM98N6O6QoRwupKRoSEWMK3VhHkcSU+
 GFcID6kPoUleGXhzGnEiVX42tI5PRV2bBqUFenMiAjPyYwJlDbooDaLyjpThj/Sz6sVv
 +eB1y7EUlSTZhe7+7DNcNl9EilDhQyZ3SK0DHhfgegaPFQViVjNdUBvpj/LR+Hkk4jN6
 8/OA8ZAsdQYYEe1uqeqQj7TJrbLIC+ocejMh5G8zYo7lL3vps5epBzAeFokqYeswfrmQ
 IiW5L5wHBYuJH4OKlVWY1C4Zkgyl9qDIsOR4uuZoRVAjsg8x+SN4nE6uNEyCC6TpyVwv
 d9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
 b=oLxzErGTG/RJazlvv3GMNd1uLV6QZTd4eZuvXyUPu2V7X5eqCrLCiIksmlwmh41sf6
 zbLV2Zy8DvX+2d0rSbEirpsjoa/PZ+kxpZlRE3h3OV0c68BREg3zRCZFyoiBRbpW89ko
 SssiGyyR8egO9qloD8xvYk52ilc3zAQcfpnXC6JkNUx3QT+chBNkOoAnRJubTLM/tG2Y
 Pepjc+xvtoQzN7xLz5/QX4idtTrBxxAfWoskv5/gBf8h/GNGXEyt5LeOkRKpj7xH0goF
 PVDc/qQ8pPB+EOwEoV1oMl5s1u5eWqF1s7IfEgx81s8p7+/QVWLUbJC9Y33OYkVR8Qxi
 uBYQ==
X-Gm-Message-State: AOAM532F31UZzL+tiNrR3b+2PwkXm5JFkz6ADCiAIZY6rXcTkLjCGnA2
 rK68cE3CZeIXtKgAwRVZuEaPNTMuboxqMA==
X-Received: by 2002:a05:651c:383:: with SMTP id
 e3mr4970599ljp.422.1610705491760; 
 Fri, 15 Jan 2021 02:11:31 -0800 (PST)
Received: from localhost.localdomain ([91.193.178.207])
 by smtp.gmail.com with ESMTPSA id a15sm731886lji.105.2021.01.15.02.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:11:31 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv7 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Fri, 15 Jan 2021 13:11:24 +0300
Message-Id: <20210115101126.4259-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115101126.4259-1-maxim.uvarov@linaro.org>
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dIAf3nO4UDoB

Implement gpio-pwr driver to allow reboot and poweroff machine.
This is simple driver with just 2 gpios lines. Current use case
is to reboot and poweroff virt machine in secure mode. Secure
pl066 gpio chip is needed for that.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/gpio/Kconfig     |  3 ++
 hw/gpio/gpio_pwr.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index b6fdaa2586..f0e7405f6e 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -8,5 +8,8 @@ config PL061
 config GPIO_KEY
     bool
 
+config GPIO_PWR
+    bool
+
 config SIFIVE_GPIO
     bool
diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
new file mode 100644
index 0000000000..8ed8d5d24f
--- /dev/null
+++ b/hw/gpio/gpio_pwr.c
@@ -0,0 +1,70 @@
+/*
+ * GPIO qemu power controller
+ *
+ * Copyright (c) 2020 Linaro Limited
+ *
+ * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
+ *
+ * Virtual gpio driver which can be used on top of pl061
+ * to reboot and shutdown qemu virtual machine. One of use
+ * case is gpio driver for secure world application (ARM
+ * Trusted Firmware.).
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+/*
+ * QEMU interface:
+ * two named input GPIO lines:
+ *   'reset' : when asserted, trigger system reset
+ *   'shutdown' : when asserted, trigger system shutdown
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_GPIOPWR "gpio-pwr"
+OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)
+
+struct GPIO_PWR_State {
+    SysBusDevice parent_obj;
+};
+
+static void gpio_pwr_reset(void *opaque, int n, int level)
+{
+    if (!level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+static void gpio_pwr_shutdown(void *opaque, int n, int level)
+{
+    if (!level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void gpio_pwr_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_init_gpio_in_named(dev, gpio_pwr_reset, "reset", 1);
+    qdev_init_gpio_in_named(dev, gpio_pwr_shutdown, "shutdown", 1);
+}
+
+static const TypeInfo gpio_pwr_info = {
+    .name          = TYPE_GPIOPWR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GPIO_PWR_State),
+    .instance_init = gpio_pwr_init,
+};
+
+static void gpio_pwr_register_types(void)
+{
+    type_register_static(&gpio_pwr_info);
+}
+
+type_init(gpio_pwr_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 5c0a7d7b95..79568f00ce 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
 softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
-- 
2.17.1

