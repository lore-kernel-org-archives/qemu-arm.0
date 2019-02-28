Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e193sm11768176wmg.18.2019.02.28.12.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:40 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9286A1FF87;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 04/16] tests/tcg: add gdb runner variant
Date: Thu, 28 Feb 2019 20:25:25 +0000
Message-Id: <20190228202537.4638-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9Xllp5kB1JCC

With this you can launch a test in gdb with:

  cd $(BUILD)/tests
  make -f $(SRC)/tests/tcg/Makefile gdb-$(TEST_NAME)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 097e6374ea..47f4298e68 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -113,6 +113,9 @@ RUN_TESTS+=$(EXTRA_RUNS)
 run-%: %
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
 
+gdb-%: %
+	gdb --args $(QEMU) $(QEMU_OPTS) $<
+
 .PHONY: run
 run: $(RUN_TESTS)
 
-- 
2.20.1
