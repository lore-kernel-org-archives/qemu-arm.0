Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p18-20020a1c7412000000b00401d6c0505csm2286672wmc.47.2023.09.14.08.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:54:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 62FB21FFBB;
	Thu, 14 Sep 2023 16:54:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/9] testing/next: avocado, gitlab, docker, cirrus
Date: Thu, 14 Sep 2023 16:54:13 +0100
Message-Id: <20230914155422.426639-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: HAq33oBTGvmX

This is mostly focused on getting the tree green again. There are
fixes for timeouts on various platforms. We explicitly disable a few
due to a known regression. Also there is a chance to update our
containers for Bookworm.

I dropped the attempt to migrate from global's htags support as the
lsif-clang source code injester seems broken.

The following still need review:

  tests/docker: Update docker-loongarch-cross toolchain
  gitlab: fix typo/spelling in comments
  tests: update Debian images to Bookworm

Alex Bennée (2):
  tests: update Debian images to Bookworm
  gitlab: fix typo/spelling in comments

Daniel P. Berrangé (4):
  microbit: add missing qtest_quit() call
  qtest: kill orphaned qtest QEMU processes on FreeBSD
  gitlab: make Cirrus CI timeout explicit
  gitlab: make Cirrus CI jobs gating

Nicholas Piggin (1):
  tests/avocado: Fix console data loss

Philippe Mathieu-Daudé (1):
  tests/avocado: Disable MIPS Malta tests due to GitLab issue #1884

Richard Henderson (1):
  tests/docker: Update docker-loongarch-cross toolchain

 tests/qtest/libqtest.c                        |  7 +++++++
 tests/qtest/microbit-test.c                   |  2 ++
 .gitlab-ci.d/base.yml                         |  2 +-
 .gitlab-ci.d/cirrus.yml                       |  4 +++-
 .gitlab-ci.d/cirrus/build.yml                 |  2 ++
 python/qemu/machine/machine.py                | 19 +++++++++++++++++++
 tests/avocado/avocado_qemu/__init__.py        |  2 +-
 tests/avocado/boot_linux_console.py           |  7 +++++++
 tests/avocado/machine_mips_malta.py           |  6 ++++++
 tests/avocado/replay_kernel.py                |  7 +++++++
 tests/avocado/tuxrun_baselines.py             |  4 ++++
 .../dockerfiles/debian-amd64-cross.docker     | 10 +++-------
 tests/docker/dockerfiles/debian-amd64.docker  | 10 +++-------
 .../dockerfiles/debian-arm64-cross.docker     | 10 +++-------
 .../dockerfiles/debian-armel-cross.docker     | 10 +++-------
 .../dockerfiles/debian-armhf-cross.docker     | 10 +++-------
 .../dockerfiles/debian-loongarch-cross.docker |  2 +-
 .../dockerfiles/debian-ppc64el-cross.docker   | 10 +++-------
 .../dockerfiles/debian-s390x-cross.docker     | 10 +++-------
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 +-
 tests/docker/dockerfiles/ubuntu2204.docker    |  2 +-
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/refresh                         | 18 +++++++++---------
 23 files changed, 93 insertions(+), 65 deletions(-)

-- 
2.39.2
