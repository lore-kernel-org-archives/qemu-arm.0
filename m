Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4389736lfm;
        Sun, 5 Jul 2020 15:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMcLYGX/LUzk7CxOD1AYCpKR/NupC6ev/WX3HQ94UdV2KdyC5pH2NEPY+P2slQtrY7tkfX
X-Received: by 2002:a25:a408:: with SMTP id f8mr67874208ybi.145.1593989008712;
        Sun, 05 Jul 2020 15:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593989008; cv=none;
        d=google.com; s=arc-20160816;
        b=i/HmsQTOcA55MPH8AX2ylJITr2EQ2qY7BHhhjJwTWhzgBQRo1ha7BV5FtyGtqVcvrZ
         3KjXcCoK2Laf/DS2tamPOtceR7NGcQqoqFItW1P7KBmeaasMOVS7FnGxZlOPyI5PEwBx
         TXpUkdVCiG5TWTJmEl+1cZsVY6k2vaSl2T/mLCQKAXnI1D9tLxxoC5mL53iIhy/gxS0D
         BLUhI0DP6FyljcHeUTNpPQvY40rW+RTdLmRzUlEJsrZbqKNmHMAYqrhz/llQQnjWRK1b
         GSu9krp0bIW9cbovkdvKoyUmRzBOoukcRO89dOG/HjVT00lMwMhEGNqc2uhIKyd0Ar2x
         gAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KJXVJ20Xc29x5zy30LKvYKgkRIGdu79sUZj2iAxIfIU=;
        b=hIK3Y6GnFLbSWs+0Sl0+L0V9+6Htkj2UL9Hm3ULlo++tphIB4Z7oe3FHikIqOpIF0u
         HyxSDRZaGFM20acePEV/vA8buKKERAaqhHugjGdPHjomxi5JBbuqYlX7FUNF/cfpQnbS
         yrIZfg6IYC9zUIQ9PKKtbz/vKkUiM4wDTSA/DANFrSKw5Zz9vP6c5D01Iw48le3MdE6z
         HsyuGt6S6lHAjGJfxhjtKDpLxtz/Iod2PDNaVVWVfF1yX6dw+OpoYTFv2QKaLDX0/S7Y
         ggFJtrXnuHSycsvj/iokjJ9yunHzVEquL6g9kMjLe+FWVb+sM4zmXQ/NncBfNZw5TsgR
         3BCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=axACWr0x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si18277591ybm.189.2020.07.05.15.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 15:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=axACWr0x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsDM8-0006Iq-1B
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 18:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKl-0004Gl-6F; Sun, 05 Jul 2020 18:42:03 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKj-0002hk-B0; Sun, 05 Jul 2020 18:42:02 -0400
Received: by mail-wr1-x444.google.com with SMTP id s10so38888669wrw.12;
 Sun, 05 Jul 2020 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KJXVJ20Xc29x5zy30LKvYKgkRIGdu79sUZj2iAxIfIU=;
 b=axACWr0xg9raBoHcuXDdr2p8cPavojEtKh3jVCUuylaEtnFauxGfpKn3FPjdbtGUe9
 /rNdvs8Kq2zDZkuLvxrF1KxPuooMsiuBQGdOUBHwqzNWVH5mlxE2w1X84tTcGCMWPX0Q
 obVX1Jf7aEqrH6fqW11bcqmOVWgtL4ZhcmHAPJvgPIXMP//zi7ErwXRa1PZzUYgSyAv7
 Z13keyu7ti/L8BisgeMift0ebkp1cwGnKdxW9qQb4erijE68DaCuLmAc+jvcMh2zYJ2D
 6JBRNrMgdBF+6/TgodBh309ehHy6DkwGPTXbzHQsbhKZGkJ8s2jiU+WaQDl2/36qSsTE
 WRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KJXVJ20Xc29x5zy30LKvYKgkRIGdu79sUZj2iAxIfIU=;
 b=gdAYTxlNhB/TI/Rz5FDQWUeyWtHJRWR9SGNzSyT+W78Zvhk+u7EKuP9eAj6k+2NEq9
 SR43K0sG7UI1Gv3kubVhYvP/LBu4A96zi/wWflaXUf+SXmjI7UUbjULsN+e8hhTmhcVI
 4bfMkfNzfvN5uX9gNFOASY7WjZznsB6Poc6ABZGgInPC0ewSgASp9q88xUdC6aNimTvl
 1RUAXsKTgDedXojy0wQualfdaIx1lSCBVFRi5VDiuL8RV7sjzF//n0QXtiitTgEozMmo
 GjRRyETpydPyTkKb0R8ExJi4QtigrbAND/Ci0+U9Nd0FL85YHdJfd/wd8nAjGXLvzkKy
 efBQ==
X-Gm-Message-State: AOAM530zet0UYvTsc2gMstuJCCULkLMrN/2/UbR9gEUXDAI+B7vvP1no
 tkp/DZHJLb/ET0s49KH8WMq5ZtJ941Y=
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr44957503wru.418.1593988919095; 
 Sun, 05 Jul 2020 15:41:59 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v6sm9151467wrr.85.2020.07.05.15.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 15:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/i2c/aspeed_i2c: Simplify aspeed_i2c_get_bus()
