Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA8ECA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:27:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfpN-0005h4-Ru; Mon, 05 Oct 2026 06:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmn-0002Ob-FA
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:19:14 -0400
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmh-00012z-7c
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:19:07 -0400
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48aff58e6abso822510f8f.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195538; x=1791800338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2POO+zmmYLMLNsY6JSlYSICDdx6pDkycub/bJgHUMdI=;
 b=ZLE6TLQNAhtNVrmJt33p5O3FtJUz0Yny4c8cyFmj7Maw63EPC5+ON94xOpH2gRIuMl
 LRdQwdT6btHb8EHUUaYSWIPFz8uqopT/O8WPfqyITIMLmLlvSG/8Q4HTY3YmSVWyB6tQ
 OKMhM3W+j2dIbBLfbq7TNCYHTJQ5pxYTGQfT9u13NZj79LPddgi/s6c8MVoNw+lC9eSz
 tz4KO3B24LEEkt/siEIKspO4pWI6vtJQZePm7C0gUQSmQgs4rcfIf7tQs0o22LglVtZd
 a7nyJePTC1cW6zDh193ywphYZdAt94VaTN6HLIvvofiRCra54yAkhmKy4nl0ucTZPXEO
 T1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195538; x=1791800338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2POO+zmmYLMLNsY6JSlYSICDdx6pDkycub/bJgHUMdI=;
 b=W3pE4eiXlcQd/MFUTsqb0Wl9oGABwJqAkOkTl+dz+UogLbkqm98x0TAJFKze8uyTB2
 d/nWuiReCrHKcpPct+3jpYRVO4ObKINwf7OKiozMywgoGv76NaSsmxq5TGuTvDOGpY+7
 8CbeTJxM1g/TCLxvvGlFeeFApAVtfdAq37hfztM760Ia5OyPJ8OAM9adGtDSsNxZuK5y
 StvxlF4n22MV7+o/q+o1u4wPHUJC9A06AcJx5klrfFjF1oQG+Kh6ezLDNDHPyN1uooMv
 6qAx0t468EWNU3oXx5Ku53Kj04JVus5inoJGJuMjsESHfmCa0osIu4GD2VE58tOwJzpb
 3Q0A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxmnLBNmZPHlWCA7lFYOPA4G8UrmXhIDvShFOqQoOMqqHRMCFvslM4XPraWf9/IAeTHomOMel+tOA==@nongnu.org
X-Gm-Message-State: AFuF++mjW0FpOB8UrYvFLbbScrj68yBGjLJgETN7TH2biBoogZ5VVrfC
 0OsGBpgVtujjTSUV02nsGsBOg/LGICroH0S+LXif/dI19aM+kv7Nm3Dl
X-Gm-Gg: AYBFou2hWD7DmsNQj88NGEzBVeP+WuOHvanl7IywmU9wqinxYrOvYaHGbBhecrejIwQ
 zEYkRb2J17V7oeVa9HKHW+dPZv+kWFgUd5DceTzmIz/mm0CP2X2CokE48fnQ3EjayZ9bcWh/fYs
 yRC6aibpFYPOd3COjddlD7QE5oXfYcvsb+PHnne62+8d1dNU58QQ0QTdcLwok/N09cdVYLArbPl
 nxVFgRL9Lit3HC3cmex7ydmnvpNOzzMQwTjfgI5ROIOJmGVyAaOVSDhumk9Y0UcTPkSxB/406NR
 16Ijf3sZTE/6g3owdDF6wFb1fDjBtb8xaO95sJbl/jxaRKjJu5RdL5beH/AeYG7fhMbHCDnv+f2
 fUCWi9Knc9QX8v0L+ttuXmP9aPsYdL90Sg/8wemI1BtwyJ4I7qOnsxI2LvJrOVPVLNm5scmRLHX
 yUvU7tpscKOXnqTM88RdE2BWX8Oz+I+XjiqK/daGDRLtb2jSMoSyaIef2hZG/MUQqZ+2XnikU5S
 rFQJ+empiK7mWrU6zDSWXW5xmiH883/kkopvg==
X-Received: by 2002:a05:600c:5391:b0:4a0:c2a:485e with SMTP id
 5b1f17b1804b1-4a02769a99cmr185846065e9.33.1791195538334; 
 Mon, 05 Oct 2026 03:18:58 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:57 -0700 (PDT)
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
Subject: [PATCH v3 26/31] Kconfig: Extract config IMX_EPIT from config IMX
Date: Mon,  5 Oct 2026 12:17:53 +0200
Message-ID: <20261005101800.10821-27-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::e;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0e.google.com
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
config IMX_EPIT to eventually eliminate config IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig       | 4 ++++
 hw/misc/Kconfig      | 2 --
 hw/timer/Kconfig     | 5 +++++
 hw/timer/meson.build | 2 +-
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index cb6e7056a5..1d3026dea9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -482,6 +482,7 @@ config FSL_IMX25
     select FSL_IMX25_CCM
     select IMX
     select IMX_AVIC
+    select IMX_EPIT
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
@@ -499,6 +500,7 @@ config FSL_IMX31
     select SERIAL_MM
     select IMX
     select IMX_AVIC
+    select IMX_EPIT
     select IMX_GPT
     select IMX_I2C
     select WDT_IMX2
@@ -513,6 +515,7 @@ config FSL_IMX6
     select FSL_IMX6_SRC
     select FSL_IMX7_SNVS
     select IMX
+    select IMX_EPIT
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
@@ -682,6 +685,7 @@ config FSL_IMX6UL
     select FSL_IMX7_SNVS
     select IMX
     select IMX6UL_LCDIF
+    select IMX_EPIT
     select IMX_FEC
     select IMX_GPCV2
     select IMX_GPT
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index a2095d64ae..dbdef58505 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -91,8 +91,6 @@ config ECCMEMCTL
 
 config IMX
     bool
-    depends on IMX_CCM
-    select PTIMER
     select SSI
 
 config IMX_CCM
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 49a4d20e55..e098376d40 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -23,6 +23,11 @@ config I8254
     bool
     depends on ISA_BUS
 
+config IMX_EPIT
+    bool
+    depends on IMX_CCM
+    select PTIMER
+
 config IMX_GPT
     bool
     depends on IMX_CCM
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 477dd47486..e2bcdbdf65 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -15,7 +15,7 @@ system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pwm.c'))
 system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_gptimer.c'))
 system_ss.add(when: 'CONFIG_HPET_C', if_true: files('hpet.c'))
 system_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
+system_ss.add(when: 'CONFIG_IMX_EPIT', if_true: files('imx_epit.c'))
 system_ss.add(when: 'CONFIG_IMX_GPT', if_true: files('imx_gpt.c'))
 system_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 system_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
-- 
2.56.0


