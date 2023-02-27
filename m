Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299388ejc;
        Sun, 26 Feb 2023 21:47:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+6ylgC7KFj/eiWnYDMeVCc9LJQGv726GMmrEvFnzaaqQMHF7OpdEcb9ddkRYWXksA67D9I
X-Received: by 2002:ac8:5b8a:0:b0:3bf:daae:7f24 with SMTP id a10-20020ac85b8a000000b003bfdaae7f24mr2755362qta.34.1677476841672;
        Sun, 26 Feb 2023 21:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476841; cv=none;
        d=google.com; s=arc-20160816;
        b=ajjbHiUPkRE81+ax6eRpD4VDybI+6/HvwVdQL5/MnKg47iIz9RMxcrSlN87m/4ocwa
         MHk1FkBSJ8uL6qJs3yxPdv3bwR9HHV+WwfisL9zf90LN+JbfH2zpYCEW+0TF2ht7Eg3m
         n9OqNOjAx+HEpiVxkzWPObffn+WhUbn5Pf7ccTggrPivav/WlF14bWtKMX3AZqGVD554
         +JNEh1Tznu7ghoc2nQCsmfJG6aks20oQ+ugeorKEIgqsjVX8oz7FQGWPNycS1n5cXkdp
         stSMEqFVMe0t0uuYxxsT9b33+XTgTBinjWWkePt0ixV9ljsyxEmdpHcIwfW7TylLQ4hT
         8gGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=aSdSZoXanzTgHiZ8WDnCFrnwnqhaD0exhElRW6JfOMo=;
        b=LBJYGEYU2VTz5Pc0fQDPShP9HTJMVzSbctRMsc8UP1M4L/UYFeB386J/xpDk8gTYDC
         pTWDUd5LaA053a/DlmnEIuybIvAP9ucs7ZGaSetxdC2hRZ+k+Y1roIcK1nWAxAz/Njm5
         5VPfzxoMWWbh6rdQEit1+WWPjzf/R89a222qhy4/ABYqm5c6uY6HTWQkgoFlNgVu0CxQ
         /2AuGA5F13rrumu9fPjN34bfXS0MnUowTkhfLHQ0bDcqFsGBUpQl8+zMhJMrIUsNE2my
         GMKJQ4SJLNzUOr69/kXfL3dO31LTj6gsVSEMW7oZAXp7j040KNpmNvO63+ls6vf9KRIt
         np2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QytBWJr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f42-20020a05622a1a2a00b003ba10333b13si6386996qtb.523.2023.02.26.21.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QytBWJr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWHk-0001as-8c; Mon, 27 Feb 2023 00:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHh-0001Pi-LA
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:42:49 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHd-0004jK-TK
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:42:49 -0500
Received: by mail-pj1-x1043.google.com with SMTP id c23so4876305pjo.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aSdSZoXanzTgHiZ8WDnCFrnwnqhaD0exhElRW6JfOMo=;
 b=QytBWJr0549HbrLCw3qW6jVOSfk6pOovCPBzscu6Hf22i+skwzOIUXbDGzpD09uqtn
 PEEcY9xEkDLMmZVOKq9XgRV8u/NxnJur8xBI+bcgcet012d2VA0H6L4vco0j2BoZlkEj
 1saXzas+h0grkNXR391THlFYqhTpvU44sxkbwxUwlP6XyD7l+g68rAH/q85T8lRXOwI2
 eS9dX2oWDFmbmTX6V54XhNgTHjEa/e+PjiMt+OzYgoJsoYap2o3YokSZCKOWCgBqdxGE
 yPMaC9EyteYb59FRVQA4f6qvbMIcpa3wqAHOIiiyRdfswdFs+u305V+qDO8rjE69Ei3r
 SlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aSdSZoXanzTgHiZ8WDnCFrnwnqhaD0exhElRW6JfOMo=;
 b=uTbVhKJXvpUh8pNPFaLfHC7YeWMqxUgL8XEwt1oEGFKuLYQDivao6JqkuwFCDPxMA2
 JmY0DXfEgtiJaI7B4mNG8LRYWRPxKXuO3ferloOWzHS8q+YFp8y05/Zl1PIDuqbupK8Z
 lFswjloqZbdHQV347SxgsVm/TEU5bbSF/tshCRwSImMQJGQRx3IE5SRPV9Y/etxproJD
 iCODd/WJpqV1H+1JIZ/U9fF+u1N9LQccG3qeDZfHLvLZ6B4lgahXaqwp/9pKSI4G0hAU
 eWvzHvKHNCLDAK/zFAYDWfvHfEqB1VUCJ02qCMU5HqlArqlNZsZzJTh9zrtMvBOBaiix
 zkxg==
