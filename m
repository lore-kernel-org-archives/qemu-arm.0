Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C31CA6009
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:33:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMws-0005ts-3j; Wed, 07 Oct 2026 04:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHlc-0006Tx-Pz
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:52:50 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHlR-0004NO-2v
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:52:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so4956910a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791341330; x=1791946130; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2POO+zmmYLMLNsY6JSlYSICDdx6pDkycub/bJgHUMdI=;
 b=fj5f9vO9S5wW8nmjkGcGGWW1kfJyD7XvXnCxgTFXntvrK45hoI3apq8u2GfClJuxk8
 FY1Sum0AIBopFc2Wg3fvca9tGBWHWqvkwFqEpdOzPfj3dEVlPuxTzS9tXOL6dEX9zxFv
 KEThPHqF9+NcaWfUduZd2tCpRVaFMmpDrwNDIccCph6kjTK+m7+EiuxEahqqXwviJCWr
 IdDXQWQ9E9/ZaowuUsGBnoOjE2WxD7fN8xDCuDLXWng+mBp/NseteEIbQfsv+Xb5Z9d/
 UrSeomQ0ScHwWr/g1OzsgFpyb+gC17U4XKR9hIBGWW2QAGmIVTU6p0q6P7W13qjqY9v5
 Dv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791341330; x=1791946130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2POO+zmmYLMLNsY6JSlYSICDdx6pDkycub/bJgHUMdI=;
 b=VOKBCQEpTZ2QcltFvzeQqlVETYhgqAYn7dlYailSe3V8BTe/EgKoG9zhBUjIgM2LxG
 jFAtxS2T37zlqA/wfrzK3PFpq8myxFGmv9kojjF4gtgNKQqxrWwT0m6qJ9qHMDlz2h0G
 ip9oXyRKe9ScLN5DcqMcVP2XF3pWbxryxS1TYKgrmxtUX5xFGXJyxQK4BprN9+NCOikW
 KXW4d7x+L3Y4LOtUSxQO+Wnojf6wTMJWgmuv5ng+skkfv+rEPcL1D2/jTKful8sEl4KB
 RpY3AQz9+HMA7rJTKDa/+owDIthQfjS4TMvqyQTOcAi7V0fp2r/xwB3WaehTdCa73xow
 e3cA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzD4WClHDqbjewj8tCdlvqwa/DGeJR6tO5tHulhDcgSU9FfPmwB7C2P6u1PO8tosLAl8ul9fi1rHw==@nongnu.org
X-Gm-Message-State: AFq9FYJHrxudMQbjBjfkiyO+V1P6MKVEKiHEzxnyKOBROxoilUoxrTls
 TroxsQo9OqQZv6JeezIks8vii1niIyNcHDfSVRARjZF0cjqeMSlzmZOexLURcA==
X-Gm-Gg: AYBFou3GjtHeuQ1ipPlddblQdhcPTJCbLy8wgw+mAKhyh4tgY9QAoLUmBjkT6uh1tMq
 ROi/8NFN9BQuFgWUflOIIN1JKDbbg7nt5z3sa92bSzsAxEHhqZdOrfE7ieK3MsZzLmp2thSIpgH
 F/OXoSlMYI7c/tQuMzB5gyZ9SZD9uCX5OlUbNLUf568UHJI4+/xq+a8K8tMAUGWJRxzybCcbcO/
 8n5LCiTSNGWmj4Zh3lRBiIh+3DbwvZnzLpJr/1cO3sjWU4rRen7Ki599CsdnGdfHGGqVit+v30z
 dP7tZhucuZpIU7/TS+nqasng4LfZ09zoXsyuG6P51VXzwMzMZiOpasH5s2zjQ9tSULp5dVLJJon
 5W9dONkoZVoIsns4R0el75lvySxU1Lgdx8WolHbyI1wZqC/IEYd/OaQfBRTsy8FgI2Lp89KEEW0
 SjYCTo3S+M7h9qI+f3GiJh0HfTl5OJBqo1vmbtnKDjI87oI+gwa4c+CI1rEQbZAA7H30l0d8hp5
 w4CIiCClBbu6i4vEjcZtO+jDqE4QbinLwDaijM=
X-Received: by 2002:a5d:584f:0:b0:487:169f:d341 with SMTP id
 ffacd0b85a97d-48c6d15fb11mr1153929f8f.12.1791275751900; 
 Tue, 06 Oct 2026 01:35:51 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:51 -0700 (PDT)
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
Subject: [PATCH v4 26/31] Kconfig: Extract config IMX_EPIT from config IMX
Date: Tue,  6 Oct 2026 10:34:38 +0200
Message-ID: <20261006083445.30362-27-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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


