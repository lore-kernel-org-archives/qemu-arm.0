Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q81-v6sm5068421wmd.14.2018.05.18.04.44.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 May 2018 04:44:26 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4C04F3E027B;
	Fri, 18 May 2018 12:44:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/2] tests/tcg/aarch64: userspace system register test
Date: Fri, 18 May 2018 12:44:24 +0100
Message-Id: <20180518114424.18054-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518114424.18054-1-alex.bennee@linaro.org>
References: <20180518114424.18054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Zk0IPgsgZs0v

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/sysregs.c       | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/sysregs.c

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index ac177d9747..595927f027 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -7,7 +7,7 @@ VPATH 		+= $(AARCH64_SRC)
 
 # we don't build any of the ARM tests
 AARCH64_TESTS=$(filter-out $(ARM_TESTS), $(TESTS))
-AARCH64_TESTS+=fcvt
+AARCH64_TESTS+=fcvt sysregs
 TESTS:=$(AARCH64_TESTS)
 
 fcvt: LDFLAGS+=-lm
diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
new file mode 100644
index 0000000000..0cd0c42d8c
--- /dev/null
+++ b/tests/tcg/aarch64/sysregs.c
@@ -0,0 +1,14 @@
+#include <stdio.h>
+
+#define get_cpu_reg(id) ({                                      \
+                unsigned long __val;                            \
+                asm("mrs %0, "#id : "=r" (__val));              \
+                printf("%-20s: 0x%016lx\n", #id, __val);        \
+        })
+
+int main(void)
+{
+    get_cpu_reg(cntvct_el0);
+    get_cpu_reg(cntfrq_el0);
+    return 0;
+}
-- 
2.17.0