X-Gm-Message-State: AO0yUKWXGK692ccfGnt3CG955J+mkjuMebt3csRvwfGIz7T83rPsh3ib
 tWz2Uml2sSdqN6hZGSXv5l5ybw==
X-Received: by 2002:a05:6a21:329e:b0:b8:a17c:75e4 with SMTP id
 yt30-20020a056a21329e00b000b8a17c75e4mr30276055pzb.48.1677476564139; 
 Sun, 26 Feb 2023 21:42:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 00/70] tcg: Remove tcg_const_*
Date: Sun, 26 Feb 2023 19:41:23 -1000
Message-Id: <20230227054233.390271-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +xS7aDTT+bFF

This completes the transition from tcg_const_* to
tcg_constant_* that started in 2020.

This isn't hard, but non-mechanical.  One must identify when the
variable is used only for the constant, or if it is also written
as a general purpose temporary.  For the most part, breaking this
apart makes the code easier to understand.

Based-on: 20230227052505.352889-1-richard.henderson@linaro.org
("[PATCH v2 00/76] tcg: Drop tcg_temp_free from translators")

which I've just realized is actualy based on v4 not v3 of

Message-Id: 20230227053701.368744-1-richard.henderson@linaro.org
("[PATCH v4 00/31] tcg: Simplify temporary usage")

so for avoidance of doubt:

https://gitlab.com/rth7680/qemu/-/tree/tcg-const (c44933e0)


r~


