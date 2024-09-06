Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp61918njb;
        Fri, 6 Sep 2024 05:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTxoq3aIHt6qxPRvYjQjQo3ep0xM1XgNHTj7ucTS5JpaGTzzUpiqoINlPVgUnEOpRRbKon4vIcOe7mRA==@linaro.org
X-Google-Smtp-Source: AGHT+IHLuU9/E2Plhj8BJTnA1T1h1iLPavO69pahpD5QHT7N3N3LUCG8zhy9J5VU4ZYgn/3LyJZt
X-Received: by 2002:a05:620a:45a2:b0:7a9:868a:3ab3 with SMTP id af79cd13be357-7a997321cd8mr317719985a.13.1725626144571;
        Fri, 06 Sep 2024 05:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725626144; cv=none;
        d=google.com; s=arc-20240605;
        b=azjN8ZgVoBf9F+prhRS0G/GFJCg1vlNI+6qSGg9O0thwL3oVgPa9vh6pk/ECH6w0FC
         Wravfom0ZgRRCeXx5WtQraZZfgNEwBRAAOQxkXgRyfTSW+4hs6hX650N5OMEPvF8PAsv
         hSnwNLQw0ukV+TjTraz6jN/PvLRAv8JBsnSs/qdH8q/vAhFNvmNeNbGHWvBbvlpinOs8
         Kk/1BmZ9ylmnhBxAlYef704H0n2TT0JweE6yi6OfBNdVqcoBdwDqD5a0EKYc1KZwEfto
         ANhFT35jR0rDU1bX1AHU5/sIwGDgM/XwebLRYurtEKu/grwdlXPvbLCfnqLsPamYjFfd
         hT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GVVkZzwkzUs6gDsLPFI57UR7P7EQchhmcx5HHq82jrU=;
        fh=mVAPaaM6E1ekxUjUKawZYYneF57fDZJ17nYilhcWE/o=;
        b=dRcyAMDvrtRfcMzo9rwW/PiHch3O+l1s+h0po7fa/SlXiRx0T9MI1FDNDuPxxJM17j
         k01NjvVgoUr47Z3Y4vhJhk8n2a1BhgdYs+KFVlYT1JzDVWhyURqNgRzjBD0HWFSFWxm4
         iBcD84VC8euiqeFR0oVx1V0jLptrYX9/VIzOZofcnTDHzAV77wRIHAhR9Yuvhzd0G4c7
         jWR2+CqQmkEAI9oyIqUZY0Kgp+JXbrqlzj9H2EmP1JXs/l0uAOQi208WgFFmS+JxZmCJ
         9SRaJz1u2wXBfEaHmTRDD1Eal+qwBATOQNQu2bb3NdmKxb4UCP7TvFpIm10fTfAAaCtg
         kzMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=JDBnhZua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a106a6a4si18581785a.285.2024.09.06.05.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 05:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=JDBnhZua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smYBJ-0001SM-Jg; Fri, 06 Sep 2024 08:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1smYBG-0001Dn-IW; Fri, 06 Sep 2024 08:35:14 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1smYBE-00034y-BF; Fri, 06 Sep 2024 08:35:14 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7178cab62e6so1683277b3a.2; 
 Fri, 06 Sep 2024 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725626110; x=1726230910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=GVVkZzwkzUs6gDsLPFI57UR7P7EQchhmcx5HHq82jrU=;
 b=JDBnhZua/dhTB9pp+7lJ60skLsF7np1MqOR/Ql3D6Pa4IKi2EuQOzjdHX17++X92ou
 CffblhqV0J5UROMcepsO6dC0jasV/LJFNij5OiW8V4Wjgs1MO7WBViKzn+1A+ORpc29B
 p1rts6HYD+3njgQ01oL3s8gF54JNTulFhKzWQ2+iyWiJiXWlK70GBRcSdr0V748tSgKs
 W2S7rFGZmCie5gCWJ5aGJAvxTF2BgUdaMPYSqe5tbagrFObZzRhuTu0XLlT0tuKXGuWD
 pfu4UFJpxNKQqPtwEXxRiM3FP6k2eNqGHy68Hkup61rdFXJRcrCL9DsQ4ySFbIwrQgN5
 6xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725626110; x=1726230910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVVkZzwkzUs6gDsLPFI57UR7P7EQchhmcx5HHq82jrU=;
 b=HHofnF8K333QXNTcQLBkx1Dh42rpa1mKCwXQcdrDcKKtYBjfiEYSr2VX4UZsg3oHDp
 36i74NZMM+n0VH3kmpeFY0DVO/yVvFLJu3D0VcbI2STVxuqjdLiets0dgDOg1FDiHW1A
 ym3CRv0vmvOq7eW7KhXDOkv2avYLLoDRFpVr9HqzSuinY9t7ulkGvfOrejnGgaOjNOyG
 3LReo6rgw4JqVk4bfzlT9KuL6dWweiuZ9Png1rupbfdU46NtQCfjsjLKKELIGcPdqUW/
 wNUmlChN4jKlYcIx4XRtUnF/XPn+4D4Txn2pCGVUiiVe8wQE6dVzu+kr5ahIOokXFroN
 Lisw==
