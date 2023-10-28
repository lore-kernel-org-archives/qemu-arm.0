Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c248300b00406408dc788sm7135731wms.44.2023.10.28.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ECE225F76C;
	Sat, 28 Oct 2023 11:33:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Brad Smith <brad@comstyle.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 00/17] Maintainer updates for testing, gdb, semihosting and plugins
Date: Sat, 28 Oct 2023 11:32:54 +0100
Message-Id: <20231028103311.347104-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: djw6nPTA5QJ6

This collects up a number of fixes across my various maintainer trees.
There will be a longer plugins related one coming later but I wanted
to turn these around first. The update to bookworm was delayed from
the last release but I've now "solved" that by moving sh4 and alpha
into a legacy container stuck on bullseye.

I've also taken the opportunity to rationalise our zoo of containers
to better sync up with what we actually use on gitlab.

The following still need review:

  plugins: Remove an extra parameter
  tests/docker: upgrade debian-all-test-cross to bookworm
  tests/docker: use debian-all-test-cross for sparc64
  tests/docker: use debian-all-test-cross for riscv64
  tests/docker: use debian-all-test-cross for mips
  tests/docker: use debian-all-test-cross for mips64
  tests/docker: use debian-all-test-cross for m68k
  tests/docker: use debian-all-test-cross for hppa
  tests/docker: use debian-all-test-cross for power
  tests/docker: move sh4 to use debian-legacy-test-cross
  tests/docker: use debian-legacy-test-cross for alpha
  gitlab: split alpha testing into a legacy container

Akihiko Odaki (3):
  tests/tcg: Add -fno-stack-protector
  gdbstub: Check if gdb_regs is NULL
  plugins: Remove an extra parameter

Alex Bennée (11):
  gitlab: split alpha testing into a legacy container
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

 configure                                     | 37 ++++++++++-
 accel/tcg/plugin-gen.c                        |  9 +--
 contrib/plugins/lockstep.c                    |  2 +
 gdbstub/gdbstub.c                             | 34 ++++++-----
 semihosting/config.c                          |  3 +-
 tests/tcg/mips/hello-mips.c                   |  4 +-
 .gitlab-ci.d/buildtest.yml                    | 20 +++++-
 .gitlab-ci.d/container-cross.yml              | 61 ++-----------------
 tests/docker/Makefile.include                 |  7 ---
 .../dockerfiles/debian-all-test-cross.docker  | 26 ++++----
 .../dockerfiles/debian-alpha-cross.docker     | 19 ------
 .../dockerfiles/debian-hppa-cross.docker      | 19 ------
 .../debian-legacy-test-cross.docker           | 47 ++++++++++++++
 .../dockerfiles/debian-m68k-cross.docker      | 19 ------
 .../dockerfiles/debian-mips-cross.docker      | 19 ------
 .../dockerfiles/debian-mips64-cross.docker    | 19 ------
 .../debian-powerpc-test-cross.docker          | 23 -------
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
 29 files changed, 158 insertions(+), 289 deletions(-)
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
