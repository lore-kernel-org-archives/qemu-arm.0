Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1671C982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:51:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrz-0006Wy-Mr; Mon, 21 Sep 2026 17:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lru-0006UU-US
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:11 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrt-0000KR-7Q
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:10 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso29548125e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027278; x=1790632078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dlt/Zrvpm5DPolffO7GvY/8CD2eqY4PDiJZPEyKeDWU=;
 b=Z8K6XPM1qiPVX9oEzDhH4i4+bF6fmg25LQMVm29YfV0ssMZS4fokQgzOT0jrYd+2CY
 Iu1aZwbE0KsbcilbeHL6r7xt6wTWa5jcJNgNQhX2cNzPZcyKiq5iMRHPy8nGlOCqeskN
 EZEgHuCxvjawCBnwbIyXgAeDqNOm+7+g/NAKAyP+JpQKM5hEeX9345iFul/JTMEUvuye
 LeytF19PHMuad2U0Cw3wBil03DRUjGN5NurWlY9IVrDvt5Wp9wIBmdz2u3frjdfnXIiz
 uR3RZ+35NLwcXJMTMIt8WnlpBixYoekwjYRLdphvAaafe/x85omOl5Iw4h1fifsjAixX
 lorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027278; x=1790632078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dlt/Zrvpm5DPolffO7GvY/8CD2eqY4PDiJZPEyKeDWU=;
 b=DS/fIo1+HmfpWQJYC6RqvI7HH5Q6oGLaHVtVaC1QPI6PHYiNVTZJbzFzNFgQpqjCFK
 r/d45mOdaSKHvzQRv+g5gbiPXYHkL00I7Wnt78MxEgJM5RF2jVIaPZIPJrHrrtYpXAF1
 e5rk8KuMcBkL0D8WLQx03cejCqru5PzfTEKi/2mojFtHGHy3lxv7EFRTptfPiTUvOD28
 xIvrG+X86w4d3u+Us9W/JEiFSHXOMynG5rj/MVLYHwvfNlxhPHRh7DZMdGnWyINdRrFy
 o36SfQFxJvymkfuHPbZ2RybKc6bvwTnd42d9e8v92yfIzCVeSlVzwSlVzE8S7MChQ8Oy
 D0iA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxk6WF28lL9lblBtlQ1SwOD4L7t5uuJYl9b00oY87Z+kJ9FM8L1FFby6DaFzBrLHabzG3TWp4+oyw==@nongnu.org
X-Gm-Message-State: AFuF++n8fk72ymhOfBcYp2etdYNZKJSQ4bHeZ6Sh9jFeULIxuIkVc8mm
 msZg3OVNn/6oyt0c3vmVZpKeYv06+vtB+UyvSFFpr0NYrI5q7anWU4SG
X-Gm-Gg: AYBFou3cDa5iLbjVj14efX76fBg/SDEn9s0Mq2GTZk6/G9r9skC931P8UAKPpCwrxZl
 qRFmsybWmimg9Tm6fYTDQnDnPdUA0ZBPS8r6BPWh6w3KbHEujyUHXpB20r1rb0QJj499Btc4ZUP
 ptOFtRgCg6I2Pw3/NZeiki1raCUpnUQOUu1+dSz5ht/Q6t3wT+pv63HRNxtC4Unxcv2JNTLI+VX
 Encd7JgKWF59Gyxg7FzeQ10cQ8oGuYHkFQ02IDNLNUUfSDdpcM1GrevFUuvzpE9ADx8rXtvUVXx
 NtXA8Yve/+ofgU7K1cu5wQdUJ/jKsZGaVA7I5cqFvMeiBMDbwP+KgVDBDYMSar+qmfIFQsT6xaK
 dXQVFsIZNmSV95p+Rhme4pYWow4Quax5oTKdWjbHnUKN8d2Of1xjw4o0p8v3bOLVmLMlTPtIgck
 6GcqXMQ0l8spMzbCElPtdtpDWoqROC1H6SfHTwG4mrRP92EWLHQIF9DJT5vv4aot9qQIUmM4xsN
 N4xVhUu8OkvfYeAhn10SS6VipwBaC3zT8wyeE8VXa419YKCZ4fJzXDJIo6NRRlKruiMXwEHUNVq
 DDE=
X-Received: by 2002:a05:600c:6819:b0:49c:fa20:cbfc with SMTP id
 5b1f17b1804b1-49fc5728f8fmr177595715e9.19.1790027277782; 
 Mon, 21 Sep 2026 14:47:57 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:57 -0700 (PDT)
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
Subject: [PATCH 23/42] Kconfig: Extract config FSL_IMX7_GPR from config IMX
Date: Mon, 21 Sep 2026 23:46:51 +0200
Message-ID: <20260921214710.29422-24-shentey@gmail.com>
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
config FSL_IMX7_GPR to eventually eliminate config IMX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 1 +
 hw/misc/Kconfig     | 3 +++
 hw/misc/meson.build | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1436c05c98..d3dda015c4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -578,6 +578,7 @@ config FSL_IMX7
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
2.55.0


