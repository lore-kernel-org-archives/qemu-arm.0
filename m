Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x189sm2978325wmg.23.2018.02.23.07.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:46:18 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 357FF3E042D;
	Fri, 23 Feb 2018 15:46:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 5/8] contrib/run_risu.sh: allow appending of QEMU_FLAGS
Date: Fri, 23 Feb 2018 15:46:10 +0000
Message-Id: <20180223154613.2096-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223154613.2096-1-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7Hz8FJZb7HGx

Useful if you want to disable a feature for your run. For example:

  set -x QEMU_FLAGS "-cpu fp16=off"

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/run_risu.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/contrib/run_risu.sh b/contrib/run_risu.sh
index 439cd36..63649dd 100755
--- a/contrib/run_risu.sh
+++ b/contrib/run_risu.sh
@@ -13,6 +13,7 @@
 #
 # Usage:
 #   (optional) export QEMU=/path/to/qemu
+#   (optional) export QEMU_FLAGS="-cpu any,fp16=off"
 #   (optional) export RISU=/path/to/risu
 #   ./run_risu.sh  ./testcases.aarch64/*.bin
 
@@ -29,9 +30,10 @@ fi
 
 for f in $@; do
     t="$f.trace"
-    echo "Running $f against $t"
+    CMD="${QEMU} ${QEMU_FLAGS} ${RISU} $f -t $t"
+    echo "Running: ${CMD}"
     if [ -e $t ]; then
-        ${QEMU} ${RISU} $f -t $t
+        ${CMD}
         if [ $? == 0 ]; then
             passed=( "${passed[@]}" $f )
         else
-- 
2.15.1
