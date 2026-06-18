Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC887CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 09:36:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa9Ai-0003te-P8; Thu, 18 Jun 2026 05:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wa9Ah-0003tM-KA
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 05:36:27 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wa9Ag-0006BO-33
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 05:36:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so6012015e9.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781775384; x=1782380184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rSiZndLvMJS0Q2dZVj2p/qMhwV43uRpLGeTiVqh9RAU=;
 b=buBN/FBI+kRWAsw/DC0swwoWmbR8UBATne9QTaW8M5zN7w4f63YGHl1p0kmYcSSQuV
 2tqHDrAL5xYYJ305JrFjVq9fqJL8jEUgXokagjoINMiFK2+gAwt8e3nIueKoEkwEo8En
 W40VMrolpFLGS1e6J4CWj8X3zLFh4mXmuFtSaRie8MaKlDcbYtP7iKX94pRwLLFqqEks
 Qsqz/1iboIhAJG271Lo8JqFTecam683NQLHbjNh8VlqIBPdUvv7K2oejkUyZCwOEgJOL
 JE8HMnfJluGE+pI3ccyeepTUHQP5y1rKuJMbbINgUlaBcq6YBh+krkpgWmhmc1UpET/v
 8gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781775384; x=1782380184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSiZndLvMJS0Q2dZVj2p/qMhwV43uRpLGeTiVqh9RAU=;
 b=HmNii6IP4hTqNs0lxuEmsS8ivD004c1AIGzboZM/fxG0v7CgyfBMikJDAtxQFkNkG+
 CPMdbz/SHzNCF4hlJqlRVuL0I8YQkcRT2q43fcGiL7jxOdZtP93eP1rjAOngqtg3EW81
 kplfR+q6yh5viQaKo/ok71hbm87xQ27fabpw+Tr13mEAsprPJpltH/w4ntkdfYBAEylv
 kpxAB7LrlfNFjXdBzVZNX42B0VuklHbKkUAzYzjWPuyD/nXErM/Ys0ViMXqiW2ulZYJS
 qEf0GU3CjFI0D1RdjKRSezzV6fuWIjpe7jt3o7tIOqinrYMmuPlsrm/fVSrdcTeCtQaI
 PbQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+46F3thHB3ZgvZPmuiHmLkp7ABvKq7ktMffqPj3plKlpDjOF2NZ/leBe0Yn80aKYwwieDi/kar1w==@nongnu.org
X-Gm-Message-State: AOJu0Yy8TG1cUmNqAv/H+F8BAwkMsrdMZ4eqX+Vsu3hK8H2ZaSrMGI4y
 Fgx8VdkwvapUY8IlXfv5x+GnPuiBTEosvKFMjashFJKhXaaNi4bKTmvG5zCh9B3xb3A=
X-Gm-Gg: AfdE7cnqF0j85mvSd7HpjYNg+4SZeGUt7AHJXuue00xrrvienh7WiYkr0EBlInkJOEe
 Zd78AdzCVFT2XLZiEMby6qhlGdECPIiZbu5piPuiekfR3fRqsCyQkKJwhUGg7ZBHuSsBO+ujDrG
 BbBcohF/7vvypKHcQsor7hZ2CPGnOxKe41gFTob/3MNmYyo/DPA6b/juqEsVr/cuQzsZY/I3CPY
 iy/6fxYYCtVChnNW3LkBe8KI1T3zZ0u4OqOMYQVOkR/8JEPAo/PL7tXa5SARc8g62G21sWQuu+b
 QMaP7e7A7Xms45KLkiIAp3DxcKvXEBMtNVm9aK5nQTVdkqTmkDe41zU8P03ul1xGC7g71g1taDD
 W/lpquMuBdoC8MOdA1z3O4Yn66FBDhfbGNmOUspuqUkw92qagmdOcPKNppPIM5ivZi3KcSNlpf1
 Uc+kJ16Lnq2H5f
X-Received: by 2002:a05:600d:4453:10b0:48f:e3e7:3d39 with SMTP id
 5b1f17b1804b1-492341086a1mr88900985e9.11.1781775383667; 
 Thu, 18 Jun 2026 02:36:23 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923a1d3fcdsm29456835e9.1.2026.06.18.02.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 02:36:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B739B5F905;
 Thu, 18 Jun 2026 10:36:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Arnd Bergmann <arnd@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Nuvoton NPCM7xx)
Subject: [RFC PATCH] hw/arm: use correct base address when setting CBAR
Date: Thu, 18 Jun 2026 10:36:15 +0100
Message-ID: <20260618093615.3793919-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This should point at the base of the Cortex-A9 MPCore private address
space. If it doesn't we will confuse the Linux kernel as it probes the
SCU registers and erroneously assumes the system is a buggy Aegis SOC
and nerf the emission of SEV instructions, deadlocking any WFE's in
the kernel (or QEMU smpboot code).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Arnd Bergmann <arnd@linaro.org>
---
 hw/arm/npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c2bbcd89dbc..c27f149c04a 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -492,7 +492,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     /* CPUs */
     for (i = 0; i < nc->num_cpus; i++) {
         object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
-                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
+                                NPCM7XX_CPUP_BA, &error_abort);
         object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
                                  &error_abort);
 
-- 
2.47.3


