Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142A6C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 12:50:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx2CE-0004pK-4M; Thu, 20 Aug 2026 08:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wx2CC-0004oJ-Fy
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 08:48:36 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wx2CA-0001Wu-Fv
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 08:48:36 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6a0a4a28cbdso4117194a12.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 05:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787230113; x=1787834913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r9eBQ66b0pZml6duWgsrSsCww3MfIS9oHdUnfpbvlXc=;
 b=RGwLHUe9OKcoStjuamBz00cmZpGli800BhrAfWKdaEaGmhd+Js53Z+e/picmNryD0A
 8bBqwAuhaK33VYlIkXm06cRhXw6Poh2NRzyuWyaGj3ML+W2ZEgwDY1GxT+lrkU4O7/Vp
 3+Gl9lf+41jQpG3Km/1fa/4LMw85q4sfHLOgefYhX/R4UKIuzj1w3rA9CWHRGpzQ2hZQ
 FLXazvW7RLqyYPEr4rQd3/juxjfMZWBguH/tNOox7IC5aaUKsn7+Pn0lDMFVFqliVaNC
 N00cH/Mfjb6twyiqpFZPklgmFEuVHhWE862/nevPq6bQUdNq0JNYSt1tpzXsTxwxFG0N
 nHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787230113; x=1787834913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r9eBQ66b0pZml6duWgsrSsCww3MfIS9oHdUnfpbvlXc=;
 b=cZ6sCKfDibLI+jdcFQpUFi+8cMBR6n/1Kbp4wkCokSNu32kJyX9sprtDBty/7FJZj7
 ZKSAl8vrlMNZxi9jOQ4weddfQFw2pkr1Udn5Ecsby9szu/0nmr2q8wStvEv8Uj1Ma3H3
 0kfOEeq9l7z8uCi03wCwvHxdZ/gFkgRNFTOE9d2LLdyjWhDNtUxOLzY6PNu3k6Sgh9CN
 2wq4rM0ReXlfuAXwJ2I3Hi/HFHgxj9l+6suBNXz7NS49JHkzLccSRIEKnObi2l+R6A4b
 0S0AHTVRtmyJKXXusEjtTrL3Kp7BJ4nB2HF2P5rOFkftZouBlJEuyG1etIFLDJVYnwav
 NPbw==
X-Gm-Message-State: AFuF++mgQBHFDDAiUy9Q5GsloF261Sxn2ON0sakNSuEUsGlH4tljTxce
 LqbFxtlgVtWW+CzZamlcLoQBfYMNG2WBjPb/yDCxZRj/THu0A1iFRGCX
X-Gm-Gg: AR+sD11Hyr6+LYO8kUwsvajGDef36A1L2dl0vhr8JjxbcMoAuI20ZYex9r4rDKykAto
 zpj8DqOq3qSMxcznNEQGvfqXMeMCWTyT2b/S/cPHC1T06212krhPh37X0lRfybf6fgWGIV4owRW
 mRBmpCbLcIYpsvy4m0STMlXsZy7ZiIUvumV1oExszvhxTQtfwTJZyeY3zs85GOypXeVcMlOyYqg
 La3QlfXxOQPCU/zU9/ShagJBqiYyNXUVWriExp7pNKRA5azNFhWqehgl8RiJy2HZXpcymSfu+1x
 C7gHTWAtzO52+j7phPVKSiXiXOcxONrixpVne3te0MwkQFGXjqm4rzMER6JqdOl9I8ZFyAW/F4N
 wXuG8sTnxpwfnztr8KGBFuFyoWwwKifbcQs2+n5nnnYXRxSE+oUFw3cASQkKklHlFrxOt9QtXUl
 iJrH2oyX87VRNJ4PoIWAEGLp6yRXh4RS6aDJjQJtbVIZ77tvJ8TAWg+DeOw6+DXAC7FEq4DMVtL
 uCpPrReHtvK
X-Received: by 2002:a05:6402:190a:b0:6a1:df2c:cfa3 with SMTP id
 4fb4d7f45d1cf-6a40325446emr7813268a12.4.1787230112538; 
 Thu, 20 Aug 2026 05:48:32 -0700 (PDT)
Received: from DE-PF5B95TD.embedded.cmblu.dev ([87.129.199.250])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff1563c5sm2270449a12.14.2026.08.20.05.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 05:48:32 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Wadim Mueller <wafgo01@gmail.com>
Subject: [RFC PATCH v2 01/14] hw/i2c/omap_i2c: add a dedicated CONFIG_OMAP_I2C
 symbol
Date: Thu, 20 Aug 2026 14:48:01 +0200
Message-ID: <20260820124824.618671-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820124824.618671-1-wafgo01@gmail.com>
References: <20260820124824.618671-1-wafgo01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=wafgo01@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The OMAP I2C controller model was only buildable as part of the full OMAP1
SoC (CONFIG_OMAP). The same IP is used by the TI K3 family (AM64x and
friends), which shares nothing else with OMAP1.

Give the device its own Kconfig symbol and select it from CONFIG_OMAP, so
that other SoCs can reuse the model without pulling in OMAP1.

No functional change.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 hw/arm/Kconfig     | 1 +
 hw/i2c/Kconfig     | 4 ++++
 hw/i2c/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 260d2f0751..b2dc2714c0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -137,6 +137,7 @@ config OMAP
     bool
     select FRAMEBUFFER
     select I2C
+    select OMAP_I2C
     select PFLASH_CFI01
     select SD
     select SERIAL_MM
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 0766130b59..e7c0e2f8bf 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -54,3 +54,7 @@ config PMBUS
 config BCM2835_I2C
     bool
     select I2C
+
+config OMAP_I2C
+    bool
+    select I2C
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index 88aea35662..760724e7bb 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -14,7 +14,7 @@ i2c_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_smbus.c'))
 i2c_ss.add(when: 'CONFIG_DESIGNWARE_I2C', if_true: files('designware_i2c.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
 i2c_ss.add(when: 'CONFIG_ARM_SBCON_I2C', if_true: files('arm_sbcon_i2c.c'))
-i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
+i2c_ss.add(when: 'CONFIG_OMAP_I2C', if_true: files('omap_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
 i2c_ss.add(when: 'CONFIG_PMBUS', if_true: files('pmbus_device.c'))
-- 
2.43.0