Richard Henderson (70):
  target/arm: Use rmode >= 0 for need_rmode
  target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
  target/arm: Improve arm_rmode_to_sf
  target/arm: Consistently use ARMFPRounding during translation
  target/arm: Create gen_set_rmode, gen_restore_rmode
  target/arm: Improve trans_BFCI
  target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
  target/arm: Avoid tcg_const_* in translate-mve.c
  target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
  target/arm: Avoid tcg_const_ptr in handle_vec_simd_sqshrn
  target/arm: Avoid tcg_const_ptr in handle_rev
  target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
  target/avr: Avoid use of tcg_const_i32 throughout
  target/cris: Avoid use of tcg_const_i32 throughout
  target/hexagon: Use tcg_constant_* for gen_constant_from_imm
  target/hexagon/idef-parser: Use gen_tmp for LPCFG
  target/hexagon/idef-parser: Use gen_tmp for gen_pred_assign
  target/hexagon/idef-parser: Use gen_tmp for gen_rvalue_pred
  target/hexagon/idef-parser: Use gen_constant for
    gen_extend_tcg_width_op
  target/hppa: Avoid tcg_const_i64 in trans_fid_f
  target/hppa: Avoid use of tcg_const_i32 throughout
  target/i386: Simplify POPF
  target/i386: Avoid use of tcg_const_* throughout
  target/m68k: Reject immediate as destination in gen_ea_mode
  target/m68k: Use tcg_constant_i32 in gen_ea_mode
  target/m68k: Avoid tcg_const_i32 when modified
  target/m68k: Avoid tcg_const_i32 in bfop_reg
  target/m68k: Avoid tcg_const_* throughout
  target/microblaze: Avoid tcg_const_* throughout
  target/mips: Split out gen_lxl
  target/mips: Split out gen_lxr
  target/mips: Avoid tcg_const_tl in gen_r6_ld
  target/mips: Avoid tcg_const_* throughout
  target/ppc: Split out gen_vx_vmul10
  target/ppc: Avoid tcg_const_i64 in do_vector_shift_quad
  target/ppc: Avoid tcg_const_i64 in do_vcntmb
  target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
  target/ppc: Avoid tcg_const_* in xxeval
  target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
  target/ppc: Avoid tcg_const_* in fp-impl.c.inc
  target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
  target/ppc: Rewrite trans_ADDG6S
  target/ppc: Fix gen_tlbsx_booke206
  target/ppc: Avoid tcg_const_* in translate.c
  target/riscv: Avoid tcg_const_*
  target/rx: Use tcg_gen_abs_i32
  target/rx: Use cpu_psw_z as temp in flags computation
  target/rx: Avoid tcg_const_i32 when new temp needed
  target/rx: Avoid tcg_const_i32
  target/s390x: Split out gen_ri2
  target/s390x: Avoid tcg_const_i64
  target/sh4: Avoid tcg_const_i32 for TAS.B
  target/sh4: Avoid tcg_const_i32
  tcg/sparc: Avoid tcg_const_tl in gen_edge
  target/sparc: Avoid tcg_const_{tl,i32}
  target/tricore: Split t_n as constant from temp as variable
  target/tricore: Rename t_off10 and use tcg_constant_i32
  target/tricore: Use min/max for saturate
  target/tricore: Use setcondi instead of explicit allocation
  target/tricore: Drop some temp initialization
  target/tricore: Avoid tcg_const_i32
  target/xtensa: Tidy translate_bb
  target/xtensa: Tidy translate_clamps
  target/xtensa: Avoid tcg_const_i32 in translate_l32r
  target/xtensa: Use tcg_gen_subfi_i32 in translate_sll
  target/xtensa: Split constant in bit shift
  target/xtensa: Avoid tcg_const_i32
  tcg: Replace tcg_const_i64 in tcg-op.c
  tcg: Drop tcg_const_*_vec
  tcg: Drop tcg_const_*

 include/tcg/tcg-op.h                        |   4 -
 include/tcg/tcg.h                           |  10 -
 target/arm/internals.h                      |  12 +-
 target/arm/translate.h                      |  17 +
 target/hexagon/idef-parser/parser-helpers.h |   6 -
 target/arm/translate-a64.c                  | 168 +++----
 target/arm/translate-mve.c                  |  56 +--
 target/arm/translate-sve.c                  |  28 +-
 target/arm/translate-vfp.c                  |  26 +-
 target/arm/translate.c                      |  13 +-
 target/arm/vfp_helper.c                     |  35 +-
 target/avr/translate.c                      |  48 +-
 target/cris/translate.c                     |  46 +-
 target/hexagon/idef-parser/parser-helpers.c |  49 +-
 target/hppa/translate.c                     |  35 +-
 target/i386/tcg/translate.c                 | 138 +++---
 target/m68k/translate.c                     | 235 +++++-----
 target/microblaze/translate.c               |  35 +-
 target/mips/tcg/mxu_translate.c             |   4 +-
 target/mips/tcg/translate.c                 | 282 +++++-------
 target/mips/tcg/tx79_translate.c            |   4 +-
 target/ppc/translate.c                      | 148 +++---
 target/riscv/translate.c                    |   4 +-
 target/rx/translate.c                       |  84 ++--
 target/s390x/tcg/translate.c                |  43 +-
 target/sh4/translate.c                      |  35 +-
 target/sparc/translate.c                    |  94 ++--
 target/tricore/translate.c                  | 476 ++++++++++----------
 target/xtensa/translate.c                   |  50 +-
 tcg/tcg-op-vec.c                            |  34 +-
 tcg/tcg-op.c                                |  12 +-
 tcg/tcg.c                                   |  16 -
 target/cris/translate_v10.c.inc             |  26 +-
 target/mips/tcg/micromips_translate.c.inc   |   4 +-
 target/mips/tcg/nanomips_translate.c.inc    |  16 +-
 target/ppc/power8-pmu-regs.c.inc            |   4 +-
 target/ppc/translate/fixedpoint-impl.c.inc  |  44 +-
 target/ppc/translate/fp-impl.c.inc          |  26 +-
 target/ppc/translate/vmx-impl.c.inc         | 130 +++---
 target/ppc/translate/vsx-impl.c.inc         |  36 +-
 target/riscv/insn_trans/trans_rvv.c.inc     |   4 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc   |   2 +-
 tcg/i386/tcg-target.c.inc                   |   9 +-
 target/hexagon/idef-parser/idef-parser.y    |   2 +-
 44 files changed, 1158 insertions(+), 1392 deletions(-)

-- 
2.34.1

