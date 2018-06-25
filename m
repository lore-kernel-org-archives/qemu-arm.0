Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m185-v6sm9224186wma.36.2018.06.25.09.00.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jun 2018 09:00:10 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 378623E084C;
	Mon, 25 Jun 2018 17:00:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/5] support reading some CPUID/CNT registers from user-space
Date: Mon, 25 Jun 2018 17:00:04 +0100
Message-Id: <20180625160009.17437-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Tjl/USzFF2B3

Hi,

This expands on the previous version by adding the additional CPUID
registers as exposed by the HWCAP_CPUID kernel feature. Most of the
work involves judicious use of macros. There is a easily extensible
test case that uses the shiny new check-tcg infrastructure ;-)

Alex Bennée (5):
  target/arm: support reading of CNT[VCT|FRQ]_EL0 from user-space
  target/arm: relax permission checks for HWCAP_CPUID registers
  target/arm: expose CPUID registers to userspace
  linux-user/elfload: enable HWCAP_CPUID for AArch64
  tests/tcg/aarch64: userspace system register test

 linux-user/elfload.c              |  1 +
 target/arm/cpu.h                  |  7 +++
 target/arm/helper.c               | 80 +++++++++++++++++++------
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/sysregs.c       | 99 +++++++++++++++++++++++++++++++
 5 files changed, 170 insertions(+), 19 deletions(-)
 create mode 100644 tests/tcg/aarch64/sysregs.c

-- 
2.17.1
