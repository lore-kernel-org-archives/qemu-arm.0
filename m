Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7d699000000b004128cfcc228sm1655504edr.5.2022.02.25.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 12DFA1FFC3;
	Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
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
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v2 11/18] tests/tcg: build sha1-vector with O3 and compare
Date: Fri, 25 Feb 2022 17:20:14 +0000
Message-Id: <20220225172021.3493923-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6mqUpuxBrQiA

The aim of this is to test code generation for vectorised operations.
Unfortunately gcc struggles to do much with the messy sha1 code (try
-fopt-info-vec-missed to see why). However it's better than nothing.

We assume the non-vectorised output is gold and baring compiler bugs
the outputs should match.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220202191242.652607-3-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220211160309.335014-10-alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 10 ++++++++++
 tests/tcg/arm/Makefile.target     |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..df3f8e9438 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -50,6 +50,16 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+TESTS += sha1-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index f509d823d4..2dc94931c3 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -70,6 +70,15 @@ endif
 
 ARM_TESTS += commpage
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+ARM_TESTS += sha1-vector
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.30.2
