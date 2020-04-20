Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j4sm1161155wrm.85.2020.04.20.06.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 06:35:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F14481FF7E;
	Mon, 20 Apr 2020 14:34:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] tests/tcg: use EXTRA_RUNS to run gdbtests
Date: Mon, 20 Apr 2020 14:34:55 +0100
Message-Id: <20200420133455.25401-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kdws+eR31QP/

With --enable-plugins the gdb tests confuse things somewhat as the
plugin code attempts to enumerate tests with non-existent binaries.
Fortunately we already have a mechanism for these extra tests that
don't automatically include their own binaries. Use that mechanism and
drop the unneeded .PHONY declarations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target   | 5 ++---
 tests/tcg/cris/Makefile.target      | 1 +
 tests/tcg/multiarch/Makefile.target | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index d99b2a9eced..312f36cde5f 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -54,9 +54,6 @@ sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-AARCH64_TESTS += gdbstub-sysregs gdbstub-sve-ioctls
-
-.PHONY: gdbstub-sysregs gdbstub-sve-ioctls
 run-gdbstub-sysregs: sysregs
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
@@ -70,6 +67,8 @@ run-gdbstub-sve-ioctls: sve-ioctls
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
 	"basic gdbstub SVE ZLEN support")
+
+EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
 
 endif
diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index 24c7f2e7616..e72d3cbdb23 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -23,6 +23,7 @@ CRIS_RUNS = $(patsubst %, run-%, $(CRIS_USABLE_TESTS))
 
 # override the list of tests, as we can't build the multiarch tests
 TESTS = $(CRIS_USABLE_TESTS)
+EXTRA_RUNS =
 VPATH = $(CRIS_SRC)
 
 AS	= $(CC) -x assembler-with-cpp
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 47fd675aba5..51fb75ecfdd 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -45,15 +45,14 @@ run-test-mmap-%: test-mmap
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-MULTIARCH_TESTS += gdbstub-sha1
-
-.PHONY: gdbstub-sha1
 run-gdbstub-sha1: sha1
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
+
+EXTRA_RUNS += run-gdbstub-sha1
 endif
 
 
-- 
2.20.1
