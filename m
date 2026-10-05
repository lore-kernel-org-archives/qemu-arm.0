Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E17CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:24:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfpm-0006Q3-UJ; Mon, 05 Oct 2026 06:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmc-0002K4-V7
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfma-000128-VH
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so10614945e9.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195535; x=1791800335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MtjyPqAx1DBfXhNfiNBwnE4QmFljId/OHSHkX1Y8u+4=;
 b=L7Bykl+D6UmyfQqIJdr1qCJdzz4En3bySBeGc6+9JTJ+XXPyarZgF5oAFiTdCQcskK
 AxwVPA6k6ZiEI0pronZKBWv+MOCCnn6xlEeESNTBsuv262zbmVEv246ZnjLjd0HaqXiX
 1hcDA+CsD/zcWxFcvdM77nWylPxd/dMOyE5Dr03o/6cpvy2Vxru/mcGHryoR5hrSeF/d
 4UF72mseke7gPj6/WXC0OyqAQJMZ4jQDnqujmOGkFE995gfD8IGuaujO0NDZl0fDuqya
 IP/UrJalZTm1B62oXkpug9sydvV7bA05O8Zrc2NWGMcvh2AQW9TbK0UX447RWr+uk7D6
 6yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195535; x=1791800335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MtjyPqAx1DBfXhNfiNBwnE4QmFljId/OHSHkX1Y8u+4=;
 b=HrpiqyqKMXzzR//BCYrG7f1ifwfO56sydAPQRQH+LRJcGMg88S7zp9oKDJvg4L7udA
 5K0GDBAsDm7nxXSKyAKTSdOnFuBtEWd6nXmMMMf7otKlrNN/0PyIfJd2DQEOuz7t/Non
 mDaScjLo6EK1IE7gyzrbZS3jJjUiskogM6yx3Venhrtn2WFbu5e1ma3ixY4AG4JW6b2q
 WpeHEPX7YF+pfJekKaRRmqOK+CmKziWaxERfgDpiZ0EKzPVxKKwNC75h+ZBc/JqjLVDO
 CR+p0h0unC/dT0DPlIW/49cyo3Nl3lVQKhpkAY5jAUWVjScBLgcCLoOnMQ6fKlfsEvUj
 ASug==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1oYYQkPC2TBKmm1af8YvAd/18f3XU90tzTWTrXMLUCZeSxASwS/xUZCiTeRA4X6+p6pVA70174Q==@nongnu.org
X-Gm-Message-State: AFuF++ktLceeaqq+xTB9q5bNViGSTYjoJd3CjKLhbey/hJ9aATTkvhZH
 SyxDoKQ9ATCltuoSfiLuXlt465zObAaEqjZqq0E2lvrUrwjdYK7czc4u6qGByg==
X-Gm-Gg: AYBFou0um1q0rMjT5QMtosWTtGGuAyeFRt5t12EcPElxNKUjSwhbc+DjJqSaTmFQZJG
 4cTkMV7ifCLMO11L8r6aEtalvwlFRKLXrh004r/m5Lttme+rU7whmJ9rGC1CJcZyTOV5/sPmgGT
 Mhob+iu9jvnwLhx5YS0xVAnv4EGPr20/KxqMkT6lT3fg3QZC8HQcAWNZyLeX+gj5e6Ivs/BFDXz
 NcsNjNzyiR4W7ywgU3CBYerCiUx3n6URZ3t6YZt0gkSyk0RnLqukgW7OtDt1x9SqCA9Q/leCJav
 GUky58+gOkXxDEHUw0WnSrSr+w2JRvC6JfqLaDVtcML/KxsHb0mzMrNpc6g2UhSM5WwWkchgtrR
 475iVRMhE8sjX21xJ7kgmJBozfPiu7FCsiR/ZsniVhgLu3qKX2uxoo88/qhGwMZVdhNpreAwiZU
 gysBVE7iSACLUkeYYKtkNXLnzZdpg+U24WdVRvAQ5Edc0GpZbshO8cSMwNyOXIumCjm9Ui95UGq
 DEXZqdxqJ+JujFcQy7AcuEvkmVq/AUi7SmoEg/kv9cCWdoc
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6843:eabb with SMTP id
 5b1f17b1804b1-4a16843efe6mr102135435e9.1.1791195535515; 
 Mon, 05 Oct 2026 03:18:55 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:54 -0700 (PDT)
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
Subject: [PATCH v3 24/31] Kconfig: Extract dedicated config FSL_IMXx_CCM from
 config IMX
Date: Mon,  5 Oct 2026 12:17:51 +0200
Message-ID: <20261005101800.10821-25-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
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


