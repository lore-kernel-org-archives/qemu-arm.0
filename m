Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003dc4a47605fsm2617132wmf.8.2023.03.10.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0C2331FFBD;
	Fri, 10 Mar 2023 10:31:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 05/11] gitlab: update centos-8-stream job
Date: Fri, 10 Mar 2023 10:31:17 +0000
Message-Id: <20230310103123.2118519-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PmjhKBph+ECO

A couple of clean-ups here:

  - inherit from the custom runners job for artefacts
  - call check-avocado directly
  - add some comments to the top about setup

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/centos-stream-8-x86_64.yml  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
index 068b0c4335..367424db78 100644
--- a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
+++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
@@ -1,4 +1,9 @@
+# All centos-stream-8 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/stream/8/build-environment.yml task
+# "Installation of extra packages to build QEMU"
+
 centos-stream-8-x86_64:
+ extends: .custom_runner_template
  allow_failure: true
  needs: []
  stage: build
@@ -8,15 +13,6 @@ centos-stream-8-x86_64:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
- artifacts:
-   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-   when: on_failure
-   expire_in: 7 days
-   paths:
-     - build/tests/results/latest/results.xml
-     - build/tests/results/latest/test-results
-   reports:
-     junit: build/tests/results/latest/results.xml
  before_script:
  - JOBS=$(expr $(nproc) + 1)
  script:
@@ -25,6 +21,4 @@ centos-stream-8-x86_64:
  - ../scripts/ci/org.centos/stream/8/x86_64/configure
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make -j"$JOBS"
- - make NINJA=":" check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
+ - make NINJA=":" check check-avocado
-- 
2.39.2
