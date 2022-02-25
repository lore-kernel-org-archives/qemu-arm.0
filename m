Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709063f8e00b006ae0a666c02sm1234540ejj.96.2022.02.25.09.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DFF731FFC1;
	Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
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
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 09/18] gitlab: add a new aarch32 custom runner definition
Date: Fri, 25 Feb 2022 17:20:12 +0000
Message-Id: <20220225172021.3493923-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ia2RepZXqNaR

Although running on aarch64 hardware we can still target 32bit builds
with a cross compiler and run the resulting binaries.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-9-alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc                    |  7 ++++++
 .../custom-runners/ubuntu-20.40-aarch32.yml   | 23 +++++++++++++++++++
 scripts/ci/setup/gitlab-runner.yml            |  4 ++++
 3 files changed, 34 insertions(+)
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index db3f571d5f..92e25872aa 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -44,6 +44,13 @@ If you've got access to an aarch64 host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "aarch64".
 
+AARCH32_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an armhf host or an arch64 host that can run
+aarch32 EL0 code to be used as a gitlab-CI runner, you can set this
+variable to enable the tests that require this kind of host. The
+runner should be tagged with "aarch32".
+
 S390X_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an IBM Z host that can be used as a gitlab-CI
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
new file mode 100644
index 0000000000..9c589bc4cf
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
@@ -0,0 +1,23 @@
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-20.04-aarch32-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch32
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH32_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --cross-prefix=arm-linux-gnueabihf-
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 19bfd68f7e..33128be85d 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -84,6 +84,10 @@
 
     - name: Register secondary gitlab-runner
       command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
 
     - name: Install the secondary gitlab-runner service using its own functionality
       command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
-- 
2.30.2
