Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f6520sm467109066b.73.2024.10.23.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:34:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EB4FE5F897;
	Wed, 23 Oct 2024 12:34:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	devel@lists.libvirt.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 00/18] maintainer updates (testing, gdbstub, plugins) pre-PR
Date: Wed, 23 Oct 2024 12:33:48 +0100
Message-Id: <20241023113406.1284676-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: PoKd4oAHAzsK

This is an aggregation of three of my maintainer trees which you can
also get from their respective branches (testing/next, gdbstub/next
and plugins/next). It is now ready for a pull request.

Since last post:

  - added r-b tags
  - some minor typo fixes
  - dropped meson plugin contrib build and gdb hook changes

The last thing that still needs review:

  gitlab: make check-[dco|patch] a little more verbose

Alex Bennée (9):
  tests/docker: add NOFETCH env variable for testing
  MAINTAINERS: mention my testing/next tree
  scripts/ci: remove architecture checks for build-environment updates
  accel/tcg: add tracepoints for cpu_loop_exit_atomic
  gitlab: make check-[dco|patch] a little more verbose
  MAINTAINERS: mention my gdbstub/next tree
  config/targets: update aarch64_be-linux-user gdb XML list
  tests/tcg: enable basic testing for aarch64_be-linux-user
  MAINTAINERS: mention my plugins/next tree

Gustavo Romero (2):
  tests/tcg/aarch64: Use raw strings for regexes in test-mte.py
  testing: Enhance gdb probe script

Ilya Leoshkevich (2):
  tests/docker: Fix microblaze atomics
  tests/tcg/x86_64: Add cross-modifying code test

Pierrick Bouvier (5):
  meson: hide tsan related warnings
  docs/devel: update tsan build documentation
  dockerfiles: fix default targets for debian-loongarch-cross
  contrib/plugins: remove Makefile for contrib/plugins
  plugins: fix qemu_plugin_reset

 MAINTAINERS                                   |  3 +
 docs/devel/testing/main.rst                   | 26 +++++-
 configure                                     | 23 ++---
 Makefile                                      | 10 ---
 configs/targets/aarch64_be-linux-user.mak     |  2 +-
 meson.build                                   | 10 ++-
 accel/tcg/plugin-gen.c                        |  4 +
 accel/tcg/user-exec.c                         |  2 +-
 tests/tcg/aarch64_be/hello.c                  | 35 ++++++++
 tests/tcg/x86_64/cross-modifying-code.c       | 80 +++++++++++++++++
 accel/tcg/ldst_atomicity.c.inc                |  9 ++
 .gitlab-ci.d/check-dco.py                     |  5 +-
 .gitlab-ci.d/check-patch.py                   |  5 +-
 accel/tcg/trace-events                        | 12 +++
 contrib/plugins/Makefile                      | 87 -------------------
 scripts/ci/setup/ubuntu/build-environment.yml |  2 -
 scripts/probe-gdb-support.py                  | 75 ++++++++--------
 tests/docker/Makefile.include                 |  5 +-
 .../dockerfiles/debian-loongarch-cross.docker |  4 +-
 .../build-toolchain.sh                        |  8 ++
 .../dockerfiles/debian-toolchain.docker       |  7 ++
 tests/tcg/Makefile.target                     |  7 +-
 tests/tcg/aarch64/gdbstub/test-mte.py         |  4 +-
 tests/tcg/aarch64_be/Makefile.target          | 17 ++++
 tests/tcg/x86_64/Makefile.target              |  4 +
 25 files changed, 273 insertions(+), 173 deletions(-)
 create mode 100644 tests/tcg/aarch64_be/hello.c
 create mode 100644 tests/tcg/x86_64/cross-modifying-code.c
 delete mode 100644 contrib/plugins/Makefile
 create mode 100644 tests/tcg/aarch64_be/Makefile.target

-- 
2.39.5
