Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp678552lfh;
        Tue, 24 May 2022 22:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk73DTO8EUovAxM2EFLuXVFyEnps2W9L0UhOnozm+8vSD9Xn1wCigastKrSRxoilv8qxjc
X-Received: by 2002:ad4:5bc1:0:b0:42c:37be:6ac3 with SMTP id t1-20020ad45bc1000000b0042c37be6ac3mr24028841qvt.18.1653457003488;
        Tue, 24 May 2022 22:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653457003; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0MKIq8uQxL0IEdEnmrsjGmeVrCY9nfvnu9pTJSrYN6QCRFbQr1w35Yv8lD2gePrQ2
         P4feBuXJdNawUFzjmpRn3ngxAfwXFHo3Tf4w3muI8LXya91SU1hvXz6Yk0jOeB6qtMiG
         lYpToUxTotsSclwQ5ixZImwyGhE5/iEDmUpNdpPa6kSqr6nvDgC6/+AbYUJQvwuO21Yr
         Kr6Mcoun/4oTKYrd431fUBfHAclwVRYS7SdBRF4KElH6eui2kn9nczYBWHLmqF97POhj
         BEcOoo7IpwbKhXBog4pKg8z3WO8LnZuruaBvOc+vD0vL7bUZLdtPulIR2swfcSeEbFhk
         kfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from;
        bh=lZYBAKwwEaPGr1UBnrZuA2M98wbF6ZoEreziECUvPmE=;
        b=hj8EcqY42DDh2DpGpS9dcB71ztfKog/fcR9oB5Phn5Hemy+Hzw7M2uk0kfm5P9pwkr
         8wf+isGq1IXmKzH4m4aWqk85abTTcoAE6AY3PzKUBxj2piM5QqysCkiQpdfTiZQbnuRF
         uQNXwOPJHVIIKT4yIfoQCvbfEfdF/UoBjU7b4oZaEH1SUAw8iqKiEQPYq6d7RysRzCk+
         jGpz4+/LzYDiZLXs8tltBvK+5M7KLOPMsqxWJp979xad85Xjvh/f3uXHEAedQnx6wkQd
         cWiD5muZZlBPXbnDh/+R9v77p0WSTCWM0oOkc7yXhxV9OCjBBF1mQTJhHeyXj+J45q1N
         yDwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05622a180500b002f3abdf6661si672551qtc.444.2022.05.24.22.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 22:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntjhK-0000v7-Un
	for alex.bennee@linaro.org; Wed, 25 May 2022 01:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgK-0000km-6V; Wed, 25 May 2022 01:35:40 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgH-0003tW-2o; Wed, 25 May 2022 01:35:38 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24P5Khsg022845;
 Wed, 25 May 2022 13:20:43 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.123) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 May
 2022 13:34:47 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 2/4] hw/gpio: Add ASPEED GPIO model for AST1030
Date: Wed, 25 May 2022 13:34:42 +0800
Message-ID: <20220525053444.27228-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
References: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.123]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24P5Khsg022845
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t6SWOIMR0Lm8

AST1030 integrates one set of Parallel GPIO Controller
with maximum 151 control pins, which are 21 groups
(A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
S5 S6 S7 ) and the group T and U are input only.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast10x0.c | 11 +++++++++++
 hw/gpio/aspeed_gpio.c   | 27 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 4271549282..3a6b8122b6 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -113,6 +113,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
     }
+
+    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
+    object_initialize_child(obj, "gpio", &s->gpio, typename);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -260,6 +263,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
     }
+
+    /* GPIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 }
 
 static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 4620ea8e8b..5138fe812b 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -819,6 +819,15 @@ static GPIOSetProperties ast2600_1_8v_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [1] = {0x0000000f,  0x0000000f,  {"18E"} },
 };
 
+static GPIOSetProperties ast1030_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
+    [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
+    [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
+    [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
+    [3] = {0xffffff3f,  0xffffff3f,  {"M", "N", "O", "P"} },
+    [4] = {0xff060c1f,  0x00060c1f,  {"Q", "R", "S", "T"} },
+    [5] = {0x000000ff,  0x00000000,  {"U"} },
+};
+
 static const MemoryRegionOps aspeed_gpio_ops = {
     .read       = aspeed_gpio_read,
     .write      = aspeed_gpio_write,
@@ -971,6 +980,16 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_1_8v_gpios;
 }
 
+static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
+{
+    AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
+
+    agc->props = ast1030_set_props;
+    agc->nr_gpio_pins = 151;
+    agc->nr_gpio_sets = 6;
+    agc->reg_table = aspeed_3_3v_gpios;
+}
+
 static const TypeInfo aspeed_gpio_info = {
     .name           = TYPE_ASPEED_GPIO,
     .parent         = TYPE_SYS_BUS_DEVICE,
@@ -1008,6 +1027,13 @@ static const TypeInfo aspeed_gpio_ast2600_1_8v_info = {
     .instance_init  = aspeed_gpio_init,
 };
 
+static const TypeInfo aspeed_gpio_ast1030_info = {
+    .name           = TYPE_ASPEED_GPIO "-ast1030",
+    .parent         = TYPE_ASPEED_GPIO,
+    .class_init     = aspeed_gpio_1030_class_init,
+    .instance_init  = aspeed_gpio_init,
+};
+
 static void aspeed_gpio_register_types(void)
 {
     type_register_static(&aspeed_gpio_info);
@@ -1015,6 +1041,7 @@ static void aspeed_gpio_register_types(void)
     type_register_static(&aspeed_gpio_ast2500_info);
     type_register_static(&aspeed_gpio_ast2600_3_3v_info);
     type_register_static(&aspeed_gpio_ast2600_1_8v_info);
+    type_register_static(&aspeed_gpio_ast1030_info);
 }
 
 type_init(aspeed_gpio_register_types);
-- 
2.17.1

