Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp22306ejc;
        Tue, 17 Jan 2023 15:25:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKLSYJ77tUBqAzwSeMqRZ3zfySPd88IG/H3ZcxrrOkzjBHgwMKonTsNwonBNcDVWZLCBXY
X-Received: by 2002:a05:6214:3019:b0:535:1b57:ba73 with SMTP id ke25-20020a056214301900b005351b57ba73mr8995579qvb.15.1673997931918;
        Tue, 17 Jan 2023 15:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673997931; cv=none;
        d=google.com; s=arc-20160816;
        b=PSvOwQUFgdW8JghRbtU+zmIH1jcwUGDj3tp7irctEXz4a37jhU3KtniVrOuAfk7zYH
         C+tBmQhCUq5H0J1JsQ+P8NBenoClc3Gi53YuJTKjiWOtzlyUYvLWCSjk2yi2BKJn6tZ6
         U6dmyUkQ9y0C2Mc1bVj0c5M4ZQUWvkdX1KwmauBNOgYBcGw6EG4mmipoE9ynJYvui3nJ
         EcUieqvAjrp1nSk9wMdbRQLrXaNXjI0fsBkxaxpO7urMm3FBNb8pmZtNXX4MSJBZtcq2
         XXq99Pjp2onisCOCDIUuKplN7S+DcUcsRx4Wq0I9B4x48EN71CmjnJ5gt0DCX/wBc9bh
         15cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=ofaXfImEiOQCV2r0VtYBVI67gaLPBOLHe0I07YVe5YU=;
        b=qlbo0GOe4zZ1LKDkcV30gO+qkhDx2pEZA9qhGJ4mUGIIeDNC0IFSoKquQPjmrqQ6j9
         LqdcQjmcJiLXFc5CkP2EBDFPyrU4QugmSgYXsfmTHijOYyXMgqGg8typuYl7RnRwf1bd
         SK8npkTsEE5dhtAK2TCdOPGBXmZNGiepMpSaTVZMKH4T55kqx3pev0u5wRGF/gBUtmYB
         +EehKg4UEzMqMXLHybUVAXViKkE5XPxpjioirCWnfkuQHlMFPRge4oqnFqHz5mCt200+
         aSDJ0PqsnxG11GXbGyWJB6nYlvJHcFMqwcCYWexQmANIZuZboqTpbgREU8yHGOz+F/SE
         BH4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=eqBxv2Gu;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="k/Hxx5B7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo7-20020a056214500700b004f1f44e9856si20315515qvb.343.2023.01.17.15.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 15:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=eqBxv2Gu;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="k/Hxx5B7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvJw-0001z9-26; Tue, 17 Jan 2023 18:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJt-0001y6-Vn; Tue, 17 Jan 2023 18:24:46 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJp-0003Jh-H1; Tue, 17 Jan 2023 18:24:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 190225C014B;
 Tue, 17 Jan 2023 18:24:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 17 Jan 2023 18:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673997875; x=
 1674084275; bh=ofaXfImEiOQCV2r0VtYBVI67gaLPBOLHe0I07YVe5YU=; b=e
 qBxv2GuUfXuTFS03jCpASYbC7aAU7lJTrbJ5gze+ZyAjclfSxOxqEBaekjRhebF3
 XobaAFnyGTKmrS1iIkVZCjHVfbh5WcBhnjZKlwKnnxXMcBovXpphrdt4hRTnIU74
 muilMV9+QreQu1kSDN1K3Y2ErTdt1sz4GddsmDtYY4x7MHx7DFhw8/Aq9i9PjdWe
 6EHxeeXfmMz/zKqZu3ToJIk1McOS7xuASks7Do1NM9iZxlk97b7p/S7/yx7MlD+2
 gQm9uY+nHsqh1B9W+OdxJkx+iD7m9ro8nK49nHyBkC+zv2kPBGj/adR6gcillkIW
 lWKNXPACxz5pFUo1l62YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673997875; x=
 1674084275; bh=ofaXfImEiOQCV2r0VtYBVI67gaLPBOLHe0I07YVe5YU=; b=k
 /Hxx5B7Tu5nmfX/hxrbrNlWzIkmvGTD9VUnyRfHVTGn18lyt23YO0RvzSyVTUoDm
 nua/Vm9QichrYoSoiIftxI2fXcyEZSgQwYWxrxpgiIQvu32texyAlDodQ/Yx8GBv
 aD3uERDFpZzhM8/3dsPoJhrjcsW6R+mFIbBbwS+eYvmxX5ob1lIrgLdccihJpYa4
 n22d/W3TyFQINci/AE9rYjpqvdWeiEAlwCKOj2iPsR2ZpNf6k+Dw/btDOoL+BwOR
 ZFaSUs51Cx/fL2NQcC4IYGe9od8mINiwCGS/27KylLwOmmTGO76Q2COmjvWYor2c
 xFhJS0n3eMA/htcVMuCtg==
