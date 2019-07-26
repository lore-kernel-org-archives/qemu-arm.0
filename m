Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206642wrv;
        Fri, 26 Jul 2019 10:50:34 -0700 (PDT)
X-Received: by 2002:a17:902:1003:: with SMTP id b3mr38008723pla.172.1564163434845;
        Fri, 26 Jul 2019 10:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163434; cv=none;
        d=google.com; s=arc-20160816;
        b=XNR8ymZ9Rf4pAL2iXbuRetqeJao/z16WNnCLOlm5BH0feddeD4v1Kzw42HYRCyhXjK
         uSFLeJh51rfGrbGsHaNt5ugnANii/TRWUPmohP30Ag0BXZFrQGoMiDLqLaUDSA7uf9n2
         NUk9sjV0vmMg6mepPaCpYJLQC78n5Wg9pdHjpuBKkWMcaxSOCu75zNlgBa7KVquPahj6
         4jnTWU4/OClMcT+IAQDgKoInEl1uxKspZbFqB8SxEpmakBaJA2HkyO0fukYwK+M1e6WE
         0Qb10fTK17U1YGI0R5ulxGG+aZau5htyRkMXOiea5w2IoMCM++aqC4U8c7ttcHkBjDYr
         nfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=qFigwqxkZ9qhX2+b3zlDbnkq417ogpiBOSL/2AuGB2I=;
        b=m5bhuKnhHMAz5/h50sD/Ux+ntVQbOCBuvgb2B6G+PsBN9jZ5RfLfIXYaMR/2UbhNY0
         BbIBweYx4yYDhG+jcMSfdlrD79YhbK+TYulowtfX8JWKNi4izwWMSdReHUQQzPtilZop
         HxOZZOu680JpidnDSI2cP7jFCDnqAxDJyeTApgQ4OJg/wgW2TUFKUU3C/FgDldUi5civ
         CgerCNn5TfuCmj3Su6UcMfXZbcTAie8tt4Tiov0Ta6qBA6/7yWQo9LM28LXjyQvDRL2q
         KmeRelbOmxnlicEV/1pXS9q55i8GxpqS7wBssTQhHco4DdffSn4SUujrWI9TyKGGF/1C
         kUcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kt8tMQpv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l10sor33097923pgm.23.2019.07.26.10.50.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kt8tMQpv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qFigwqxkZ9qhX2+b3zlDbnkq417ogpiBOSL/2AuGB2I=;
        b=kt8tMQpvJp0uFngsozpYNhdh3fTIKNepILssaQNkoXQLS3q0KjkeYrssTOvCbaQMCE
         Hw1JnSbkjEV962kZEjM5rhc1C0XDfbUJT1zAP0F7iveSAzQgm/ClT5/xJikRnpbAFQCK
         iRzjhfcTJW2/zkNRHvaPdEUS+ge3oQcfIMq/ioTr+UGcW0fVVENDdN9eUOwJ29uso26X
         +fe5TwpvnvXVysPh9UMzdVIHsgioVjdFJ9KM+GDtXLVA0pB9XswmxqrOX3NnqlsrinOO
         aPbLX7BSZfyGu7VcVVV6WMrgNtWapPzB5PO5h0LHLhJkZpC3cTvGz9+zoRlIn4tzIPsp
         nIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qFigwqxkZ9qhX2+b3zlDbnkq417ogpiBOSL/2AuGB2I=;
        b=hwHcvSrMIl1vZfpxbmaHRKnV5Jf5C9JbrQlaYYAZySFubknD9SUcFD3c9P50Pe7STH
         OliO8zEgFrAZDW6jVs2LWX5KSyHVIXZSRjv3f3D2zED48WauxWadTVIzN/f7tRLBl4G6
         yvmefcaRmSyKsnKOIAA7SeuLqEqmOKMJPSzAGH3d7ZJptzO06G4s6gIaEjX7Qq7ARs0g
         PHCUv2AqUchskfK92JpWtcMBQvonsgnq9+ErNEWtDofaGz/22N9uF3I0v7zCMPmpiOiB
         8eavBGDCAyUXffmB5BVpjEK+6cebvbpv7cCHDbX2ROHCj/poTwwjG2FS8w4KnTNa8RHa
         vIGA==
X-Gm-Message-State: APjAAAV8DLf7Du8T5YyfXEoSAmTFUdapgfAkVZf+TP4J3u3MccqFE2VC
	nphfllt4L7WHAPzGM/uf8L/PiQcO8rWRXg==
X-Google-Smtp-Source: APXvYqyObypCgcQjsd1hBq+pm5P3Sg7v/dw9PGIDfKy5D6OTFroaNBaRa24r3v7ORNR6jrKDPl9EJA==
X-Received: by 2002:a65:5082:: with SMTP id r2mr66447352pgp.170.1564163434091;
        Fri, 26 Jul 2019 10:50:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 00/67] target/arm: Convert aa32 base isa to decodetree
Date: Fri, 26 Jul 2019 10:49:25 -0700
Message-Id: <20190726175032.6769-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-TUID: cwrTYjX0O3/h

This unifies the implementation of the actual instructions
for a32, t32, and t16.  In order to make this happen, we
need several preliminary cleanups.  Most importantly to how
we handle the architectural representation of PC.

