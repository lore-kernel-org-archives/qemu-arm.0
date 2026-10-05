Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D68CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqO-0007VF-NT; Mon, 05 Oct 2026 06:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmn-0002Oa-Ea
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:19:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmh-00013S-As
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:19:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso13337195e9.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195541; x=1791800341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TSgSmbIol/w3uLzkMCO+LFEzRwoP9tuMmsJ3pCoOB1Y=;
 b=VJut4+7/hsIupQgDhEjkuS7gyaj5WX6MikdqBlbdADsDv1P4N2M+1LNIgQh+p/B7xi
 M2/Qtrfe+exzjJ4dA7JxQYz1UcRDiH7SKB8IkkhSethR5P2RVajw6gKElL9RzE7myzWG
 z9iTIgOccJkwewajx4Ff8ChgUbEdDp22uWDmurVftKdY/WzdhRxViy0ZGPyLAWcuu/Yy
 9sv9QVHsZJEZqga2z+usKH+9lquTiOjhbe8uxy7qgApA7xc3nb6kdTvtaavTe4JZKKcT
 ztEmJKvD40HX3Xtr/v7elizkiLBgkfM2oo33GQ1HPkGP0E1qdB7dfYzjOCt0jQaLgG4y
 gtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195541; x=1791800341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TSgSmbIol/w3uLzkMCO+LFEzRwoP9tuMmsJ3pCoOB1Y=;
 b=0hNYi5OhykwWsfNH+dJbVUuSgYO31nDc+lrJcuUE/bhv2H2SCy+96ZBUtWZH/fNL4E
 gEo1F/ey8ggkCvZn5PiW2Yk36566GIyC1DhkQQuKyLD/CVi+PtwZMcil4KzmCpv/BRQk
 4FKexM/TbC3Io2OFU0rz5spkXi6N/216cZeLuXMeKsaolYKqsFzU7XxDcQi+j9ttvvpy
 1uH5rFKIXJSNEzHCdfSSg3C/vZOwThuU/VlflM06EIBJNcP+tljY0x1P87h3WVBUh9/H
 dohoLLIlQB1UtUqR2fCFWkbg5CPKxteyqXPE9512UjuFvnzOvaIIdiIJU1r0eBWKHzNv
 rxnw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1PZYp5Y7aHjd4B+CWlaPd177wtM+YsJKQA+u/ZgUA0OmuUlPVKc+ixHh98khvDL78G6cpvJtSdQ==@nongnu.org
X-Gm-Message-State: AFuF++lLDBX4qzbNji7QPxsHPxw7LgR1d+4cLAE0btZVqWsQ5znsicGS
 o0jZn7uCpL2MkTTrIioUWzfwYjkF7nqZDLlQcZrzUQ66QtfSw8vRVzWm
X-Gm-Gg: AYBFou15mrhvYBFtXo3era9PmQBscBWxBgei9FT0filp5CIS6ZdeDg4wX0/t+Du3V2Q
 UFS+OTknMBZG9gejXU88mQuDJ+HxQhLcVMB1S8wVuad8idcvwxbasq7KvglrmJJow/1R+42f9Vx
 5D0ZNuP6QCA+tuLcsa44W3HSt9Rt0Oxkt2vSuKv8QG8Uq2nBIlmGD2G9QRjaqYDvxTxzzTOSc+M
 CCoSmOO0Xv99qu1eX2V7Hv92qfamGWRwXfA7nw11VgQb55uml+AMTRpbcCHW93PbB1FZFXl8OhY
 iaI8XOC09pDXKQTGq28TZJPFbj9CXI1rdIy8o9wmQa/aNLhuYBw7N3cxpKvzU0iRaTmDUQJG9f4
 JWAoVBBt0vq7PNk0d5o2NLL3we51e8R0VkH2BigtDu18d/4JlDRa8eQK9usn9x11Qg+JqKpepl+
 34YtJSsCJn7P8EqfT1YMNcB+1UbxNheurBAURx0KyHHF61d5MtznMwp/89xdodyhY4nisH4fLKx
 9deNMNrsopITiNgKAIVvuN3R8scf3ZOMgdSLQ==
X-Received: by 2002:a05:600c:4f4b:b0:4a1:6dca:51e3 with SMTP id
 5b1f17b1804b1-4a16dca51eamr92349625e9.3.1791195540744; 
 Mon, 05 Oct 2026 03:19:00 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:19:00 -0700 (PDT)
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
Subject: [PATCH v3 28/31] Kconfig: Extract config IMX_SPI from config IMX
Date: Mon,  5 Oct 2026 12:17:55 +0200
Message-ID: <20261005101800.10821-29-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
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


