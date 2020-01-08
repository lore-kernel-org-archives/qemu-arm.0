Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m10sm4566150wrx.19.2020.01.08.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:02:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E5EA71FF87;
	Wed,  8 Jan 2020 15:02:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	keithp@keithp.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 0/6] semihosting read console support
Date: Wed,  8 Jan 2020 15:02:46 +0000
Message-Id: <20200108150252.6216-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QeSfJIDGKaaN

Hi,

No major changes from the previous version except some tweaking of the
tests to exercise both thumb and arm modes. There is a minor
refactoring so the __semi_call helper can be re-used. I'm planning on
sending the PR in with my gdbstub fixes later this week.

The following patches need review
  05 - tests tcg extract __semi_call into a header and e
  06 - tests tcg add user version of dumb as bricks semi

Alex Bennée (5):
  target/arm: remove unused EXCP_SEMIHOST leg
  target/arm: only update pc after semihosting completes
  tests/tcg: add a dumb-as-bricks semihosting console test
  tests/tcg: extract __semi_call into a header and expand
  tests/tcg: add user version of dumb-as-bricks semiconsole test

Keith Packard (1):
  semihosting: add qemu_semihosting_console_inc for SYS_READC

 include/hw/semihosting/console.h          | 16 +++++
 include/hw/semihosting/semihost.h         |  4 ++
 tests/tcg/arm/semicall.h                  | 35 ++++++++++
 hw/semihosting/console.c                  | 79 +++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c             |  1 +
 linux-user/arm/cpu_loop.c                 |  1 +
 linux-user/arm/semihost.c                 | 27 ++++++++
 stubs/semihost.c                          |  4 ++
 target/arm/arm-semi.c                     |  3 +-
 target/arm/helper.c                       |  8 +--
 target/arm/m_helper.c                     |  1 +
 target/arm/translate-a64.c                |  2 +-
 target/arm/translate.c                    |  6 +-
 tests/tcg/aarch64/system/semiconsole.c    | 38 +++++++++++
 tests/tcg/arm/semiconsole.c               | 27 ++++++++
 tests/tcg/arm/semihosting.c               | 21 +-----
 vl.c                                      |  3 +
 tests/tcg/aarch64/Makefile.softmmu-target |  9 ++-
 tests/tcg/aarch64/Makefile.target         |  7 ++
 tests/tcg/arm/Makefile.target             | 28 ++++++++
 20 files changed, 287 insertions(+), 33 deletions(-)
 create mode 100644 tests/tcg/arm/semicall.h
 create mode 100644 tests/tcg/aarch64/system/semiconsole.c
 create mode 100644 tests/tcg/arm/semiconsole.c

-- 
2.20.1
