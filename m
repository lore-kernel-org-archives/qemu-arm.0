Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A94AFF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:40:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGziq-0006uH-QX; Sun, 26 Apr 2026 09:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziX-0006iQ-Ni
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:14 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziV-0008DG-DC
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c76c067bc51so3579500a12.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210808; x=1777815608; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FXTxN+J9no8re62AJqbCq+vPW8iZVDA6DVJLTKCpZGc=;
 b=MLUopAK+BGPrqHaPsR3ptKHIXE4wS7ydSdaQ0NwAveONKmGEbxuDWE3Dq4qO3sw99j
 Rwh4Doiyaljh4WKUVuHyF4Vjo/kwKwQyC0NwtxPYdwK53zJAsUPDDZJl94xp0ZLV5ItA
 UQWy07J85QEMsviuuDTYGde7E8DkXKzdPhCCuSE0Pa2Zg74gQkngnG8/BeVVoMi8o1Ln
 tVTwAz5d/ItdqoTEGkUXZpiwptskSbcCMZVDGnWbzwFdRxlRYqBqLBjShQoaHRzATYmf
 pAt5HVAd3aFMQTvNCeFk1IVNXkIr0okU8dOTc+eIN/xBkG8Bfj3YUSsXz/R2UOurGRr/
 ZyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210808; x=1777815608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXTxN+J9no8re62AJqbCq+vPW8iZVDA6DVJLTKCpZGc=;
 b=rlqtneIHpneMwpetBHcpuYpx0JSjCXPYlqmIrKQkjqqbDyo3cmFuDe4oI+EjKUkkMm
 Mj7hbMFKCAK4cHxPsf/BTVDTNL/NrY4+/1DKVKptWcmi6bVDXeaU7S3hkXx1KDhidWSw
 F7MtJsNuFzLTB0HtI3RNSpsxz79+QMasRR6c7V1dVd/zZITVRNX5ThgCuioANr0Z5VHJ
 yXEasaQ5ePkJtrYIV9jqkmRPy+BCUN1OkGSuElT5vWCg2/ITKf+5C5c9XbxU0k9cOyRc
 sZaApOxZvrskyr1jK1Dv2/Gt5Jf5A9IB2iqMBjM5QZEO+uiEN1Nz52u4L8ypyw9EdPza
 1wKw==
X-Gm-Message-State: AOJu0Yx/aWumB4McOjoWFYp1QPkjIbY2jSCVX9hugjDSt6YE2wdrLSjT
 +lJR+fHRP/LVF12bpHmAnJjRmaL+AdYR6tARSavkU5XQR4cAI/FkdNFpdjD/fgEUad+HmCHT0xM
 xvNXzX2w=
X-Gm-Gg: AeBDietQXuh94ao0ngcYed14toyH7o+kMjLg+br2XcuWedVJ56U0BJXg2ilC62eJW6f
 EHH0DCSr2X28zRXijqCgLTkuJfOPp5YrgNsPNesLxbUr9e1up5JxVnJscKfip/9n/3Wjj1c+WeK
 vCPD6fqWFH/4jOqAoQeijwflsJFhoAwQgE0b+iRliL4fbjg5iOvqBPHLO4dHC5n50F9Xc9JvqVp
 hz8ZPswpm/+w/xopIbL+zLJgs7NZvWr4PI4y/QQ6FS99dNiVrmeF74zpfjTp1Oy2zPZH633E4Ke
 FfQoENQMpRNvbRyOKHhnyDv2ixsAOBxIMbr+TrgitO6Pf7eKXbmJ/S1Chq3q2Ul3vcXW0PzdBer
 AZP6komG4J0tArP5T1nf8rWuTgzblFmWO4f6RKFSxanKeSryvcXAq1KOE4qKNcASVVweWyw2io7
 OArAW2QCTOyE0x61DlY5phiuxWsFg+PigDTAL7v0Sw
X-Received: by 2002:a17:902:f545:b0:2b4:61cc:37a8 with SMTP id
 d9443c01a7336-2b5f9eceb9amr429362575ad.17.1777210808276; 
 Sun, 26 Apr 2026 06:40:08 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [RFC PATCH 00/84] fpu: Export some internals for targets
Date: Sun, 26 Apr 2026 23:38:37 +1000
Message-ID: <20260426134002.865628-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Expose enough softfloat infrastructure so that we can move the
s390_divide_to_integer code back into target/s390x/, and to
perform the Arm FPDotAdd operation without using either float64
intermediates and round-to-odd.

The motivation is the Arm FP8DotAdd operation, which has up to
8 multiplies, 9 additions, and 1 scaling operation before rounding.

Rather than export the code as-is, with functions that sometimes
(but not always) return a pointer to one of the inputs, and may
or may not modify one or all of them as scratch space, return a
new structure instead.

This turns out to improve code as well, because we compile with
-ftrivial-auto-var-init=zero.  A pattern such as

    FloatParts t;
    foo(&t, ...);

will zero t before calling foo, whereas

    FloatParts t = foo(...);

will not.

I have not converted everything, only enough to do the testing
of the target/ patches at the end.  Comments?


r~


