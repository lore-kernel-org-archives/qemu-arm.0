Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y189sm6540544wmy.25.2021.06.04.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7351C1FFAA;
	Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 20/99] target/arm: tcg: move sysemu-only parts of debug_helper
Date: Fri,  4 Jun 2021 16:51:53 +0100
Message-Id: <20210604155312.15902-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p8FHZ/GTGaBV

From: Claudio Fontana <cfontana@suse.de>

move sysemu-only parts of debug_helper to sysemu/

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/debug_helper.c        | 27 -----------------------
 target/arm/tcg/sysemu/debug_helper.c | 33 ++++++++++++++++++++++++++++
 target/arm/tcg/sysemu/meson.build    |  1 +
 3 files changed, 34 insertions(+), 27 deletions(-)
 create mode 100644 target/arm/tcg/sysemu/debug_helper.c

diff --git a/target/arm/tcg/debug_helper.c b/target/arm/tcg/debug_helper.c
index 2ff72d47d1..66a0915393 100644
--- a/target/arm/tcg/debug_helper.c
+++ b/target/arm/tcg/debug_helper.c
@@ -308,30 +308,3 @@ void arm_debug_excp_handler(CPUState *cs)
                         arm_debug_target_el(env));
     }
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * In BE32 system mode, target memory is stored byteswapped (on a
-     * little-endian host system), and by the time we reach here (via an
-     * opcode helper) the addresses of subword accesses have been adjusted
-     * to account for that, which means that watchpoints will not match.
-     * Undo the adjustment here.
-     */
-    if (arm_sctlr_b(env)) {
-        if (len == 1) {
-            addr ^= 3;
-        } else if (len == 2) {
-            addr ^= 2;
-        }
-    }
-
-    return addr;
-}
-
-#endif
diff --git a/target/arm/tcg/sysemu/debug_helper.c b/target/arm/tcg/sysemu/debug_helper.c
new file mode 100644
index 0000000000..0bce00144f
--- /dev/null
+++ b/target/arm/tcg/sysemu/debug_helper.c
@@ -0,0 +1,33 @@
+/*
+ * ARM debug helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * In BE32 system mode, target memory is stored byteswapped (on a
+     * little-endian host system), and by the time we reach here (via an
+     * opcode helper) the addresses of subword accesses have been adjusted
+     * to account for that, which means that watchpoints will not match.
+     * Undo the adjustment here.
+     */
+    if (arm_sctlr_b(env)) {
+        if (len == 1) {
+            addr ^= 3;
+        } else if (len == 2) {
+            addr ^= 2;
+        }
+    }
+
+    return addr;
+}
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 6f014f77ec..1a4d7a0940 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,3 +1,4 @@
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'debug_helper.c',
   'mte_helper.c',
 ))
-- 
2.20.1
