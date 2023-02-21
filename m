Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d434e000000b002c5a1bd527dsm3303024wrr.96.2023.02.21.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DD83B1FFB7;
	Tue, 21 Feb 2023 09:45:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 00/14] testing/next: docker, avocado, unit, gitlab
Date: Tue, 21 Feb 2023 09:45:44 +0000
Message-Id: <20230221094558.2864616-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: XTXm3ivzWkPi

Since the last posting:

  - included Anton's curl fix (to keep CI green)
  - split socat MacOS changes across two patches
  - dropped ninja verbosity patch
  - reduced chattiness of fp-test
    - see https://gitlab.com/qemu-project/berkeley-testfloat-3/-/merge_requests/1
  - usual cleanups bellow the ---

The following patches still need review:

tests: ensure we export job results for some cross builds
tests: add tuxrun baseline test to avocado
tests: skip the nios2 replay_kernel test
tests: don't run benchmarks for the tsan build
gitlab: extend custom runners with base_job_template
tests: make fp-test less chatty when running from test suite
tests: be a bit more strict cleaning up fifos

Alex Bennée (10):
  tests: don't run socat tests on MacOS as well
  tests: add socat dependency for tests
  tests: be a bit more strict cleaning up fifos
  tests: make fp-test less chatty when running from test suite
  gitlab: extend custom runners with base_job_template
  tests: don't run benchmarks for the tsan build
  testing: update ubuntu2004 to ubuntu2204
  tests: skip the nios2 replay_kernel test
  tests: add tuxrun baseline test to avocado
  tests: ensure we export job results for some cross builds

Anton Johansson (1):
  block: Handle curl 7.55.0, 7.85.0 version changes

Bastian Koppelmann (1):
  tests/docker: Use binaries for debian-tricore-cross

Thomas Huth (2):
  gitlab-ci: Use artifacts instead of dumping logs in the Cirrus-CI jobs
  cirrus.yml: Improve the windows_msys2_task

 MAINTAINERS                                   |   1 +
 docs/devel/testing.rst                        |   4 +-
 tests/tcg/tricore/macros.h                    |   2 +-
 block/curl.c                                  |  44 +-
 tests/fp/fp-test.c                            |  19 +-
 tests/unit/test-io-channel-command.c          |  10 +-
 .cirrus.yml                                   |   8 +-
 .gitlab-ci.d/buildtest.yml                    |  23 +-
 .gitlab-ci.d/cirrus/build.yml                 |   7 +-
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
 tests/docker/dockerfiles/ubuntu2004.docker    |   4 +-
 tests/docker/dockerfiles/ubuntu2204.docker    | 147 ++++++
 tests/docker/test-tsan                        |   2 +-
 tests/fp/berkeley-testfloat-3                 |   2 +-
 tests/fp/meson.build                          |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  11 +-
 tests/tcg/tricore/Makefile.softmmu-target     |   6 +-
 45 files changed, 720 insertions(+), 80 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100644 tests/docker/dockerfiles/ubuntu2204.docker

-- 
2.39.1
