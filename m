Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1355998ejc;
        Fri, 25 Aug 2023 05:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6JH1kllPr0zs7omht0XbvbD0KUsIFVuByfDTtzMZT/L+3pdJ3PNOKSkjXYZTxw5ZefzyH
X-Received: by 2002:a1c:4c04:0:b0:3f7:e660:cdc5 with SMTP id z4-20020a1c4c04000000b003f7e660cdc5mr14703294wmf.9.1692966156320;
        Fri, 25 Aug 2023 05:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692966156; cv=none;
        d=google.com; s=arc-20160816;
        b=GEUgvSXU6R/6i3Vm9p9fQrUyQuGz9nA4ZeYboKe8kQivI6dwLdlCMf8+/0C/x1nSRf
         Xy5s3gmuFFDdvW9ynxNxMHFQssbyqmfZh/7u2HtQ+Va5o6NRv6KPdMdq+lZ+cgMjKeib
         3OTDw55gjpgUu8k4KIZ1dJrW7R+e3oBY5BV38Pm5x/rPF137amARQ3tYKTkYw/PJM1DU
         m2rTMpyyU97ASiW3/BzMbWUKVpC56wFRNlUJhetc81Nsi2WPKUscb09q/It8GCD8Cxm7
         4AlkPyu1FKyEX54t1wV/BGZWGnGBZPAQRNC0NOIAZXvPj7muudVwIjt73MaUlAuiWFLF
         6zkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=GXV470B6uNkbtGFDgKzyn0FrI4cdhh+S3hWUq8ua+Bg=;
        fh=93SjCkkBiUuyIB/rn91STPSZDdbsXlhhRtKHEoLqHpc=;
        b=qP/FePR/VCcU0X6jT57YYxKz+hipoCHbsWOj4PtL99aRPZzngNaWfd5nQj61guVIGC
         amCmbLvXKQKN6HQqmq5iVYf7rQTOo/URTZjeMR7Lu20P2QO5gObopsALr492fEJ8BXl0
         E/IP/dN5E5lBFjtZKlrZHkSczI4ZNPSHbVjc1oCpn7/1TSz1ORDJSYjMqE3sJHqNv2tg
         Sth+Bix2UmIQ4X5XGDtbuKFwA8SBY0zzcZDb9OPfm81RoC49qEqO4fVLYz/8NP6UwEiC
         cE+xz1ApZ7ukfPiTLK69YXc4R+gK9RDxysk4KLx+xJCSr3t9AHH0PVPOF7eMsqgCV9WQ
         2oew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05600c1d9300b003fe58cb905asi531582wms.24.2023.08.25.05.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Aug 2023 05:22:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZVp3-00042l-O6; Fri, 25 Aug 2023 08:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVoi-0003wu-Ca; Fri, 25 Aug 2023 08:21:34 -0400
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVob-0004xD-Ve; Fri, 25 Aug 2023 08:21:28 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2E796000E;
 Fri, 25 Aug 2023 12:21:21 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 3/6] Add i.MX6UL missing devices.
Date: Fri, 25 Aug 2023 14:20:53 +0200
Message-Id: <59e4dc56e14eccfefd379275ec19048dff9c10b3.1692964892.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692964891.git.jcd@tribudubois.net>
References: <cover.1692964891.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::223;
 envelope-from=jcd@tribudubois.net; helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rReLvYNSo/wo

* Add TZASC as unimplemented device.
  - Allow bare metal application to access this (unimplemented) device
* Add CSU as unimplemented device.
  - Allow bare metal application to access this (unimplemented) device
* Add 4 missing PWM devices

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6ul.c         | 16 ++++++++++++++++
 include/hw/arm/fsl-imx6ul.h |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 06a32aff64..e37b69a5e1 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -583,6 +583,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
             FSL_IMX6UL_PWM2_ADDR,
             FSL_IMX6UL_PWM3_ADDR,
             FSL_IMX6UL_PWM4_ADDR,
+            FSL_IMX6UL_PWM5_ADDR,
+            FSL_IMX6UL_PWM6_ADDR,
+            FSL_IMX6UL_PWM7_ADDR,
+            FSL_IMX6UL_PWM8_ADDR,
         };
 
         snprintf(name, NAME_SIZE, "pwm%d", i);
@@ -636,6 +640,18 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
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
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index f7bf684b42..63012628ff 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -60,7 +60,7 @@ enum FslIMX6ULConfiguration {
     FSL_IMX6UL_NUM_USBS         = 2,
     FSL_IMX6UL_NUM_SAIS         = 3,
     FSL_IMX6UL_NUM_CANS         = 2,
-    FSL_IMX6UL_NUM_PWMS         = 4,
+    FSL_IMX6UL_NUM_PWMS         = 8,
 };
 
 struct FslIMX6ULState {
-- 
2.34.1

