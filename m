Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id v20-20020adfa1d4000000b00241cfe6e286sm2456824wrv.98.2023.01.24.10.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:01:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 95DE51FFB7;
	Tue, 24 Jan 2023 18:01:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 00/35] maintainer tree pre-PR (testing/docs/semihosting/plugins)
Date: Tue, 24 Jan 2023 18:00:52 +0000
Message-Id: <20230124180127.1881110-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 4RmZl3rr5rdP

Hi,

This is a roll-up of all my maintainer trees which contains fixes all
over QEMU. I'd hoped to minimise the disruption of multiple pull
requests but in the end spent a lot of time trying to re-create the
win64 cross failure which only occurs on CI. I'm not sure if the
failure is just down to some sort of weird registry issue so I'm kind
of hoping it disappears once merged. However if anyone is able to run
CI on their repo you can try:

  git push-ci -f gitlab

and then manually run:

  win64-fedora-cross-container (in containers)

and then:

  cross-win64-system (in builds)

and let me know if it hangs for you to. In which case I'll just have
to drop the Fedora 37 updates all together. Either way I'll base the
final PR of this series.

A summary of the contents:

  - some cleanups and tweaks for gitlab
  - a new playbook to install gitlab runners
  - a proposed re-org of the front about section
  - a few semihosting fixes (with docs ;-)
  - a bunch of tsan fixes touching tcg and plugins
  - fixing some plugin races
  - expunging the last vestiges of perl from the build system

The following patches need review:

  plugins: Iterate on cb_lists in qemu_plugin_user_exit
  docs: add a new section to outline emulation support (1 acks, 1 sobs)
  gitlab: add lsan suppression file to workaround tcmalloc issues
  scripts/ci: update gitlab-runner playbook to use latest runner

Alex Bennée (12):
  scripts/ci: update gitlab-runner playbook to use latest runner
  gitlab: just use plain --cc=clang for custom runner build
  tests/unit: drop hacky race avoidance in test-io-channel-command
  gitlab: add lsan suppression file to workaround tcmalloc issues
  tests/docker: drop debian-tricore-cross's partial status
  tests/tcg: skip the vma-pthread test on CI
  gitlab: wrap up test results for custom runners
  docs: add hotlinks to about preface text
  docs: add a new section to outline emulation support
  semihosting: add semihosting section to the docs
  docs: add an introduction to the system docs
  tests/tcg: add memory-sve test for aarch64

Emilio Cota (9):
  cpu: free cpu->tb_jmp_cache with RCU
  util/qht: add missing atomic_set(hashes[i])
  thread: de-const qemu_spin_destroy
  util/qht: use striped locks under TSAN
  plugins: make qemu_plugin_user_exit's locking order consistent with
    fork_start's
  plugins: fix optimization in plugin_gen_disable_mem_helpers
  translator: always pair plugin_gen_insn_{start, end} calls
  tcg: exclude non-memory effecting helpers from instrumentation
  cpu-exec: assert that plugin_mem_cbs is NULL after execution

Evgeny Iakovlev (1):
  semihosting: add O_BINARY flag in host_open for NT compatibility

Keith Packard (1):
  semihosting: Write back semihosting data before completion callback

Marc-André Lureau (7):
  build-sys: fix crlf-ending C code
  .gitlab-ci.d/windows: do not disable opengl
  meson: replace Perl usage with Python
  docs: drop texinfo options
  Update lcitool and fedora to 37
  lcitool: drop perl from QEMU project/dependencies
  lcitool: drop texinfo from QEMU project/dependencies

Mark Cave-Ayland (1):
  gitlab: add FF_SCRIPT_SECTIONS for timings

Philippe Mathieu-Daudé (1):
  tests/docker: Install flex in debian-tricore-cross

Richard Henderson (2):
  tests/tcg: Use SIGKILL for timeout
  plugins: Iterate on cb_lists in qemu_plugin_user_exit

