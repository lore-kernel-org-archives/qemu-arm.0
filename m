Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm16050022wms.19.2023.01.24.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C32D51FFC7;
	Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/35] gitlab: wrap up test results for custom runners
Date: Tue, 24 Jan 2023 18:01:09 +0000
Message-Id: <20230124180127.1881110-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HlDoZIDp6GX6

Instead of spewing the whole log to stdout lets just define them as
build artefacts so we can examine them later. Where we are running
check-tcg run it first as those tests are yet to be integrated into
meson. To avoid confusion we don't run multiple check-tcg tests at
once.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - mention we don't parallelise check-tcg
---
 .gitlab-ci.d/custom-runners.yml                     | 11 +++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml  | 13 ++++++-------
 .../custom-runners/ubuntu-22.04-aarch32.yml         |  2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml         | 13 ++++++-------
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 97f99e29c2..9fdc476c48 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -13,6 +13,17 @@
 variables:
   GIT_STRATEGY: clone
 
+# All custom runners can extend this template to upload the testlog
+# data as an artifact and also feed the junit report
+.custom_artifacts_template:
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
+
 include:
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index fcaef9e5ef..f512eaeaa3 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -3,6 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
 ubuntu-20.04-s390x-all-linux-static:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -19,12 +20,11 @@ ubuntu-20.04-s390x-all-linux-static:
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
+ - make --output-sync check-tcg
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - make --output-sync -j`nproc` check-tcg
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-all:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -41,9 +41,9 @@ ubuntu-20.04-s390x-all:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-alldbg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -64,9 +64,9 @@ ubuntu-20.04-s390x-alldbg:
  - make clean
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-clang:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -86,7 +86,6 @@ ubuntu-20.04-s390x-clang:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-tci:
  needs: []
@@ -109,6 +108,7 @@ ubuntu-20.04-s390x-tci:
  - make --output-sync -j`nproc`
 
 ubuntu-20.04-s390x-notcg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -128,4 +128,3 @@ ubuntu-20.04-s390x-notcg:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 2c386fa3e9..42137aaf2a 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -3,6 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch32-all:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -22,4 +23,3 @@ ubuntu-22.04-aarch32-all:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 725ca8ffea..8ba85be440 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -3,6 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -19,12 +20,11 @@ ubuntu-22.04-aarch64-all-linux-static:
  - ../configure --enable-debug --static --disable-system --disable-pie
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
+ - make check-tcg
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - make --output-sync -j`nproc --ignore=40` check-tcg
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-all:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -44,9 +44,9 @@ ubuntu-22.04-aarch64-all:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-alldbg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -63,9 +63,9 @@ ubuntu-22.04-aarch64-alldbg:
  - make clean
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-clang:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -85,7 +85,6 @@ ubuntu-22.04-aarch64-clang:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-tci:
  needs: []
@@ -108,6 +107,7 @@ ubuntu-22.04-aarch64-tci:
  - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-22.04-aarch64-notcg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -127,4 +127,3 @@ ubuntu-22.04-aarch64-notcg:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
-- 
2.34.1
