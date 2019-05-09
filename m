Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v1sm1558545wrd.47.2019.05.09.09.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 09:59:12 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0C04D1FF87;
	Thu,  9 May 2019 17:59:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/23] current testing/next queue (docker/system & io tests)
Date: Thu,  9 May 2019 17:58:48 +0100
Message-Id: <20190509165912.10512-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OinnPWs/70d8


Hi,

This is the current status of my testing/next tree which I'd like to
send a PR for next week. It contains a few distinct things:

 - Various docker updates
 - More softmmu system tests enablement (inc aarch64/alpha)
 - Thomas' qemu-iotests (with my check output tweaks)

To make the system test experience a little better I've enabled
chardev support for semihosting so the output can be redirected like
other serial devices.

I've included the iotest stuff as its enabled for CI but if the block
guys want to take it through their trees now is the time to shout
about it. The format output patch now attempts to preserve old
behaviour when called directly although it's not exactly the same.

The following patches need review
  patch 0005/semihosting enable chardev backed output.patch
  patch 0006/editorconfig add settings for .s .S files.patch
  patch 0007/tests tcg aarch64 add system boot.S.patch
  patch 0012/.travis.yml enable aarch64 softmmu and alpha soft.patch
  patch 0022/tests qemu iotests re format output to for make c.patch


Alex Bennée (13):
  tests/tcg/multiarch: add support for multiarch system tests
  tests/tcg/multiarch: add hello world system test
  semihosting: enable chardev backed output
  editorconfig: add settings for .s/.S files
  tests/tcg/aarch64: add system boot.S
  tests/tcg/multiarch: move the system memory test
  tests/tcg/minilib: support %c format char
  tests/tcg/multiarch: expand system memory test to cover more
  .travis.yml: enable aarch64-softmmu and alpha-softmmu tcg tests
  Makefile: fix coverage-report reference to BUILD_DIR
  Makefile: include per-target build directories in coverage report
  Makefile.target: support per-target coverage reports
  tests/qemu-iotests: re-format output to for make check-block

Gerd Hoffmann (1):
  tests/docker: add ubuntu 18.04

Philippe Mathieu-Daudé (1):
  tests/docker: Test more components on the Fedora default image

Richard Henderson (1):
  tests/tcg/alpha: add system boot.S

