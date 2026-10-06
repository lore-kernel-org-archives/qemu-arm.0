Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB8CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:37:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMzd-0007ic-VC; Wed, 07 Oct 2026 04:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHiI-00065y-I2
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:49:15 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHiB-0003TJ-GZ
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:48:59 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3a1e9f55e03so41911011fa.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791341082; x=1791945882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A5T0Q4tG1KFl/zAm+FMtUPPeNHZC6qNa+VYuFXQeTT8=;
 b=B3NTvgcC5yjStGo0+hKh8sF0iHWT2HjssoI5pshTyEMdOTi8iDvMPSUIYSSjkFRjB7
 cyDYDw7mwBgF9DCavpE1UFneNFHAbJ8LWeUQ8zgLtOt8SGUR0mYNGt6teEcEm6fGzGHH
 37REwGT9iSmjpPMBCdGyCVaeIl6SgxBhWiJfeJZXdgRerYNymXERS2C3YPo0UhHVH8ZZ
 wJ/ZmELR8L4QKc0r3D3vJFXRxj5CcoRPLBEXxGKiKISAAnydwOLBFiDTMipvOLBoQCcE
 zOtzR4DLfyFgt0u7AHkGyQGLBaGHezcvAvevLnTvN5XRqDWw49LIcMqE16TDHAC/B5rr
 b2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791341082; x=1791945882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=A5T0Q4tG1KFl/zAm+FMtUPPeNHZC6qNa+VYuFXQeTT8=;
 b=q1qT2V1Ge1TjwdBnmdHe/CuJC6ml55U5rCpJAW6DX1ZAmH1xR1m80QNWucBlpZA3Ma
 eaiVPLjxi1pT6geleqh0QcWJQcSDiKhMh4UKFV9BcoB5A1ChBZcuUSbze8LEKYKJuHvc
 0Tn4ZCvKelOzSJt8yoP2izlMsDD2X0EQvfyisp0CWcBBe9uo2JVIaNAqyaLVWavMOUwp
 UR3Tp/0IH1M7QOObRQMU/6eHlxJntFlrE6yxXL+z1Ibzs8bidWKc036GTKrtj1UPPp7C
 pKmJQ4/HtoAllKciqbPMAPgJM4SGi/PEAbLrUJfSm0JV9/a4YSrSBw8W14tKKc7swMmy
 aHvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPy7FLgUgQCFrbq4km01s6ZXamclxq0h0GfCTB1oTb+o009ye+FrufAE8Z/dGnvHfptZtupcKg+A==@nongnu.org
X-Gm-Message-State: AFq9FYK5MjrLjqMX1iCnNkSPVdqegt58OoUixAbg7P+w5xX5SzYmaM08
 okoy1tOVa4E+fUaObL1YmaiawzPCELJOCryV9XwqrRr0g9RBdeGlmWl/kzkdIQ==
X-Gm-Gg: AYBFou0uCJtj1wk6Yd76cmziKDUolxfk8UnwYTDmB60O0za1M3vZ9InWNALkI0DNNbX
 jPs4hNCJ86ozV+qWRt4vsmiDZBTv8TpsqrcGbn9OvTt7zbWFazizf6cFvIvU9sK6lhms/SGs1/Y
 tLoq71tAm0ap6zKtwNTHsgEawc4mxm717EmCJ37FIY2uKx4Ocygj7d+GNQ48Dp3VhEAg8jhCCap
 0DHlYDhscek8mo8dW2KhryCsvSpWg6t6BbUK46k5aS5jGfTKbFM4fotaIsHAuuKZruePC5iT2kk
 lJ744FCQ1MlbwMaUDTJt5zk1s1lwAdXGIwBAcflNQs/SmKXwUulhXhIcZ1wJ6gTmOroyukYd+ap
 hRjBjXMnR21lxlSZWMtIAn+Wjv6YDNVsVM7j/LkiE22oDWVcXvXNT9EqynVAR7DCq2Nten9lFdj
 nbQknFm78zzHSRWMS4eWDL1pTB/hDDW5FSRjpf+muPN3TbCzcoh/6UqoaP4o60fD/uiz9+JYmrr
 iBEi+7AbcyEwFxig+UEjLtv/fHwmBq03EMyaQ==
X-Received: by 2002:a05:6000:288f:b0:48b:5e2:52c7 with SMTP id
 ffacd0b85a97d-48c47c66e8amr17784318f8f.8.1791275750847; 
 Tue, 06 Oct 2026 01:35:50 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:50 -0700 (PDT)
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
Subject: [PATCH v4 25/31] Kconfig: Extract config IMX_GPT from config IMX
Date: Tue,  6 Oct 2026 10:34:37 +0200
Message-ID: <20261006083445.30362-26-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=shentey@gmail.com; helo=mail-lj1-x234.google.com
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
config IMX_GPT to eventually eliminate config IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig       | 7 +++++++
 hw/timer/Kconfig     | 5 +++++
 hw/timer/meson.build | 2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index dada9f57a7..cb6e7056a5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -483,6 +483,7 @@ config FSL_IMX25
     select IMX
     select IMX_AVIC
     select IMX_FEC
+    select IMX_GPT
     select IMX_I2C
     select IMX_RNG
     select USB_CHIPIDEA
@@ -498,6 +499,7 @@ config FSL_IMX31
     select SERIAL_MM
     select IMX
     select IMX_AVIC
+    select IMX_GPT
     select IMX_I2C
     select WDT_IMX2
     select LAN9118
@@ -512,6 +514,7 @@ config FSL_IMX6
     select FSL_IMX7_SNVS
     select IMX
     select IMX_FEC
+    select IMX_GPT
     select IMX_I2C
     select IMX_USBPHY
     select CAN_FLEXCAN
@@ -592,6 +595,7 @@ config FSL_IMX7
     select IMX
     select IMX_FEC
     select IMX_GPCV2
+    select IMX_GPT
     select IMX_I2C
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
@@ -611,6 +615,7 @@ config FSL_IMX8MP
     select FSL_IMX8MP_CCM
     select IMX
     select IMX_FEC
+    select IMX_GPT
     select IMX_I2C
     select OR_IRQ
     select PCI_EXPRESS_DESIGNWARE
@@ -637,6 +642,7 @@ config FSL_IMX8MM
     select FSL_IMX8MP_CCM
     select IMX
     select IMX_FEC
+    select IMX_GPT
     select IMX_I2C
     select OR_IRQ
     select SDHCI
@@ -678,6 +684,7 @@ config FSL_IMX6UL
     select IMX6UL_LCDIF
     select IMX_FEC
     select IMX_GPCV2
+    select IMX_GPT
     select IMX_I2C
     select IMX_USBPHY
     select WDT_IMX2
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index e1b751a54a..49a4d20e55 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -23,6 +23,11 @@ config I8254
     bool
     depends on ISA_BUS
 
+config IMX_GPT
+    bool
+    depends on IMX_CCM
+    select PTIMER
+
 config ALLWINNER_A10_PIT
     bool
     select PTIMER
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 8323efaf46..477dd47486 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -16,7 +16,7 @@ system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_gptimer.c'))
 system_ss.add(when: 'CONFIG_HPET_C', if_true: files('hpet.c'))
 system_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
+system_ss.add(when: 'CONFIG_IMX_GPT', if_true: files('imx_gpt.c'))
 system_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 system_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_timer.c'))
-- 
2.56.0


