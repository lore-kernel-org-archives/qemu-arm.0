Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp673095lfq;
        Fri, 15 Jan 2021 14:47:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP187KnQ+jyEVTzI1mK5J0wKNp3F67gspPt3Rh3SoGRTllbro7/+jpEMfpPs4mNrGoj9wz
X-Received: by 2002:a5b:482:: with SMTP id n2mr19586257ybp.25.1610750860141;
        Fri, 15 Jan 2021 14:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610750860; cv=none;
        d=google.com; s=arc-20160816;
        b=EFIPXGlmrbbLPZWdgQkbL+/veUIy/6Z8CEgUxH2KLgHcxpkCB3JTm8xgB0Fj6YtBwJ
         bmeNLhr/G/HEULKGx5go5QZpMHy4+qYzZYPmZsAVI9y9qSyDQo1CDeNHhSs0vnkqD6tu
         vB3OugGRn5egCv7qNQvjCzENokI8jbODBUwft+BDgrbm3a/KrTcrX2ywIyoE6QvLkC4H
         f6v/bXDdA+lUt9lIZUGfCfXSG8TVttA2WYMwIHRXG+TWoSXZ3wS5zOZ4UVI3ege1fLms
         +L8yiTqSYATE5cTuDVTo5gMbCpDG/AB3MjXfJDvSGQn+fsczFCuyOFvrycIkNUryLUN+
         kYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pILtCL3+WOm9enm51rY0JFGFgNs8LZRCjkNlG93rpNA=;
        b=Z5W14RsENvvm4MgcXmxqoOXrRIHRN0HMfqW1B6o//9onyMgm5/QUUxwkrpQxyVCmaa
         9UkTeWa8qBVkJhdrImXXa+3ptU7S07SslrWLetPhvFXM6dpGoVdaOECgoHy3VpFGaCfj
         P/+Mfu64WlrVJsCjA3OjyRR3Zve0nxJv3SVqAvXNoCeusnoc94ci1ekuOp/NgXDQvvBP
         M4b3//QYmJ2Vqy6YHkE3Ew5oM0JLK8NHNHSWmw5a135O9t022cD+4OjDwavOjQ2UQCX8
         k+EcsqgXFQ4geW8M8yN3pBsgiwpxzmj8tN28jsb0/NaUghxg5+fkhTVPKUJPAUfQeoHE
         Qu/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W3vq9ozS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 201si8368611ybf.130.2021.01.15.14.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:47:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W3vq9ozS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0XsZ-0003VY-GO
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrp-0003Ue-0n
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:46:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrm-0005AC-NH
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:46:52 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e9so1286966plh.3
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pILtCL3+WOm9enm51rY0JFGFgNs8LZRCjkNlG93rpNA=;
 b=W3vq9ozSZ255uAJRfsRNCK1EHdnjZPBsiN71XY2PMGdxkttPVUfvVFaZJXW9qH9+8M
 1lguNXyPerolwKYRjTSXNS3OLXbWJP5CeqREWLEeqgq2dj4EPhAGim+LRuWds2LKoLME
 q18nPaJOj2GsSadHNfY9pVDxcHR+WTqAPEAbcxetM0HapurKC+qa/Na6DXYtdBRoOy5R
 Nqnp8piu0bBelGwUquuaYZxRIkeAYghF4HvVbauM9ijF21gAoYxPmYWyO5PX44mJFmP/
 6W+ys/dg22LUfoW4GcynMwcQz1CjoZF0j53enhSAIVTPfrYwQZ+3iDRSIY8uDYV2WOUt
 fqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pILtCL3+WOm9enm51rY0JFGFgNs8LZRCjkNlG93rpNA=;
 b=pilUP81hP1ZXjhUblKK5lB29esZClkqzIJSFt1RKSsWoFGXoMbQ9iY76V3ex1SQPm0
 s6JuLzUCYkL73n6SxS+FBZE5DUKbgedPffhQewEtKjVoSxUrydKR7324GVRgCElMio+L
 iLSq3EtyMVSQ6ohvyJ803ZiKt3IBpX3nWYLEydxMOAp4MLNGRbOgxTAREpW4ereaf1Dh
 YASKu4wqPo9mT49e06fwKBv1M68PhK3VysHBrBxjKKHjU5W4c0FwsFPT02svARuGr6qE
 /aXflhCGFxwsDufoNiQ8FtmBACPdNQw5eXBH2VsQy3h7bcGxh5AYwqLefPS7qVr0MW7k
 ITHQ==
