Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r140sm2710271wme.47.2019.10.17.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 06:55:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 25B4A1FFC3;
	Thu, 17 Oct 2019 14:16:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	aaron@os.amperecomputing.com,
	peter.puhov@futurewei.com,
	robert.foley@futurewei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v6 45/54] tests/tcg: move "virtual" tests to EXTRA_TESTS
Date: Thu, 17 Oct 2019 14:16:06 +0100
Message-Id: <20191017131615.19660-46-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017131615.19660-1-alex.bennee@linaro.org>
References: <20191017131615.19660-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /Zq1iIkR/98y

Otherwise clever expanders like the plugins test get unstuck.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.target                 | 4 +++-
 tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 84abbd24f3..9664613002 100644
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
index b4b3957963..950dbb4bac 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -52,4 +52,4 @@ run-memory-replay: memory-replay run-memory-record
 	   	  $(QEMU_OPTS) memory, \
 	  "$< on $(TARGET_NAME)")
 
-TESTS+=memory-record memory-replay
+EXTRA_TESTS+=memory-record memory-replay
-- 
2.20.1
