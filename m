Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k22-20020a7bc416000000b00404719b05b5sm11668259wmi.27.2023.10.09.09.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:41:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0F3E81FFBB;
	Mon,  9 Oct 2023 17:41:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/25] October maintainer omnibus pre-PR (tests, gdbstub, plugins)
Date: Mon,  9 Oct 2023 17:40:39 +0100
Message-Id: <20231009164104.369749-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: lRNGhwIk0yuG

Hi,

This wraps up my current testing, gdbstub and plugin trees in an
attempt to do my part to reduce the qemu-devel fire hose. It is pretty
much the same as the September tree except:

  - dropped RFC patches
  - dropped CRIS deprecation patches
  - dropped makefile dependency tweaks
  - tweaked RUNC as per Paolo's suggestion
  - used later version of Marcin's sbsa-ref changes
  - added a FLAKY_TEST removal
  - added tags as appropriate

Now I'm using the pre-PR subject to give people a last chance to
object before I roll a proper pull request later this week.

The following still could do with review:

  contrib/plugins: fix coverity warning in hotblocks
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in cache
  configure: remove gcc version suffixes
  configure: allow user to override docker engine
  tests/docker: make docker engine choice entirely configure driven
  tests/avocado: remove flaky test marking for test_sbsaref_edk2_firmware

Akihiko Odaki (12):
  gdbstub: Fix target_xml initialization
  gdbstub: Fix target.xml response
  plugins: Check if vCPU is realized
  contrib/plugins: Use GRWLock in execlog
  gdbstub: Introduce GDBFeature structure
  target/arm: Move the reference to arm-core.xml
  hw/core/cpu: Return static value with gdb_arch_name()
  gdbstub: Use g_markup_printf_escaped()
  target/arm: Remove references to gdb_has_xml
  target/ppc: Remove references to gdb_has_xml
  gdbstub: Remove gdb_has_xml variable
  gdbstub: Replace gdb_regs with an array

Alex Bennée (9):
  tests/avocado: remove flaky test marking for
    test_sbsaref_edk2_firmware
  tests/lcitool: add swtpm to the package list
  gitlab: shuffle some targets and reduce avocado noise
  tests/docker: make docker engine choice entirely configure driven
  configure: allow user to override docker engine
  configure: remove gcc version suffixes
  contrib/plugins: fix coverity warning in cache
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in hotblocks

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable OpenBSD test on sbsa-ref

Matt Borgerson (1):
  plugins: Set final instruction count in plugin_gen_tb_end

Richard Henderson (2):
  accel/tcg: Add plugin_enabled to DisasContextBase
  target/sh4: Disable decode_gusa when plugins enabled

 MAINTAINERS                                   |  2 +-
 configure                                     | 13 ++-
 meson.build                                   |  2 +-
 gdbstub/internals.h                           |  2 -
 include/exec/gdbstub.h                        | 17 ++--
 include/exec/plugin-gen.h                     |  4 +-
 include/exec/translator.h                     |  2 +
 include/hw/core/cpu.h                         |  4 +-
 target/ppc/internal.h                         |  2 +-
 accel/tcg/plugin-gen.c                        |  6 +-
 accel/tcg/translator.c                        |  3 +-
 contrib/plugins/cache.c                       | 18 ++--
 contrib/plugins/execlog.c                     | 16 ++--
 contrib/plugins/hotblocks.c                   |  2 +-
 contrib/plugins/lockstep.c                    | 13 ++-
 gdbstub/gdbstub.c                             | 95 +++++++++----------
 gdbstub/softmmu.c                             |  2 +-
 plugins/core.c                                |  2 +-
 stubs/gdbstub.c                               |  6 +-
 target/arm/cpu.c                              |  9 +-
 target/arm/cpu64.c                            |  4 +-
 target/arm/gdbstub.c                          | 32 +------
 target/i386/cpu.c                             |  6 +-
 target/loongarch/cpu.c                        |  8 +-
 target/ppc/gdbstub.c                          | 24 +----
 target/riscv/cpu.c                            |  6 +-
 target/s390x/cpu.c                            |  4 +-
 target/sh4/translate.c                        | 41 +++++---
 target/tricore/cpu.c                          |  4 +-
 .gitlab-ci.d/buildtest.yml                    | 15 ++-
 .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
 scripts/feature_to_c.py                       | 48 ++++++++++
 scripts/feature_to_c.sh                       | 69 --------------
 tests/avocado/machine_aarch64_sbsaref.py      | 71 +++++++++++---
 tests/docker/Makefile.include                 |  9 +-
 tests/docker/dockerfiles/alpine.docker        |  1 +
 tests/docker/dockerfiles/centos8.docker       |  1 +
 .../dockerfiles/debian-amd64-cross.docker     |  1 +
 tests/docker/dockerfiles/debian-amd64.docker  |  1 +
 .../dockerfiles/debian-arm64-cross.docker     |  1 +
 .../dockerfiles/debian-armhf-cross.docker     |  1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |  1 +
 .../dockerfiles/debian-s390x-cross.docker     |  1 +
 .../dockerfiles/fedora-win32-cross.docker     |  1 +
 .../dockerfiles/fedora-win64-cross.docker     |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker |  1 +
 tests/docker/dockerfiles/ubuntu2204.docker    |  1 +
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  1 +
 50 files changed, 305 insertions(+), 274 deletions(-)
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.39.2
