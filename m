Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 32sm6830428wra.35.2019.05.30.07.39.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 07:39:26 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A03461FF87;
	Thu, 30 May 2019 15:39:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] semihosting: split console_out intro string and char versions
Date: Thu, 30 May 2019 15:39:16 +0100
Message-Id: <20190530143916.20255-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MjIc8yZy1WgB

This is ostensibly to avoid the weirdness of len looking like it might
come from a guest and sometimes being used. While we are at it fix up
the error checking for the arm-linux-user implementation of the API
which got flagged up by Coverity (CID 1401700).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/semihosting/console.c         | 34 +++++++++++++++++++++++---------
 include/hw/semihosting/console.h | 25 +++++++++++++++++------
 linux-user/arm/semihost.c        | 28 ++++++++++++++++++++++++--
 target/arm/arm-semi.c            |  4 ++--
 4 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index 466ea6dade7..4a5758972db 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -36,26 +36,24 @@ int qemu_semihosting_log_out(const char *s, int len)
 /*
  * A re-implementation of lock_user_string that we can use locally
  * instead of relying on softmmu-semi. Hopefully we can deprecate that
- * in time. We either copy len bytes if specified or until we find a NULL.
+ * in time. Copy string until we find a 0 or address error.
  */
-static GString *copy_user_string(CPUArchState *env, target_ulong addr, int len)
+static GString *copy_user_string(CPUArchState *env, target_ulong addr)
 {
     CPUState *cpu = ENV_GET_CPU(env);
-    GString *s = g_string_sized_new(len ? len : 128);
+    GString *s = g_string_sized_new(128);
     uint8_t c;
-    bool done;
 
     do {
         if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
             s = g_string_append_c(s, c);
-            done = len ? s->len == len : c == 0;
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: passed inaccessible address " TARGET_FMT_lx,
                           __func__, addr);
-            done = true;
+            break;
         }
-    } while (!done);
+    } while (c!=0);
 
     return s;
 }
@@ -68,9 +66,9 @@ static void semihosting_cb(CPUState *cs, target_ulong ret, target_ulong err)
     }
 }
 
-int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
+int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
 {
-    GString *s = copy_user_string(env, addr, len);
+    GString *s = copy_user_string(env, addr);
     int out = s->len;
 
     if (use_gdb_syscalls()) {
@@ -82,3 +80,21 @@ int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
     g_string_free(s, true);
     return out;
 }
+
+void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    uint8_t c;
+
+    if (cpu_memory_rw_debug(cpu, addr, &c, 1, 0) == 0) {
+        if (use_gdb_syscalls()) {
+            gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, 1);
+        } else {
+            qemu_semihosting_log_out((const char *) &c, 1);
+        }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: passed inaccessible address " TARGET_FMT_lx,
+                      __func__, addr);
+    }
+}
diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
index 30e66ae20aa..3a4fba75905 100644
--- a/include/hw/semihosting/console.h
+++ b/include/hw/semihosting/console.h
@@ -10,17 +10,30 @@
 #define _SEMIHOST_CONSOLE_H_
 
 /**
- * qemu_semihosting_console_out:
+ * qemu_semihosting_console_outs:
  * @env: CPUArchState
- * @s: host address of guest string
- * @len: length of string or 0 (string is null terminated)
+ * @s: host address of null terminated guest string
  *
- * Send a guest string to the debug console. This may be the remote
- * gdb session if a softmmu guest is currently being debugged.
+ * Send a null terminated guest string to the debug console. This may
+ * be the remote gdb session if a softmmu guest is currently being
+ * debugged.
  *
  * Returns: number of bytes written.
  */
-int qemu_semihosting_console_out(CPUArchState *env, target_ulong s, int len);
+int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
+
+/**
+ * qemu_semihosting_console_outc:
+ * @env: CPUArchState
+ * @s: host address of null terminated guest string
+ *
+ * Send single character from guest memory to the debug console. This
+ * may be the remote gdb session if a softmmu guest is currently being
+ * debugged.
+ *
+ * Returns: nothing
+ */
+void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
 /**
  * qemu_semihosting_log_out:
diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
index 9554102a855..b7cdc21f832 100644
--- a/linux-user/arm/semihost.c
+++ b/linux-user/arm/semihost.c
@@ -15,10 +15,34 @@
 #include "hw/semihosting/console.h"
 #include "qemu.h"
 
-int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
+int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
 {
+    int len;
     void *s = lock_user_string(addr);
-    len = write(STDERR_FILENO, s, len ? len : strlen(s));
+    if (!s) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: passed inaccessible address " TARGET_FMT_lx,
+                      __func__, addr);
+        return 0;
+    }
+
+    len = write(STDERR_FILENO, s, strlen(s));
     unlock_user(s, addr, 0);
     return len;
 }
+
+void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
+{
+    char c;
+
+    if (get_user_u8(c, addr)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: passed inaccessible address " TARGET_FMT_lx,
+                      __func__, addr);
+    } else {
+        if (write(STDERR_FILENO, &c, 1) != 1) {
+            qemu_log_mask(LOG_UNIMP, "%s: unexpected write to stdout failure",
+                          __func__);
+        }
+    }
+}
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 53e807ab721..8844da8da38 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -315,10 +315,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, close(arg0));
         }
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_out(env, args, 1);
+        qemu_semihosting_console_outc(env, args);
         return 0xdeadbeef;
     case TARGET_SYS_WRITE0:
-        return qemu_semihosting_console_out(env, args, 0);
+        return qemu_semihosting_console_outs(env, args);
     case TARGET_SYS_WRITE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1