Date: Mon,  6 Jul 2020 00:41:50 +0200
Message-Id: <20200705224154.16917-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200705224154.16917-1-f4bug@amsat.org>
References: <20200705224154.16917-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DxQzqRpAej/g

All the callers of aspeed_i2c_get_bus() have a AspeedI2CState and
cast it to a DeviceState with DEVICE(), then aspeed_i2c_get_bus()
cast the DeviceState to an AspeedI2CState with ASPEED_I2C()...

Simplify aspeed_i2c_get_bus() callers by using AspeedI2CState
argument.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/aspeed_i2c.h |  2 +-
 hw/arm/aspeed.c             | 70 ++++++++++++++++++-------------------
 hw/i2c/aspeed_i2c.c         |  3 +-
 3 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index f1b9e5bf91..243789ae5d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -93,6 +93,6 @@ typedef struct AspeedI2CClass {
 
 } AspeedI2CClass;
 
-I2CBus *aspeed_i2c_get_bus(DeviceState *dev, int busnr);
+I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr);
 
 #endif /* ASPEED_I2C_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 379f9672a5..1285bf82c0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -385,13 +385,13 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* The palmetto platform expects a ds3231 RTC but a ds1338 is
      * enough to provide basic RTC features. Alarms will be missing */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338", 0x68);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 0), "ds1338", 0x68);
 
-    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), 0x50,
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50,
                           eeprom_buf);
 
     /* add a TMP423 temperature sensor */
-    dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
+    dev = i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 2),
                            "tmp423", 0x4c);
     object_property_set_int(OBJECT(dev), 31000, "temperature0", &error_abort);
     object_property_set_int(OBJECT(dev), 28000, "temperature1", &error_abort);
@@ -404,16 +404,16 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
     uint8_t *eeprom_buf = g_malloc0(8 * 1024);
 
-    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), 0x50,
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 3), 0x50,
                           eeprom_buf);
 
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7),
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 7),
                      TYPE_TMP105, 0x4d);
 
     /* The AST2500 EVB does not have an RTC. Let's pretend that one is
      * plugged on the I2C bus header */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
 static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
@@ -428,36 +428,36 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
      * good enough */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
 static void swift_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
 
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552", 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x60);
 
     /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", 0x48);
     /* The swift board expects a pca9551 but a pca9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "pca9552", 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x60);
 
     /* The swift board expects an Epson RX8900 RTC but a ds1338 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "ds1338", 0x32);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
 
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp423", 0x4c);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
     /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "pca9552", 0x74);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552", 0x74);
 
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "tmp423", 0x4c);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
     /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "pca9552",
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552",
                      0x74);
 
     /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105", 0x48);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105", 0x4a);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x4a);
 }
 
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
@@ -465,32 +465,32 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
 
     /* bus 2 : */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2), "tmp105", 0x48);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2), "tmp105", 0x49);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
     /* bus 2 : pca9546 @ 0x73 */
 
     /* bus 3 : pca9548 @ 0x70 */
 
     /* bus 4 : */
     uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
-    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), 0x54,
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54,
                           eeprom4_54);
     /* PCA9539 @ 0x76, but PCA9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "pca9552", 0x76);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552", 0x76);
     /* PCA9539 @ 0x77, but PCA9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "pca9552", 0x77);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552", 0x77);
 
     /* bus 6 : */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), "tmp105", 0x48);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), "tmp105", 0x49);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
     /* bus 6 : pca9546 @ 0x73 */
 
     /* bus 8 : */
     uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
-    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), 0x56,
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x56,
                           eeprom8_56);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x60);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x61);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x61);
     /* bus 8 : adc128d818 @ 0x1d */
     /* bus 8 : adc128d818 @ 0x1f */
 
@@ -515,25 +515,25 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     /* Bus 3: TODO dps310@76 */
     dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
     qdev_prop_set_string(dev, "description", "pca1");
-    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3),
+    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 3),
                           &error_fatal);
 
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423", 0x4c);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423", 0x4c);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
     /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), TYPE_TMP105,
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 9), TYPE_TMP105,
                      0x4a);
 
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
      * good enough */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 
-    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x51,
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
                           eeprom_buf);
     dev = i2c_try_create_slave(TYPE_PCA9552, 0x60);
     qdev_prop_set_string(dev, "description", "pca0");
-    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11),
+    i2c_realize_and_unref(dev, aspeed_i2c_get_bus(&soc->i2c, 11),
                           &error_fatal);
     /* Bus 11: TODO ucd90160@64 */
 }
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index fb973a983d..518a3f5c6f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -959,9 +959,8 @@ static void aspeed_i2c_register_types(void)
 type_init(aspeed_i2c_register_types)
 
 
-I2CBus *aspeed_i2c_get_bus(DeviceState *dev, int busnr)
+I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr)
 {
-    AspeedI2CState *s = ASPEED_I2C(dev);
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
     I2CBus *bus = NULL;
 
-- 
2.21.3

