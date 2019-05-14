Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 22sm3423359wmg.44.2019.05.14.08.53.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:02 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4A54F1FF90;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  03/11] semihosting: implement a semihosting console
Date: Tue, 14 May 2019 16:52:53 +0100
Message-Id: <20190514155301.16123-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 28OPLYhY0ycM

This provides two functions for handling console output that handle
the common backend behaviour for semihosting.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c                        |  5 +++
 hw/semihosting/Makefile.objs     |  1 +
 hw/semihosting/console.c         | 70 ++++++++++++++++++++++++++++++++
 include/exec/gdbstub.h           | 11 +++++
 include/hw/semihosting/console.h | 38 +++++++++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 hw/semihosting/console.c
 create mode 100644 include/hw/semihosting/console.h

diff --git a/gdbstub.c b/gdbstub.c
index 793218bb43a..b4334014373 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1987,6 +1987,11 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
     va_end(va);
 }
 
+void gdb_do_console_out(target_ulong s, int len)
+{
+    gdb_do_syscall(NULL, "write,2,%x,1", s, len);
+}
+
 static void gdb_read_byte(GDBState *s, int ch)
 {
     uint8_t reply;
diff --git a/hw/semihosting/Makefile.objs b/hw/semihosting/Makefile.objs
index 09c19bf19ed..4ad47c05c06 100644
--- a/hw/semihosting/Makefile.objs
+++ b/hw/semihosting/Makefile.objs
@@ -1 +1,2 @@
 obj-$(CONFIG_SEMIHOSTING) += config.o
+obj-$(CONFIG_SEMIHOSTING) += console.o
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
new file mode 100644
index 00000000000..ad6f67ecc71
--- /dev/null
+++ b/hw/semihosting/console.c
@@ -0,0 +1,70 @@
+/*
+ * Semihosting Console Support
+ *
+ * Copyright (c) 2015 Imagination Technologies
+ * Copyright (c) 2019 Linaro Ltd
+ *
+ * This provides support for outputting to a semihosting console.
+ *
+ * While most semihosting implementations support reading and writing
+ * to arbitrary file descriptors we treat the console as something
+ * specifically for debugging interaction. This means messages can be
+ * re-directed to gdb (if currently being used to debug) or even
+ * re-directed elsewhere.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/semihosting/console.h"
+#include "exec/gdbstub.h"
+#include "qemu/log.h"
+
+int qemu_semihosting_log_out(const char *s, int len)
+{
+    return write(STDERR_FILENO, s, len);
+}
+
+/*
+ * A re-implementation of lock_user_string that we can use locally
+ * instead of relying on softmmu-semi. Hopefully we can deprecate that
+ * in time. We either copy len bytes if specified or until we find a NULL.
+ */
+static GString *copy_user_string(CPUArchState *env, target_ulong addr, int len)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    GString *s = g_string_sized_new(len ? len : 128);
+    uint8_t c;
+    bool done;
+
+    do {
+        if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
+            s = g_string_append_c(s, c);
+            done = len ? s->len == len : c == 0;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: passed inaccessible address " TARGET_FMT_lx,
+                          __func__, addr);
+            done = true;
+        }
+    } while (!done);
+
+    return s;
+}
+
+
+int qemu_semihosting_console_out(CPUArchState *env, target_ulong addr, int len)
+{
+    GString *s = copy_user_string(env, addr, len);
+    int out = s->len;
+
+    if (use_gdb_syscalls()) {
+        gdb_do_console_out(addr, s->len);
+    } else {
+        out = qemu_semihosting_log_out(s->str, s->len);
+    }
+
+    g_string_free(s, true);
+    return out;
+}
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 08363969c14..b2963547c48 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -44,6 +44,17 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
  * argument list.
  */
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
+/**
+ * gdb_do_console_out:
+ * @gs: guest address of string to send
+ * @len: length of string
+ *
+ * Sends a string to gdb console. Unlike the system call interface
+ * there is no callback and we assume the system call always
+ * succeeds.
+ */
+void gdb_do_console_out(target_ulong s, int len);
+
 int use_gdb_syscalls(void);
 void gdb_set_stop_cpu(CPUState *cpu);
 void gdb_exit(CPUArchState *, int);
diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
new file mode 100644
index 00000000000..30e66ae20aa
--- /dev/null
+++ b/include/hw/semihosting/console.h
@@ -0,0 +1,38 @@
+/*
+ * Semihosting Console
+ *
+ * Copyright (c) 2019 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _SEMIHOST_CONSOLE_H_
+#define _SEMIHOST_CONSOLE_H_
+
+/**
+ * qemu_semihosting_console_out:
+ * @env: CPUArchState
+ * @s: host address of guest string
+ * @len: length of string or 0 (string is null terminated)
+ *
+ * Send a guest string to the debug console. This may be the remote
+ * gdb session if a softmmu guest is currently being debugged.
+ *
+ * Returns: number of bytes written.
+ */
+int qemu_semihosting_console_out(CPUArchState *env, target_ulong s, int len);
+
+/**
+ * qemu_semihosting_log_out:
+ * @s: pointer to string
+ * @len: length of string
+ *
+ * Send a string to the debug output. Unlike console_out these strings
+ * can't be sent to a remote gdb instance as they don't exist in guest
+ * memory.
+ *
+ * Returns: number of bytes written
+ */
+int qemu_semihosting_log_out(const char *s, int len);
+
+#endif /* _SEMIHOST_CONSOLE_H_ */
-- 
2.20.1
