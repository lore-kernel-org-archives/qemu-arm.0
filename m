Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c238500b003f900678815sm8700257wma.39.2023.06.26.13.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:25:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 588C61FFBD;
	Mon, 26 Jun 2023 21:25:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Cleber Rosa <crosa@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 2/6] gitlab: ensure coverage job also publishes meson log
Date: Mon, 26 Jun 2023 21:25:11 +0100
Message-Id: <20230626202516.2507915-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626202516.2507915-1-alex.bennee@linaro.org>
References: <20230626202516.2507915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9XAJCghUh5fw

From: Daniel P. Berrangé <berrange@redhat.com>

The coverage job wants to publish a coverage report on success, but the
tests might fail and in that case we need the meson logs for debugging.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230623122100.1640995-3-alex.bennee@linaro.org>
Message-Id: <20230503145535.91325-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 24bba061cd..a8fd9a0c1f 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -462,9 +462,12 @@ gcov:
   coverage: /^\s*lines:\s*\d+.\d+\%/
   artifacts:
     name: ${CI_JOB_NAME}-${CI_COMMIT_REF_NAME}-${CI_COMMIT_SHA}
-    when: on_success
+    when: always
     expire_in: 2 days
+    paths:
+      - build/meson-logs/testlog.txt
     reports:
+      junit: build/meson-logs/testlog.junit.xml
       coverage_report:
         coverage_format: cobertura
         path: build/coverage.xml
-- 
2.39.2
