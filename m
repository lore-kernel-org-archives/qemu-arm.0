Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0912C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:10:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMVz-0002ED-3d; Sat, 26 Sep 2026 03:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSb-0005zi-Le
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:40 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSY-0000lO-6q
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:37 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e630052ebso1866229eec.0
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406273; x=1791011073; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=72h6q/XELQDZvfdIS5KzMm0xOjpWDOQFzwFtLUoCQz0=;
 b=B7k3obt96ZSW2cjc7+jaTFQYc+JEX3uDWpqwgQTpv5mj9LzdEgdtvPNqEyKIf/jZly
 t3n1lZcFid9wv7DOXMBcoWX/F0OJ+RRecwNY8BvfoMyk/zIS7d/S0X/YOACP1BjeAYzx
 HwZtjArogk2AmlTlGL7ZkqR0SKfyeq/AxbpnKw0pS8gNFoLW//YvC0qGKWz+lCvXa+5J
 km4LGknBaKzLe9LbYKxv/GykvjxUfgRpJ1wSES/fCbq5jBIwPNL43bFZN2vDfituNLpd
 0eTVvgcjtRQBbhL/hEAgr4q0GFVys8aQYnEjZH06fgW/6GzxkQN1XQ5fDIHUSD1f2A1R
 dd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406273; x=1791011073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=72h6q/XELQDZvfdIS5KzMm0xOjpWDOQFzwFtLUoCQz0=;
 b=diPJgrItYVE3j2E+y1ZCF4aOnTTDUKqvSnddiDh5mhLOqjYDS7z8DHHBFZQrUKmEcB
 qbBykOOkZG0D01/7IR8kFqX+erYnqh2KMLPcRuwNrZoAlx7B/COzDjfgYNe9WoGL/d1Y
 RxoZLJZSrvnDz2iQUmPs6kRmHcPVzIUIyCUzY4g3aJNXLTi1d9ce5Z3tOcGtkGdHqVtd
 R7E92gIukMxdE3mHAKkX+bXUCHjVjgYyWPUH2RJSq7MED7euCMypgSkFr/xXV/eOS89y
 fO4YKyTQQv/FjF54ESdGYbEqhkK27eOF1GwxkoVqDMZOQjFxXbOBWas10sRizwkS2n/C
 Dz2w==
X-Forwarded-Encrypted: i=1;
 AKwUvByB8RpKfUNZdDMwzd2n/1iGHiOlEKait+81Rb6U6x2RXc1iSLIl4U2bHaYajBGjp9+knVhk53k1Iw==@nongnu.org
X-Gm-Message-State: AFuF++mYLgP9jHAd2+sjOwXflhaQ1urLI+/InWd3TFyIk8lG2U9dMZwd
 u+vDM9EqBEk1H7tdtQSairMNVE6FWsYFgpZ2f0Li/2IE6XU4aeoB2ZJj
X-Gm-Gg: AYBFou2yLry6aM8nDe6bcW4gMTuBwTZLZ6rVr2fTP14TQ6W2f8iR6OKev/FGH14wBvm
 JBvtWgXMwmJifXu1wOnhEqxGTfiN/qzOT21SSAk1Zta+XZkg5wRDwcyyqFWD8UQLOmQ0j8nQiYp
 46mNo4i68HEiWya0yHLs5Ohxmg6A/9/wzJzNJ277mUpfoGKTWZGhM6MWvyLtxVyk4vGMLNLLYgD
 20qGVgBHzdb4jaRQ+EXWuJowmV0YysJDsywMtPn2/djAnV3498FnidRep9Iy4xI/k7iyXfGHQy3
 emck6/0WWmaBabRMYyga8czAEIl1DhX01gRwe65K4CZ+2RB7ECtGATQrifM762oO433QjUsPAue
 GtWJAcbFqNUjh0QuQPXsKJMwX2Lh5Uk1YlZ3A95UBdvfBegiE7sVkx3BrSkx+eyarDykd72SOQ9
 HdDLx4ziFm191+krwypehbAITTmstEhOwIMvD6Nddq2ruVOAyx9kp5g1R3kThfkfEvupeRiLRKb
 tiVSUujsRjywz5ObCkCqq/ol7B9iKU=
X-Received: by 2002:a05:7300:ea11:b0:33b:f2f1:bc30 with SMTP id
 5a478bee46e88-34272468f56mr2368131eec.31.1790406272566; 
 Sat, 26 Sep 2026 00:04:32 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:04:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 53/55] hw/arm: set remaining 32-bit machine
 TypeInfo.is_available
