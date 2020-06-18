Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1259039lfm;
        Wed, 17 Jun 2020 21:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0qhpFnA7N8OfeNh9k1e71VfSmMo5pQmP9yQ8nlExEIAvPNU7fWdXsReSQ/WJ4HPH+pZSy
X-Received: by 2002:a25:38c5:: with SMTP id f188mr3648405yba.332.1592454420405;
        Wed, 17 Jun 2020 21:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454420; cv=none;
        d=google.com; s=arc-20160816;
        b=hJuNJkZv3JxpkCjdSKwQmgPDpPno+zC4axVAC6X830CEOf66EBoIdZaQkiRVr2lwgc
         IFdL1A8Lpn967zaUAMLmy1cVrecRkZujAYqN6aQgEjEvThA4Q9AWfEF96tyvyeOAteNB
         53pCK8hwhrkzO208z9LuHR/GOPatSTZSDsh1MM2ZChNPa/yYb+5IiUEUOwzxDgI0Ftfn
         podZZiNkzq68pth+4pc2X+qsMUxqT5DSM6hpdrJYKWJS6FDbJxIa23QFtQ7BZKnMubGj
         7kgTMyhSgxbBcdwEuQKFwmZasT5oqu9ePSyDILyVkfYrt+fParYJsSjWYipVzK8Yco5M
         9ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=e/fEhOUzGdTnNfh8i2Z+asqAlqWKRehzb+Bm4f2AJnk=;
        b=Wys7dZ55d5YnnZC0876UeJbvepJh/N1ZBZOEYfpCvFSB/MyVi2eA3NhvgFE1pIWLQO
         CaS+bcyQuaj56uZzQvs5yghYLZ+fRlDFOfPSqi7vFUK6OGApIt8RV0cguPHYdUACdHMy
         RHctQW95LomPbo9EUCUiVYiXD6fYfNIJyqgWaPUekMe6C/Xb2emFuSVNJX6Sf1d/mhCZ
         YdlcZH/WL7esRRKrNKvAiq/x9q9zzqcFjiQj4kifWvjXSXETL3RbjZrwHk64A7a0UjXa
         nfOXJ7wpAJo/yhjYJltipVbE/sX+gwC38YWVi/dwOIEhrAtw5d4Ek27evtP1Rks9o7GN
         VEeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrGknGhy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p127si1402042ybc.191.2020.06.17.21.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrGknGhy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlm8h-0001bd-L5
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8Y-0001b5-6b
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8W-0002Ec-8D
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:49 -0400
Received: by mail-pf1-x431.google.com with SMTP id 10so2185824pfx.8
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/fEhOUzGdTnNfh8i2Z+asqAlqWKRehzb+Bm4f2AJnk=;
 b=DrGknGhyGI/q0rCEXwJLy+g4DHmdVvUnnCwZW+AF3eLt0LqpQczYtFV+e+5necMbdV
 cE4JuodeoDUr7y/kOcY+m/gFW/320f0bl3OvZ/JlUstze83TeVgXaTW9sZN3pgNNVTKa
 sjfvTVU2kZ+ri/0hkQL3YL/7q4BezXOYlT0KeVyDr0Qwqw7HOCKNAqhQjGjPO/ZGEqmt
 52TbZkCgcN0vmXRuDNuU2uo1La5VTwfHwDHuAe4kqO7vmdFrYhqjjSbkYr1oNEnuQ3rN
 032dzj2OyBMO+STB1SiRAG/+vbzFYEh7cOvSQuCubK+kQ62ZFb5rdKZfuw7Qk4U064tz
 vS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/fEhOUzGdTnNfh8i2Z+asqAlqWKRehzb+Bm4f2AJnk=;
 b=Q+VqDbiNfgPgnIa3zfJ5x8I87xykc6D9ulVQkGLzgKctY3/H/qzLXedDrKzhoioZn/
 FUer9D681uTVFxcqpvihKd82VjRcWdaNdZ7VYfickn1wRcRVMEGBXy/zm2TJHwtaj7e3
 6fgwNKkfQzQ+Kv2YxBlKQmCMfQ2J93u63/gJg1gOTwwfhDDhLpUnM+1Ei+vTFmZnDQRj
 utVDmm3KA+dlFMpU8hD9oRzq7cOoZrL99YF7763Fu03KwDoC2V976c4+Z//E2O7YExjD
 Um9I0Z0aANOyE3Z24uKga1veTFYS9gdpA5kp9kzW5JNjNk6tUhNPp3vwITePHzDUWrPI
 Y+IQ==
