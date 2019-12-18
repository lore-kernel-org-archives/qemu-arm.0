Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u24sm3220966wml.10.2019.12.18.10.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:00:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9B1EE1FF90;
	Wed, 18 Dec 2019 18:00:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 3/4] semihosting: add qemu_semihosting_console_inc for SYS_READC
Date: Wed, 18 Dec 2019 18:00:28 +0000
Message-Id: <20191218180029.6744-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218180029.6744-1-alex.bennee@linaro.org>
References: <20191218180029.6744-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L25nO2h14R0W

From: Keith Packard <keithp@keithp.com>

Provides a blocking call to read a character from the console using
semihosting.chardev, if specified. This takes some careful command
line options to use stdio successfully as the serial ports, monitor
and semihost all want to use stdio. Here's a sample set of command
line options which share stdio betwen semihost, monitor and serial
ports:

	qemu \
	-chardev stdio,mux=on,id=stdio0 \
	-serial chardev:stdio0 \
	-semihosting-config enable=on,chardev=stdio0 \
	-mon chardev=stdio0,mode=readline

This creates a chardev hooked to stdio and then connects all of the
subsystems to it. A shorter mechanism would be good to hear about.

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20191104204230.12249-1-keithp@keithp.com>
[AJB: fixed up deadlock, minor commit title reword]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>

---
v7
  - reword commit title
  - remove mutexs, halt CPU until data available
  - document cpu_loop_exit behavior in function API
---
 include/hw/semihosting/console.h  | 16 +++++++
 include/hw/semihosting/semihost.h |  4 ++
 hw/semihosting/console.c          | 78 +++++++++++++++++++++++++++++++
 linux-user/arm/semihost.c         | 23 +++++++++
 stubs/semihost.c                  |  4 ++
 target/arm/arm-semi.c             |  3 +-
 vl.c                              |  3 ++
 7 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
index 9be9754bcdf..a3bd6ca2419 100644
--- a/include/hw/semihosting/console.h
+++ b/include/hw/semihosting/console.h
@@ -37,6 +37,22 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
  */
 void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
+/**
+ * qemu_semihosting_console_inc:
+ * @env: CPUArchState
+ *
+ * Receive single character from debug console. This may be the remote
+ * gdb session if a softmmu guest is currently being debugged. As this
+ * call may block if no data is available we suspend the CPU and will
+ * rexecute the instruction when data is there. Therefor two
+ * conditions must be met:
+ *   - CPUState is syncronised before callinging this function
+ *   - pc is only updated once the character is succesfully returned
+ *
+ * Returns: character read OR cpu_loop_exit!
+ */
+target_ulong qemu_semihosting_console_inc(CPUArchState *env);
+
 /**
  * qemu_semihosting_log_out:
  * @s: pointer to string
diff --git a/include/hw/semihosting/semihost.h b/include/hw/semihosting/semihost.h
index 60fc42d851e..b8ce5117ae0 100644
--- a/include/hw/semihosting/semihost.h
+++ b/include/hw/semihosting/semihost.h
@@ -56,6 +56,9 @@ static inline Chardev *semihosting_get_chardev(void)
 {
     return NULL;
 }
+static inline void qemu_semihosting_console_init(void)
+{
+}
 #else /* !CONFIG_USER_ONLY */
 bool semihosting_enabled(void);
 SemihostingTarget semihosting_get_target(void);
@@ -68,6 +71,7 @@ Chardev *semihosting_get_chardev(void);
 void qemu_semihosting_enable(void);
 int qemu_semihosting_config_options(const char *opt);
 void qemu_semihosting_connect_chardevs(void);
+void qemu_semihosting_console_init(void);
 #endif /* CONFIG_USER_ONLY */
 
 #endif /* SEMIHOST_H */
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index b4b17c8afbc..6180f33ef21 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -20,8 +20,15 @@
 #include "hw/semihosting/semihost.h"
 #include "hw/semihosting/console.h"
 #include "exec/gdbstub.h"
+#include "exec/exec-all.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
+#include <pthread.h>
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qemu/fifo8.h"
 
 int qemu_semihosting_log_out(const char *s, int len)
 {
@@ -98,3 +105,74 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
                       __func__, addr);
     }
 }
