Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf692b6b44sm523833166b.112.2025.03.04.14.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:51 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1E28C5FCAA;
	Tue,  4 Mar 2025 22:24:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 17/32] tests/tcg: Suppress compiler false-positive warning on sha1.c
Date: Tue,  4 Mar 2025 22:24:24 +0000
Message-Id: <20250304222439.2035603-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: psQFEG3yZfhH

From: Peter Maydell <peter.maydell@linaro.org>

GCC versions at least 12 through 15 incorrectly report a warning
about code in sha1.c:

tests/tcg/multiarch/sha1.c:161:13: warning: ‘SHA1Transform’ reading 64 bytes from a region of size 0 [-Wstringop-overread]
  161 |             SHA1Transform(context->state, &data[i]);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is a piece of stock library code for doing SHA1 which we've
simply copied, rather than writing ourselves. The bug has been
reported to upstream GCC (about a different library's use of this
code):
 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106709

For our test case, since this isn't our original code and there isn't
actually a bug in it, suppress the incorrect warning rather than
trying to modify the code to work around the compiler issue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2328
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250227141343.1675415-1-peter.maydell@linaro.org>
[AJB: -Wno-unknown-warning-option for clang's sake]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target   | 3 ++-
 tests/tcg/arm/Makefile.target       | 3 ++-
 tests/tcg/hexagon/Makefile.target   | 2 +-
 tests/tcg/multiarch/Makefile.target | 8 ++++++++
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9efe2f81ad..16ddcf4f88 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -83,7 +83,8 @@ test-aes: CFLAGS += -O -march=armv8-a+aes
 test-aes: test-aes-main.c.inc
 
 # Vector SHA1
-sha1-vector: CFLAGS=-O3
+# Work around compiler false-positive warning, as we do for the 'sha1' test
+sha1-vector: CFLAGS=-O3 -Wno-stringop-overread
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 99a953b667..6189d7a0e2 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -61,7 +61,8 @@ endif
 ARM_TESTS += commpage
 
 # Vector SHA1
-sha1-vector: CFLAGS=-O3
+# Work around compiler false-positive warning, as we do for the 'sha1' test
+sha1-vector: CFLAGS=-O3 -Wno-stringop-overread
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index e5182c01d8..4dfc39bc98 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -18,7 +18,7 @@
 # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
 EXTRA_RUNS =
 
-CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
+CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal -Wno-unknown-warning-option
 CFLAGS += -fno-unroll-loops -fno-stack-protector
 
 HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 688a6be203..c769a7d69d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -45,6 +45,14 @@ vma-pthread: LDFLAGS+=-pthread
 sigreturn-sigmask: CFLAGS+=-pthread
 sigreturn-sigmask: LDFLAGS+=-pthread
 
+# GCC versions 12/13/14/15 at least incorrectly complain about
+# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the gcc bug
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106709
+# Since this is just a standard piece of library code we've borrowed for a
+# TCG test case, suppress the warning rather than trying to modify the
+# code to work around the compiler.
+sha1: CFLAGS+=-Wno-stringop-overread
+
 # The vma-pthread seems very sensitive on gitlab and we currently
 # don't know if its exposing a real bug or the test is flaky.
 ifneq ($(GITLAB_CI),)
-- 
2.39.5
