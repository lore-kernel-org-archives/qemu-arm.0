Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a22-20020a05600c225600b003fe20db88ebsm18117157wmm.31.2023.08.15.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 07:51:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C513C1FFBB;
	Tue, 15 Aug 2023 15:51:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/9] gdbstub and testing fixes for 8.2
Date: Tue, 15 Aug 2023 15:51:17 +0100
Message-Id: <20230815145126.3444183-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: ojDXYVB95Ezo

This is the current state for my maintainer queue for when the tree
re-opens. It includes the previous testing/next fixes as well as some
more cleanups to modernise the gdbstub tests and code. It also
includes Matheus' fixes for SIGINT.

The following patches need review:

  gdbstub: replace global gdb_has_xml with a function
  gdbstub: refactor get_feature_xml
  gdbstub: remove unused user_ctx field
  tests/tcg: clean-up gdb confirm/pagination settings
  tests: remove test-gdbstub.py
  tests/tcg: remove quoting for info output

Alex Bennée (7):
  tests/docker: cleanup non-verbose output
  tests/tcg: remove quoting for info output
  tests: remove test-gdbstub.py
  tests/tcg: clean-up gdb confirm/pagination settings
  gdbstub: remove unused user_ctx field
  gdbstub: refactor get_feature_xml
  gdbstub: replace global gdb_has_xml with a function

Daniel P. Berrangé (1):
  gitlab: enable ccache for many build jobs

Matheus Branco Borella (1):
  gdbstub: fixes cases where wrong threads were reported to GDB on
    SIGINT

 docs/devel/ci-jobs.rst.inc                    |   7 +
 gdbstub/internals.h                           |   3 +-
 include/exec/gdbstub.h                        |  10 +-
 gdbstub/gdbstub.c                             | 119 +++++++-----
 gdbstub/softmmu.c                             |   1 -
 gdbstub/user.c                                |   1 -
 target/arm/gdbstub.c                          |   8 +-
 target/ppc/gdbstub.c                          |   4 +-
 tests/tcg/multiarch/system/interrupt.c        |  28 +++
 .gitlab-ci.d/buildtest-template.yml           |  11 ++
 .gitlab-ci.d/crossbuild-template.yml          |  26 +++
 .gitlab-ci.d/windows.yml                      |  13 +-
 tests/docker/Makefile.include                 |   6 +-
 .../dockerfiles/debian-hexagon-cross.docker   |   9 +-
 tests/guest-debug/run-test.py                 |   2 +
 tests/guest-debug/test-gdbstub.py             | 177 ------------------
 tests/tcg/aarch64/Makefile.target             |   2 +-
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   |   3 -
 tests/tcg/aarch64/gdbstub/test-sve.py         |   3 -
 tests/tcg/multiarch/gdbstub/interrupt.py      |  97 ++++++++++
 tests/tcg/multiarch/gdbstub/memory.py         |   3 -
 tests/tcg/multiarch/gdbstub/sha1.py           |   4 -
 .../multiarch/gdbstub/test-proc-mappings.py   |   4 -
 .../multiarch/gdbstub/test-qxfer-auxv-read.py |   4 -
 .../gdbstub/test-thread-breakpoint.py         |   4 -
 .../multiarch/system/Makefile.softmmu-target  |  16 +-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |   4 -
 tests/tcg/s390x/gdbstub/test-svc.py           |   4 -
 28 files changed, 293 insertions(+), 280 deletions(-)
 create mode 100644 tests/tcg/multiarch/system/interrupt.c
 delete mode 100644 tests/guest-debug/test-gdbstub.py
 create mode 100644 tests/tcg/multiarch/gdbstub/interrupt.py

-- 
2.39.2
