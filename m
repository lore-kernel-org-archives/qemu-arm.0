Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b0027323b19ecesm11808233wrt.16.2023.01.10.09.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B81F21FFB7;
	Tue, 10 Jan 2023 17:39:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ed Maste <emaste@freebsd.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 00/26] current maintainer trees (testing/semihosting/plugins)
Date: Tue, 10 Jan 2023 17:38:56 +0000
Message-Id: <20230110173922.265055-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: QeE9oXuDwCVm

Hi All,

I've wrapped up all my maintainer trees into a single branch to
minimise the disruption of multiple pull requests. Most stuff has
already been reviewed but in short we have:

  - some cleanups and tweaks for gitlab
  - a new playbook to install gitlab runners
  - a proposed re-org of the front about section
  - a few semihosting fixes (with docs ;-)
  - a bunch of tsan fixes touching tcg and plugins
  - fixing some plugin races
  - expunging the last vestiges of perl from the build system

The following patches need review:

  tests/tcg: add memory-sve test for aarch64
  semihosting: add semihosting section to the docs
  docs: add a proper feature overview in "About QEMU"
  tests/unit: drop hacky race avoidance in test-io-channel-command
  gitlab: just use plain --cc=clang for custom runner build
  gitlab: add FF_SCRIPT_SECTIONS for timings
  scripts/ci: update gitlab-runner playbook to use latest runner

Alex Bennée (6):
  scripts/ci: update gitlab-runner playbook to use latest runner
  gitlab: just use plain --cc=clang for custom runner build
  tests/unit: drop hacky race avoidance in test-io-channel-command
  docs: add a proper feature overview in "About QEMU"
  semihosting: add semihosting section to the docs
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
  tcg: exclude lookup_tb_ptr from helper instrumentation
  cpu-exec: assert that plugin_mem_cbs is NULL after execution

Evgeny Iakovlev (1):
  semihosting: add O_BINARY flag in host_open for NT compatibility

Keith Packard (1):
  semihosting: Write back semihosting data before completion callback

Marc-André Lureau (8):
  build-sys: fix crlf-ending C code
  .gitlab-ci.d/windows: do not disable opengl
  configure: replace Perl usage with sed
  meson: replace Perl usage with Python
  docs: drop texinfo options
  Update lcitool and fedora to 37
  lcitool: drop perl from QEMU project/dependencies
  lcitool: drop texinfo from QEMU project/dependencies

Mark Cave-Ayland (1):
  gitlab: add FF_SCRIPT_SECTIONS for timings

 docs/about/features.rst                       | 236 ++++++++++++++++++
 docs/about/index.rst                          |  16 +-
 docs/conf.py                                  |  13 -
 docs/devel/tcg-plugins.rst                    |   2 +
 docs/specs/index.rst                          |   1 +
 docs/specs/semihosting.rst                    |  79 ++++++
 docs/system/arm/emulation.rst                 |   2 +
 docs/system/index.rst                         |   2 +
 docs/system/multi-process.rst                 |   2 +
 docs/tools/index.rst                          |   2 +
 docs/user/index.rst                           |   2 +
 configure                                     |   8 +-
 meson.build                                   |   2 +-
 accel/tcg/tb-jmp-cache.h                      |   1 +
 include/qemu/plugin.h                         |  11 +
 include/qemu/thread.h                         |   5 +-
 accel/tcg/cpu-exec.c                          |   5 +-
 accel/tcg/plugin-gen.c                        |  26 +-
 accel/tcg/translator.c                        |  15 +-
 cpu.c                                         |  11 +-
 plugins/core.c                                |  16 +-
 semihosting/syscalls.c                        |  28 +--
 tcg/tcg.c                                     |   6 +-
 tests/unit/test-io-channel-command.c          |  14 +-
 util/qht.c                                    | 103 ++++++--
 .gitlab-ci.d/base.yml                         |   5 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   2 +-
 .gitlab-ci.d/windows.yml                      |   5 +-
 qemu-options.hx                               |  27 +-
 scripts/ci/setup/build-environment.yml        |   1 -
 scripts/ci/setup/gitlab-runner.yml            |  56 +----
 scripts/ci/setup/vars.yml.template            |   2 -
 scripts/shaderinclude.pl                      |  16 --
 scripts/shaderinclude.py                      |  26 ++
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
 .../dockerfiles/debian-tricore-cross.docker   |   1 -
 .../dockerfiles/fedora-win32-cross.docker     |   6 +-
 .../dockerfiles/fedora-win64-cross.docker     |   6 +-
 tests/docker/dockerfiles/fedora.docker        |   6 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   2 -
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 -
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 -
 tests/lcitool/refresh                         |   6 +-
 tests/qapi-schema/meson.build                 |   7 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   7 +
 tests/tcg/aarch64/system/boot.S               |   3 +-
 tests/vm/centos.aarch64                       |   2 +-
 62 files changed, 607 insertions(+), 238 deletions(-)
 create mode 100644 docs/about/features.rst
 create mode 100644 docs/specs/semihosting.rst
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.34.1
