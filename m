Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe2ca000000b0031272fced4dsm18937313wrj.52.2023.06.30.11.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:04:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E0F7E1FFBB;
	Fri, 30 Jun 2023 19:04:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v4 00/38] maintainer omnibus: testing, fuzz, plugins, documentation, gdbstub (pre-PR)
Date: Fri, 30 Jun 2023 19:03:45 +0100
Message-Id: <20230630180423.558337-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: rg2DJvWWWjrG

As softfreeze is fast approaching I thought it would be work combining
my various trees into an omnibus series to ease the review and
merging.

The testing updates exposed a number of latent leaks that confused the
oss-fuzz jobs (hence the test-fuzz addition to help debug that). This
also includes some minor plugin updates and finally some documentation
updates that clean-up and expose the QOM and QDEV APIs which are so
core to emulating anything in QEMU.

I was intending to roll the PR from the last post but as there is
still un-reviewed stuff and some changes I'd missed from previous
reviews so I though it was worth one last posting. I'll roll on
Monday.

v2
  - applied a bunch of review tags
  - added missing doc suggestions from Paolo
  - tweaked the plugin fix for CI

v3
  - few more tags
  - checkpatch cleanups
  - rolled in gdbstub/next

v4
  - added #ifdef CONFIG_TCG to the arm_casq_ptw
  - fixed plugin memory instrumentation with new helper for mmu access
  - added Thomas' test_arm_bpim2u_gmac tweak
  - moved pkgs from riscv64-cross patch to earlier qemu-minimal patch

The following are still missing review:

 - gdbstub: lightly refactor connection to avoid snprintf
 - tests/docker: convert riscv64-cross to lcitool
 - tests/lcitool: introduce qemu-minimal
 - tests/lcitool: add an explicit gcc-native package (1 acks, 1 sobs, 0 tbs)
 - tests/lcitool: update to latest version (1 acks, 1 sobs, 0 tbs)
 - tests/qtests: clean-up and fix leak in generic_fuzz

Alex Bennée (22):
  gitlab: reduce testing scope of check-gcov
  tests/tcg: add mechanism to handle plugin arguments
  qemu-keymap: properly check return from xkb_keymap_mod_get_index
  scripts/oss-fuzz: add a suppression for keymap
  tests/qtests: clean-up and fix leak in generic_fuzz
  tests/docker: add test-fuzz
  Makefile: add lcitool-refresh to UNCHECKED_GOALS
  tests/lcitool: update to latest version
  tests/lcitool: add an explicit gcc-native package
  tests/lcitool: introduce qemu-minimal
  tests/docker: convert riscv64-cross to lcitool
  target/arm: make arm_casq_ptw CONFIG_TCG only
  plugins: force slow path when plugins instrument memory ops
  plugins: fix memory leak while parsing options
  plugins: update lockstep to use g_memdup2
  docs/devel: add some front matter to the devel index
  include/migration: mark vmstate_register() as a legacy function
  include/hw/qdev-core: fixup kerneldoc annotations
  docs/devel: split qom-api reference into new file
  docs/devel: introduce some key concepts for QOM development
  gdbstub: lightly refactor connection to avoid snprintf
  gdbstub: clean-up vcont handling to avoid goto

Ani Sinha (1):
  docs/devel: remind developers to run CI container pipeline when
    updating images

Daniel P. Berrangé (2):
  gitlab: explicit set artifacts publishing criteria
  gitlab: ensure coverage job also publishes meson log

Erik Skultety (1):
  tests/lcitool: Bump fedora container versions

Ilya Leoshkevich (8):
  linux-user: Expose do_guest_openat() and do_guest_readlink()
  linux-user: Add "safe" parameter to do_guest_openat()
  linux-user: Emulate /proc/self/smaps
  gdbstub: Expose gdb_get_process() and gdb_get_first_cpu_in_process()
  gdbstub: Report the actual qemu-user pid
  gdbstub: Add support for info proc mappings
  docs: Document security implications of debugging
  tests/tcg: Add a test for info proc mappings

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable sbsa-ref/max

Nicholas Piggin (1):
  gdbstub: Permit reverse step/break to provide stop response

Philippe Mathieu-Daudé (1):
  docs/devel/qom.rst: Correct code style

