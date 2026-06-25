Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CF5CDE00B
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfG-0004eV-Nu; Thu, 25 Jun 2026 18:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsed-0004Vm-Pm
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcseZ-0002Ji-6X
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:34:38 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-84532e3dbf7so138061b3a.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426722; x=1783031522; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZV/kyDu19iK9TBsZjnv9GOAzX5xEKZyDgPuNnON5tvk=;
 b=qfNpEybR8ICcWAkWZ+b8DwbpGXAfO7m1LzFF5C4bx06RTym4hdDEXUlgByd/v06UEE
 vK2ZEQz1iR0tkhN/iHFihm7HZQM6ZFsbl6PhUgSMkwqjInsVgGd8giVsxxCGsVOnRLOV
 iIbkpKF+xZ7XJQAezYRJqOYoSa65AJ96Y8tmRBMi5D92r7zYW5mwByADROiadO/dRVHI
 lPd+fwtj5ZMMUC1w4xP+bLUlVNEQvltTSNMmxzPSqDJU/m2U1dGaGwlgZsz204ZdgNBP
 8H1cZIuefZGxYR1NCATBHnE554UCulsojf8jdb0Q+GA4SbZsQqhAL0vIk7l6oTElOcC/
 gTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426722; x=1783031522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZV/kyDu19iK9TBsZjnv9GOAzX5xEKZyDgPuNnON5tvk=;
 b=DYh4deN+niokhWXlY3MrZbrGgIh3bi6E1a6+j6WEhbz/EpYgAxx9Ug1xbb/1Qp/j00
 0yw4AjD0QOLTju1ZqH1jT9hSTWNn8d6px+kzqO/Y83QLry9sVpThdKckVTp4XsfxUDlm
 ho9ns/X2lC5DVDxeIXhf02qhzish35dbaoeyeSrnoM/uAI+1puiWhJR8KCdY9OtYbBAb
 d/MvbWC6vL4j2ogEVc2JnXuqVtYMMlpzMNw1IqxuGDU6J2THBzADLpv/XwFVmYmgqUwL
 2sX7gg+bp6eg+OHVyGQafV4AzkU7BhzMvtWMK2XfUBFKAnxdW4WocrPIRhUW6AOutIP1
 ClQg==
X-Gm-Message-State: AOJu0Yyj1qru8QWacBZw6nDECGAVXvGURbOhhehQGpaVKy3U40VoaYEV
 Dqj/e987b650euWISOjcF1F8/Ai5jq/Iy3Fj77OtXzp4XjZeI186tsgWzRnbgv8zHzi5RKGRCda
 QTkAk
X-Gm-Gg: AfdE7cmtcbxm9GK2HlZI+DjgxPh8sxYB6SDL0lWorhRogAguVFjCBezqPZKmNuaDvSO
 O/ePPyrXV6NpvswFukRWQlPFtsvnt+anMcxld/vi9Z5RVWkWBvwocNbVlqmPON0Yd2IKvjtCi8N
 iI1gpWo1qmmvV88mIlkY5OUZz5ENADG6M1ATe9yKDyXHdZRay0IaDadoU1bz2fdly8IbMV9am50
 zeWvkpHT7OXCIBv4g4diBj2fetBxV+qNV3/EmZiGLYcbRIjsP/lsBQnfyxvYpjFjuUuJ7L/epgI
 AaZ0BU6fRNbzfizCRwzCNHkKHWZ+FHNsqba3nRomidxhOjt6f7ZGEJ1g6HjQr5H1kEF8mGQJDaJ
 8CcicHunjoOxRsyDmVw3wFjl8xImIzoyoNvI+mvcVl8p/bPIy2DAAqGsm0zZY+uWsmvf1sj/u+o
 dK5Rzb/W/fevxH87wI41L7AJQoiOkdyIqtRM3lOG/+Ch94gFnn0w==
X-Received: by 2002:a05:6a00:278b:b0:838:c01a:7a50 with SMTP id
 d2e1a72fcca58-845b3adeba3mr5133694b3a.30.1782426721526; 
 Thu, 25 Jun 2026 15:32:01 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/15] target/arm: Implement FEAT_SME_MOP4
Date: Thu, 25 Jun 2026 15:31:45 -0700
Message-ID: <20260625223200.763198-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Based-on: 20260625015159.719300-1-richard.henderson@linaro.org
("[PATCH 00/10] target/arm: Implement FEAT_SME_F8F16")

Another minor feature working toward SME2.2.

r~

Richard Henderson (15):
  target/arm: Implement FMOP4 (non-widening) for float32
  target/arm: Implement FMOP4 (non-widening) for float16
  target/arm: Implement FMOP4 (non-widening) for float64
  target/arm: Implement BFMOP4 (non-widening)
  target/arm: Implement BFMOP4 (widening)
  target/arm: Implement FMOP4 (widening, 2-way fp16 to fp32)
  target/arm: Implement FMOP4 (widening, 4-way fp8 to fp32)
  target/arm: Implement FMOP4A (widening, 2-way, FP8 to FP16)
  target/arm: Implement SMOP4[AS] (2-way)
  target/arm: Implement SMOP4[AS] (4-way)
  target/arm: Implement SUMOP4[AS]
  target/arm: Implement UMOP4[AS] (2-way)
  target/arm: Implement UMOP4[AS] (4-way)
  target/arm: Implement USMOP4[AS]
  target/arm: Enable FEAT_SME_MOP4 for -cpu max

 target/arm/cpu-features.h        |  35 +++
 target/arm/tcg/helper-fp8-defs.h |   3 +
 target/arm/tcg/helper-sme-defs.h |  49 ++++
 target/arm/tcg/translate.h       |   5 +
 target/arm/tcg/vec_internal.h    |   8 +
 linux-user/aarch64/elfload.c     |   1 +
 target/arm/tcg/cpu64.c           |   1 +
 target/arm/tcg/fp8_helper.c      |  32 +++
 target/arm/tcg/sme_helper.c      | 390 +++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 130 +++++++++++
 docs/system/arm/emulation.rst    |   1 +
 target/arm/tcg/sme.decode        |  45 ++++
 12 files changed, 700 insertions(+)

-- 
2.43.0


