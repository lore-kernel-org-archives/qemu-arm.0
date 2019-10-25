Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp4235664wrq;
        Fri, 25 Oct 2019 12:01:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0F1x++3+5o6HHHWa9fusNOivPqqOBMWzhHgneQHkj1LZGioIQfP36twIjz54u8L+mACuS
X-Received: by 2002:aa7:8dd4:: with SMTP id j20mr6157811pfr.36.1572030086189;
        Fri, 25 Oct 2019 12:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572030086; cv=none;
        d=google.com; s=arc-20160816;
        b=bFQZTRz04reMJU4HgH3FJ9tB8GzVk47BxAqCtru9Dx2hSC9FBMWSnHplLBZO4Fo6Ng
         8hKJ+1qhk1XgjaIJF0pxV7rRDaknrM9NuavhE5sKLGAV7Z/s8LIv13A5zM4UrzRiVlvB
         chWIopxtw0BRu5utdX4leHFofmxingwOR9KZH2jolkXMXVoDw7b1MGEvU0qwqayzWMFQ
         J8R6Dzx7kuZG3uzYMjzakRzRkw0JinYca8+kuDUjYTyThIautKjqCSTW0mz3Z7lY7nkN
         poo+01oREN0BM08kPiyibsNyhEln3Oa9PpDATsaLHEoygPGW8q7w7MmBDK19WdYGuUyL
         JTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=ZlF/2XbQnCM4vtVEmWqkDZEb7kuc8jPbR7WfdsBPAvU=;
        b=fqWNCidGmDKLPJQO/4wQ72XEzePpuC72owTEBRZZzU2KUCgVGMZaPkyaSAWVuvCmch
         JkmhkQXqmYns6jTugz2YjD4LHVgBlmfSFNGWRRXYk2rGri41tzo4VeEldkvhjFjmgqHx
         WjYup1WcfZKuWaBc74gGzOmcUTJPYawbxG+6y8bG07OfMZANG2IREdYb/n/NqVglhOgY
         twn0naGH0V/e1zWUehqZPIRnYQ9TrrLUJ67n0HwUAEyEtLApKlfCXIJ1Cc3lA6FRY9r2
         AUkU1DvJtC3G9gHMQk5SoVHsuTFF9wjHB/7eF341OmvdDx/OMLY5Hjtqp76Ci1ZMad/o
         D8jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id e17si3471787pgn.394.2019.10.25.12.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:01:26 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 885BA3F22EBE;
	Fri, 25 Oct 2019 12:01:24 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Me5PJJzQicVQ; Fri, 25 Oct 2019 12:01:24 -0700 (PDT)
Received: from keithp.com (c-73-35-169-234.hsd1.wa.comcast.net [73.35.169.234])
	by elaine.keithp.com (Postfix) with ESMTPSA id 1DF323F22EAC;
	Fri, 25 Oct 2019 12:01:24 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
	id 32DD9158212D; Fri, 25 Oct 2019 12:01:21 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH] Semihost SYS_READC implementation (v5)
Date: Fri, 25 Oct 2019 12:01:10 -0700
Message-Id: <20191025190110.4570-1-keithp@keithp.com>
X-Mailer: git-send-email 2.24.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: k5srypxHlcYL

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
---

v2:
	Add implementation in linux-user/arm/semihost.c

v3:  (thanks to Paolo Bonzini <pbonzini@redhat.com>)
	Replace hand-rolled fifo with fifo8
	Avoid mixing code and declarations
	Remove spurious (void) cast of function parameters
	Define qemu_semihosting_console_init when CONFIG_USER_ONLY

v4:
	Add qemu_semihosting_console_init to stubs/semihost.c for
	hosts that don't support semihosting

v5:
	Move #include statements to the top of the file.
	Actually include the stubs/semihost.c patch that was
	supposed to be in v4

 hw/semihosting/console.c          | 72 +++++++++++++++++++++++++++++++
 include/hw/semihosting/console.h  | 12 ++++++
 include/hw/semihosting/semihost.h |  4 ++
 linux-user/arm/semihost.c         | 23 ++++++++++
 stubs/semihost.c                  |  4 ++
 target/arm/arm-semi.c             |  3 +-
 vl.c                              |  3 ++
 7 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index b4b17c8afb..4db68d6227 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -22,6 +22,12 @@
 #include "exec/gdbstub.h"
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
@@ -98,3 +104,69 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
                       __func__, addr);
     }
 }
+
+#define FIFO_SIZE   1024
+
+typedef struct SemihostingConsole {
+    CharBackend         backend;
+    pthread_mutex_t     mutex;
+    pthread_cond_t      cond;
+    bool                got;
+    Fifo8               fifo;
+} SemihostingConsole;
+
+static SemihostingConsole console = {
+    .mutex = PTHREAD_MUTEX_INITIALIZER,
+    .cond = PTHREAD_COND_INITIALIZER
+};
+
+static int console_can_read(void *opaque)
+{
+    SemihostingConsole *c = opaque;
+    int ret;
+    pthread_mutex_lock(&c->mutex);
+    ret = (int) fifo8_num_free(&c->fifo);
+    pthread_mutex_unlock(&c->mutex);
+    return ret;
+}
+
+static void console_read(void *opaque, const uint8_t *buf, int size)
+{
+    SemihostingConsole *c = opaque;
+    pthread_mutex_lock(&c->mutex);
+    while (size-- && !fifo8_is_full(&c->fifo)) {
+        fifo8_push(&c->fifo, *buf++);
+    }
+    pthread_cond_broadcast(&c->cond);
+    pthread_mutex_unlock(&c->mutex);
+}
+
+target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+{
+    uint8_t ch;
+    SemihostingConsole *c = &console;
+    qemu_mutex_unlock_iothread();
+    pthread_mutex_lock(&c->mutex);
+    while (fifo8_is_empty(&c->fifo)) {
+        pthread_cond_wait(&c->cond, &c->mutex);
+    }
+    ch = fifo8_pop(&c->fifo);
+    pthread_mutex_unlock(&c->mutex);
+    qemu_mutex_lock_iothread();
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
diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
index 9be9754bcd..f7d5905b41 100644
--- a/include/hw/semihosting/console.h
+++ b/include/hw/semihosting/console.h
@@ -37,6 +37,18 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
  */
 void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
+/**
+ * qemu_semihosting_console_inc:
+ * @env: CPUArchState
+ *
+ * Receive single character from debug console. This
+ * may be the remote gdb session if a softmmu guest is currently being
+ * debugged.
+ *
+ * Returns: character read or -1 on error
+ */
+target_ulong qemu_semihosting_console_inc(CPUArchState *env);
+
 /**
  * qemu_semihosting_log_out:
  * @s: pointer to string
diff --git a/include/hw/semihosting/semihost.h b/include/hw/semihosting/semihost.h
index 60fc42d851..b8ce5117ae 100644
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
diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
index a16b525eec..4f998d6220 100644
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
index f90589259c..1d8b37f7b2 100644
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
index 6f7b6d801b..47d61f6fe1 100644
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
index 4489cfb2bb..ac584d97ea 100644
--- a/vl.c
+++ b/vl.c
@@ -4381,6 +4381,9 @@ int main(int argc, char **argv, char **envp)
     ds = init_displaystate();
     qemu_display_init(ds, &dpy);
 
+    /* connect semihosting console input if requested */
+    qemu_semihosting_console_init();
+
     /* must be after terminal init, SDL library changes signal handlers */
     os_setup_signal_handling();
 
-- 
2.24.0.rc0
