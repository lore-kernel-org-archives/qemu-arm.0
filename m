Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x5sm5287399wmh.27.2022.02.02.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:12:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E4E9C1FFBA;
	Wed,  2 Feb 2022 19:12:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  2/4] tests/tcg: build sha1-vector for SVE and compare
Date: Wed,  2 Feb 2022 19:12:40 +0000
Message-Id: <20220202191242.652607-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202191242.652607-1-alex.bennee@linaro.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IaMrDn/CKQ8n

The aim of this is to test code generation for vectorised operations.
Unfortunately gcc struggles to do much with the messy sha1 code (try
-fopt-info-vec-missed to see why). However it's better than nothing.

We assume the non-vectorised output is gold and baring compiler bugs
the outputs should match.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..a03844ce48 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -50,6 +50,18 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+# Vector SHA1
+
+sha1-vector: CFLAGS=-march=armv8.1-a+sve -O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+TESTS += sha1-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-- 
2.30.2
