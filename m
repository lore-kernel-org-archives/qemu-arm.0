Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3102911lfb;
        Thu, 24 Mar 2022 03:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE4fvhSU/0eNrYIzuaLS66RizY11/sGRyAHBs4m4Tf6ea1myN0uXt0vXOdE6dkhRy5sc3O
X-Received: by 2002:a05:622a:1305:b0:2e1:e697:31e7 with SMTP id v5-20020a05622a130500b002e1e69731e7mr3707484qtk.97.1648116482304;
        Thu, 24 Mar 2022 03:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648116482; cv=none;
        d=google.com; s=arc-20160816;
        b=lLYjWf03WPYOGtz4fCHdZndtt/pZPSnYUnBGgDFMuBL7dVr2sEo5kjfCDN/O0iXjMj
         DfsbO+tMQ78rHlnahNpDWzMbk/AC8s/RZeXIvTRd4h4H8ms+MP/YMdjBPCXRnTFkCZaA
         KPmNbYo4E1Gb4+lf49UAfhoAHzIJYuMdPGK4phNJRsLGWVZjjOfM7n/UWmwIyYkM4cI0
         NHVZL54Ic7lgWc9pALcQQgSrjN9KJ2dzLgvNp/LDgNl1Yn933KG4ApZGi2cVOIvCJCSw
         csW37ZKjquIzN57rRjrYfYHYz9cncU2S/XBmsNYVVm2jl7wqR6V2wy5aSXZ3YepTDo+x
         hftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yZ0tnoPHxrFRXbqlM48IuEJ6melVN+EuH9lvDOmZFVM=;
        b=KObGhdXVuYD8NJxU8rQ19Rf3xSBVDkfDPiDW3b6Odnlltl8d5/3zj1Br75sGIsGRPB
         AkiLSwz3dZt1hgO4JUcnMNc4gPMTQjQaH7Kq6A7TqFtVZH6SPYea/y+0gHtF7Ros+jZv
         qu6mvLxTtSfzh/UH7akkoHrH9owMGs/CGBI3RUQlQKgZwJWrQ2ojNHAhXgj0RSEzoJN6
         830Zf3GPGDhjYbo+6QypguTOoJ/Fh945yjnQUa7oooHOXORDqR8YfnQTwLUpY7LVZAsQ
         ZyZiV8BQe8jEJGNr7TX8SPh92mkijyODHTa9iDHzYQbwRkezh9FEdRylnj+5xF0uqkEg
         LfJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp16-20020a05620a459000b0067e4be2385fsi5386706qkb.164.2022.03.24.03.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 03:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXKNt-0005Yj-Rc
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 06:08:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1nXKLX-0004KB-Vs; Thu, 24 Mar 2022 06:05:37 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1nXKLT-0004ex-Jf; Thu, 24 Mar 2022 06:05:35 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22O9s6XV008967;
 Thu, 24 Mar 2022 17:54:07 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 24 Mar
 2022 18:04:41 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <leetroy@gmail.com>
Subject: [PATCH v1 2/2] aspeed: Add I2C buses to AST1030 model
Date: Thu, 24 Mar 2022 18:04:39 +0800
Message-ID: <20220324100439.478317-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324100439.478317-1-troy_lee@aspeedtech.com>
References: <20220324100439.478317-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22O9s6XV008967
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 05Xc6tcqH/dP

Instanitate the I2C buses in AST1030 model and create two slave device
for ast1030-evb.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast1030.c | 17 +++++++++++++++++
 hw/arm/aspeed_minibmc.c | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/hw/arm/aspeed_ast1030.c b/hw/arm/aspeed_ast1030.c
index fe700d922f..c16bcba7c9 100644
--- a/hw/arm/aspeed_ast1030.c
+++ b/hw/arm/aspeed_ast1030.c
@@ -92,6 +92,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-strap1");
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-strap2");
 
+    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
+    object_initialize_child(obj, "i2c", &s->i2c, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -163,6 +166,20 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
+    /* I2C */
+    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(&s->sram),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I2C] + i);
+        /* The AST2600 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
+    }
+
     /* LPC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
         return;
diff --git a/hw/arm/aspeed_minibmc.c b/hw/arm/aspeed_minibmc.c
index 6a29475919..764df92f65 100644
--- a/hw/arm/aspeed_minibmc.c
+++ b/hw/arm/aspeed_minibmc.c
@@ -37,6 +37,18 @@ struct AspeedMiniBmcMachineState {
 /* Main SYSCLK frequency in Hz (200MHz) */
 #define SYSCLK_FRQ 200000000ULL
 
+static void ast1030_evb_i2c_init(AspeedMiniBmcMachineState *bmc)
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
@@ -47,6 +59,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->soc_name = "ast1030-a1";
     amc->hw_strap1 = 0;
     amc->hw_strap2 = 0;
+    amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
     mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
     amc->fmc_model = "sst25vf032b";
-- 
2.25.1

