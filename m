Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AEBC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 07:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufw1T-0006JI-CD; Sun, 27 Jul 2025 03:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufw1L-0006Df-Bt
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 03:42:12 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufw1J-00014U-4L
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 03:42:10 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2352400344aso30452605ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753602127; x=1754206927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E6TDRzxDf7JZ5uG5ENuSiSwN4duOSvJb2nWMSGUGpe4=;
 b=C/VN+SIpYzBXRaeKJ52wv+Y+LDcNa2qrmtp59WVMAqhv7BU2DwiWiDa5RC327HzjhW
 q4UfB3uryZ7iQe8X2J8qODgWrnggM9y0QXJoDNm9tsUcAhFYHwOJV1INJbHcwdt2B1fV
 LbccQt0cM52Bxu1IfUqbwqem3CzAW2tFNrdnqMC88alwN+07Ba86W3N9nQ/FN1SmPF6V
 lCyn/RQ6rEtilPGC5ovKVLm8Ak4ClEbamsMzh0W6cMHROCDxVdLr5TF8Sb7IcIhAiPc1
 vcyh6Ge/eZuYb+AfvFCkgu6cjiTvX+EZz+x7NIoow2NWjjVTbmQxeMJLkuwWqFbAb1Ve
 X7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753602127; x=1754206927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E6TDRzxDf7JZ5uG5ENuSiSwN4duOSvJb2nWMSGUGpe4=;
 b=E7rXLOV3Vgx+Bf8dAefDDUk3NYEkofq8070ypEnOCziTUUQENl2toBmeY2g3Yt5Cqe
 V8ML7uyzEnK+cui/p9DrkBsj8NjwCww43Rwjo3wpUu2uJG1+N5G+FV+kDEpCYG/CJy1v
 r6Y4yADCKB7f/Z8+MAInBQfafSBwkOB7eyGlY0n/quZJaMGvs8l4pQCx5/OHCDfD3xZL
 1ZF4En7upCJHIlquuF6/uLoTFOaUIVZ439MO23+xZcfMDcPQXu0Ju70BapRUjvKBfgBE
 UZdgMnUvdOHCXbiNyynY/45sG29Brb9OlL9VpBkbrHYbigguUzoaF8nxJLcs31LHgJGe
 1VEQ==
X-Gm-Message-State: AOJu0YwWkJgFt6O3tBdt14zDUhjHorsp8ODPsqfgs8HAPNVhFqDr+Tr2
 UTA/efVGsA9Unm9+SNRpk/FDeBaMRIfeK+4qfPLpWt4b/sMG10rlOqrtKCMwo/XIGx6yzdYh1AA
 b/Rpq
X-Gm-Gg: ASbGncsFRz5Gl7GhUDse6EW8AX2PmXz+CuJ+izLP6HRkBq+mEllobFJTRATFac86U8u
 uXCAj9vEyfPIrmVulk0aRhpRMF1IpzaxE2Qg5twe2chtxRXrcg9ZMmJsBwyDyB9e48hKPRv9bdI
 J3VpoQ/w1ezah1tFtg38Ddp3bygfqP1FPU5Lwh5JmcyhW6bNSa0EWe4jgLCkj0pHZPErZFFDvI0
 BiIP19j/wJFG2dJ+j82D83CFd2RPMiuUPp4T9nyh2swmwTom2M2FP2I1F4SbRSJsa/ATE490wpv
 9RUV3tBfFe2fwSJzYofIVUB6/C0iDjYmnumbzQDeF8jlU6LRX7Ya2FqHfxmiw3iwP2Ztoc/GJgn
 NfQe5wtby9GsX2V69dXGlOm1Hzr18sj8LOWHEXD+kUZTJHpP2qATHFSS8Rn8KCNNPnIbMt3xZul
 DjLyn0oBXPmQ==
X-Google-Smtp-Source: AGHT+IGiYLYizD2XtU68iwgdmFmUnTWbbeq//trO32x84IrPy9WPOk397yfdLdRk4D1pdx7dLhi4Gg==
X-Received: by 2002:a17:902:d102:b0:23f:df33:21cb with SMTP id
 d9443c01a7336-23fdf33243emr31309855ad.44.1753602126981; 
 Sun, 27 Jul 2025 00:42:06 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe53b546sm29633055ad.177.2025.07.27.00.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 00:42:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-10.2 v9 0/6] target/arm: Add FEAT_MEC to max cpu
Date: Sat, 26 Jul 2025 21:41:56 -1000
Message-ID: <20250727074202.83141-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Changes for v9:
  - Set bits in arm_hcrx_el2_eff has bits whose effective value
    is 1 when EL2 is disabled.
  - Include Pierrick's firmware updates.


r~


Gustavo Romero (4):
  target/arm: Implement FEAT_SCTLR2 and enable with -cpu max
  target/arm: Implement FEAT_TCR2 and enable with -cpu max
  target/arm: Implement FEAT_MEC registers
  target/arm: Enable FEAT_MEC in -cpu max

Pierrick Bouvier (2):
  tests/functional/test_aarch64_device_passthrough: update image
  tests/functional/test_aarch64_rme: update image

 target/arm/cpu-features.h                     |  15 +
 target/arm/cpu.h                              |  27 ++
 target/arm/internals.h                        |  23 ++
 target/arm/cpu.c                              |   9 +
 target/arm/helper.c                           | 274 +++++++++++++++++-
 target/arm/tcg/cpu64.c                        |   7 +-
 docs/system/arm/emulation.rst                 |   5 +
 .../test_aarch64_device_passthrough.py        |  27 +-
 tests/functional/test_aarch64_rme_sbsaref.py  |  64 ++--
 tests/functional/test_aarch64_rme_virt.py     |  85 ++----
 10 files changed, 432 insertions(+), 104 deletions(-)

-- 
2.43.0