Date: Sat, 26 Sep 2026 15:00:52 +0800
Message-ID: <20260926070057.1234-54-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
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

Set TypeInfo.is_available to target_is_base_arm on remaining
32-bit TypeInfo leaves, including aspeed, raspi0/1/2, mps, and
npcm7xx. raspi3ap/3b use target_is_aarch64 in the same raspi
TypeInfo array.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/aspeed_ast1040_evb.c               | 1 +
 hw/arm/aspeed_ast10x0_evb.c               | 2 ++
 hw/arm/aspeed_ast2400_palmetto.c          | 1 +
 hw/arm/aspeed_ast2400_quanta-q71l.c       | 1 +
 hw/arm/aspeed_ast2400_supermicrox11.c     | 1 +
 hw/arm/aspeed_ast2500_evb.c               | 1 +
 hw/arm/aspeed_ast2500_g220a.c             | 1 +
 hw/arm/aspeed_ast2500_romulus.c           | 1 +
 hw/arm/aspeed_ast2500_supermicro-x11spi.c | 1 +
 hw/arm/aspeed_ast2500_tiogapass.c         | 1 +
 hw/arm/aspeed_ast2500_witherspoon.c       | 1 +
 hw/arm/aspeed_ast2500_yosemitev2.c        | 1 +
 hw/arm/aspeed_ast2600_anacapa.c           | 1 +
 hw/arm/aspeed_ast2600_bletchley.c         | 1 +
 hw/arm/aspeed_ast2600_catalina.c          | 1 +
 hw/arm/aspeed_ast2600_evb.c               | 1 +
 hw/arm/aspeed_ast2600_fby35.c             | 1 +
 hw/arm/aspeed_ast2600_fuji.c              | 1 +
 hw/arm/aspeed_ast2600_gb200nvl.c          | 1 +
 hw/arm/aspeed_ast2600_rainier.c           | 1 +
 hw/arm/aspeed_ast2600_sanmiguel.c         | 1 +
 hw/arm/b-l475e-iot01a.c                   | 1 +
 hw/arm/collie.c                           | 1 +
 hw/arm/exynos4_boards.c                   | 2 ++
 hw/arm/microbit.c                         | 1 +
 hw/arm/mps2-tz.c                          | 5 +++++
 hw/arm/mps2.c                             | 4 ++++
 hw/arm/mps3r.c                            | 1 +
 hw/arm/musca.c                            | 2 ++
 hw/arm/npcm7xx_boards.c                   | 5 +++++
 hw/arm/omap_sx1.c                         | 2 ++
 hw/arm/raspi.c                            | 3 +++
 hw/arm/realview.c                         | 4 ++++
 hw/arm/sabrelite.c                        | 1 +
 hw/arm/stellaris.c                        | 2 ++
 hw/arm/versatilepb.c                      | 2 ++
 hw/arm/vexpress.c                         | 2 ++
 hw/arm/xilinx_zynq.c                      | 1 +
 38 files changed, 61 insertions(+)