Thomas Huth (1):
  MAINTAINERS: Fix the entry for tests/tcg/nios2

 MAINTAINERS                                   |   2 +-
 docs/about/emulation.rst                      | 192 +++++++++++++++
 docs/about/index.rst                          |  17 +-
 docs/conf.py                                  |  13 --
 docs/devel/tcg-plugins.rst                    |   2 +
 docs/interop/live-block-operations.rst        |   2 +
 docs/interop/qemu-qmp-ref.rst                 |   2 +
 docs/system/arm/emulation.rst                 |   2 +
 docs/system/index.rst                         |   4 +-
 docs/system/introduction.rst                  | 220 ++++++++++++++++++
 docs/system/multi-process.rst                 |   2 +
 docs/system/quickstart.rst                    |  21 --
 docs/tools/index.rst                          |   2 +
 docs/user/index.rst                           |   2 +
 meson.build                                   |   2 +-
 accel/tcg/plugin-helpers.h                    |   4 +-
 accel/tcg/tb-jmp-cache.h                      |   1 +
 include/qemu/plugin.h                         |  11 +
 include/qemu/thread.h                         |   5 +-
 include/tcg/tcg.h                             |   2 +
 accel/tcg/cpu-exec.c                          |   5 +-
 accel/tcg/plugin-gen.c                        |  26 ++-
 accel/tcg/translator.c                        |  15 +-
 cpu.c                                         |  11 +-
 plugins/core.c                                |  23 +-
 semihosting/syscalls.c                        |  28 +--
 tcg/tcg.c                                     |   6 +-
 tests/unit/test-io-channel-command.c          |  14 +-
 util/qht.c                                    |  97 ++++++--
 .gitlab-ci.d/base.yml                         |   5 +
 .gitlab-ci.d/buildtest.yml                    |   1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .gitlab-ci.d/custom-runners.yml               |  11 +
 .../custom-runners/ubuntu-20.04-s390x.yml     |  13 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  15 +-
 .gitlab-ci.d/windows.yml                      |   5 +-
 qemu-options.hx                               |  30 ++-
 scripts/ci/setup/build-environment.yml        |   1 -
 scripts/ci/setup/gitlab-runner.yml            |  56 ++---
 scripts/ci/setup/vars.yml.template            |   2 -
 scripts/oss-fuzz/lsan_suppressions.txt        |   2 +
 scripts/shaderinclude.pl                      |  16 --
 scripts/shaderinclude.py                      |  26 +++
 tests/docker/Makefile.include                 |   1 -
 tests/docker/dockerfiles/alpine.docker        |   2 -
 tests/docker/dockerfiles/centos8.docker       |   2 -
 .../dockerfiles/debian-amd64-cross.docker     |   4 +-
 tests/docker/dockerfiles/debian-amd64.docker  |   2 -
 .../dockerfiles/debian-arm64-cross.docker     |   4 +-
 .../dockerfiles/debian-armel-cross.docker     |   4 +-
 .../dockerfiles/debian-armhf-cross.docker     |   4 +-
 .../dockerfiles/debian-mips64el-cross.docker  |   4 +-
 .../dockerfiles/debian-mipsel-cross.docker    |   4 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |   4 +-
 .../dockerfiles/debian-s390x-cross.docker     |   4 +-
 .../dockerfiles/debian-toolchain.docker       |   1 -
 .../dockerfiles/debian-tricore-cross.docker   |   2 +-
 .../dockerfiles/fedora-win32-cross.docker     |   6 +-
 .../dockerfiles/fedora-win64-cross.docker     |   6 +-
 tests/docker/dockerfiles/fedora.docker        |   6 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   2 -
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 -
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 -
 tests/lcitool/refresh                         |   6 +-
 tests/qapi-schema/meson.build                 |   7 +-
 tests/tcg/Makefile.target                     |   4 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   7 +
 tests/tcg/aarch64/system/boot.S               |   3 +-
 tests/tcg/multiarch/Makefile.target           |   9 +
 tests/vm/centos.aarch64                       |   2 +-
 74 files changed, 758 insertions(+), 272 deletions(-)
 create mode 100644 docs/about/emulation.rst
 create mode 100644 docs/system/introduction.rst
 delete mode 100644 docs/system/quickstart.rst
 create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.34.1
