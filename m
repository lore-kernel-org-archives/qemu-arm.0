Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d6903000000b002c56af32e8csm10765603wru.35.2023.02.28.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:14:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 257451FFC9;
	Tue, 28 Feb 2023 19:06:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 22/24] gitlab: move the majority of artefact handling to a template
Date: Tue, 28 Feb 2023 19:06:51 +0000
Message-Id: <20230228190653.1602033-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5DxRZ2Fb7Enn

To avoid lots of copy and paste lets deal with artefacts in a
template. This way we can filter out most of the pre-binary object and
library files we no longer need as we have the final binaries.

build-system-alpine also saved .git-submodule-status so for simplicity
we bring that into the template as well.

As an example the build-system-ubuntu artefacts before this patch
where around 1.3 GB, after dropping the object files it comes to 970
MB.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 16 ++++++
 .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
 2 files changed, 46 insertions(+), 51 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index cb96b55c3f..a6cfe9be97 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -25,6 +25,22 @@
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
+# We jump some hoops in common_test_job_template to avoid
+# rebuilding all the object files we skip in the artifacts
+.native_build_artifact_template:
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+      - .git-submodule-status
+    exclude:
+      - build/**/*.p
+      - build/**/*.a.p
+      - build/**/*.fa.p
+      - build/**/*.c.o
+      - build/**/*.c.o.d
+      - build/**/*.fa
+
 .common_test_job_template:
   extends: .base_job_template
   stage: test
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 43f9e4a81d..44b8275299 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -2,7 +2,9 @@ include:
   - local: '/.gitlab-ci.d/buildtest-template.yml'
 
 build-system-alpine:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     - job: amd64-alpine-container
   variables:
@@ -11,11 +13,6 @@ build-system-alpine:
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
     CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - .git-submodule-status
-      - build
 
 check-system-alpine:
   extends: .native_test_job_template
@@ -36,7 +33,9 @@ avocado-system-alpine:
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-ubuntu:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-ubuntu2204-container
   variables:
@@ -45,10 +44,6 @@ build-system-ubuntu:
     TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-ubuntu:
   extends: .native_test_job_template
@@ -69,7 +64,9 @@ avocado-system-ubuntu:
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-debian-container
   variables:
@@ -78,10 +75,6 @@ build-system-debian:
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-debian:
   extends: .native_test_job_template
@@ -114,7 +107,9 @@ crash-test-debian:
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -123,10 +118,6 @@ build-system-fedora:
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-fedora:
   extends: .native_test_job_template
@@ -160,7 +151,9 @@ crash-test-fedora:
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
 build-system-centos:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -170,10 +163,6 @@ build-system-centos:
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-centos:
   extends: .native_test_job_template
@@ -194,17 +183,15 @@ avocado-system-centos:
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-opensuse:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-opensuse-leap-container
   variables:
     IMAGE: opensuse-leap
     TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-opensuse:
   extends: .native_test_job_template
@@ -339,7 +326,9 @@ clang-user:
 # Split in three sets of build/check/avocado to limit the execution time of each
 # job
 build-cfi-aarch64:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -355,10 +344,6 @@ build-cfi-aarch64:
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
   timeout: 90m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -379,7 +364,9 @@ avocado-cfi-aarch64:
     MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-ppc64-s390x:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -395,10 +382,6 @@ build-cfi-ppc64-s390x:
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
   timeout: 80m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
@@ -419,7 +402,9 @@ avocado-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-x86_64:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -431,10 +416,6 @@ build-cfi-x86_64:
     TARGETS: x86_64-softmmu
     MAKE_CHECK_ARGS: check-build
   timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-cfi-x86_64:
   extends: .native_test_job_template
@@ -564,7 +545,9 @@ build-libvhost-user:
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
 build-tools-and-docs-debian:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-debian-container
     # when running on 'master' we use pre-existing container
@@ -574,10 +557,6 @@ build-tools-and-docs-debian:
     MAKE_CHECK_ARGS: check-unit ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
     QEMU_JOB_PUBLISH: 1
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 # Prepare for GitLab pages deployment. Anything copied into the
 # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
-- 
2.39.2
