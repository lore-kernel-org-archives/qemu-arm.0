Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B4ACA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:46:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEND7-0001v8-2K; Wed, 07 Oct 2026 04:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIc6-0005dE-Gt
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:46:50 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIbu-00022q-Av
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:46:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2acc1e170cso204321666b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791344721; x=1791949521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MtjyPqAx1DBfXhNfiNBwnE4QmFljId/OHSHkX1Y8u+4=;
 b=NZhXCuWvmxCGJsiwrM4lwv0/ljfl3jr9iCenC2RzfJGEfMbazekTLMSY6srdk3vcr1
 dQ9RTEgccWlCcIFPeZtxjHDjw+ksTH+ns9gpkMlXsdtMb/1d7Qvpz60wb2wUP9w4+B0Z
 YKL93WisiDMS0r37u5FLQk0EpbS7oU70VuAgtvfffXtrNZ2ih/M1PUhVgqLMIgP5GXdu
 zL4ai2oqu6p0+fho2MHwKiTICpnbIpiO2hUXvZ9r6B2JIoDSsqWmETE3nn87wpMRZIuW
 9zxjk5jhrKSGfqyCA2LDFeBNnnw5DFwMffigtlm6hADlcHD9f2r518P4MZyd4gHvCoCX
 lorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791344721; x=1791949521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MtjyPqAx1DBfXhNfiNBwnE4QmFljId/OHSHkX1Y8u+4=;
 b=IRs8/7A6t5vAcVD5xJwvPnC/Qt9c4jPnI2wWzlChdXmOLVwfJgnlhbJZwtAGAty2kc
 3JlyHU21Lv2Vdp2wFLXHuLe22qYve1EwKFgMtl80INzYNb+0fh5EjJBJe9xNf9lTH0ai
 Bi883ASbSQaeb6lPD+rYiVXJZ9WibgLvQ078EKSgNqg9I9cvSKPf+lc2bmrJfDxdqoJ5
 9VeDbDbN6UO017PDeqrtLu5YclM3wVeX82nH2eO7yGT5qFucdnSs7f76VrPNDvh0HeRY
 IExomCLVXGnJCgJbZ0vECPrbgO7vYvYexFkYScHN22rU+U73KrMGtcPr1Zf3htm0NrAC
 L2Mw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwk/3pImKRu4fAhKFXL6MtBBf+bu4TNUikknVumXDrGxB9EvCqP4P6BsHF+Cq3Pjf32T50qZLJ/4g==@nongnu.org
X-Gm-Message-State: AFuF++lVE8gn1GHdvi2TOZhuJBizVzLZFlXCXc/XbWbUiOZBGWr0sTUs
 tXHdpAq1/NHVuDzhf5zFx+hWzIgvJzTPRpT3H39tG46LQnElF5AQJMvTZ2S95A==
X-Gm-Gg: AYBFou0t67xRF14xK6BKKqynOmhitE4O2UUyMNHRmB/Zcaim+BwWZ7WagywUT+UQCu7
 Q2OjDEd/QnBuQOiQHdWdRJRYZIyhxNzQwIdmK+c9DniF1h98alIJODe8n9W+50ZCWHnRahJjrI2
 hvy9vvs5COphhk7FU5uhCUYJ3GbWJaZFl6Wl4RL/8ZySeG4xtN9O8jqKlHeCNhpcKK1UoZmPpIi
 zgwn4fD31otKnU/TAiRHXhcpzMELLO+HTBWrkLIGcwweo0HwvvO+94KozifbYA/nygiU3z09iBy
 6+7gPj4Somx2udglLlSjQtBCBEBvsR2PWCJM9TsS0WEHo/xBFVs4LI2l9HmhePKozztTo0H7S7A
 lgPA5vtNx5EQSyEtSf7UR+lhuOIy/gjrUUYfRqSFVQN0n1VhEpy+pv+isqHyYUWyAOTjwOIQYox
 Uw9sSgSS6skjaRiFq6c5mnoUzyivFNGgUPeUhqLDZZc0QFBq0jKaQUnuYfiZGzAj/0/KG9w08fE
 2iyWTUTYl24dTqambvWLgPZ7avfoAptq+GgXg==
X-Received: by 2002:a05:6000:2203:b0:488:89c7:31aa with SMTP id
 ffacd0b85a97d-48c6d1959e4mr1280488f8f.39.1791275749594; 
 Tue, 06 Oct 2026 01:35:49 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:49 -0700 (PDT)
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
Subject: [PATCH v4 24/31] Kconfig: Extract dedicated config FSL_IMXx_CCM from
 config IMX
Date: Tue,  6 Oct 2026 10:34:36 +0200
Message-ID: <20261006083445.30362-25-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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
SoC-specific config FSL_IMXx_CCM to eventually eliminate config IMX.

