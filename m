Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D275CCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:20:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7JaO-0000Re-O8; Fri, 10 Oct 2025 16:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaJ-0000PY-RL
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaD-0002l5-J4
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7833765433cso3351387b3a.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127559; x=1760732359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tH9GqwR+qr0m9WVewY/OnVPs0CJUBzEaBal5CzQgOi8=;
 b=uIedGAuQ7+swakgXdtCc1tqCX1HMQKXVV9qeflsv4cUXcWwvCEkG2Z7i1Vo0m/O5gq
 o/hKcoZSqIxDN6AnWOBrWi8SJmb+Tx25Wo8Kag28zqMClRzX1g5kWgIVMPbnoTNM7bxW
 LaQxNkv6vbq1aKteeiEc3zdp11e1kdCt5v1BdKOJA9X2HebpMcKIk0L6xd49uSo4SwCU
 1gMLbhwSei30zrjE0ZeMSgQrnPd8m7bCOgtRvMkyqbBckUDYEQiGmVHYe6drvzSUAtId
 s8PTgCQdfA3CZCnaq6LSip0Pu7fOuqYDkPt6nYpWqiHpVT44w9foblX0n+eZZfHGUxuq
 q6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127559; x=1760732359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tH9GqwR+qr0m9WVewY/OnVPs0CJUBzEaBal5CzQgOi8=;
 b=LXUvmk39m8dqZrHy82dceUSz9HzoLMyf2ArnuHUamJgZA0e9wOXtQ+GxsiTc18+j/V
 w67oUrLS8zbCNnl3uWzj/RczY640p6p+h5oR2wbTsqHiAHVR4C6MF0mHtd6Z32btLTG6
 7FLcfEBc6CRmkWMrzvAMYNmdLHFNOTpq8kEU1ApyUVz+MtnuMy+bDba6060nd+K6ZIqF
 Eci48SwUIfci4G+FPdd4G+jyTbc4ILHoLfetI9k9XjQW7idD6PUMsdL6wkzM9i3IuahT
 B6cHOLj3YONQ1RQzglYyWjuf9hfrM7XFUaPDVN0QrHu2IycRDlY5raNkK+Vu6TEpPe25
 Wo1Q==
X-Gm-Message-State: AOJu0Yw+HRTnj6vnq1IItgqfU3TwMduTfIbVlsidD6WhepSJT7vmREk9
 F4xBh1DNRepGm94aJeYaQumNcNclsPFkVXm6wa1gBoDRQkCpHiJFpavS9+hJI2fzwz8=
X-Gm-Gg: ASbGncvT33ANSIObhGOygz3LOx5I1bXBJDlcKrHxVuG7CmSvq2+Wy7GXf3WVoQZbTTT
 johF/poTrWUd+u75ehICS2E/nSi6IbPOO5P2xJmXP6LMTi0Av0Ql15f1yV1TkOayPTNtOvDEku9
 vcV7jUrE58G3sPrpAF7cvG8/oE4SzwlwQ4UGZjTpALaFdYOVIxxkmbFZqXJuLZOOUBaRO4dLSf1
 X8ExWWq67Bbag50RuTX5/cMqsguGN7K73A/mPWU58e0s2hDaSo+hXD5J55JgUTnDLfOKb50mYm7
 y10QYTxTRC+oQez0UhXfdgVnnX3uWM9yZRAEMDYwwAPqTGD0YgQPB7zjAdcxoq3OA0+kCT1/BZl
 i+/5gJsNBCJMvH+8C712L3jkRpvPqxai1ItSAxFmBdZ8Jk1jscVw=
X-Google-Smtp-Source: AGHT+IGOTOVjZAG8K0+s1NeTd0suJH6tP99jgKSyN0SMjU7U+x/YG/bYVmZEGdslamQ5yU35tOCpEg==
X-Received: by 2002:a05:6a20:12d6:b0:2b8:5f2d:9349 with SMTP id
 adf61e73a8af0-32da8453c08mr16744614637.41.1760127558953; 
 Fri, 10 Oct 2025 13:19:18 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/7] target/arm: Implement FEAT_AIE
Date: Fri, 10 Oct 2025 13:19:10 -0700
Message-ID: <20251010201917.685716-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This feature adds new registers so that we can support 16 attribute
indirection indexes.  It is a pre-requisite for FEAT_D128.


r~


Richard Henderson (7):
  target/arm: Add isar feature test for FEAT_AIE
  target/arm: Implement MAIR2_ELx and AMAIR2_ELx
  target/arm: Add AIE to ARMVAParameters
  target/arm: Drop trivial assert vs attrindx
  target/arm: Use el local indexing mair_el
  target/arm: Honor param.aie in get_phys_addr_lpae
  target/arm: Enable FEAT_AIE for -cpu max

 target/arm/cpregs.h           |  2 +
 target/arm/cpu-features.h     |  5 ++
 target/arm/cpu.h              |  5 +-
 target/arm/internals.h        |  1 +
 target/arm/helper.c           | 92 +++++++++++++++++++++++++++++++----
 target/arm/ptw.c              |  5 +-
 target/arm/tcg/cpu64.c        |  1 +
 docs/system/arm/emulation.rst |  1 +
 8 files changed, 100 insertions(+), 12 deletions(-)

-- 
2.43.0


