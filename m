Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24379CA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:29:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLKF-0006ld-JT; Sun, 04 Oct 2026 08:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLK4-0006ef-1H
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:08 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLK2-0007CW-Fi
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:07 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so6239495e9.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116885; x=1791721685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZyoUbr6so0ZwhhwaN2FAXzCNYsRK0bzxpf+l9TWzb8c=;
 b=CMJMylTRt4MquQfzmBMdegouHza+JcVDGETavml8PXva/Spk9RtRdl5bFUzILey6Pl
 ZITMvlkUCzYbATGRw8kQj07bq8SsjcK4BJZgW2v68i0ImSKhyvv7+8LP+t+e+K05BAxn
 kZKbcra4RZcsqMQy4c1Sjib6aC+2+W/79TLAHkWU3IahSwQ050PJch+xm7jhaR+t1PJ+
 Sf3jSs9e4DDRDQ15J30+loIw8cs/I7DhZk2T+tQ4gMk+367FBy8iBCAndls6jCbPU4QS
 L5kprem3sY4YRmCC877t/+3ueGEgDP3pEnjJbElojHfeTYSM87Yo8v7iNOHsJe8irUAF
 ZSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116885; x=1791721685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZyoUbr6so0ZwhhwaN2FAXzCNYsRK0bzxpf+l9TWzb8c=;
 b=T69rDT503qHvaR68uOiAD8e2rF/Dh7Vs+D0b1FjPPuLeyYeoEO01WrnWuFcjgTTf72
 6pO1CjXLrTEDu8YT6BKht6ai8jqJpMPffTT3GkEeKqOdvAWkk5LtMt04XHsHuyWPweGn
 /g4T6F7avAErIhTv2paeKOkihGkZ0qCCsa9wnyo0MN+tvtSH+9pSMqNk+7I8ojOUrc+U
 qE6Eg3EUdUVL6JV2BE6qP4AK+dc58yeLobTPMdpXriJqz14ru0QwQLM4wO6yQuOxYGJL
 ivlN+vnFFgzgd1P0zIzZhxi3yutETeg2x9CmOuc+0JdFj+8F3dzDF7+eWfO3nmnqyBKX
 PG4Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByZ6U8dKy3OylL6eIhNuFlhMBx83vIDqBs7D9WbOLqe5pSemE2wDvvANCoylZFNJ17LqVu6pzCXCA==@nongnu.org
X-Gm-Message-State: AFuF++kfjQhocDk5z6rOnj3AJYY4eq8kFzt+HLF8Ula1aqSAqNRiqxGp
 10WBDBKvqMx/TLO00T9uRlN/mx6O+MUVthD6uXn4SydgBAQ2mBvAkkpq
X-Gm-Gg: AYBFou0K8cpZXPiGLXemgzGIG2epLnYieTrQ0A0pohpcklEeu+ygi3y64dBSGPGTSDu
 DU7AIpUy1AKi4zpRnVfXt1utgeEzHevN+pcHwa4xjRrhT/P3a8I5M+cym007EOMzV0PPX9gqyQT
 A7lh0LCz+fTsWUBRiiNFBUGKKRSzUR/T6vAAgXvmNWGcxEBJBlVF8fH7YVSJiYITHfXYMahEMGV
 trozfzW70oYB7hKNeYaF4paA3d/kB1ZZtYPqaXaaoIV/JvhrrrpeWajWLGyHbU4GZZ+e89vSR80
 1C+q+JS4yM7PIbR6aZFr8T7WtK7A9iuyyJiVlyyjgFcfG95RH4LBHgzrrrGD07cTco73bHLxbrV
 XjnmIZAX/A4CP2vdj971f7UxdfqYXDv/iMdkgNUu2HgXLgN+10jdXAfdSpGkFJt83S7WTPdbmmk
 3BGBC1/zpEA8TOFriEli15T0GEmP1D5fqS/gR37UmkMW7qURuhpp420hbIyandEfZIeO54hTCVG
 +h8qNf4K6zcA0qvZxlGq6HW73BEqfyLwVzobQ==
X-Received: by 2002:a05:600c:3510:b0:499:9240:9a1c with SMTP id
 5b1f17b1804b1-4a027559c6fmr136574195e9.15.1791116884898; 
 Sun, 04 Oct 2026 05:28:04 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:28:03 -0700 (PDT)
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
Subject: [PATCH v2 20/30] Kconfig: Extract config FSL_IMX7_GPR from config IMX
Date: Sun,  4 Oct 2026 14:26:36 +0200
Message-ID: <20261004122647.3913-21-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
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
config FSL_IMX7_GPR to eventually eliminate config IMX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 1 +
 hw/misc/Kconfig     | 3 +++
 hw/misc/meson.build | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2084813e1c..51fa2e2ee4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -579,6 +579,7 @@ config FSL_IMX7
     imply TEST_DEVICES
     imply I2C_DEVICES
     select A15MPCORE
+    select FSL_IMX7_GPR
     select PCI
     select IMX
     select IMX_FEC
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 3f17d29053..cf9ea68219 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -97,6 +97,9 @@ config IMX
 config IMX_RNG
     bool
 
+config FSL_IMX7_GPR
+    bool
+
 config FSL_IMX8MP_ANALOG
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 61e128ab7a..c31c173e5a 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -60,6 +60,7 @@ system_ss.add(when: 'CONFIG_AXP2XX_PMU', if_true: files('axp2xx.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
 system_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
+system_ss.add(when: 'CONFIG_FSL_IMX7_GPR', if_true: files('imx7_gpr.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_ANALOG', if_true: files('imx8mp_analog.c'))
 system_ss.add(when: 'CONFIG_FSL_IMX8MP_CCM', if_true: files('imx8mp_ccm.c'))
 system_ss.add(when: 'CONFIG_IMX_RNG', if_true: files('imx_rngc.c'))
@@ -71,7 +72,6 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx6ul_ccm.c',
   'imx7_ccm.c',
   'imx7_src.c',
-  'imx7_gpr.c',
   'imx7_snvs.c',
   'imx_ccm.c',
 ))
-- 
2.56.0