Thomas Huth (7):
  tests/qemu-iotests/005: Add a sanity check for large sparse file
    support
  tests/qemu-iotests/check: Pick a default machine if necessary
  tests/qemu-iotests: Do not hard-code the path to bash
  cirrus / travis: Add gnu-sed and bash for macOS and FreeBSD
  tests/qemu-iotests: Remove the "_supported_os Linux" line from many
    tests
  tests/qemu-iotests/group: Re-use the "auto" group for tests that can
    always run
  tests: Run the iotests during "make check" again

 .cirrus.yml                                   |   4 +-
 .editorconfig                                 |   5 +
 .travis.yml                                   |   3 +-
 MAINTAINERS                                   |   1 +
 Makefile                                      |   4 +-
 Makefile.target                               |  16 +
 include/exec/semihost.h                       |   6 +
 qemu-options.hx                               |   6 +-
 target/arm/arm-semi.c                         |  21 +-
 tests/Makefile.include                        |   8 +-
 tests/check-block.sh                          |  44 +-
 tests/docker/dockerfiles/fedora.docker        |   7 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  57 ++
 tests/qemu-iotests-quick.sh                   |   8 -
 tests/qemu-iotests/001                        |   1 -
 tests/qemu-iotests/002                        |   1 -
 tests/qemu-iotests/003                        |   1 -
 tests/qemu-iotests/004                        |   1 -
 tests/qemu-iotests/005                        |   9 +
 tests/qemu-iotests/007                        |   1 -
 tests/qemu-iotests/008                        |   1 -
 tests/qemu-iotests/009                        |   1 -
 tests/qemu-iotests/010                        |   1 -
 tests/qemu-iotests/011                        |   1 -
 tests/qemu-iotests/012                        |   1 -
 tests/qemu-iotests/015                        |   1 -
 tests/qemu-iotests/017                        |   1 -
 tests/qemu-iotests/020                        |   1 -
 tests/qemu-iotests/021                        |   1 -
 tests/qemu-iotests/022                        |   1 -
 tests/qemu-iotests/025                        |   1 -
 tests/qemu-iotests/026                        |   1 -
 tests/qemu-iotests/027                        |   1 -
 tests/qemu-iotests/029                        |   1 -
 tests/qemu-iotests/031                        |   1 -
 tests/qemu-iotests/032                        |   1 -
 tests/qemu-iotests/033                        |   1 -
 tests/qemu-iotests/035                        |   1 -
 tests/qemu-iotests/036                        |   1 -
 tests/qemu-iotests/037                        |   1 -
 tests/qemu-iotests/042                        |   1 -
 tests/qemu-iotests/043                        |   1 -
 tests/qemu-iotests/046                        |   1 -
 tests/qemu-iotests/047                        |   1 -
 tests/qemu-iotests/049                        |   1 -
 tests/qemu-iotests/050                        |   1 -
 tests/qemu-iotests/051                        |   1 -
 tests/qemu-iotests/052                        |   1 -
 tests/qemu-iotests/053                        |   1 -
 tests/qemu-iotests/054                        |   1 -
 tests/qemu-iotests/062                        |   1 -
 tests/qemu-iotests/063                        |   1 -
 tests/qemu-iotests/066                        |   1 -
 tests/qemu-iotests/067                        |   1 -
 tests/qemu-iotests/068                        |   1 -
 tests/qemu-iotests/069                        |   1 -
 tests/qemu-iotests/071                        |   1 -
 tests/qemu-iotests/072                        |   1 -
 tests/qemu-iotests/073                        |   1 -
 tests/qemu-iotests/079                        |   1 -
 tests/qemu-iotests/082                        |   1 -
 tests/qemu-iotests/085                        |   1 -
 tests/qemu-iotests/089                        |   1 -
 tests/qemu-iotests/090                        |   1 -
 tests/qemu-iotests/094                        |   1 -
 tests/qemu-iotests/095                        |   1 -
 tests/qemu-iotests/098                        |   1 -
 tests/qemu-iotests/102                        |   1 -
 tests/qemu-iotests/103                        |   1 -
 tests/qemu-iotests/104                        |   1 -
 tests/qemu-iotests/105                        |   1 -
 tests/qemu-iotests/107                        |   1 -
 tests/qemu-iotests/110                        |   1 -
 tests/qemu-iotests/111                        |   1 -
 tests/qemu-iotests/112                        |   1 -
 tests/qemu-iotests/114                        |   1 -
 tests/qemu-iotests/115                        |   1 -
 tests/qemu-iotests/117                        |   1 -
 tests/qemu-iotests/120                        |   1 -
 tests/qemu-iotests/125                        |   1 -
 tests/qemu-iotests/126                        |   1 -
 tests/qemu-iotests/127                        |   1 -
 tests/qemu-iotests/133                        |   1 -
 tests/qemu-iotests/134                        |   1 -
 tests/qemu-iotests/142                        |   1 -
 tests/qemu-iotests/143                        |   1 -
 tests/qemu-iotests/144                        |   1 -
 tests/qemu-iotests/145                        |   1 -
 tests/qemu-iotests/153                        |   1 -
 tests/qemu-iotests/156                        |   1 -
 tests/qemu-iotests/157                        |   1 -
 tests/qemu-iotests/158                        |   1 -
 tests/qemu-iotests/159                        |   1 -
 tests/qemu-iotests/162                        |   1 -
 tests/qemu-iotests/170                        |   1 -
 tests/qemu-iotests/173                        |   1 -
 tests/qemu-iotests/182                        |   1 -
 tests/qemu-iotests/183                        |   1 -
 tests/qemu-iotests/186                        |   1 -
 tests/qemu-iotests/187                        |   1 -
 tests/qemu-iotests/190                        |   1 -
 tests/qemu-iotests/191                        |   1 -
 tests/qemu-iotests/192                        |   1 -
 tests/qemu-iotests/195                        |   1 -
 tests/qemu-iotests/197                        |   1 -
 tests/qemu-iotests/200                        |   1 -
 tests/qemu-iotests/214                        |   1 -
 tests/qemu-iotests/215                        |   1 -
 tests/qemu-iotests/217                        |   1 -
 tests/qemu-iotests/227                        |   1 -
 tests/qemu-iotests/231                        |   1 -
 tests/qemu-iotests/233                        |   1 -
 tests/qemu-iotests/239                        |   2 +-
 tests/qemu-iotests/240                        |   3 +-
 tests/qemu-iotests/241                        |   2 +-
 tests/qemu-iotests/243                        |   2 +-
 tests/qemu-iotests/244                        |   2 +-
 tests/qemu-iotests/247                        |   1 -
 tests/qemu-iotests/check                      | 114 ++--
 tests/qemu-iotests/group                      | 177 +++---
 tests/tcg/Makefile                            |   1 +
 tests/tcg/aarch64/Makefile.softmmu-target     |  34 ++
 tests/tcg/aarch64/system/boot.S               | 239 ++++++++
 tests/tcg/aarch64/system/kernel.ld            |  24 +
 tests/tcg/alpha/Makefile.softmmu-target       |  32 ++
 tests/tcg/alpha/system/boot.S                 | 511 ++++++++++++++++++
 tests/tcg/alpha/system/kernel.ld              |  30 +
 tests/tcg/i386/Makefile.softmmu-target        |   4 +-
 tests/tcg/i386/system/memory.c                | 243 ---------
 tests/tcg/minilib/printf.c                    |   3 +
 .../multiarch/system/Makefile.softmmu-target  |  14 +
 tests/tcg/{i386 => multiarch}/system/hello.c  |   0
 tests/tcg/multiarch/system/memory.c           | 445 +++++++++++++++
 vl.c                                          |  23 +
 134 files changed, 1701 insertions(+), 501 deletions(-)
 create mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
 delete mode 100755 tests/qemu-iotests-quick.sh
 create mode 100644 tests/tcg/aarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/aarch64/system/boot.S
 create mode 100644 tests/tcg/aarch64/system/kernel.ld
 create mode 100644 tests/tcg/alpha/Makefile.softmmu-target
 create mode 100644 tests/tcg/alpha/system/boot.S
 create mode 100644 tests/tcg/alpha/system/kernel.ld
 delete mode 100644 tests/tcg/i386/system/memory.c
 create mode 100644 tests/tcg/multiarch/system/Makefile.softmmu-target
 rename tests/tcg/{i386 => multiarch}/system/hello.c (100%)
 create mode 100644 tests/tcg/multiarch/system/memory.c

-- 
2.20.1
