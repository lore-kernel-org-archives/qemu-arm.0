Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC85C982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8ls8-0006bn-GD; Mon, 21 Sep 2026 17:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls3-0006ZB-If
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:19 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls1-0000NP-Kd
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:19 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so18061165e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027286; x=1790632086; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=udnE1Xzwr+6h2Lqa8sxAr/SfW9vQwyUI9Hnuupon7OY=;
 b=goaxOlyr8QDSeeFbNfsV04mi58pUbidNQWbHLqt2Kfa8/jCWs+rsdHHvXSIP21gcyf
 mXKiLkNlpiMFnWSEnHLDlQe7hObUpHkqPpB2x2CjWTviBfuid+Dvb+hpfEoCmKSVWu9F
 uyZpzqVyl4j9Rme+nNaoBBpSobYVn5/b/gOq4yRu3h7NDUutRKlkhpV27QuNCoRpMb6s
 rur4FF/MuiT4/Nnl3ei8F/5sc3oCyUianiLjX8g2ec5QPiIwJYc6moGKv1aldeojBxwa
 kmCTke+zKaAL6aPDVM564OH19iKmiZEj83/dJLAZCYob48QLtB8/lgvTWzqtSuDObzzR
 n2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027286; x=1790632086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=udnE1Xzwr+6h2Lqa8sxAr/SfW9vQwyUI9Hnuupon7OY=;
 b=hkfmIXeD0rAfrkWrkMESgANF3In1vaosp1JHq0EX4BHpWsUy040HDaa6UK+wIjo+kV
 AOxD2LWW0UTjf3T1h/7GpYagVx2uFwTqcJ52+nLZgnpTxg52kVkrUIAZpXyQDdx2dU/S
 LYJsvDiJutTeC/DsboZ/B53vxLj3pAuoCcTf272vidoqRFdrGUmKm7X7+RC2lbhnGOnv
 cSNLwG1SulNWxJet5HV9Qc1tejyvMvQa39QqJC8Nf2dc1knodDIi5efe+jzG4s3YW86a
 EO3WD9ZAIdFz2PeqCeiwMojwJKoyZ7sbsder/CV7UR2ATMILDe8trZluatVNu5y9WCfB
 AMWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4LXtj+Kmd4GsIl8tw9QWpXIfm4PNJEztEEtbp3hZ9gH0k47bxSqn4mFGK6iIJuYE/I5fzSA9VZw==@nongnu.org
X-Gm-Message-State: AFuF++lCwbCB/v5D6GnYj7WL9J2V2SZbtla1a1KzvBTaUZyKZfOtSSv/
 p5oZEvAkkAuqIH2Zq2puaVaLeKvQosyaYcQuoF+IhjD7t8t+DRxtmAc2
X-Gm-Gg: AYBFou3wep+i0QFPtSRPNPillu9dxeKqA0PuJzIomppaL0lDHdCIHm6Am6z49y8WcyW
 QmckWrO4aZ9gV/r7zYu3XRMinS7JSJPH9mkRgEyOIvrStwNK15Y8ZYeMqfhpoOCo2bk7Tn/wA3W
 PYzOhW2EZFrT9l0walQngAonIcVueKcbOS4mkeIk9Djpj8s+UaiKlOJ5ZbGA9h67c4afBLHjebg
 HA4hHqWLX82CO+xbIpRGy3HOnoieyX3n96h2YeIqrZvDcMvTSQv0REx8m5N85HTzOUGi8Mz7dTs
 yLZ3/qgGI0IyNTuLDwsnf+uPkLmNFbqHWN8htRizHYZPJ2giI3i44dATw3P6tO4KFUzfbWXOpXz
 4n1pvweo2aEyEUCg6c229as/oADRRKWo8ty/8XrzqpNOU86oXO1zTrdX8z1qn1lQ7P2zWb57hWp
 WFDXPB8KFbeUF+f560uKliC4ywIddhcUQinQF8k3+0XIGAViYFxWk22bxXARQBQBnWceCQaWbNX
 cY5p1o7HxWqWZ3QxgTd4+4G6Q6y0uwbVUwFqN9DUOdLis+GNVEovxzFr3oPNLLUI+2bSYuXuE6k
 Prw=
X-Received: by 2002:a05:600c:3b0f:b0:49f:cbf1:e765 with SMTP id
 5b1f17b1804b1-49fcbf1e936mr147738725e9.0.1790027286203; 
 Mon, 21 Sep 2026 14:48:06 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 30/42] Kconfig: Extract config IMX_SPI from config IMX
Date: Mon, 21 Sep 2026 23:46:58 +0200
Message-ID: <20260921214710.29422-31-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig     | 5 +++++
 hw/misc/Kconfig    | 1 -
 hw/ssi/Kconfig     | 4 ++++
 hw/ssi/meson.build | 2 +-
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 25eee42c52..3510e4a6d4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -521,6 +521,7 @@ config FSL_IMX6
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select IMX_USBPHY
     select CAN_FLEXCAN
     select WDT_IMX2
@@ -603,6 +604,7 @@ config FSL_IMX7
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
     select SDHCI
@@ -624,6 +626,7 @@ config FSL_IMX8MP
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SPI
     select OR_IRQ
     select PCI_EXPRESS_DESIGNWARE
     select PCI_EXPRESS_FSL_IMX8M_PHY
@@ -652,6 +655,7 @@ config FSL_IMX8MM
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
2.55.0


