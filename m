Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F6DC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 22:48:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wf3ig-0001i0-B1; Wed, 01 Jul 2026 18:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wf3ie-0001gK-Kk
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 18:47:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wf3ic-0002aB-Ud
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 18:47:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47248615e4dso1195021f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782946065; x=1783550865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eXus05gydvHtWqwKIMnhXZV/4EZZVvMEfjI0FZggN0=;
 b=FpHTk8YhQrU9A6HSmCY6nRYCLB3AcWJSGPykaxb4qxZSNjgxmdEYSX+mpsp4cmVXSP
 TGm7UQaxi21nA03O3C+c5/CawugGMJ1tR7XW+5HSEtGRS6SlyJHGG4SU8jyBHj/vLoYc
 DjLXtxFzHB1XpldAXJhJM3vy345LLZW2OkssDj6gEUiQuGbu2oEpqHRgUrgQMNvbnxTb
 RL407JAX225NK/lUIf7r2/W8lPsk4D9+hcrQ3e9s/q504fdPhIA5L01cvX7T7QiKNcov
 JOpFNrHxW8VR51OFWcelfycGd9WzT0K1rEmnZWuHHbUe19ReNjuiGmENnUE3gy8TwSBF
 sXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782946065; x=1783550865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5eXus05gydvHtWqwKIMnhXZV/4EZZVvMEfjI0FZggN0=;
 b=A4kDDAiOlgePKM5pUcm7K9d/eGkdfYxEdVqQF6MpagO3iIXGqqTyTBNIle2xi1DYBd
 aNV0i4fK8mqMjvkQT+QyN7P99nKuhlw6KEkVLDrnBPej3nR5xzdMAsJEaDXSJaEzmxui
 opetXSU1fwYGAirhOmE2W2M76IO0CF/ReCUBQENuVjYGBiCt+ZPj7l+OaUeWOEy8FC5c
 G0sJJrBVZBNopEetJ/KUUdoCNHNvxC2Ljg/v1F/rAI7Gp7RpxTrE6PkEQeIr1Yy9dMGx
 O/EUkt2HMhUKA4nGHFIFDODFAlHG3TMc50G43bh/vOkAd4i/NeFSWJxwNsCNEZr719KV
 EecA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqTURrjbl+t7ejeoOlxdqBFDfMqgpL1f92fz2ubYqU4WrO8UVEFj2RguPbeUu/Oh2aFqxQDbc8vtA==@nongnu.org
X-Gm-Message-State: AOJu0YzU8eWLde7IUsg9CE39sawbHWOF4ZRBLjjzwVEnUs1HhAQgNLAE
 XQhM+z5nOpFlEkZpAhywKiUHsXHrgFHwumDGBqViLSBktMcuH4eqDbeg
X-Gm-Gg: AfdE7clVn98D6pfVUSgLLCy17XFVXMw2r8ESHYkYnTNvWeCUJ0+/U/i6RhH4KF39SUS
 Z0YAOIxq/+VuNzJbB7qhUE1cvfnc/vROKu5HlGaGJkC/V1+zxgpCQWuEePTGYFODvYxK35PoHz2
 YL0q3iE797Jpa+SV02GB5OmHS4RsfNE+n77OF0bSJOi2RX52B8Fv96Zgh3Q3ZNTmdjnm/g03XiT
 eatkcbnFD+bG7h1Fl0/SG6tnrSR2/whT7614X1DM7Us/Wg/j9InyRMtBmbvl0QrCtsH67hxv0/Z
 QszaDk2f/ibZ8rQ2RIj/3bqz9GVBBPtIPECu/ACyey9vFgzQivcCf5W0+Lf+YEjs2kWsGPKGnEo
 k3R1oWW03gSb1ZPUGZ8bitYcxeeUZ12NPaAcM5t3KgrgATadsSRuys3VXzDDflcNSmbAHWl+0xK
 slmTnCPiyy0NzDCUlgyUtq/qcqnJBP3CdZ7SqY96CXoHVKm96DB+hoVMf81Fhs++VT+Ho8Xg4YM
 4/9h/J9FyBUIAyb6r64H6+b3VWra6iATKtq
X-Received: by 2002:a05:6000:4203:b0:46f:f12b:e456 with SMTP id
 ffacd0b85a97d-47758db8316mr5367812f8f.25.1782946065010; 
 Wed, 01 Jul 2026 15:47:45 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2d44-b300-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2d44:b300:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dba0esm3178614f8f.7.2026.07.01.15.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 15:47:44 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 2/4] hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
Date: Thu,  2 Jul 2026 00:46:10 +0200
Message-ID: <20260701224612.48342-3-shentey@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701224612.48342-1-shentey@gmail.com>
References: <20260701224612.48342-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42e.google.com
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

Open code the DEFINE_MACHINE_AARCH64 macro in preparation of creating
FslImx8mpEvkState class, needed for FlexCAN emulation.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mp-evk.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index b84ac91a17..4a0c9df76b 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -113,8 +113,10 @@ static const char *imx8mp_evk_get_default_cpu_type(const MachineState *ms)
     return ARM_CPU_TYPE_NAME("cortex-a53");
 }
 
-static void imx8mp_evk_machine_init(MachineClass *mc)
+static void imx8mp_evk_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "NXP i.MX 8M Plus EVK Board";
     mc->init = imx8mp_evk_init;
     mc->default_cpus = 4;
@@ -124,4 +126,13 @@ static void imx8mp_evk_machine_init(MachineClass *mc)
     mc->get_default_cpu_type = imx8mp_evk_get_default_cpu_type;
 }
 
-DEFINE_MACHINE_AARCH64("imx8mp-evk", imx8mp_evk_machine_init)
+static const TypeInfo imx8mp_evk_machine_types[] = {
+    {
+        .name = MACHINE_TYPE_NAME("imx8mp-evk"),
+        .parent = TYPE_MACHINE,
+        .class_init = imx8mp_evk_machine_class_init,
+        .interfaces = aarch64_machine_interfaces,
+    },
+};
+
+DEFINE_TYPES(imx8mp_evk_machine_types)
-- 
2.54.0


