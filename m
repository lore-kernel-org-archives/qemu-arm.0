Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC73CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:34:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlYi-0006ga-Fz; Wed, 20 May 2026 14:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYg-0006fA-FK
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYe-0000S2-Il
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:18 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-c8028fa6039so3663216a12.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301335; x=1779906135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FC9L63i8Cy+jtWE1SxbFJsKNJzppTWiXB4ZNmWjpdZI=;
 b=ul/m/F5XSlFP4MMqVrfEeC2T6VxbOO+KpowiLxP6xQCEeA1NbfbKTmcXZCBdAjFA2D
 iF/1mMFtUzAgHF6svxTCGglPG1JmMSLH4npAIYs7OxvYbDwrZEIgRFfuNJh2/9XjxXQx
 FzWpxJAB9XnEGpYRALBHnoomkFjrWTW+Zal4xhh/UWCpUQjUP4ec/FixuESwr85LDOkT
 VyZGjXSo70o3cTU8Rli5Bj4jXaMpJpZjg+RJ/DhcyfchB22fHqN29TtFdzka9RSUfCj4
 zRTt/KXbdugNZRyVMsPhoQ0OOhuq4eIc+vmXZjDg+0fZKYtjG+xiiE4aNP5wPWDzuBQk
 6APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301335; x=1779906135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FC9L63i8Cy+jtWE1SxbFJsKNJzppTWiXB4ZNmWjpdZI=;
 b=rAhk+Ylvf+OnjzXGOfq7GyGBh0o2KHyQBp0Zm5aIPZvDE+apcI3qaSpLo41CBhhtX2
 5rcojhgLau+zMaa8s3bQOaeD1FGu3/j5P+0tHnax+o/bqGE8584/VUnWzXWPFlJMURTG
 X4pxxCK0sxvqeR2LVw0emMVurY4HYP76BG18L9goz6xArSWDI8qOKfe//zuOhNyyfXrd
 pV123+nrcFxkjyJ7J4DIm+JDzXTFZiTg2cixRMA1xMHc2DVNXeRGJPfcaP1ECIUM5TON
 Lkt+ZYPV71nrFNf6UR3pPBM2eQpEZGL+H+I8d0r3rO1zLV+NtlpkbNqXC0+mZWyAo9VW
 foWQ==
X-Gm-Message-State: AOJu0YxrcOBKf3/oBDzGLhiX6zcjO8ZJzd6reBPVtFKSfVagPyw8NNug
 yJPeEWAVk5+6Af8QuGQXfqYE8SQsqmiTJoZU2OTTSz+VcdWvSbVCTagXvhqhVueBFv8=
X-Gm-Gg: Acq92OFO9Ix4HHdS/K9e/CUHlhryw+qlZjt3LH4AimavNJHdpCesRCGMb7DjrMxBh0r
 kNyoqv99hRdjXUKgfqAkXU8UEftLFOf5HJFTduuuWp19V9mGdJt/1Bh4unsItmWhzKZTkVXYJ2g
 fd/Y0EIkahd05u0dtvWkyjQgYwGBrRFOAufNbpx0YaT8z006UhLk97smGwfjotmZwoUuwxIj/JY
 zsjwse0DZH/V4ckMfSM01XC0/tYjMtvU/HcnzvGf8UE34a7Kld3Pl79YyYvC2ynzP7aQwujiZPu
 zS5V51r6kCIEMhESfpgX9IGHyXh9om6wobrJ6B81qxf+gg+ub1RFghIP+qdOtWg94g0r4BFmOjW
 zfldOwlXqQwe0ErUYevOz48C/aJ9pOA08KAezK1pAn1DGUahyt5IDD2S4o1R4fe5qF0nfZu7V+/
 kfafBrb286+3AmyVh8RCLZ/LgCOcIA/jaMUC2BGWI=
X-Received: by 2002:a17:90b:260b:b0:35f:b987:4dac with SMTP id
 98e67ed59e1d1-369519f3559mr27748773a91.12.1779301334591; 
 Wed, 20 May 2026 11:22:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 00/64] target/arm: Implement FEAT_FP8
Date: Wed, 20 May 2026 11:21:09 -0700
Message-ID: <20260520182213.872945-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Based-on: 20260520171820.848839-1-richard.henderson@linaro.org
("[PATCH v5 00/30] fpu: Export some internals for targets")

Changes for v6:
  - Fixes for review comments.


r~


Pierrick Bouvier (1):
  tests/functional/aarch64/rme: update images to support FEAT_FP8

Richard Henderson (63):
  target/arm: Implement ID_AA64ISAR3
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
  target/arm: Dump FPMR when present
  target/arm: Enable FEAT_FPMR for -cpu max
  target/arm: Implement ID_AA64FPFR0
  target/arm: Add isar_feature_aa64_f8cvt
  target/arm: Implement FSCALE for AdvSIMD
  target/arm: Implement FSCALE for SME
  target/arm: Split vector-type.h from cpu.h
  target/arm: Move vectors_overlap to vec_internal.h
  target/arm: Set e4m3_nan_is_snan
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
 linux-user/aarch64/elfload.c                 |  14 +
 linux-user/aarch64/signal.c                  |  44 +-
 target/arm/cpu.c                             |   6 +-
 target/arm/helper.c                          |  43 +-
 target/arm/machine.c                         |  20 +
 target/arm/tcg/cpu64.c                       |  24 +
 target/arm/tcg/fp8_helper.c                  | 859 +++++++++++++++++++
 target/arm/tcg/hflags.c                      |  41 +
 target/arm/tcg/sme_helper.c                  |   8 +-
 target/arm/tcg/sve_helper.c                  |   8 +
 target/arm/tcg/translate-a64.c               | 186 ++++
 target/arm/tcg/translate-sme.c               | 109 ++-
 target/arm/tcg/translate-sve.c               | 235 +++++
 target/arm/tcg/vec_helper.c                  |  66 ++
 target/arm/tcg/vec_helper64.c                |  53 ++
 target/arm/tcg/vfp_helper.c                  |   2 +
 docs/system/arm/emulation.rst                |  13 +
 target/arm/cpu-sysregs.h.inc                 |   2 +
 target/arm/tcg/a64.decode                    |  47 +
 target/arm/tcg/meson.build                   |   1 +
 target/arm/tcg/sme.decode                    |  36 +-
 target/arm/tcg/sve.decode                    |  50 +-
 tests/functional/aarch64/test_rme_sbsaref.py |   7 +-
 tests/functional/aarch64/test_rme_virt.py    |   7 +-
 38 files changed, 2183 insertions(+), 67 deletions(-)
 create mode 100644 target/arm/helper-fp8.h
 create mode 100644 target/arm/tcg/helper-fp8-defs.h
 create mode 100644 target/arm/vector-type.h
 create mode 100644 target/arm/tcg/fp8_helper.c

-- 
2.43.0