Note that config IMX_CCM represents a base class for i.MX clock
control modules which is used in i.MX timers and FlexCAN.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      |  5 +++++
 hw/misc/Kconfig     | 25 +++++++++++++++++++++++++
 hw/misc/meson.build | 14 ++++++--------
 hw/net/Kconfig      |  2 +-
 4 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8d857d8bd1..dada9f57a7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -479,6 +479,7 @@ config FSL_IMX25
     default y
     depends on TCG && ARM
     imply I2C_DEVICES
+    select FSL_IMX25_CCM
     select IMX
     select IMX_AVIC
     select IMX_FEC
@@ -493,6 +494,7 @@ config FSL_IMX31
     default y
     depends on TCG && ARM
     imply I2C_DEVICES
+    select FSL_IMX31_CCM
     select SERIAL_MM
     select IMX
     select IMX_AVIC
@@ -505,6 +507,7 @@ config FSL_IMX6
     imply PCIE_DEVICES
     imply I2C_DEVICES
     select A9MPCORE
+    select FSL_IMX6_CCM
     select FSL_IMX6_SRC
     select FSL_IMX7_SNVS
     select IMX
@@ -581,6 +584,7 @@ config FSL_IMX7
     imply TEST_DEVICES
     imply I2C_DEVICES
     select A15MPCORE
+    select FSL_IMX7_CCM
     select FSL_IMX7_GPR
     select FSL_IMX7_SNVS
     select FSL_IMX7_SRC
@@ -668,6 +672,7 @@ config FSL_IMX6UL
     imply I2C_DEVICES
     select A15MPCORE
     select FSL_IMX6_SRC
+    select FSL_IMX6UL_CCM
     select FSL_IMX7_SNVS
     select IMX
     select IMX6UL_LCDIF
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 4d47de6a02..a2095d64ae 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -91,15 +91,39 @@ config ECCMEMCTL
 
 config IMX
     bool
+    depends on IMX_CCM
     select PTIMER
     select SSI
 
+config IMX_CCM
+    bool
+
 config IMX_RNG
     bool
 
+config FSL_IMX25_CCM
+    bool
+    select IMX_CCM
+
+config FSL_IMX31_CCM
+    bool
+    select IMX_CCM
+
+config FSL_IMX6_CCM
+    bool
+    select IMX_CCM
+
 config FSL_IMX6_SRC
     bool
 
+config FSL_IMX6UL_CCM
+    bool
+    select IMX_CCM
+
+config FSL_IMX7_CCM
+    bool
+    select IMX_CCM
+
 config FSL_IMX7_GPR
     bool
 
@@ -114,6 +138,7 @@ config FSL_IMX8MP_ANALOG
 
 config FSL_IMX8MP_CCM
     bool
+    select IMX_CCM
 
 config STM32_RCC
     bool
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 48c5c20455..6ff31183a6 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -60,21 +60,19 @@ system_ss.add(when: 'CONFIG_AXP2XX_PMU', if_true: files('axp2xx.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
 system_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX25_CCM', if_true: files('imx25_ccm.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX31_CCM', if_true: files('imx31_ccm.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX6_CCM', if_true: files('imx6_ccm.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX6_SRC', if_true: files('imx6_src.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX6UL_CCM', if_true: files('imx6ul_ccm.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX7_CCM', if_true: files('imx7_ccm.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX7_GPR', if_true: files('imx7_gpr.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX7_SNVS', if_true: files('imx7_snvs.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX7_SRC', if_true: files('imx7_src.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_ANALOG', if_true: files('imx8mp_analog.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_CCM', if_true: files('imx8mp_ccm.c'))
+system_ss.add(when: 'CONFIG_IMX_CCM', if_true: files('imx_ccm.c'))
 system_ss.add(when: 'CONFIG_IMX_RNG', if_true: files('imx_rngc.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files(
-  'imx25_ccm.c',
-  'imx31_ccm.c',
-  'imx6_ccm.c',
-  'imx6ul_ccm.c',
-  'imx7_ccm.c',
-  'imx_ccm.c',
-))
 system_ss.add(when: 'CONFIG_MAX78000_AES', if_true: files('max78000_aes.c'))
 system_ss.add(when: 'CONFIG_MAX78000_GCR', if_true: files('max78000_gcr.c'))
 system_ss.add(when: 'CONFIG_MAX78000_ICC', if_true: files('max78000_icc.c'))
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index b56a173eed..4a2cacbcd2 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -160,5 +160,5 @@ config CAN_CTUCANFD_PCI
 
 config CAN_FLEXCAN
     bool
-    depends on IMX
+    depends on IMX_CCM
     select CAN_BUS
-- 
2.56.0


