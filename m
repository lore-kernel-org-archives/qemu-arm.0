Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1992901ejb;
        Fri, 24 May 2024 16:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlx8dLc1dwnWe0HJquztkFhDhPUC/6ZkyXry81kgZuVz+phIV1gLwtdhuwb15CI2vZwziVL4DLs6VCLPYy3x9lO4awz/YI
X-Google-Smtp-Source: AGHT+IF9DRBjLSrfrCVBvOS+q0TBWzLbtKkPTOS89Uo5lU2BoGlRSXi1k8XHh9spHqQgAzh8tu+Y
X-Received: by 2002:a05:620a:47f3:b0:790:fc5a:1ffd with SMTP id af79cd13be357-794ab122105mr348260185a.66.1716592934879;
        Fri, 24 May 2024 16:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716592934; cv=none;
        d=google.com; s=arc-20160816;
        b=zaAsJMJJB+WjvLK+GqLYZ46BCOMQ8dkBHlSbfJc4U2mzP3F6J4M8VCQP43yhWcVdyY
         bQ+CIUXubgOq3U0DSIotg+3+nAtJNd0cxM7NAnDh0tFEp+Ly/SLDHqPYgQEu5bJ7VZSA
         +lk5jBET+ZB49XKnV6MyWZ18FgosmDlhf/Nz3MCMiEJU+cZiTeotxtFaPbCFUvNgb6fb
         AUYJoTWFv9vj1Ujt/c8grEeL+SM6m42XFM0dNYMD42A6AJaTe12GdS0aDbslkBRFKhs2
         TUCxXbcgTqVkvHHgXfWP8NJixjC18vbaZblqcpcsidfZizjsxQhZkp2/xndhgdaEFX8Q
         9+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2LcFiYxvojtE00jlgpj+zwYErN2HEa0FOP7+cFTfU/s=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=d0dNVjPcyEXKAA7mNvEkI5OohdWf/EHxi/Pnjdmdsrd+g51FjnlV7KOFXi/UbmiCDT
         DHw+PGrmijY8c4mJ7uYWKtfcBMI4r5nIS0O6HFfBLDpXxEWkpF2xFgrKgx6jhRdC7qao
         cRAvQD6otofFO2N8WCPY+j10N86ZQsEJuIS/Bn6UHhKzxePpcmMHXFtQ9HUBlRh5sU1u
         rBn4JY5v9AoDmbDGiVyxTpqWDWdvqMugHK0TjasN5qEUfmXNdGitKOcoIz7mCCCLV53z
         Iqx94v5GeYQ7LHXEW2iGF+G5bWRc/eP6u8a/d47kHSJAE5PAFo4sKYW0F+LvkLm4TmWB
         NMtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JO4LwA4u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd607b9si295349885a.756.2024.05.24.16.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JO4LwA4u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAeE9-0006Qi-Ej; Fri, 24 May 2024 19:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE5-0006NN-Pm
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:21:29 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE0-0005dw-OA
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:21:29 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1f44b45d6abso12497085ad.0
 for <qemu-devel@nongnu.org>; Fri, 24 May 2024 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592883; x=1717197683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2LcFiYxvojtE00jlgpj+zwYErN2HEa0FOP7+cFTfU/s=;
 b=JO4LwA4uiw+u+iNQYFOWMwh4ubS1fAFnKb/o3cqHe6W2riHEmpFHrdNVttvuWo1Giu
 2TJSYjPJovUbQGwJ80QGlBagiGLERs+SN3VKuEmjt/ZTPcDGYjRD6E8hhOrTXvDfykba
 zVqlj3/XIyKKLLTGoT4XSXF7wJMnXkRTyEpzv/Qx0qSCDsJdYFM2ogh97bcYpssUFERr
 t/ESLhtRjvlfQaDQWSroxnmcM7nCE3F3i5769yawc8qrB/h2BMf/YAGvXKRXXno04JU7
 aU85NHZZxnUDW0obxnhEnQcRS02FNsyY6C8BSHIarecCHkO5nhJ+EmHHQBfUwxlFEXyO
 bwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592883; x=1717197683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2LcFiYxvojtE00jlgpj+zwYErN2HEa0FOP7+cFTfU/s=;
 b=oI/kV7PRq5iqJzkiMCVOXFb0j61nlK037X8Vr2nNaSCEeae6Co9cnXkTlGxh/IO0Ht
 yMcBjAhReAdvRUNLfrFTMf7WWO0maIfeVQTX6H5gJwHH7GlleYSqejdbfYEvIf05mnE9
 VAdKJvwMMjkTcOMi8UGe+NsSBRecdameBWEL1AEIlyzu7NVesc7WFs2Nx4UKCi+2LSDs
 4Xmd5bgzVEb3vd9djeoRA/pcC/+QQRepsqFjKL4PVgi5eDHn7FIITYj3sITmFhWfVFvZ
 7FHoVzG4nTvjq3SISLwl6yQOC97rYEyEABVr3kYpIz4C+bp7BRI+axpQYxLXqvq9YjzD
 vrvA==
