Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954773lfg;
        Tue, 9 Mar 2021 08:20:44 -0800 (PST)
X-Received: by 2002:a9d:70c9:: with SMTP id w9mr11109867otj.62.1615306843954;
        Tue, 09 Mar 2021 08:20:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306843; cv=none;
        d=google.com; s=arc-20160816;
        b=HwqfGmtrxg3lv0kN/qs4tUnmooyU6kYYQNFedt69OfBqmOE2V5sMR7ZAlpC6NsV0Yf
         5YnKAdSdKULdxBpjMNgIuMXSCiLuIm4cdRpsSJA3LUnMw6CeTe8cF+u/NKpXliadbgjx
         lSZbCvRGZjvsfDCBmoLWNx7Spr16dhySzNb4uDCYHmXKQYMJ9AS8bPyj12EJXHVMGU91
         TkgQ/0TQ8duotFAbUWkGi7WYE3Z6hKysUoy03xy6+j3usEgbLv5vgABCUIuRaeue05pZ
         OOPUD1+A3pqntBcWWQFN+nVuvviVZf1JZ2LAbzRZhZwHAbsZ0Bp1SL8LGr4cynL3/vFv
         giTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=lnwWrhEneEUUM+YHpqRK/Z28UUqQlE1sLsUPEdpUHzc=;
        b=EAbJxjWDpSqDxt6G3iWOarqcRZvhK5Z1dfNxOjdQNLqb9tIqamOKFnzLPa+s6Ftgsa
         27rls3CuHnbq6r3LAUh8/Wch5BqX6IDaTlWj/bDuJLCclQ/2Jm1WOC1W4WBHBs6fLY1u
         h2BvIpKKMAlADtlpeq5UhTMTupm5E0/gZPsVM+4oBc72oRqPAg0WYmVlvSQNcYSbgbeg
         7yQtqQic5iFiX62HZ5j3JBa1cmshNpaL27LUQpJ+2Y9mVpqUbAzNLjbuY9uN1LaRFNsa
         9rqr+es44/FVp4PHJ0VORjR2Xds7CO2T1G5Lt72iptnZkL6RFX4NgsXvI13NZwRglu8z
         EMVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYZveROC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o14sor4047293oiw.145.2021.03.09.08.20.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYZveROC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lnwWrhEneEUUM+YHpqRK/Z28UUqQlE1sLsUPEdpUHzc=;
        b=NYZveROCj4x3Zd0gjPRlffBCQz8wWsgl91wH9n6geQZR42+2Brl9Uy5I2LWYivlF4b
         IwJabAq8PaUPm8WuIaYw5t+yW1KfCvWhQFlQcLxpcwOOhl/aPSvuHbABSdN3Geq6ApZ8
         CArAeCQbQJ8ilxQzyfIJy52x/uSrjBn42OTS84SMNuaZhc0UyR+tyJ0BdKU3nwnCwzkE
         8pPMPqz4742ZRtdh9HGmo8JKfZ7DMi+9mmu94agpPSzSNDYVb8MznAAVm03oNRMY81yy
         rhLlnDqwDv+Yt65dMszaU6SLnkD5ibdjIdZ8CObSlgBAeFKFbHq58Ksvoh1qMtWY/iJP
         gpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lnwWrhEneEUUM+YHpqRK/Z28UUqQlE1sLsUPEdpUHzc=;
        b=aVCaZX9ev0qM19loxSt3/wawegiIWOzgamp6o2wsZKynlyIU/t1a67rS2pqNw6gN27
         5YOBX1qT/xncaoz/Hma3M8AURUo+IQ0gMG0oe3EXkdRVocXxrCQlNsqIYqiqTSCmCtPG
         IlnCf+VJn8XqVLSZI9645iz31IcyOGCurto1W+ZA9vqc4YbaZsTBw8TUYrxR8SutPm4f
         h3zyZyTy69k/DiV3nr3bxoyhM4y4jnIg7Tqidv7kykh7Ocj0zuRsDu1Xp9qr6jH7jTpV
         AxFrn1MpwKlEMH1CfJciXmPv8nfpucghw/6CPfXTlE66jX37HSL1QnvuxrTY8mUf30iF
         4n6g==
X-Gm-Message-State: AOAM531fSVl08iKeInyWNI+8qK/FthHlukysxVa/u8kAwFW9ufCi8Dmr
	UpIgoAJVsN8AQ4gtAxkwwvAgtk0XV4zitFr7I7g=
X-Google-Smtp-Source: ABdhPJzJxOFUD4BMJ2dE+GdZWvJuj6HIkkm3BhL09NgN39JdjWqOkpiOVg7B5selxuzBSo9huyOwBA==
X-Received: by 2002:aca:b544:: with SMTP id e65mr3510183oif.78.1615306843476;
        Tue, 09 Mar 2021 08:20:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 00/78] target/arm: Implement SVE2
Date: Tue,  9 Mar 2021 08:19:23 -0800
Message-Id: <20210309162041.23124-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: k4EyZzMJpgix

After a 6-month hiatus, sve2 is back.  This time, with RISU
testing vs FVP 11.13.36.

Based-on: 20210309155305.11301-1-richard.henderson@linaro.org
("target/arm: sve1 fixes")


r~


Richard Henderson (60):
  target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
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
  target/arm: Implement SVE2 saturating multiply-add high
  target/arm: Implement SVE2 integer multiply-add long
  target/arm: Implement SVE2 complex integer multiply-add
  target/arm: Implement SVE2 XAR
  target/arm: Pass separate addend to {U,S}DOT helpers
  target/arm: Pass separate addend to FCMLA helpers
  target/arm: Split out formats for 2 vectors + 1 index
  target/arm: Split out formats for 3 vectors + 1 index
  target/arm: Implement SVE2 integer multiply (indexed)
  target/arm: Implement SVE2 integer multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply-add high (indexed)
  target/arm: Implement SVE2 saturating multiply-add (indexed)
  target/arm: Implement SVE2 integer multiply long (indexed)
  target/arm: Implement SVE2 saturating multiply (indexed)
  target/arm: Implement SVE2 signed saturating doubling multiply high
  target/arm: Implement SVE2 saturating multiply high (indexed)
  target/arm: Implement SVE2 multiply-add long (indexed)
  target/arm: Implement SVE2 complex integer multiply-add (indexed)
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  target/arm: Share table of sve load functions
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN
  target/arm: Implement SVE2 complex integer dot product
  target/arm: Enable SVE2 and some extensions

Stephen Long (18):
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
  target/arm: Implement SVE2 FLOGB
  target/arm: Implement SVE2 bitwise shift immediate
  target/arm: Implement SVE2 fp multiply-add long

 target/arm/cpu.h                |   56 +
 target/arm/helper-sve.h         |  722 ++++++-
 target/arm/helper.h             |  104 +-
 target/arm/translate-a64.h      |    3 +
 target/arm/vec_internal.h       |  143 ++
 target/arm/sve.decode           |  568 +++++-
 target/arm/cpu64.c              |   11 +
 target/arm/helper.c             |    3 +-
 target/arm/kvm64.c              |   11 +
 target/arm/neon_helper.c        |  507 +----
 target/arm/sve_helper.c         | 2123 ++++++++++++++++++++-
 target/arm/translate-a64.c      |   68 +-
 target/arm/translate-sve.c      | 3157 +++++++++++++++++++++++++++++--
 target/arm/vec_helper.c         |  777 +++++++-
 target/arm/translate-neon.c.inc |   20 +-
 15 files changed, 7425 insertions(+), 848 deletions(-)

-- 
2.25.1