X-ME-Sender: <xms:Mi7HY4VVmnwJBmmu7WNI49XlBpZmBS9A3D_xiC5hi_Dqg2Axckh1rA>
 <xme:Mi7HY8kDHiuYaUxlBurDgzVBSo7df4vZvLryhETY6UxBenBSy-TbqT7FAukvTIfNz
 lUcXURzcgpL_PiGdl0>
X-ME-Received: <xmr:Mi7HY8aK2hWCwn3nQrri2KXiYQ_t8mJGbppqoUCJaYRe8lcWfX9Enmb21itelFjk8zpRWqhgkhz9U8zz6MHP4dkNj5BwXrZ5b7QFesYOWOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvhfevvefhtddvueevudelvedt
 ieehvdejjeeuvedtudegjeeileetheekgfeggeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:Mi7HY3VmJo7_BQ7YuVL_oW3JRgEqIEUkmcWFNfrgH_TTSx_0itXapA>
 <xmx:Mi7HYymChizMEpcSCAtxdoz5ZCSnvFgj16dkam4LTR0mWYUIQF2pfw>
 <xmx:Mi7HY8fd6Noluas2hE1Hm7KqFh3oGmnWbHL2D0TAwNyLU4hgjOksCQ>
 <xmx:My7HY86w-ZpvKUEOoBZMQ4fxWbKbJBCOkkyDtURf3cEN7UnTHtCO7w>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:33 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 1/5] hw/arm: Extract at24c_eeprom_init helper from Aspeed
 and Nuvoton boards
Date: Tue, 17 Jan 2023 15:24:23 -0800
Message-Id: <20230117232427.74496-2-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117232427.74496-1-peter@pjd.dev>
References: <20230117232427.74496-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xYWk5Zmf1myZ

This helper is useful in board initialization because lets users initialize and
realize an EEPROM on an I2C bus with a single function call.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c                 | 10 +---------
 hw/arm/npcm7xx_boards.c         | 20 +++++---------------
 hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
 include/hw/nvram/eeprom_at24c.h | 23 +++++++++++++++++++++++
 4 files changed, 41 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef729f..1f9799d4321e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -17,6 +17,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/sensor/tmp105.h"
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
@@ -429,15 +430,6 @@ static void aspeed_machine_init(MachineState *machine)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
-static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-{
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
-}
-
 static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 6bc6f5d2fe29..9b31207a06e9 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -21,6 +21,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -140,17 +141,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
-{
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
-}
-
 static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
                                       NPCM7xxState *soc, const int *fan_counts)
 {
@@ -253,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 0x55, 8192);
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 0x55, 8192);
 
     /*
      * i2c-11:
@@ -360,7 +350,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
 
-    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192); /* mbfru */
 
     i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
                                       TYPE_PCA9548, 0x77);
@@ -371,7 +361,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
 
-    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192); /* bmcfru */
 
     /* TODO: Add remaining i2c devices. */
 }
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 2d4d8b952f38..98857e3626b9 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "hw/i2c/i2c.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sysemu/block-backend.h"
@@ -128,6 +129,17 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
     return 0;
 }
 
+I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
+{
+    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rom_size);
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+
+    return i2c_dev;
+}
+
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
 {
     EEPROMState *ee = AT24C_EE(dev);
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
new file mode 100644
index 000000000000..196db309d451
--- /dev/null
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#ifndef EEPROM_AT24C_H
+#define EEPROM_AT24C_H
+
+#include "hw/i2c/i2c.h"
+
+/*
+ * Create and realize an AT24C EEPROM device on the heap.
+ * @bus: I2C bus to put it on
+ * @address: I2C address of the EEPROM slave when put on a bus
+ * @rom_size: size of the EEPROM
+ *
+ * Create the device state structure, initialize it, put it on the specified
+ * @bus, and drop the reference to it (the device is realized).
+ */
+I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+
+#endif
-- 
2.39.0

