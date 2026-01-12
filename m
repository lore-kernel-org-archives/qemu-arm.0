Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F77EC9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:57:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJi-0007kD-Sp; Mon, 12 Jan 2026 09:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJe-0007dX-Hh
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:48 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJb-0001Vu-PX
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:46 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b87124c6295so170564366b.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229680; x=1768834480; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ajg8LOL78oqsr/dK0/gBGuSs986fyLyreKG66qhOt5s=;
 b=SeOxX0ghPi0d7cmaa3vGutUuwNZXm7b8W8YtEY3rAniUG59tYTsQrA37xdV23vYAsf
 Cv3Yolst86zfulwbF6wkRx2bS6xywYcP9LclrTRq+/WT4sZHhwhmlGaBK7E0nAjQfjEI
 RzUp7iRQLQHceRrnqzSHaOTJDd9ESS/jQOhE/tkmm07dy9NAroiSzIczc5xYPTJDyQmd
 eelc3CfXcxyEOfbDgLIcvplAib/vxxkus7T4Oh6fxNs2r3hp0jUi5TwwWOvtFQFIfP2F
 WlZFIV5Up1zyRxcZ+qCR+5EgBnXMTmfI+yqr07qAzFEydC1cToZ6rUrwY+J/V9LTmi2Q
 BWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229681; x=1768834481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ajg8LOL78oqsr/dK0/gBGuSs986fyLyreKG66qhOt5s=;
 b=vPehFO77OPw20FsvyxiYTSi/Kn5e5N6WVth8rf6+Hr4yJ6MPly2oN30mM5odtklhcq
 +5xPnE75MA6u0Wb3Xgy/IbeAEIFqrPYCbkPBzpUU8rQjh/7Vq4CBRCcNbBv2knFeilGD
 Sl1rdqng7cdR3PyoiLAk7zR+ZSzC9Qh2hxDoHZCwZyRPOeYhGyU9iEiAv+t7Dfy8+oee
 IeAaCX4ZZPmanLipoIuCdEXlulyYpxeVhd/pHdEPIVQy+bW6JA81bv0RJ2sftm8crW3R
 81/fC8CYFcQMAt+wBru1CCzfrpODO30O/PzwuZjzbwaDxBnzPcbPoqwbpPM4HFjuk3gx
 V/GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX731eWDWurO7U7f5vXPF6gTuNEk3hnzAFRl8j6muI2C/JbUJX46CKjC5mTp1LWc3CeXVn1aVUTnA==@nongnu.org
X-Gm-Message-State: AOJu0Yy40VjDh9nk2K0EChiEplq0qVtBZ4/5lH2AYlymCMguLUBuxal5
 LT03L0pSJO2yz5Q4bY4hrAE8a7t0X6uOgYars0F96CGJofaskhhTU/a/
X-Gm-Gg: AY/fxX48dtcPtvJk/s5WGKOkCRICExMY0cBE/CGwjPHUr2jJNiPM15QVeDgKHSY+T38
 SiE+5DnBRHpH2QVoi4deBETlIPKBpCMl3y0dNU9UNfk1WTyLjxaiLpLD+RvV2u4IqZupSwu+zSG
 nXBAmh03JAiqI27ywJJtFD3SNO2Qu62JEt+atEb7fdCNuX2vRaYh+6nfvUjbheRBzBOwO5libPN
 V+Lio3y36zzT2l9G8YK8GmiQ/XQ21/mcfCAoKgC4fDwrhWmLxQ4wEV7Fz+eKgGmqeCP2+pBrvGJ
 noJt1eGpYGbfb61y02flhPj/XHV/2lp/aAQZhp0MFAxvp+699zRmyPmWLPu+V1rusIsSgjr1slW
 OedG6dtiLBCNwj2EpnGsUSFeO6T+yfo1vD4MJPpqA3W5lMhU1GyZAAmNVLXHbuYrUQqIUE1Q3cj
 3J2ohGfg8FXpeLImM3pIBf6Ln6AJxxypUcaK44tuVM+PhA5hbUfgu3WxxU4cbgqL/mifFspM/d
