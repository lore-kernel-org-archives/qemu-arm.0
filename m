Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id je12-20020a05600c1f8c00b004080f0376a0sm6730174wmb.42.2023.10.29.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:50:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0CCF25F7A0;
	Sun, 29 Oct 2023 14:50:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Kyle Evans <kevans@freebsd.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 00/19] Maintainer updates for testing, gdb, semihosting and plugins (pre-PR)
Date: Sun, 29 Oct 2023 14:50:14 +0000
Message-Id: <20231029145033.592566-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: LGIyFZ8xpqv9

This collects up a number of fixes across my various maintainer trees.
There will be a longer plugins related one coming later but I wanted
to turn these around first. The update to bookworm was delayed from
the last release but I've now "solved" that by moving sh4 and alpha
into a legacy container stuck on bullseye.

v2
  - further split the first alpha patch
  - re-base and merge conflicts
  - address comments and tags

The following still need review:

  tests/docker: upgrade debian-all-test-cross to bookworm (1 acks, 1 sobs, 0 tbs)
  tests/docker: use debian-all-test-cross for sparc64
  tests/docker: move sh4 to use debian-legacy-test-cross
  gitlab: add build-loongarch to matrix
  gitlab: clean-up build-soft-softmmu job
  gitlab: split alpha testing into a legacy container

Akihiko Odaki (3):
  tests/tcg: Add -fno-stack-protector
  gdbstub: Check if gdb_regs is NULL
  plugins: Remove an extra parameter

Alex Bennée (13):
  gitlab: split alpha testing into a legacy container
  gitlab: clean-up build-soft-softmmu job
  gitlab: add build-loongarch to matrix
  tests/docker: use debian-legacy-test-cross for alpha
  tests/docker: move sh4 to use debian-legacy-test-cross
  tests/docker: use debian-all-test-cross for power
  tests/docker: use debian-all-test-cross for hppa
  tests/docker: use debian-all-test-cross for m68k
  tests/docker: use debian-all-test-cross for mips64
  tests/docker: use debian-all-test-cross for mips
  tests/docker: use debian-all-test-cross for riscv64
  tests/docker: use debian-all-test-cross for sparc64
  tests/docker: upgrade debian-all-test-cross to bookworm

Cong Liu (1):
  contrib/plugins: Close file descriptor on error return

Matheus Tavares Bernardino (1):
  semihosting: fix memleak at semihosting_arg_fallback

Thomas Huth (1):
  tests/vm/openbsd: Use the system dtc package

 configure                                     | 37 +++++++++++-
 accel/tcg/plugin-gen.c                        |  9 +--
 contrib/plugins/lockstep.c                    |  2 +
 gdbstub/gdbstub.c                             | 34 ++++++-----
 semihosting/config.c                          |  3 +-
 tests/tcg/mips/hello-mips.c                   |  4 +-
 .gitlab-ci.d/buildtest.yml                    | 34 +++++++++--
 .gitlab-ci.d/container-cross.yml              | 59 +++----------------
 tests/docker/Makefile.include                 |  8 ---
 .../dockerfiles/debian-all-test-cross.docker  | 26 ++++----
 .../dockerfiles/debian-alpha-cross.docker     | 19 ------
 .../dockerfiles/debian-hppa-cross.docker      | 19 ------
 .../debian-legacy-test-cross.docker           | 47 +++++++++++++++
 .../dockerfiles/debian-loongarch-cross.docker | 22 ++++++-
 .../dockerfiles/debian-m68k-cross.docker      | 19 ------
 .../dockerfiles/debian-mips-cross.docker      | 19 ------
 .../dockerfiles/debian-mips64-cross.docker    | 19 ------
 .../debian-powerpc-test-cross.docker          | 23 --------
 .../debian-riscv64-test-cross.docker          | 19 ------
 .../dockerfiles/debian-sh4-cross.docker       | 19 ------
 .../dockerfiles/debian-sparc64-cross.docker   | 19 ------
 tests/tcg/Makefile.target                     |  2 +-
 tests/tcg/aarch64/Makefile.target             |  2 +-
 tests/tcg/arm/Makefile.target                 |  2 +-
 tests/tcg/cris/Makefile.target                |  2 +-
 tests/tcg/hexagon/Makefile.target             |  2 +-
 tests/tcg/i386/Makefile.target                |  2 +-
 tests/tcg/minilib/Makefile.target             |  2 +-
 tests/tcg/mips/Makefile.target                |  2 +-
 tests/vm/openbsd                              |  6 +-
 30 files changed, 194 insertions(+), 288 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-alpha-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-hppa-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-legacy-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-m68k-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-mips-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-mips64-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-sh4-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-sparc64-cross.docker

-- 
2.39.2
