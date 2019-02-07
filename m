Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x18sm1591528wrw.61.2019.02.07.10.37.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:47 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C31BF1FF84;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 04/16] .travis.yml: fold --disable-tcg into alternate coroutine builds
Date: Thu,  7 Feb 2019 18:37:32 +0000
Message-Id: <20190207183744.5054-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gJEUcLv5ACtC

The alternate coroutine builds are really only of interest to people
running KVM (although I think you could use them for TCG if you really
tried). As they tend to run long lets kill two birds with one stone
and fold the --disable-tcg build into them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 652be702ac..baa06b976a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -97,12 +97,16 @@ matrix:
         - CONFIG="--enable-modules --disable-linux-user"
 
 
+    # Alternate coroutines implementations are only really of interest to KVM users
+    # However we can't test against KVM on Travis so we can only run unit tests
     - env:
-        - CONFIG="--with-coroutine=ucontext --disable-linux-user"
+        - CONFIG="--with-coroutine=ucontext --disable-tcg"
+        - TEST_CMD="make check-unit -j3 V=1"
 
 
     - env:
-        - CONFIG="--with-coroutine=sigaltstack --disable-linux-user"
+        - CONFIG="--with-coroutine=sigaltstack --disable-tcg"
+        - TEST_CMD="make check-unit -j3 V=1"
 
 
     # Check we can build docs and tools
@@ -162,11 +166,6 @@ matrix:
         - TEST_CMD=""
 
 
-    - env:
-        - CONFIG="--disable-tcg"
-        - TEST_CMD=""
-
-
     # MacOSX builds
     - env:
         - CONFIG="--target-list=aarch64-softmmu,arm-softmmu,i386-softmmu,mips-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
-- 
2.20.1
