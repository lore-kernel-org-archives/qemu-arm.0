Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q12sm2780447wrg.37.2018.02.23.07.36.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:36:36 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7C2A13E0085;
	Fri, 23 Feb 2018 15:36:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 00/31] Add ARMv8.2 half-precision functions
Date: Fri, 23 Feb 2018 15:36:05 +0000
Message-Id: <20180223153636.29809-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UvGOKWRYUDwk

Now that the softfloat re-factoring has been merged I re-based this
directly from master. Alternatively you can grab the full tree from:

  https://github.com/stsquad/qemu/tree/arm-fp16-v3

I've tested with the following RISU test binaries:

  http://people.linaro.org/~alex.bennee/testcases/arm64.risu/testcases.armv8.2_hp.tar.xz

Which now includes insn_FP1SRC.risu.bin which tests the final patch in
the series which wasn't being exercised by my previous set of tests.

I've dropped the fp16 patch to both avoid the bikesheding but also
because I could achieve the same effect by running RISU with:

  -cpu cortex-a57

The changes are all relatively minor based on feedback. The details
are as usual included in the commit messages bellow ---.

Alex Bennée (31):
  include/exec/helper-head.h: support f16 in helper calls
  target/arm/cpu64: introduce ARM_V8_FP16 feature bit
  target/arm/cpu.h: update comment for half-precision values
  target/arm/cpu.h: add additional float_status flags
  target/arm/helper: pass explicit fpst to set_rmode
  arm/translate-a64: implement half-precision F(MIN|MAX)(V|NMV)
  arm/translate-a64: handle_3same_64 comment fix
  arm/translate-a64: initial decode for simd_three_reg_same_fp16
  arm/translate-a64: add FP16 FADD/FABD/FSUB/FMUL/FDIV to
    simd_three_reg_same_fp16
  arm/translate-a64: add FP16 F[A]C[EQ/GE/GT] to
    simd_three_reg_same_fp16
  arm/translate-a64: add FP16 FMULA/X/S to simd_three_reg_same_fp16
  arm/translate-a64: add FP16 FR[ECP/SQRT]S to simd_three_reg_same_fp16
  arm/translate-a64: add FP16 pairwise ops simd_three_reg_same_fp16
  arm/translate-a64: add FP16 FMULX/MLS/FMLA to simd_indexed
  arm/translate-a64: add FP16 x2 ops for simd_indexed
  arm/translate-a64: initial decode for simd_two_reg_misc_fp16
  arm/translate-a64: add FP16 FPRINTx to simd_two_reg_misc_fp16
  arm/translate-a64: add FCVTxx to simd_two_reg_misc_fp16
  arm/translate-a64: add FP16 FCMxx (zero) to simd_two_reg_misc_fp16
  arm/translate-a64: add FP16 SCVTF/UCVFT to simd_two_reg_misc_fp16
  arm/translate-a64: add FP16 FNEG/FABS to simd_two_reg_misc_fp16
  arm/helper.c: re-factor recpe and add recepe_f16
  arm/translate-a64: add FP16 FRECPE
  arm/translate-a64: add FP16 FRCPX to simd_two_reg_misc_fp16
  arm/translate-a64: add FP16 FSQRT to simd_two_reg_misc_fp16
  arm/helper.c: re-factor rsqrte and add rsqrte_f16
  arm/translate-a64: add FP16 FRSQRTE to simd_two_reg_misc_fp16
  arm/translate-a64: add FP16 FMOV to simd_mod_imm
  arm/translate-a64: add all FP16 ops in simd_scalar_pairwise
  arm/translate-a64: implement simd_scalar_three_reg_same_fp16
  arm/translate-a64: add all single op FP16 to handle_fp_1src_half

 include/exec/helper-head.h |    3 +
 include/fpu/softfloat.h    |   16 +-
 target/arm/cpu.h           |   34 +-
 target/arm/cpu64.c         |    1 +
 target/arm/helper-a64.c    |  269 ++++++++++
 target/arm/helper-a64.h    |   33 ++
 target/arm/helper.c        |  479 +++++++++--------
 target/arm/helper.h        |   14 +-
 target/arm/translate-a64.c | 1261 +++++++++++++++++++++++++++++++++++++-------
 target/arm/translate.c     |   12 +-
 10 files changed, 1695 insertions(+), 427 deletions(-)

-- 
2.15.1
