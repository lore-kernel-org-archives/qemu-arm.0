Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g1sm5199698wrv.68.2019.09.18.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 08:34:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 68DD11FF87;
	Wed, 18 Sep 2019 16:34:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] tests/tcg: add simple record/replay smoke test for aarch64
Date: Wed, 18 Sep 2019 16:33:35 +0100
Message-Id: <20190918153335.20797-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jWBh3baKXQ9/

This adds two new tests that re-use the memory test to check basic
record replay functionality is still working. We have to define our
own runners rather than using the default pattern as we want to change
the test name but re-use the memory binary.

We declare the test binaries as PHONY as they don't rely exist.

[AJB: A better test would output some sort of timer value or other
otherwise variable value so we could compare the record and replay
outputs and ensure they match]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 4c4aaf61dd3..b4b39579634 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -32,3 +32,24 @@ memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
 # Running
 QEMU_OPTS+=-M virt -cpu max -display none -semihosting-config enable=on,target=native,chardev=output -kernel
+
+# Simple Record/Replay Test
+.PHONY: memory-record
+run-memory-record: memory-record memory
+	$(call run-test, $<, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -icount shift=5$(COMMA)rr=record$(COMMA)rrfile=record.bin \
+	   	  $(QEMU_OPTS) memory, \
+	  "$< on $(TARGET_NAME)")
+
+.PHONY: memory-replay
+run-memory-replay: memory-replay run-memory-record
+	$(call run-test, $<, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
+		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
+	   	  $(QEMU_OPTS) memory, \
+	  "$< on $(TARGET_NAME)")
+
+TESTS+=memory-record memory-replay
-- 
2.20.1
