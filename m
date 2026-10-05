Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E5ACA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfp0-0004bf-Fj; Mon, 05 Oct 2026 06:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmX-0002I4-5Y
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:57 -0400
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmT-000107-Lj
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:52 -0400
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48b059eae96so1359699f8f.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195528; x=1791800328; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4JrZ7jM3Cirkz5k2sQscGnyc7KzNuKYfGRblsF+5rVQ=;
 b=YOrrl894IHblM9UmdKqfRLYK/i/6qhzmIViIdHq0RxLhDySaU/jTdO7n4vzedVkvSL
 nDR8Oaz96wAstu6kVHTdnOAIrUUJ4bt+sBHBpwl5lRoViAZO0wDdR6xzWTu9yV1YEkIn
 jhD5OctV5GHxdsFlH+DYN0k9XRHULWTFbo8fUh6Eam5QicLtx550JD7L1w+LBJSB/Uzq
 1ZNSwMJnIum0wqTHJq4FVPA7QoIhTcT9VJX57yJbR/JJ8awRrK2k6fR4jNBvz5vBRN00
 +hdzR2pwBk49+Rll3wdGDoetnLkGbGCUc6zNLxn9j18bI+Iyp3GqhqB8/kLLupuPPG0R
 gEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195528; x=1791800328;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4JrZ7jM3Cirkz5k2sQscGnyc7KzNuKYfGRblsF+5rVQ=;
 b=BW3MWkUer14esYE5qqXCKt+AZtku/A9rTmIqF5X7jPrcTFy4OFXlzkHpX5uOILJzOb
 X6R+M6MjdJvy+7m8N94Wlv59QmBreANls+MN/MlNM+z6Sxn9uHPjT9M36AiZLVMfd4nZ
 P9Z2+PxsNyq4mDIpecxK1jEE00rgb15Gk2ATB6CDGKViS8xz4AJyLMGDgnFrZhBa3Vfc
 BSARYm2ZuHMpphDDdNRo2RNdF4GF7lMloUd2WDL7cBC1bEkGT1KiOvVcu6+/7UXE9/yd
 dgzngvJ5T6lsa8hc8aUVCN9UZCmLUcbt8k1ihArmd4awin8AYIPQR/L3gB8Lz7xdobo3
 mtug==
X-Forwarded-Encrypted: i=1;
 AKwUvBzlKopRBUPzIuBYh0qg/G9D2xag5oi+kE8HlnaSzAyxVYXjAAVexnL5SjRni4LY0llqB57svHA1sQ==@nongnu.org
X-Gm-Message-State: AFq9FYLG+sw8pUzncy+Ieg2wL7ttJonHm8l84xGJf6jcm2p+Y0D7nj1Z
 4Gv4zw1Tllu8NokbzvbVvg/ic75lMHHcPQIyAxtofMEWd/lsSv5NEx1h
X-Gm-Gg: AYBFou3t2gz+lzs8rQYpnMCg2rnRwT62tsunUvMURH5ci0xe/d6DTqcuzUOv4XLE2AJ
 rgCV3MWHhgVRJL8wa6nO4crgSuAiBjznqqWweuXWfzjKKEPXp9zOZUPAREi6+Z0/yc0NFEW/LAA
 C58lWuY04iRkUNwVCnqyvSpNja9BKVxRxDFI9+qllCmLgZAqjzdE19GN3ugkTxnuyS/QO4uYUhJ
 b7pAqlvgHcSWKk/CJ050zE7ukJxzPbEVUK8jzaM+Mylk4zD8PBh0vgNenP+xYdQkN0+TFePH+wq
 11eMk+exW3IN4mbqnl8go/wOMUV7Sl4ARp4sgqbdw+uoIkz6w7IHdIGwBxux+uMHbuwAT6YInXN
 Qw0GehemaRolB1xplkdcG70hZqOGjJhnJGK3QG1eZbG1A46hyoeleyH+0UQzNMJ3GTbzfyxgQNt
 4QjpaVxOu7ITRIMPPyABbY1YtRgxVnMTVjNuSBH+Btqjc1khU/hpwyG4dU3hYe/9695cCCY2Flc
 NKgLr8BV0N02sq+sluOLpd0LGyBFVIU+NXtGBZgufvvEYVz
X-Received: by 2002:a5d:5a42:0:b0:487:219e:5e20 with SMTP id
 ffacd0b85a97d-48b12744cf2mr13082134f8f.51.1791195527840; 
 Mon, 05 Oct 2026 03:18:47 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 19/31] Kconfig: Extract config IMX_GPCV2 from config IMX
Date: Mon,  5 Oct 2026 12:17:46 +0200
Message-ID: <20261005101800.10821-20-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::f;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0f.google.com
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
config IMX_GPCV2 to eventually eliminate config IMX.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 2 ++
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 030b218eb6..a33f5a46f9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -581,6 +581,7 @@ config FSL_IMX7
     select PCI
     select IMX
     select IMX_FEC
+    select IMX_GPCV2
     select IMX_I2C
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
@@ -661,6 +662,7 @@ config FSL_IMX6UL
     select IMX
     select IMX6UL_LCDIF
     select IMX_FEC
+    select IMX_GPCV2
     select IMX_I2C
     select IMX_USBPHY
     select WDT_IMX2
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 97355f9df7..98dba7efb8 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -8,6 +8,9 @@ config I8259
 config IMX_AVIC
     bool
 
+config IMX_GPCV2
+    bool
+
 config PL190
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 74d84b8ddc..2ac575095f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -24,7 +24,7 @@ system_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 system_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 system_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 system_ss.add(when: 'CONFIG_IMX_AVIC', if_true: files('imx_avic.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpcv2.c'))
+system_ss.add(when: 'CONFIG_IMX_GPCV2', if_true: files('imx_gpcv2.c'))
 system_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'), if_false: files('ioapic-stub.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 system_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
-- 
2.56.0


