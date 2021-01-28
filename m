Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp620280lfo;
        Thu, 28 Jan 2021 14:42:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK7t0J+rwSZ5pv3SRMJfEThljXEG2jYiSEd3MoCJQw/7B1aq+FMKMNhtjF1ay518fGOjcA
X-Received: by 2002:a25:b9cf:: with SMTP id y15mr2291708ybj.43.1611873749626;
        Thu, 28 Jan 2021 14:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611873749; cv=none;
        d=google.com; s=arc-20160816;
        b=clFnYd/JkSEyIu132Vo4HfjbSytO2oLgPh+4Qk2Zrr7s8i3NlpODHUq77ELnalqlDU
         9qgiaDe3VEIyhkT3F76m9+2r0RSDDBhu2DVOpjEQLUFi9arRnWSJJtXYDSJWXfUU+Gbk
         1ULoMfpRLKbhDq5ir5JPIWFBBlscy/3CSiT/JvpgXFzVA8r50N+b03N9tFxfL8dT+uTi
         sFEbj+CJk3EHQckigfRsvT1owLH8x2nu/VeuifoU8rc9e24hlmdiW/c/796pkbkChjx0
         ugH7uRvMouasuYvQpimRX/m8WD1kvaKvo1a5LmcHlvZGhWY7a2tDsyZaVFLb2LRSY1LX
         YxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=58Y2BWHPpBtCNBlBSdo8EMqqUyTjMdnU8TZUneOpgds=;
        b=xgiZukayA/R12WvCLvRjiNPyVD6YN8R9acll3qGhYG8ocrIodLIF4Ffp5vLGr3SdTi
         mlltt+iUxE+UStkcMbh5Fd/iIerURDo176rAVnVZDH/pZW2ECqWgsESzE9c7BnXZE8IN
         jnhybTBqfHuR+l6iSRJcjFkieUjL3AdgQ6XKAEEfMFgvZiroqYcWu++8X97DvS+06hCI
         UyurEKKpG5nQ+3k09D3p/ezWyPP6IUipq8NP3Mee4GGaoqwvvM2SUt3Funhiab1q7r64
         30plL47vb+4jKyMLmhjtXtN9fMEoAOaTllcZWOOiPZQikV/whMLIsq4RF0gCbY8EpgWI
         Y7Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cCw7EZV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si6905199ybi.121.2021.01.28.14.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:42:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cCw7EZV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Fzg-0005OU-Qy
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz5-0005OK-Ex
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:41:51 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz1-00083c-So
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:41:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id r38so5267512pgk.13
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58Y2BWHPpBtCNBlBSdo8EMqqUyTjMdnU8TZUneOpgds=;
 b=cCw7EZV0fbusih35UkR62uQ7pI2uPVEFJOODRDPyURe9Ze4WxA4o41+b/ShlSEODYO
 EWIbGuM9bZJGz4aQAz2K2e7OTj5iVtr+EgcJ79NFvjwj7cZhsQ7gsPJYMux2Rm1oqs/s
 Gwo3H1xQZpd3LcY8eD6yCWc0sRYAMj4fqWipwKvtTnrwuFZR6JJ0RSQEsvG7cCJcAwFj
 cVhPNFcl0udiymApH+cHl9aPRdUsHyTPO01E7SDcxw/9Ao+Z2EE98KjuwgHzeNDZb1Ae
 +ccnzqsmqVOODrVPw5YRcnE0w2hbGSgOEAztAy+9JeSnRU7lCi01bBeEYTtbP9xC+VIA
 picQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58Y2BWHPpBtCNBlBSdo8EMqqUyTjMdnU8TZUneOpgds=;
 b=CypB3PYUZ42iMlbN2MJOWuUQw9cFBr6WZ1kA1eJjsoeAY4mqKGf65Lt77MGNgfkmpn
 /PM0qWSb2eHtYuJj/CzT886wkwgZdaSGOSu606Z+DgkrzG/EpREduGO0pG/0fjgX69k9
 0vsW6VeDStmC8cPbkPiIJeEg0Fm0uUiT6ZMt5dPgA34tZo9IarQtalMBQYYSiOne4m2h
 kMyma2bsQ9y8hm2vCsotM5tp+eCSV8JIkSqCDs7KWLSt2dAqdN8a0HAywI59FHRV3S0n
 CcRDxAxuX0ufOC3u4/XBheRXycHOTFPqLfgy1cDZa39TCphM4k+lU1Gqhbh8MfODqij4
 IHjQ==
X-Gm-Message-State: AOAM5308d+LSjjEpeceBcmnyXOuOJHsMgyA3K5yWMpuJ9EysOH82gjTB
 boWe2Or0i+jaEiMCzAlKWE7M0g==
X-Received: by 2002:a63:5805:: with SMTP id m5mr1536885pgb.352.1611873704819; 
 Thu, 28 Jan 2021 14:41:44 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/23] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Thu, 28 Jan 2021 12:41:18 -1000
Message-Id: <20210128224141.638790-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qSJwcOk4qMgE

The kernel abi was finally merged into 5.10.

Changes for v4:
  * Revamp "Add support for TARGET_TAGGED_ADDRESSES".  There are now two
    sets of functions in include/exec/, one for tagged and one for
    untagged addresses.  The former takes a CPUState, and does not
    assume current_cpu is a thing.  So much for the generic bits...
    However, use of current_cpu remains, pushed down to lock_user.
    Changing everything that touches that, or get/put_user, is daunting.
  * Fix tbi0 vs tbi1 for linux-user.
    This had a number of cascading effects.
  * Adjust when async errors are noticed.

Changes for v3:
  * Split out type changes to separate patches.
  * Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
  * Do not overlap PAGE_TARGET_2 with PAGE_RESERVED.
  * Use syndrome.h, arm_deliver_fault.


r~


Richard Henderson (23):
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
  target/arm: Improve gen_top_byte_ignore
  target/arm: Use the proper TBI settings for linux-user
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
 target/arm/cpu.h                    |  32 ++++
 target/arm/internals.h              | 249 +------------------------
 target/arm/syndrome.h               | 273 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h             |  60 ++++++
 accel/tcg/translate-all.c           |  28 +++
 bsd-user/main.c                     |   4 +-
 linux-user/aarch64/cpu_loop.c       |  38 +++-
 linux-user/elfload.c                |   4 +-
 linux-user/main.c                   |   4 +-
 linux-user/mmap.c                   |  29 ++-
 linux-user/syscall.c                |  71 +++++++-
 target/arm/cpu.c                    |  25 ++-
 target/arm/mte_helper.c             |  39 +++-
 target/arm/tlb_helper.c             |  15 +-
 target/arm/translate-a64.c          |  25 +--
 tests/tcg/aarch64/mte-1.c           |  28 +++
 tests/tcg/aarch64/mte-2.c           |  45 +++++
 tests/tcg/aarch64/mte-3.c           |  51 ++++++
 tests/tcg/aarch64/mte-4.c           |  45 +++++
 tests/tcg/aarch64/pauth-2.c         |   1 -
 tests/tcg/aarch64/Makefile.target   |   6 +
 tests/tcg/configure.sh              |   4 +
 30 files changed, 888 insertions(+), 325 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1

