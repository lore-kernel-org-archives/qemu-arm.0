Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp346882lfq;
        Thu, 14 Jan 2021 06:51:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMsSKltZEo67d7krGRp+yMWd2D6UzwGSqsC8Q+yZnF/Xd0WilfT/sYfh6TXqIKlTTdiJrY
X-Received: by 2002:a25:d57:: with SMTP id 84mr11133153ybn.237.1610635869987;
        Thu, 14 Jan 2021 06:51:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610635869; cv=none;
        d=google.com; s=arc-20160816;
        b=qihXEnchvbqchuTNSgV1cRslRg/SeOp/Qu6CJR/k75qGNCHlCkjpmS4MXXooazSxjF
         NT8lv0t8zrctdCbZDwDGwqRWtTfaWeeUGfWGLNc51abu6qaNAyS5Ld1+KX5kVkXFdtHG
         FT464WwyRXg/rNecGiVRLW1uWWrgiFiNTtlN6T9CFOheEAwblPQQO5ljsk5LlH4YKaWE
         bss/fdRsrfbIrInCfWJY1H782rsw1Lvq/tjUWmFkSc0+588JVnLXk/iig0z7x0ThTYAo
         ts3RYQMVaP9PYArnCy0P8/uOOTpEEXIjdI6NN84nAXPX0E2ayOuiiTvo0+wraU2jwJUA
         z0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
        b=GklB/B3EtS2QmDMxTbvvKkvmCAOMstvw+jbgmWaPri+dxfGVb9Hh0QAutdKwyknZxK
         hEhA1h+Q9uPfH1N8a3dNFoHRJey3njBLg+QuFvM0kWldy2IGvPNczeHd9FnAYL3anywv
         CpE0tr8pB+4cQ1Oknj2T1gW72Qy68ZopeIlXSAkTz04wwlyuE5yZ0xkYd0VIfENPuzNR
         r1lFUMxOq4uJ8XOqNSkeqqmuLFni8J+JyfY5zmsZLZFb8AnsqjUjWuC9cs3Gj7kEVDrF
         Gxzo87XPIs3nztYqeCtYb/ruKISCnG3z3q7LsFC1nr01qIBgJxq/ssPRbMG7I09oub4G
         Nkfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWFf2iQz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si5673019ybm.126.2021.01.14.06.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 06:51:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aWFf2iQz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l03xt-00005U-BN
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 09:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xT-0008I6-Fz
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 09:50:43 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xP-0003xQ-6q
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 09:50:43 -0500
Received: by mail-lj1-x22e.google.com with SMTP id n11so6744228lji.5
 for <qemu-arm@nongnu.org>; Thu, 14 Jan 2021 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
 b=aWFf2iQzJCs+xc0d7hFTeo4YRfS2cmVUOP0jiT/hF0wLXXfUjYYa1sX/laeJMMAijH
 gztrnEXvc1MiPbREP8MEtbApqUcEs4g1yPBL0bLedvt4+MYgyAQQ9zvAwtUoRrFRR1tF
 mQp2nKut5paW3jrUV4fejsNkttj3E2zn2QlbI7VD3qlGXUxko2UKMNBJUEDcg9F7esFo
 HQoRjZ+qDhqUJs3zLJdyghejhVW6B2v+6yE4YBEtMll0yFtO8IEaGhu/DoyU36fbiCJD
 2JtVBCQTMT/Iii1na2tqy1hOZFunrIuL1xSAKoKQNH67mIVyjsMK5OSUL6zaUluReuPo
 4l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=62h8W8c/MHOTaJfr80jgkPG/YCUcGgeW9/I/zkhkDxM=;
 b=uTAjKuXFbcSqG8VHpLUPsrHbMXNI6AGC/4mKf8Wu11hSY3P0kjjU7ahYTCsc0HsjmK
 PVQwqY5Iv3nrGEhwkYMg2/1jl3hqb4xMIMopyWGQ0uTn7t8MiK5BJ3hOFUzPovs8XWzO
 Cs4Wj+/fFQqQ9ZDQpxp7J4MtwylFa3yLPC3y7iTSI3KSSkgmO9V7pWyiQGGmMyi9R/mf
 KCP8CO4CS59zi2LDTJ0nkhUnm5FLv/sl8VeEreRcqxvaM8/60Y6j/7RcbmOi8lBu2QXp
 39c7O7HLe+t7HC6eiaQfYKN3+y3cAW8G4UyKVizVMdPR45sClRKbWAkKDCi/Lr0zmCj4
 BOmg==
X-Gm-Message-State: AOAM5308AX6aCo4szGMPWRiMvIiUqqm0Jj8Y+hqt/dyFP1KwYh9AaQA4
 AtORqLeHxMMndhG0a3HtDLTP2Q+d93MFNw==
X-Received: by 2002:a2e:6c03:: with SMTP id h3mr3403054ljc.360.1610635836532; 
 Thu, 14 Jan 2021 06:50:36 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id p5sm567229lfj.295.2021.01.14.06.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:50:35 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv6 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Thu, 14 Jan 2021 17:50:30 +0300
Message-Id: <20210114145032.8457-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114145032.8457-1-maxim.uvarov@linaro.org>
References: <20210114145032.8457-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: uEi2K8Vue3yg

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

