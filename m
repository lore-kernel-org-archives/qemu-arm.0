Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E5BCA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:30:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLKG-0006np-UR; Sun, 04 Oct 2026 08:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLK6-0006g2-GO
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:13 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLK4-0007Ct-OD
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:10 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a024e16179so5303275e9.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116887; x=1791721687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dpeBBEaIpLpaS4+X/utnrrcEJhOGtEKxyNyaVPPXqLg=;
 b=IeWzepzgVGfpc2SqBQgGUxYbmbmS6ikuxnnNmA2laVxHNqwNMnZ0o1o2wNq/TnugbH
 NNUaJ39rfkAKRxPF/9H8Zu+GPv9CVeKMV/OdZB6qcW5UncYeBGLjDp2OGrVDkG8L9Kyd
 HSvBN4wOJyw3CtCc3brUedPOe4aLK55eKEOK3FS5mCzMaF8J2W63I7J5/AgcZ+RgvhFL
 lM2O4xErx3wHlhYzMtwlm38E7KDNsHQwmrprV2neQ2IcEtzKJa4Dj/2S1ErQ7HdOzeB2
 mBu/UVtu8jVCszEk6M+HNiOKTi29ak55dc0+JOijDulOk7hxy7acRlVwl2IRzoPOQr02
 XWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116887; x=1791721687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dpeBBEaIpLpaS4+X/utnrrcEJhOGtEKxyNyaVPPXqLg=;
 b=IzQToWVgHGdCh3jvf/o9D11SXRVJkBy1+2jagcYVHqWj0GJu2UxyTbxW8OUmIgAiiJ
 JF1pP/ZzFJiwOGjaBpIuR5mKt7aq455tfVLeQuQZetED/o6cuORmbPYjEgCMBMOPjdg3
 gqcczg648LHHTWJHTMCIv9Uiwsf8r7UbotO0suOQCN3kcSuqZExqCKz7m1H8/19ze3RD
 lEEWGSZyUZidg5bCVtnzvYLVsXH0IG+/m2L7kBb0kGwkX9BVyruKkpKs56uW6Fwa5nEk
 T8F8ImCsJ7EhHvdFYxA8/NIwBAs7ryE+unYXUWMtMgjn6+mz2x5WTQECojwUscaAdkrQ
 jz/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7JsoNFmtTW+TAw3sTEU03wdeanzd0n2hIzl+MbEKs1EkVYEgJIWhjIzSbyrbjDAT6zhP1y0bHVA==@nongnu.org
X-Gm-Message-State: AFuF++n2XpBt00Hxhsu8u7kzp+mgPyN9Mv1OV3xRFRizs+kc9/mD4Txn
 8hwQDrIem0CPteJA21T4IWsbkYaCypM1Q0PfdSsLvUESvtg3pDIwA0do
X-Gm-Gg: AYBFou1RNPN6zk6c45kakAwbmRoxFCHe/D55cJmHMEd5YNN8BjgT2NIfEaCahEi5JRN
 Jn14JypWBoOWLvZSrObejPURbI8beX1ZoKeKKBUT1bATLKytfb3z1lJ/E7wINaieiiBCD+t91g0
 6dhry0RNzRhMlyXio7h6njKWiaiiUdjVhggQRf696PpD5Sj8YqCYZZYv7Tx61oVncBLLW9D2gJy
 OnyS6lgLt0x2F3889Xpxv0Ls7m0DZVPpfxEKz9XJRQBNNiiluKkowN58gyIQikp5On9YkNbW708
 Og9yNnAFbdBPJcIC6uaY98OPnWEBFi7cw9waOExe8x5c2XLGlnTe3TtR7WpuRyKYMD+JOt5+yRB
 9zou/I6HhzmitdlK1A6zAsyElhS4EsZlx/IbYS8xLhiVTUr5Yuw1/o+ay7DDsn+8CXtiTwsn4OW
 wLXW2W8U0qa4iMeMmV6BYs2ZSycXtVGdqAj789mwoahpBy555Q53Dgtr6sH+YLK+9gy/3Xm80Lv
 fl8ysH7loYlJCsiZiGjvPnY3Rd3KwyRAsBOWQ==
X-Received: by 2002:a05:600c:3e14:b0:49c:fa20:cc00 with SMTP id
 5b1f17b1804b1-4a027585559mr137697865e9.23.1791116887341; 
 Sun, 04 Oct 2026 05:28:07 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:28:05 -0700 (PDT)
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
Subject: [PATCH v2 21/30] Kconfig: Extract config FSL_IMX{6,
 7}_SRC from config IMX
Date: Sun,  4 Oct 2026 14:26:37 +0200
Message-ID: <20261004122647.3913-22-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