X-Gm-Message-State: AOAM5337awO4+nzvlVkh32CKxwRDQ6oyN7tAMFsscMoCSnYj4mC7XV54
 ghRWUFz62Av4//BdVzwoIyyC8g==
X-Received: by 2002:aa7:84cc:: with SMTP id x12mr1864545pfn.235.1592454406143; 
 Wed, 17 Jun 2020 21:26:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o16sm1162035pgg.57.2020.06.17.21.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:26:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 000/100] target/arm: Implement SVE2
Date: Wed, 17 Jun 2020 21:25:04 -0700
Message-Id: <20200618042644.1685561-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2OoRiGEs5CG+

I know this patch set is too big, and that there are parts that
can be split out that are prepatory rather that specifically sve2.

It's also not 100% tested.  I have done some amount of testing
vs ArmIE, but because of bugs and missing features therein, that
testing has been somewhat limited.  I understand a new version
of FVP has just been release containing SVE2 support, but I have
not yet tried that.

However, I believe this finally contains all of the instructions
in sve2 and its optional extensions.  Excluding BFloat16, since
that extension is supposed to implement AdvSIMD at the same time.


r~


Richard Henderson (81):
  tcg: Save/restore vecop_list around minmax fallback
  qemu/int128: Add int128_lshift
  target/arm: Split out gen_gvec_fn_zz
  target/arm: Split out gen_gvec_fn_zzz, do_zzz_fn
  target/arm: Rearrange {sve,fp}_check_access assert
  target/arm: Merge do_vector2_p into do_mov_p
  target/arm: Clean up 4-operand predicate expansion
  target/arm: Use tcg_gen_gvec_bitsel for trans_SEL_pppp
  target/arm: Split out gen_gvec_ool_zzzp
  target/arm: Merge helper_sve_clr_* and helper_sve_movz_*
  target/arm: Split out gen_gvec_ool_zzp
  target/arm: Split out gen_gvec_ool_zzz
  target/arm: Split out gen_gvec_ool_zz
  target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
  target/arm: Enable SVE2 and some extensions
  target/arm: Implement SVE2 Integer Multiply - Unpredicated
  target/arm: Implement SVE2 integer pairwise add and accumulate long
  target/arm: Implement SVE2 integer unary operations (predicated)
  target/arm: Split out saturating/rounding shifts from neon
  target/arm: Implement SVE2 saturating/rounding bitwise shift left
    (predicated)
  target/arm: Implement SVE2 integer halving add/subtract (predicated)
  target/arm: Implement SVE2 integer pairwise arithmetic
  target/arm: Implement SVE2 saturating add/subtract (predicated)
  target/arm: Implement SVE2 integer add/subtract long
  target/arm: Implement SVE2 integer add/subtract interleaved long
  target/arm: Implement SVE2 integer add/subtract wide
  target/arm: Implement SVE2 integer multiply long
  target/arm: Implement PMULLB and PMULLT
  target/arm: Tidy SVE tszimm shift formats
  target/arm: Implement SVE2 bitwise shift left long
  target/arm: Implement SVE2 bitwise exclusive-or interleaved
  target/arm: Implement SVE2 bitwise permute
  target/arm: Implement SVE2 complex integer add
  target/arm: Implement SVE2 integer absolute difference and accumulate
    long
  target/arm: Implement SVE2 integer add/subtract long with carry
  target/arm: Implement SVE2 bitwise shift right and accumulate
  target/arm: Implement SVE2 bitwise shift and insert
  target/arm: Implement SVE2 integer absolute difference and accumulate
  target/arm: Implement SVE2 saturating extract narrow
  target/arm: Implement SVE2 SHRN, RSHRN
  target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
  target/arm: Implement SVE2 UQSHRN, UQRSHRN
  target/arm: Implement SVE2 SQSHRN, SQRSHRN
  target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI, WHILEHS
  target/arm: Implement SVE2 WHILERW, WHILEWR
  target/arm: Implement SVE2 bitwise ternary operations
  target/arm: Implement SVE2 saturating multiply-add long
  target/arm: Generalize inl_qrdmlah_* helper functions
  target/arm: Implement SVE2 saturating multiply-add high
  target/arm: Implement SVE2 integer multiply-add long
  target/arm: Implement SVE2 complex integer multiply-add
  target/arm: Implement SVE2 XAR
  target/arm: Fix sve_uzp_p vs odd vector lengths
  target/arm: Fix sve_zip_p vs odd vector lengths
  target/arm: Fix sve_punpk_p vs odd vector lengths
  target/arm: Pass separate addend to {U,S}DOT helpers
  target/arm: Pass separate addend to FCMLA helpers
  target/arm: Split out formats for 2 vectors + 1 index
  target/arm: Split out formats for 3 vectors + 1 index
  target/arm: Implement SVE2 integer multiply (indexed)
  target/arm: Use helper_gvec_mul_idx_* for aa64 advsimd
  target/arm: Implement SVE2 integer multiply-add (indexed)
  target/arm: Use helper_gvec_ml{a,s}_idx_* for aa64 advsimd
  target/arm: Implement SVE2 saturating multiply-add high (indexed)
  target/arm: Implement SVE2 saturating multiply-add (indexed)
  target/arm: Implement SVE2 integer multiply long (indexed)
  target/arm: Implement SVE2 saturating multiply (indexed)
  target/arm: Implement SVE2 signed saturating doubling multiply high
  target/arm: Use helper_neon_sq{,r}dmul_* for aa64 advsimd
  target/arm: Implement SVE2 saturating multiply high (indexed)
  target/arm: Implement SVE2 multiply-add long (indexed)
  target/arm: Implement SVE2 complex integer multiply-add (indexed)
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  tcg: Implement 256-bit dup for tcg_gen_gvec_dup_mem
  target/arm: Share table of sve load functions
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN

Stephen Long (19):
  target/arm: Implement SVE2 floating-point pairwise
  target/arm: Implement SVE2 MATCH, NMATCH
  target/arm: Implement SVE2 ADDHNB, ADDHNT
  target/arm: Implement SVE2 RADDHNB, RADDHNT
  target/arm: Implement SVE2 SUBHNB, SUBHNT
  target/arm: Implement SVE2 RSUBHNB, RSUBHNT
  target/arm: Implement SVE2 HISTCNT, HISTSEG
  target/arm: Implement SVE2 scatter store insns
  target/arm: Implement SVE2 gather load insns
  target/arm: Implement SVE2 FMMLA
  target/arm: Implement SVE2 SPLICE, EXT
  target/arm: Implement SVE2 TBL, TBX
  target/arm: Implement SVE2 FCVTNT
  target/arm: Implement SVE2 FCVTLT
  target/arm: Implement SVE2 FCVTXNT, FCVTX
  softfloat: Add float16_is_normal
  target/arm: Implement SVE2 FLOGB
  target/arm: Implement SVE2 bitwise shift immediate
  target/arm: Implement SVE2 fp multiply-add long

 include/fpu/softfloat.h         |    5 +
 include/qemu/int128.h           |   16 +
 target/arm/cpu.h                |   56 +
 target/arm/helper-sve.h         |  717 ++++++-
 target/arm/helper.h             |  132 +-
 target/arm/translate-a64.h      |    3 +
 target/arm/translate.h          |    1 +
 target/arm/vec_internal.h       |  143 ++
 target/arm/sve.decode           |  594 +++++-
 target/arm/cpu64.c              |   11 +
 target/arm/helper.c             |    3 +-
 target/arm/kvm64.c              |   11 +
 target/arm/neon_helper.c        |  507 +----
 target/arm/sve_helper.c         | 2123 +++++++++++++++++--
 target/arm/translate-a64.c      |  177 +-
 target/arm/translate-neon.inc.c |   20 +-
 target/arm/translate-sve.c      | 3364 ++++++++++++++++++++++++++++---
 target/arm/vec_helper.c         |  942 +++++++--
 tcg/tcg-op-gvec.c               |   52 +-
 tcg/tcg-op-vec.c                |    2 +
 20 files changed, 7698 insertions(+), 1181 deletions(-)

-- 
2.25.1