X-Google-Smtp-Source: AGHT+IHt6hvwrkl2S51/GHXcSlJ2ZrVxeImVfSHIsHfBTTwgtjxtM7ExNgN+idBCW+UV8wr5hQaq0g==
X-Received: by 2002:a17:907:6ea6:b0:b87:2780:1b1e with SMTP id
 a640c23a62f3a-b8727804cfemr177722366b.41.1768229680425; 
 Mon, 12 Jan 2026 06:54:40 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 03/14] hw/arm/fsl-imx6: Fix naming of SDHCI related constants
 and attributes
Date: Mon, 12 Jan 2026 15:54:07 +0100
Message-ID: <20260112145418.220506-4-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The i.MX 6 SoC features uSDHC controllers which are the successors of eSDHC.
Fix the naming to make this clear.

Fixes: ec46eaa83a3c ("i.MX: Add i.MX6 SOC implementation.")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx6.h |  4 ++--
 hw/arm/fsl-imx6.c         | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 5520473ba0..bb866994df 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -46,7 +46,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6State, FSL_IMX6)
 #define FSL_IMX6_NUM_EPITS 2
 #define FSL_IMX6_NUM_I2CS 3
 #define FSL_IMX6_NUM_GPIOS 7
-#define FSL_IMX6_NUM_ESDHCS 4
+#define FSL_IMX6_NUM_USDHCS 4
 #define FSL_IMX6_NUM_ECSPIS 5
 #define FSL_IMX6_NUM_WDTS 2
 #define FSL_IMX6_NUM_USB_PHYS 2
@@ -67,7 +67,7 @@ struct FslIMX6State {
     IMXEPITState       epit[FSL_IMX6_NUM_EPITS];
     IMXI2CState        i2c[FSL_IMX6_NUM_I2CS];
     IMXGPIOState       gpio[FSL_IMX6_NUM_GPIOS];
-    SDHCIState         esdhc[FSL_IMX6_NUM_ESDHCS];
+    SDHCIState         usdhc[FSL_IMX6_NUM_USDHCS];
     IMXSPIState        spi[FSL_IMX6_NUM_ECSPIS];
     IMX2WdtState       wdt[FSL_IMX6_NUM_WDTS];
     IMXUSBPHYState     usbphy[FSL_IMX6_NUM_USB_PHYS];
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 46967b7488..39667c4a49 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -79,9 +79,9 @@ static void fsl_imx6_init(Object *obj)
         object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
     }
 
-    for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
+    for (i = 0; i < FSL_IMX6_NUM_USDHCS; i++) {
         snprintf(name, NAME_SIZE, "sdhc%d", i + 1);
-        object_initialize_child(obj, name, &s->esdhc[i], TYPE_IMX_USDHC);
+        object_initialize_child(obj, name, &s->usdhc[i], TYPE_IMX_USDHC);
     }
 
     for (i = 0; i < FSL_IMX6_NUM_USB_PHYS; i++) {
@@ -311,11 +311,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     }
 
     /* Initialize all SDHC */
-    for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
+    for (i = 0; i < FSL_IMX6_NUM_USDHCS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
-        } esdhc_table[FSL_IMX6_NUM_ESDHCS] = {
+        } esdhc_table[FSL_IMX6_NUM_USDHCS] = {
             { FSL_IMX6_uSDHC1_ADDR, FSL_IMX6_uSDHC1_IRQ },
             { FSL_IMX6_uSDHC2_ADDR, FSL_IMX6_uSDHC2_IRQ },
             { FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ },
@@ -323,13 +323,13 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         };
 
         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
-        object_property_set_uint(OBJECT(&s->esdhc[i]), "capareg",
+        object_property_set_uint(OBJECT(&s->usdhc[i]), "capareg",
                                  IMX6_ESDHC_CAPABILITIES, &error_abort);
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), errp)) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usdhc[i]), errp)) {
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->esdhc[i]), 0, esdhc_table[i].addr);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usdhc[i]), 0, esdhc_table[i].addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
                            qdev_get_gpio_in(gic, esdhc_table[i].irq));
     }
 
-- 
2.52.0


