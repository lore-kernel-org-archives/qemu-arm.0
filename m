Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5DECD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OC-000084-OA; Thu, 07 May 2026 19:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OB-00007M-Bz
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:19 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8O9-0000yP-En
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:19 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-45f053b7b90so858988b6e.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197455; x=1778802255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GFqY0zRt34eX9S7a/lXWXkkOa23/FWSFelAt+6WDK/g=;
 b=Uu4M1mV5a5yv+GrUiGGTPYyWofma/PTfp2VxsIYfgT8ckBYVAm79d35rEfAuhFLPwE
 aH2V5a1gISh2IkhTjEx8X7cBTnP5ygbyShll6CfXEdRp6g03fkJmv8gbT6uS6P0Eii6c
 qVK6JCBpyn+0n8KNC+9D/A9MOeHrWJyRCA5fJFIl9Y7IZkwCI40Lope5SlN3BjWQAP8V
 zcWCXB35eO80Cn0/xc93irED0A830Uif53b3IQy+73uyvd7+tZbg0OekA80Fjuah0ITA
 UNrIEjWdIlRnWSN2JLUXsN+Cgf6wbTQKroNZmD0yIAxkVzYwASevSq4j8MKNuDHxDDJD
 J+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197456; x=1778802256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFqY0zRt34eX9S7a/lXWXkkOa23/FWSFelAt+6WDK/g=;
 b=a+fW1879GcyF8L0KP5kwk8olG2v7CGUsAmOHu6b6Fn7cqG8XYe9NavCV8K8V0sqZt8
 jyyaRpRZDzyQ1W731QSsgjkztDFRhHmXZhqViP1Uc8YOw0Pux9la5kcgTkRZZVMqlUPG
 yhFkp+oGecJnhXtTW9mPQxNIv3yVxfPVJnS8UPUNbpiKuiWq9zFZgvbNEPUJCQFscLtU
 ddHRe94V9j3UKkHU8ACV7L7twFA5f4vjpbGAWvWuH0AlHPGhrUVwgGBAlB16+tpaLaD5
 suMLjDyWXaRV70sK8ixpbQt3tkCyzOpAM3/E4ROLqC3BrPayqsWghe7xOS5AXjJ6SvfW
 u98Q==
X-Gm-Message-State: AOJu0YzvuX6aT9nENxw3dplZ1qgE6AH88HNuKd75huFRim2hEpGAXn0A
 5GXCtIc8wZUOW4+MUAFSGx5fzyII3ZrswgSLdSpmhmVdHL3NoOWOzJHdmYDQ8fOCW1/ub6scXxZ
 lMHqA
X-Gm-Gg: AeBDiesAudLammgoU373QiFwO9aDIvKmczt7HvkXMdCETsNkmN/TNwtwcExBpuvK509
 ONXCz0Kky8EloaMgnpbX3FHqHJCi0MeSo9YezDO3mTff/c0H7EM4n7dAMV8aa3D7mHYffVGE0F2
 p4leY4goRoU0t0Y8HNkI7CaO7AHxdIGaTdECLyg/DgJy4mhwxRZ71VuoP2OE77tWh8Nr1BPEkB+
 G1rjjde/oJN+FWjKWWthTtQ6sZQI4P+SCdr0T2b2BPDq6uY3Y/DLiCFlKnPc4kLiGcs8iEDe8v6
 z+41fklchk2C3Ca8TjA4Rs0Z2QSVcCg9tkcqFROGo9UBbdtTdV/Xkm89T5YOwxf1Vmb9Hk4d5en
 UoZR72X0LfBDnntmCea6Gu752tHvmcbzYv8odlYfH2Aw1h1VcwflZ4BzzyhQuZ5VN+FWHOmlA6p
 NxrutoBdCzwb41faTJFWDqfHuMQaNV8HUSRff0WZkQLYcipA==
X-Received: by 2002:a05:6808:1822:b0:463:faa3:8dda with SMTP id
 5614622812f47-480421f80d0mr6238706b6e.13.1778197455519; 
 Thu, 07 May 2026 16:44:15 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 00/60] target/arm: Implement FEAT_FP8
Date: Thu,  7 May 2026 18:43:13 -0500
Message-ID: <20260507234413.643512-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

Based-on: 20260507160959.449170-1-richard.henderson@linaro.org
("[PATCH v3 00/11] fpu: Export some internals for targets")

Changes for v4:
  - TF-A firmware update for FEAT_FPMR
  - Rewrite decode/encode of FP8 data types
  - Rewrite FEAT_FP8FMA helpers
  - Enable FEAT_FP8DOT{4,2}
  - Enable FEAT_FP8F{32,16}MM

This completes the set of 8-bit floating point features.


r~


Pierrick Bouvier (1):
  tests/functional/aarch64/rme: update images to support FEAT_FP8

Richard Henderson (59):
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

 target/arm/cpregs.h                          |   5 +
 target/arm/cpu-features.h                    | 137 +++
 target/arm/cpu.h                             |  52 +-
 target/arm/helper-fp8.h                      |  14 +
 target/arm/internals.h                       |  13 +-
 target/arm/tcg/helper-a64-defs.h             |  11 +
 target/arm/tcg/helper-defs.h                 |   6 +
 target/arm/tcg/helper-fp8-defs.h             |  40 +
 target/arm/tcg/helper-sme-defs.h             |   2 +-
 target/arm/tcg/helper-sve-defs.h             |  14 +
 target/arm/tcg/translate-a64.h               |   1 +
 target/arm/tcg/translate.h                   |  10 +
 target/arm/tcg/vec_internal.h                |  19 +
 target/arm/vector-type.h                     |  44 +
 target/arm/helper.c                          |  43 +-
 target/arm/machine.c                         |  20 +
 target/arm/tcg/cpu64.c                       |  24 +
 target/arm/tcg/fp8_helper.c                  | 867 +++++++++++++++++++
 target/arm/tcg/hflags.c                      |  41 +
 target/arm/tcg/sme_helper.c                  |   8 +-
 target/arm/tcg/sve_helper.c                  |   8 +
 target/arm/tcg/translate-a64.c               | 186 ++++
 target/arm/tcg/translate-sme.c               | 109 ++-
 target/arm/tcg/translate-sve.c               | 235 +++++
 target/arm/tcg/vec_helper.c                  |  66 ++
 target/arm/tcg/vec_helper64.c                |  51 ++
 docs/system/arm/emulation.rst                |  13 +
 target/arm/cpu-sysregs.h.inc                 |   2 +
 target/arm/tcg/a64.decode                    |  47 +
 target/arm/tcg/meson.build                   |   1 +
 target/arm/tcg/sme.decode                    |  36 +-
 target/arm/tcg/sve.decode                    |  50 +-
 tests/functional/aarch64/test_rme_sbsaref.py |   7 +-
 tests/functional/aarch64/test_rme_virt.py    |   7 +-
 34 files changed, 2124 insertions(+), 65 deletions(-)
 create mode 100644 target/arm/helper-fp8.h
 create mode 100644 target/arm/tcg/helper-fp8-defs.h
 create mode 100644 target/arm/vector-type.h
 create mode 100644 target/arm/tcg/fp8_helper.c

-- 
2.43.0


