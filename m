Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB2CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 06:09:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEKp3-0002ai-Lr; Wed, 07 Oct 2026 02:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFpK-0006Al-EJ
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:48:31 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFow-00075a-4F
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:47:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c2e5e090746so113614066b.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791333823; x=1791938623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J5OCQgpKOCMZqorLrJ22HODBlNjDochoy+w5/IJQGaY=;
 b=rUZDa026eTdwj+mqMNEeeqqePsIrH4EFAoe81nhRtTE+WTBxGW9mOYC+vezgoHLIki
 kqPszDpkJFObGAqsZcDWAjzrIs0SQh8bvQke2QkWK1qHVEXaZQIacX6UU4ZVp1T9znGF
 WlnAn56oorLRbNW4UTnav4eZRc+NBfdV9d/oKGM2h7dJkdstdyMdV4z/YZgLJxwXZV1i
 +PJr3Z+iuc4fMKTTiXTBrjbzWLVk5nugtUEAInbOSYCYFta/BY8OCQdeFsqT6THOWifw
 PdbHISz3wvJeJqbZycDQW4REzRc6kUtKtIaCdk0jXsQjxP6Ef4PdjW23tPYLJNb66pHX
 oXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791333823; x=1791938623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J5OCQgpKOCMZqorLrJ22HODBlNjDochoy+w5/IJQGaY=;
 b=hz5mKYoB1XYnbYWoUT7CymCnN1OOoAb8oe8jZMhTIopGr2tC9wTAhipCQfYL3bk0qs
 rdg6zcZpmpbJGdaQaWrvLs/CPpEeAPWNpQtNMmW/FRV0YEwRDiNxLPfFlRQJ4V+Hjos/
 WpSwcvQ+qXX3K/a/Fngy9D6O6zOhkRRYvY60uaLL9TxelpOJeU3ijIbI7/EplDc3+yrm
 ACb1wa09jFXEJK4UGfWc6eOoIERqgERwmgW+S+l7PsQOSdKijGKZVfH9o3a3j+EzlCbC
 lhCHRcLjk1c4L9VXKHECFeR/LqJU/K8mL2FCmrYj6HIveYb+ypp2RooamaRkg/ys1AGa
 rq3A==
X-Forwarded-Encrypted: i=1;
 AKwUvBytn0GZ8oq/hXU8JJ0VeGg5nFqY6qIyyQpzdPssBGFGwo+tUEMW94iNVM5OoPUUoq+j7XqdYix6/w==@nongnu.org
X-Gm-Message-State: AFq9FYKK5y4VGgjj6oXKUu3v4SlNHzOKZdRXLVBcJO5Q6QnFeqkFOTjg
 C5DrXrqedUtZV8zt1ujwH5ZxJ6X850XSwAMFZ12rXjwIop8x/xwT8DHHdTL+fg==
X-Gm-Gg: AYBFou34AUG3eswogJ4kYdappOABTjMZf6ld5YT7Gm8gdSx9PPfT6fD9YPdWrBwuGEo
 UqnAJj8UZR/f5b3dwmlYPnojJq+EdAquegbhcqgfwN391UV0wxcBziENOWFewPG2pgV4LY2fzsQ
 JYP8k1l/J8EPxL+JhDWRRX1CEwJvmG9JEsCOtmnfMBQduwZhMTtnbTxlfZQGPyvjJb5XPmWg2sW
 9hlRHsdsdoDlt51+E8WL1jQ+53RSSogpcJR2xCrrmQWpe6Hfv6lxh86zQlvuYRlweTRDP8n7i4T
 Q2scESpCH1xHGaxFsdckYl7iSFSTNaTGpV8aqLWuKQuPkcQDeCCGd1s+FBYscbME8TW5bgeDvji
 wV5x0anua9wBk55072oiP8aXFsFB4y/N1rDRyprk1sUFT+nmwq/91JAAzQDllikwy5pOIhTHvZw
 ttYB7CewT1IZpU9araCAgLyRF85ia3Udns17LnvXlTBn23CK3XA5E9UFm7GL9Gfshc+YePMPFT1
 xK2oM1TeH+FSNtopnHYWW9v+mMy0SIWy+q0zw==
X-Received: by 2002:a5d:5f55:0:b0:48b:5e5:664f with SMTP id
 ffacd0b85a97d-48c6d1a0fcdmr1227514f8f.18.1791275747288; 
 Tue, 06 Oct 2026 01:35:47 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:46 -0700 (PDT)
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
Subject: [PATCH v4 22/31] Kconfig: Extract config FSL_IMX{6,
 7}_SRC from config IMX
Date: Tue,  6 Oct 2026 10:34:34 +0200
Message-ID: <20261006083445.30362-23-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
SoC-specific config FSL_IMX{6,7}_SRC to eventually eliminate config
IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 3 +++
 hw/misc/Kconfig     | 6 ++++++
 hw/misc/meson.build | 4 ++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 51fa2e2ee4..edd3bf0dc9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -505,6 +505,7 @@ config FSL_IMX6
     imply PCIE_DEVICES
     imply I2C_DEVICES
     select A9MPCORE
+    select FSL_IMX6_SRC
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -580,6 +581,7 @@ config FSL_IMX7
     imply I2C_DEVICES
     select A15MPCORE
     select FSL_IMX7_GPR
+    select FSL_IMX7_SRC
     select PCI
     select IMX
     select IMX_FEC
@@ -661,6 +663,7 @@ config FSL_IMX6UL
     depends on TCG && ARM
     imply I2C_DEVICES
     select A15MPCORE
+    select FSL_IMX6_SRC
     select IMX
     select IMX6UL_LCDIF
     select IMX_FEC
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cf9ea68219..193a6b5f56 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -97,9 +97,15 @@ config IMX
 config IMX_RNG
     bool
 
+config FSL_IMX6_SRC
+    bool
+
 config FSL_IMX7_GPR
     bool
 
+config FSL_IMX7_SRC
+    bool
+
 config FSL_IMX8MP_ANALOG
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index c31c173e5a..477fbd60fa 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -60,7 +60,9 @@ system_ss.add(when: 'CONFIG_AXP2XX_PMU', if_true: files('axp2xx.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
 system_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX6_SRC', if_true: files('imx6_src.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX7_GPR', if_true: files('imx7_gpr.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX7_SRC', if_true: files('imx7_src.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_ANALOG', if_true: files('imx8mp_analog.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_CCM', if_true: files('imx8mp_ccm.c'))
 system_ss.add(when: 'CONFIG_IMX_RNG', if_true: files('imx_rngc.c'))
@@ -68,10 +70,8 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx25_ccm.c',
   'imx31_ccm.c',
   'imx6_ccm.c',
-  'imx6_src.c',
   'imx6ul_ccm.c',
   'imx7_ccm.c',
-  'imx7_src.c',
   'imx7_snvs.c',
   'imx_ccm.c',
 ))
-- 
2.56.0


