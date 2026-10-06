Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA834CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:03:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENLz-0005Zi-Ja; Wed, 07 Oct 2026 04:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEK85-000432-6B
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:24:06 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEK7t-0006eL-6V
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:23:47 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3a20367cf82so33840041fa.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 22:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791350598; x=1791955398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MewfHFxCBjuMnAba+cWeGMRb7nH3xWgUzUxej45VPmE=;
 b=YyW5yZfqzF7wplGbx02TyxXOFCVjNGhpg8mRhwG2SIHXpDfActnYutNL/nGKKhKfkq
 6pryCLg/469lGcB+kTngFCQxoI9q08dApTxW8MTPd1F43Xs3MNsMYKkeqvx9tFoByIGl
 yLHofHyW2LBm0KZTUgpmF5MbZGEyav8B7N4TC6yoCIqcvfEFENUF/NbRm+UOmM+IpTn7
 CwFQu3URHzSlyOojuT7rltTcJgxw/LsHGuJpkQxCJYxb7JxKUmfA/7xfwCmaMQmMWMS5
 GDwiLMXpARI08VqthHrKUFeAPDN0jcT1HyJk4hkzeJOlfhNiAoalketGXdnsvybyR8T5
 h6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791350598; x=1791955398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MewfHFxCBjuMnAba+cWeGMRb7nH3xWgUzUxej45VPmE=;
 b=dxYpdq/zXxztto0Y/hz6xynLBySqYw4JhfZbf4kHnjZiS3pL2AhuBIjNHDbVhwq2gD
 WpxRSsCxIgG4LcScjWsnD+hJgGf4jYhb83KqR6LFd7AsseWtJrNfR7ToGGmrC071rKF0
 OUPaAiByMEOw4f8bAZqfiMflOj5mRtRCsoRsPxDXXrEEDbxkO04Mb62Xg6kONDj7/go3
 jSAOtsf8Q+L+whQNpGiZyiDpmAQ4XOtmbes2/m3PZcYIQcwW3fLuYMxwrJGJgepTXXh8
 nX5t+GCYeT1bH6a8NI0aaQgj5o14MOsQbfCq27VxAZAKr6DRZZtC5D5ktt7vN33+MtHG
 rVcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBkZZ1pX4M3Gy0IjeRo7BU0IQoDTDtHNP5Bd02liFl67NS2JEWZ4e5n6yrABprPGp8rAGj2mmIAw==@nongnu.org
X-Gm-Message-State: AFq9FYLvP6wOnNP9ByY0uG0hqnpatSc9K+uWkp+RoXlIUndXJQR2m2+s
 ANoszKzC/PYQly3URtvRzMW0SpCq5rm2XKvQoOOnMDVaGO243VJscUhE3umwWw==
X-Gm-Gg: AYBFou24TTtDz7s7wXu/FqI1HFe578lK2dZJgrxiGf2US/N2OmKBb6uaufuQrq/qlCR
 CZSQUjwrMGCqxCLuoCCr0oAY+F/ypB1rTAmOea/dvD8LB2qX82NVdS9x93OQKxVgRPwYNUoXhNa
 m0H++WtaIaIzM2i1gOgR+hZE50ZSqLKHQUstfJ06Zc0vLBeoP9I7gVUrPpzWjyCQCwQYSRX5VAa
 HLkODivhewfixNd6luUhSda+4MjOqqzaZFEEmhmM8YlpgMxNdHNj6ch76wZkbkO7bTiyMjQfMYS
 QOkE5jqZZX7Lv4nBiPoHDIpZwLKZ+Nn+q+N/mEIh1jIVUt/LVW2reDaw8xG/AChguCRAkgmglx1
 qb8bbxZ6tLe55X0ljI27GIDV0YRNoS5guBbE5X2H6fxUZakLmZ/vrM7iYXV1NZBiMGg6FbnnZBq
 h3kas6xuHQ/QDyRSGR4NlKWTswQXcbB64uSZSvk71y6fSt5ilKxulcWQZ7ObGX772p6sMcCVMrP
 uR4kmIEb7xDEKaI8/getwiGwWl5jVA3juHKFGDvDdXctExe
X-Received: by 2002:a05:6000:4a06:b0:48b:b1a0:5926 with SMTP id
 ffacd0b85a97d-48c47fe7917mr18295557f8f.18.1791275746063; 
 Tue, 06 Oct 2026 01:35:46 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:45 -0700 (PDT)
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
Subject: [PATCH v4 21/31] Kconfig: Extract config FSL_IMX7_GPR from config IMX
Date: Tue,  6 Oct 2026 10:34:33 +0200
Message-ID: <20261006083445.30362-22-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=shentey@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Bin Meng <bin.meng@processmission.com>
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


