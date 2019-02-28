Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c67sm51267wmd.47.2019.02.28.12.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:37 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7AAA01FF83;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v2 02/16] tests/tcg: enable tcg tests for softmmu
Date: Thu, 28 Feb 2019 20:25:23 +0000
Message-Id: <20190228202537.4638-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eRaYY30f2Ohs

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 Makefile.target        | 2 --
 tests/Makefile.include | 7 +++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Makefile.target b/Makefile.target
index 3b79e7074c..61b8be31a2 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -37,9 +37,7 @@ PROGS=$(QEMU_PROG) $(QEMU_PROGW)
 STPFILES=
 
 # Makefile Tests
-ifdef CONFIG_USER_ONLY
 include $(SRC_PATH)/tests/tcg/Makefile.include
-endif
 
 config-target.h: config-target.h-timestamp
 config-target.h-timestamp: config-target.mak
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 2187b0c5aa..f39b96e250 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1030,10 +1030,9 @@ endif
 
 # Per guest TCG tests
 
-LINUX_USER_TARGETS=$(filter %-linux-user,$(TARGET_DIRS))
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(LINUX_USER_TARGETS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(LINUX_USER_TARGETS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(LINUX_USER_TARGETS))
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGET_DIRS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
 
 ifeq ($(HAVE_USER_DOCKER),y)
 # Probe for the Docker Builds needed for each build
-- 
2.20.1
