Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BAEC982FC
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrt-0006TZ-Is; Mon, 21 Sep 2026 17:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrq-0006Qs-Ud
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:06 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrp-0000JW-A4
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:06 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so26351995e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027274; x=1790632074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9wbVaDi9cPHpBXocBulirabyxdmxTK1JCWVNnnmNfI8=;
 b=lUuK14Wj0G5/x6Pd3L322fTUmXD+royIk7zll4AfCf1gnXcfvzWNUr4KF/rcTnP746
 X+BYa+DhEotePscPuPZunYpuJky/Yd8QR3koE7+USmdBL2wATuodtu732tztx/3Z7tSx
 EtcijEhjgUYRwzqqtQE2VVqzM+AoypQ5L89g+QReSr/NoqcvbRHnZ+YcX38hU4/EVPBl
 K7nN82S3O07gQR9XauoDxPN+v4e7vLEhONGu//dhCoxpJcucVgPNxHA2Y79Vb1/wQuKC
 I1aAcHcrMD73whE8E5rmQXLkZYMXWeXkeRcV+o+Zn4HJdMTRoMvg47YVwRIlAuoC1oH3
 lKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027274; x=1790632074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9wbVaDi9cPHpBXocBulirabyxdmxTK1JCWVNnnmNfI8=;
 b=mWm3YXUWSHb5q/I3M0ZSLMptOs8pNuuzwHrxQZ+7yrw+WFGMbNJ+ftBpr66lOcS/Zj
 im48ffpkXopa6RYIxNA7y2A/Br7HwIlINMohxCueJI0DC3rCU5/YLvAZ8IVjnd4hAc34
 FS63BZBbD0Dyo4JNScCS75gM98mM3G8pc/4IxVH1srJ/AhwnfMEDab5vNkrvY+/h8iy7
 rFw6YL3ikQqWv/Gs8mPPwNrYFbIG23SEXQtIlG9QZI5cbQOWdC92ep8lbpVQQ+0tO2Lk
 zfz/xk5U1RyJ2a9EEXeCTOdHMATTb5kRbjhpbELizojsp9E3M03MTbEJV4+kV8OOGsBk
 XB2w==
X-Forwarded-Encrypted: i=1;
 AKwUvByE1Iz1NrdPSkVFYNIfAfKSqeI4iFABz71yZkGPvafd/QBHo/kweSG9x3u1PW9NbF+w1oQ+ePiVTQ==@nongnu.org
X-Gm-Message-State: AFuF++ngZviaqsMgZARRhF1Zsl7IUkYSqHD3n/ZCRZ5CZsnFn+i4AGUX
 skQAiX9ZrsGIhDzYuB4Nw56mMPcIfcCki4bkLC+vt0HnSN3r+exvYXSV
X-Gm-Gg: AYBFou1ziTOt/8M+yi63LYZWBNk4AHWOVp2qLTjvyptkNS8++NsjQKbi4CEsKq1VyXJ
 mkONcOBnpus0nbIyv+ynXBWxEZxB31bxIGiik9JeFpeYp2lZd8H3ZMSc7xF2qPyeRawZPGFvCCT
 boK3/xIp/b/sHEsicAhh/3Ri240VOVl9OZrUgrquDhDk/ud2o3uNgbiH3o80u3ezxDB5QhsBSun
 VQUq6kpI0VJc3EKQCt2Uw3IxIyWNx/P/Ug8Upm3JONEehXCVysuV1emackQR66gJr23j/2i5K91
 v752whcrldoRbPDQO/1FbhfZKdpLCOAC/dB3vSlI0/1L3UXIpGJIkDnEg/JGZKFzufEsP2w1fYf
 ZzRmD7iHiLHtUJvPXzSbtb7mCzHzEYNq6msk+DhMDvTsk7Chx3Um1EGLNHZOGwoPc8JPwxP0fCL
 AbWI+Drx82kFhi+k18T5HAqzRRatrWPyU5bq0/bVLGQ4k+uJNVNFI/LcmdQpW/Nop7kxzsEGe1/
 PacgqNBzsps9fa3AJeomUfXiIZTkypaTpCwaMwXxrzA7TnBkGf+BqiYqltpF3itwS6Xr88J8P9g
 TT0=
X-Received: by 2002:a05:600c:1382:b0:49d:174e:2a1e with SMTP id
 5b1f17b1804b1-49fc574f42bmr164264655e9.19.1790027273921; 
 Mon, 21 Sep 2026 14:47:53 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:53 -0700 (PDT)
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
Subject: [PATCH 20/42] Kconfig: Extract config IMX_AVIC from config IMX
Date: Mon, 21 Sep 2026 23:46:48 +0200
Message-ID: <20260921214710.29422-21-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
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
config IMX_AVIC to eventually eliminate config IMX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 2 ++
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 3 ++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ad4b997abb..0b8414501c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -479,6 +479,7 @@ config FSL_IMX25
     depends on TCG && ARM
     imply I2C_DEVICES
     select IMX
+    select IMX_AVIC
     select IMX_FEC
     select IMX_I2C
     select USB_CHIPIDEA
@@ -492,6 +493,7 @@ config FSL_IMX31
     imply I2C_DEVICES
     select SERIAL_MM
     select IMX
+    select IMX_AVIC
     select IMX_I2C
     select WDT_IMX2
     select LAN9118
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 05e697967d..97355f9df7 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -5,6 +5,9 @@ config I8259
     bool
     select ISA_BUS
 
+config IMX_AVIC
+    bool
+
 config PL190
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 0620b0792a..74d84b8ddc 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -23,7 +23,8 @@ system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos
 system_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 system_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 system_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
+system_ss.add(when: 'CONFIG_IMX_AVIC', if_true: files('imx_avic.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpcv2.c'))
 system_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'), if_false: files('ioapic-stub.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 system_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
-- 
2.55.0


