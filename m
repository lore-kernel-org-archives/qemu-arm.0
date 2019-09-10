Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t13sm33012594wra.70.2019.09.10.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:34:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A4A901FF87;
	Tue, 10 Sep 2019 20:34:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/4] ELF and (macro) safety
Date: Tue, 10 Sep 2019 20:34:04 +0100
Message-Id: <20190910193408.28917-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FB+TYWD8bab+

Hi,

This is a small re-factoring series which I'll be needing for adding
guest architecture awareness to plugins. There is a little clean up of
concerns by removing the "template" type behaviour from elf.h into a
new elf-types.inc.h file. I then rationalise the ELF related headers
to all be in the same place. Finally the actual useful piece of moving
the definition of ELF_ARCH out of the two loader files and into an
stand alone header.

Alex Bennée (4):
  target/ppc: fix signal delivery for ppc64abi32
  elf: move elf.h to elf/elf.h and split out types
  elf: move elf_ops.h into include/elf/ and rename
  elf: move ELF_ARCH definition to elf-arch.h

 bsd-user/elfload.c                          |  15 +--
 contrib/elf2dmp/qemu_elf.h                  |   2 +-
 disas.c                                     |   2 +-
 dump/dump.c                                 |   2 +-
 dump/win_dump.c                             |   2 +-
 hw/alpha/dp264.c                            |   2 +-
 hw/arm/armv7m.c                             |   2 +-
 hw/arm/boot.c                               |   2 +-
 hw/core/loader.c                            |   7 +-
 hw/cris/axis_dev88.c                        |   2 +-
 hw/cris/boot.c                              |   2 +-
 hw/hppa/machine.c                           |   2 +-
 hw/i386/multiboot.c                         |   2 +-
 hw/i386/pc.c                                |   2 +-
 hw/lm32/lm32_boards.c                       |   2 +-
 hw/lm32/milkymist.c                         |   2 +-
 hw/m68k/an5206.c                            |   2 +-
 hw/m68k/mcf5208.c                           |   2 +-
 hw/microblaze/boot.c                        |   2 +-
 hw/mips/mips_fulong2e.c                     |   2 +-
 hw/mips/mips_malta.c                        |   2 +-
 hw/mips/mips_mipssim.c                      |   2 +-
 hw/mips/mips_r4k.c                          |   2 +-
 hw/moxie/moxiesim.c                         |   2 +-
 hw/nios2/boot.c                             |   2 +-
 hw/openrisc/openrisc_sim.c                  |   2 +-
 hw/pci-host/prep.c                          |   2 +-
 hw/ppc/e500.c                               |   2 +-
 hw/ppc/mac_newworld.c                       |   2 +-
 hw/ppc/mac_oldworld.c                       |   2 +-
 hw/ppc/ppc440_bamboo.c                      |   2 +-
 hw/ppc/prep.c                               |   2 +-
 hw/ppc/sam460ex.c                           |   2 +-
 hw/ppc/spapr.c                              |   2 +-
 hw/ppc/spapr_vio.c                          |   2 +-
 hw/ppc/virtex_ml507.c                       |   2 +-
 hw/riscv/boot.c                             |   2 +-
 hw/s390x/ipl.c                              |   2 +-
 hw/sparc/leon3.c                            |   2 +-
 hw/sparc/sun4m.c                            |   2 +-
 hw/sparc64/sun4u.c                          |   2 +-
 hw/tricore/tricore_testboard.c              |   2 +-
 hw/xtensa/sim.c                             |   2 +-
 hw/xtensa/xtfpga.c                          |   2 +-
 include/elf/elf-arch.h                      | 109 ++++++++++++++++++++
 include/elf/elf-types.inc.h                 |  63 +++++++++++
 include/{ => elf}/elf.h                     |  42 --------
 include/{hw/elf_ops.h => elf/elf_ops.inc.h} |   9 ++
 include/hw/core/generic-loader.h            |   2 +-
 linux-user/arm/cpu_loop.c                   |   2 +-
 linux-user/elfload.c                        |  32 ++----
 linux-user/main.c                           |   2 +-
 linux-user/mips/cpu_loop.c                  |   2 +-
 linux-user/ppc/signal.c                     |   4 +-
 linux-user/riscv/cpu_loop.c                 |   2 +-
 target/arm/arch_dump.c                      |   2 +-
 target/i386/arch_dump.c                     |   2 +-
 target/ppc/arch_dump.c                      |   2 +-
 target/ppc/kvm.c                            |   2 +-
 target/s390x/arch_dump.c                    |   2 +-
 tcg/arm/tcg-target.inc.c                    |   2 +-
 tcg/ppc/tcg-target.inc.c                    |   2 +-
 tcg/s390/tcg-target.inc.c                   |   2 +-
 tcg/tcg.c                                   |   5 +-
 tests/tcg/configure.sh                      |   1 +
 tests/tcg/multiarch/Makefile.target         |   5 -
 util/getauxval.c                            |   2 +-
 67 files changed, 258 insertions(+), 146 deletions(-)
 create mode 100644 include/elf/elf-arch.h
 create mode 100644 include/elf/elf-types.inc.h
 rename include/{ => elf}/elf.h (98%)
 rename include/{hw/elf_ops.h => elf/elf_ops.inc.h} (98%)

-- 
2.20.1
