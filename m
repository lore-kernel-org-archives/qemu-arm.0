Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j9sm6786562wrr.90.2019.05.14.08.53.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:05 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8F7AF1FF93;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  06/11] target/arm: use the common interface for WRITE0/WRITEC in arm-semi
Date: Tue, 14 May 2019 16:52:56 +0100
Message-Id: <20190514155301.16123-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Br8cDhSf0lf9

Now we have a common semihosting console interface use that for our
string output. However ARM is currently unique in also supporting
semihosting for linux-user so we need to replicate the API in
linux-user. If other architectures gain this support we can move the
file later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/Makefile.objs  |  2 ++
 linux-user/arm/semihost.c | 24 ++++++++++++++++++++++++
 target/arm/arm-semi.c     | 31 ++++++-------------------------
 3 files changed, 32 insertions(+), 25 deletions(-)
 create mode 100644 linux-user/arm/semihost.c

diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
index 769b8d83362..285c5dfa17a 100644
--- a/linux-user/Makefile.objs
+++ b/linux-user/Makefile.objs
@@ -6,4 +6,6 @@ obj-y = main.o syscall.o strace.o mmap.o signal.o \
 obj-$(TARGET_HAS_BFLT) += flatload.o
 obj-$(TARGET_I386) += vm86.o
 obj-$(TARGET_ARM) += arm/nwfpe/
+obj-$(TARGET_ARM) += arm/semihost.o
+obj-$(TARGET_AARCH64) += arm/semihost.o
 obj-$(TARGET_M68K) += m68k-sim.o
diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
new file mode 100644
index 00000000000..9554102a855
--- /dev/null
+++ b/linux-user/arm/semihost.c
@@ -0,0 +1,24 @@
+/*
+ * ARM Semihosting Console Support
+ *
+ * Copyright (c) 2019 Linaro Ltd
+ *
+ * Currently ARM is unique in having support for semihosting support
+ * in linux-user. So for now we implement the common console API but
+ * just for arm linux-user.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/semihosting/console.h"
+#include "qemu.h"
+
+int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
+{
+    void *s = lock_user_string(addr);
+    len = write(STDERR_FILENO, s, len ? len : strlen(s));
+    unlock_user(s, addr, 0);
+    return len;
+}
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 9e5a414dd89..253c66b172a 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -27,6 +27,7 @@
 
 #include "cpu.h"
 #include "hw/semihosting/semihost.h"
+#include "hw/semihosting/console.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -314,32 +315,12 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, close(arg0));
         }
     case TARGET_SYS_WRITEC:
-        {
-          char c;
-
-          if (get_user_u8(c, args))
-              /* FIXME - should this error code be -TARGET_EFAULT ? */
-              return (uint32_t)-1;
-          /* Write to debug console.  stderr is near enough.  */
-          if (use_gdb_syscalls()) {
-                return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,1", args);
-          } else {
-                return write(STDERR_FILENO, &c, 1);
-          }
-        }
+    {
+        qemu_semihosting_console_out(env, args, 1);
+        return 0xdeadbeef;
+    }
     case TARGET_SYS_WRITE0:
-        if (!(s = lock_user_string(args)))
-            /* FIXME - should this error code be -TARGET_EFAULT ? */
-            return (uint32_t)-1;
-        len = strlen(s);
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,%x",
-                                   args, len);
-        } else {
-            ret = write(STDERR_FILENO, s, len);
-        }
-        unlock_user(s, args, 0);
-        return ret;
+        return qemu_semihosting_console_out(env, args, 0);
     case TARGET_SYS_WRITE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1
