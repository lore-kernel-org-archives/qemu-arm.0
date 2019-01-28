Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w80sm34736wme.38.2019.01.28.09.39.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 09:39:40 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 555123E0489;
	Mon, 28 Jan 2019 17:39:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/4] HWCAP_CPUID registers for aarch64
Date: Mon, 28 Jan 2019 17:39:36 +0000
Message-Id: <20190128173940.25813-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h/HbASjC5f1B


Hi,

I posted a series to expose some of the CPU registers to user-space.
The counter registers got merged at the time but the HW_CPUID had some
comments that needed addressing. I've re-spun the series and cleaned
it up, hopefully addressing the comments at the same time. The test
case has been expanded.

The ABI is described in the kernel document:

  https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.txt

but from QEMU's point of view we just need to ensure the correct
values are reported for CONFIG_USER_ONLY.

Alex Bennée (4):
  target/arm: relax permission checks for HWCAP_CPUID registers
  target/arm: expose CPUID registers to userspace
  linux-user/elfload: enable HWCAP_CPUID for AArch64
  tests/tcg/aarch64: userspace system register test

 linux-user/elfload.c              |   1 +
 target/arm/cpu.h                  |  12 +++
 target/arm/helper.c               |  57 ++++++++++----
 tests/tcg/aarch64/Makefile.target |   2 +-
 tests/tcg/aarch64/sysregs.c       | 120 ++++++++++++++++++++++++++++++
 5 files changed, 175 insertions(+), 17 deletions(-)
 create mode 100644 tests/tcg/aarch64/sysregs.c

-- 
2.17.1
