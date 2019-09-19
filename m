Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d78sm8889200wmd.47.2019.09.19.10.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ABF461FF87;
	Thu, 19 Sep 2019 18:10:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/16] testing/next (docker/podman, tcg, build fixes)
Date: Thu, 19 Sep 2019 18:09:59 +0100
Message-Id: <20190919171015.12681-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y1g1eZtdc4PL

Hi,

This is the current status of the testing/next queue. It contains a
number of fixes for docker and podman as well as some additional tests
for floating point under TCG I've been experimenting with. With this
iteration I've also added some documentation for the check-tcg
command.

Since v1 there are some additional docker targets for WHPX builds from
Phillipe and a couple of fixes from me to try and get the CI back to
green. There is still an instability that I think was introduced in
the last set of migration patches which is making Travis very unstable
with lots of cancelled builds due to no output. David and I have been
able to replicate slow migration tests which may be the cause but as
of yet we don't have a fix.

As usual notes for individual fixes bellow the --- in the individual
patches.

The following patches need review
  04 - tests docker reduce scary warnings from failed in
  08 - tests tcg re enable linux test for ppc64abi32
  09 - tests tcg add float_madds test to multiarch
  10 - tests tcg add generic version of float_convs
  11 - tests tcg add simple record replay smoke test for
  14 - configure preserve PKG_CONFIG for subdir builds
  15 - docs devel add check tcg to testing.rst
  16 - Makefile fix up qemu ga.8 paths to take in src bu

Alex Bennée (11):
  tests/docker: fix DOCKER_PARTIAL_IMAGES
  tests/docker: reduce scary warnings from failed inspect
  target/ppc: fix signal delivery for ppc64abi32
  tests/tcg: clean-up some comments after the de-tangling
  tests/tcg: re-enable linux-test for ppc64abi32
  tests/tcg: add float_madds test to multiarch
  tests/tcg: add generic version of float_convs
  tests/tcg: add simple record/replay smoke test for aarch64
  configure: preserve PKG_CONFIG for subdir builds
  docs/devel: add "check-tcg" to testing.rst
  Makefile: fix-up qemu-ga.8 paths to take in-src builds into account

John Snow (3):
  tests/docker: add sanitizers back to clang build
  tests/docker: remove python2.7 from docker9-mxe
  podman: fix command invocation

Philippe Mathieu-Daudé (2):
  tests/docker: Add fedora-win10sdk-cross image
  .shippable.yml: Build WHPX enabled binaries

 .shippable.yml                                |   2 +
 Makefile                                      |  32 +-
 configure                                     |   1 +
 docs/devel/testing.rst                        |  62 ++
 linux-user/ppc/signal.c                       |   4 +-
 tests/docker/Makefile.include                 |   3 +-
 tests/docker/docker.py                        |  34 +-
 tests/docker/dockerfiles/debian9-mxe.docker   |   3 +-
 .../dockerfiles/fedora-win10sdk-cross.docker  |  21 +
 tests/docker/test-clang                       |   6 +-
 tests/tcg/Makefile.target                     |  16 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |  21 +
 tests/tcg/aarch64/Makefile.target             |   3 +-
 tests/tcg/aarch64/float_convs.ref             | 748 +++++++++++++++++
 tests/tcg/aarch64/float_madds.ref             | 768 ++++++++++++++++++
 tests/tcg/arm/Makefile.target                 |  16 +-
 tests/tcg/arm/float_convs.ref                 | 748 +++++++++++++++++
 tests/tcg/arm/float_madds.ref                 | 768 ++++++++++++++++++
 tests/tcg/configure.sh                        |   1 +
 tests/tcg/multiarch/Makefile.target           |  23 +-
 tests/tcg/multiarch/float_convs.c             | 105 +++
 tests/tcg/multiarch/float_helpers.c           | 230 ++++++
 tests/tcg/multiarch/float_helpers.h           |  26 +
 tests/tcg/multiarch/float_madds.c             | 103 +++
 24 files changed, 3688 insertions(+), 56 deletions(-)
 create mode 100644 tests/docker/dockerfiles/fedora-win10sdk-cross.docker
 create mode 100755 tests/tcg/aarch64/float_convs.ref
 create mode 100644 tests/tcg/aarch64/float_madds.ref
 create mode 100644 tests/tcg/arm/float_convs.ref
 create mode 100644 tests/tcg/arm/float_madds.ref
 create mode 100644 tests/tcg/multiarch/float_convs.c
 create mode 100644 tests/tcg/multiarch/float_helpers.c
 create mode 100644 tests/tcg/multiarch/float_helpers.h
 create mode 100644 tests/tcg/multiarch/float_madds.c

-- 
2.20.1
