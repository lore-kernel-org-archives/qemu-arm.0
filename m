Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id qo25sm2528274ejb.93.2021.03.12.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 02:20:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 96EFF1FF7E;
	Fri, 12 Mar 2021 10:20:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 0/5] semihosting/next (SYS_HEAPINFO)
Date: Fri, 12 Mar 2021 10:20:24 +0000
Message-Id: <20210312102029.17017-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eqcfKQdNMUD6

Hi,

Change from the last version include tweaking the test to be a little
less asnprintf heavy and also don't rely on brk() to do it's job. It
also threw up a linux-user failure for RiscV which didn't have the
needed TaskState info set. The series now applies cleanly to master.

The following patches need review:

 - tests/tcg: add HeapInfo checking to semihosting test
 - linux-user/riscv: initialise the TaskState heap/stack info
 - semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
 - semihosting: move semihosting tests to multiarch

Alex Bennée (5):
  semihosting: move semihosting tests to multiarch
  semihosting/arm-compat-semi: unify GET/SET_ARG helpers
  semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
  linux-user/riscv: initialise the TaskState heap/stack info
  tests/tcg: add HeapInfo checking to semihosting test

 tests/tcg/aarch64/semicall.h                  | 18 +++++
 tests/tcg/arm/semicall.h                      | 15 +---
 tests/tcg/riscv64/semicall.h                  | 22 ++++++
 linux-user/riscv/cpu_loop.c                   |  5 ++
 semihosting/arm-compat-semi.c                 | 62 +++++++---------
 tests/tcg/arm/semihosting.c                   | 26 -------
 .../arm-compat-semi}/semiconsole.c            |  2 +
 .../multiarch/arm-compat-semi/semihosting.c   | 71 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 tests/tcg/Makefile.target                     |  3 +
 tests/tcg/aarch64/Makefile.target             | 18 -----
 tests/tcg/arm/Makefile.target                 | 16 +----
 tests/tcg/multiarch/Makefile.target           | 31 ++++++++
 13 files changed, 180 insertions(+), 110 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1
