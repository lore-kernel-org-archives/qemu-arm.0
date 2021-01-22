Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1218825lfb;
        Fri, 22 Jan 2021 13:52:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlcD4woXQ/4g+3Hzls4O/WQ+/GtdfcyfJl4S0YVnWP+VrydcRWsfMxEvnJ4oXDQ9a2qqZZ
X-Received: by 2002:a25:accb:: with SMTP id x11mr8852576ybd.494.1611352373322;
        Fri, 22 Jan 2021 13:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611352373; cv=none;
        d=google.com; s=arc-20160816;
        b=qkHFq2AiEZiY30zwpUWZO54AyI1st3E54tqbSM6sQUrIO+txP/k7F10rMlXwd4OUr+
         m8lAZ9p2dMKSIrmK3bTXIRQFfFaLXA5+VYMs9VeKzIW/ZWsTcpfeltlZofbUQ9fA+dGi
         qcUSja7ZT0dCH0l4S6q28iW7f/7NcsEmYP7Cj19Ay5YW5HEsX5Le8CfzDaKTZNveTUJN
         hifAlDsKl3u1ZF8bmlymxSnMgBK6zVKVH8phTM3d7w3igZ2VDqa2mfrcijtpeKIH+358
         yX4nU/cmUWLiQGecqf3OqvYZM26KCoVQbHBBxsgZ+ArKfrZUnpHn1RiQv3C9SfFWj8GZ
         RokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=iEyWJZhAZPnLFDMgDIpbGYkV2+NYdmfH2gdbQlh81PQ=;
        b=KQm2+kJZxwZYJ7FGFMpfNN6TnAjgBDteqE/6oUwI4E5dewHboiF52SDrQOJQgpQkq+
         Vp8JG4hs7qO+9eU8ajquM2kdYhyBQi8WpgQMmJvlNl9jKywzyMduDxyygiqcRGeRiLnj
         rpRVsEVmMg+SVdqVvQiDgY6UsRE0Z23nyMvFm2uhA80WgT3yUS+aocwo+ScwAaDZLWNc
         oWSWojssiU15fJaOF2I1XzEctDD1tktqrr2+/Nvod9DAA7X3gYGvLFPEwp5xFBraPF7W
         dlAAYYWsBN5yWEwVzWjlrBD36ZS2nVwUMejAFTKd/qGkOJ9uEEG5sRhQP7zCCeVDjBA4
         sLyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x1VB69CE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w130si9732509ybg.146.2021.01.22.13.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 13:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x1VB69CE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l34MO-0000Ws-KI
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 16:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M7-0000T9-4v
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:35 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:39423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M5-0007IW-5P
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:34 -0500
Received: by mail-lf1-x130.google.com with SMTP id h7so9601220lfc.6
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 13:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iEyWJZhAZPnLFDMgDIpbGYkV2+NYdmfH2gdbQlh81PQ=;
 b=x1VB69CEfqvH9ZKopFDbeFrgpyFv3/alukJxhChqnrbFmVYswJ/YZ5GEYvLRjOZ+ys
 3iqxdCKmuEVEXEwpZqgxboa2tA6IhodXppBGFUWdhpYk4t4zVU1OyRP8mCIARJIeoHn/
 PaaaYe0gsPLipDB3llTTFwFe8cxOOMjQLDwErVLGHDYwjIZIfcXCiGzlqpLGrcFi1VQS
 7K6M94OFL4OG8OFcTIrD0pljjK3dVQj1BNi8z8xU8wCxrDsPE/ISxIvD9HpsDoscY5y+
 41IfLRKq3ISjLHLUb6VsH1Wb6M06gIzuEtcVn4p57EjsDTRe8t6/hYKwwEBrzyidhAzT
 XsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iEyWJZhAZPnLFDMgDIpbGYkV2+NYdmfH2gdbQlh81PQ=;
 b=Vbms9XmtisOhIoQMV8an6IRXcIfXTRj4s1lzakrSD/PyB7ucoiO230OPdx4/QgTQmG
 Zu44ClMz9to5Rhv/hbPYjsM2Aqx2qcxmDecymk2nZ4sLSpiuXTr7B28nGo1LrWqzIVia
 c9LT+ArLUyun4jjzNPmwLk8DkgVwQcxZf1/Uj3SCQOxr2cFMPtGX3Aj7k7O2TDAiCUxP
 0BFOPa9tIUbFhoMHPWn+4r7yGKB72CAJI/sHO/YbxADbAV9yFxjSoNNBp+JX9pnNRSRq
 Z9PfPHjHx+uvR5pYzzJxUmQUOpVSNA6Jp5ENkEPlU3pUEnhypur/elSwvb7fpmQqKpmw
 519g==
X-Gm-Message-State: AOAM531eXQ0Q1OFwmlNTVGfgANJRVhlu8GMmJQ6EG9p6e05NKlT9ZmAn
 /rrADz+qyMDvAvyKVxVqbaSot3T8Idk/rw==
X-Received: by 2002:a19:a0a:: with SMTP id 10mr250338lfk.397.1611352351093;
 Fri, 22 Jan 2021 13:52:31 -0800 (PST)
Received: from localhost.localdomain ([176.59.42.245])
 by smtp.gmail.com with ESMTPSA id a11sm1019890lfl.22.2021.01.22.13.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:52:30 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv9 1/3] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Sat, 23 Jan 2021 00:52:20 +0300
Message-Id: <20210122215222.8320-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122215222.8320-1-maxim.uvarov@linaro.org>
References: <20210122215222.8320-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: kIvZF+6BVlwa

Implement gpio-pwr driver to allow reboot and poweroff machine.
This is simple driver with just 2 gpios lines. Current use case
is to reboot and poweroff virt machine in secure mode. Secure
pl066 gpio chip is needed for that.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

