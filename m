Received: by 2002:a17:906:234e:b0:a27:b575:1990 with SMTP id m14csp16457eja;
        Fri, 29 Dec 2023 08:49:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZfsXXSzUu3u1aXSBXYEdUmmlc89Yujnhxkgrm2B29Wv4t+tJs3c8Cn9rRx/qG9UP70svI
X-Received: by 2002:a05:6214:5018:b0:67f:13c2:3655 with SMTP id jo24-20020a056214501800b0067f13c23655mr17662056qvb.6.1703868593612;
        Fri, 29 Dec 2023 08:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703868593; cv=none;
        d=google.com; s=arc-20160816;
        b=dKy/DnuDUztC+gA/xNQ0eJZFn4SVZ8o+c//11XrTGvrhdG1LWpU5XkA8qGAzbwJpQZ
         1yDY6uMl4YQABrV12aFxKp8EGS5nbLQTp++kcmYNBjBG3AeFfNOtXnAUuHG9cXJfP3Cg
         99FyEjYzRoL0Ftz9UDU2siu0GN1AOnAZ+iUgvdHzea+ax8+OMpEjUJi9+mx31qrp/yAo
         6C5r85WdIj/wv3I6qrT+LmNXHr744v3Nep0XLI5A+5N1JHFiY/y0tqoirVuy1V+EhE7x
         ZmhhxUxRYpJQUNjsy+Ynh5UeJZVxjITS8BkmjSGoJ7UXtNx7YhguoB0WKn3KGJ21bmdT
         s2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=/UKFgb2Avnn52dEU7mbdgSMnxRmiDdJBuIrXEoI42Ro=;
        fh=hOw8qm33Q2EFq4kdFn/hjTCjR8XhFWzKRBA5f7d2CD4=;
        b=rHV4UtRXcB5HqWolYIr6rhv18o7aCGKePYLBFTlMXJzcZoOfSFe9xIg0OuDN5Z5Tjf
         XIpLHqMiMk6lu4nfq3k8LiHGWKbigwWRMUu7GiNaBZtI+lQEgFMIxXnuoBNhLSxzRkiS
         /XPmzq+GSbtUo5V+Ygmq3FXXkJh1zLgxSaYa1jxFO6jYmmpr4J5fn6vPyCERTfN2lY4H
         4Dh9Fy4Z2qJft8IntzKgmWFw3f5Arl50mDC+wL2OL/W+40+aFuKzmC+kDSTRuromY4Gc
         1tSD2n3qUukGTB7iQzovRVQaJ1tA9+CP3if4poqtYjp+HsfTJyV6/yoCGktcCB6m5Ry1
         dmkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=alnv6tG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a0cdc0c000000b0067f99bbc77dsi15876501qvk.302.2023.12.29.08.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Dec 2023 08:49:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=alnv6tG1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rJG3F-0002iH-Ev; Fri, 29 Dec 2023 11:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rJG3B-0002gf-F0; Fri, 29 Dec 2023 11:49:34 -0500
Received: from zproxy2.enst.fr ([2001:660:330f:2::dd])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rJG37-0001MQ-Gr; Fri, 29 Dec 2023 11:49:33 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 6513780833;
 Fri, 29 Dec 2023 17:49:22 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id XH2ZH1jTAg8n; Fri, 29 Dec 2023 17:49:22 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 150EE80819;
 Fri, 29 Dec 2023 17:49:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr 150EE80819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1703868562;
 bh=/UKFgb2Avnn52dEU7mbdgSMnxRmiDdJBuIrXEoI42Ro=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=alnv6tG1ZVNp+J4B7hvqKhhTGKAGbXk6lBa4tBW6olouBamiDdBvNrOmh7nrMJgoM
 YRg0MbuFHq+CNO/m5aTRPprwO55ie/zfImtl4MFFWWg96dcLRYuLeEkxIqL9W3wWLp
 Xi3jf8GWN2HhPSsP1fb8X2wyZswbLbmXzIHNtEDk=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id 8e1Plht6dVvg; Fri, 29 Dec 2023 17:49:22 +0100 (CET)
Received: from inesv-Inspiron-3501.lan (176-138-236-114.abo.bbox.fr
 [176.138.236.114])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id D401A8082A;
 Fri, 29 Dec 2023 17:49:21 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 3/3] hw/arm: Connect STM32L4x5 SYSCFG to STM32L4x5 SoC
