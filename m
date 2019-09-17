Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 189sm7087377wma.6.2019.09.17.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 11:41:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 85DB81FF8C;
	Tue, 17 Sep 2019 19:41:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 1/9] tests/docker: add sanitizers back to clang build
Date: Tue, 17 Sep 2019 19:41:01 +0100
Message-Id: <20190917184109.12564-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917184109.12564-1-alex.bennee@linaro.org>
References: <20190917184109.12564-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 08zzK0k9WxGV

From: John Snow <jsnow@redhat.com>

Fedora23 is but a distant twinkle.
The sanitizer works again, and even if not,
we have --enable-sanitizers now.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20190912014442.5757-1-jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-clang | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/docker/test-clang b/tests/docker/test-clang
index 324e341cea9..db9e6970b78 100755
--- a/tests/docker/test-clang
+++ b/tests/docker/test-clang
@@ -17,11 +17,7 @@ requires clang
 
 cd "$BUILD_DIR"
 
-OPTS="--cxx=clang++ --cc=clang --host-cc=clang"
-# -fsanitize=undefined is broken on Fedora 23, skip it for now
-# See also: https://bugzilla.redhat.com/show_bug.cgi?id=1263834
-#OPTS="$OPTS --extra-cflags=-fsanitize=undefined \
-    #--extra-cflags=-fno-sanitize=float-divide-by-zero"
+OPTS="--cxx=clang++ --cc=clang --host-cc=clang --enable-sanitizers"
 build_qemu $OPTS
 check_qemu
 install_qemu
-- 
2.20.1
