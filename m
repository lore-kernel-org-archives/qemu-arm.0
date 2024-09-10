Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd46819sm4453096a12.31.2024.09.10.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:39:01 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6A3215F762;
	Tue, 10 Sep 2024 18:39:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 00/10] Maintainer updates (testing, gdbstub) pre-PR
Date: Tue, 10 Sep 2024 18:38:50 +0100
Message-Id: <20240910173900.4154726-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: dBCyJ+YdDJOX

Hi,

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

I've dropped the TCG plugins from the series so as not to make the
pull request too large. I'll roll a new series once I've sent the PR
for this.

Changes

  - moved mips64le TCG tests to use the debian-all-test-cross
  - fixed some --disable-tcg failures for the MTE patches

The following still need review:

  tests/docker: use debian-all-test-cross for mips64el tests

Alex Bennée (5):
  tests/docker: remove debian-armel-cross
  tests/docker: update debian i686 and mipsel images to bookworm
  tests/docker: use debian-all-test-cross for mips64el tests
  docs/devel: fix duplicate line
  scripts/ci: update the gitlab-runner playbook

Gustavo Romero (5):
  gdbstub: Use specific MMU index when probing MTE addresses
  gdbstub: Add support for MTE in system mode
  tests/guest-debug: Support passing arguments to the GDB test script
  tests/tcg/aarch64: Improve linker script organization
  tests/tcg/aarch64: Extend MTE gdbstub tests to system mode

 docs/devel/testing/main.rst                   |   6 -
 configure                                     |   7 +-
 target/arm/gdbstub64.c                        |  23 ++-
 .gitlab-ci.d/container-cross.yml              |   6 -
 .gitlab-ci.d/crossbuilds.yml                  |   7 -
 scripts/ci/setup/gitlab-runner.yml            |  39 +++-
 .../dockerfiles/debian-armel-cross.docker     | 179 ------------------
 .../dockerfiles/debian-i686-cross.docker      |  10 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  10 +-
 tests/guest-debug/run-test.py                 |   6 +
 tests/guest-debug/test_gdbstub.py             |   5 +
 tests/lcitool/refresh                         |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |  49 ++++-
 tests/tcg/aarch64/Makefile.target             |   3 +-
 tests/tcg/aarch64/gdbstub/test-mte.py         |  71 ++++---
 tests/tcg/aarch64/system/boot.S               |  11 ++
 tests/tcg/aarch64/system/kernel.ld            |  33 ++--
 tests/tcg/aarch64/system/mte.S                | 109 +++++++++++
 18 files changed, 310 insertions(+), 274 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-armel-cross.docker
 create mode 100644 tests/tcg/aarch64/system/mte.S

-- 
2.39.2
