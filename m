Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f6-20020a7bc8c6000000b004030e8ff964sm17695496wml.34.2023.11.20.07.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F15A0655DF;
	Mon, 20 Nov 2023 15:08:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 00/14] random fixes for 8.2 pre-PR (tests, plugins, docs, semihosting)
Date: Mon, 20 Nov 2023 15:08:19 +0000
Message-Id: <20231120150833.2552739-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: mNX/QC0tpQlg

I've just been trying to clear some of the bugs against various
subsystems. These are mostly testing changes and a minor tweak I found
while checking up on semihosting behaviour. Enabling arm-softmmu
check-tcg tests expands our testing abilities slightly for the 32 bit
side of the family.

For v2
------

 - fixed up register test for ppc64/s390x
 - added gdbstub doc patch
 - review comments for arm-softmmu testing
 - changed handling of "native" cross for linux-user

I intend to roll the PR on Wednesday.

The following need still review:

  tests/tcg: finesse the registers check for "hidden" regs
  configure: don't try a "native" cross for linux-user
  tests/tcg: enable semiconsole test for Arm
  tests/tcg: enable arm softmmu tests
  docs/system: clarify limits of using gdbstub in system emulation
  docs/emulation: expand warning about semihosting
  tests/tcg: fixup Aarch64 semiconsole test

Alex Bennée (10):
  tests/docker: merge debian-native with debian-amd64
  tests/tcg: fixup Aarch64 semiconsole test
  docs/emulation: expand warning about semihosting
  docs/system: clarify limits of using gdbstub in system emulation
  hw/core: skip loading debug on all failures
  testing: move arm system tests into their own folder
  tests/tcg: enable arm softmmu tests
  tests/tcg: enable semiconsole test for Arm
  configure: don't try a "native" cross for linux-user
  tests/tcg: finesse the registers check for "hidden" regs

Daniel P. Berrangé (1):
  tests/docker: replace fedora-i386 with debian-i686

Greg Manning (1):
  plugins: fix win plugin tests on cross compile

Philippe Mathieu-Daudé (2):
  .gitlab-ci.d/cirrus: Upgrade macOS to 13 (Ventura)
  target/nios2: Deprecate the Nios II architecture

 docs/about/deprecated.rst                     |  15 +
 docs/about/emulation.rst                      |   5 +-
 docs/system/gdb.rst                           |  13 +-
 configure                                     |  27 +-
 hw/core/loader.c                              |   2 +-
 hw/nios2/10m50_devboard.c                     |   1 +
 hw/nios2/generic_nommu.c                      |   1 +
 tests/tcg/arm/system/semiconsole.c            |  42 +++
 .gitlab-ci.d/buildtest.yml                    |  12 +-
 .gitlab-ci.d/cirrus.yml                       |   6 +-
 .../cirrus/{macos-12.vars => macos-13.vars}   |   2 +-
 .gitlab-ci.d/container-cross.yml              |  11 +-
 .gitlab-ci.d/containers.yml                   |   2 +-
 .gitlab-ci.d/crossbuilds.yml                  |  14 +-
 contrib/plugins/Makefile                      |   2 +-
 plugins/meson.build                           |   2 +-
 tests/docker/Makefile.include                 |   3 -
 .../dockerfiles/debian-i686-cross.docker      | 182 +++++++++++
 tests/docker/dockerfiles/debian-native.docker |  54 ----
 .../{debian-amd64.docker => debian.docker}    |   7 +-
 .../dockerfiles/fedora-i386-cross.docker      |  40 ---
 tests/lcitool/refresh                         |  18 +-
 tests/plugin/meson.build                      |   3 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   5 +-
 tests/tcg/arm/Makefile.softmmu-target         |  76 ++++-
 tests/tcg/arm/system/boot.S                   | 301 ++++++++++++++++++
 tests/tcg/arm/system/kernel.ld                |  24 ++
 .../tcg/arm/{ => system}/test-armv6m-undef.S  |   0
 .../tcg/arm/{ => system}/test-armv6m-undef.ld |   0
 tests/tcg/multiarch/gdbstub/registers.py      |  87 +++--
 tests/tcg/ppc64/Makefile.target               |   7 -
 tests/tcg/s390x/Makefile.target               |   4 -
 32 files changed, 775 insertions(+), 193 deletions(-)
 create mode 100644 tests/tcg/arm/system/semiconsole.c
 rename .gitlab-ci.d/cirrus/{macos-12.vars => macos-13.vars} (95%)
 create mode 100644 tests/docker/dockerfiles/debian-i686-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-native.docker
 rename tests/docker/dockerfiles/{debian-amd64.docker => debian.docker} (96%)
 delete mode 100644 tests/docker/dockerfiles/fedora-i386-cross.docker
 create mode 100644 tests/tcg/arm/system/boot.S
 create mode 100644 tests/tcg/arm/system/kernel.ld
 rename tests/tcg/arm/{ => system}/test-armv6m-undef.S (100%)
 rename tests/tcg/arm/{ => system}/test-armv6m-undef.ld (100%)

-- 
2.39.2
