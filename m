Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d17sm23214216wrw.18.2019.05.23.03.33.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:33:43 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A48B31FFAC;
	Thu, 23 May 2019 11:25:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v2 25/28] Makefile.target: support per-target coverage reports
Date: Thu, 23 May 2019 11:25:29 +0100
Message-Id: <20190523102532.10486-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kbfUvdfUwyZT

Add support for generating a single targets coverage report. Execute:

  make coverage-report

In the target build directory. This coverage report only cares about
target specific blobs so only searches the target build subdirectory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 Makefile.target | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Makefile.target b/Makefile.target
index fdbe7c89f4a..328c37902ea 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -238,3 +238,19 @@ endif
 
 generated-files-y += config-target.h
 Makefile: $(generated-files-y)
+
+# Reports/Analysis
+#
+# The target specific coverage report only cares about target specific
+# blobs and not the shared code.
+#
+
+%/coverage-report.html:
+	@mkdir -p $*
+	$(call quiet-command,\
+		gcovr -r $(SRC_PATH) --object-directory $(CURDIR) \
+		-p --html --html-details -o $@, \
+		"GEN", "coverage-report.html")
+
+.PHONY: coverage-report
+coverage-report: $(CURDIR)/reports/coverage/coverage-report.html
-- 
2.20.1
