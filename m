Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906688a00b006ce29973bafsm1220217ejr.211.2022.02.25.09.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F217D1FFB7;
	Fri, 25 Feb 2022 17:20:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/18] testing and semihosting pre-PR
Date: Fri, 25 Feb 2022 17:20:03 +0000
Message-Id: <20220225172021.3493923-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hPj8g3X3HSDY

Hi,

This is the current state of my testing and semihosting trees which I
intend to generate a PR for next week. I'd like to have a clean plate
by the time we hit softfreeze. I'll probably have to drop the sha512 vector
test patches as they break TCI unless someone can figure out what is
going wrong.

The following patches still need review:

 - tests/tcg: completely disable threadcount for sh4
 - tests/tcg: add sha512 test
 - tests/tcg/ppc64: clean-up handling of byte-reverse
 - gitlab: add a new aarch32 custom runner definition
 - scripts/ci: allow for a secondary runner
 - scripts/ci: add build env rules for aarch32 on aarch64
 - tests/docker: update debian-s390x-cross with lcitool
 - tests/lcitool: update to latest version
 - tests/docker: restore TESTS/IMAGES filtering

Alex Bennée (17):
  tests/docker: restore TESTS/IMAGES filtering
  tests/docker: add NOUSER for alpine image
  tests/lcitool: update to latest version
  tests/docker: update debian-arm64-cross with lci-tool
  tests/docker: update debian-s390x-cross with lcitool
  tests/docker: introduce debian-riscv64-test-cross
  scripts/ci: add build env rules for aarch32 on aarch64
  scripts/ci: allow for a secondary runner
  gitlab: add a new aarch32 custom runner definition
  tests/tcg/ppc64: clean-up handling of byte-reverse
  tests/tcg: build sha1-vector with O3 and compare
  tests/tcg: add sha512 test
  tests/tcg: add vectorised sha512 versions
  gitlab: upgrade the job definition for s390x to 20.04
  tests/tcg: completely disable threadcount for sh4
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

Thomas Huth (1):
  travis.yml: Update the s390x jobs to Ubuntu Focal

 docs/devel/ci-jobs.rst.inc                    |   7 +
 include/hw/loader.h                           |  14 +
 hw/core/loader.c                              |  86 ++
 semihosting/arm-compat-semi.c                 | 124 +--
 tests/tcg/aarch64/system/semiheap.c           |  93 ++
 tests/tcg/multiarch/sha512.c                  | 990 ++++++++++++++++++
 .gitlab-ci.d/container-cross.yml              |  20 +-
 .gitlab-ci.d/custom-runners.yml               |   2 +-
 ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} |  28 +-
 .../custom-runners/ubuntu-20.40-aarch32.yml   |  23 +
 .travis.yml                                   |  12 +-
 MAINTAINERS                                   |   1 +
 scripts/ci/setup/build-environment.yml        |  25 +
 scripts/ci/setup/gitlab-runner.yml            |  38 +
 tests/docker/Makefile.include                 |  29 +-
 .../dockerfiles/debian-arm64-cross.docker     | 186 +++-
 .../debian-arm64-test-cross.docker            |  13 -
 .../debian-riscv64-test-cross.docker          |  12 +
 .../dockerfiles/debian-s390x-cross.docker     | 181 +++-
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  16 +
 tests/tcg/aarch64/Makefile.target             |  17 +
 tests/tcg/arm/Makefile.target                 |  17 +
 tests/tcg/configure.sh                        |   4 +-
 tests/tcg/i386/Makefile.target                |   6 +
 tests/tcg/ppc64/Makefile.target               |  20 +-
 tests/tcg/ppc64le/Makefile.target             |   9 +-
 tests/tcg/s390x/Makefile.target               |   9 +
 tests/tcg/sh4/Makefile.target                 |   2 +
 tests/tcg/x86_64/Makefile.target              |   7 +
 33 files changed, 1813 insertions(+), 189 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c
 create mode 100644 tests/tcg/multiarch/sha512.c
 rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
 delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

-- 
2.30.2
