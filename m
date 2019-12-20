Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n16sm9986070wro.88.2019.12.20.05.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 05:22:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0C7811FF91;
	Fri, 20 Dec 2019 13:22:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 4/5] tests/tcg: add a dumb-as-bricks semihosting console test
Date: Fri, 20 Dec 2019 13:22:45 +0000
Message-Id: <20191220132246.6759-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220132246.6759-1-alex.bennee@linaro.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3GK4NayEIiV1

We don't run this during check-tcg as we would need to check stuff is
echoed back. However we can still build the binary so people can test
it manually.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v8
  - actually return the result!
---
 tests/tcg/aarch64/system/semiconsole.c    | 38 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  9 +++++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/system/semiconsole.c

diff --git a/tests/tcg/aarch64/system/semiconsole.c b/tests/tcg/aarch64/system/semiconsole.c
new file mode 100644
index 00000000000..bfe7c9e26b4
--- /dev/null
+++ b/tests/tcg/aarch64/system/semiconsole.c
@@ -0,0 +1,38 @@
+/*
+ * Semihosting Console Test
+ *
+ * Copyright (c) 2019 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <inttypes.h>
+#include <minilib.h>
+
+#define SYS_READC 0x7
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+
+    return t;
+}
+
+int main(void)
+{
+    char c;
+
+    ml_printf("Semihosting Console Test\n");
+    ml_printf("hit X to exit:");
+
+    do {
+        c = __semi_call(SYS_READC, 0);
+        __sys_outc(c);
+    } while (c != 'X');
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 950dbb4bac2..9bdcfd9e7e4 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -31,7 +31,14 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
 # Running
-QEMU_OPTS+=-M virt -cpu max -display none -semihosting-config enable=on,target=native,chardev=output -kernel
+QEMU_BASE_MACHINE=-M virt -cpu max -display none
+QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
+
+# console test is manual only
+QEMU_SEMIHOST=-chardev stdio,mux=on,id=stdio0 -semihosting-config enable=on,chardev=stdio0 -mon chardev=stdio0,mode=readline
+run-semiconsole: QEMU_OPTS=$(QEMU_BASE_MACHINE) $(QEMU_SEMIHOST)  -kernel
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
 
 # Simple Record/Replay Test
 .PHONY: memory-record
-- 
2.20.1
