Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C81CA6009
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENFZ-0000L0-U1; Wed, 07 Oct 2026 04:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEJ8c-0002m8-KH
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:20:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEJ8X-0000Im-4i
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:20:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso30057115e9.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 21:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791346807; x=1791951607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TSgSmbIol/w3uLzkMCO+LFEzRwoP9tuMmsJ3pCoOB1Y=;
 b=bdm4cqsAWE1Q783UvaTwKdjwo5lVxlZlm1dbP1kOAYe4wzde77TDes96T5BitqYqmN
 cczxVHWHM3aMYmop/AL55WHPnj1oyP8xf8qbR09E/zeXPxn7Llm4Zj/MsKqdufpXE0Lt
 ALxP0RUVdLMFIIW/fAO2S0xoJzR8kAjm2kl306N835Vc6OvIw032sMCgFrUXrth/StAi
 ybdx6rfGOWXlF98L783lJV43wqD51QuYUWvVWz22Vs4s1zKIUzzgk73AIHXNXebqJmwN
 sRCw4LYWuQzsfZCGuA4tS/OBfKaM6mBe5wsJww9kySYOZOJL9P40Do+hyLjmIhoFgeIo
 VY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791346807; x=1791951607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TSgSmbIol/w3uLzkMCO+LFEzRwoP9tuMmsJ3pCoOB1Y=;
 b=o8xnyH2gf7CIq6wjsEq9DyoTji4zo3yw5StSxq1h05C41J7Xke3RkfSPsnElcmEG3p
 VAvKAI54sQstSiB0CRCPPLyy2FVPJuqILDPvwl5HryWkkcupms2J/E4/JxMa5qPyulpY
 Uddqd+JRGDvUPlngsZfoGnGKSAfB5j77omLCD/rKPHOMxpNT139/Itz3fkLXYjDgKf4e
 NM4heeFrbA9rnqBqsErVHN8SkkR1x8RoTOMqjp/IQqriGkpvFEA/G4aORr3/o8Ze4pSG
 7k+JGkv+mt8ax7eUcPwlhd6hzLETSGG8S+qoiLNEY5+Y5rZ7uX1Xb5Rolo2sEzXM5Zax
 8kLA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy2BYrAiN9Ns0dGcQI1/7VVqahbHEWJhyEgDLpcXaTSlAfcM5cKwhTI2JwLXRRX7gFWFFP4bO37oQ==@nongnu.org
X-Gm-Message-State: AFuF++kWKieyC5cVc2nSOvcPq9gTKoanJy4VbJ34TR/tRJx30VZ9jB2w
 zlu1zy/vIDVxNKpEdAnqfbIqbbI7FzPouj13LuopC9UjBzGtLRIYhRzch5EAtg==
X-Gm-Gg: AYBFou0giXbgzOWAHJ3suSEYSki5wOtkIYvaLcjTPYAvSdwvL6zw5UelJ/4sZJB4FnA
 X3v27P3H1SkLDlGhG342Xtrj1eLMriypzC3e/l0J1kpZBO6juDhT8O+jPf+DD5LVqpmlPgDidEh
 SSLVHQFHvLJd9yrZ7QTWnCTbHdohiHGYrmVV5tzpFAUe2Z7Jh9MMqqdQ0dkXedSKlNlBierDikN
 Y0cMySDci0wXQ4duqG4x7LfJXk/3am4FYhF/zwgSbi2m+pHsYVLTF9FTiQXaWs60BFkzFT1QXdD
 VC0CfoR2/1Do2h9rjT8JXe3IHbKnTQBkyKgcxtuW2B04H6sw36gJg9od0q6C5+5hHpssLhuJ8zC
 DTFSVGZxrZUzsfcSTCEq8IEaaabjZiLuHuNlrvu+Yz6AygaCfKFNOyhywE7PXlVd8RfxYDj24Mh
 RWfuRydW9dO+G7F88vd1TjnR2ID44AhCvI7iY35vHtRt0QuHxlt6UKRA/YMEiQEFil+osYQY4RC
 Y8NniRxgq/fYCDRD6jUCwqXCDNF8HFBwHK6pQ==
X-Received: by 2002:a05:6000:24c6:b0:48a:f5cb:4356 with SMTP id
 ffacd0b85a97d-48c4801ac46mr17402531f8f.45.1791275754413; 
 Tue, 06 Oct 2026 01:35:54 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 28/31] Kconfig: Extract config IMX_SPI from config IMX
Date: Tue,  6 Oct 2026 10:34:40 +0200
Message-ID: <20261006083445.30362-29-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Over time, QEMU has grown a number of i.MX boards and the monolithic
config IMX drags in unneeded dependencies into each SoC model. Extract
config IMX_SPI to eventually eliminate config IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig     | 5 +++++
 hw/misc/Kconfig    | 1 -
 hw/ssi/Kconfig     | 4 ++++
 hw/ssi/meson.build | 2 +-
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c21ad260a1..3f502685f4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -522,6 +522,7 @@ config FSL_IMX6
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select IMX_USBPHY
     select CAN_FLEXCAN
     select WDT_IMX2
@@ -604,6 +605,7 @@ config FSL_IMX7
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
     select SDHCI
@@ -625,6 +627,7 @@ config FSL_IMX8MP
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select OR_IRQ
     select PCI_EXPRESS_DESIGNWARE
     select PCI_EXPRESS_FSL_IMX8M_PHY
@@ -653,6 +656,7 @@ config FSL_IMX8MM
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select OR_IRQ
     select SDHCI
     select PCI_EXPRESS_DESIGNWARE
@@ -697,6 +701,7 @@ config FSL_IMX6UL
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select IMX_USBPHY
     select WDT_IMX2
     select SDHCI
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index dbdef58505..ab238767b8 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -91,7 +91,6 @@ config ECCMEMCTL
 
 config IMX
     bool
-    select SSI
 
 config IMX_CCM
     bool
diff --git a/hw/ssi/Kconfig b/hw/ssi/Kconfig
index 1bd56463c1..d477d20e9b 100644
--- a/hw/ssi/Kconfig
+++ b/hw/ssi/Kconfig
@@ -32,3 +32,7 @@ config PNV_SPI
 config ALLWINNER_A10_SPI
     bool
     select SSI
+
+config IMX_SPI
+    bool
+    select SSI
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index 6afb1ea200..f334e48e2f 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -9,7 +9,7 @@ system_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
 system_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
 system_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: files('xilinx_spips.c'))
 system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-ospi.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
+system_ss.add(when: 'CONFIG_IMX_SPI', if_true: files('imx_spi.c'))
 system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
 system_ss.add(when: 'CONFIG_BCM2835_SPI', if_true: files('bcm2835_spi.c'))
 system_ss.add(when: 'CONFIG_PNV_SPI', if_true: files('pnv_spi.c'))
-- 
2.56.0