+
+#define FIFO_SIZE   1024
+
+typedef struct SemihostingConsole {
+    CharBackend         backend;
+    GSList              *sleeping_cpus;
+    bool                got;
+    Fifo8               fifo;
+} SemihostingConsole;
+
+static SemihostingConsole console;
+
+static int console_can_read(void *opaque)
+{
+    SemihostingConsole *c = opaque;
+    int ret;
+    g_assert(qemu_mutex_iothread_locked());
+    ret = (int) fifo8_num_free(&c->fifo);
+    return ret;
+}
+
+static void console_wake_up(gpointer data, gpointer user_data)
+{
+    CPUState *cs = (CPUState *) data;
+    /* cpu_handle_halt won't know we have work so just unbung here */
+    cs->halted = 0;
+    qemu_cpu_kick(cs);
+}
+
+static void console_read(void *opaque, const uint8_t *buf, int size)
+{
+    SemihostingConsole *c = opaque;
+    g_assert(qemu_mutex_iothread_locked());
+    while (size-- && !fifo8_is_full(&c->fifo)) {
+        fifo8_push(&c->fifo, *buf++);
+    }
+    g_slist_foreach(c->sleeping_cpus, console_wake_up, NULL);
+}
+
+target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+{
+    uint8_t ch;
+    SemihostingConsole *c = &console;
+    g_assert(qemu_mutex_iothread_locked());
+    g_assert(current_cpu);
+    if (fifo8_is_empty(&c->fifo)) {
+        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, current_cpu);
+        current_cpu->halted = 1;
+        current_cpu->exception_index = EXCP_HALTED;
+        cpu_loop_exit(current_cpu);
+        /* never returns */
+    }
+    c->sleeping_cpus = g_slist_remove_all(c->sleeping_cpus, current_cpu);
+    ch = fifo8_pop(&c->fifo);
+    return (target_ulong) ch;
+}
+
+void qemu_semihosting_console_init(void)
+{
+    Chardev *chr = semihosting_get_chardev();
+
+    if  (chr) {
+        fifo8_create(&console.fifo, FIFO_SIZE);
+        qemu_chr_fe_init(&console.backend, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&console.backend,
+                                 console_can_read,
+                                 console_read,
+                                 NULL, NULL, &console,
+                                 NULL, true);
+    }
+}
diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
index a16b525eec0..4f998d62201 100644
--- a/linux-user/arm/semihost.c
+++ b/linux-user/arm/semihost.c
@@ -14,6 +14,7 @@
 #include "cpu.h"
 #include "hw/semihosting/console.h"
 #include "qemu.h"
+#include <poll.h>
 
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
 {
@@ -47,3 +48,25 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
         }
     }
 }
+
+target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+{
+    uint8_t c;
+    struct pollfd pollfd = {
+        .fd = STDIN_FILENO,
+        .events = POLLIN
+    };
+
+    if (poll(&pollfd, 1, -1) != 1) {
+        qemu_log_mask(LOG_UNIMP, "%s: unexpected read from stdin failure",
+                      __func__);
+        return (target_ulong) -1;
+    }
+
+    if (read(STDIN_FILENO, &c, 1) != 1) {
+        qemu_log_mask(LOG_UNIMP, "%s: unexpected read from stdin failure",
+                      __func__);
+        return (target_ulong) -1;
+    }
+    return (target_ulong) c;
+}
diff --git a/stubs/semihost.c b/stubs/semihost.c
index f90589259c0..1d8b37f7b2f 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -69,3 +69,7 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
 void qemu_semihosting_connect_chardevs(void)
 {
 }
+
+void qemu_semihosting_console_init(void)
+{
+}
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 6f7b6d801bf..47d61f6fe1f 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -802,8 +802,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 
         return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
     case TARGET_SYS_READC:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func__);
-        return 0;
+        return qemu_semihosting_console_inc(env);
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
diff --git a/vl.c b/vl.c
index 94508300c3c..1912f87822b 100644
--- a/vl.c
+++ b/vl.c
@@ -4142,6 +4142,9 @@ int main(int argc, char **argv, char **envp)
     qemu_opts_foreach(qemu_find_opts("mon"),
                       mon_init_func, NULL, &error_fatal);
 
+    /* connect semihosting console input if requested */
+    qemu_semihosting_console_init();
+
     if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
         exit(1);
     if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
-- 
2.20.1
