Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544213ejb;
        Fri, 2 Jun 2023 19:34:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ78RF9Y8pRBC7Sgid4hYCmrTde2hBGrLP0R9TkecLIfHIy9D6+LgR4Ec1StSReMVz3f2ZSS
X-Received: by 2002:a05:620a:2a14:b0:75b:23a1:8e72 with SMTP id o20-20020a05620a2a1400b0075b23a18e72mr17894348qkp.67.1685759682478;
        Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759682; cv=none;
        d=google.com; s=arc-20160816;
        b=qIFVK/MCRwrtqu4OKFzcGjl47EBNfo1bRrgy5ctNTSgCvaHsCUUjEkuTWEFqDcAvwA
         cH/+5osTAYVp2GV19+jjBP5cMvQ16/hHJPq7E9phvGIqNeC9kvBeIL0iKzVfjPar3H40
         6hphWFna/8ScOLeK0n8lZZR6d+GHgyvD9sqVbMzfN/Z+GzeufFs5PcY9KMTDFjIJRg24
         XPCPtl3crpDNiiJx+VezdqfhifRRO1hFxEfoMsscQ5A+h0S77NHI2hM0QyGWO5MlfK2J
         5HE0DokTXOkcxqq2t72dw26apqeS6/BfIhp3s2e+142uUGkgAvbLdZh7zTz071KRKNMH
         OmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LNrixbLD1quRMNEgIizrIMayF2Yoe90LdRAg5aS0aAQ=;
        b=UJofrq47fMm1OOugQKfu7ah2LcCthxu67Ua/Sj7kVGX60lxnyTLQjo8cjlnuRojLyN
         alUaXlVhVlYVmls+Q5Upl1wdAdU38rPJiXoR0ognRoujKX1SOQ0FWmN6e2OdoxFKwk9Y
         nEzpX6ouu4SK1lyEzpZ7I3dnYXNhe1bMi6xzbSy5E60b0hq+nknV86zMc/xsVWEkxsdX
         rqG2YAQJwQrCmULgA6U9YQugbjLA7z8ejcjvIDUGNEUYlzJ7oe0I2HGfZuUFy5LVF/3r
         wiCcMDtboBTZMQsiEFrq9DoxW1gJweXRrSp4jh/r75AyfL5HJG85+8IApvF+RJ3FRAPe
         GhqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8JmZqCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020a05620a079100b00759554bbe31si1570634qka.82.2023.06.02.19.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8JmZqCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H69-0000IP-TS; Fri, 02 Jun 2023 22:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H68-0000HX-TY
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H65-0004ge-Lc
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2562cc85d3dso2200408a91.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759668; x=1688351668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LNrixbLD1quRMNEgIizrIMayF2Yoe90LdRAg5aS0aAQ=;
 b=C8JmZqCU7VLXmCWp4P20R365pD9D7yw1h6kHYO5gltWYWLbftAotZNkbIwOcYYfxrH
 4R/r0L8D0U7qDeprFiJ2R0Z4uooLhw3HYbLiwlV6e+zqEai2tgRoU4Wto/V1ZdCpcHb2
 9KVCHwdVp5oG973LE7zCbV2EU4hiIofgaeMJfrxlSYrcS+CXGh0B5QQBRwcwCRAvjv4g
 unTqtME3Ir0jditOSvurhvb+DSHys3UTDRzdfJgiYUKN2f5rQJCKssaHF7GBd9G6auVq
 pB8+UJgqx/6Fm9jPeTJdcY2jMp4hgEUvvRP35tlL1uQA/bsnw3MBkJqxrnaIdBvqisqt
 paBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759668; x=1688351668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LNrixbLD1quRMNEgIizrIMayF2Yoe90LdRAg5aS0aAQ=;
 b=JN2fXm6rPUGV1QyUXIKdD0AFjMVvKRMPAewuc/xxH6q6zZNkYNOzOFaY9IQp5/NuNi
 4c3yclOBxhvMyibv7Dhnu4uUFcNn+oLhVYGJ7bTdwnwULLxdvjxuXHcJRWgEL4FCnku1
 kNl+Rtzfacs4+0up+QoTUUBgyhRIEOfqUMMk1P/hFpgmhqn2r/xdpMDWCZdVOrpG5bLJ
 5RTOlIKFHzNG1mRgIfx7qTI5TiQxO8BQFMn0nETKJ4hRAFUOh4+zp377oNxopPRk8600
 kvRDEyA9qootjrMvZPP4yjuQtggdZvk4assw5dLasRj9A7tAiLviRQJZHM81lc3YuZay
 bnSg==
X-Gm-Message-State: AC+VfDwRLuHFuTv18E8bnJxI5j9SsF7wzRvsG7iVcjlVXctrvjs5sFy/
 8hJMiYnrjMBhEYXRnj88DVaUdA==
X-Received: by 2002:a17:90a:578a:b0:252:dd86:9c46 with SMTP id
 g10-20020a17090a578a00b00252dd869c46mr1690691pji.31.1685759667840; 
 Fri, 02 Jun 2023 19:34:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 00/35] crypto: Provide aes-round.h and host accel
