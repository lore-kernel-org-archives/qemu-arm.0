Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced1bfsm485811966b.154.2024.09.10.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9B51C5F762;
	Tue, 10 Sep 2024 15:07:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 00/26] Maintainer updates (testing, gdbstub, plugins)
Date: Tue, 10 Sep 2024 15:07:07 +0100
Message-Id: <20240910140733.4007719-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Ax1tqVNXrhC9

Hi,

Here is the current state of my maintainer trees.

Testing

I've updated a number of the docker containers to deal with breakages
in the crossdev environments as bullseye moves to LTS. I've dropped
the armel environment which doesn't really add much to the armhf cross
build we have that works. i686 and mipsel cross containers are bumped
up to bookworm. Currently mips64el is still broken.

gdbstub

This brings in Gustavo's patches to support MTE for system mode
expanding on the previously implemented user mode support.

plugins

I start by deprecating some options that don't make much sense for
instrumentation including 32 bit and TCI support. They will still work
but there are caveats and it doesn't seem worth wasting CI time
keeping track of them.

There are a couple of new plugins including some useful analysis ones.
The bbv plugin can generate files that can be fed into simpoint. The
cflow plugin I've posted before separately but takes advantage of the
new conditional and store helpers to try and be more efficient tracing
control flow.

Finally there is not one but two memory APIs. Pierrick's updates to
the main memory instrumentation now makes values available to the
plugins and should be used if you absolutely want to track what value
was read or stored. I've added a softmmu test case building on
memory.c and I'll merge the updated linux-user test case once its been
re-spun.

Rowan's API provides a more direct access through the existing debug
API but comes with the caveats that it should only used on memory you
don't expect to be changing. The example provided allows for the
contents of syscalls to be probed at the syscall point.

Finally there is a RFC for a gdbstub hook which I mostly wrote while I
was debugging weirdness in the memory stuff. I'll probably drop it
before the PR and let it cook a bit more on plugins/next.

The following still need review:

  plugins: add ability to register a GDB triggered callback
  util/timer: avoid deadlock when shutting down
  tests/tcg: add a system test to check memory instrumentation
  tests/tcg: only read/write 64 bit words on 64 bit systems
  tests/tcg: clean up output of memory system test
  contrib/plugins: control flow plugin
  deprecation: don't enable TCG plugins by default with TCI
  deprecation: don't enable TCG plugins by default on 32 bit hosts
  scripts/ci: update the gitlab-runner playbook
  docs/devel: fix duplicate line
  tests/docker: update debian i686 and mipsel images to bookworm
  tests/docker: remove debian-armel-cross

Akihiko Odaki (1):
  contrib/plugins: Add a plugin to generate basic block vectors

Alex Bennée (12):
  tests/docker: remove debian-armel-cross
  tests/docker: update debian i686 and mipsel images to bookworm
  docs/devel: fix duplicate line
  scripts/ci: update the gitlab-runner playbook
  deprecation: don't enable TCG plugins by default on 32 bit hosts
  deprecation: don't enable TCG plugins by default with TCI
  contrib/plugins: control flow plugin
  tests/tcg: clean up output of memory system test
  tests/tcg: only read/write 64 bit words on 64 bit systems
  tests/tcg: add a system test to check memory instrumentation
  util/timer: avoid deadlock when shutting down
  plugins: add ability to register a GDB triggered callback

Gustavo Romero (5):
  gdbstub: Use specific MMU index when probing MTE addresses
  gdbstub: Add support for MTE in system mode
  tests/guest-debug: Support passing arguments to the GDB test script
  tests/tcg/aarch64: Improve linker script organization
  tests/tcg/aarch64: Extend MTE gdbstub tests to system mode

Pierrick Bouvier (5):
  plugins: save value during memory accesses
  plugins: extend API to get latest memory value accessed
  tests/tcg: add mechanism to run specific tests with plugins
  tests/tcg: allow to check output of plugins
  tests/plugin/mem: add option to print memory accesses

Rowan Hart (2):
  plugins: add plugin API to read guest memory
  plugins: add option to dump write argument to syscall plugin

Thomas Huth (1):
  contrib/plugins/Makefile: Add a 'distclean' target

 docs/about/deprecated.rst                     |  19 +
 docs/about/emulation.rst                      |  44 +-
 docs/devel/testing/main.rst                   |   6 -
 configure                                     |  37 +-
 accel/tcg/atomic_template.h                   |  66 ++-
 include/hw/core/cpu.h                         |   4 +
 include/qemu/plugin-event.h                   |   1 +
 include/qemu/plugin.h                         |   4 +
 include/qemu/qemu-plugin.h                    |  80 +++-
 plugins/plugin.h                              |   9 +
 contrib/plugins/bbv.c                         | 158 +++++++
 contrib/plugins/cflow.c                       | 413 ++++++++++++++++++
 plugins/api.c                                 |  71 +++
 plugins/core.c                                |  43 ++
 target/arm/gdbstub64.c                        |  21 +-
 tcg/tcg-op-ldst.c                             |  66 ++-
 tests/tcg/multiarch/system/memory.c           | 123 ++++--
 tests/tcg/plugins/mem.c                       | 254 ++++++++++-
 tests/tcg/plugins/syscall.c                   | 117 +++++
 util/qemu-timer.c                             |  14 +-
 accel/tcg/atomic_common.c.inc                 |  13 +-
 accel/tcg/ldst_common.c.inc                   |  38 +-
 .gitlab-ci.d/buildtest.yml                    |   2 +
 .gitlab-ci.d/container-cross.yml              |   6 -
 .gitlab-ci.d/crossbuilds.yml                  |   7 -
 contrib/plugins/Makefile                      |   4 +-
 plugins/qemu-plugins.symbols                  |   3 +
 scripts/ci/setup/gitlab-runner.yml            |  39 +-
 .../dockerfiles/debian-armel-cross.docker     | 179 --------
 .../dockerfiles/debian-i686-cross.docker      |  10 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  10 +-
 tests/guest-debug/run-test.py                 |   6 +
 tests/guest-debug/test_gdbstub.py             |   5 +
 tests/lcitool/refresh                         |  10 +-
 tests/tcg/Makefile.target                     |  12 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |  49 ++-
 tests/tcg/aarch64/Makefile.target             |   3 +-
 tests/tcg/aarch64/gdbstub/test-mte.py         |  71 ++-
 tests/tcg/aarch64/system/boot.S               |  11 +
 tests/tcg/aarch64/system/kernel.ld            |  33 +-
 tests/tcg/aarch64/system/mte.S                | 109 +++++
 tests/tcg/alpha/Makefile.softmmu-target       |   2 +-
 .../multiarch/system/Makefile.softmmu-target  |   6 +
 .../system/validate-memory-counts.py          | 115 +++++
 44 files changed, 1935 insertions(+), 358 deletions(-)
 create mode 100644 contrib/plugins/bbv.c
 create mode 100644 contrib/plugins/cflow.c
 delete mode 100644 tests/docker/dockerfiles/debian-armel-cross.docker
 create mode 100644 tests/tcg/aarch64/system/mte.S
 create mode 100755 tests/tcg/multiarch/system/validate-memory-counts.py

-- 
2.39.2
