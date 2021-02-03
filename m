Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp481439lfo;
        Wed, 3 Feb 2021 11:02:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytx/hPKLx6dKVTwmMsqI44UjdHgAp4ZNEBgyWRiwtz3fAkL7TNggkbelIiIOVlPVaSL3t/
X-Received: by 2002:a25:7c43:: with SMTP id x64mr6492054ybc.267.1612378958549;
        Wed, 03 Feb 2021 11:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612378958; cv=none;
        d=google.com; s=arc-20160816;
        b=QBa3DDjbIBt7StuBhLWePyHOt4fciMJPR3AbaVwFHdBUps/KueDFavJn/YG0kCvIRQ
         Xx2qJ/Qp/F2r7dHMxsfHvnw6mp7zI9YghSUiwGtJe/8HMdgAy6pvGc/k9psbXEedSWrx
         lQsG85KfFrC/tEtzW+EIneOKM1QxRLPrfYVXAYR3Ybu4ide9+wF0m60peik5pGBluaX0
         idYwN7wKX8QzPRAoHuWnoN4nUeIAliYF6KJFy2JNeDiyVYq0PhjbKNIFqysqaz02NMqV
         WaVzTuDsrccsMNJ4tLmnA5YQrRG1tlu2lj69Z39U0+Q3RyXWT9qbTg8iGpSXbOz2QXfr
         zJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Cv7+71g4TAQN7W4aQwFfIJTWvbZp8uwS+lYpgB3oYGM=;
        b=NWB2wh4LlHqMFlHJJ3IfFAnfZVHc48vfpoPiLH5cWRjBm0EaexeA3H7x2BvL8WotL8
         yMOE+6jJX4jMKTuKQU3kToQIC+ZG5Mc7Pht9jmcI3wyiXOkpVDVofB1KXKgtlJC/Zrut
         FD7bxB42zq771VtVtVU1Bq18f6qpdtalYhGUOwWrVbrKLrg1ny4hYtFotUqnm0BryVrN
         cgha8B2+aR9aGqgC0Tmu5s5Am/6C/5EpnGwZ4PZsu8wpTJqv+47HxJQicx7ZfQlO1klQ
         9lLNnLt5PjKKcFGF+7PprXA60UhwWpueZTfqnh0WekguS65EBTXeZqUQ2YMfQdPcUQf1
         pQJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rkKUfCAf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d85si2727903ybh.384.2021.02.03.11.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rkKUfCAf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7NQD-0007Dy-Us
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO9-0007BP-7K
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:30 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NNx-0001Vz-8a
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:28 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t25so401868pga.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cv7+71g4TAQN7W4aQwFfIJTWvbZp8uwS+lYpgB3oYGM=;
 b=rkKUfCAfOsb9y5noRRa2haprRCSBDDLa8pJ6iDl338RNbYPr5Jc8xJnUZR+HN31so5
 oMVTYc5qV/vQmwltqGhzpQ3lfxHfrHfhBFAt3SAjXhtDBdoprSoQMs3v0OuQ6JbqzTG9
 EgN7yrKTyEgGq+7V9TbCPKNgCdZa9N78VjgW+PMwtMGt0MuFXg+LJtSTneGOwlQvv0jF
 KA/eqDr2/7kY9ezq1IHNGwisDPudl3kVVG/e9VfHguL1EMWzR3EUYLNw0INf0yEZhx7d
 4aSLmlF0eLSO+xeQodbx6WDEDAIhYY3Wc1QOL0xZgSE+zmMkitF2dYEdEMWPEVPb0eX3
 rTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cv7+71g4TAQN7W4aQwFfIJTWvbZp8uwS+lYpgB3oYGM=;
 b=MWM7FZpytWqIpo36AjaU4lzf81aIPyuWIq/QoernwSp5XESPBXzGoF2n2XGEMzN20u
 5BxqHwVikYikselRl/P5MjX+3d/pAlzXaGKknd4QFhRrueUF8lJWLPBxBIwFBBY/Xq8d
 WgBdiPy7szKeC9XYcmmNzQZu0yPd9CsDTo2ph6ztVGKhwAKDGaDjsgyNfVqIz1AB/G+c
 kvNO2MckxRXkM1FlEFoZw7A2ypPJFsn0wp/ne1+zln41r0lVgkPRVLwbRABceHg3NneH
 vKekQc2y1RZQ+Ow+m+8g+BUKgQLPaR9T1MwHhLzZQppIh4707paK2vh1+9CaT2E3rfyN
 ujVw==
