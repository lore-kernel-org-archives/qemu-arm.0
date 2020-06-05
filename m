Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2072022lfc;
        Thu, 4 Jun 2020 21:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJgfYKuOH12MWZpGmOmyLLX3+4C32GaYMXLwM25sj+1ZisjyLOwSTwZ/Mm5f4L1iiJcegz
X-Received: by 2002:a25:ac45:: with SMTP id r5mr13501163ybd.138.1591330669087;
        Thu, 04 Jun 2020 21:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330669; cv=none;
        d=google.com; s=arc-20160816;
        b=bz8FHO0NE9V7SxrqTmbi23LYNKpZUgEevnEL6ZQrQzjXw0Hns7HD6GRDh/y8nLOGZ1
         Hx493GrTPXpXzIhAOn9X/lTgJFUbeAlgOjB2m7fWQsG9qhNLrTtDNW7KkplqiLiwHYMx
         pABDf9oUllUSHPp29dw9YPfkh85ao6+LpKMkX6bsq4BnoSpLZ/sijmxb6U4MUlErpNzt
         dUkRyfEZB4eBHZoXNF4Mp2sgkU3YO7cNdZp0azVJf3PbGrEN6CUGdElNF3HXw1QEvnND
         eeIsVX5M/KqEPEzLBRovDNhZw4aWGpNqXCNAu9j+EtjWKkf8lHcOWvtV5/0EWe143oJs
         d2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0A6sysLQGM7PIUVrKKD2e+tjvdFPeywZ4FvTVenRjO8=;
        b=yAGwmKdFgEuBfOcwNMO+93ppdxv/JljUsTS+8NsEkk0uSu9s7MUe8itonmr4PgN+Jm
         UAXIaMLtsTfXSs0es7imYIgCG+KeqslLY3b8R2Nxf+jG9Idz2OFUV9A9hK+Rvg8Shdu1
         I4D+ve+8VA+c1AM/O/6FKy4zwb35xRKR9Cd6CkQ2Lk23gEj8sEiTEd1tjfNAY83uk3Lt
         GEkSNgZu5EBgrp1WVyxdSbvTJN1vPU3vTC+wIYYOds+/Y9zMxR/5iXi8MNOAN7n21Lm+
         a0VT9J4VCpaYseULTbD+7IqH8m0Fzd8PmaMkKkX8PLaN9GQg2HPwoo+uJcQ9lZCRqJnQ
         JgxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AatOKgix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si5794028ybj.47.2020.06.04.21.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AatOKgix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3ng-0004AI-CO
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nW-00049P-Ks
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:38 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nV-0000hT-91
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:38 -0400
Received: by mail-pl1-x644.google.com with SMTP id m7so3124479plt.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0A6sysLQGM7PIUVrKKD2e+tjvdFPeywZ4FvTVenRjO8=;
 b=AatOKgixysqnlj2TGrVJ0nCU68wFlF3Fp8Y63O30I1vUZQkHWtmryWadpHTaHNUk9Q
 b6ndXLc5yqWpXjb2Q4UDAHrE7JIWRiEkKuNNl+n+lT9O/Zs0PuUxeuyrmld80hNlo8aI
 LXHKcuXdm00gJJl9V/1BJsVz59VEaBlxbM8W4kISkJOLU0FonhzN2wEBgfXuaPo9l5LN
 HBzkm9Dcy9d8LSfzgaJ51l4Jcwkx772EybKo6/Jlvw3DUrPPqMDR6eAaQXpVyFxcs39c
 fOotfj4vQ69agrw9zsuZNqfFv7o75eNq+IyNqjgbGlec3+WySne/6zAY9BlTk4/1NQcZ
 qbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0A6sysLQGM7PIUVrKKD2e+tjvdFPeywZ4FvTVenRjO8=;
 b=ud5zxS2Nm/j098PIzdYASN1P8hV4bm2VhDpbh9QTm/bUF4CWTkcMDC/17apXYk0uZV
 rpB2rIVHKsHfPNjjmugwaCAKnCxPGXG1MSfgx896cjGPMuC47n8H5XS5AtBefJ/NI+n0
 1ymo6w5/6x+c9I91mKWzxYdwnL2jhlyw6PZ+Da8lSApoWhpQnEAz1T+lBPUxlOLJedqJ
 f9mIaF7jG3KA46demAKfmLMInVi4Qm3GzGqWCjtDNwi4PY7uje5/Co/CNWcqwFJ8JzoP
 EiX2eyXB7Ds9qnUhVP3sffw9qoW67NqZPHGPEhub0t3uthX4hm1Wxua1Kv5q8sOVDl59
 PRyw==
