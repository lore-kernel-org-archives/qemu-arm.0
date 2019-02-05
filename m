Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q8sm18045642wrr.9.2019.02.05.11.02.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 11:02:26 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7F0D61FF80;
	Tue,  5 Feb 2019 19:02:24 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 0/6] HWCAP_CPUID registers for aarch64
Date: Tue,  5 Feb 2019 19:02:18 +0000
Message-Id: <20190205190224.2198-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1Rj/luScDAzC

Hi,

I've re-spun the cpuid patches with the changes suggested by Peter's
review. The biggest change is the squashing of bits is now all data
driven with ARMCPRegUserSpaceInfo being used to control how bits are
altered for userspace presentation. This includes using glob matching
to set whole bunches to RAZ.

The testcase isn't as comprehensive as it could be because you need a
fairly new compiler (binutils) to emit all the various system register
id's to test. I did look into upgrading debian-arm64-cross with Buster
but I managed to find a bug in Debian's dependencies which rules out
upgrading for now.

checkpatch is complaining about the _m macro I used to group together
words in the masks I defined. I'm not sure adding the spaces makes it
as readable though.

The following patches need review:
 patch 0001/target arm relax permission checks for HWCAP_CPUI.patch
 patch 0002/target arm expose CPUID registers to userspace.patch
 patch 0003/target arm expose MPIDR_EL1 to userspace.patch
 patch 0004/target arm expose remaining CPUID registers as RA.patch
 patch 0006/tests tcg aarch64 userspace system register test.patch


Alex Bennée (6):
  target/arm: relax permission checks for HWCAP_CPUID registers
  target/arm: expose CPUID registers to userspace
  target/arm: expose MPIDR_EL1 to userspace
  target/arm: expose remaining CPUID registers as RAZ
  linux-user/elfload: enable HWCAP_CPUID for AArch64
  tests/tcg/aarch64: userspace system register test

 linux-user/elfload.c              |   1 +
 target/arm/cpu.h                  |  36 +++++++
 target/arm/helper.c               | 106 ++++++++++++++++--
 tests/tcg/aarch64/Makefile.target |   4 +-
 tests/tcg/aarch64/sysregs.c       | 172 ++++++++++++++++++++++++++++++
 5 files changed, 310 insertions(+), 9 deletions(-)
 create mode 100644 tests/tcg/aarch64/sysregs.c

-- 
2.20.1
