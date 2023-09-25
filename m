Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d608c000000b0031c6e1ea4c7sm12057674wrt.90.2023.09.25.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E44CB1FFBB;
	Mon, 25 Sep 2023 15:48:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 00/31] September maintainer omnibus (tests, gdbstub, plugins)
Date: Mon, 25 Sep 2023 15:48:23 +0100
Message-Id: <20230925144854.1872513-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: iATn4WQRA/WK

Hi,

This wraps up my current testing, gdbstub and plugin trees in an
attempt to do my part to reduce the qemu-devel fire hose.

For testing we have a number of cleanups to configure to better handle
selecting the container engine (removing the ability to dynamically
switch). I had to do this as one of my build boxes has recently
acquired a broken podman install. There are also some updates to
avocado sbsa-ref as well as tweaks to the gitlab setup to minimise the
amount of wheel spinning we do. The deprecation of CRIS is a little
provocative but if we do want to keep it we need to stop relying on a
rapidly dated fedora image to do it. Finally we include the swtpm
package to widen the testing we do through avocado.

The gdbstub updates are from Akihiko and include a bunch of clean-ups
that will hopefully pave the way for another series which allows the
plugins to access register values using the gdb backend to source the
data.

Finally the plugins has a few fixes which includes a tweak to make SH4
atomic modelling more plugin friendly. This allows for Matt's fix to
deal with non-regular instruction encoding spanning pages. I also fix
a number of coverity warnings.

The final time control patches are still RFC and not ready for merging
but I include them for completeness.

The following still need review:

  contrib/plugins: add iops plugin example for cost modelling
  plugins: add time control API
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  qtest: use cpu interface in qtest_clock_warp (1 acks, 1 sobs, 0 tbs)
  contrib/plugins: fix coverity warning in hotblocks
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in cache
  configure: ensure dependency for cross-compile setup
  configure: remove gcc version suffixes
  configure: allow user to override docker engine
  tests/docker: make docker engine choice entirely configure driven
  docs: mark CRIS support as deprecated
  tests/lcitool: add swtpm to the package list

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

Alex Bennée (15):
  tests/lcitool: add swtpm to the package list
  gitlab: shuffle some targets and reduce avocado noise
  docs: mark CRIS support as deprecated
  tests/docker: make docker engine choice entirely configure driven
  configure: allow user to override docker engine
  configure: remove gcc version suffixes
  configure: ensure dependency for cross-compile setup
  contrib/plugins: fix coverity warning in cache
  contrib/plugins: fix coverity warning in lockstep
  contrib/plugins: fix coverity warning in hotblocks
  sysemu: add set_virtual_time to accel ops
  qtest: use cpu interface in qtest_clock_warp
  sysemu: generalise qtest_warp_clock as qemu_clock_advance_virtual_time
  plugins: add time control API
  contrib/plugins: add iops plugin example for cost modelling

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable sbsa-ref/neoverse-v1

Matt Borgerson (1):
  plugins: Set final instruction count in plugin_gen_tb_end

Richard Henderson (2):
  accel/tcg: Add plugin_enabled to DisasContextBase
  target/sh4: Disable decode_gusa when plugins enabled

 MAINTAINERS                                   |   2 +-
 docs/about/deprecated.rst                     |  11 +
 configure                                     |  15 +-
 meson.build                                   |   2 +-
 gdbstub/internals.h                           |   2 -
 include/exec/gdbstub.h                        |  17 +-
 include/exec/plugin-gen.h                     |   4 +-
 include/exec/translator.h                     |   2 +
 include/hw/core/cpu.h                         |   4 +-
 include/qemu/qemu-plugin.h                    |  19 ++
 include/qemu/timer.h                          |  15 +
 include/sysemu/accel-ops.h                    |  18 +-
 include/sysemu/cpu-timers.h                   |  27 +-
 include/sysemu/qtest.h                        |   1 +
 target/ppc/internal.h                         |   2 +-
 accel/qtest/qtest.c                           |   1 +
 accel/tcg/plugin-gen.c                        |   6 +-
 accel/tcg/translator.c                        |   3 +-
 contrib/plugins/cache.c                       |  18 +-
 contrib/plugins/execlog.c                     |  16 +-
 contrib/plugins/hotblocks.c                   |   2 +-
 contrib/plugins/iops.c                        | 261 ++++++++++++++++++
 contrib/plugins/lockstep.c                    |  13 +-
 gdbstub/gdbstub.c                             |  95 +++----
 gdbstub/softmmu.c                             |   2 +-
 plugins/api.c                                 |  28 ++
 plugins/core.c                                |   2 +-
 softmmu/cpus.c                                |  11 +
 softmmu/qtest.c                               |  26 +-
 ...t-virtual-clock.c => cpus-virtual-clock.c} |   5 +
 stubs/gdbstub.c                               |   6 +-
 target/arm/cpu.c                              |   9 +-
 target/arm/cpu64.c                            |   4 +-
 target/arm/gdbstub.c                          |  32 +--
 target/i386/cpu.c                             |   6 +-
 target/loongarch/cpu.c                        |   8 +-
 target/ppc/gdbstub.c                          |  24 +-
 target/riscv/cpu.c                            |   6 +-
 target/s390x/cpu.c                            |   4 +-
 target/sh4/translate.c                        |  41 ++-
 target/tricore/cpu.c                          |   4 +-
 util/qemu-timer.c                             |  26 ++
 .gitlab-ci.d/buildtest.yml                    |  15 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 contrib/plugins/Makefile                      |   1 +
 plugins/qemu-plugins.symbols                  |   2 +
 scripts/feature_to_c.py                       |  48 ++++
 scripts/feature_to_c.sh                       |  69 -----
 stubs/meson.build                             |   2 +-
 tests/avocado/machine_aarch64_sbsaref.py      |  25 +-
 tests/docker/Makefile.include                 |   7 +-
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 .../dockerfiles/debian-amd64-cross.docker     |   1 +
 tests/docker/dockerfiles/debian-amd64.docker  |   1 +
 .../dockerfiles/debian-arm64-cross.docker     |   1 +
 .../dockerfiles/debian-armhf-cross.docker     |   1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 +
 .../dockerfiles/debian-s390x-cross.docker     |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu2204.docker    |   1 +
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 66 files changed, 689 insertions(+), 298 deletions(-)
 create mode 100644 contrib/plugins/iops.c
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

-- 
2.39.2
