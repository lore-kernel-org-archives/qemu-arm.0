Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d23494a8sm23446666b.35.2024.07.05.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AC8585F876;
	Fri,  5 Jul 2024 09:40:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 00/40] July maintainer updates (32bit, testing, plugins, gdbstub)
Date: Fri,  5 Jul 2024 09:40:07 +0100
Message-Id: <20240705084047.857176-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: QQjSECSvVuCv

Hi,

This is a grab bag of fixes and clean-ups as we swiftly approach the
soft freeze deadline. The i386 TCG fix has been dropped now rth's TCG
clean-ups have been merged. I've also taken a series from Richard that
built on Akihiko's TCG test cleanups. There is one new fix I came
across when doing some gcov testing.

The following still need review:

  plugins/lockstep: clean-up output
  plugins/lockstep: mention the one-insn-per-tb option
  plugins/lockstep: preserve sock_path
  test/plugins: preserve the instruction record over translations
  test/plugin: make insn plugin less noisy by default
  gitlab: don't bother with KVM for TCI builds
  hw/core: ensure kernel_end never gets used undefined
  testing: restore some testing for i686

Akihiko Odaki (6):
  tests/docker: Specify --userns keep-id for Podman
  tests/tcg/aarch64: Explicitly specify register width
  tests/tcg/aarch64: Fix irg operand type
  tests/tcg/aarch64: Do not use x constraint
  tests/tcg/arm: Fix fcvt result messages
  tests/tcg/arm: Manually register allocate half-precision numbers

Alex Bennée (11):
  tests/lcitool: fix debian-i686-cross toolchain prefix
  testing: restore some testing for i686
  tracepoints: move physmem trace points
  hw/core: ensure kernel_end never gets used undefined
  gitlab: don't bother with KVM for TCI builds
  test/plugin: make insn plugin less noisy by default
  test/plugins: preserve the instruction record over translations
  plugins/lockstep: preserve sock_path
  plugins/lockstep: make mixed-mode safe
  plugins/lockstep: mention the one-insn-per-tb option
  plugins/lockstep: clean-up output

Gustavo Romero (11):
  gdbstub: Clean up process_string_cmd
  gdbstub: Move GdbCmdParseEntry into a new header file
  gdbstub: Add support for target-specific stubs
  target/arm: Fix exception case in allocation_tag_mem_probe
  target/arm: Make some MTE helpers widely available
  target/arm: Factor out code for setting MTE TCF0 field
  gdbstub: Make hex conversion function non-internal
  gdbstub: Pass CPU context to command handler
  gdbstub: Use true to set cmd_startswith
  gdbstub: Add support for MTE in user mode
  tests/tcg/aarch64: Add MTE gdbstub tests

Philippe Mathieu-Daudé (3):
  plugins: Ensure vCPU index is assigned in init/exit hooks
  plugins: Free CPUPluginState before destroying vCPU state
  accel/tcg: Move qemu_plugin_vcpu_init__async() to plugins/

Richard Henderson (9):
  tests/tcg/minilib: Constify digits in print_num
  tests/tcg: Adjust variable defintion from cc-option
  tests/tcg/aarch64: Drop -fno-tree-loop-distribute-patterns
  tests/tcg/aarch64: Add -fno-integrated-as for sme
  tests/tcg/arm: Drop -N from LDFLAGS
  tests/tcg/arm: Use -fno-integrated-as for test-arm-iwmmxt
  tests/tcg/arm: Use -march and -mfpu for fcvt
  tests/tcg/arm: Use vmrs/vmsr instead of mcr/mrc
  linux-user/main: Suppress out-of-range comparison warning for clang

 configure                                     |   4 +
 configs/targets/aarch64-linux-user.mak        |   2 +-
 gdbstub/internals.h                           |  23 -
 include/gdbstub/commands.h                    | 103 +++
 include/qemu/plugin.h                         |   3 +
 linux-user/aarch64/mte_user_helper.h          |  32 +
 linux-user/aarch64/target_prctl.h             |  22 +-
 target/arm/internals.h                        |   6 +
 target/arm/tcg/mte_helper.h                   |  66 ++
 contrib/plugins/lockstep.c                    |  23 +-
 gdbstub/gdbstub.c                             | 341 ++++++----
 gdbstub/syscalls.c                            |   7 +-
 gdbstub/system.c                              |   7 +-
 gdbstub/user-target.c                         |  25 +-
 gdbstub/user.c                                |   7 +-
 hw/core/cpu-common.c                          |  14 +-
 hw/core/loader-fit.c                          |   2 +-
 linux-user/aarch64/mte_user_helper.c          |  35 +
 linux-user/main.c                             |   1 +
 linux-user/syscall.c                          |   9 -
 plugins/core.c                                |  10 +-
 system/physmem.c                              |   4 +-
 target/arm/cpu.c                              |   1 +
 target/arm/gdbstub.c                          |  46 ++
 target/arm/gdbstub64.c                        | 223 +++++++
 target/arm/tcg/mte_helper.c                   |  48 +-
 tests/plugin/insn.c                           | 112 +++-
 tests/tcg/aarch64/bti-1.c                     |   6 +-
 tests/tcg/aarch64/bti-3.c                     |   6 +-
 tests/tcg/aarch64/mte-1.c                     |   2 +-
 tests/tcg/aarch64/mte-8.c                     |  99 +++
 tests/tcg/arm/fcvt.c                          |  28 +-
 tests/tcg/minilib/printf.c                    |   2 +-
 .gitlab-ci.d/buildtest.yml                    |   2 +-
 .gitlab-ci.d/crossbuilds.yml                  |  13 +-
 gdb-xml/aarch64-mte.xml                       |  11 +
 linux-user/aarch64/meson.build                |   2 +
 system/trace-events                           |   6 +
 tests/docker/Makefile.include                 |   7 +-
 .../dockerfiles/debian-i686-cross.docker      |   2 +-
 tests/lcitool/refresh                         |   2 +-
 tests/tcg/Makefile.target                     |   2 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   4 +-
 tests/tcg/aarch64/Makefile.target             |  32 +-
 tests/tcg/aarch64/fcvt.ref                    | 604 +++++++++---------
 tests/tcg/aarch64/gdbstub/test-mte.py         |  86 +++
 tests/tcg/arm/Makefile.softmmu-target         |   4 +-
 tests/tcg/arm/Makefile.target                 |  12 +-
 tests/tcg/arm/fcvt.ref                        | 604 +++++++++---------
 trace-events                                  |   5 -
 50 files changed, 1771 insertions(+), 946 deletions(-)
 create mode 100644 include/gdbstub/commands.h
 create mode 100644 linux-user/aarch64/mte_user_helper.h
 create mode 100644 target/arm/tcg/mte_helper.h
 create mode 100644 linux-user/aarch64/mte_user_helper.c
 create mode 100644 tests/tcg/aarch64/mte-8.c
 create mode 100644 gdb-xml/aarch64-mte.xml
 create mode 100644 tests/tcg/aarch64/gdbstub/test-mte.py

-- 
2.39.2