Thomas Huth (1):
  tests/avocado: Make the test_arm_bpim2u_gmac test more reliable

 MAINTAINERS                                   |   1 +
 docs/devel/index-api.rst                      |   2 +
 docs/devel/index-process.rst                  |   2 +
 docs/devel/index-tcg.rst                      |   2 +
 docs/devel/index.rst                          |  24 +-
 docs/devel/qdev-api.rst                       |   7 +
 docs/devel/qom-api.rst                        |   9 +
 docs/devel/qom.rst                            |  65 +++-
 docs/devel/tcg.rst                            |   2 +
 docs/devel/testing.rst                        |   6 +
 docs/system/gdb.rst                           |  15 +
 Makefile                                      |   2 +-
 gdbstub/internals.h                           |   7 +
 include/exec/cpu-all.h                        |   2 +-
 include/exec/exec-all.h                       |  23 ++
 include/hw/core/cpu.h                         |  17 +
 include/hw/qdev-core.h                        | 368 ++++++++++++------
 include/migration/vmstate.h                   |  10 +-
 linux-user/qemu.h                             |   3 +
 accel/tcg/cputlb.c                            |  41 +-
 accel/tcg/user-exec.c                         |   8 +-
 contrib/plugins/cache.c                       |   2 +-
 contrib/plugins/drcov.c                       |   2 +-
 contrib/plugins/execlog.c                     |   2 +-
 contrib/plugins/hotblocks.c                   |   2 +-
 contrib/plugins/hotpages.c                    |   2 +-
 contrib/plugins/howvec.c                      |   2 +-
 contrib/plugins/hwprofile.c                   |   2 +-
 contrib/plugins/lockstep.c                    |   4 +-
 gdbstub/gdbstub.c                             | 115 ++++--
 gdbstub/softmmu.c                             |  19 +-
 gdbstub/user-target.c                         | 137 +++++++
 linux-user/syscall.c                          | 128 ++++--
 qemu-keymap.c                                 |  24 +-
 target/arm/ptw.c                              |  18 +-
 target/arm/tcg/sve_helper.c                   |   4 -
 tests/plugin/bb.c                             |   2 +-
 tests/plugin/insn.c                           |   2 +-
 tests/plugin/mem.c                            |   2 +-
 tests/plugin/syscall.c                        |   2 +-
 tests/qtest/fuzz/generic_fuzz.c               |  13 +-
 .gitlab-ci.d/buildtest-template.yml           |   4 +-
 .gitlab-ci.d/buildtest.yml                    |   7 +-
 .gitlab-ci.d/crossbuild-template.yml          |   1 +
 .gitlab-ci.d/crossbuilds.yml                  |   2 +
 .gitlab-ci.d/opensbi.yml                      |   1 +
 scripts/oss-fuzz/lsan_suppressions.txt        |   3 +
 tests/avocado/boot_linux_console.py           |   4 +-
 tests/avocado/machine_aarch64_sbsaref.py      |  23 +-
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 .../dockerfiles/debian-amd64-cross.docker     |   1 +
 .../dockerfiles/debian-arm64-cross.docker     |   1 +
 .../dockerfiles/debian-armel-cross.docker     |   1 +
 .../dockerfiles/debian-armhf-cross.docker     |   1 +
 .../dockerfiles/debian-mips64el-cross.docker  |   1 +
 .../dockerfiles/debian-mipsel-cross.docker    |   1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 +
 .../dockerfiles/debian-riscv64-cross.docker   | 119 +++---
 .../dockerfiles/debian-s390x-cross.docker     |   1 +
 .../dockerfiles/fedora-win32-cross.docker     |   5 +-
 .../dockerfiles/fedora-win64-cross.docker     |   5 +-
 tests/docker/dockerfiles/fedora.docker        |   4 +-
 tests/docker/test-fuzz                        |  28 ++
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu-minimal.yml       |  27 ++
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  18 +-
 tests/tcg/Makefile.target                     |   8 +-
 tests/tcg/aarch64/Makefile.target             |   8 +
 tests/tcg/multiarch/Makefile.target           |   9 +-
 .../multiarch/gdbstub/test-proc-mappings.py   |  65 ++++
 71 files changed, 1125 insertions(+), 331 deletions(-)
 create mode 100644 docs/devel/qdev-api.rst
 create mode 100644 docs/devel/qom-api.rst
 create mode 100755 tests/docker/test-fuzz
 create mode 100644 tests/lcitool/projects/qemu-minimal.yml
 create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py

-- 
2.39.2
