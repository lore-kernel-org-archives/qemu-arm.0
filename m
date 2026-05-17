Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A99CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:30:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPOg-0007Cj-FZ; Sat, 16 May 2026 20:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOT-00073D-Jj
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:13 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOP-0004lv-Bu
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82fbdd60b64so876495b3a.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977803; x=1779582603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G4118SVqI4u6LKMHVp6Cyf85SwC6FwO7230ZJv9vMGY=;
 b=rG4hDeB6ObdHx+nDFRePtVB3mZIPuHQRb59XriOQYBD7B/KRVSiFQBFzs/lIana64m
 9r5eCoiNug0spJ4pTPxq0NA9ae+kcIBd61K80rySl2Ku3d/e7dKnPLPfePXUDNCyLeEf
 K/6gGNTAFL/8GHmIOsXnbdl1FxG+XdOqPM+DjPZTslyyM8CirMTVaBq0pa1sGx/xrZPg
 PHe5caEPFcNlEIr4WvCauzsTka4S4YQLO6V4UX0unnwak2IRYrau36lOPFVywfMEi2vu
 og2rcoD+AinZMXfN3unykSaZILAEKQcdReswcHMrymXuNvfFA74A4+5Zicc1bfeUrasJ
 eWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977803; x=1779582603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4118SVqI4u6LKMHVp6Cyf85SwC6FwO7230ZJv9vMGY=;
 b=RtbDjCPpSOgVYMiRKQp9vQHy76aOIPd4I0TCSPuzHqKcq+VPYyHeRZMyHHFDkLIxer
 wcL558diV9UokIxmXGj9U+AhdShkLVfx4lSD50Jg9cH7/WBb4XS3ShTXDPwlqhw1ydbK
 /Iw8dSczz3E5PUpcel3lABkfAWspXr2a8SxXwVmm8WB4CMgU3CzK6qbXNL31IhQl/z13
 Jib2WPC42Rdw1iisPDWVAAJdIws1s19/HLWi84MyWTj0lKZXzf11/gwRZjCbetgUIprb
 G5P35v+j4h0afge2mcv+w/RQNblvjKXj1P658DxrfzhuL5uxGVblT6MA/2PGBPLYlZbb
 4qOw==
X-Gm-Message-State: AOJu0YxHe2S0HEKiyCVxOdnRrG1qL7CLsSkHDGkbWruZJdSpCON6mzKD
 NuEPuv76MDzLDEREawUglX2AbkyBpj180YijYfq0FyAPHD4y/YQJ9PRvuMotWHpWlxL4IQcAnkl
 H0mcI
X-Gm-Gg: Acq92OHL4sbb67SCl+pdTHpq8RjbR4a/muHN3a2WAjdZxXrSTnYtQRn5xaiq3do6m6r
 W7iyA9kxqvPZsozounj1kBDw85yQnQCx0QqHMuupNA0Wjecud+FBg/ryHK/eE6bbGqqgkBuwpN3
 tYfg0AFiFWy4gTDk+VN6eLid5HDGQI0zplujW5dbN6GeA5UEnrefR7nvY9leMwvuJFxkJ+pwqM9
 uDx0eEEEwNRY85MnvnYcBdHh8ligG99iavaikaRw46/rv9mw4D3Ehg/8u/LgOrlwNICJsDyy7IY
 dCvPOU5u8zw5OW+SQsKMkBQLxqlfpDQjMoPCJnOMcCM6/zrIc5w/9qWFM7SiJJCma/lnmFOELeC
 gtTuyTXrJNz0v/e//MNV+APvamlKcBEL+0nZ2Up20S2AagQriuB6otn7WjSQkNCu9OxAS+dfLHo
 gtnc18hy+yp8rX3rHTRraBBXR/GgoK
X-Received: by 2002:a05:6a00:4b0b:b0:82f:390a:69c7 with SMTP id
 d2e1a72fcca58-83f33dd0695mr10497555b3a.33.1778977803252; 
 Sat, 16 May 2026 17:30:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 00/63] target/arm: Implement FEAT_FP8
