Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8a0sm2478892f8f.96.2025.06.27.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:25:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4616F5F860;
	Fri, 27 Jun 2025 12:25:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 01/15] gitlab: mark s390x-system to allow failures
Date: Fri, 27 Jun 2025 12:24:57 +0100
Message-ID: <20250627112512.1880708-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627112512.1880708-1-alex.bennee@linaro.org>
References: <20250627112512.1880708-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 01fs2zl8JU/E

The system tests (usually qos-test or migration-test) prove to be very
susceptible on the s390x runners. Although we have boosted memory and
virtual CPUs on the runners problems persist. For now mark test as
allow_failure so the its clear on the CI UI when checking test
results.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
index ca374acb8c..e62ff1763f 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml
@@ -31,7 +31,9 @@ ubuntu-22.04-s390x-all-system:
  timeout: 75m
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   allow_failure: true
  - if: "$S390X_RUNNER_AVAILABLE"
+   allow_failure: true
  script:
  - mkdir build
  - cd build
-- 
2.47.2