X-Gm-Message-State: AOAM531uwRW1fidfgLS41hVMsU/5HpnI+dhtrEppPbDNWI8eauACMQ+w
 9AcOLupYtoqD3ypiaH5WHmYHWA==
X-Received: by 2002:a17:90b:1244:: with SMTP id
 gx4mr779943pjb.136.1591330655275; 
 Thu, 04 Jun 2020 21:17:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Thu,  4 Jun 2020 21:17:16 -0700
Message-Id: <20200605041733.415188-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/FvB0QlUpsJ

Version 1 was back in October:
https://patchew.org/QEMU/20191015163254.12041-1-richard.henderson@linaro.org/

Although that post claims there was an actual v1 in March 2019,
I can't locate it, so... whatever.

This version -- call it 2 -- is the first attempt to implement the
actual in-progress kernel abi, rather than making up a private abi:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=devel/mte-v4

Based-on: 20200603011317.473934-1-richard.henderson@linaro.org
("target/arm: Implement ARMv8.5-MemTag, system mode")
Based-on: 20200520172800.8499-1-richard.henderson@linaro.org
("linux-user: User support for AArch64 BTI")

The full tree is available at:
https://github.com/rth7680/qemu/tree/tgt-arm-mte-user


r~


Richard Henderson (17):
  tcg: Introduce target-specific page data for user-only
  linux-user: Introduce PAGE_ANON
  linux-user: Check for overflow in access_ok
  linux-user: Tidy VERIFY_READ/VERIFY_WRITE
  bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
  linux-user: Do not use guest_addr_valid for h2g_valid
  linux-user: Fix guest_addr_valid vs reserved_va
  exec: Add support for TARGET_TAGGED_ADDRESSES
  linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
  linux-user/aarch64: Implement PR_MTE_TCF and PR_MTE_TAG
  linux-user/aarch64: Implement PROT_MTE
  linux-user/aarch64: Pass syndrome to EXC_*_ABORT
  linux-user/aarch64: Signal SEGV_MTESERR for sync tag check fault
  linux-user/aarch64: Signal SEGV_MTEAERR for async tag check error
  target/arm: Add allocation tag storage for user mode
  target/arm: Enable MTE for user-only
  tests/tcg/aarch64: Add mte smoke tests

 bsd-user/qemu.h                     |  9 ++--
 include/exec/cpu-all.h              | 23 ++++++---
 include/exec/cpu_ldst.h             | 40 +++++++++++-----
 linux-user/aarch64/target_signal.h  |  3 ++
 linux-user/aarch64/target_syscall.h | 13 +++++
 linux-user/qemu.h                   | 19 +++++---
 linux-user/syscall_defs.h           |  1 +
 target/arm/cpu-param.h              |  3 ++
 tests/tcg/aarch64/mte.h             | 54 +++++++++++++++++++++
 accel/tcg/translate-all.c           | 28 +++++++++++
 bsd-user/main.c                     |  5 ++
 linux-user/aarch64/cpu_loop.c       | 60 +++++++++++++++++++-----
 linux-user/main.c                   |  5 ++
 linux-user/mmap.c                   | 28 +++++++----
 linux-user/syscall.c                | 73 ++++++++++++++++++++++++++++-
 target/arm/cpu.c                    | 17 +++++++
 target/arm/mte_helper.c             | 39 ++++++++++++++-
 target/arm/tlb_helper.c             | 27 ++++++++---
 tests/tcg/aarch64/mte-1.c           | 25 ++++++++++
 tests/tcg/aarch64/mte-2.c           | 42 +++++++++++++++++
 tests/tcg/aarch64/mte-3.c           | 47 +++++++++++++++++++
 tests/tcg/aarch64/Makefile.target   |  4 ++
 22 files changed, 502 insertions(+), 63 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c

-- 
2.25.1

