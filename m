Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5183090ejb;
        Tue, 7 Feb 2023 02:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZyJP/4+hK5lrAduI5VzbQsurv0WSyCXLFND1Ac08NBApwHPjbFWC8RfH4PNmspcQTqN3G
X-Received: by 2002:a05:6214:21e3:b0:538:3980:88aa with SMTP id p3-20020a05621421e300b00538398088aamr3420801qvj.41.1675764650651;
        Tue, 07 Feb 2023 02:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764650; cv=none;
        d=google.com; s=arc-20160816;
        b=EiOVVc2h+1/qTtq+uVXTPpmWZepnKkGUcHtwPIuizCZsxkbSYBjU2mnGydFy36GzoA
         hBSdb44jcDuyD/ZCx3r/z6ObrjA497UiS6g7dV4wJOZfIhPwwDJxJoCg0048JuflWBYG
         2+Jk5I1q6Yw+yKHm44RK6bhYknfF12QJVVEGezQk9QVpli3h2iqPIRruKYjQ5CPcImRW
         VvFZrRDJm7MiBxoKTLOuZPWsmMwDRCJ0c7CWKWLIW7mPjpI4Vp7JqvFne0/1Y3xIneDP
         IL/a8anseilO4Nv1G0388ShSIMeoHi9txGtaOK/2gPIXCfX+70mVUaVRl+Q62lGd51kO
         Y2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=AcP34+jLPW5ZQbcDqM9A0Ev+J0+e6R4vwD2JI6xx8oc=;
        b=INGnw5TGoKCvc9Q+8WxvAtVIHcL1/zmYCdgl0OzWlKO4Wl4w07dVmJbG877ccWULIc
         WSkLwLQeGib8El7cXEYrZlPSxL0BvaFruXusYXqiuhOVAOdWrRuite6nYTh6IzR2ury/
         VnCJ+FgU8F79TcZ5lAOZVSJJYEd4pYBdQTdMx7b6Ml5zASLZt91tEhQg+KzU2DPW/0Zr
         bdD/GbA4y5//YPuj3/rruFgF/DrL9sDezLBiWgDd7lz0DHUmYJ14BbMUOExjvci1KRNH
         hlKJ7mxCM/0K6fzUkx2iqiND4GqMDcs0hZAQTQWD6s69an+G25SzaSk65IsUWh+Np7fX
         F2gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id es5-20020a056214192500b00531f3832177si9051021qvb.307.2023.02.07.02.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuE-0000n5-IG; Tue, 07 Feb 2023 05:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKto-0000Ub-KQ; Tue, 07 Feb 2023 05:08:33 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtm-0002Rz-1w; Tue, 07 Feb 2023 05:08:28 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNQ2cyrz4xwl;
 Tue,  7 Feb 2023 21:08:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNM5zxVz4xyB;
 Tue,  7 Feb 2023 21:08:19 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Corey Minyard <cminyard@mvista.com>
Subject: [PULL 11/25] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Date: Tue,  7 Feb 2023 11:07:30 +0100
Message-Id: <20230207100744.698694-12-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Gc+iRujm2T3U

From: Peter Delevoryas <peter@pjd.dev>

aspeed_eeprom_init is an exact copy of at24c_eeprom_init, not needed.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Link: https://lore.kernel.org/r/20230128060543.95582-3-peter@pjd.dev
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 52 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8a84249525..ed2268e1dd 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -670,15 +670,6 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
 }
 
-static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-{
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
-}
-
 static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -711,7 +702,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
     I2CSlave *i2c_mux;
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
 
     create_pca9552(soc, 3, 0x61);
 
@@ -724,9 +715,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4a);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
     create_pca9552(soc, 4, 0x60);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
@@ -737,8 +728,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 5, 0x61);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x48);
@@ -748,10 +739,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4b);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
 
     create_pca9552(soc, 7, 0x30);
     create_pca9552(soc, 7, 0x31);
@@ -764,15 +755,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x4a);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
     create_pca9552(soc, 8, 0x60);
     create_pca9552(soc, 8, 0x61);
     /* Bus 8: ucd90320@11 */
@@ -781,11 +772,11 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
                      0x48);
@@ -793,18 +784,18 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x49);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
     create_pca9552(soc, 11, 0x60);
 
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
     create_pca9552(soc, 13, 0x60);
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
     create_pca9552(soc, 14, 0x60);
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
     create_pca9552(soc, 15, 0x60);
 }
 
@@ -848,45 +839,45 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
 
-    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
 
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
-    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
 
     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
 
     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
 
-    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
 
-    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
 
     for (int i = 0; i < 8; i++) {
-        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
+        at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
         i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
         i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
         i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
@@ -957,11 +948,11 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
     i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
 
-    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
-    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
+    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
+    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
 
     /*
      * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
-- 
2.39.1

