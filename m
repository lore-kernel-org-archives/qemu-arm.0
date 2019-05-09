Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z17sm3625846wrm.33.2019.05.09.09.59.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 09:59:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7423D1FF87;
	Thu,  9 May 2019 17:59:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH  v1 17/23] tests/qemu-iotests/check: Pick a default machine if necessary
Date: Thu,  9 May 2019 17:59:05 +0100
Message-Id: <20190509165912.10512-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Lv78nIv5v/qh

From: Thomas Huth <thuth@redhat.com>

qemu-system-arm, qemu-system-aarch64 and qemu-system-tricore do not have
a default machine, so when running the qemu-iotests with such a binary,
lots of tests are failing. Fix it by picking a default machine in the
"check" script instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190502084506.8009-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/check | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index f9c24b6753c..922c5d1d3d3 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -130,7 +130,6 @@ export CACHEMODE="writeback"
 export QEMU_IO_OPTIONS=""
 export QEMU_IO_OPTIONS_NO_FMT=""
 export CACHEMODE_IS_DEFAULT=true
-export QEMU_OPTIONS="-nodefaults -machine accel=qtest"
 export VALGRIND_QEMU=
 export IMGKEYSECRET=
 export IMGOPTSSYNTAX=false
@@ -564,6 +563,18 @@ then
 fi
 export QEMU_PROG="$(type -p "$QEMU_PROG")"
 
+case "$QEMU_PROG" in
+    *qemu-system-arm|*qemu-system-aarch64)
+        export QEMU_OPTIONS="-nodefaults -machine virt,accel=qtest"
+        ;;
+    *qemu-system-tricore)
+        export QEMU_OPTIONS="-nodefaults -machine tricore_testboard,accel=qtest"
+        ;;
+    *)
+        export QEMU_OPTIONS="-nodefaults -machine accel=qtest"
+        ;;
+esac
+
 if [ -z "$QEMU_IMG_PROG" ]; then
     if [ -x "$build_iotests/qemu-img" ]; then
         export QEMU_IMG_PROG="$build_iotests/qemu-img"
-- 
2.20.1