diff --git a/hw/arm/aspeed_ast1040_evb.c b/hw/arm/aspeed_ast1040_evb.c
index 486f0f6a1ba..d66847c602c 100644
--- a/hw/arm/aspeed_ast1040_evb.c
+++ b/hw/arm/aspeed_ast1040_evb.c
@@ -79,6 +79,7 @@ static const TypeInfo aspeed_ast1040_evb_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("ast1040-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
+        .is_available   = target_is_base_arm,
         .class_init     = aspeed_machine_ast1040_evb_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast10x0_evb.c b/hw/arm/aspeed_ast10x0_evb.c
index c937bb74665..5b5adf7018e 100644
--- a/hw/arm/aspeed_ast10x0_evb.c
+++ b/hw/arm/aspeed_ast10x0_evb.c
@@ -117,10 +117,12 @@ static const TypeInfo aspeed_ast10x0_evb_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
+        .is_available   = target_is_base_arm,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("ast1060-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
+        .is_available   = target_is_base_arm,
         .class_init     = aspeed_minibmc_machine_ast1060_evb_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2400_palmetto.c b/hw/arm/aspeed_ast2400_palmetto.c
index e2350e5b6ca..f8abd041c3a 100644
--- a/hw/arm/aspeed_ast2400_palmetto.c
+++ b/hw/arm/aspeed_ast2400_palmetto.c
@@ -71,6 +71,7 @@ static const TypeInfo aspeed_ast2400_palmetto_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_palmetto_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2400_quanta-q71l.c b/hw/arm/aspeed_ast2400_quanta-q71l.c
index e8cbbb8a052..6636d19d142 100644
--- a/hw/arm/aspeed_ast2400_quanta-q71l.c
+++ b/hw/arm/aspeed_ast2400_quanta-q71l.c
@@ -77,6 +77,7 @@ static const TypeInfo aspeed_ast2400_quanta_q71l_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("quanta-q71l-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_quanta_q71l_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2400_supermicrox11.c b/hw/arm/aspeed_ast2400_supermicrox11.c
index c75898cc6d1..14a49c82c86 100644
--- a/hw/arm/aspeed_ast2400_supermicrox11.c
+++ b/hw/arm/aspeed_ast2400_supermicrox11.c
@@ -72,6 +72,7 @@ static const TypeInfo aspeed_ast2400_supermicrox11_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("supermicrox11-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_supermicrox11_bmc_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_evb.c b/hw/arm/aspeed_ast2500_evb.c
index 6ca2a36322c..58c6ed316f0 100644
--- a/hw/arm/aspeed_ast2500_evb.c
+++ b/hw/arm/aspeed_ast2500_evb.c
@@ -58,6 +58,7 @@ static const TypeInfo aspeed_ast2500_evb_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("ast2500-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_ast2500_evb_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_g220a.c b/hw/arm/aspeed_ast2500_g220a.c
index 00bb1c61053..5deedad77cb 100644
--- a/hw/arm/aspeed_ast2500_g220a.c
+++ b/hw/arm/aspeed_ast2500_g220a.c
@@ -83,6 +83,7 @@ static const TypeInfo aspeed_ast2500_g220a_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_g220a_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_romulus.c b/hw/arm/aspeed_ast2500_romulus.c
index 340a74408b6..5668915db55 100644
--- a/hw/arm/aspeed_ast2500_romulus.c
+++ b/hw/arm/aspeed_ast2500_romulus.c
@@ -53,6 +53,7 @@ static const TypeInfo aspeed_ast2500_romulus_types[] = {
      {
         .name          = MACHINE_TYPE_NAME("romulus-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_romulus_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_supermicro-x11spi.c b/hw/arm/aspeed_ast2500_supermicro-x11spi.c
index 5a7e49d6ccd..9e5e8c4246c 100644
--- a/hw/arm/aspeed_ast2500_supermicro-x11spi.c
+++ b/hw/arm/aspeed_ast2500_supermicro-x11spi.c
@@ -68,6 +68,7 @@ static const TypeInfo aspeed_ast2500_supermicro_x11spi_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("supermicro-x11spi-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_supermicro_x11spi_bmc_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_tiogapass.c b/hw/arm/aspeed_ast2500_tiogapass.c
index 6cb567526c4..d9ecc98f96f 100644
--- a/hw/arm/aspeed_ast2500_tiogapass.c
+++ b/hw/arm/aspeed_ast2500_tiogapass.c
@@ -81,6 +81,7 @@ static const TypeInfo aspeed_ast2500_tiogapass_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("tiogapass-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_tiogapass_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_witherspoon.c b/hw/arm/aspeed_ast2500_witherspoon.c
index 26ddb673470..e2bf25ee512 100644
--- a/hw/arm/aspeed_ast2500_witherspoon.c
+++ b/hw/arm/aspeed_ast2500_witherspoon.c
@@ -103,6 +103,7 @@ static const TypeInfo aspeed_ast2500_witherspoon_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("witherspoon-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_witherspoon_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2500_yosemitev2.c b/hw/arm/aspeed_ast2500_yosemitev2.c
index 3ba1ed5f6fa..71375dbacd0 100644
--- a/hw/arm/aspeed_ast2500_yosemitev2.c
+++ b/hw/arm/aspeed_ast2500_yosemitev2.c
@@ -82,6 +82,7 @@ static const TypeInfo aspeed_ast2500_yosemitev2_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("yosemitev2-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_yosemitev2_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_anacapa.c b/hw/arm/aspeed_ast2600_anacapa.c
index 25578db5894..0d81ba069d5 100644
--- a/hw/arm/aspeed_ast2600_anacapa.c
+++ b/hw/arm/aspeed_ast2600_anacapa.c
@@ -366,6 +366,7 @@ static const TypeInfo aspeed_ast2600_anacapa_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("anacapa-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_anacapa_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_bletchley.c b/hw/arm/aspeed_ast2600_bletchley.c
index 6fa606c047e..abe59887d8f 100644
--- a/hw/arm/aspeed_ast2600_bletchley.c
+++ b/hw/arm/aspeed_ast2600_bletchley.c
@@ -88,6 +88,7 @@ static const TypeInfo aspeed_ast2600_bletchley_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_bletchley_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_catalina.c b/hw/arm/aspeed_ast2600_catalina.c
index 4f2b396f6f0..c98dd587f74 100644
--- a/hw/arm/aspeed_ast2600_catalina.c
+++ b/hw/arm/aspeed_ast2600_catalina.c
@@ -672,6 +672,7 @@ static const TypeInfo aspeed_ast2600_catalina_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("catalina-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_catalina_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_evb.c b/hw/arm/aspeed_ast2600_evb.c
index 8a17c4453e9..b3930d13a7a 100644
--- a/hw/arm/aspeed_ast2600_evb.c
+++ b/hw/arm/aspeed_ast2600_evb.c
@@ -56,6 +56,7 @@ static const TypeInfo aspeed_ast2600_evb_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_ast2600_evb_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_fby35.c b/hw/arm/aspeed_ast2600_fby35.c
index 28c9c143d88..9c180470883 100644
--- a/hw/arm/aspeed_ast2600_fby35.c
+++ b/hw/arm/aspeed_ast2600_fby35.c
@@ -169,6 +169,7 @@ static const TypeInfo aspeed_ast2600_fby35_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("fby35-bmc"),
         .parent        = MACHINE_TYPE_NAME("ast2600-evb"),
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_fby35_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_fuji.c b/hw/arm/aspeed_ast2600_fuji.c
index 08d809b2fd9..6fc9dd7a2e6 100644
--- a/hw/arm/aspeed_ast2600_fuji.c
+++ b/hw/arm/aspeed_ast2600_fuji.c
@@ -129,6 +129,7 @@ static const TypeInfo aspeed_ast2600_fuji_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("fuji-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_fuji_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_gb200nvl.c b/hw/arm/aspeed_ast2600_gb200nvl.c
index c9c0b6cb6e4..1b52cd42876 100644
--- a/hw/arm/aspeed_ast2600_gb200nvl.c
+++ b/hw/arm/aspeed_ast2600_gb200nvl.c
@@ -102,6 +102,7 @@ static const TypeInfo aspeed_ast2600_gb200nvl_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("gb200nvl-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_gb200nvl_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_rainier.c b/hw/arm/aspeed_ast2600_rainier.c
index 43a8f01a9e7..812c801a095 100644
--- a/hw/arm/aspeed_ast2600_rainier.c
+++ b/hw/arm/aspeed_ast2600_rainier.c
@@ -189,6 +189,7 @@ static const TypeInfo aspeed_ast2600_rainier_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_rainier_class_init,
     }
 };
diff --git a/hw/arm/aspeed_ast2600_sanmiguel.c b/hw/arm/aspeed_ast2600_sanmiguel.c
index 345a9c94167..b0979f3815f 100644
--- a/hw/arm/aspeed_ast2600_sanmiguel.c
+++ b/hw/arm/aspeed_ast2600_sanmiguel.c
@@ -396,6 +396,7 @@ static const TypeInfo aspeed_ast2600_sanmiguel_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("sanmiguel-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .is_available  = target_is_base_arm,
         .class_init    = aspeed_machine_sanmiguel_class_init,
     }
 };
diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
index de19212ab85..f7322eb8de8 100644
--- a/hw/arm/b-l475e-iot01a.c
+++ b/hw/arm/b-l475e-iot01a.c
@@ -129,6 +129,7 @@ static const TypeInfo bl475e_machine_type[] = {
     {
         .name           = TYPE_B_L475E_IOT01A,
         .parent         = TYPE_MACHINE,
+        .is_available   = target_is_base_arm,
         .instance_size  = sizeof(Bl475eMachineState),
         .class_init     = bl475e_machine_init,
     }
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index ca6b3addb7b..0c81feaea16 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -83,6 +83,7 @@ static const TypeInfo collie_machine_typeinfo = {
     .name = TYPE_COLLIE_MACHINE,
     .parent = TYPE_MACHINE,
     .class_init = collie_machine_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(CollieMachineState),
 };
 
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 78632877df8..6927bee5a33 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -168,6 +168,7 @@ static const TypeInfo nuri_type = {
     .name = MACHINE_TYPE_NAME("nuri"),
     .parent = TYPE_MACHINE,
     .class_init = nuri_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void smdkc210_class_init(ObjectClass *oc, const void *data)
@@ -188,6 +189,7 @@ static const TypeInfo smdkc210_type = {
     .name = MACHINE_TYPE_NAME("smdkc210"),
     .parent = TYPE_MACHINE,
     .class_init = smdkc210_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void exynos4_machines_init(void)
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index c1a3f6903fe..d6e52c1865a 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -74,6 +74,7 @@ static const TypeInfo microbit_info = {
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(MicrobitMachineState),
     .class_init = microbit_machine_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void microbit_machine_init(void)
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7f41a74df1a..08d875dc373 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1621,30 +1621,35 @@ static const TypeInfo mps2tz_an505_info = {
     .name = TYPE_MPS2TZ_AN505_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps2tz_an505_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps2tz_an521_info = {
     .name = TYPE_MPS2TZ_AN521_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps2tz_an521_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps3tz_an524_info = {
     .name = TYPE_MPS3TZ_AN524_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps3tz_an524_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps3tz_an547_info = {
     .name = TYPE_MPS3TZ_AN547_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps3tz_an547_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps3tz_an555_info = {
     .name = TYPE_MPS3TZ_AN555_MACHINE,
     .parent = TYPE_MPS2TZ_MACHINE,
     .class_init = mps3tz_an555_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void mps2tz_machine_init(void)
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 35d867328a9..c38d3f5ae6a 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -567,24 +567,28 @@ static const TypeInfo mps2_an385_info = {
     .name = TYPE_MPS2_AN385_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
     .class_init = mps2_an385_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps2_an386_info = {
     .name = TYPE_MPS2_AN386_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
     .class_init = mps2_an386_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps2_an500_info = {
     .name = TYPE_MPS2_AN500_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
     .class_init = mps2_an500_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo mps2_an511_info = {
     .name = TYPE_MPS2_AN511_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
     .class_init = mps2_an511_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void mps2_machine_init(void)
diff --git a/hw/arm/mps3r.c b/hw/arm/mps3r.c
index 4bd5d83d567..320eb518b79 100644
--- a/hw/arm/mps3r.c
+++ b/hw/arm/mps3r.c
@@ -626,6 +626,7 @@ static const TypeInfo mps3r_machine_types[] = {
         .name = TYPE_MPS3R_AN536_MACHINE,
         .parent = TYPE_MPS3R_MACHINE,
         .class_init = mps3r_an536_class_init,
+        .is_available = target_is_base_arm,
     },
 };
 
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 571bee1b72b..ebdebcd4495 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -657,12 +657,14 @@ static const TypeInfo musca_a_info = {
     .name = TYPE_MUSCA_A_MACHINE,
     .parent = TYPE_MUSCA_MACHINE,
     .class_init = musca_a_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo musca_b1_info = {
     .name = TYPE_MUSCA_B1_MACHINE,
     .parent = TYPE_MUSCA_MACHINE,
     .class_init = musca_b1_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void musca_machine_init(void)
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9c526a26839..6aa29b4d2a9 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -549,22 +549,27 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("npcm750-evb"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = npcm750_evb_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("quanta-gsj"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gsj_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gbs_bmc_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("kudo-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = kudo_bmc_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("mori-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = mori_bmc_machine_class_init,
+        .is_available   = target_is_base_arm,
     },
 };
 
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index a7e469ea6a3..5d2aaacbbe4 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -224,6 +224,7 @@ static const TypeInfo sx1_machine_v2_type = {
     .name = MACHINE_TYPE_NAME("sx1"),
     .parent = TYPE_MACHINE,
     .class_init = sx1_machine_v2_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(Sx1MachineState),
 };
 
@@ -244,6 +245,7 @@ static const TypeInfo sx1_machine_v1_type = {
     .name = MACHINE_TYPE_NAME("sx1-v1"),
     .parent = TYPE_MACHINE,
     .class_init = sx1_machine_v1_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(Sx1MachineState),
 };
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 22b06c6ca22..7ec650eada7 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -391,14 +391,17 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi0"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi0_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi1ap"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi1ap_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
+        .is_available   = target_is_base_arm,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
         .parent         = TYPE_RASPI_MACHINE,
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index ceba0331b08..4cffa725d60 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -435,6 +435,7 @@ static const TypeInfo realview_eb_type = {
     .name = MACHINE_TYPE_NAME("realview-eb"),
     .parent = TYPE_MACHINE,
     .class_init = realview_eb_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(RealViewMachineState),
 };
 
@@ -457,6 +458,7 @@ static const TypeInfo realview_eb_mpcore_type = {
     .name = MACHINE_TYPE_NAME("realview-eb-mpcore"),
     .parent = TYPE_MACHINE,
     .class_init = realview_eb_mpcore_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(RealViewMachineState),
 };
 
@@ -477,6 +479,7 @@ static const TypeInfo realview_pb_a8_type = {
     .name = MACHINE_TYPE_NAME("realview-pb-a8"),
     .parent = TYPE_MACHINE,
     .class_init = realview_pb_a8_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(RealViewMachineState),
 };
 
@@ -498,6 +501,7 @@ static const TypeInfo realview_pbx_a9_type = {
     .name = MACHINE_TYPE_NAME("realview-pbx-a9"),
     .parent = TYPE_MACHINE,
     .class_init = realview_pbx_a9_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(RealViewMachineState),
 };
 
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 05dfabd9376..e8aa9f41925 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -151,6 +151,7 @@ static const TypeInfo sabrelite_machine_init_typeinfo = {
     .instance_init = sabrelite_machine_instance_init,
     .instance_size = sizeof(SabreliteMachineState),
     .abstract      = false,
+    .is_available  = target_is_base_arm,
 };
 
 static void sabrelite_machine_init_register_types(void)
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index f41315e1928..ec4faf26055 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1427,6 +1427,7 @@ static const TypeInfo lm3s811evb_type = {
     .name = MACHINE_TYPE_NAME("lm3s811evb"),
     .parent = TYPE_MACHINE,
     .class_init = lm3s811evb_class_init,
+    .is_available = target_is_base_arm,
 };
 
 /*
@@ -1448,6 +1449,7 @@ static const TypeInfo lm3s6965evb_type = {
     .name = MACHINE_TYPE_NAME("lm3s6965evb"),
     .parent = TYPE_MACHINE,
     .class_init = lm3s6965evb_class_init,
+    .is_available = target_is_base_arm,
 };
 
 static void stellaris_machine_init(void)
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index f94bf96599e..99ff59ca418 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -437,6 +437,7 @@ static const TypeInfo versatilepb_type = {
     .parent = TYPE_MACHINE,
     .class_init = versatilepb_class_init,
     .instance_size = sizeof(VersatileMachineState),
+    .is_available = target_is_base_arm,
 };
 
 static void versatileab_class_init(ObjectClass *oc, const void *data)
@@ -459,6 +460,7 @@ static const TypeInfo versatileab_type = {
     .parent = TYPE_MACHINE,
     .class_init = versatileab_class_init,
     .instance_size = sizeof(VersatileMachineState),
+    .is_available = target_is_base_arm,
 };
 
 static void versatile_machine_init(void)
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index a4328ec74bd..a2ad870af85 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -842,6 +842,7 @@ static const TypeInfo vexpress_a9_info = {
     .parent = TYPE_VEXPRESS_MACHINE,
     .class_init = vexpress_a9_class_init,
     .instance_init = vexpress_a9_instance_init,
+    .is_available = target_is_base_arm,
 };
 
 static const TypeInfo vexpress_a15_info = {
@@ -849,6 +850,7 @@ static const TypeInfo vexpress_a15_info = {
     .parent = TYPE_VEXPRESS_MACHINE,
     .class_init = vexpress_a15_class_init,
     .instance_init = vexpress_a15_instance_init,
+    .is_available = target_is_base_arm,
 };
 
 static void vexpress_machine_init(void)
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index c1897ab1cf3..bc34cadfd11 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -477,6 +477,7 @@ static const TypeInfo zynq_machine_type = {
     .name = TYPE_ZYNQ_MACHINE,
     .parent = TYPE_MACHINE,
     .class_init = zynq_machine_class_init,
+    .is_available = target_is_base_arm,
     .instance_size = sizeof(ZynqMachineState),
 };
 
-- 
2.52.0.windows.1