Date: Fri,  2 Jun 2023 19:33:51 -0700
Message-Id: <20230603023426.1064431-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kJpDkuYRHa5H

Inspired by Ard Biesheuvel's RFC patches for accelerating AES
under emulation, provide a set of primitives that maps between
the guest and host fragments.

There is a small guest correctness test case.

I think the end result is quite a bit cleaner, since the logic
is now centralized, rather than spread across 4 different guests.

Further work could clean up crypto/aes.c itself to use these
instead of the tables directly.  I'm sure that's just an ultimate
fallback when an appropriate system library is not available, and
so not terribly important, but it could still significantly reduce
the amount of code we carry.

I would imagine structuring a polynomial multiplication header
in a similar way.  There are 4 or 5 versions of those spread across
the different guests.

Anyway, please review.


r~


Richard Henderson (35):
  tests/multiarch: Add test-aes
  target/arm: Move aesmc and aesimc tables to crypto/aes.c
  crypto/aes: Add constants for ShiftRows, InvShiftRows
  crypto: Add aesenc_SB_SR
  target/i386: Use aesenc_SB_SR
  target/arm: Demultiplex AESE and AESMC
  target/arm: Use aesenc_SB_SR
  target/ppc: Use aesenc_SB_SR
  target/riscv: Use aesenc_SB_SR
  crypto: Add aesdec_ISB_ISR
  target/i386: Use aesdec_ISB_ISR
  target/arm: Use aesdec_ISB_ISR
  target/ppc: Use aesdec_ISB_ISR
  target/riscv: Use aesdec_ISB_ISR
  crypto: Add aesenc_MC
  target/arm: Use aesenc_MC
  crypto: Add aesdec_IMC
  target/i386: Use aesdec_IMC
  target/arm: Use aesdec_IMC
  target/riscv: Use aesdec_IMC
  crypto: Add aesenc_SB_SR_MC_AK
  target/i386: Use aesenc_SB_SR_MC_AK
  target/ppc: Use aesenc_SB_SR_MC_AK
  target/riscv: Use aesenc_SB_SR_MC_AK
  crypto: Add aesdec_ISB_ISR_IMC_AK
  target/i386: Use aesdec_ISB_ISR_IMC_AK
  target/riscv: Use aesdec_ISB_ISR_IMC_AK
  crypto: Add aesdec_ISB_ISR_AK_IMC
  target/ppc: Use aesdec_ISB_ISR_AK_IMC
  host/include/i386: Implement aes-round.h
  host/include/aarch64: Implement aes-round.h
  crypto: Remove AES_shifts, AES_ishifts
  crypto: Implement aesdec_IMC with AES_imc_rot
  crypto: Remove AES_imc
  crypto: Unexport AES_*_rot, AES_TeN, AES_TdN

 host/include/aarch64/host/aes-round.h   | 204 ++++++
 host/include/aarch64/host/cpuinfo.h     |   1 +
 host/include/generic/host/aes-round.h   |  36 ++
 host/include/i386/host/aes-round.h      | 148 +++++
 host/include/i386/host/cpuinfo.h        |   1 +
 host/include/x86_64/host/aes-round.h    |   1 +
 include/crypto/aes-round.h              | 158 +++++
 include/crypto/aes.h                    |  30 -
 target/arm/helper.h                     |   2 +
 target/i386/ops_sse.h                   |  64 +-
 target/arm/tcg/sve.decode               |   4 +-
 crypto/aes.c                            | 808 ++++++++++++++++--------
 target/arm/tcg/crypto_helper.c          | 245 +++----
 target/arm/tcg/translate-a64.c          |  13 +-
 target/arm/tcg/translate-neon.c         |   4 +-
 target/arm/tcg/translate-sve.c          |   8 +-
 target/ppc/int_helper.c                 |  58 +-
 target/riscv/crypto_helper.c            | 142 ++---
 tests/tcg/aarch64/test-aes.c            |  58 ++
 tests/tcg/i386/test-aes.c               |  68 ++
 tests/tcg/ppc64/test-aes.c              | 116 ++++
 tests/tcg/riscv64/test-aes.c            |  76 +++
 util/cpuinfo-aarch64.c                  |   2 +
 util/cpuinfo-i386.c                     |   3 +
 tests/tcg/multiarch/test-aes-main.c.inc | 183 ++++++
 tests/tcg/aarch64/Makefile.target       |   4 +
 tests/tcg/i386/Makefile.target          |   4 +
 tests/tcg/ppc64/Makefile.target         |   1 +
 tests/tcg/riscv64/Makefile.target       |   4 +
 29 files changed, 1776 insertions(+), 670 deletions(-)
 create mode 100644 host/include/aarch64/host/aes-round.h
 create mode 100644 host/include/generic/host/aes-round.h
 create mode 100644 host/include/i386/host/aes-round.h
 create mode 100644 host/include/x86_64/host/aes-round.h
 create mode 100644 include/crypto/aes-round.h
 create mode 100644 tests/tcg/aarch64/test-aes.c
 create mode 100644 tests/tcg/i386/test-aes.c
 create mode 100644 tests/tcg/ppc64/test-aes.c
 create mode 100644 tests/tcg/riscv64/test-aes.c
 create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc

-- 
2.34.1