Date: Fri, 29 Dec 2023 17:47:11 +0100
Message-ID: <20231229164915.133199-4-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229164915.133199-1-ines.varhol@telecom-paris.fr>
References: <20231229164915.133199-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dd;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wKjWWENwKZhm

The SYSCFG input GPIOs aren't connected yet. When the STM32L4x5 GPIO
device will be implemented, its output GPIOs will be connected to the
SYSCFG input GPIOs.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/stm32l4x5_soc.c         | 23 ++++++++++++++++++++++-
 include/hw/arm/stm32l4x5_soc.h |  2 ++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9c9d5bb541..e7c9470d59 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -458,6 +458,7 @@ config STM32L4X5_SOC
     bool
     select ARM_V7M
     select OR_IRQ
+    select STM32L4X5_SYSCFG
     select STM32L4X5_EXTI
=20
 config XLNX_ZYNQMP_ARM
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index 08b8a4c2ed..0581f4ce30 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -37,6 +37,7 @@
 #define SRAM2_SIZE (32 * KiB)
=20
 #define EXTI_ADDR 0x40010400
+#define SYSCFG_ADDR 0x40010000
=20
 #define NUM_EXTI_IRQ 40
 /* Match exti line connections with their CPU IRQ number */
@@ -81,6 +82,8 @@ static void stm32l4x5_soc_initfn(Object *obj)
=20
     object_initialize_child(obj, "exti", &s->exti, TYPE_STM32L4X5_EXTI);
=20
+    object_initialize_child(obj, "syscfg", &s->syscfg, TYPE_STM32L4X5_SY=
SCFG);
+
     s->sysclk =3D qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0)=
;
     s->refclk =3D qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0)=
;
 }
@@ -158,6 +161,20 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
         return;
     }
=20
+    /* System configuration controller */
+    dev =3D DEVICE(&s->syscfg);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->syscfg), errp)) {
+        return;
+    }
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, SYSCFG_ADDR);
+    /*
+     * TODO: when the GPIO device is implemented, connect it
+     * to SYCFG using `qdev_connect_gpio_out`, NUM_GPIOS and
+     * GPIO_NUM_PINS.
+     */
+
+    /* EXTI device */
     dev =3D DEVICE(&s->exti);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->exti), errp)) {
         return;
@@ -168,6 +185,11 @@ static void stm32l4x5_soc_realize(DeviceState *dev_s=
oc, Error **errp)
         sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[=
i]));
     }
=20
+    for (i =3D 0; i < 16; i++) {
+        qdev_connect_gpio_out(DEVICE(&s->syscfg), i,
+                              qdev_get_gpio_in(dev, i));
+    }
+
     /* APB1 BUS */
     create_unimplemented_device("TIM2",      0x40000000, 0x400);
     create_unimplemented_device("TIM3",      0x40000400, 0x400);
@@ -205,7 +227,6 @@ static void stm32l4x5_soc_realize(DeviceState *dev_so=
c, Error **errp)
     /* RESERVED:    0x40009800, 0x6800 */
=20
     /* APB2 BUS */
-    create_unimplemented_device("SYSCFG",    0x40010000, 0x30);
     create_unimplemented_device("VREFBUF",   0x40010030, 0x1D0);
     create_unimplemented_device("COMP",      0x40010200, 0x200);
     /* RESERVED:    0x40010800, 0x1400 */
diff --git a/include/hw/arm/stm32l4x5_soc.h b/include/hw/arm/stm32l4x5_so=
c.h
index 6cba566a31..04b1151eed 100644
--- a/include/hw/arm/stm32l4x5_soc.h
+++ b/include/hw/arm/stm32l4x5_soc.h
@@ -28,6 +28,7 @@
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
 #include "hw/arm/armv7m.h"
+#include "hw/misc/stm32l4x5_syscfg.h"
 #include "hw/misc/stm32l4x5_exti.h"
 #include "qom/object.h"
=20
@@ -43,6 +44,7 @@ struct Stm32l4x5SocState {
     ARMv7MState armv7m;
=20
     Stm32l4x5ExtiState exti;
+    Stm32l4x5SyscfgState syscfg;
=20
     MemoryRegion sram1;
     MemoryRegion sram2;
--=20
2.43.0

