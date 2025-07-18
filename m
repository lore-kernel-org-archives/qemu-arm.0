Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79829C83F1A
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 17:37:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucp0q-0000eg-6q; Fri, 18 Jul 2025 13:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucout-0004x8-SY
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucour-0000pl-6p
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso1456410f8f.2
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752859835; x=1753464635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvx8i4URe9B1o91t3gt7armpMc3qpa3OmgcI+KegyPM=;
 b=h7ROZCJvXpq98ltNxRqt3hvFubyP0qkvvU2jG1IyJDmyEK6HWOCO6YTcCKeLUO7vCZ
 8MlCKXHlz+36S8R6gcEl8VHGQ2g3XNWWMOPlZEvbmw17hsPj+hLFeFIO1V19TlJJ/GXu
 u8zXqDrV9NBjAZJdDCsnmSDVEUuLrrbhSKgWQNnjrMEOuS94FQCt5hNiXwZ1HofSX64N
 Pd2R1xk19kdgrMhFZ79hz71+qjcPcnE0uY34vNquHNszRzrCbccaHmcpIgEFqpko8Gbm
 o7ZWz9cnPVH2Lbwm3UUS7VjSY79yk/kDHxpYNCqkRCEumQN8ZwnthaRjxUn1g32WwIE4
 Y/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859835; x=1753464635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvx8i4URe9B1o91t3gt7armpMc3qpa3OmgcI+KegyPM=;
 b=pUm/+Bs4BwN1uG+07kZ7WTpLpvNuBa0TZOLyvQAYSxLwGJ7Vcj3IgaAKtyU40g8bk4
 6tGUIirNV4DyA6wT1RONOI5VYMPmRw0Uxm9JEy7KZCqcSee6SU1XCC88aRC/heddiLug
 s+OiZtdwwaT6lwb/cI9a8UeYZOmrs0FJdITjpdjwt6HJ+E0c0T9lVRz0NYKuvSBJOYok
 akouy9+xDrKnP/AXidj+KUucNQ52PY5srfY724wY5fhGtRrt1TEVQcG6Xp76xRTpSV/n
 m1lT8sFi/YRv8wAuUFaH2FBy7v/t3Uzj29Xy4HLYttj4+OLZb5FPGxWYIpvMbxORKo2m
 rlxA==
X-Gm-Message-State: AOJu0Yyo7400n9E1Eyz5/Wdie/Ish7ms9AzAIkjoPnWon50uREEAfRle
 5GntmDNLw8v/7J72mnDQ7jbz1eh+5dksn7v6MBWEjr47GCCs3SSr/RFYxKjXG99GCB58+ckxfgv
 IjDa8
X-Gm-Gg: ASbGncvoPgyGzDwSKiokZdHRAVeB/ifk/RhFWudwXe8dwgja/zeOV2jjoTorPQrnbvF
 ZKtnRgawkvRS0CQ6KYLflwc0VW/2N9faEt4GoqMEsW2qPaKSFEmtqxKL5MoxYMZV1E2a6PNbzzW
 mJHHpKswJRsEzScb5Ef1LLj8Etmvv/DTspwAjuEw1nCedFXguCqi8SExX+kRPbKxSPAQVdh+i1R
 10u1JRVNBCJd71aC1Dtkywy1arc3MkYdOe/wZz4S1C6xZDchjyA5rDfzK+DHcPcYRXw0EMvfLzo
 00OIo4FliitFgg2vqQmWZbQ4s7fnZK0ahKkVF4UbggMh3jqhPw/pl50W2ex3Awoer5JJ2LCq7hf
 a+CR3FZfuHxNiabfjqkvWYVG/aiPt
X-Google-Smtp-Source: AGHT+IF9Bzs+4dM5zZaO8+U/YoTXmgKcN7TA/KmmxGD9ceY+twOMHQsDo/zpw7xZ3uQWbeWF7q08Tg==
X-Received: by 2002:a5d:64e8:0:b0:3a0:7d27:f076 with SMTP id
 ffacd0b85a97d-3b60dd651d2mr9312420f8f.2.1752859834879; 
 Fri, 18 Jul 2025 10:30:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25443sm2454655f8f.9.2025.07.18.10.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:30:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 00/10] target/arm: Some SVE2p1 fixes
Date: Fri, 18 Jul 2025 18:30:22 +0100
Message-ID: <20250718173032.2498900-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

This patchset fixes some problems with the recently landed SVE2p1
feature. Notably, we missed out several bfloat16 insns entirely...
This patchset adds in the missing insns, and also fixes some
bugs in the FMAXQV etc insns, and an incorrect assertion in LD1Q.

I know this is slightly pushing the boundary of what counts as a
bugfix for 10.1, but it would be much more disruptive to try to unwind
the SVE2p1/SME2p1/SME2 features, and these are fixing the bug that we
UNDEF when we should not :-). I've set the Fixes: tag to point at the
commit where we enabled an accidentally incomplete FEAT_SVE_B16B16.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Add BFADD, BFSUB, BFMUL (unpredicated)
  target/arm: Add BFADD, BFSUB, BFMUL, BFMAXNM, BFMINNM (predicated)
  target/arm: Add BFMIN, BFMAX (predicated)
  target/arm: Add BFMUL (indexed)
  target/arm: Add BFMLA, BFMLS (vectors)
  target/arm: Add BFMLA, BFMLS (indexed)
  target/arm: Correct sense of FPCR.AH test for FMAXQV and FMINQV
  target/arm: Don't nest H() macro calls in SVE DO_REDUCE
  target/arm: Honour FPCR.AH=1 default NaN value in FMAXNMQV, FMINNMQV
  target/arm: Make LD1Q decode and trans fn agree about a->u

 target/arm/tcg/helper-sve.h    |  32 ++++++++++
 target/arm/tcg/helper.h        |   5 ++
 target/arm/tcg/sve.decode      |   5 +-
 target/arm/tcg/sve_helper.c    | 109 +++++++++++++++++++++++++++++----
 target/arm/tcg/translate-sve.c |  97 +++++++++++++++++++++--------
 target/arm/tcg/vec_helper.c    |   4 ++
 6 files changed, 212 insertions(+), 40 deletions(-)

-- 
2.43.0


