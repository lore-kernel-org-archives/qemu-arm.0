Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e8sm38762850wrc.34.2019.05.14.08.53.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:02 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D48841FF87;
	Tue, 14 May 2019 16:53:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  00/11] semihosting cleanup and re-factor
Date: Tue, 14 May 2019 16:52:50 +0100
Message-Id: <20190514155301.16123-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KdyTZ3WDmNFx


Hi,

This collects together some fixes from last weeks RFC clean-up patch
as well as a generalised version of the chardev console tweak I made
last week for testing/next. As it happens it only really made sense
for ARM and MIPs logging semihost calls but there is certainly scope
for handling all the semihost syscalls in a more common way. I didn't
make the changes to xtensa as that already has a bi-directional
console-via-chardev setup and that would be quite a bit of extra work
to support.

I've added myself to the MAINTAINERS section for the common code but
my focus at the moment is really just to improve the use of
semihosting in our expanding system tests. Hopefully this is enough to
ensure future enhancements (common open/read/write/close?) can be done
and easily enabled for all semihost targets.

Please review.


Alex Bennée (11):
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

 MAINTAINERS                                 |   7 +
 default-configs/arm-softmmu.mak             |   1 +
 default-configs/lm32-softmmu.mak            |   2 +
 default-configs/m68k-softmmu.mak            |   2 +
 default-configs/mips-softmmu-common.mak     |   1 +
 default-configs/nios2-softmmu.mak           |   2 +
 default-configs/xtensa-softmmu.mak          |   2 +
 gdbstub.c                                   |   7 +-
 hw/Kconfig                                  |   1 +
 hw/Makefile.objs                            |   1 +
 hw/mips/mips_malta.c                        |   2 +-
 hw/semihosting/Kconfig                      |   3 +
 hw/semihosting/Makefile.objs                |   2 +
 hw/semihosting/config.c                     | 186 ++++++++++++++++++++
 hw/semihosting/console.c                    |  77 ++++++++
 include/exec/gdbstub.h                      |  11 ++
 include/hw/semihosting/console.h            |  38 ++++
 include/{exec => hw/semihosting}/semihost.h |  17 +-
 include/sysemu/sysemu.h                     |   1 +
 linux-user/Makefile.objs                    |   2 +
 linux-user/arm/semihost.c                   |  24 +++
 qemu-options.hx                             |   6 +-
 stubs/Makefile.objs                         |   1 +
 stubs/semihost.c                            |  70 ++++++++
 target/arm/arm-semi.c                       |  98 ++++++-----
 target/arm/helper.c                         |   2 +-
 target/arm/translate-a64.c                  |   2 +-
 target/arm/translate.c                      |   2 +-
 target/lm32/helper.c                        |   2 +-
 target/m68k/op_helper.c                     |   2 +-
 target/mips/Makefile.objs                   |   3 +-
 target/mips/helper.h                        |   2 +
 target/mips/mips-semi.c                     |  14 +-
 target/mips/translate.c                     |  10 +-
 target/nios2/helper.c                       |   2 +-
 target/xtensa/translate.c                   |   2 +-
 target/xtensa/xtensa-semi.c                 |   2 +-
 vl.c                                        | 128 +-------------
 38 files changed, 545 insertions(+), 192 deletions(-)
 create mode 100644 hw/semihosting/Kconfig
 create mode 100644 hw/semihosting/Makefile.objs
 create mode 100644 hw/semihosting/config.c
 create mode 100644 hw/semihosting/console.c
 create mode 100644 include/hw/semihosting/console.h
 rename include/{exec => hw/semihosting}/semihost.h (78%)
 create mode 100644 linux-user/arm/semihost.c
 create mode 100644 stubs/semihost.c

-- 
2.20.1
