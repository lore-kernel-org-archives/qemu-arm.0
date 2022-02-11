Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q7sm4951018ejj.8.2022.02.11.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 08:03:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D2BFA1FFC3;
	Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH  v1 11/11] tests/tcg: add vectorised sha512 versions
Date: Fri, 11 Feb 2022 16:03:09 +0000
Message-Id: <20220211160309.335014-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q8e84Y14jR3k

This builds vectorised versions of sha512 to exercise the vector code:

  - aarch64 (AdvSimd)
  - i386 (SSE)
  - s390x (MVX)
  - ppc64 (vector)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202191242.652607-5-alex.bennee@linaro.org>

---
v2
  - use -msse4.1 -O3 instead of -pentium4 for i386 build
---
 tests/tcg/multiarch/sha512.c      | 2 +-
 tests/tcg/aarch64/Makefile.target | 7 +++++++
 tests/tcg/arm/Makefile.target     | 8 ++++++++
 tests/tcg/i386/Makefile.target    | 6 ++++++
 tests/tcg/ppc64le/Makefile.target | 5 ++++-
 tests/tcg/s390x/Makefile.target   | 9 +++++++++
 tests/tcg/x86_64/Makefile.target  | 7 +++++++
 7 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/multiarch/sha512.c b/tests/tcg/multiarch/sha512.c
index d61942d1e0..e1729828b9 100644
--- a/tests/tcg/multiarch/sha512.c
+++ b/tests/tcg/multiarch/sha512.c
@@ -43,7 +43,7 @@
 
 typedef uint64_t beint64_t;
 
-#if BYTE_ORDER == BIG_ENDIAN
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
 
 /**
  * CPU_TO_BE64 - convert a constant uint64_t value to big-endian
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index df3f8e9438..ac07acde66 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -60,6 +60,13 @@ run-sha1-vector: sha1-vector run-sha1
 
 TESTS += sha1-vector
 
+# Vector versions of sha512 (-O3 triggers vectorisation)
+sha512-vector: CFLAGS=-O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS += sha512-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 2dc94931c3..2f815120a5 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -79,6 +79,14 @@ run-sha1-vector: sha1-vector run-sha1
 	$(call diff-out, sha1-vector, sha1.out)
 
 ARM_TESTS += sha1-vector
+
+# Vector versions of sha512 (-O3 triggers vectorisation)
+sha512-vector: CFLAGS=-O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+ARM_TESTS += sha512-vector
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 38c10379af..099556efdc 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -71,3 +71,9 @@ TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
 
 # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
 EXTRA_RUNS+=run-test-mmap-4096
+
+sha512-sse: CFLAGS=-msse4.1 -O3
+sha512-sse: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS+=sha512-sse
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 480ff0898d..4f1d03dfcf 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -5,10 +5,13 @@
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64LE_TESTS=bcdsub non_signalling_xscv
+PPC64LE_TESTS=bcdsub non_signalling_xscv sha512-vector
 endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS += byte_reverse
 endif
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7238b4eb..e53b599b22 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,3 +25,12 @@ run-gdbstub-signals-s390x: signals-s390x
 
 EXTRA_RUNS += run-gdbstub-signals-s390x
 endif
+
+# MVX versions of sha512
+sha512-mvx: CFLAGS=-march=z13 -mvx -O3
+sha512-mvx: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-mvx: QEMU_OPTS+=-cpu max
+
+TESTS+=sha512-mvx
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 4a8a464c57..17cf168f0a 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -22,3 +22,10 @@ test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 
 vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
+# TCG does not yet support all SSE (SIGILL on pshufb)
+# sha512-sse: CFLAGS=-march=core2 -O3
+# sha512-sse: sha512.c
+# 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS+=sha512-sse
-- 
2.30.2
