Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v20sm2145002wml.26.2019.09.26.11.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 11:45:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DFE071FFA5;
	Thu, 26 Sep 2019 19:35:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 18/28] tests/tcg: add simple record/replay smoke test for aarch64
Date: Thu, 26 Sep 2019 19:35:43 +0100
Message-Id: <20190926183553.13895-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926183553.13895-1-alex.bennee@linaro.org>
References: <20190926183553.13895-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6xe1WHbVRQl5

This adds two new tests that re-use the memory test to check basic
record replay functionality is still working. We have to define our
own runners rather than using the default pattern as we want to change
the test name but re-use the memory binary.

We declare the test binaries as PHONY as they don't really exist.

[AJB: A better test would output some sort of timer value or other
otherwise variable value so we could compare the record and replay
outputs and ensure they match]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 4c4aaf61dd..b4b3957963 100644
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