I attempt to convert single groups of instructions at once,
as they are grouped in the sections of the encoding sections
of the manual.

This has been tested by running the debian 9 armhf installer,
which does a far amount of switching between arm and thumb modes.
I've also run Peter's ARM TFM image, and all of the existing
RISU tests that we have.  (Our RISU test cases are nowhere near
complete for 32-bit mode, but it did find 3 bugs, so not useless.)

What's left is converting NEON and iwmmxt, then we could start
merging some of the decoders and tidying the top-level interface
further.

We will need to convert NEON in order to have a good chance at
finishing the ARMv8.2-FHP extension.


r~


Richard Henderson (67):
  decodetree: Allow !function with no input bits
  target/arm: Remove offset argument to gen_exception_insn
  target/arm: Remove offset argument to gen_exception_bkpt_insn
  target/arm: Remove offset argument to gen_exception_internal_insn
  target/arm: Use the saved value of the insn address
  target/arm: Introduce pc_read
  target/arm: Introduce add_reg_for_lit
  target/arm: Use store_reg_from_load in thumb2 code
  target/arm: Fold a pc load into load_reg
  target/arm: Move test for AL into arm_skip_unless
  target/arm: Add stubs for aa32 decodetree
  target/arm: Introduce gen_illegal_op
  target/arm: Convert Data Processing (reg, reg-shifted-reg, imm)
  target/arm: Convert multiply and multiply accumulate
  target/arm: Convert Saturating addition and subtraction
  target/arm: Convert Halfword multiply and multiply accumulate
  target/arm: Convert MSR (immediate) and hints
  target/arm: Convert MRS/MSR (banked, register)
  target/arm: Convert Cyclic Redundancy Check
  target/arm: Convert the rest of A32 Miscelaneous instructions
  target/arm: Convert T32 ADDW/SUBW
  target/arm: Convert load/store (register, immediate, literal)
  target/arm: Convert Synchronization primitives
  target/arm: Convert USAD8, USADA8, SBFX, UBFX, BFC, BFI, UDF
  target/arm: Convert Parallel addition and subtraction
  target/arm: Convert Packing, unpacking, saturation, and reversal
  target/arm: Convert Signed multiply, signed and unsigned divide
  target/arm: Convert MOVW, MOVT
  target/arm: Convert LDM, STM
  target/arm: Convert B, BL, BLX (immediate)
  target/arm: Convert SVC
  target/arm: Convert RFE and SRS
  target/arm: Convert Clear-Exclusive, Barriers
  target/arm: Convert CPS (privileged)
  target/arm: Convert SETEND
  target/arm: Convert PLI, PLD, PLDW
  target/arm: Convert Unallocated memory hint
  target/arm: Convert Table Branch
  target/arm: Convert SG
  target/arm: Convert TT
  target/arm: Simplify disas_thumb2_insn
  target/arm: Simplify disas_arm_insn
  target/arm: Add skeleton for T16 decodetree
  target/arm: Convert T16 data-processing (two low regs)
  target/arm: Convert T16 load/store (register offset)
  target/arm: Convert T16 load/store (immediate offset)
  target/arm: Convert T16 add pc/sp (immediate)
  target/arm: Convert T16 load/store multiple
  target/arm: Convert T16 add/sub (3 low, 2 low and imm)
  target/arm: Convert T16 one low register and immediate
  target/arm: Convert T16 branch and exchange
  target/arm: Convert T16 add, compare, move (two high registers)
  target/arm: Convert T16 adjust sp (immediate)
  target/arm: Convert T16, extract
  target/arm: Convert T16, Change processor state
  target/arm: Convert T16, Reverse bytes
  target/arm: Convert T16, nop hints
  target/arm: Convert T16, push and pop
  target/arm: Convert T16, Conditional branches, Supervisor call
  target/arm: Convert T16, Miscellaneous 16-bit instructions
  target/arm: Convert T16, shift immediate
  target/arm: Convert T16, load (literal)
  target/arm: Convert T16, Unconditional branch
  target/arm: Convert T16, long branches
  target/arm: Clean up disas_thumb_insn
  target/arm: Move singlestep check from gen_jmp to gen_goto_tb
  target/arm: Merge gen_bx_im into trans_BLX_i

 target/arm/helper.h               |    1 -
 target/arm/translate.h            |   10 +
 target/arm/op_helper.c            |   15 -
 target/arm/translate-vfp.inc.c    |   41 +-
 target/arm/translate.c            | 7142 ++++++++++++-----------------
 scripts/decodetree.py             |    5 +-
 target/arm/Makefile.objs          |   24 +
 target/arm/a32-uncond.decode      |   74 +
 target/arm/a32.decode             |  534 +++
 target/arm/t16.decode             |  279 ++
 target/arm/t32.decode             |  629 +++
 tests/decode/succ_function.decode |    2 +
 12 files changed, 4559 insertions(+), 4197 deletions(-)
 create mode 100644 target/arm/a32-uncond.decode
 create mode 100644 target/arm/a32.decode
 create mode 100644 target/arm/t16.decode
 create mode 100644 target/arm/t32.decode
 create mode 100644 tests/decode/succ_function.decode

-- 
2.17.1
