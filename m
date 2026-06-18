Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06819CD98F0
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 08:20:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa7zL-0005Ky-2j; Thu, 18 Jun 2026 04:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wa7zH-0005JK-Cp
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 04:20:35 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wa7zE-0006Rj-Gs
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 04:20:35 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-bf84a2b2077so71902466b.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781770825; x=1782375625; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nzKecFzzJ+fkZZYx0TiRpzRvu699VJe9wdFjt/9EtTY=;
 b=BTXxXTh7Wfl+LAvcKz2XGKIycrMOKHUAPDbjm1j22DuY4WKCy529y8RrORU+vfHtC5
 JqrxNHmSZ8WH/l0ik1mLqyGQhkxbqRcOHyd3/KyZ5NVGogyfFagmo64+E9DK84egEay/
 JeYUQRLnlAa51idoqDMLoK0ljjD7T1gNa23zdleKR208LI+4rU4TeTBGaMF5YiDlrhWR
 doDqi4UeEXQfrkdWK12/nLyvKmGWir15grmY5GSOPGm+IZK80fDopZuNKMDrrdlKO8zr
 cz0k3WUhXliXQApvAaQqoVcbMk+F2/xr7GdZXsuKPUy4w9dfK3gtiOZlRubTsYtS2bRU
 FT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781770825; x=1782375625;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzKecFzzJ+fkZZYx0TiRpzRvu699VJe9wdFjt/9EtTY=;
 b=L8hqDIyfNj4fXnHVkfiq64DgVJe98zV7XFJ+Oiy2/kzLUU3IgTogwSZTVrmI6QIc8+
 wQdoHboZGljMRLhy+3anY8JSrcg7Wu3qmcgjSLv4ZCJ+MtOpYwJOXlyC6bn2JtRD+9xY
 DYSnELVrR0lRGvrzgls+S1tIpKk2pHMYmf8cZtl+u7J31yv3IHEgjlfF/LBp28XSGKUO
 6aplA6OkQ+r68k7UPugr4OU5vjIbmW71riyXjB6eSTuZ6NwponTiL047xkfJ+MJtbbTb
 axuezXAVGhHs/+Toip++f93UvEoOpeWKOaJvupvSnOHPetqHsoj/fb8kEGJSKaP0S34j
 mq8w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9SNpVEvUaH8AHt1+PRuhRfeEGWH5CnZ9N68nt1u0HEVnqhO5pk13db09s9PKNtNdwR2Rfn1N7MPw==@nongnu.org
X-Gm-Message-State: AOJu0YyiJTzk7S9gwNp/bCHucIJpL3RhPeOAnj4pQcR1lew7znM9Yv/P
 ZXw1rbujcAl6j925K4+sw8BS4JleugbKA0XDjJVCh5F1UknmjeH4Ylpa5Ux3nOibBIx5DdsaXwr
 UWG+4Ilk=
X-Gm-Gg: AfdE7clh56RTRbQY8lZJIjJ6nzrWsCL2eieHZVZNNje1RjJzeojepXrXA2nYQMLj7/O
 AYYjZzWPsvi2z62sKZiets1J5tj43BS5vEnFVmkSwlRwb8lM8O7vb+TpFcfeK2on+0Xnam8yo4q
 HI+9biJUAFj/7UEEflNGGe+zqjRKU1TBNxyLVbD/kfYr08NQrcdf/ql5Sbdr+4cG7LagQicD5eA
 qUF23OPycSSortZGdqsQO/cSdJU4PbxfMPF4eNxD+jzGCryAmR3TtlUnew0b8Hfm2YPcmD94Lhg
 tgu8l3qGiCn9/mp++NTy5Js6stxCmt3+CQUbmD8iXA2C2kcK2/K2y0MvrAg2hs1afd9Q6fiekkq
 GGAaTI9p17vuApNtbMbEn5Yx6CeeN+VfIrlR6Qnauu3HHdRLfn5g3DzG2w7sN8mrxPYykhJ6mA+
 +IVTwzOG7RIRUozEGXGSrkRxjJLg==
X-Received: by 2002:a17:907:3f11:b0:bd5:151d:2d31 with SMTP id
 a640c23a62f3a-c05a4e10e7cmr417518866b.13.1781770824769; 
 Thu, 18 Jun 2026 01:20:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a63e:e8c0:5950:f3f9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfe7cc615b7sm854334166b.48.2026.06.18.01.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 01:20:24 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 0/3] Implement FEAT_FPRCVT in cpu_max
Date: Thu, 18 Jun 2026 09:20:22 +0100
Message-Id: <20260618-jmac-fprcvt-v1-0-1b4475bacf51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEaqM2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3azcxGTdtIKi5LISXUNTU5MUk2QLg6RkCyWgjoKi1LTMCrBp0bG
 1tQBSqe5IXQAAAA==
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x632.google.com
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

This introduces new forms of FCVTXX instructions which convert floating
point to integer but place the results in SIMD & FP registers, and
forms of the [SU]CVTF instructions which convert from integer to FP
with a source in SIMD & FP registers. The logic for conversion and test
values are otherwise the same as the versions which use general-purpose
registers.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Jim MacArthur (3):
      target/arm/tcg: Implement new instructions for FPRCVT
      tests/tcg/arm: Tests for new FPRCVT instructions
      target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max

 target/arm/tcg/a64.decode         |   15 +
 target/arm/tcg/cpu64.c            |    1 +
 target/arm/tcg/translate-a64.c    |   66 +
 tests/tcg/aarch64/Makefile.target |   25 +-
 tests/tcg/aarch64/fcvt-fprcvt.ref | 3331 +++++++++++++++++++++++++++++++++++++
 tests/tcg/arm/fcvt.c              |   26 +
 6 files changed, 3458 insertions(+), 6 deletions(-)
---
base-commit: b0df6e2f2c6c45df8d4d286933799c623e124d98
change-id: 20260618-jmac-fprcvt-1554d4c80bc8

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