Date: Sat, 16 May 2026 17:28:59 -0700
Message-ID: <20260517003002.321430-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Based-on: 20260517002550.321291-1-richard.henderson@linaro.org
("[PATCH v4 00/12] fpu: Export some internals for targets")

Changes for v5:
  - Fix faminmax vs nans
  - Fix fpmr.nscale vs fp16
  - Fix float exception writeback for multiplies.
  - Implement linux-user hwcap and signals per linux 7.1.


r~


Pierrick Bouvier (1):
  tests/functional/aarch64/rme: update images to support FEAT_FP8

Richard Henderson (62):
  target/arm: Implement ID_AA64ISAR3
  fpu: Export floatN_minmax
  target/arm: Implement FEAT_FAMINMAX for AdvSIMD
  target/arm: Implement FEAT_FAMINMAX for SME
  target/arm: Implement FEAT_FAMINMAX for SVE
  target/arm: Enable FEAT_FAMINMAX for -cpu max
  target/arm: Update SCR bits for Arm ARM M.a.a
  target/arm: Update HCRX bits for Arm ARM M.a.a
  target/arm: Introduce FPMR
  target/arm: Update SCTLR bits for FEAT_FPMR
  target/arm: Enable EnFPM bits for FEAT_FPMR
  target/arm: Clear FPMR on ResetSVEState
  target/arm: Add FPMR_EL to TBFLAGS
  target/arm: Trap direct acceses to FPMR
  target/arm: Enable FEAT_FPMR for -cpu max
  target/arm: Implement ID_AA64FPFR0
  target/arm: Add isar_feature_aa64_f8cvt
  target/arm: Implement FSCALE for AdvSIMD
  target/arm: Implement FSCALE for SME
  target/arm: Split vector-type.h from cpu.h
  target/arm: Move vectors_overlap to vec_internal.h
  target/arm: Implement BF1CVTL, BF1CVTL2, BF2CVTL, BF2CVTL2 for AdvSIMD
  target/arm: Implement BF1CVT, BF1CVTLT, BF2CVT, BF2CVTLT for SVE
  target/arm: Rename SME BFCVT patterns to BFCVT_hs
  target/arm: Implement BF1CVT, BF1CVTL, BF2CVT, BF2CVTL for SME
  target/arm: Implement F1CVTL, F1CVTL2, F2CVTL, F2CVTL2 for AdvSIMD
  target/arm: Implement F1CVT, F1CVTLT, F2CVT, F2CVTLT for SVE
  target/arm: Implement F1CVT, F1CVTL, F2CVT, F2CVTL for SME
  target/arm: Implement BFCVTN for SVE
  target/arm: Implement FCVTN (16- to 8-bit fp) for AdvSIMD
  target/arm: Implement FCVTN, FCVTN2 (32- to 8-bit fp) for AdvSIMD
  target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
  target/arm: Implement FCVTNB, FCVTNT for SVE
  target/arm: Implement FCVT (FP16 to FP8) for SME
  target/arm: Implement FCVT, FCVTN (FP32 to FP8) for SME
  target/arm: Implement LUTI2, LUTI4 for AdvSIMD
  target/arm: Implement LUTI2, LUTI4 for SVE
  target/arm: Enable FEAT_LUT for -cpu max
  target/arm: Enable FEAT_FP8 for -cpu max
  target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
  target/arm: Implement MOVT (vector to table)
  target/arm: Implement LUTI4 (four registers, 8-bit)
  target/arm: Enable FEAT_SME_LUTv2 for -cpu max
  target/arm: Implement FMLALB, FMLALT for AdvSIMD
  target/arm: Implement FMLALB, FMLALT (FP8 to FP16) for SVE
  target/arm: Implement FMLALL{BB,BT,TB,TT} for AdvSIMD
  target/arm: Implement FMLALL{BB,BT,TB,TT} for SVE
  target/arm: Enable FEAT_FP8FMA, FEAT_SSVE_FP8FMA for -cpu max
  target/arm: Implement FDOT (FP8 to FP32) for AdvSIMD
  target/arm: Implement FDOT (FP8 to FP32) for SVE
  target/arm: Enable FEAT_FP8DOT4, FEAT_SSVE_FP8DOT4 for -cpu max
  target/arm: Implement FDOT (FP8 to FP16) for AdvSIMD
  target/arm: Implement FDOT (FP8 to FP16) for SVE
  target/arm: Enable FEAT_FP8DOT2, FEAT_SSVE_FP8DOT2 for -cpu max
  target/arm: Implement FMMLA (FP8 to FP32) for AdvSIMD
  target/arm: Implement FMMLA (FP8 to FP32) for SVE
  target/arm: Enable FEAT_F8F32MM for -cpu max
  target/arm: Implement FMMLA (FP8 to FP16) for AdvSIMD
  target/arm: Implement FMMLA (FP8 to FP16) for SVE
  target/arm: Enable FEAT_F8F16MM for -cpu max
  linux-user/aarch64: Implement hwcap bits for fp8 features
  linux-user/aarch64: Implement FPMR signal frames

 include/fpu/softfloat.h                      |  93 +-
 target/arm/cpregs.h                          |   5 +
 target/arm/cpu-features.h                    | 137 +++
 target/arm/cpu.h                             |  52 +-
 target/arm/helper-fp8.h                      |  14 +
 target/arm/internals.h                       |  14 +-
 target/arm/tcg/helper-a64-defs.h             |  11 +
 target/arm/tcg/helper-defs.h                 |   6 +
 target/arm/tcg/helper-fp8-defs.h             |  40 +
 target/arm/tcg/helper-sme-defs.h             |   2 +-
 target/arm/tcg/helper-sve-defs.h             |  14 +
 target/arm/tcg/translate-a64.h               |   1 +
 target/arm/tcg/translate.h                   |  10 +
 target/arm/tcg/vec_internal.h                |  19 +
 target/arm/vector-type.h                     |  44 +
 fpu/softfloat.c                              |  50 +-
 linux-user/aarch64/elfload.c                 |  14 +
 linux-user/aarch64/signal.c                  |  44 +-
 target/arm/helper.c                          |  43 +-
 target/arm/machine.c                         |  20 +
 target/arm/tcg/cpu64.c                       |  24 +
 target/arm/tcg/fp8_helper.c                  | 877 +++++++++++++++++++
 target/arm/tcg/hflags.c                      |  41 +
 target/arm/tcg/sme_helper.c                  |   8 +-
 target/arm/tcg/sve_helper.c                  |   8 +
 target/arm/tcg/translate-a64.c               | 186 ++++
 target/arm/tcg/translate-sme.c               | 109 ++-
 target/arm/tcg/translate-sve.c               | 235 +++++
 target/arm/tcg/vec_helper.c                  |  66 ++
 target/arm/tcg/vec_helper64.c                |  50 ++
 docs/system/arm/emulation.rst                |  13 +
 fpu/softfloat-parts.c.inc                    |   8 +-
 target/arm/cpu-sysregs.h.inc                 |   2 +
 target/arm/tcg/a64.decode                    |  47 +
 target/arm/tcg/meson.build                   |   1 +
 target/arm/tcg/sme.decode                    |  36 +-
 target/arm/tcg/sve.decode                    |  50 +-
 tests/functional/aarch64/test_rme_sbsaref.py |   7 +-
 tests/functional/aarch64/test_rme_virt.py    |   7 +-
 39 files changed, 2253 insertions(+), 155 deletions(-)
 create mode 100644 target/arm/helper-fp8.h
 create mode 100644 target/arm/tcg/helper-fp8-defs.h
 create mode 100644 target/arm/vector-type.h
 create mode 100644 target/arm/tcg/fp8_helper.c

-- 
2.43.0


