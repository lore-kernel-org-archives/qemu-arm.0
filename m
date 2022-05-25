Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1034178lfh;
        Wed, 25 May 2022 09:22:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp3axiCBcync77X/dLyz2IMEXzIhjjIUCfP7EtgQxnjboqzjDfan2SEdLV5Q51eagjmS8K
X-Received: by 2002:ac8:5ad0:0:b0:2f9:42d7:65d9 with SMTP id d16-20020ac85ad0000000b002f942d765d9mr7276095qtd.595.1653495757042;
        Wed, 25 May 2022 09:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495757; cv=none;
        d=google.com; s=arc-20160816;
        b=zibBW5p69noyVhPa9ywqynCF2/+6UZg9aY/dJRxgK0HpucKORwnIv5mHCOtHhZf6+k
         boywfOY9/WAsOrd6Tyhp5ndSgl68OZ759vZWaPUTWXYDYMbQeilhSGrwHLt2phr4OnLt
         La2mh+Z01UoiXgngGZTUaB83G8NqIc9a1sCbHnqZ/zWEvtaK6YYe7YZHJ+ExwmgeBybG
         MkCzcYvgOiliJk7Xrnanp77wM/avsWL4qAY/DahPjpfouVFt1k3d2X5JDy+IfJjkvhpW
         L4Mtr7EZq8Y58qm7ksdbWfqJaZwGjquKocvF6yviGVbkzmhV+IL3AchlNQnf4j6daId9
         MS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=KBNZcGmoaPc9I+CeDY83uVbrbicbw5YsSie/efxxHxg=;
        b=QagOIUkV/0jJXJRaxP+AQp1dd0RRsaipV89hXip2CF8J/0waQ4VARkYY/Rddor6QbZ
         KPD7UumZygKOCX6jn0sEnCF38vwITljn5dW94MSp7HJ29eR5h5Akoe+habcWQjeWIlEi
         1WJwYmwAsMSO4iYhxw/6TLVrJ7ugPxeooFrKa9vQ5eVnvjqpxUwUJIFNkhMgFPoIg670
         b0otnwd4kzduJk+cis2kd2a+e6zk2Bpk60XWlnIAD/FjnAW2d3VV4Kw45gGfzwinsVAl
         N/z7pbdjF0cPsriLfcSG0QUMuUJqXeCKXFPNndx5yvHsx2ilGarq/03StDMUutQOgIwl
         BMBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020ac858d6000000b002f3f4a7b78asi1564730qta.783.2022.05.25.09.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttmO-0002e4-G3
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttT7-0008Fz-AK; Wed, 25 May 2022 12:02:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53757
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttT5-0004B6-HX; Wed, 25 May 2022 12:02:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRt3vsrz4ySg;
 Thu, 26 May 2022 02:02:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRr5SjGz4xDK;
 Thu, 26 May 2022 02:02:16 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Howard Chiu <howard_chiu@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 15/15] hw/arm/aspeed: Add i2c devices for AST2600 EVB
Date: Wed, 25 May 2022 18:01:36 +0200
Message-Id: <20220525160136.556277-16-clg@kaod.org>
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
X-TUID: 2JWNZsrxiwfj

From: Howard Chiu <howard_chiu@aspeedtech.com>

Add EEPROM and LM75 temperature sensor according to hardware schematic

Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 725c169488dc..98dc185acd9a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -527,8 +527,15 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
 
 static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
 {
-    /* Start with some devices on our I2C busses */
-    ast2500_evb_i2c_init(bmc);
+    AspeedSoCState *soc = &bmc->soc;
+    uint8_t *eeprom_buf = g_malloc0(8 * 1024);
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50,
+                          eeprom_buf);
+
+    /* LM75 is compatible with TMP105 driver */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
+                     TYPE_TMP105, 0x4d);
 }
 
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
-- 
2.35.3

