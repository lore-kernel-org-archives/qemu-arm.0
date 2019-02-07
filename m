Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a12sm34391245wrm.45.2019.02.07.10.37.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:47 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B79501FF83;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 03/16] .travis.yml: separate tools and docs into another entry
Date: Thu,  7 Feb 2019 18:37:31 +0000
Message-Id: <20190207183744.5054-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q23acOJkw+Wi

Re-building the tools and documents by default is a little wasteful as
they are not really affected by the main build options. Split tools
and documents into their own task with a minimal softmmu and
linux-user target list just to check they don't interact badly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .travis.yml | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index beea941408..652be702ac 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -59,6 +59,7 @@ env:
   global:
     - SRC_DIR="."
     - BUILD_DIR="."
+    - BASE_CONFIG="--disable-docs --disable-tools"
     - TEST_CMD="make check -j3 V=1"
 
 
@@ -69,7 +70,7 @@ git:
 
 before_script:
   - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-  - ${SRC_DIR}/configure ${CONFIG} || { cat config.log && exit 1; }
+  - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
 script:
   - make -j3 && ${TEST_CMD}
 
@@ -104,6 +105,17 @@ matrix:
         - CONFIG="--with-coroutine=sigaltstack --disable-linux-user"
 
 
+    # Check we can build docs and tools
+    - env:
+        - BASE_CONFIG="--enable-tools --enable-docs"
+        - CONFIG="--target-list=x86_64-softmmu,aarch64-linux-user"
+      addons:
+        apt:
+          packages:
+            - python-sphinx
+            - texinfo
+            - perl
+
     # Test out-of-tree builds
     - env:
         - CONFIG="--enable-debug --enable-debug-tcg"
@@ -241,5 +253,5 @@ matrix:
 
 
     - env:
-        - CONFIG="--disable-system --disable-docs"
+        - CONFIG="--disable-system"
         - TEST_CMD="make -j3 check-tcg V=1"
-- 
2.20.1
