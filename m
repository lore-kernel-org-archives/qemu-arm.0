Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1330425ejb;
        Sat, 29 Jul 2023 15:15:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/7zqV69oYmXRuedYstpEQvgol3iw7b6bSy1EzR6nBSnwuY/JvE92HIF8n8l1LHtHTgPcH
X-Received: by 2002:ac8:5ad4:0:b0:403:b052:7f58 with SMTP id d20-20020ac85ad4000000b00403b0527f58mr8419419qtd.39.1690668912020;
        Sat, 29 Jul 2023 15:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690668912; cv=none;
        d=google.com; s=arc-20160816;
        b=qznS88vRCRG+9dX8ZVq0V5SOVmcjbgUp0XOm6EuKgPlj33pcCJ9SucxHT+YSXk0X0c
         n9rF9HCgQDBrbz8oVgqNIjEx63de+SraczragD5MHpcU10+HvNOmdKP8vkLkOxrkIXbv
         B9xtWIFeN0MJ15uhGlXARWuZjTjL/+SV4azcefUhUZ+jgJEVMrqyXfOuyQ1/JoeaE8yC
         17nm6G0b3mvbidEfOKHx/sCZKhJYLyDEOhVivDS00LIRjld2rL/JPF4A7l5ck7mpg8TI
         Z9C74BtVdrEa15WqLeIJIfHSGwpE0cFzbsDL/b/2BO7EvpIm4JaFYShlJCFSGYByb/o5
         HQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LndHlm1+7qNu0Bkdm6az2jcx4Zy3k4FNX1UwiOY6ihQ=;
        fh=+WBZG3uX9FXOqUEW7dRrAA3LgeoMrjfTvks8rWRkhTI=;
        b=gCDF5mnjlIeI4EXPI4Zl0zL2RmLe2ilH90otXBpKmkM29HNVKmxl82NwgKgAUq4ksW
         GjQFo8A7hBLMOHRsTlGqJFHkpEhd30+wmg4976oDZPVnCqmmCBwB7W/NOUd0o3VnAfBF
         tx9xb38HVR6Y4lKvZtlfaP5d6sTURM7EIiTyMkWhX0ST/xcrwqbMNTn0BVGYnA6UMHGF
         IGu4MeB0xnBmpZ8R2hU8ObWHyvHie8O7vutRsQGb9uBgaYPlYl4UuQ9FxWmRDQu6R7/F
         Eu6U8/GQYRj3uzul+03gk4AhY4sGNghUOjsRU1C0MbZsUcCMo3XLEZBVA/rb96VcEksz
         IUkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020ac85846000000b00403b0f6661asi3999611qth.94.2023.07.29.15.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jul 2023 15:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qPrKP-0002jU-W1; Sat, 29 Jul 2023 17:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qPrKO-0002in-74; Sat, 29 Jul 2023 17:18:20 -0400
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qPrKM-0001gx-Si; Sat, 29 Jul 2023 17:18:19 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id C16481C0003;
 Sat, 29 Jul 2023 21:18:14 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] Add i.MX6UL TZ missing devices.
Date: Sat, 29 Jul 2023 23:17:57 +0200
Message-Id: <b6b361c10d9aeb912318a2009aa0e31d0ccbfa11.1690663106.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690663106.git.jcd@tribudubois.net>
References: <cover.1690663106.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::225;
 envelope-from=jcd@tribudubois.net; helo=relay5-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CoZX6DSOKoxu

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