Richard Henderson (84):
  fpu: Drop parts_canonicalize
  fpu: Drop parts_uncanon
  fpu: Drop parts_uncanon_normal
  fpu: Drop parts_default_nan
  fpu: Drop parts_silence_nan
  fpu: Drop parts_return_nan
  fpu: Drop parts_pick_nan
  fpu: Drop parts_pick_nan_muladd
  fpu: Reverse the order of softfloat-parts* inclusions
  fpu: Drop parts_{add,sub}_normal
  fpu: Drop parts_addsub
  fpu: Drop parts_mul
  fpu: Drop parts_muladd_scalbn
  fpu: Drop parts_div
  fpu: Drop parts_modrem
  fpu: Drop parts_sqrt
  fpu: Drop parts_round_to_int_normal
  fpu: Drop parts_round_to_int
  fpu: Drop parts_float_to_sint
  fpu: Drop parts_float_to_uint
  fpu: Drop parts_float_to_sint_modulo
  fpu: Drop parts_sint_to_float
  fpu: Drop parts_uint_to_float
  fpu: Drop parts_minmax
  fpu: Drop parts_compare
  fpu: Drop parts_scalbn
  fpu: Drop parts_log2
  fpu: Drop parts_float_to_float
  fpu: Drop PARTS_GENERIC_64_128{_256}
  fpu: Drop FRAC_GENERIC_64_128{_256}
  fpu: Constify frac{64,128,256}_* inputs
  fpu: Return structure from unpack_raw64
  fpu: Return struct from float4_e2m1_unpack_canonical
  fpu: Return struct from float8_e4m3_unpack_canonical
  fpu: Return struct from float8_e5m2_unpack_canonical
  fpu: Inline float16_unpack_raw into callers
  fpu: Return struct from float16a_unpack_canonical
  fpu: Return struct from float16_unpack_canonical
  fpu: Inline bfloat16_unpack_raw into callers
  fpu: Return struct from bfloat16_unpack_canonical
  fpu: Inline float32_unpack_raw into callers
  fpu: Inline float64_unpack_raw into callers
  fpu: Return struct from float{32,64}_unpack_canonical
  fpu: Inline floatx80_unpack_raw into only caller
  fpu: Return struct from float128_unpack_raw
  fpu: Return struct from float128_unpack_canonical
  fpu: Change parts_float_to_float_narrow to parts128_to_parts64
  fpu: Change parts_float_to_float_widen to parts64_to_parts128
  fpu: Inline float8_e4m3_pack_raw to single caller
  fpu: Inline float8_e5m2_pack_raw into single caller
  fpu: Inline float16_pack_raw into callers
  fpu: Inline bfloat16_pack_raw into callers
  fpu: Inline float32_pack_raw into callers
  fpu: Inline float64_pack_raw into callers
  fpu: Mark unpack_raw64 QEMU_ALWAYS_INLINE
  fpu: Mark pack_raw64 QEMU_ALWAYS_INLINE
  fpu: Split FloatParts{64,128} to softfloat-parts.h
  fpu: Export FloatFmt structures
  fpu: Export unpack_canonical and round_pack_canonical routines
  fpu: Return struct from parts{64,128}_default_nan
  fpu: Return struct from parts{64,128}_silence_nan
  fpu: Return struct from parts{64,128}_return_nan
  fpu: Sink exp_bias adjustment in float64r32_pack_raw
  fpu: Return struct from parts{64,128}_pick_nan
  fpu: Return struct from parts{64,128}_div
  fpu: Return struct from parts{64,128}_round_to_int
  fpu: Use parts64_round_to_int in parts_s390_divide_to_integer
  fpu: Export default_nan and pick_nan routines
  fpu: Introduce parts64_round_canonical
  fpu: Export parts{64,128}_div
  fpu: Export parts{64,128}_round_to_int
  fpu: Return struct from parts{64,128}_pick_nan_muladd
  fpu: Introduce record_denormals_used
  fpu: Return struct from parts{64,128}_muladd_scalbn
  fpu: Drop QEMU_FLATTEN from muladd routines
  fpu: Export parts{64,128}_compare
  fpu: Return struct from parts{64,128}_mul
  fpu: Hoist nan check in partsN_addsub
  fpu: Return struct from parts{64,128}_addsub
  fpu: Simplify 0 +/- N case in parts_addsub
  target/s390x: Move float{32,64}_s390_divide_to_integer
  target/arm: Use FloatParts64 in bfdotadd_ebf
  target/arm: Drop oddstatus from is_ebf and bfdotadd_ebf
  target/arm: Use FloatParts64 in f16_dotadd

 include/fpu/softfloat-parts.h    |  223 ++++
 include/fpu/softfloat.h          |   11 -
 target/arm/tcg/vec_internal.h    |   12 +-
 fpu/softfloat.c                  | 2124 +++++++++++-------------------
 target/arm/tcg/sme_helper.c      |  102 +-
 target/arm/tcg/vec_helper.c      |  127 +-
 target/s390x/tcg/fpu_helper.c    |  135 ++
 fpu/softfloat-parts-addsub.c.inc |   22 +-
 fpu/softfloat-parts.c.inc        |  723 ++++------
 fpu/softfloat-specialize.c.inc   |   42 +-
 10 files changed, 1529 insertions(+), 1992 deletions(-)
 create mode 100644 include/fpu/softfloat-parts.h

-- 
2.43.0


