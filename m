Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1269363ejc;
        Sun, 5 May 2024 18:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/CKuVjLbVP0y7miv6haHRLWKB0tbTBOtddq4o+Fvp1FQSuQTVIROYvmUEM95xc2FIVVrM3+Hy9RC8vatp2DTJVLNdXuqL
X-Google-Smtp-Source: AGHT+IFuyzGnHrgultA7AfXdf8A3Wx8Tjz/AWWYrfspQEJ3mCPb50XoEstO3IT2mtfECq4FlvQ3M
X-Received: by 2002:ad4:5bcd:0:b0:6a0:b705:27ff with SMTP id t13-20020ad45bcd000000b006a0b70527ffmr10763287qvt.54.1714957473452;
        Sun, 05 May 2024 18:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957473; cv=none;
        d=google.com; s=arc-20160816;
        b=boBP8X9uLXQ6pgxozQV+zIEvIQZ2mzmFsB6/skOdeGxU/WlZfBSJByT8MO/VsAEd6x
         3TjV8eE+INpyfh9A28cyko2+ncM2liDtpjxXITaeUvdFGgMtqG/Luv8Cvei4FT4Pk1+V
         k5oGAUro1PcUb6aVayjYlxbmf/cvrz0WwZ+pKWhhmLiAEKRtqQo9pkoh5FjFHqcdFjKk
         AbwtGYYg+aFylpAEz6MRvVmBBSYJCHTjFDhjeKdUs9VTYMlW1iXKDaPTzHJXnzmRYyyI
         UxuawUpdtcRYwGaUqash0XPxsLf3JMEjo5F/vFIvIM3hmrJqgIY38qsuyS6fNoNcY021
         gx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xGhq9LzTfkszi3eC9eGpwYSHg3GUJVHkvKWRYudIa4w=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=sRHoWajtI3UgLeC4SGuvxebRBaPHQ0JH/MlDCUPlxySv0s5a4/yEukfqJKWJ9asTgz
         ybie/RMIlWHnNj9XYH9VMan6MY9zxXI3nx05N2Ku/Cysy8wxIWHiILdDoun8+JFYNHcu
         ztgWgYBjvrf4nBO16lyaLSe8upmPHg1INtl70g5Engm7ZlYyB1TpZf5PsaBR/ywEAXJ0
         61Q5yhz2VNsBk/TcnNm33OU2Xzu872yWXgXdULJ5vHFtfJWufLpLYSTwGJBBwsRFq/UF
         jBXNkVX0slSiAc8/QSUFFBgxxb2zdKC9vHvHtzsuYXVusYNTyfVy454PP/A37FTyUtjY
         GHeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LItZTQV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk16-20020a056214509000b006a0824a6602si8187475qvb.401.2024.05.05.18.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LItZTQV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mm9-0007b1-Kw; Sun, 05 May 2024 21:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mm6-0007a3-FH
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:14 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mm0-0002PB-5r
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:12 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ecddf96313so11579305ad.2
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957445; x=1715562245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xGhq9LzTfkszi3eC9eGpwYSHg3GUJVHkvKWRYudIa4w=;
 b=LItZTQV0vdNqFFXK+X3xzRokJFcGyzfqVfeGnCHtd5I9OjkOZRZSjTWgnLQ2zw4Hwz
 mHLHomdNeW/kOt7jMpGfcB1Jx4+2elhLTZryoY8PyMgRCK/I2NX/Kxaxuuw0Oi/T1XWX
 11pJAqlpZ4z8+ayNF9wbFVb9lXqPgzWVCi6qu73RJzab7NaH+8QU4fxNDk6IqeEvUPX6
 OYhp56Hyx2AE5PUUvNQqph6RoBl4yW3UyDA8NgLMpdhoymGs4rw/BkyMc0e8LtDg9WO/
 m0ilEYcn+zmrWmvm79Gmeq1bhw0s4/9LSodKONLPMPSz+FN7rDr0iTTP1FPw98aLUSfT
 P1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957445; x=1715562245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGhq9LzTfkszi3eC9eGpwYSHg3GUJVHkvKWRYudIa4w=;
 b=Nxf+3IbqDssM+uNJc9x6flXLUmL08Glsz1IqF1SV2sBI20jjr4mXsGsb/2QDPQ1vzZ
 fV9i5Kt5qMMQb9+U8O+XoOeH1BqUvG7Zt22Rhb7K0hKQ1ISvlKsGCSEPpJiQbxEyg7u5
 KgSLw6VP7LyBh8kWZ0G/9PdrWyrKq/kILDTkjsdlMQ6Iv9tZUWpfFDRl2g6YkM7moFbO
 4ksD0uLYy0pdvbx8HaMI0giOvnVvq205sLHRKMcouX8V8GvwZYFYSvoctx8MR4Ks1QwI
 n9PkHI98wtK7cO9F9shhkZGa659PkzBk7/QDqWdtd1lVT+FC7nu92l2T117QKaT1/hpY
 E0dQ==
X-Gm-Message-State: AOJu0YwZcR3jC4bFusf4Up5RpytVvciFXCE9COOhTC0hVrIL2m19SwMy
 WuvQAUzECXHO+0AbKNvh9o/eQUirDRwwon846+rYM7FhX6/lBrF3gx/2p3iyQSUt/2uySTT7XMo
 J
X-Received: by 2002:a17:90a:f597:b0:2b3:79ad:856d with SMTP id
 ct23-20020a17090af59700b002b379ad856dmr7764929pjb.48.1714957445381; 
 Sun, 05 May 2024 18:04:05 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/57] target/arm: Convert a64 advsimd to decodetree (part 1)
Date: Sun,  5 May 2024 18:03:06 -0700
Message-Id: <20240506010403.6204-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: KUkTTvJ1gtP9

Based-on: 20240424170908.759043-1-richard.henderson@linaro.org
("[PATCH 0/5] tcg: Misc improvements")

In the process, convert more code to gvec as well -- I will need
the gvec code for implementing SME2.  I guess this is about 1/3
of the job done, but there's no reason to wait until the patch
set is completely unwieldy.


r~


Richard Henderson (57):
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

 target/arm/helper.h             |  164 +-
 target/arm/tcg/helper-a64.h     |   12 +
 target/arm/tcg/translate-a64.h  |   18 +
 target/arm/tcg/translate.h      |   95 +
 target/arm/tcg/a64.decode       |  416 +++-
 target/arm/tcg/neon-dp.decode   |   37 +-
 target/arm/tcg/gengvec.c        | 2308 +++++++++++++++++
 target/arm/tcg/gengvec64.c      |  367 +++
 target/arm/tcg/neon_helper.c    |  511 +---
 target/arm/tcg/translate-a64.c  | 4080 ++++++++++---------------------
 target/arm/tcg/translate-neon.c |  254 +-
 target/arm/tcg/translate-sve.c  |  145 +-
 target/arm/tcg/translate-vfp.c  |   54 +-
 target/arm/tcg/translate.c      | 1588 ------------
 target/arm/tcg/vec_helper.c     |  349 ++-
 target/arm/vfp_helper.c         |   30 -
 target/arm/tcg/meson.build      |    2 +
 17 files changed, 5121 insertions(+), 5309 deletions(-)
 create mode 100644 target/arm/tcg/gengvec.c
 create mode 100644 target/arm/tcg/gengvec64.c

-- 
2.34.1

