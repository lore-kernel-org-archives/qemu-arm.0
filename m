Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id el9-20020a170907284900b006cf8e3c83e3sm1246265ejc.168.2022.02.25.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:26:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7345C1FFC7;
	Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH  v2 15/18] gitlab: upgrade the job definition for s390x to 20.04
Date: Fri, 25 Feb 2022 17:20:18 +0000
Message-Id: <20220225172021.3493923-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NBpzWBzc7rH7

The new s390x machine has more of everything including the OS. As
18.04 will soon be going we might as well get onto something moderately
modern.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml               |  2 +-
 ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 056c374619..3e76a2034a 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -14,6 +14,6 @@ variables:
   GIT_STRATEGY: clone
 
 include:
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
similarity index 87%
rename from .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index f39d874a1e..0333872113 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -1,12 +1,12 @@
-# All ubuntu-18.04 jobs should run successfully in an environment
+# All ubuntu-20.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+# "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
-ubuntu-18.04-s390x-all-linux-static:
+ubuntu-20.04-s390x-all-linux-static:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -21,11 +21,11 @@ ubuntu-18.04-s390x-all-linux-static:
  - make --output-sync -j`nproc` check V=1
  - make --output-sync -j`nproc` check-tcg V=1
 
-ubuntu-18.04-s390x-all:
+ubuntu-20.04-s390x-all:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -37,11 +37,11 @@ ubuntu-18.04-s390x-all:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-alldbg:
+ubuntu-20.04-s390x-alldbg:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -58,11 +58,11 @@ ubuntu-18.04-s390x-alldbg:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-clang:
+ubuntu-20.04-s390x-clang:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -78,11 +78,11 @@ ubuntu-18.04-s390x-clang:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-tci:
+ubuntu-20.04-s390x-tci:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -97,11 +97,11 @@ ubuntu-18.04-s390x-tci:
  - ../configure --disable-libssh --enable-tcg-interpreter
  - make --output-sync -j`nproc`
 
-ubuntu-18.04-s390x-notcg:
+ubuntu-20.04-s390x-notcg:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-- 
2.30.2
