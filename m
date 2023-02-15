Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c4f9400b003e200dc15f5sm3020608wmq.42.2023.02.15.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:25:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 68AAB1FFB7;
	Wed, 15 Feb 2023 19:25:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 00/12] testing/next: docker, avocado, unit,
Date: Wed, 15 Feb 2023 19:25:18 +0000
Message-Id: <20230215192530.299263-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gNYjjq7RqFr9

Here is the current status of my testing next. I've had to jump a few
hoops on MacOS as adding socat discovered a unit test failure. This
also includes tuxrun_baselines which is a collection of quick test
images that exercise a wide range of platforms.

The following patches need review:

tests: ensure we export job results for some cross builds
tests: add tuxrun baseline test to avocado
tests: skip the nios2 replay_kernel test
testing: update ubuntu2004 to ubuntu2204
gitlab: extend custom runners with base_job_template
gitlab: reduce default verbosity of cirrus run
tests: be a bit more strict cleaning up fifos
tests: add socat dependency for tests
gitlab: tweak and filter ninja output to reduce build noise

Alex Bennée (10):
  gitlab: tweak and filter ninja output to reduce build noise
  tests/avocado: retire the Aarch64 TCG tests from boot_linux.py
  tests: add socat dependency for tests
  tests: be a bit more strict cleaning up fifos
  gitlab: reduce default verbosity of cirrus run
  gitlab: extend custom runners with base_job_template
  testing: update ubuntu2004 to ubuntu2204
  tests: skip the nios2 replay_kernel test
  tests: add tuxrun baseline test to avocado
  tests: ensure we export job results for some cross builds

Bastian Koppelmann (1):
  tests/docker: Use binaries for debian-tricore-cross

Thomas Huth (1):
  cirrus.yml: Improve the windows_msys2_task

 MAINTAINERS                                   |   1 +
 docs/devel/testing.rst                        |   4 +-
 tests/tcg/tricore/macros.h                    |   2 +-
 tests/unit/test-io-channel-command.c          |  10 +-
 .cirrus.yml                                   |   8 +-
 .gitlab-ci.d/buildtest-template.yml           |   2 +-
 .gitlab-ci.d/buildtest.yml                    |  22 +-
 .gitlab-ci.d/cirrus/build.yml                 |   4 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .gitlab-ci.d/containers.yml                   |   4 +-
 .gitlab-ci.d/crossbuild-template.yml          |  11 +
 .gitlab-ci.d/crossbuilds.yml                  |  12 +-
 .gitlab-ci.d/custom-runners.yml               |   3 +-
 .../custom-runners/ubuntu-20.04-s390x.yml     |  10 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  10 +-
 tests/avocado/boot_linux.py                   |  48 +-
 tests/avocado/machine_aarch64_virt.py         |  64 ++-
 tests/avocado/replay_kernel.py                |   1 +
 tests/avocado/tuxrun_baselines.py             | 423 ++++++++++++++++++
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 .../dockerfiles/debian-amd64-cross.docker     |   1 +
 tests/docker/dockerfiles/debian-amd64.docker  |   1 +
 .../dockerfiles/debian-arm64-cross.docker     |   1 +
 .../dockerfiles/debian-armel-cross.docker     |   1 +
 .../dockerfiles/debian-armhf-cross.docker     |   1 +
 .../dockerfiles/debian-mips64el-cross.docker  |   1 +
 .../dockerfiles/debian-mipsel-cross.docker    |   1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 +
 .../dockerfiles/debian-s390x-cross.docker     |   1 +
 .../dockerfiles/debian-tricore-cross.docker   |  10 +-
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 .../{ubuntu2004.docker => ubuntu2204.docker}  |  17 +-
 tests/docker/test-tsan                        |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  10 +-
 tests/tcg/tricore/Makefile.softmmu-target     |   6 +-
 43 files changed, 589 insertions(+), 119 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

-- 
2.39.1
