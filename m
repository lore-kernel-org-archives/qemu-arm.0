Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp280602lfq;
        Wed, 13 Jan 2021 01:39:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8PaH/1w18r1euPLh+FPbRoTsyPUyLy9gb0BQDs6JpdFMZTSvC7UaL74JVuFWvgK/IG55G
X-Received: by 2002:a25:234d:: with SMTP id j74mr2098451ybj.93.1610530790752;
        Wed, 13 Jan 2021 01:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610530790; cv=none;
        d=google.com; s=arc-20160816;
        b=AyZGW+JI1CP9zsAYXouWYIZfIckPQ7fmjrMC2bQb24wWqM76QG6kTC7PZQY/V2PgcB
         bBFy62VbumUCCgIgC92v6hp7HNofUf+cnxNc8ju7HUlkNgUxcNJf7y4R6DdMWRiltogo
         ICuSMK23/2k6RQtPMWSLGlC4S9o2PfLulQho9m9GUVVJrERqtuJsB2YltZZvKEZSGN+E
         DUSEzWGd0d6j1oqL4Vx05ood7oLgWceroUo63i5u4oAV6ztbqu3ol51S6fJw65JBfzZd
         TCclzsz2S/abwqHCSaA16Abcsyv3mcwxKexOaNFDm6/dqstvm3nrMCuVGHxbZaQ2n+wt
         tP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
        b=EA0XPOSq0X6D4Pmr8WhG2tPV15r0jtDiYEFmvPwir8I9uyt2e1e/FEZ3St1gkMfZiG
         ku6nSG+nMbBprU2QuknLBl4K8gUB3e6ADfpxEWUslJRMMSVXL18BqcNL+yaM4R5durYF
         kJz8vUhI1Ra3FsqwMQ4uFoFGaaEesV6u/YiDajkVsv67Ruk4eEI3xEQ+iMTxP2vnELKL
         yAS/FhIrVf2dFwiq6z5I6AeYAk2vluSoqRhUJOvLI+0VnJps2aFfsIpqrqNjSDKoAigV
         u+xar6dMNsKgZA11iY7+HJy5oTVmWHp9bmXjppPsepJuW/acTTnRRP8VNDTRVTMNp32Z
         cAdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NisRE+eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a32si1751971ybi.288.2021.01.13.01.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 01:39:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NisRE+eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzcd4-0007bG-4x
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 04:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXr-0001BI-2R
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 04:34:27 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:47030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXp-0004Gh-4H
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 04:34:26 -0500
Received: by mail-lf1-x136.google.com with SMTP id o10so1730525lfl.13
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 01:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
 b=NisRE+eqax1f2DZOLE5wsMhO+ff1NkakrDlT0cAlWICNti3Smfh8X6hjFtm+W6d/r8
 KY7EDWjgJOb/ggOPf5zGr2KruAQktC9bhUxurrpcbIKQnI3NfRDR6zF4ALE2GqcJ99uN
 uxOQJqxH5RQg5j0eiRlCljKxXi41Xcj/sJHfhrSM1WHoTxIsI9QmqtZ2cgER/6AwpQXf
 USXj+MHMnmbzB2njB2DI6oLjxHLEJi2W5L1RdoQ3fs+R/ek4aVSjybDf29awjNrKzKdY
 7WXjJix63lPxLL/qQ/g+Y/S/0NlXtwCwP63vE/Khk1rss1+VuEBAtI80WINuveU936m6
 GUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
 b=Fc8dEkSry6C7lAD5NIVy7QPb3BXbdFdQMzIOpJVCqTD2HCBtAXyaJpMeMrIAHE/czD
 vD3Dfb1JbYlAHWUKn0hakg2n1Jytjks/HTWIol0QV8Digq6b8VMxXe6j6aPaf71yJz0L
 nF0gLeH9HDswhCA2gmd9vAOi/RS5DtDKEY2D4N7QtrBceqjY2NKl1OWFk0BbYhO8GnZs
 lhDrbtaZbHMM/5S+hLX7N4GMSHRUbQDQovVFdvZ5TczKyBB9kAxjFnnodqUKXSI+QfUO
 Ly5VRum6Fx3UQLUZuShSh8PDiXqrgGtrEyubgvp9epblm8gNYphZU9QzlukKYqZurzc7
 pIQQ==
X-Gm-Message-State: AOAM5316s4Gk6llh+WIZARCY1T47o1t0snu3GnoNe5PpN5uSfjTivNNJ
 Ajs9SpknEeFi12yPDT30/du4beoKempnKw==
X-Received: by 2002:a19:770c:: with SMTP id s12mr467248lfc.367.1610530462723; 
 Wed, 13 Jan 2021 01:34:22 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c3sm127472ljk.88.2021.01.13.01.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 01:34:22 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv5 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Wed, 13 Jan 2021 12:34:15 +0300
Message-Id: <20210113093417.11606-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113093417.11606-1-maxim.uvarov@linaro.org>
References: <20210113093417.11606-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DBxZdAGhU+/2

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

