Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i8sm4197675wrw.36.2019.09.17.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 11:41:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 71BAA1FF87;
	Tue, 17 Sep 2019 19:41:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/9] testing/next (docker,podman,float)
Date: Tue, 17 Sep 2019 19:41:00 +0100
Message-Id: <20190917184109.12564-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: b8Qqle9jVJr0

Hi,

This is the current status of the testing/next queue. It contains a
number of fixes for docker and podman as well as some additional tests
for floating point under TCG I've been experimenting with.

Although we have reasonable confidence in large chunks of the core
softfloat code thanks to check-softfloat there is a wide range of
guest specific behaviour. I've written a couple of tests while trying
to generalise test cases for some PPC bugs and have tried to make them
multiarch so they can run on all targets. To be fully effective a
reference trace needs to be added for each target it exercises.

I was a little worried about the impact of adding reference files
after the test-i386-fprem debacle (which was around 64M). However the
new references files are ~32-80k per test per target which is fairly
favourable considering tests/qemu-iotests contains around 10Mb of text
files. Git should do a fairly good job at compressing the common stuff
anyway.

If other architecture maintainers want to run the tests on known good
hardware we can add them to the appropriate places in tests/tcg.

Alex Bennée (7):
  tests/docker: fix DOCKER_PARTIAL_IMAGES
  target/ppc: fix signal delivery for ppc64abi32
  tests/tcg: clean-up some comments after the de-tangling
  tests/tcg: re-enable linux-test for ppc64abi32
  tests/tcg: add float_madds test to multiarch
  tests/tcg: add generic version of float_convs
  tests/tcg: add refs for PPC float_[convs|madds] tests (FAILS TESTS)

John Snow (2):
  tests/docker: add sanitizers back to clang build
  podman: fix command invocation

 linux-user/ppc/signal.c              |   4 +-
 tests/docker/Makefile.include        |   2 +-
 tests/docker/docker.py               |   2 +-
 tests/docker/test-clang              |   6 +-
 tests/tcg/Makefile.target            |  16 +-
 tests/tcg/aarch64/Makefile.target    |   3 +-
 tests/tcg/aarch64/float_convs.ref    | 748 ++++++++++++++++++++++
 tests/tcg/aarch64/float_madds.ref    | 892 +++++++++++++++++++++++++++
 tests/tcg/arm/Makefile.target        |  16 +-
 tests/tcg/arm/float_convs.ref        | 748 ++++++++++++++++++++++
 tests/tcg/arm/float_madds.ref        | 892 +++++++++++++++++++++++++++
 tests/tcg/configure.sh               |   1 +
 tests/tcg/multiarch/Makefile.target  |  23 +-
 tests/tcg/multiarch/float_convs.c    | 102 +++
 tests/tcg/multiarch/float_helpers.c  | 275 +++++++++
 tests/tcg/multiarch/float_helpers.h  |  31 +
 tests/tcg/multiarch/float_madds.c    | 104 ++++
 tests/tcg/ppc/float_convs.ref        | 748 ++++++++++++++++++++++
 tests/tcg/ppc/float_madds.ref        | 892 +++++++++++++++++++++++++++
 tests/tcg/ppc64/float_convs.ref      | 748 ++++++++++++++++++++++
 tests/tcg/ppc64/float_madds.ref      | 892 +++++++++++++++++++++++++++
 tests/tcg/ppc64abi32/float_convs.ref | 748 ++++++++++++++++++++++
 tests/tcg/ppc64abi32/float_madds.ref | 892 +++++++++++++++++++++++++++
 23 files changed, 8759 insertions(+), 26 deletions(-)
 create mode 100755 tests/tcg/aarch64/float_convs.ref
 create mode 100644 tests/tcg/aarch64/float_madds.ref
 create mode 100644 tests/tcg/arm/float_convs.ref
 create mode 100644 tests/tcg/arm/float_madds.ref
 create mode 100644 tests/tcg/multiarch/float_convs.c
 create mode 100644 tests/tcg/multiarch/float_helpers.c
 create mode 100644 tests/tcg/multiarch/float_helpers.h
 create mode 100644 tests/tcg/multiarch/float_madds.c
 create mode 100644 tests/tcg/ppc/float_convs.ref
 create mode 100644 tests/tcg/ppc/float_madds.ref
 create mode 100644 tests/tcg/ppc64/float_convs.ref
 create mode 100644 tests/tcg/ppc64/float_madds.ref
 create mode 100644 tests/tcg/ppc64abi32/float_convs.ref
 create mode 100644 tests/tcg/ppc64abi32/float_madds.ref

-- 
2.20.1
