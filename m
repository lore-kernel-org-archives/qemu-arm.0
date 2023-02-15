Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g4-20020a5d6984000000b002c552c6c8c2sm10823091wru.87.2023.02.15.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4024C1FFB7;
	Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 06/12] gitlab: extend custom runners with base_job_template
Date: Wed, 15 Feb 2023 19:25:24 +0000
Message-Id: <20230215192530.299263-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jzpGFqM4dpoQ

The base job template is responsible for controlling how we kick off
testing on our various branches. Rename and extend the
custom_runner_template so we can take advantage of all that control.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml                      |  3 ++-
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 10 +++++-----
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 10 +++++-----
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 9fdc476c48..34a1e6f327 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -15,7 +15,8 @@ variables:
 
 # All custom runners can extend this template to upload the testlog
 # data as an artifact and also feed the junit report
-.custom_artifacts_template:
+.custom_runner_template:
+  extends: .base_job_template
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
     expire_in: 7 days
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index f512eaeaa3..cdae6c5212 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -3,7 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
 ubuntu-20.04-s390x-all-linux-static:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -24,7 +24,7 @@ ubuntu-20.04-s390x-all-linux-static:
  - make --output-sync -j`nproc` check
 
 ubuntu-20.04-s390x-all:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -43,7 +43,7 @@ ubuntu-20.04-s390x-all:
  - make --output-sync -j`nproc` check
 
 ubuntu-20.04-s390x-alldbg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -66,7 +66,7 @@ ubuntu-20.04-s390x-alldbg:
  - make --output-sync -j`nproc` check
 
 ubuntu-20.04-s390x-clang:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -108,7 +108,7 @@ ubuntu-20.04-s390x-tci:
  - make --output-sync -j`nproc`
 
 ubuntu-20.04-s390x-notcg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 42137aaf2a..50e5646a44 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -3,7 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch32-all:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 8ba85be440..13e14a0f87 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -3,7 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -24,7 +24,7 @@ ubuntu-22.04-aarch64-all-linux-static:
  - make --output-sync -j`nproc --ignore=40` check
 
 ubuntu-22.04-aarch64-all:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -46,7 +46,7 @@ ubuntu-22.04-aarch64-all:
  - make --output-sync -j`nproc --ignore=40` check
 
 ubuntu-22.04-aarch64-alldbg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -65,7 +65,7 @@ ubuntu-22.04-aarch64-alldbg:
  - make --output-sync -j`nproc --ignore=40` check
 
 ubuntu-22.04-aarch64-clang:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -107,7 +107,7 @@ ubuntu-22.04-aarch64-tci:
  - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-22.04-aarch64-notcg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
-- 
2.39.1
