Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1032213lfh;
        Wed, 25 May 2022 09:20:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx+BPRdJveQZxKRrQ1HAiRh4slHsuOay4xHXs8flVZDPcDJnEgaGonCcIWH4Chk41amyQE
X-Received: by 2002:a05:6214:518c:b0:461:d27c:26b8 with SMTP id kl12-20020a056214518c00b00461d27c26b8mr26893589qvb.124.1653495606062;
        Wed, 25 May 2022 09:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495606; cv=none;
        d=google.com; s=arc-20160816;
        b=pANv5jwdfBwfqti/q9tPnKm6PlMp+nOMAJekdZnr4jhU8/Ui3XN+bESfblNQo3r1Wx
         x8KUmY3fYn5He6SYU3eNcB6r6OWA6stH1VgLHVgnfFVqq4S3tYbWtoGdDbvJPSfm38JS
         F4Wkd+xFHLewuO5wGaAH8Y9VbVai0M8maA5evgDz9xYTZk9iCOyEOEd3/mfV5Lwpx2JR
         K1KpLEABARcceZtgIViWwNqPXIhhCpex8X9eryF4eeudI3fk8oLl2GQEaLqcadl/UZMz
         pCZdKJPvWF/JbzcNA38FuQ7CaZ5wxwiMtqTE88ZS20GNfX9OVjHrmA42mki2KXraodbG
         1pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=jDesIX4wyHpLt7oax/HCrBUNtoINsmySm0loxow1OCw=;
        b=E2lIhOVjR1xg9UxHoOgJRpKv/oJYwxf1MVrDBPB8Kb6B2VOzUjbY23iGx4Voic5A6c
         LxXSV+ExDP/+E7kpdxv+/qz5/l+teFC5kTCnpV8HsgDOCxkTZl91h0tKsrpSm75v5Y7N
         d1UhT0YDbdG1kT1B9rg834oqcuvZljvekipK+yDcRlfkYl/RQ1IB+ALzNHNG/75+GBMV
         zwHM6sk5HngYH9gE49OzuGyx149GCbgvZVJB4eSsBz65RKL9Gnfw5/vjlFLegYS25Pfz
         Tfo2X87LjtRTZjVgGyqhiuD8IasvupBHcNTFIoNlpntinL2evHLKwZOw/QGth7+KjvhD
         3yhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020a05620a118100b006a33697bc2csi1340670qkk.236.2022.05.25.09.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttjx-0006D6-Fb
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSj-0007Ie-8h; Wed, 25 May 2022 12:02:18 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53757
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSg-0004B6-16; Wed, 25 May 2022 12:02:16 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRl4jsjz4xZv;
 Thu, 26 May 2022 02:02:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRj6JLMz4xDK;
 Thu, 26 May 2022 02:02:09 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/15] hw/gpio: Add ASPEED GPIO model for AST1030
Date: Wed, 25 May 2022 18:01:33 +0200
Message-Id: <20220525160136.556277-13-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5OU80n1yXVhI

From: Jamin Lin <jamin_lin@aspeedtech.com>

AST1030 integrates one set of Parallel GPIO Controller
with maximum 151 control pins, which are 21 groups
(A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
S5 S6 S7 ) and the group T and U are input only.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220525053444.27228-3-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 11 +++++++++++
 hw/gpio/aspeed_gpio.c   | 27 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 938615d55f4a..d53454168403 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -136,6 +136,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
     }
+
+    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
+    object_initialize_child(obj, "gpio", &s->gpio, typename);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -281,6 +284,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
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
index 4620ea8e8b83..5138fe812b9e 100644
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
2.35.3

