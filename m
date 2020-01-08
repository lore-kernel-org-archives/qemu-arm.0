Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 5sm4621418wrh.5.2020.01.08.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:02:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 884581FF93;
	Wed,  8 Jan 2020 15:02:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	keithp@keithp.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 6/6] tests/tcg: add user version of dumb-as-bricks semiconsole test
Date: Wed,  8 Jan 2020 15:02:52 +0000
Message-Id: <20200108150252.6216-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108150252.6216-1-alex.bennee@linaro.org>
References: <20200108150252.6216-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +oDTzsFeX2DR

There are linux-user users of semihosting so we'd better check things
work for them as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - include aarch64 version
v4
  - use common semicall.h, test thumb & arm
---
 tests/tcg/arm/semiconsole.c       | 27 +++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  7 +++++++
 tests/tcg/arm/Makefile.target     | 19 +++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 tests/tcg/arm/semiconsole.c

diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/arm/semiconsole.c
new file mode 100644
index 00000000000..6ef0bd24500
--- /dev/null
+++ b/tests/tcg/arm/semiconsole.c
@@ -0,0 +1,27 @@
+/*
+ * linux-user semihosting console
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+#include <stdio.h>
+#include <stdint.h>
+#include "semicall.h"
+
+int main(void)
+{
+    char c;
+
+    printf("Semihosting Console Test\n");
+    printf("hit X to exit:");
+
+    do {
+        c = __semi_call(SYS_READC, 0);
+        printf("got '%c'\n", c);
+    } while (c != 'X');
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 96d2321045a..4281c766419 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -32,4 +32,11 @@ run-plugin-semihosting-with-%:
 		 $(call strip-plugin,$<) 2> $<.err, \
 		"$< on $(TARGET_NAME) with $*")
 
+AARCH64_TESTS += semiconsole
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-semiconsole-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
 TESTS += $(AARCH64_TESTS)
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 41aa26f4e17..a104ca30281 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -49,6 +49,25 @@ run-plugin-semihosting-with-%:
 		 $(call strip-plugin,$<) 2> $<.err, \
 		"$< on $(TARGET_NAME) with $*")
 
+ARM_TESTS += semiconsole semiconsole-arm
+
+semiconsole: CFLAGS += -mthumb
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-semiconsole-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
+semiconsole-arm: CFLAGS += -marm
+semiconsole-arm: semiconsole.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-semiconsole-arm: semiconsole-arm
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-semiconsole-arm-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.20.1
