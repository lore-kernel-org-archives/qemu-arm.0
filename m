Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1885136lft;
        Wed, 22 Jun 2022 03:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vF/J0+2mW/ecxjVm39F8Whm4oNVLgv/A+XF7ptwP0V0ZcZwZmC7kXnhO9m6a8LagGpJ81Q
X-Received: by 2002:a05:6214:4015:b0:470:5642:60b4 with SMTP id kd21-20020a056214401500b00470564260b4mr5415080qvb.82.1655892951601;
        Wed, 22 Jun 2022 03:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655892951; cv=none;
        d=google.com; s=arc-20160816;
        b=S+O5QCtWA1oLaqhmpIceb1HKJk2jOtPPueF0XfD8jDNp7BJxiaRthrzfDse3ZOMXG+
         pIt0jRE7qG2EaaZ1L040o1sEZCpGhibwxYHtH7la9wP5Ue/M/fG3r7Dtb3HHCYcsJMB+
         spvwYSh2yR5IBbqThdteWpYSjZ0IEFcFacPuXGw78kogd2WNy7hWcUmW7PchmzM8zjes
         U8dVMWW7q2brC6Qoq00jOthxJR2djKj2LyMo4FJAAsRyXt+CPRcAWxHtc2yOznE2iZBX
         WKzrTNerTzCRG1gRxjgzVqiQsOg51Dlb++lqidfyp2gcJDvxpGUr1IWEBEPj2gBKz22O
         bloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=fuLqZed5dNzepEhp7QmgidzXbrrzNOTPuZNRMnwCb7Y=;
        b=ApqS6qI4LCANgwkUdtvBcQQTJZRcTonyT2ywOWWrC4LA64Fbzu3+cuOyFoljIi6Hio
         J2VWHkvQQylpQZKG3OrTZV7Ro3odhqLqjST/40UuI0VhVzJxi54rpriRAEYABKuMOwQx
         WdhcUhEGL125Y1effaC1NCexi0a/EE+QgNo8wd87rnXdYeoGTzlEUu14qxk0RNiGu0Z1
         yKhszyrICNrXKDuK+9cej8aS6Nss31XbRoQIe7nh+WpBsWF8MM3Sx2X1mFb5mbo+kIQX
         9T+9IjYmL1GQ4HTGzSUlePyWADt4sEPAE8IpDvMdvUVJWZ9czo2LVSLKQ+VwJMfUtFOx
         isTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05622a045400b00304d4e7aae5si11900736qtx.162.2022.06.22.03.15.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 03:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3xOp-0007ZD-2I
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 06:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5j-0006j7-1q; Wed, 22 Jun 2022 05:56:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5h-0004pp-18; Wed, 22 Jun 2022 05:56:06 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0L4H2Zz4xZj;
 Wed, 22 Jun 2022 19:56:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf0H5hDhz4xD9;
 Wed, 22 Jun 2022 19:55:59 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/19] aspeed: Add I2C buses to AST1030 model
Date: Wed, 22 Jun 2022 11:55:15 +0200
Message-Id: <20220622095520.3683321-15-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: i7uWBOgXZ1y3

From: Troy Lee <troy_lee@aspeedtech.com>

Instantiate the I2C buses in AST1030 model and create two slave device
for ast1030-evb.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
[ clg : - adapted to current AST1030 upstream models
        - changed AST2600 to AST1030 in comment
        - fixed typo in commit log ]
Message-Id: <20220324100439.478317-3-troy_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c         | 13 +++++++++++++
 hw/arm/aspeed_ast10x0.c | 18 ++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c49772e2eb59..a06f7c1b62a9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1397,6 +1397,18 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
                        AST1030_INTERNAL_FLASH_SIZE);
 }
 
+static void ast1030_evb_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* U10 24C08 connects to SDA/SCL Groupt 1 by default */
+    uint8_t *eeprom_buf = g_malloc0(32 * 1024);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50, eeprom_buf);
+
+    /* U11 LM75 connects to SDA/SCL Group 2 by default */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4d);
+}
+
 static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
                                                           void *data)
 {
@@ -1408,6 +1420,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->hw_strap1 = 0;
     amc->hw_strap2 = 0;
     mc->init = aspeed_minibmc_machine_init;
+    amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
     mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
     amc->fmc_model = "sst25vf032b";
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index d53454168403..5df480a21f39 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -114,6 +114,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-strap1");
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-strap2");
 
+    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
+    object_initialize_child(obj, "i2c", &s->i2c, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -188,6 +191,21 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
+    /* I2C */
+
+    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(&s->sram),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I2C] + i);
+        /* The AST1030 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
+    }
+
     /* LPC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
-- 
2.35.3

