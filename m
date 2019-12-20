Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x132sm13756583wmg.0.2019.12.20.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 05:22:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 259591FF92;
	Fri, 20 Dec 2019 13:22:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 5/5] tests/tcg: add user version of dumb-as-bricks semiconsole test
Date: Fri, 20 Dec 2019 13:22:46 +0000
Message-Id: <20191220132246.6759-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220132246.6759-1-alex.bennee@linaro.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wrWgLCZbHkdr

There are linux-user users of semihosting so we'd better check things
work for them as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/semiconsole.c   | 47 +++++++++++++++++++++++++++++++++++
 tests/tcg/arm/Makefile.target |  7 ++++++
 2 files changed, 54 insertions(+)
 create mode 100644 tests/tcg/arm/semiconsole.c

diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/arm/semiconsole.c
new file mode 100644
index 00000000000..cc9266b87df
--- /dev/null
+++ b/tests/tcg/arm/semiconsole.c
@@ -0,0 +1,47 @@
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
+
+#define SYS_READC  0x7
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+#if defined(__arm__)
+    register uintptr_t t asm("r0") = type;
+    register uintptr_t a0 asm("r1") = arg0;
+    asm("svc 0xab"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+#else
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+#endif
+
+    return t;
+}
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
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 0765f37ff04..997e6e78ed9 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -40,6 +40,13 @@ run-plugin-semihosting-with-%:
 		 $(call strip-plugin,$<) 2> $<.err, \
 		"$< on $(TARGET_NAME) with $*")
 
+ARM_TESTS += semiconsole
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-semiconsole-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.20.1