X-Gm-Message-State: AOAM533kc3XhyGGfsL+CJEXFDHjYJ3gjPb5n9n65KNn6YsrDzgC/jIWi
 Oheogqx7VbnqIRouQTBjYjR9Wg==
X-Received: by 2002:a17:902:b717:b029:dc:3e69:80e8 with SMTP id
 d23-20020a170902b717b02900dc3e6980e8mr14707442pls.40.1610750809022; 
 Fri, 15 Jan 2021 14:46:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/21] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Fri, 15 Jan 2021 12:46:24 -1000
Message-Id: <20210115224645.1196742-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lSBz1Mcqwiy1

The kernel abi was finally merged into 5.10.

Changes for v3:
  * Split out type changes to separate patches.
  * Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
  * Do not overlap PAGE_TARGET_2 with PAGE_RESERVED.
  * Use syndrome.h, arm_deliver_fault.


r~


v1: https://patchew.org/QEMU/20191015163254.12041-1-richard.henderson@linaro.org/
v2: https://patchew.org/QEMU/20200605041733.415188-1-richard.henderson@linaro.org/

Richard Henderson (21):
  tcg: Introduce target-specific page data for user-only
  linux-user: Introduce PAGE_ANON
  exec: Use uintptr_t for guest_base
  exec: Use uintptr_t in cpu_ldst.h
  exec: Improve types for guest_addr_valid
  linux-user: Check for overflow in access_ok
  linux-user: Tidy VERIFY_READ/VERIFY_WRITE
  bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
  linux-user: Do not use guest_addr_valid for h2g_valid
  linux-user: Fix guest_addr_valid vs reserved_va
  exec: Add support for TARGET_TAGGED_ADDRESSES
  linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
  linux-user/aarch64: Implement PR_MTE_TCF and PR_MTE_TAG
  linux-user/aarch64: Implement PROT_MTE
  target/arm: Split out syndrome.h from internals.h
  linux-user/aarch64: Pass syndrome to EXC_*_ABORT
  linux-user/aarch64: Signal SEGV_MTESERR for sync tag check fault
  linux-user/aarch64: Signal SEGV_MTEAERR for async tag check error
  target/arm: Add allocation tag storage for user mode
  target/arm: Enable MTE for user-only
  tests/tcg/aarch64: Add mte smoke tests

 bsd-user/qemu.h                     |   9 +-
 include/exec/cpu-all.h              |  47 ++++-
 include/exec/cpu_ldst.h             |  42 +++--
 linux-user/aarch64/target_signal.h  |   3 +
 linux-user/aarch64/target_syscall.h |  13 ++
 linux-user/qemu.h                   |  19 +-
 linux-user/syscall_defs.h           |   1 +
 target/arm/cpu-param.h              |   3 +
 target/arm/cpu.h                    |  24 +++
 target/arm/internals.h              | 245 +------------------------
 target/arm/syndrome.h               | 273 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h             |  53 ++++++
 accel/tcg/translate-all.c           |  28 +++
 bsd-user/main.c                     |   2 +-
 linux-user/aarch64/cpu_loop.c       |  61 +++++--
 linux-user/main.c                   |   2 +-
 linux-user/mmap.c                   |  29 ++-
 linux-user/syscall.c                |  73 +++++++-
 target/arm/cpu.c                    |  19 ++
 target/arm/mte_helper.c             |  39 +++-
 target/arm/tlb_helper.c             |  15 +-
 tests/tcg/aarch64/mte-1.c           |  25 +++
 tests/tcg/aarch64/mte-2.c           |  42 +++++
 tests/tcg/aarch64/mte-3.c           |  47 +++++
 tests/tcg/aarch64/mte-4.c           |  42 +++++
 tests/tcg/aarch64/Makefile.target   |   6 +
 tests/tcg/configure.sh              |   4 +
 27 files changed, 856 insertions(+), 310 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1

