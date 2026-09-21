Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFFEC982FA
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8ls0-0006XZ-Ck; Mon, 21 Sep 2026 17:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lry-0006WN-C1
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:14 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrw-0000LO-GQ
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:14 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912e64ccso25345955e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027281; x=1790632081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OzhRa5WZErjDKSnsFSp09xPTqIKiu36xV3p/Eh/hbK8=;
 b=rKPan67YMcrQG9u4jFJ7NQv2EwYkTK4lgG6/GzBnsS0WJhF1aZG2fhtA5XVYhkWnhS
 JVLuCVj/h2h37B3cG+G+r9eJGhuGnUtn3MuJhbZxWNoQ7pjP7HKKN7pPDEMX4+wJNY9M
 Z+YxgY1wpdNfmcLwVEBkqilUu4IzLwOrzfwIDMORHqlcvJVAYW0lE+VCJR6oBj+hOsjp
 /7klCTyVk7yWQZe6EhayaKK6sd32c0uYB1NcUKPj/4va0H0uBSac+auUDfi0tHsuZkGR
 /TIF0wEi3pWJONk4zOHYbO+s2KAZzo4TnI+5/siOUNMzgsFWWfvb+O5q1DZst4b+Hgyq
 WuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027281; x=1790632081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OzhRa5WZErjDKSnsFSp09xPTqIKiu36xV3p/Eh/hbK8=;
 b=EoKDzEpSm6X0baA8PNAjDJpMKSSPpNBlduydrCjgZPA2cQh+XUGHR0t9sT2Z1Zx3r0
 WDHJVUeJI2sStqDY4D/AVVo7jFriXPY0GnrMjbcZWIee/Gsf1uZrirfLPeqeXEfj2p1U
 N/32Sl6V1d9JiFlox3GgT598SCfnNfNkVFbyDbeZxn26Id9YIVsjZ/v3N3Qi9uK+4iGf
 D6cT4ieNyWk9iePQWX9J3LW799Qj8ELuHuKqMWpB+lTFEw2u6TsIuz1ZeMNxrHJsMsKL
 IsczWjWAsilJirPOyYn0sDopXoGc7CcTF8fEup7h9nVfRIuIBTwyKdlyRHkfLdAg75O6
 hI6g==
X-Forwarded-Encrypted: i=1;
 AKwUvBw4H3dHschK28EtEgQHdoaLE5IOhCMYtVifi4qqjXYcYT9McaD8T+1czwOJckS07yZnya6AWeRmIQ==@nongnu.org
X-Gm-Message-State: AFuF++nFDM0+ldW52qvLB1x+e2ecFCpSM2I67NWz9j3m+bBZPg+9j6GA
 21VEA7Q3TJs9B1aVwwXnxtO7BKn5uMY77jdzGORoGPhNe9+SBivZdwfd
X-Gm-Gg: AYBFou3FvlhlrFZzm3x/lGdOL6SPot+zTTNcobgV4oKoOA4Ok+8wuBtDjbcyu3DOXyF
 JNsQM8jwQy1aN6ZpMNvZ9oEO6Nc7VXwLBC1ZdKyhPVNpWKh/e1CI/giPoimqxjVlWtIceN3f3o3
 rCDT6wC3qTgsQ+Ek93IDLaCba8d9jGWr+Msk6I/ueIsYR/aleJLf0A5UvvQ73ZxmUSthFGlcGVL
 N70S4YMW4HqKTtvWwLF7UvuNCAkrcaEiH3gLnSRpcZRw7eOUStfFPaPuj6xtNVa/zUw+R20Zsgy
 lfoLANntcfD8aS5l74sEODqEwLahJL4gQnRgpOUgMUiYo1Au/5xpKJdeGvBrZznZNgfdPoThjSo
 OtzETbNTQUSGuFw2AGvhnJpvoCCKC7MBfWpAjbEEdwhnfIVoEKJ0LEOYzdbZwVarECs0ptWKHL0
 mcJt4Pn6O12yQmnMalQi+spUBXOjQ3hu2dUpNKONYAQWeS56iIL2rX8/Q6A7UCYU0EvgzA18NIA
 Qdi6OyjfxSM3yZw9dgp0v/ry/N6dRl1xD16QHYryOOLn9eNoI+EtqNmH39lOfmEk8//VlpUyMnP
 +6g=
X-Received: by 2002:a05:600c:6095:b0:49d:17d4:aff2 with SMTP id
 5b1f17b1804b1-49fc566e558mr176680175e9.1.1790027281060; 
 Mon, 21 Sep 2026 14:48:01 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:00 -0700 (PDT)
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
Subject: [PATCH 26/42] Kconfig: Extract dedicated config FSL_IMXx_CCM from
 config IMX
Date: Mon, 21 Sep 2026 23:46:54 +0200
Message-ID: <20260921214710.29422-27-shentey@gmail.com>
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
SoC-specific config FSL_IMXx_CCM to eventually eliminate config IMX.

Note that config IMX_CCM represents a base class for i.MX clock
control modules which is used in i.MX timers and FlexCAN.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      |  5 +++++
 hw/misc/Kconfig     | 25 +++++++++++++++++++++++++
 hw/misc/meson.build | 14 ++++++--------
 hw/net/Kconfig      |  2 +-
 4 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index cd9ddeb822..0649417305 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -478,6 +478,7 @@ config FSL_IMX25
     default y
     depends on TCG && ARM
     imply I2C_DEVICES
+    select FSL_IMX25_CCM
     select IMX
     select IMX_AVIC
     select IMX_FEC
@@ -492,6 +493,7 @@ config FSL_IMX31
     default y
     depends on TCG && ARM
     imply I2C_DEVICES
+    select FSL_IMX31_CCM
     select SERIAL_MM
     select IMX
     select IMX_AVIC
@@ -504,6 +506,7 @@ config FSL_IMX6
     imply PCIE_DEVICES
     imply I2C_DEVICES
     select A9MPCORE
+    select FSL_IMX6_CCM
     select FSL_IMX6_SRC
     select FSL_IMX7_SNVS
     select IMX
@@ -580,6 +583,7 @@ config FSL_IMX7
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
2.55.0