X-Gm-Message-State: AOJu0YxYJPxxfhAo+l3EqFF3IZWqRPogKKuWHpiylce95p1ZRwbYIQKT
 +X15RThvxLRvjC2P2KMl6uTNbrTz5QBybq21vmAWxVquyy/ExqCbeTpcCgMWlpZLC75dOvO4+ot
 q
X-Received: by 2002:a17:902:d4c7:b0:1e2:9ddc:f72d with SMTP id
 d9443c01a7336-1f44870278dmr44672625ad.26.1716592882662; 
 Fri, 24 May 2024 16:21:22 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/67] target/arm: Convert a64 advsimd to decodetree (part
 1)
Date: Fri, 24 May 2024 16:20:14 -0700
Message-Id: <20240524232121.284515-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yJ/0pDQF2SAy

In the process, convert more code to gvec as well -- I will need
the gvec code for implementing SME2.  I guess this is about 1/3
of the job done, but there's no reason to wait until the patch
set is completely unwieldy.

Changes for v2:
  * Fix existing RISU failures vs neoverse-n1.
  * Introduce vfp_load_reg16, fixing a regression wrt VNEG (scalar, hp).
  * Fix typo in SUQADD vectorization.
  * Two more conversions.


r~


Richard Henderson (67):
  target/arm: Add neoverse-n1 to qemu-arm (DO NOT MERGE)
  target/arm: Use PLD, PLDW, PLI not NOP for t32
  target/arm: Reject incorrect operands to PLD, PLDW, PLI
  target/arm: Zero-extend writeback for fp16 FCVTZS (scalar, integer)
  target/arm: Fix decode of FMOV (hp) vs MOVI
  target/arm: Verify sz=0 for Advanced SIMD scalar pairwise (fp16)
  target/arm: Split out gengvec.c
  target/arm: Split out gengvec64.c
  target/arm: Convert Cryptographic AES to decodetree
  target/arm: Convert Cryptographic 3-register SHA to decodetree
  target/arm: Convert Cryptographic 2-register SHA to decodetree
  target/arm: Convert Cryptographic 3-register SHA512 to decodetree
  target/arm: Convert Cryptographic 2-register SHA512 to decodetree
  target/arm: Convert Cryptographic 4-register to decodetree
  target/arm: Convert Cryptographic 3-register, imm2 to decodetree
  target/arm: Convert XAR to decodetree
  target/arm: Convert Advanced SIMD copy to decodetree
  target/arm: Convert FMULX to decodetree
  target/arm: Convert FADD, FSUB, FDIV, FMUL to decodetree
  target/arm: Convert FMAX, FMIN, FMAXNM, FMINNM to decodetree
  target/arm: Introduce vfp_load_reg16
  target/arm: Expand vfp neg and abs inline
  target/arm: Convert FNMUL to decodetree
  target/arm: Convert FMLA, FMLS to decodetree
  target/arm: Convert FCMEQ, FCMGE, FCMGT, FACGE, FACGT to decodetree
  target/arm: Convert FABD to decodetree
  target/arm: Convert FRECPS, FRSQRTS to decodetree
  target/arm: Convert FADDP to decodetree
  target/arm: Convert FMAXP, FMINP, FMAXNMP, FMINNMP to decodetree
  target/arm: Use gvec for neon faddp, fmaxp, fminp
  target/arm: Convert ADDP to decodetree
  target/arm: Use gvec for neon padd
  target/arm: Convert SMAXP, SMINP, UMAXP, UMINP to decodetree
  target/arm: Use gvec for neon pmax, pmin
  target/arm: Convert FMLAL, FMLSL to decodetree
  target/arm: Convert disas_simd_3same_logic to decodetree
  target/arm: Improve vector UQADD, UQSUB, SQADD, SQSUB
  target/arm: Convert SUQADD and USQADD to gvec
  target/arm: Inline scalar SUQADD and USQADD
  target/arm: Inline scalar SQADD, UQADD, SQSUB, UQSUB
  target/arm: Convert SQADD, SQSUB, UQADD, UQSUB to decodetree
  target/arm: Convert SUQADD, USQADD to decodetree
  target/arm: Convert SSHL, USHL to decodetree
  target/arm: Convert SRSHL and URSHL (register) to gvec
  target/arm: Convert SRSHL, URSHL to decodetree
  target/arm: Convert SQSHL and UQSHL (register) to gvec
  target/arm: Convert SQSHL, UQSHL to decodetree
  target/arm: Convert SQRSHL and UQRSHL (register) to gvec
  target/arm: Convert SQRSHL, UQRSHL to decodetree
  target/arm: Convert ADD, SUB (vector) to decodetree
  target/arm: Convert CMGT, CMHI, CMGE, CMHS, CMTST, CMEQ to decodetree
  target/arm: Use TCG_COND_TSTNE in gen_cmtst_{i32,i64}
  target/arm: Use TCG_COND_TSTNE in gen_cmtst_vec
  target/arm: Convert SHADD, UHADD to gvec
  target/arm: Convert SHADD, UHADD to decodetree
  target/arm: Convert SHSUB, UHSUB to gvec
  target/arm: Convert SHSUB, UHSUB to decodetree
  target/arm: Convert SRHADD, URHADD to gvec
  target/arm: Convert SRHADD, URHADD to decodetree
  target/arm: Convert SMAX, SMIN, UMAX, UMIN to decodetree
  target/arm: Convert SABA, SABD, UABA, UABD to decodetree
  target/arm: Convert MUL, PMUL to decodetree
  target/arm: Convert MLA, MLS to decodetree
  target/arm: Tidy SQDMULH, SQRDMULH (vector)
  target/arm: Convert SQDMULH, SQRDMULH to decodetree
  target/arm: Convert FMADD, FMSUB, FNMADD, FNMSUB to decodetree
  target/arm: Convert FCSEL to decodetree

 target/arm/helper.h              |  164 +-
 target/arm/tcg/helper-a64.h      |   12 +
 target/arm/tcg/translate-a64.h   |   18 +
 target/arm/tcg/translate.h       |   95 +
 target/arm/tcg/a32-uncond.decode |    8 +-
 target/arm/tcg/a64.decode        |  430 ++-
 target/arm/tcg/neon-dp.decode    |   37 +-
 target/arm/tcg/t32.decode        |   26 +-
 target/arm/tcg/cpu32.c           |   73 +
 target/arm/tcg/gengvec.c         | 2306 ++++++++++++++++
 target/arm/tcg/gengvec64.c       |  367 +++
 target/arm/tcg/neon_helper.c     |  511 +---
 target/arm/tcg/translate-a64.c   | 4440 ++++++++++--------------------
 target/arm/tcg/translate-neon.c  |  254 +-
 target/arm/tcg/translate-sve.c   |  145 +-
 target/arm/tcg/translate-vfp.c   |   93 +-
 target/arm/tcg/translate.c       | 1649 +----------
 target/arm/tcg/vec_helper.c      |  349 ++-
 target/arm/vfp_helper.c          |   30 -
 target/arm/tcg/meson.build       |    2 +
 20 files changed, 5446 insertions(+), 5563 deletions(-)
 create mode 100644 target/arm/tcg/gengvec.c
 create mode 100644 target/arm/tcg/gengvec64.c

-- 
2.34.1

