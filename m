Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t6sm16729133wmt.34.2019.05.23.03.25.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:25:32 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 439631FF87;
	Thu, 23 May 2019 11:25:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/28] current testing/next queue
Date: Thu, 23 May 2019 11:25:04 +0100
Message-Id: <20190523102532.10486-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gfuovYVP7ZVa


Hi,

This is the current status of my testing/next tree. I had to delay
sending a PR as I refactored the semihosting changes (used by softmmu
tests) to be more generic. I've also addressed comments and merged in
Kevin's tweaks to the iotest check script.

The following patches still need review
 patch 0003/semihosting implement a semihosting console.patch
 patch 0004/semihosting enable chardev backed output for cons.patch
 patch 0006/target arm use the common interface for WRITE0 WR.patch
 patch 0017/tests tcg aarch64 add system boot.S.patch
 patch 0027/tests qemu iotests re format output to for make c.patch

Alex Bennée (23):
  semihosting: move semihosting configuration into its own directory
  semihosting: introduce CONFIG_SEMIHOSTING
  semihosting: implement a semihosting console
  semihosting: enable chardev backed output for console
  target/arm: fixup some of the commentary for arm-semi
  target/arm: use the common interface for WRITE0/WRITEC in arm-semi
  target/arm: add LOG_UNIMP messages to arm-semi
  target/arm: correct return values for WRITE/READ in arm-semi
  target/mips: only build mips-semi for softmmu
  target/mips: convert UHI_plog to use common semihosting code
  MAINTAINERS: update for semihostings new home
  tests/tcg/multiarch: add support for multiarch system tests
  tests/tcg/multiarch: add hello world system test
  editorconfig: add settings for .s/.S files
  tests/tcg/aarch64: add system boot.S
  tests/tcg/multiarch: move the system memory test
  tests/tcg/minilib: support %c format char
  tests/tcg/multiarch: expand system memory test to cover more
  .travis.yml: enable aarch64-softmmu and alpha-softmmu tcg tests
  Makefile: fix coverage-report reference to BUILD_DIR
  Makefile: include per-target build directories in coverage report
  Makefile.target: support per-target coverage reports
  tests/qemu-iotests: re-format output to for make check-block

Gerd Hoffmann (1):
  tests/docker: add ubuntu 18.04

Philippe Mathieu-Daudé (1):
  tests/docker: Test more components on the Fedora default image

Richard Henderson (1):
  tests/tcg/alpha: add system boot.S

Thomas Huth (2):
  tests/qemu-iotests/group: Re-use the "auto" group for tests that can
    always run
  tests: Run the iotests during "make check" again

 .editorconfig                                 |   5 +
 .travis.yml                                   |   2 +-
 MAINTAINERS                                   |   8 +
 Makefile                                      |   4 +-
 Makefile.target                               |  16 +
 default-configs/arm-softmmu.mak               |   1 +
 default-configs/lm32-softmmu.mak              |   2 +
 default-configs/m68k-softmmu.mak              |   2 +
 default-configs/mips-softmmu-common.mak       |   1 +
 default-configs/nios2-softmmu.mak             |   2 +
 default-configs/xtensa-softmmu.mak            |   2 +
 gdbstub.c                                     |   7 +-
 hw/Kconfig                                    |   1 +
 hw/Makefile.objs                              |   1 +
 hw/mips/mips_malta.c                          |   2 +-
 hw/semihosting/Kconfig                        |   3 +
 hw/semihosting/Makefile.objs                  |   2 +
 hw/semihosting/config.c                       | 186 +++++++
 hw/semihosting/console.c                      |  77 +++
 include/exec/gdbstub.h                        |  11 +
 include/hw/semihosting/console.h              |  38 ++
 include/{exec => hw/semihosting}/semihost.h   |  17 +-
 include/sysemu/sysemu.h                       |   1 +
 linux-user/Makefile.objs                      |   2 +
 linux-user/arm/semihost.c                     |  24 +
 qemu-options.hx                               |   6 +-
 stubs/Makefile.objs                           |   1 +
 stubs/semihost.c                              |  70 +++
 target/arm/arm-semi.c                         |  98 ++--
 target/arm/helper.c                           |   2 +-
 target/arm/translate-a64.c                    |   2 +-
 target/arm/translate.c                        |   2 +-
 target/lm32/helper.c                          |   2 +-
 target/m68k/op_helper.c                       |   2 +-
 target/mips/Makefile.objs                     |   3 +-
 target/mips/helper.h                          |   2 +
 target/mips/mips-semi.c                       |  14 +-
 target/mips/translate.c                       |  10 +-
 target/nios2/helper.c                         |   2 +-
 target/xtensa/translate.c                     |   2 +-
 target/xtensa/xtensa-semi.c                   |   2 +-
 tests/Makefile.include                        |   8 +-
 tests/check-block.sh                          |  44 +-
 tests/docker/dockerfiles/fedora.docker        |   7 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  57 ++
 tests/qemu-iotests-quick.sh                   |   8 -
 tests/qemu-iotests/check                      | 179 +++---
 tests/qemu-iotests/group                      | 177 +++---
 tests/tcg/Makefile                            |   1 +
 tests/tcg/aarch64/Makefile.softmmu-target     |  34 ++
 tests/tcg/aarch64/system/boot.S               | 239 ++++++++
 tests/tcg/aarch64/system/kernel.ld            |  24 +
 tests/tcg/alpha/Makefile.softmmu-target       |  34 ++
 tests/tcg/alpha/system/boot.S                 | 511 ++++++++++++++++++
 tests/tcg/alpha/system/kernel.ld              |  30 +
 tests/tcg/i386/Makefile.softmmu-target        |   4 +-
 tests/tcg/i386/system/memory.c                | 243 ---------
 tests/tcg/minilib/printf.c                    |   3 +
 .../multiarch/system/Makefile.softmmu-target  |  14 +
 tests/tcg/{i386 => multiarch}/system/hello.c  |   0
 tests/tcg/multiarch/system/memory.c           | 449 +++++++++++++++
 vl.c                                          | 128 +----
 62 files changed, 2226 insertions(+), 605 deletions(-)
 create mode 100644 hw/semihosting/Kconfig
 create mode 100644 hw/semihosting/Makefile.objs
 create mode 100644 hw/semihosting/config.c
 create mode 100644 hw/semihosting/console.c
 create mode 100644 include/hw/semihosting/console.h
 rename include/{exec => hw/semihosting}/semihost.h (78%)
 create mode 100644 linux-user/arm/semihost.c
 create mode 100644 stubs/semihost.c
 create mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
 delete mode 100755 tests/qemu-iotests-quick.sh
 create mode 100644 tests/tcg/aarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/aarch64/system/boot.S
 create mode 100644 tests/tcg/aarch64/system/kernel.ld
 create mode 100644 tests/tcg/alpha/Makefile.softmmu-target
 create mode 100644 tests/tcg/alpha/system/boot.S
 create mode 100644 tests/tcg/alpha/system/kernel.ld
 delete mode 100644 tests/tcg/i386/system/memory.c
 create mode 100644 tests/tcg/multiarch/system/Makefile.softmmu-target
 rename tests/tcg/{i386 => multiarch}/system/hello.c (100%)
 create mode 100644 tests/tcg/multiarch/system/memory.c

-- 
2.20.1
