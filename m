Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1867164ejb;
        Fri, 10 Feb 2023 05:43:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+zHmRGVv2xDWTZexZUhf0pnYXKCDqEatsiVJMKfewbqP3hP8FYTPP6VHEJsUOhUH51BIwx
X-Received: by 2002:ac8:5e08:0:b0:3b9:beca:8d8b with SMTP id h8-20020ac85e08000000b003b9beca8d8bmr24917272qtx.28.1676036629799;
        Fri, 10 Feb 2023 05:43:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676036629; cv=none;
        d=google.com; s=arc-20160816;
        b=nmnboT3F1302atScBvDMuA3ES0qolOPL7EfIjYfpJAOnWGO9GTzUrdf88ImKE88BJC
         srKq2WEtX6oKQq/QujikLBAHfJ9/v1USueNMD2wWDQtCLSijg8/3WzCNdRBGrVKKveUP
         V3dFh1phstDYy5PXXhOJpR1ezmGcOpfaNIVZQ5d5qvIT5+1Ad2MadvaO1KM4vtt5wBak
         19Zjdd4T6mc/SaZ5uSHLwsUuc+oIM8woID5KJpFWP9hE6J7s2+W36vYe3fvlM33Lfnze
         V/ZB3I3Gwyh5Tj0B6Hjf6+FXZHSbDG++9O9Wa5vXXVFX7O6zS/eUDLRDmeKaLVKrsbBa
         HdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8L7H/6QJCXJg3ajtUMRvItZ/TPKzQzJOf82w8gkPTbs=;
        b=PrUljoJyyAwuXYye4H2nODvSqbe4X02/lVfl5xFOdFqBIr7CvsIYAmbiOuHcqkOO+q
         1X8wX4fKNwf9n90hH5pGP68U4o+tU9kmgN5hXLa7nrDyIt2sBq8ltdPv3lM1TyhyrL16
         6sEBte6ClrxJyWDCk0VdlaNOPbNeOHAVXyw+sgfLIEfLrBj8ye1zsnSSmIPrE+Zz0k3w
         eNTnHaIRbX2Fmk6RzbMTyFJHfJZKiiZJ5uYVtjl0XAotUYPM0FhqRdKdFX5NYXwRfr1r
         N+fUT6lkJpmZq5VD/7WqIkv5qy3msyGSZEPYlyE3FkecICltQDWAGbvN+Hn3vR1zeJMR
         RIcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vt5YUPeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020a05620a298100b007339c51143dsi4017466qkp.697.2023.02.10.05.43.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 05:43:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vt5YUPeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQTgT-0007ek-Bm; Fri, 10 Feb 2023 08:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pQSVP-0000Vo-Ic; Fri, 10 Feb 2023 07:27:55 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pQSVO-0001Xl-1l; Fri, 10 Feb 2023 07:27:55 -0500
Received: by mail-io1-xd2a.google.com with SMTP id j4so1853143iog.8;
 Fri, 10 Feb 2023 04:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8L7H/6QJCXJg3ajtUMRvItZ/TPKzQzJOf82w8gkPTbs=;
 b=Vt5YUPeB0/6FgFau2fouDONMa4s9MIwj+nLCbvZjhrQBVWz1V+BWP5QW5uydnn5jnA
 bC3jOltFH5GGsPlWPcq0PkaWGtMN+Sqaj1eVzIqKloOI+ZCS5VcXvNIMG426CEhtYvYJ
 X7sBNNOHcxwRG5UGT88I9BW8x3Nf3GvtA1FfqpFCt9EnzYJljlfZlE9TIuzreuaceY0S
 1GuQfyow/uvlSfJorg5T8K+3GhWOXpSHGwtYrltM0/ZDuDjfgkg3CNMmZlqvLMTxTm7f
 /QLM0kDuGC00RTNrHOdtgnD2U6+G+9dRn8g8uuCz2ErirJSpDb//FbDN03XrBZq7oEEL
 k7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8L7H/6QJCXJg3ajtUMRvItZ/TPKzQzJOf82w8gkPTbs=;
 b=2Xf9sEsB8YyWt+4ofWe62SCrvZUb36TgZluRKeeXJxQjcavv/Up9LyIan/dST4bwVb
 tlkD3SK30562akiVW85sNeSHh3zGD5W4JvPn6b6CP+0ilbTPRYfk6G1VzAqfXGvKa+lX
 PNXyVtWle7QgVUglBvu6yMro7nQLGHJmVo3dm1/KX580F5Wzibkvp2lzgWi+7P1JAvXW
 yaYDrAaqyV1B10US8JEKvYe+UvL45ObQJG07pAv5bKdq+TTZTQg2YVLIL5Fs8qHy2C1r
 1+fB+moBNDPK+CGPTeySUxy+EzFIh/fIXHjpDOPoap8O9P56BMsls77FJjlKUjzujBBT
 5v+Q==
X-Gm-Message-State: AO0yUKW2EJxXz6MCKwlyd42vaskPi5UosA82dySZRDZYmu1OHzyk6aAw
 mUfPVpb0QKJSOiPxZ7UdTeg=
X-Received: by 2002:a5d:8751:0:b0:71b:d76c:fadd with SMTP id
 k17-20020a5d8751000000b0071bd76cfaddmr11024599iol.3.1676032072076; 
 Fri, 10 Feb 2023 04:27:52 -0800 (PST)
Received: from hcl-ThinkPad-T495.hclt.corp.hcl.in ([192.8.226.44])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a6bcc06000000b00724768be183sm1291523iog.13.2023.02.10.04.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:27:51 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Adding new machine Tiogapass in QEMU
Date: Fri, 10 Feb 2023 17:56:42 +0530
Message-Id: <20230210122641.837614-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Feb 2023 08:43:24 -0500
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
X-TUID: k5G+gdW8DmMs

This patch support tiogapass in QEMU environment.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..279ba60743 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -521,6 +521,14 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
                      TYPE_TMP105, 0x4d);
 }
 
+static void fb_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* The FB board AST2500 compatible with ds1338 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
+}
+
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1174,6 +1182,25 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_tp_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook Tiogapass BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
+    amc->hw_strap2 = 0;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->i2c_init  = fb_bmc_i2c_init;
+    mc->default_ram_size       = 1 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1562,6 +1589,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("tp-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_tp_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.25.1

