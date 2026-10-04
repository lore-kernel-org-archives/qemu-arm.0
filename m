Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E853CCA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLKS-00070Z-Tj; Sun, 04 Oct 2026 08:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLKH-0006nr-8X
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:21 -0400
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLKD-0007ET-8v
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:20 -0400
Received: by mail-wr2-x0d.google.com with SMTP id
 ffacd0b85a97d-48b0fc598f8so468447f8f.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116895; x=1791721695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cvCimijCXi3imipQJUqu8+eoBJA75lPwchr+KQr5fAQ=;
 b=rukROiUVnSeOydi0fcWWgPJtGx0MFjNB9x5G3ZPEjwZ+Xyyhb7ASrweSiWs6EbcD80
 i/1L1p5zBBtOJPNZphfcR5wbH+SBfZdRzESOR9tQDdstfvrX8G0t5Z97ACe6WA7SUZzM
 UC/JuHE5E+Zt4bQXEbua2XU6hc+ZHJoBZ8i0laRnjUKJmxMJlsFmSVFcI6sSjVXgctmC
 B6wLG2vlEV91eTApvHgZIFYWEKn8fqfg5Mrgmz6SpwFPqFXjQyMnXriOseeDjgwCtIZr
 z/x8SWO1xZQ9ITAa/9R+jypTEuI3bcyuA89yrzURr0DL+G/g5h5RcZMB/qKBo+dVpw05
 dvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116895; x=1791721695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cvCimijCXi3imipQJUqu8+eoBJA75lPwchr+KQr5fAQ=;
 b=2B9WHVZdqK+jd4LieY2hCAyXlBtf/roSjpmcYf0+rPxH3gHYXvcBIInhtYIU8q4maS
 YRmwZmJ2RSgiUayFo1SFDyryCy9w4gJWuY3HQjrOJOnfS+dK+U7p5oteR/OqEt+XBas2
 qlSOjKXuAzTbZGnGKsUW6kjM5Y8sFhXjwWKSe0nwGw3hGkc6tAh7NUhHFdwL90XUDHVl
 UjBDYRR87/Gu+MMHHMtzwD/j4S4oM8vTsB7hz11waLcMWvWZh+1sKvWN+1rCd9eafWJG
 zpmcCKDak7pwFPdIj2MwpDvR2XPkZapBtn040iGkWq5o1Ihf91OdFAfBXej1Pb72KM41
 LVzA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSS5jHUcP3fXo9Po/0ys2h37tu5rNXpUtQK8wPDIvVC27uLq7+CCV4G6S2V9Qf0CSu9w0vnN5AGw==@nongnu.org
X-Gm-Message-State: AFuF++m4fvHa9FtfTDO0h5MBsDBIeAfK8u7010bc8kHMIZ0Y/7NTuHkA
 YGzAjdM3gadWKLuG0aGzMqNFVKamhYux0kKqJnEam6IEiJDPsWQ74dVq
X-Gm-Gg: AYBFou3+bn6bwtaZ0+4r3B48yyFD83whh4E3OcLjW0xBA9VrIm1aw8o+STyqhnFjq29
 wizbUCBeisUs4VoJYTZksKQbqT1ASPWS7Nwi5387EdPP725hYcYrIZYvwQqpeiV2njlDAVRUBB1
 x2gwgczQv6enL88J07pe4XygRPln181w5QSCmueeoUgy9c5fBqF1S+O4xAFw4DlsR5SlYGrh0CK
 DO9ljiBR2vI/Bv5sOAsLjpyN3MQcJG1nrT0lEFzImTOt/Q4kWzCpKmXzwm4/5Un6vs7XRNDFJvF
 uvftVCNxZTN3VhxzlABbQ/Q9v6r2JwYZDBFAFT5XbiFGw9RKZTLFgH1O1QnFMUNavWstTo9TDiN
 djuvwOh2ehQsi3ZjLFj8BPPIjkJIROYvHodneRUGhBrLjYI7V7EFqDJFkCUOeMMTSGq1Arg3TIH
 mgtAS+h64LQt5hxbAq7WRAviZSTDha3e1OYPKZ1K7HzmIqXiQsrl51wMJ2b69TViHv2USP0T3qY
 UDIwLkN7VVk+B4KV9GR8sSVEHO5XtmJjHyQfg==
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id
 5b1f17b1804b1-4a0275977eamr132578525e9.18.1791116895341; 
 Sun, 04 Oct 2026 05:28:15 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:28:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 26/30] Kconfig: Extract config GPIO_IMX from config IMX
Date: Sun,  4 Oct 2026 14:26:42 +0200
Message-ID: <20261004122647.3913-27-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::d;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0d.google.com
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
index 1d3026dea9..c21ad260a1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -480,6 +480,7 @@ config FSL_IMX25
     depends on TCG && ARM
     imply I2C_DEVICES
     select FSL_IMX25_CCM
+    select GPIO_IMX
     select IMX
     select IMX_AVIC
     select IMX_EPIT
@@ -497,6 +498,7 @@ config FSL_IMX31
     depends on TCG && ARM
     imply I2C_DEVICES
     select FSL_IMX31_CCM
+    select GPIO_IMX
     select SERIAL_MM
     select IMX
     select IMX_AVIC
@@ -514,6 +516,7 @@ config FSL_IMX6
     select FSL_IMX6_CCM
     select FSL_IMX6_SRC
     select FSL_IMX7_SNVS
+    select GPIO_IMX
     select IMX
     select IMX_EPIT
     select IMX_FEC
@@ -594,6 +597,7 @@ config FSL_IMX7
     select FSL_IMX7_GPR
     select FSL_IMX7_SNVS
     select FSL_IMX7_SRC
+    select GPIO_IMX
     select PCI
     select IMX
     select IMX_FEC
@@ -616,6 +620,7 @@ config FSL_IMX8MP
     select FSL_IMX7_SNVS
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
+    select GPIO_IMX
     select IMX
     select IMX_FEC
     select IMX_GPT
@@ -643,6 +648,7 @@ config FSL_IMX8MM
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
index ea0fb72b40..5ea2c5f427 100644
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
index 8ede5e88ae..d60dc42ab3 100644
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
2.56.0


