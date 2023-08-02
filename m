Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp624609ejb;
        Wed, 2 Aug 2023 14:10:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHToi49TIHsbf5wgQoZSWz9AfSuSU3FF74NxGBsfI2qn6jL3Mpwn4AodzwRPcie2q90/2/G
X-Received: by 2002:a05:620a:4311:b0:765:6524:8458 with SMTP id u17-20020a05620a431100b0076565248458mr19213149qko.36.1691010602443;
        Wed, 02 Aug 2023 14:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691010602; cv=none;
        d=google.com; s=arc-20160816;
        b=CFK2hlNU5jd6xAEqD29kbJeDPHQEUmDLDSl+8DyLZRTM3w+ozyfkB+vfdty8PLxm/C
         Ul3tG+O6A2kJGSy8BnqMItkODI2Dlphe4rTL5O5KEBKkUP5q8MO6+AUFeQWyoc7QJtpi
         gbOJmMmnIQUSFhn7zbVjKqgQvthJDsnV4uT91VjFjdR1DikJwDXR2D4ql5hwJxYjnD3l
         2Zz/ykc9ibOe9VhfScwcMcVud4G1kn0yhDb8W0QQ5VRjeajRX0apZdTi9B6GL0nIgj2Y
         tqGnpXfcIUfsZWu1w6BX19381w2BMdA0yl03QiX6IrNQFMqpr1geQosUt4LSAZV33+K9
         BEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LndHlm1+7qNu0Bkdm6az2jcx4Zy3k4FNX1UwiOY6ihQ=;
        fh=+WBZG3uX9FXOqUEW7dRrAA3LgeoMrjfTvks8rWRkhTI=;
        b=XEGj+aTHZVDbQROT0d6pHKt83/Sr/UZsOmyOtCQviVjRrrBaZ6tPnPjn8hAgpxu1bp
         OSZM4t1SjZlY6aI0Qo8WDQsKraj5tHNZsj/KsX2MqdawT08Tq6XAyGM0iSBC4gaz/okX
         PEbiYwxy8tF6S78o9kQflIgoFVCjiRw3MW70j8MnKsAc2oZnh3d+HbJPWZ5Wecz56cNr
         k5UgJbif51eaVwgZsJf2kZ90hd3qWaPockISlPMOQ4Hx/OljegKX1zKIRCHnb9LKWwce
         N0PvH61D5cDiOeqiFiKooLA8XsNhDIT0tOM2NGBfGO8WEzGIEuECIdBSqa2xTtwL2UFt
         ExBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl34-20020a05620a1aa200b0076cd5ba3de7si1077309qkb.392.2023.08.02.14.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 14:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRJ57-000402-Gg; Wed, 02 Aug 2023 17:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qRJ55-0003z2-Ke; Wed, 02 Aug 2023 17:08:31 -0400
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qRJ53-0007Ob-KZ; Wed, 02 Aug 2023 17:08:31 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EE90FF805;
 Wed,  2 Aug 2023 21:08:26 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] Add i.MX6UL TZ missing devices.
Date: Wed,  2 Aug 2023 23:08:05 +0200
Message-Id: <0abce3d1d663301684ad7553c6f78064f4781c6c.1691010283.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691010283.git.jcd@tribudubois.net>
References: <cover.1691010283.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::229;
 envelope-from=jcd@tribudubois.net; helo=relay9-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Q4z8QUMX49Fe

* Add TZASC as unimplemented device.
  - Allow bare metal application to access this (unimplemented) device
* Add CSU as unimplemented device.
  - Allow bare metal application to access this (unimplemented) device

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx6ul.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 910316b628..0811163ddd 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -651,6 +651,18 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("lcdif", FSL_IMX6UL_LCDIF_ADDR,
                                 FSL_IMX6UL_LCDIF_SIZE);
 
+    /*
+     * CSU
+     */
+    create_unimplemented_device("csu", FSL_IMX6UL_CSU_ADDR,
+                                FSL_IMX6UL_CSU_SIZE);
+
+    /*
+     * TZASC
+     */
+    create_unimplemented_device("tzasc", FSL_IMX6UL_TZASC_ADDR,
+                                FSL_IMX6UL_TZASC_SIZE);
+
     /*
      * ROM memory
      */
-- 
2.34.1

