Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5412796wrm;
        Mon, 21 Oct 2019 20:13:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxp/HFDOHZSCZvoM3NZyi6pI5p+s80d713fCMBOjFbrDZxkg/qbMcoc0EmNiNPxjjQJ8kn
X-Received: by 2002:a65:62d1:: with SMTP id m17mr1280717pgv.284.1571714031754;
        Mon, 21 Oct 2019 20:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571714031; cv=none;
        d=google.com; s=arc-20160816;
        b=wiygJXNaoFja4d8nnrKEFEb1E9Yp5/IRcNAFIMp6u40/iDowbRGd8KDOBHLVw1Qdj8
         Xgf28OMSp5hlvUQRv/iPe+oOiuGmJbUJ6sL+o95XTouducJX/fhvboskP29s6C+aG5WX
         mP7bhq2sad1bR1gWgLG7pxxZS+BPh3nLXvFtEZegiwYvm2U3ibJpYD0l3RzTxBa9Bd1L
         BWaT5Eq5WAmvpACioBnoiVhMRUzhBl9FTLc5rPCxw5v22JJkkOI0yguMjkVxl9lPpdyX
         NgkN1+jamqbR/SHUS+mVhokqWuhNO8dFW+gfaqAMNb2kucpz4ytVPTiureR4V8Okrgr/
         lOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Ww6SY4eVf0oJNDtlwTA3A1tS4uuRQHVXLc/Khd2Eej0=;
        b=Qmwr/ceTX7Du1B03Npwy1HCyytJGj7zkw4xFA6vUOkZMURZJWZQtSqP7goljfFLaRY
         iXvvZhrJMVXIP9n3ztZYxIMEcWQPC6CFpuA1P+qJ99t8oVikshN9h7ed4BrOo1Xyxa5M
         D6ojy6ccNVvfSHhBnpHukRRXFtiIovYltplw1UnwM5MmhNg5sEIDtOVxeePD8dTSuU21
         jQ1e3Su6mijRJA44LcnJU6HemeTf6mxj34wAleeTg9nL/Pa4j22pnq7/twmMhXdfvWVD
         xXpzY+YR6QHoT43y36AFUyq6GeCaplzG/kaHOk7DY1w5EnLw5WhXSgedD1KAvljulEFI
         QngQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id w4si12797760plz.150.2019.10.21.20.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 20:13:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 718A43F21CC4;
	Mon, 21 Oct 2019 20:13:50 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D560BGZa7Q4f; Mon, 21 Oct 2019 20:13:50 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id DDEBB3F21BD9;
	Mon, 21 Oct 2019 20:13:49 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
	id 7D0A11582187; Mon, 21 Oct 2019 20:13:49 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH] Semihost SYS_READC implementation
Date: Mon, 21 Oct 2019 20:13:35 -0700
Message-Id: <20191022031335.9880-1-keithp@keithp.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hdj+zSOZlwEa

Provides a blocking call to read a character from the console by hooking
into the console input chain. This happens *after* any uart has hooked in,
so specifying -semihost overrides input to any emulated uarts.

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/console.c          | 92 +++++++++++++++++++++++++++++++
 include/hw/semihosting/console.h  | 12 ++++
 include/hw/semihosting/semihost.h |  1 +
 stubs/semihost.c                  |  4 ++
 target/arm/arm-semi.c             |  3 +-
 vl.c                              |  3 +
 6 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index b4b17c8afb..7345e2cce0 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -98,3 +98,95 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
                       __func__, addr);
     }
 }
+
+#include <pthread.h>
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+
+#define FIFO_SIZE   1024
+
+typedef struct SemihostingFifo {
+    unsigned int     insert, remove;
+
+    uint8_t fifo[FIFO_SIZE];
+} SemihostingFifo;
+
+#define fifo_insert(f, c) do { \
+    (f)->fifo[(f)->insert] = (c); \
+    (f)->insert = ((f)->insert + 1) & (FIFO_SIZE - 1); \
+} while (0)
+
+#define fifo_remove(f, c) do {\
+    c = (f)->fifo[(f)->remove]; \
+    (f)->remove = ((f)->remove + 1) & (FIFO_SIZE - 1); \
+} while (0)
+
+#define fifo_full(f)        ((((f)->insert + 1) & (FIFO_SIZE - 1)) == \
+                             (f)->remove)
+#define fifo_empty(f)       ((f)->insert == (f)->remove)
+#define fifo_space(f)       (((f)->remove - ((f)->insert + 1)) & \
+                             (FIFO_SIZE - 1))
+
+typedef struct SemihostingConsole {
+    CharBackend         backend;
+    pthread_mutex_t     mutex;
+    pthread_cond_t      cond;
+    bool                got;
+    SemihostingFifo     fifo;
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
+    ret = fifo_space(&c->fifo);
+    pthread_mutex_unlock(&c->mutex);
+    return ret;
+}
+
+static void console_read(void *opaque, const uint8_t *buf, int size)
+{
+    SemihostingConsole *c = opaque;
+    pthread_mutex_lock(&c->mutex);
+    while (size-- && !fifo_full(&c->fifo)) {
+        fifo_insert(&c->fifo, *buf++);
+    }
+    pthread_cond_broadcast(&c->cond);
+    pthread_mutex_unlock(&c->mutex);
+}
+
+target_ulong qemu_semihosting_console_inc(CPUArchState *env)
+{
+    (void) env;
+    SemihostingConsole *c = &console;
+    qemu_mutex_unlock_iothread();
+    pthread_mutex_lock(&c->mutex);
+    while (fifo_empty(&c->fifo)) {
+        pthread_cond_wait(&c->cond, &c->mutex);
+    }
+    uint8_t ch;
+    fifo_remove(&c->fifo, ch);
+    pthread_mutex_unlock(&c->mutex);
+    qemu_mutex_lock_iothread();
+    return (target_ulong) ch;
+}
+
+void qemu_semihosting_console_init(void)
+{
+    if (semihosting_enabled()) {
+        qemu_chr_fe_init(&console.backend, serial_hd(0), &error_abort);
+        qemu_chr_fe_set_handlers(&console.backend,
+                                 console_can_read,
+                                 console_read,
+                                 NULL, NULL, &console,
+                                 NULL, true);
+    }
+}
diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/console.h
index 9be9754bcd..56f3606a2a 100644
--- a/include/hw/semihosting/console.h
+++ b/include/hw/semihosting/console.h
@@ -37,6 +37,18 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
  */
 void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
+/**
+ * qemu_semihosting_console_outc:
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
index 60fc42d851..a13d17c087 100644
--- a/include/hw/semihosting/semihost.h
+++ b/include/hw/semihosting/semihost.h
@@ -68,6 +68,7 @@ Chardev *semihosting_get_chardev(void);
 void qemu_semihosting_enable(void);
 int qemu_semihosting_config_options(const char *opt);
 void qemu_semihosting_connect_chardevs(void);
+void qemu_semihosting_console_init(void);
 #endif /* CONFIG_USER_ONLY */
 
 #endif /* SEMIHOST_H */
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
2.23.0
