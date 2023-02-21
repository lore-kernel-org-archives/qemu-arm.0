Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j9-20020adff009000000b002c3ea5ebc73sm4712403wro.101.2023.02.21.01.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:46:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9020A1FFC3;
	Tue, 21 Feb 2023 09:46:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 13/14] tests: ensure we export job results for some cross builds
Date: Tue, 21 Feb 2023 09:45:57 +0000
Message-Id: <20230221094558.2864616-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QhDb6Ejmpkg7

We do run tests on some cross builds. Provide a template to ensure we
export the testlog to the build artefacts and report the test results
via the junit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>

---
v2
  - properly format extends
---
 .gitlab-ci.d/crossbuild-template.yml | 11 +++++++++++
 .gitlab-ci.d/crossbuilds.yml         | 12 +++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 6d709628f1..24a41a7b21 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -48,3 +48,14 @@
           nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
           xtensa-linux-user $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+
+# We can still run some tests on some of our cross build jobs. They can add this
+# template to their extends to save the build logs and test results
+.cross_test_artifacts:
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 74d6259b90..bbc013725c 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -44,7 +44,9 @@ cross-arm64-user:
     IMAGE: debian-arm64-cross
 
 cross-i386-system:
-  extends: .cross_system_build_job
+  extends:
+    - .cross_system_build_job
+    - .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -52,7 +54,9 @@ cross-i386-system:
     MAKE_CHECK_ARGS: check-qtest
 
 cross-i386-user:
-  extends: .cross_user_build_job
+  extends:
+    - .cross_user_build_job
+    - .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -60,7 +64,9 @@ cross-i386-user:
     MAKE_CHECK_ARGS: check
 
 cross-i386-tci:
-  extends: .cross_accel_build_job
+  extends:
+    - .cross_accel_build_job
+    - .cross_test_artifacts
   timeout: 60m
   needs:
     job: i386-fedora-cross-container
-- 
2.39.1
