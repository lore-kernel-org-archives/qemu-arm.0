Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d4647000000b0031c4d4be245sm13660014wrs.93.2023.08.24.09.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 09:39:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 32BD81FFBB;
	Thu, 24 Aug 2023 17:39:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 00/12] gdbstub and testing fixes for 8.2
Date: Thu, 24 Aug 2023 17:38:58 +0100
Message-Id: <20230824163910.1737079-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: V5PI1LtWuyJE

This is the current state for my maintainer queue getting ready for
the first PR into the tree. It includes the previous testing/next
fixes as well as some more cleanups to modernise the gdbstub tests and
code. It also includes Matheus' fixes for SIGINT.

v2
  - added style patch
  - added comment move for gdbstub

The following patches still need review:

  gdbstub: move comment for gdb_register_coprocessor
  gdbstub: replace global gdb_has_xml with a function
  gdbstub: refactor get_feature_xml
  gdbstub: remove unused user_ctx field (1 acks, 1 sobs, 0 tbs)
  tests: remove test-gdbstub.py
  tests/tcg: remove quoting for info output

Alex Bennée (9):
  tests/docker: cleanup non-verbose output
  tests/tcg: remove quoting for info output
  docs/style: permit inline loop variables
  tests: remove test-gdbstub.py
  tests/tcg: clean-up gdb confirm/pagination settings
  gdbstub: remove unused user_ctx field
  gdbstub: refactor get_feature_xml
  gdbstub: replace global gdb_has_xml with a function
  gdbstub: move comment for gdb_register_coprocessor

Daniel P. Berrangé (1):
  gitlab: enable ccache for many build jobs

Matheus Branco Borella (1):
  gdbstub: fixes cases where wrong threads were reported to GDB on
    SIGINT

Thomas Huth (1):
  .gitlab-ci.d/cirrus.yml: Update FreeBSD to v13.2

 docs/devel/ci-jobs.rst.inc                    |   7 +
 docs/devel/style.rst                          |   9 +-
 gdbstub/internals.h                           |   3 +-
 include/exec/gdbstub.h                        |  20 +-
 gdbstub/gdbstub.c                             | 126 ++++++++-----
 gdbstub/softmmu.c                             |   1 -
 gdbstub/user.c                                |   1 -
 target/arm/gdbstub.c                          |   8 +-
 target/ppc/gdbstub.c                          |   4 +-
 tests/tcg/multiarch/system/interrupt.c        |  28 +++
 .gitlab-ci.d/buildtest-template.yml           |  11 ++
 .gitlab-ci.d/cirrus.yml                       |   2 +-
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
 30 files changed, 312 insertions(+), 289 deletions(-)
 create mode 100644 tests/tcg/multiarch/system/interrupt.c
 delete mode 100644 tests/guest-debug/test-gdbstub.py
 create mode 100644 tests/tcg/multiarch/gdbstub/interrupt.py

-- 
2.39.2
