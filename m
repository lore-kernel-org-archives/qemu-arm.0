Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C5CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:13:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMiO-00017c-2X; Wed, 07 Oct 2026 04:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHOL-0003i4-TF
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:28:45 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHNy-0000Gc-Rz
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:28:10 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5bad794b197so1300256e87.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791339903; x=1791944703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3Bx/gBQbJwyEOeNleYcut8SB9gX8DfSUE1/YplwZCUY=;
 b=sXTrJ281c9uN6TOwf8ZrhfQ2J/91s1ojhK45Jgu/AubIpJEil1KFrcSibPMHq8U25D
 xUp4ou/1pWoYPQ0pM+2EALO9PDFtH4BqlSem6eQ1Z27Nft/Oc+V64EUyHrEGQ2lZK0a0
 2JCYbb6B0in7dR4tuMcW0bIK/f14wUHIvZ5b9p9NrwC3+X9dSj69FzcW5GUHRtPBEiLj
 VprQdQw1X4k8dlLcuQad/c/VLYO3GCbnlAsNQTuH2hK6vRQABtaR7cZDIhPI5fidvmEv
 wHsAXY2ooF4OG/4eqXvnZT2nbkfz0QhfqRphpoU+T8VxLsFYghNBKV0+tpkCKEilFAwt
 7Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791339903; x=1791944703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3Bx/gBQbJwyEOeNleYcut8SB9gX8DfSUE1/YplwZCUY=;
 b=Y530jxdfK+kY1JR3RrQBr3agJkxiEUs8xU8CMTD2swM5iBCGTfMNJpIryH2koHLKZA
 mvhwwpqMypKwIEt6gt39jmlB3T5ZV0mnk+floNDN06yiRVO1bd1z8X97NttRG1Kqv/u2
 1nw2ePAWSwEBdbcW3oFnQWCf3wv4G1caKAnM2s4LFwuJrFfWVWBewkLQEZTGHX9+r0Pd
 dlp5ivGjZJJQfT4noPHOseEFhk2SqHRA2p+xoON8CJ6WBcmoci8XS3UvRmk7zKEkZ7pi
 T3F8GbOeAgTxZRrPcB2wb1h+5VOBE4tWwj42tbYkk/v8Exl428G4RtC4Xs/89VQjJWyd
 mz6Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByhqJrFeTNKneuSKvZYxDbxvyXh0BUMyxJQ8csbjb8iir31nFtOHytrbj9HNiGo5o0YF2N9aPkdDg==@nongnu.org
X-Gm-Message-State: AFq9FYLPskA4lry3Qm151+bHd4FTYAoj1LWI6KfxB2W7xJQdUjq7/Pqj
 EZaMZMdyWH+BjonK8Bxwol3Th9JYkFr/6Vd4L8GSKZKtYQvWo+Vv85y0vJlPqA==
X-Gm-Gg: AYBFou2kxTpXVr0+Ysu+UzWFaa6V/Y/jZJX1CzGURzlVwVI8MzSUppl4WQJbu8HuOgY
 0Lm3bTFzWSrssBOZ/Nt9aetKskaC5mYgM7WFF7p1XqUhO6J76lIZDXpknvuGMJgy0QZ5jVafUTz
 wvS2q3Eht8JgCE6BiWwNQ6B5ZTsejZvoeQcA7MaX1CSqvJwZaxKetDlz/mCQBTtWd0b2FvXMqzB
 DOmtMq6Y7c1vzT97xkHKRxgCkiieGumcfYXBX8jFkZvNDVEVGIVLvVntBPy/4ASVJxctOk4wcjl
 O86SpfjJp44Cn9L0mteUK2RsZW4zF6LXUmYS7OclzL9UhGR0CYnBQktGVji3dbfx46PUs2e1Qbi
 EYhAuzr4D1DX8XiwTymdSQRpgTTFH9YDDZwxQ2I5+pB7740twxiBkne7JyD+03Aw6T2IXN/9aYN
 Ku5v8jhIOsNeKIAhTddZY6kMZqETq27LkwMGVxDehINB6b+HaUwVKWagPH4z8EpHjRxsFiKfBCr
 LNUvObsKEkqa/elbiMXJNNQ/1aZA6cXXCI66Q==
X-Received: by 2002:a5d:5f55:0:b0:48b:5e5:664f with SMTP id
 ffacd0b85a97d-48c6d1a0fcdmr1228114f8f.18.1791275755775; 
 Tue, 06 Oct 2026 01:35:55 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:55 -0700 (PDT)
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
Subject: [PATCH v4 29/31] Kconfig: Extract config IMX_SERIAL from config IMX
Date: Tue,  6 Oct 2026 10:34:41 +0200
Message-ID: <20261006083445.30362-30-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
config IMX_SERIAL to eventually eliminate config IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 7 +++++++
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3f502685f4..543220be6b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -488,6 +488,7 @@ config FSL_IMX25
     select IMX_GPT
     select IMX_I2C
     select IMX_RNG
+    select IMX_SERIAL
     select USB_CHIPIDEA
     select WDT_IMX2
     select SDHCI
@@ -505,6 +506,7 @@ config FSL_IMX31
     select IMX_EPIT
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select WDT_IMX2
     select LAN9118
 
@@ -522,6 +524,7 @@ config FSL_IMX6
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select IMX_USBPHY
     select CAN_FLEXCAN
@@ -605,6 +608,7 @@ config FSL_IMX7
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
@@ -627,6 +631,7 @@ config FSL_IMX8MP
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select OR_IRQ
     select PCI_EXPRESS_DESIGNWARE
@@ -656,6 +661,7 @@ config FSL_IMX8MM
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select OR_IRQ
     select SDHCI
@@ -701,6 +707,7 @@ config FSL_IMX6UL
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select IMX_USBPHY
     select WDT_IMX2
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 020c0a84bb..54f9936534 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -48,6 +48,9 @@ config VIRTIO_SERIAL
     default y
     depends on VIRTIO
 
+config IMX_SERIAL
+    bool
+
 config MAX78000_UART
     bool
 
diff --git a/hw/char/meson.build b/hw/char/meson.build
index fc3d7ee506..65351c39de 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -3,7 +3,7 @@ system_ss.add(when: 'CONFIG_CMSDK_APB_UART', if_true: files('cmsdk-apb-uart.c'))
 system_ss.add(when: 'CONFIG_ESCC', if_true: files('escc.c'))
 system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_apbuart.c'))
 system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_uart.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
+system_ss.add(when: 'CONFIG_IMX_SERIAL', if_true: files('imx_serial.c'))
 system_ss.add(when: 'CONFIG_IP_OCTAL_232', if_true: files('ipoctal232.c'))
 system_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 system_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-- 
2.56.0


