Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y7sm4353442wmd.1.2020.01.09.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 08:25:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 814761FF87;
	Thu,  9 Jan 2020 16:25:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: 1859021@bugs.launchpad.net,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] tests/tcg: add a vtimer test for aarch64
Date: Thu,  9 Jan 2020 16:25:45 +0000
Message-Id: <20200109162545.1970-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <157857629827.5165.2496570379985305724.malonedeb@gac.canonical.com>
References: <157857629827.5165.2496570379985305724.malonedeb@gac.canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p7zGNMUFAl2j

Bug: https://bugs.launchpad.net/bugs/1859021

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/vtimer.c         | 48 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  4 ++
 2 files changed, 52 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/vtimer.c

diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system/vtimer.c
new file mode 100644
index 00000000000..42f2f7796c7
--- /dev/null
+++ b/tests/tcg/aarch64/system/vtimer.c
@@ -0,0 +1,48 @@
+/*
+ * Simple Virtual Timer Test
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <inttypes.h>
+#include <minilib.h>
+
+/* grabbed from Linux */
+#define __stringify_1(x...) #x
+#define __stringify(x...)   __stringify_1(x)
+
+#define read_sysreg(r) ({                                           \
+            uint64_t __val;                                         \
+            asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
+            __val;                                                  \
+})
+
+#define write_sysreg(r, v) do {                     \
+        uint64_t __val = (uint64_t)(v);             \
+        asm volatile("msr " __stringify(r) ", %x0"  \
+                 : : "rZ" (__val));                 \
+} while (0)
+
+int main(void)
+{
+    int i;
+
+    ml_printf("VTimer Test\n");
+
+    write_sysreg(cntvoff_el2, 1);
+    write_sysreg(cntv_cval_el0, -1);
+    write_sysreg(cntv_ctl_el0, 1);
+
+    ml_printf("cntvoff_el2=%lx\n", read_sysreg(cntvoff_el2));
+    ml_printf("cntv_cval_el0=%lx\n", read_sysreg(cntv_cval_el0));
+    ml_printf("cntv_ctl_el0=%lx\n", read_sysreg(cntv_ctl_el0));
+
+    /* Now read cval a few times */
+    for (i = 0; i < 10; i++) {
+        ml_printf("%d: cntv_cval_el0=%lx\n", i, read_sysreg(cntv_cval_el0));
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 7b4eede3f07..62cdddbb215 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -62,3 +62,7 @@ run-memory-replay: memory-replay run-memory-record
 	  "$< on $(TARGET_NAME)")
 
 EXTRA_TESTS+=memory-record memory-replay
+
+# vtimer test
+QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -smp 4
+run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_SEMIHOST)  -kernel
-- 
2.20.1
