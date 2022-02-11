Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 5sm22328ejr.200.2022.02.11.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 08:03:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9A2F21FFB7;
	Fri, 11 Feb 2022 16:03:09 +0000 (GMT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/11] testing/next (docker, lcitool, ci, tcg)
Date: Fri, 11 Feb 2022 16:02:58 +0000
Message-Id: <20220211160309.335014-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g8URa0+AnGF6

Hi,

This is the current state of my testing/next tree which introduces a
few different things:

 - some cleanups to IMAGE/TEST filtering
 - use lcitool to generate a new debian-arm64-cross
 - a messy attempt to enable aarch32 gitlab runners
 - some tests to better exercise TCGv_vec code

All patches could do with some review.

Alex Bennée (11):
  tests/docker: restore TESTS/IMAGES filtering
  tests/docker: add NOUSER for alpine image
  tests/lcitool: update to latest version
  tests/docker: update debian-arm64-cross with lci-tool
  tests/docker: introduce debian-riscv64-test-cross
  scripts/ci: add build env rules for aarch32 on aarch64
  scripts/ci: allow for a secondary runner
  gitlab: add a new aarch32 custom runner definition
  tests/tcg: build sha1-vector with O3 and compare
  tests/tcg: add sha512 test
  tests/tcg: add vectorised sha512 versions

 docs/devel/ci-jobs.rst.inc                    |   7 +
 tests/tcg/multiarch/sha512.c                  | 990 ++++++++++++++++++
 .gitlab-ci.d/container-cross.yml              |  17 +-
 .../custom-runners/ubuntu-20.40-aarch32.yml   |  23 +
 scripts/ci/setup/build-environment.yml        |  25 +
 scripts/ci/setup/gitlab-runner.yml            |  34 +
 tests/docker/Makefile.include                 |  28 +-
 .../dockerfiles/debian-arm64-cross.docker     | 186 +++-
 .../debian-arm64-test-cross.docker            |  13 -
 .../debian-riscv64-test-cross.docker          |  12 +
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  11 +
 tests/tcg/aarch64/Makefile.target             |  17 +
 tests/tcg/arm/Makefile.target                 |  17 +
 tests/tcg/configure.sh                        |   4 +-
 tests/tcg/i386/Makefile.target                |   6 +
 tests/tcg/ppc64le/Makefile.target             |   5 +-
 tests/tcg/s390x/Makefile.target               |   9 +
 tests/tcg/x86_64/Makefile.target              |   7 +
 22 files changed, 1353 insertions(+), 69 deletions(-)
 create mode 100644 tests/tcg/multiarch/sha512.c
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
 delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

-- 
2.30.2
