Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p6sm58490357wre.63.2019.02.28.12.31.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:31:01 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2B7C81FF93;
	Thu, 28 Feb 2019 20:25:38 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 16/16] .travis.yml: add softmmu check-tcg tests
Date: Thu, 28 Feb 2019 20:25:37 +0000
Message-Id: <20190228202537.4638-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MKo00QLERmr5

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 71b3c4a7a3..90c5908ae1 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -255,6 +255,12 @@ matrix:
         - ./configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread -fuse-ld=gold" || { cat config.log && exit 1; }
 
 
+    # Run check-tcg against linux-user
     - env:
         - CONFIG="--disable-system"
         - TEST_CMD="make -j3 check-tcg V=1"
+
+    # Run check-tcg against softmmu targets
+    - env:
+        - CONFIG="--target-list=xtensa-softmmu,arm-softmmu"
+        - TEST_CMD="make -j3 check-tcg V=1"
-- 
2.20.1
