Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281547wrv;
        Sat, 3 Aug 2019 14:08:07 -0700 (PDT)
X-Received: by 2002:a17:90a:37e9:: with SMTP id v96mr10626982pjb.10.1564866487586;
        Sat, 03 Aug 2019 14:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866487; cv=none;
        d=google.com; s=arc-20160816;
        b=Br2mQyUs0b+ZBhI0431SqtsLTAc1bKj/UJVtc/pykhMQqBoxzCwDanfnMrJ6MqlsF2
         nv+X21uNTxbTacda/BqnS/XlWeUkZpJ8TZByQt3AXrzkQOqoaeUcxHEyShDdWp5p1sgY
         VsVD5nZAs0dcsspuoCSmh8C3vGoCtZY2huYGQKA/eegazAns18l+tVH3ctswgqVUsQpm
         xAu5sPdxEPFF0NZxvmzoyODKu6O5IAHzBhHeBZQk+9fJiwotz/K/UWQug6FNft3iGM/g
         C2eeOViApFODTmF/O7cEBRUK78l9u+XLsTvYfC8oBRJFV8MMbkhI/CFVV8MTNBbUM02v
         7XYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=NSPLjACG69kNYWPaNBk+06B1y1rFaDkEzgMb35jlC8g=;
        b=elvSSf/WU9MEBW+TwMlBYEs5Mb7g8TNM0JmsIXWaPiuDv5kqKcUrBXmyyGZLZrexza
         oZe0TJ0vZuLEhk52AaKUvKxqKg6xOAnhyatABkujvOE2KTTkDVkZ1MJA20ZFSe3oAwVB
         SxMERjXIYYE4vFh3sQoPN01QLOOXeXrUqH+tf4CE5id/40xvmAnvFwSqBH5x3TjkIqbZ
         3hk90QHiOxPGn2NAJvNeunrRUDICCNUF5t4GBWZAy/+ckPWYO3icAZT3it7dQmQ42wVl
         xxRn/l8IwVvOltBPBvZf6V1RISwLKcuu66QIpOTft+Ofr0I40XimIJMnAMntYkMaarjX
         V0cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCnDlNNf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w24sor94607146plq.4.2019.08.03.14.08.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCnDlNNf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NSPLjACG69kNYWPaNBk+06B1y1rFaDkEzgMb35jlC8g=;
        b=oCnDlNNf5zNP3/Oi+lvw0lUsjJpABryCJ+9Jb9i/DaJgNIytsrFiiyfeWkedYUEXtL
         dJjzmeBuc8pYvNjXU2A6PD4Ygjg6nyzFS9RZMXYr01n1oCaqwy1qIiVXQcQzWlSq5DBM
         l/chYORv/qjUFsuVWPP3pxQY/24q3gwokexTc5/HG0msH7LtDKJOBgQfjhkXg/vXtjP3
         WQoDMb7hGxzNi62o2BzHXk865GiC0wMA46DRCpAo9rn5SML4GFNEBtvkQbdBL0i+6ar8
         jKsuxD3QuJuCv4ZFQ/8LTw0w9rJ6ID8hk1AWj/vafPx0rNv4k7iXxy/8DWCpHDS08Dx3
         rNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NSPLjACG69kNYWPaNBk+06B1y1rFaDkEzgMb35jlC8g=;
        b=KRdjz0moF1EEC0Nqy+eG3AOsApESvt98gt0pATrgpBJQauhmSsIsPYna9asxaywWBo
         wC/9eul2NqGB2FOwRyn0GswrWCVuSFn3Y3jCXDbCUHbLDvxcOK08jujGmJXbn6tEMQZr
         S/CjC3FoBbnCYKxFZ5qHTp/cUQHhaZti2NoSQrkL1o/ArDLbLIht9f+Z6Co7jQm4gkna
         z+O3Zc73BoOuid/4BP080zo7ruAU4UHwtupwZhEWM05bep07Xx+yyNwVvyq+ZX3VbktF
         FJox62Hwn/UtqINfSV/zcqlre8jZReRq1SvSQa90zrlvGZk26nt0qMLQbpsnaSyxwiwB
         c8nQ==
X-Gm-Message-State: APjAAAWhHXh7lXRtcPTPwXLuCOQS8/q/1e2QDi8haIILC5cuX4dQ9LIu
	J804xDPVWt4cdX6m22kltkn2nMgQncoieA==
X-Google-Smtp-Source: APXvYqyHAY3ScBRbXoWwdAJoy2rS58cmuHWiYevubWRtgAUvVaxrBxznA5Wt5Qm9RqKr9i/OP2W+gg==
X-Received: by 2002:a17:902:1e2:: with SMTP id b89mr30397176plb.7.1564866487066;
        Sat, 03 Aug 2019 14:08:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 0/6] target/arm: Implement ARMv8.5-BTI for linux-user
Date: Sat,  3 Aug 2019 14:07:57 -0700
Message-Id: <20190803210803.5701-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-TUID: IeE8qoD0PYON

Changes since v6:
  * Rebased on the ARMv8.1-VHE patch set.
  * Review from Dave Martin:
    + Remove PSTATE.BTYPE adjustment on syscall entry.
    + Rely on PT_GNU_PROPERTY to find the NT_GNU_PROPERTY_TYPE_0 note.
    + For the test case, add a linker script to create the PHDR.

Changes since v5:
  * New function to validate the target PROT parameter for mmap/mprotect.
  * Require BTI in the cpu for PROT_BTI set.
  * Set PSTATE.BTYPE=2 for the signal handler.
    Adjust the smoke test to match.
  * Tidy up the note parsing.

Based-on: 20190803184800.8221-1-richard.henderson@linaro.org
"[PATCH v3 00/34] target/arm: Implement ARMv8.1-VHE"


r~


Richard Henderson (6):
  linux-user/aarch64: Reset btype for signals
  linux-user: Validate mmap/mprotect prot value
  linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
  include/elf: Add defines related to GNU property notes for AArch64
  linux-user: Parse NT_GNU_PROPERTY_TYPE_0 notes
  tests/tcg/aarch64: Add bti smoke test

 include/elf.h                     |  22 ++++++
 include/exec/cpu-all.h            |   2 +
 linux-user/syscall_defs.h         |   4 +
 linux-user/aarch64/signal.c       |  10 ++-
 linux-user/elfload.c              |  94 +++++++++++++++++++++--
 linux-user/mmap.c                 | 121 ++++++++++++++++++++++--------
 target/arm/translate-a64.c        |   6 +-
 tests/tcg/aarch64/bti-1.c         |  77 +++++++++++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   |  69 +++++++++++++++++
 tests/tcg/aarch64/Makefile.target |   3 +
 tests/tcg/aarch64/bti.ld          |  15 ++++
 11 files changed, 379 insertions(+), 44 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-crt.inc.c
 create mode 100644 tests/tcg/aarch64/bti.ld

-- 
2.17.1
