Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z11sm446523wmc.30.2020.03.16.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:21:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 271861FF7E;
	Mon, 16 Mar 2020 17:21:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/28 for 5.0] testing and gdbstub
Date: Mon, 16 Mar 2020 17:21:27 +0000
Message-Id: <20200316172155.971-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zmjwiRIStYzc

Hi,

This is the last chance to get any reviews in before I send a pull
request later today. To avoid having multiple PRs I've combined both
the testing changes and the gdbstub updates. In the end I had to drop
Gerd's vm updates as it cause problems with the acceptance testing.

The following patches still need review:
 - tests/tcg/aarch64: add test-sve-ioctl guest-debug test
 - tests/tcg/aarch64: add SVE iotcl test
 - tests/tcg/aarch64: add a gdbstub testcase for SVE registers
 - target/arm: generate xml description of our SVE registers
 - target/arm: prepare for multiple dynamic XMLs
 - target/i386: use gdb_get_reg helpers

Alex Bennée (20):
  gdbstub: make GDBState static and have common init function
  gdbstub: stop passing GDBState * around and use global
  gdbstub: move str_buf to GDBState and use GString
  gdbstub: move mem_buf to GDBState and use GByteArray
  gdbstub: add helper for 128 bit registers
  target/arm: use gdb_get_reg helpers
  target/m68k: use gdb_get_reg helpers
  target/i386: use gdb_get_reg helpers
  gdbstub: extend GByteArray to read register helpers
  target/arm: prepare for multiple dynamic XMLs
  target/arm: explicitly encode regnum in our XML
  target/arm: default SVE length to 64 bytes for linux-user
  target/arm: generate xml description of our SVE registers
  target/arm: don't bother with id_aa64pfr0_read for USER_ONLY
  tests/tcg/aarch64: userspace system register test
  configure: allow user to specify what gdb to use
  tests/guest-debug: add a simple test runner
  tests/tcg/aarch64: add a gdbstub testcase for SVE registers
  tests/tcg/aarch64: add SVE iotcl test
  tests/tcg/aarch64: add test-sve-ioctl guest-debug test

Changbin Du (1):
  gdbstub: Fix single-step issue by confirming 'vContSupported+' feature
    to gdb

Damien Hedde (2):
  gdbstub: change GDBState.last_packet to GByteArray
  gdbstub: do not split gdb_monitor_write payload

Philippe Mathieu-Daudé (5):
  tests/docker: Install tools to cross-debug and build Linux kernels
  tests/docker: Update VirGL git repository URL
  tests/docker: Remove obsolete VirGL --with-glx configure option
  tests/docker: Update VirGL to v0.8.0
  travis.yml: Set G_MESSAGES_DEBUG do report GLib errors

 configure                                    |   9 +
 include/exec/gdbstub.h                       |  62 +-
 include/hw/core/cpu.h                        |   2 +-
 target/alpha/cpu.h                           |   2 +-
 target/arm/cpu.h                             |  31 +-
 target/cris/cpu.h                            |   4 +-
 target/hppa/cpu.h                            |   2 +-
 target/i386/cpu.h                            |   2 +-
 target/lm32/cpu.h                            |   2 +-
 target/m68k/cpu.h                            |   2 +-
 target/microblaze/cpu.h                      |   2 +-
 target/mips/internal.h                       |   2 +-
 target/openrisc/cpu.h                        |   2 +-
 target/ppc/cpu.h                             |   4 +-
 target/riscv/cpu.h                           |   2 +-
 target/s390x/internal.h                      |   2 +-
 target/sh4/cpu.h                             |   2 +-
 target/sparc/cpu.h                           |   2 +-
 target/xtensa/cpu.h                          |   2 +-
 gdbstub.c                                    | 936 +++++++++----------
 hw/core/cpu.c                                |   2 +-
 target/alpha/gdbstub.c                       |   2 +-
 target/arm/cpu.c                             |   7 +-
 target/arm/gdbstub.c                         | 173 +++-
 target/arm/gdbstub64.c                       |   2 +-
 target/arm/helper.c                          | 186 +++-
 target/cris/gdbstub.c                        |   4 +-
 target/hppa/gdbstub.c                        |   2 +-
 target/i386/gdbstub.c                        |  29 +-
 target/lm32/gdbstub.c                        |   2 +-
 target/m68k/gdbstub.c                        |   2 +-
 target/m68k/helper.c                         |  33 +-
 target/microblaze/gdbstub.c                  |   2 +-
 target/mips/gdbstub.c                        |   2 +-
 target/nios2/cpu.c                           |   2 +-
 target/openrisc/gdbstub.c                    |   2 +-
 target/ppc/gdbstub.c                         |  48 +-
 target/ppc/translate_init.inc.c              |  54 +-
 target/riscv/gdbstub.c                       |  20 +-
 target/s390x/gdbstub.c                       |  30 +-
 target/sh4/gdbstub.c                         |   2 +-
 target/sparc/gdbstub.c                       |   2 +-
 target/xtensa/gdbstub.c                      |   2 +-
 tests/tcg/aarch64/sve-ioctls.c               |  70 ++
 tests/tcg/aarch64/sysregs.c                  | 172 ++++
 .travis.yml                                  |   1 +
 tests/.gitignore                             |   1 +
 tests/docker/dockerfiles/debian-amd64.docker |   6 +-
 tests/docker/dockerfiles/debian10.docker     |   3 +
 tests/docker/dockerfiles/debian9.docker      |   3 +
 tests/guest-debug/run-test.py                |  57 ++
 tests/tcg/aarch64/Makefile.target            |  32 +
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py  |  82 ++
 tests/tcg/aarch64/gdbstub/test-sve.py        |  81 ++
 54 files changed, 1491 insertions(+), 701 deletions(-)
 create mode 100644 tests/tcg/aarch64/sve-ioctls.c
 create mode 100644 tests/tcg/aarch64/sysregs.c
 create mode 100755 tests/guest-debug/run-test.py
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sve.py

-- 
2.20.1
