Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n189sm2823804wme.33.2020.01.10.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 08:16:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 769031FF8F;
	Fri, 10 Jan 2020 16:16:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 2/2] tests/tcg: add a vtimer test for aarch64
Date: Fri, 10 Jan 2020 16:16:26 +0000
Message-Id: <20200110161626.31943-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110161626.31943-1-alex.bennee@linaro.org>
References: <20200110161626.31943-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 048DIeY+8zx8

Bug: https://bugs.launchpad.net/bugs/1859021

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/vtimer.c         | 80 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  4 ++
 2 files changed, 84 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/vtimer.c

diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system/vtimer.c
new file mode 100644
index 00000000000..2f6299b5d2c
--- /dev/null
+++ b/tests/tcg/aarch64/system/vtimer.c
@@ -0,0 +1,80 @@
+/*
+ * Simple Virtual Timer Tests
+ *
+ * Note: kvm-unit-tests has a much more comprehensive exercising of
+ * the timer sub-system. However this test case can tweak _EL2 values
+ * to trigger bugs which can't be done with that.
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
+/* Physical Counter */
+static uint64_t last_pct;
+/* Timer Values */
+static uint32_t last_phys_tval;
+static uint32_t last_virt_tval;
+
+static void dump_status(void)
+{
+    uint64_t pct = read_sysreg(cntpct_el0);
+    uint32_t phys_tval = read_sysreg(cntp_tval_el0);
+    uint32_t virt_tval = read_sysreg(cntv_tval_el0);
+
+    ml_printf("timer values:\n");
+    /* the physical timer monotonically increments */
+    ml_printf("cntpct_el0=%ld (+%ld)\n", pct, pct - last_pct);
+    /* the various tvals decrement based on cval */
+    ml_printf("cntp_tval_el0=%ld (-%ld)\n", phys_tval,
+              last_phys_tval - phys_tval);
+    ml_printf("cntv_tval_el0=%ld (-%ld)\n", virt_tval,
+              last_virt_tval - virt_tval);
+
+    last_pct = pct;
+    last_phys_tval = phys_tval;
+    last_virt_tval = virt_tval;
+}
+
+int main(void)
+{
+    int i;
+
+    ml_printf("VTimer Tests\n");
+
+    dump_status();
+
+    ml_printf("Tweaking voff_el2 and cval\n");
+    write_sysreg(cntvoff_el2, 1);
+    write_sysreg(cntv_cval_el0, -1);
+
+    dump_status();
+
+    ml_printf("Enabling timer IRQs\n");
+    write_sysreg(cntv_ctl_el0, 1);
+    /* for bug 1859021 we hang here */
+
+    dump_status();
+
+    ml_printf("End of Vtimer test\n");
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
