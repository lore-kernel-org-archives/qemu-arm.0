Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c3b8500b00380fc02ff76sm2136062wms.15.2022.03.01.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 01:47:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 911BD1FFC5;
	Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 13/18] tests/tcg: add vectorised sha512 versions
Date: Tue,  1 Mar 2022 09:47:10 +0000
Message-Id: <20220301094715.550871-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FD2zaVrCcwla

This builds vectorised versions of sha512 to exercise the vector code:

  - aarch64 (AdvSimd)
  - i386 (SSE)
  - s390x (MVX)
  - ppc64/ppc64le (power10 vectors)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>

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
index 38c10379af..e1c0310be6 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -71,3 +71,12 @@ TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
 
 # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
 EXTRA_RUNS+=run-test-mmap-4096
+
+sha512-sse: CFLAGS=-msse4.1 -O3
+sha512-sse: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-sse: QEMU_OPTS+=-cpu max
+run-plugin-sha512-sse-with-%: QEMU_OPTS+=-cpu max
+
+TESTS+=sha512-sse
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 9d6dfc1e26..c9498053df 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -13,12 +13,19 @@ $(PPC64_TESTS): CFLAGS += -mpower8-vector
 PPC64_TESTS += mtfsf
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
-PPC64_TESTS += byte_reverse
+PPC64_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
+sha512-vector: CFLAGS +=-mcpu=power10 -O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-vector: QEMU_OPTS+=-cpu POWER10
+run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
+
 PPC64_TESTS += signal_save_restore_xer
 
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 480ff0898d..12d85e946b 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -10,12 +10,19 @@ endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
-PPC64LE_TESTS += byte_reverse
+PPC64LE_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
+sha512-vector: CFLAGS +=-mcpu=power10 -O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-vector: QEMU_OPTS+=-cpu POWER10
+run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
+
 PPC64LE_TESTS += mtfsf
 PPC64LE_TESTS += signal_save_restore_xer
 
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
