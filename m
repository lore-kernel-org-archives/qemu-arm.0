Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab090575sm75776466b.184.2024.06.28.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:42:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 002B55F7A1;
	Fri, 28 Jun 2024 13:42:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 00/23] July maintainer updates (32bit, testing, plugins, gdbstub)
Date: Fri, 28 Jun 2024 13:42:35 +0100
Message-Id: <20240628124258.832466-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: L5e20tOGiOTI

Hi,

This is a grab bag of fixes and clean-ups as we swiftly approach the
soft freeze deadline. The i386 TCG fix came about when re-enabling the
32 bit host build and finding a regression which was masked by KVM's
presence. As a result I decided to disable KVM in the build anyway as
its TCG most likely to get tripped up by 32/64 bit issues.

The plugins fixes are mostly tweaks I made while hunting the above
bug.

I've also included Gustavo's gdbstub MTE support.

The following still need review:

  tests/tcg/aarch64: Add MTE gdbstub tests
  gdbstub: Add support for MTE in user mode
  gdbstub: Use true to set cmd_startswith
  plugins/lockstep: clean-up output
  plugins/lockstep: mention the one-insn-per-tb option
  plugins/lockstep: make mixed-mode safe
  plugins/lockstep: preserve sock_path
  test/plugins: preserve the instruction record over translations
  test/plugin: make insn plugin less noisy by default
  tracepoints: move physmem trace points
  testing: restore some testing for i686
  target/i386: fix gen_prepare_size_nz condition
  tests/lcitool: fix debian-i686-cross toolchain prefix

Akihiko Odaki (2):
  tests/docker: Specify --userns keep-id for Podman
  tests/tcg/arm: Fix fcvt result messages

Alex Bennée (10):
  tests/lcitool: fix debian-i686-cross toolchain prefix
  target/i386: fix gen_prepare_size_nz condition
  testing: restore some testing for i686
  tracepoints: move physmem trace points
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

 configure                                     |   4 +
 configs/targets/aarch64-linux-user.mak        |   2 +-
 gdbstub/internals.h                           |  23 -
 include/gdbstub/commands.h                    | 103 +++
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
 linux-user/aarch64/mte_user_helper.c          |  35 +
 linux-user/syscall.c                          |   9 -
 system/physmem.c                              |   6 +-
 target/arm/cpu.c                              |   1 +
 target/arm/gdbstub.c                          |  46 ++
 target/arm/gdbstub64.c                        | 223 +++++++
 target/arm/tcg/mte_helper.c                   |  48 +-
 target/i386/tcg/translate.c                   |   2 +-
 tests/plugin/insn.c                           | 112 +++-
 tests/tcg/aarch64/mte-8.c                     |  98 +++
 tests/tcg/arm/fcvt.c                          |   2 +-
 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 gdb-xml/aarch64-mte.xml                       |  11 +
 linux-user/aarch64/meson.build                |   2 +
 system/trace-events                           |   6 +
 tests/docker/Makefile.include                 |   7 +-
 .../dockerfiles/debian-i686-cross.docker      |   2 +-
 tests/lcitool/refresh                         |   2 +-
 tests/tcg/aarch64/Makefile.target             |  14 +-
 tests/tcg/aarch64/fcvt.ref                    | 604 +++++++++---------
 tests/tcg/aarch64/gdbstub/test-mte.py         |  86 +++
 trace-events                                  |   5 -
 36 files changed, 1401 insertions(+), 599 deletions(-)
 create mode 100644 include/gdbstub/commands.h
 create mode 100644 linux-user/aarch64/mte_user_helper.h
 create mode 100644 target/arm/tcg/mte_helper.h
 create mode 100644 linux-user/aarch64/mte_user_helper.c
 create mode 100644 tests/tcg/aarch64/mte-8.c
 create mode 100644 gdb-xml/aarch64-mte.xml
 create mode 100644 tests/tcg/aarch64/gdbstub/test-mte.py

-- 
2.39.2
