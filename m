Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x205sm1393092wmb.5.2019.10.24.23.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 23:46:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 909C11FFD4;
	Fri, 25 Oct 2019 07:37:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL v2 62/73] tests/tcg: move "virtual" tests to EXTRA_TESTS
Date: Fri, 25 Oct 2019 07:37:02 +0100
Message-Id: <20191025063713.23374-63-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AgadNvojpQ6p

Otherwise clever expanders like the plugins test get unstuck.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 84abbd24f34..96646130020 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -66,6 +66,8 @@ conditional-diff-out = 							\
 
 # Tests we are building
 TESTS=
+# additional tests which may re-use existing binaries
+EXTRA_TESTS=
 
 # Start with a blank slate, the build targets get to add stuff first
 CFLAGS=
@@ -109,7 +111,7 @@ else
 
 endif
 
-all: $(TESTS)
+all: $(TESTS) $(EXTRA_TESTS)
 
 #
 # Test Runners
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index b4b39579634..950dbb4bac2 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -52,4 +52,4 @@ run-memory-replay: memory-replay run-memory-record
 	   	  $(QEMU_OPTS) memory, \
 	  "$< on $(TARGET_NAME)")
 
-TESTS+=memory-record memory-replay
+EXTRA_TESTS+=memory-record memory-replay
-- 
2.20.1
