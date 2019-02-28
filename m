Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c15sm13469153wrv.69.2019.02.28.12.25.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:45 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1F4431FF92;
	Thu, 28 Feb 2019 20:25:38 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 15/16] .travis.yml: separate softfloat from check-tcg
Date: Thu, 28 Feb 2019 20:25:36 +0000
Message-Id: <20190228202537.4638-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ET7Zdsid5Qw5

While used by TCG it is not explicitly part of TCG and the tests can
be run standalone in a minimal build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml            | 6 ++++++
 tests/Makefile.include | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index cca57f4314..71b3c4a7a3 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -85,6 +85,12 @@ matrix:
         - CONFIG="--disable-user"
 
 
+    # Just build tools and run minimal unit and softfloat checks
+    - env:
+        - BASE_CONFIG="--enable-tools"
+        - CONFIG="--disable-user --disable-system"
+        - TEST_CMD="make check-unit check-softfloat -j3"
+
     - env:
         - CONFIG="--enable-debug --enable-debug-tcg --disable-user"
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f39b96e250..fb31cc5edf 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1059,7 +1059,7 @@ clean-tcg-tests-%:
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
 .PHONY: check-tcg
-check-tcg: check-softfloat $(RUN_TCG_TARGET_RULES)
+check-tcg: $(RUN_TCG_TARGET_RULES)
 
 .PHONY: clean-tcg
 clean-tcg: $(CLEAN_TCG_TARGET_RULES)
-- 
2.20.1