X-Gm-Message-State: AOJu0Yxqax5y+vl29ZB2rx+FtLn2fW/pGRie6S4qbIsaqDwbEPGouxVC
 S9vgg4JYs0o8Phu6oZSWa6g3ApYggDea1WNRudWaUEwUK5HuADcXIxwKuA==
X-Received: by 2002:a05:6a00:6f6a:b0:70e:8d38:2845 with SMTP id
 d2e1a72fcca58-718d5ded075mr2603514b3a.1.1725626109738; 
 Fri, 06 Sep 2024 05:35:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-717785b4b4bsm4752170b3a.199.2024.09.06.05.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:35:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] aspeed: Add support for IBM Bonnell
Date: Fri,  6 Sep 2024 05:35:05 -0700
Message-ID: <20240906123505.3818154-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RaRRsteb6Sz3

Introduce support for the IBM Bonnell BMC.

Use Rainier machine information for HW strapping and other machine details
since the actual hardware configuration is unknown. I2C device
instantiation is based on the devicetree file in the upstream Linux kernel.

Major difference to Rainier is that the Bonnell devicetree file
instantiates a TPM. It is therefore possible to test TPM functionality
without having to instantiate the TPM manually from the Linux command
line.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/aspeed.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index fd5603f7aa..4f833c5708 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -865,6 +865,70 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 15, 0x60);
 }
 
+static void bonnell_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = bmc->soc;
+    I2CBus *bus;
+
+    bus = aspeed_i2c_get_bus(&soc->i2c, 0);
+
+    at24c_eeprom_init(bus, 0x51, 8 * KiB);      /* atmel,24c64 */
+    /* tca9554@11:20 */
+    i2c_slave_create_simple(bus, "pca9554", 0x20);
+
+    /* ucd90160@2:64 */
+
+    /* fsg032@3:5a */
+    /* fsg032@3:5b */
+
+    bus = aspeed_i2c_get_bus(&soc->i2c, 7);
+
+    /* si7020@7:40 */
+
+    /* Bonnell expects a TMP275 but a TMP105 is compatible */
+    i2c_slave_create_simple(bus, TYPE_TMP105, 0x48);
+    at24c_eeprom_init(bus, 0x50, 8 * KiB);      /* atmel,24c64 */
+    at24c_eeprom_init(bus, 0x51, 8 * KiB);      /* atmel,24c64 */
+    i2c_slave_create_simple(bus, "max31785", 0x52);
+
+    /* pca9551; assume/hope pca9552 is compatible enough */
+    create_pca9552(soc, 7, 0x60);
+
+    /* ibm,op-panel@7:62 */
+    /* dps310@7:76 */
+
+    bus = aspeed_i2c_get_bus(&soc->i2c, 8);
+
+    /* rx8900@8:32 */
+
+    /* Bonnell expects a TMP275 but a TMP105 is compatible */
+    i2c_slave_create_simple(bus, TYPE_TMP105, 0x48);
+    at24c_eeprom_init(bus, 0x51, 16 * KiB);      /* atmel,24c128 */
+
+    /* pca9551@8:60 */
+    create_pca9552(soc, 8, 0x60);
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
+
+    bus = aspeed_i2c_get_bus(&soc->i2c, 11);
+
+    /* tca9554@11:20 */
+    i2c_slave_create_simple(bus, "pca9554", 0x20);
+    i2c_slave_create_simple(bus, "tmp423", 0x4c);
+    /* pca9849@11:75 */
+    i2c_slave_create_simple(bus, "pca9546", 0x75);
+
+    /* npct75x@12:2e (tpm) */
+
+    /* atmel,24c64 */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 12), 0x50, 8 * KiB);
+
+    /* atmel,24c64 */
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 8 * KiB);
+    /* pca9551@13:60 */
+    create_pca9552(soc, 13, 0x60);
+}
+
 static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
                                  I2CBus **channels)
 {
@@ -1488,6 +1552,25 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
     aspeed_machine_ast2600_class_emmc_init(oc);
 };
 
+static void aspeed_machine_bonnell_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "IBM Bonnell BMC (Cortex-A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = RAINIER_BMC_HW_STRAP1;
+    amc->hw_strap2 = RAINIER_BMC_HW_STRAP2;
+    amc->fmc_model = "mx66l1g45g";
+    amc->spi_model = "mx66l1g45g";
+    amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->i2c_init  = bonnell_bmc_i2c_init;
+    mc->default_ram_size = 1 * GiB;
+    aspeed_machine_class_init_cpus_defaults(mc);
+    aspeed_machine_ast2600_class_emmc_init(oc);
+};
+
 #define FUJI_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
 
 static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
@@ -1776,6 +1859,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_rainier_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("bonnell-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_bonnell_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("fuji-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.45.2

