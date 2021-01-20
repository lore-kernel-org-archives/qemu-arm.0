Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4075705lfq;
        Wed, 20 Jan 2021 01:30:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsaAJEANBJXzad1Y49a5waJLxl7GkPI9k8qaK03L+m+htbnpkMVBxHS13dL9qfhKkRpzoB
X-Received: by 2002:a25:c097:: with SMTP id c145mr13266555ybf.328.1611135057324;
        Wed, 20 Jan 2021 01:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611135057; cv=none;
        d=google.com; s=arc-20160816;
        b=cVzxJB5D4VzZqHfcBr9t+TWeHiEP9qAPNz+56kZanxdMXyhrknXS9UfLBfoMLceOTN
         1YFcCpuxsHSVudvKZmdUKExfdVqsSUzKCt19nk9qjDMu6IRA75asXsDS3jT5rS9RFCfs
         Y93D3AEJV/FBMGLU+y9djMLlld+5t2skoAWlI3F7zem5nF3dk0ZVeZ0i0KpOqdIDAUCf
         Uv45o1FX+yvecJHg7RctA57G5LPOZuvUMu/hBzpbSWZ3Yghx9EUqR7EhQy2MzgdvpKDI
         4uWpp4uBr8lJ+VztH2pe+qwHVdlfyaRx3Msr+FrpVilQ6pikM3D264/+4oI68xCyJt5d
         ncfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ZAUGXZKLwFoOrXUE2K2BvuNgQf8/KK9NgRNqx7LDTjE=;
        b=SZ6jh5TRNReS3BzrvXM63REi6aFcxkP1mJmOl3rUn2QrCundv8Go5oJX4veAa/EZc7
         j+SB96SiSimHoHd6SFk4O0x4uJ/OTCRZAjmtWvD5wMYWlH2K464CgDcTlbMMmaF85c6Z
         N7Sm+0eRHzEwo1cMusHAp2kmNSIDb4c5fOv9x1pPNlche29BtHK6drX7Rs109rA6EluJ
         L7unpVgIC12YjugxlqQOOEPPDmCVloas5LMIlp/aOxEC1gipZEVTGu/ruh+Ds42JCdmZ
         AX0rmV6HSzXdnJrHzB0Bl1oktFja1z/XyeVBRXw8sWu1yrXuTYJ65t+zw+uLXUcgbFDV
         zsKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kyXhf3Tf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v141si1642405ybe.75.2021.01.20.01.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 01:30:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kyXhf3Tf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l29pI-0002ov-MM
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 04:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mS-0000t9-Q2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:28:00 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:46567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mO-00055m-RF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:28:00 -0500
Received: by mail-lj1-x231.google.com with SMTP id u11so25195442ljo.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZAUGXZKLwFoOrXUE2K2BvuNgQf8/KK9NgRNqx7LDTjE=;
 b=kyXhf3TfCZ7dPZKE+Kc79+mAEt+u4+YOBn11xsIR/lQJz8ubXZurUSu0s6TQROTYy+
 xUpce4t+b58pubzXvnO/iWqbe0VaCm+XLzbSHiHXj+5+tr8g+jz6ktkeSExhQ+Pdr9a4
 +QZDfA4e1B4J4VWnGBhKATdEI1cpTHduql53xjT6YAuGFuRWeM5qTXzUy7fQNI6vYE0J
 0lumhJ+mkHf6OpnPK9TvaBFLJnu8Fb7++bksaO/fGfbhePsmHl7jJDB151ZYI8pTOkuH
 XBOTNatW6I7v1DBy+Q0iJj9gh0clxb8QgA3Qe3PHrvAs1sbRHrktJOcxrZnAzI3YwsaS
 xL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZAUGXZKLwFoOrXUE2K2BvuNgQf8/KK9NgRNqx7LDTjE=;
 b=cQkPqeylHXqCvnrqTMuVpTnGfJf7zNJaK+382Vk9BMAaAVc5Wf9a1wgxS71wiMCKFO
 QGTMrzE/vXl7R/FX9PIPtGjBycTyRFHho6mmsHO5eRyD/wAclfFCdtbFv4gcqIDojKhr
 MBYFf0Od4tW3FpNZOtN4+w+7+5H4fLxjDNOQM3uZL+2b/rtKYLcj3cOPb6YQHKeU94dv
 Uk4qYjXBLHSRMouVQWPDxoM+w9yGdS/lvxeIytiNmY3wNf6zQS2wS73nrSoqyMQegJ3m
 vL11VjWCPxSBbHztJHE4+TRDEDze08zPG9SK1mtZp4nxHuGJyXhbkUmbubWuRvwGRz3h
 mnDQ==
X-Gm-Message-State: AOAM530GaU0SyrhdUx6Lga0NEVarmScz+TfmM4aEVRnpH5iIDMrfe9bb
 NooamIamhYJQSffVTxzzCxyjXQ==
X-Received: by 2002:a2e:8557:: with SMTP id u23mr3988706ljj.287.1611134873626; 
 Wed, 20 Jan 2021 01:27:53 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id r81sm147479lff.215.2021.01.20.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:27:53 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv8 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Wed, 20 Jan 2021 12:27:46 +0300
Message-Id: <20210120092748.14789-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120092748.14789-1-maxim.uvarov@linaro.org>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: irfdQ1vv0xTy

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
index 0000000000..7714fa0dc4
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
+    if (level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+static void gpio_pwr_shutdown(void *opaque, int n, int level)
+{
+    if (level) {
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

