Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3604756lfq;
        Tue, 12 Jan 2021 06:36:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd9irygfjHtCkTXP/US2w6g3vEWNdCZIuobuhEcF1AILFQaFQVLfW+LTsJgfmi14LUq3ep
X-Received: by 2002:a25:a86:: with SMTP id 128mr6748504ybk.370.1610462197628;
        Tue, 12 Jan 2021 06:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610462197; cv=none;
        d=google.com; s=arc-20160816;
        b=zsYjkwteCRjUjrtJywaNiJ/l6DdNJscwrky/alozXoP1hjrWboeKaOfmwFWd5DIwKQ
         HtCxuqtoOOCU3TnsYPde5wUU8UhLcDarHoJxnkMDNL+xzbhTLxP3CwE2Qmf68c6ohl5w
         ql3GC+KSvKotCTM8IQ4q+5dky8yEy7kb5hr/Z/QgCi2ghdsgVraa6r37PSnCMpkGFshO
         BYRWuVDxqnD4U+ZTOz04wBf0TSC9phVrgEISzLhksq7Teghg8zFellcEdjDd+7wUowvB
         oEYE1OCbYABLZwrzg5s4M8B+3XNdbD0Ddv8CWB5zMReLDxvJ6N36UoLQMvHf9Rnc3hGx
         15Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=aSVqArs50dH6ORORx7j1pebjzF5WWw6+PDwzFqwRDNc=;
        b=abm5KMdmzsG67ueFKRQDM/wWfu4TB9ZRTY73cyx+T7sXA5jBIrpxzqLK2StwIU6FUq
         RBmtJR29E+/4NYX53H5o66UlRw5wn/mbzvCEDyH1BiDWY+O9uTAj/dwW2P9CwC5ASD0U
         606syUzGZC/YYj1LMGouXl1eLoAXEfJpV/IIHI2+Z1ZNfbb5ps3SFfEzd1OcTlP0ahNm
         i/zVEfeW0Tmtahs2sx5pxhBIUctswUBfmjr4+MS84TeCJiGAmoMDOspOD4fvXAyufPBf
         89M3pxS4Ng8cvkcq0adByX/y9y5P1StChS4geZTYplESBOt3XW3LZsC1SdN3athJjTCP
         sSTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wZF6SMDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si2768964ybc.421.2021.01.12.06.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 06:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wZF6SMDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzKmi-0001rD-U4
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 09:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhT-0006E0-6Z
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 09:31:11 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhO-0004ff-Eq
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 09:31:10 -0500
Received: by mail-lj1-x234.google.com with SMTP id u21so3093415lja.0
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aSVqArs50dH6ORORx7j1pebjzF5WWw6+PDwzFqwRDNc=;
 b=wZF6SMDINx4eBMO6VmJVJ9zM5so/EZ3L9fBSFIVF/BJK3NYQ+ReRtgjPnE4F9v9RrF
 t979uwv/EYt1Bt3+sN6pfIUAYLuNrAYgVJ6q8eSeAUQl05q0xZd3psGuesZS4rhUPVbo
 a3r4RDtJ1HUwVBcwvb+EZjxiNg9hO6CxThkJXGqyCQsYCUMt0fUZm+9A57BlGEX7qmqF
 XTNYjqYQJb8dsiSVnvYPDIMuYDnFJNEuN83iJAtH1nWGNQ8BRW5fmTItJGr6VvJmexQG
 wLkf7UJb7Y9S+mZumlW54hfLSP2Fi76tc3RRHJ0JYAzA6w6FU83U8Jy9uqcKxD2DyBVz
 emuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aSVqArs50dH6ORORx7j1pebjzF5WWw6+PDwzFqwRDNc=;
 b=Cg6HJzv+jU5WiM6Mo+kYg5CSWXGSNOj5JrkAsFGIetN35/DIlE+c28m26IasDMUH2q
 df7zY+hUA+wfXpWi+TiCEJyaGaQZ3xQ77JXHSb+IM0aSHsIhx4BO+n7EKAHR3UT/S0oF
 NCVZL3wEOQIwQr5uB7ax6REI+AkmCKypkUSs3z8fi1QEvFcuNqZh/i2nbQmkNNCJjgDh
 LABb0r9Sgq5ial/ZrX/esw8APK6OtA/CgQBuR6IJVjRwHAeD/jafwA2W3nNtHG+Xu6HN
 sOjvnSK34pT6jikFEb2U5ftEAenO3qJWyLoIufm8j+0EWJ1ap+4D05BsR3svHexeM5fw
 mZ6g==
X-Gm-Message-State: AOAM530VYdPc3y10T2lEx4XIun+CGHdCx8VB/Z983q89u2PZw5/7nNBe
 Y9amPEKH5tu5BdyCnmqBsFoKQo4dlwR57Q==
X-Received: by 2002:a2e:2a83:: with SMTP id q125mr2169658ljq.436.1610461863000; 
 Tue, 12 Jan 2021 06:31:03 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c24sm365499ljn.116.2021.01.12.06.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:31:02 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv4 1/2] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Tue, 12 Jan 2021 17:30:57 +0300
Message-Id: <20210112143058.12159-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112143058.12159-1-maxim.uvarov@linaro.org>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x234.google.com
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
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JvK5v1NHjoCj

Implement gpio-pwr driver to allow reboot and poweroff machine.
This is simple driver with just 2 gpios lines. Current use case
is to reboot and poweroff virt machine in secure mode. Secure
pl066 gpio chip is needed for that.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
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

