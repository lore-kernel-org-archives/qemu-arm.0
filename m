Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v1-20020a05600c214100b003fe215e4492sm2511175wml.4.2023.08.10.08.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:36:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B01921FFBB;
	Thu, 10 Aug 2023 16:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 0/8] some testing and gdbstub fixes
Date: Thu, 10 Aug 2023 16:36:32 +0100
Message-Id: <20230810153640.1879717-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: nZZ9pOlVSGd9

This is mostly gdbstub focused but I cleaned up some bits while I was
in the testing makefiles. This is mostly to make the "check-tcg"
output as clean as possible without ugly line wraps. I tried to
eliminate the gdbstub info() output but sadly this is harder than
expected.

I've tweaked the gdbstub handling for Ctrl-c packets as suggested by
Matheus. While I was there I also noticed we were being a bit precious
about gdb sending preemptive ACKS so I fixed that as well.

I don't know if this is all late 8.1-rc material but its fairly simple
testing updates and the ccache stuff from Daniel should help as well.

Alex Bennée (7):
  tests/docker: cleanup non-verbose output
  tests/tcg: remove quoting for info output
  tests: remove test-gdbstub.py
  tests/tcg: clean-up gdb confirm/pagination settings
  tests/tcg: ensure system-mode gdb tests start stopped
  gdbstub: more fixes for client Ctrl-C handling
  gdbstub: don't complain about preemptive ACK chars

Daniel P. Berrangé (1):
  gitlab: enable ccache for many build jobs

 docs/devel/ci-jobs.rst.inc                    |   7 +
 gdbstub/gdbstub.c                             |  10 +-
 .gitlab-ci.d/buildtest-template.yml           |  11 ++
 .gitlab-ci.d/crossbuild-template.yml          |  26 +++
 .gitlab-ci.d/windows.yml                      |  13 +-
 gdbstub/trace-events                          |   1 +
 tests/docker/Makefile.include                 |   6 +-
 .../dockerfiles/debian-hexagon-cross.docker   |   9 +-
 tests/guest-debug/run-test.py                 |  11 +-
 tests/guest-debug/test-gdbstub.py             | 177 ------------------
 tests/tcg/aarch64/Makefile.target             |   2 +-
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   |   3 -
 tests/tcg/aarch64/gdbstub/test-sve.py         |   3 -
 tests/tcg/multiarch/gdbstub/memory.py         |   3 -
 tests/tcg/multiarch/gdbstub/sha1.py           |   4 -
 .../multiarch/gdbstub/test-proc-mappings.py   |   4 -
 .../multiarch/gdbstub/test-qxfer-auxv-read.py |   4 -
 .../gdbstub/test-thread-breakpoint.py         |   4 -
 .../multiarch/system/Makefile.softmmu-target  |   4 +-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |   4 -
 tests/tcg/s390x/gdbstub/test-svc.py           |   4 -
 21 files changed, 83 insertions(+), 227 deletions(-)
 delete mode 100644 tests/guest-debug/test-gdbstub.py

-- 
2.39.2