X-Gm-Message-State: AOAM533S+j1EOQTAHVyO7qHjikjCUFO4bSWDrfcnlKq3o9LqTD9wG+nm
 TiFo/eFdar2yZFetPC2+msnxWMNezKgNvwfV
X-Received: by 2002:a63:2001:: with SMTP id g1mr5056240pgg.83.1612378815013;
 Wed, 03 Feb 2021 11:00:15 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/31] target-arm: Implement ARMv8.5-MemTag, user mode
Date: Wed,  3 Feb 2021 08:59:39 -1000
Message-Id: <20210203190010.759771-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sohbzpOIuWRL

The kernel abi was finally merged into 5.10.

Changes for v5:
  * Actually include the revamp for TARGET_TAGGED_ADDRESSES,
    which got lost at some point before posting v4.

    Patches lacking review are only the new ones:
    0011-exec-Introduce-cpu_untagged_addr.patch
    0012-exec-Use-cpu_untagged_addr-in-g2h-split-out-g2h_u.patch
    0013-linux-user-Explicitly-untag-memory-management-sys.patch
    0014-linux-user-Use-guest_range_valid-in-access_ok.patch
    0015-exec-Rename-guest_-addr-range-_valid-to-_untagged.patch
    0016-linux-user-Use-cpu_untagged_addr-in-access_ok-spl.patch
    0017-linux-user-Move-lock_user-et-al-out-of-line.patch
    0018-linux-user-Fix-types-in-uaccess.c.patch
    0019-linux-user-Handle-tags-in-lock_user-unlock_user.patch

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

Richard Henderson (31):
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
  exec: Introduce cpu_untagged_addr
  exec: Use cpu_untagged_addr in g2h; split out g2h_untagged
  linux-user: Explicitly untag memory management syscalls
  linux-user: Use guest_range_valid in access_ok
  exec: Rename guest_{addr,range}_valid to *_untagged
  linux-user: Use cpu_untagged_addr in access_ok; split out *_untagged
  linux-user: Move lock_user et al out of line
  linux-user: Fix types in uaccess.c
  linux-user: Handle tags in lock_user/unlock_user
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
 include/exec/cpu_ldst.h             |  39 ++--
 include/exec/exec-all.h             |   2 +-
 linux-user/aarch64/target_signal.h  |   3 +
 linux-user/aarch64/target_syscall.h |  13 ++
 linux-user/qemu.h                   |  76 +++-----
 linux-user/syscall_defs.h           |   1 +
 target/arm/cpu-param.h              |   3 +
 target/arm/cpu.h                    |  32 ++++
 target/arm/internals.h              | 249 +------------------------
 target/arm/syndrome.h               | 273 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte.h             |  60 ++++++
 accel/tcg/translate-all.c           |  32 +++-
 accel/tcg/user-exec.c               |  57 +++---
 bsd-user/main.c                     |   4 +-
 linux-user/aarch64/cpu_loop.c       |  38 +++-
 linux-user/elfload.c                |  18 +-
 linux-user/flatload.c               |   2 +-
 linux-user/hppa/cpu_loop.c          |  39 ++--
 linux-user/i386/cpu_loop.c          |   6 +-
 linux-user/i386/signal.c            |   5 +-
 linux-user/main.c                   |   4 +-
 linux-user/mmap.c                   |  86 +++++----
 linux-user/ppc/signal.c             |   4 +-
 linux-user/syscall.c                | 165 +++++++++++++----
 linux-user/uaccess.c                |  82 +++++++--
 target/arm/cpu.c                    |  25 ++-
 target/arm/helper-a64.c             |   4 +-
 target/arm/mte_helper.c             |  39 +++-
 target/arm/tlb_helper.c             |  15 +-
 target/arm/translate-a64.c          |  25 +--
 target/hppa/op_helper.c             |   2 +-
 target/i386/tcg/mem_helper.c        |   2 +-
 target/s390x/mem_helper.c           |   4 +-
 tests/tcg/aarch64/mte-1.c           |  28 +++
 tests/tcg/aarch64/mte-2.c           |  45 +++++
 tests/tcg/aarch64/mte-3.c           |  51 ++++++
 tests/tcg/aarch64/mte-4.c           |  45 +++++
 tests/tcg/aarch64/pauth-2.c         |   1 -
 tests/tcg/aarch64/Makefile.target   |   6 +
 tests/tcg/configure.sh              |   4 +
 42 files changed, 1126 insertions(+), 519 deletions(-)
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

-- 
2.25.1

