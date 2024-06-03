Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064bbb1sm9295671f8f.101.2024.06.03.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:31 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1C8CB5F9FB;
	Mon,  3 Jun 2024 18:53:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH v3 06/12] docs/ci: clean-up references for consistency
Date: Mon,  3 Jun 2024 18:53:22 +0100
Message-Id: <20240603175328.3823123-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603175328.3823123-1-alex.bennee@linaro.org>
References: <20240603175328.3823123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: of8JoQF/R3iS

Document we have split up build-environment by distro and update the
references that exist in the code base to be correct.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240529160934.982373-7-alex.bennee@linaro.org>
---
 docs/devel/ci-runners.rst.inc                       | 13 ++++++-------
 .../custom-runners/ubuntu-22.04-aarch32.yml         |  2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml         |  2 +-
 .gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml  |  2 +-
 scripts/ci/setup/{ => ubuntu}/build-environment.yml |  0
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename scripts/ci/setup/{ => ubuntu}/build-environment.yml (100%)

diff --git a/docs/devel/ci-runners.rst.inc b/docs/devel/ci-runners.rst.inc
index 7817001fb2..67b23d3719 100644
--- a/docs/devel/ci-runners.rst.inc
+++ b/docs/devel/ci-runners.rst.inc
@@ -41,19 +41,18 @@ those hosts.  This would look like::
 Build environment
 ~~~~~~~~~~~~~~~~~
 
-The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
-set up machines with the environment needed to perform builds and run
-QEMU tests.  This playbook consists on the installation of various
-required packages (and a general package update while at it).  It
-currently covers a number of different Linux distributions, but it can
-be expanded to cover other systems.
+The ``scripts/ci/setup/$DISTRO/build-environment.yml`` Ansible
+playbook will set up machines with the environment needed to perform
+builds and run QEMU tests. This playbook consists on the installation
+of various required packages (and a general package update while at
+it).
 
 The minimum required version of Ansible successfully tested in this
 playbook is 2.8.0 (a version check is embedded within the playbook
 itself).  To run the playbook, execute::
 
   cd scripts/ci/setup
-  ansible-playbook -i inventory build-environment.yml
+  ansible-playbook -i inventory $DISTRO/build-environment.yml
 
 Please note that most of the tasks in the playbook require superuser
 privileges, such as those from the ``root`` account or those obtained
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index b8a0d75162..8727687e2b 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -1,5 +1,5 @@
 # All ubuntu-22.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# setup by the scripts/ci/setup/ubuntu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-aarch32-all:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 374b0956c3..263a3c2140 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -1,5 +1,5 @@
 # All ubuntu-22.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# setup by the scripts/ci/setup/ubuntu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
index 25935048e2..69ddd3e7d5 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
@@ -1,5 +1,5 @@
 # All ubuntu-22.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/build-environment.yml task
+# setup by the scripts/ci/setup/ubuntu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-s390x-all-linux:
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/ubuntu/build-environment.yml
similarity index 100%
rename from scripts/ci/setup/build-environment.yml
rename to scripts/ci/setup/ubuntu/build-environment.yml
-- 
2.39.2
