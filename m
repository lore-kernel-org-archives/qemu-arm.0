Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E890C982FC
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:51:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8ls4-0006Ze-BH; Mon, 21 Sep 2026 17:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls2-0006Yb-9z
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:18 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls0-0000My-G7
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:18 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so20877415e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027285; x=1790632085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YX7c4kfeBtd8JkNfRm3tqVIYX5haLTU6ibxGCkWt290=;
 b=BYxOgLMa8zgzoToeF578kTi3reKsmHRrdwlEyTdx4tcGThowxGomVAKWA8stXq9BV0
 JhXbxLIfTenk4edpb41iLZ2AxTX7XauvWB2EwGynF2WUqPLCSSMzIj2UY1CqJ9ZpcaJl
 RiMwi0qYFJv9aumDXEsPbT4QWcYyFi1KNKargM16sctxjTRIzOaMjT2HE9DPVMffdnf4
 SncDY4p1gs53986bNd6oFqG3TYdzZqW0puJTLHteS7NXQhao2EOVAeynpUVJIf7uXv0I
 mNaVqPRK7rahvCPpjGXpY9TQupxeGxTnGxOb5W39RIICqozpZyfNQ5Xjayk/T/vogarv
 PxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027285; x=1790632085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YX7c4kfeBtd8JkNfRm3tqVIYX5haLTU6ibxGCkWt290=;
 b=RofsozkeDCLQn8/QrUBi37C7fvD+xOzE6LE8u3XCPAzCiP6XUy5rsza1hBnFveSIGP
 v4MD6DG6Y47eR2cFbsxurYHym4r4HL67YRcnc06nRdu6hwcngrgMBdMQ/FMpyokcUUHK
 EpJdpiOmmBWAFpnIWOT0B6Y61LyOmdVKDMeSpSS67P3RLINAk4J6qebN3dsGJqfHTCrD
 NriPFuXsfQ0xA7Xq6AEI49GHVMRvgVn9A8TiE6LyfFf/KYCcE0nJZoWWSoLgtgjAfV8B
 ufe1fa3aYVIWOYRSiEfsYP35h+qfVUWhIZTYcCS8OjjjLhN/y2ZFYVmOVCAOyrLJmuMA
 3tpg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9ldQsxEc944sEDg6W6mmVV7s1GK6BEOtgzfCdJBunQK7P+8O642KnrlKJ9vWgB2vNy1Aes3OIeA==@nongnu.org
X-Gm-Message-State: AFuF++mmguZNQUmV0pYTv0Uq1uxoeW1yb2Y3dkniI/sgTIUADpFx1foM
 7giEdqFS8/566ax3u297+j1lUt0VtG95D48nbDLDWVSbeczhno7INrZp
X-Gm-Gg: AYBFou1uMfpbZFnNmN96Eajuf/zn0ucmBcbZQQf/61JUIx5PqGuJy+s7txQV3TdSAtN
 PlS1lMyCo8F/Cmb/OPsZtTQyaRY/CNYgGJ7GtezSdcWzRPV/Vyuo1WoHiqZeIghCGBgTeCGenRK
 pX2GyjwZ5pzTwXK8ipxbCkFMjYzIO5mugZ8plwNjmQ34VWWoJ3nMyeeO2MN9kuACvjU3NPI9YNE
 pDZYCwkY6ht4nB+hPrkrsDFTWVcAvfsMRLZYwl36wmnUjMBFpJSZQITz634uYLuYijnVN9LdGnI
 Akuig92Ww/6746ismnoqlvqmjjavO04E+R6OdB2LLgn/pUZRuo/qxKTwGxWxkOWy8oOu0/CRqtB
 rkkm5O4+a5olynmIUJKiYKPJ8wxUjuJoF9D3GOgV12HKjeeqnG9grjQ+tfAcQiltMg9PP5XoSDv
 dnEbPXk6YaNe128Aigl144ojkgsVeO5SB9z93/sFqurl37G4dCwht45vZBl1vUqrUu4TcRZ7Hpc
 DJ1bYP6j6NKl9VbMu3uVcn7FIFNDdGfM+tZ5w+ZqbnoBEKSrwlQ6mTi5dlM03zS/FB85mDpVPL9
 NkpEdLb3txH+k4Q=
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id
 5b1f17b1804b1-49fc56dbc54mr170745205e9.3.1790027284830; 
 Mon, 21 Sep 2026 14:48:04 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:04 -0700 (PDT)
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
Subject: [PATCH 29/42] Kconfig: Extract config GPIO_IMX from config IMX
Date: Mon, 21 Sep 2026 23:46:57 +0200
Message-ID: <20260921214710.29422-30-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
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
config GPIO_IMX to eventually eliminate config IMX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 7 +++++++
 hw/gpio/Kconfig     | 3 +++
 hw/gpio/meson.build | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a2d94e238d..25eee42c52 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -479,6 +479,7 @@ config FSL_IMX25
     depends on TCG && ARM
     imply I2C_DEVICES
     select FSL_IMX25_CCM
+    select GPIO_IMX
     select IMX
     select IMX_AVIC
     select IMX_EPIT
@@ -496,6 +497,7 @@ config FSL_IMX31
     depends on TCG && ARM
     imply I2C_DEVICES
     select FSL_IMX31_CCM
+    select GPIO_IMX
     select SERIAL_MM
     select IMX
     select IMX_AVIC
@@ -513,6 +515,7 @@ config FSL_IMX6
     select FSL_IMX6_CCM
     select FSL_IMX6_SRC
     select FSL_IMX7_SNVS
+    select GPIO_IMX
     select IMX
     select IMX_EPIT
     select IMX_FEC
@@ -593,6 +596,7 @@ config FSL_IMX7
     select FSL_IMX7_GPR
     select FSL_IMX7_SNVS
     select FSL_IMX7_SRC
+    select GPIO_IMX
     select PCI
     select IMX
     select IMX_FEC
@@ -615,6 +619,7 @@ config FSL_IMX8MP
     select FSL_IMX7_SNVS
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
+    select GPIO_IMX
     select IMX
     select IMX_FEC
     select IMX_GPT
@@ -642,6 +647,7 @@ config FSL_IMX8MM
     select FSL_IMX7_SNVS
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
+    select GPIO_IMX
     select IMX
     select IMX_FEC
     select IMX_GPT
@@ -683,6 +689,7 @@ config FSL_IMX6UL
     select FSL_IMX6_SRC
     select FSL_IMX6UL_CCM
     select FSL_IMX7_SNVS
+    select GPIO_IMX
     select IMX
     select IMX6UL_LCDIF
     select IMX_EPIT
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index fcc7c70bd5..6911eafbb6 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -1,6 +1,9 @@
 config PL061
     bool
 
+config GPIO_IMX
+    bool
+
 config GPIO_KEY
     bool
 
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 0555f44b6a..6d233826fc 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,3 +1,4 @@
+system_ss.add(when: 'CONFIG_GPIO_IMX', if_true: files('imx_gpio.c'))
 system_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
 system_ss.add(when: 'CONFIG_GPIO_MPC8XXX', if_true: files('mpc8xxx.c'))
 system_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
@@ -6,7 +7,6 @@ system_ss.add(when: 'CONFIG_PCA9554', if_true: files('pca9554.c'))
 system_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
 system_ss.add(when: 'CONFIG_ZAURUS_SCOOP', if_true: files('zaurus.c'))
 
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpio.c'))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_gpio.c'))
 system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
-- 
2.55.0


