Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1309941wrq;
        Wed, 23 Oct 2019 12:26:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkRrLAe/ItPo7EXiz9EE/G1IhQwxn7yeF/qh3AbglqQ7dEhsRXK2349letxCNcm/qpX55T
X-Received: by 2002:a17:90a:d793:: with SMTP id z19mr2081432pju.17.1571858819020;
        Wed, 23 Oct 2019 12:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571858819; cv=none;
        d=google.com; s=arc-20160816;
        b=q+oGpQ0esJpIOhEq/r0zWIc+0YWDJDQ1FjUd0pNUWTgBZYhsaumb6Zd51u9vEy3+V2
         ZX4jx/oOPUpmnudkdXrunpIZbjDs2n/z2tVPjUw2knF8pdlbQScRoFkti5k4TWxmtpvB
         YNRSC6mDFA74PJPGewuHExcfeihEW1HL6qPmj7dmX1u0jHHevJk00dmasOaE3691h8P3
         wczai1Ry/psLalL1NmDFMy55br2mocMY6bz+7XJjequBle8J/RBMzQneENZxdQ5yC+RD
         P0XXVULfiUNCtSpOpNUfXkBx+n/OvzJ8/Ho7DyD++37MQneWHnWBVhDVjWF89QVaGuQX
         zxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=NOldx4KKD/1su5zAA8VJimZ8qpQXGlAT71t1rjwh6dY=;
        b=piss1/a9t7uc7+iUa+2h46DZXYyye2AWgxR/U+MRoyK7MqdMTrJGho0TG8NXQTFHe6
         TsV5xwKlS1SRkuqRbW184nniYg8UYLUJIsCEo3ShMfrxtzGfECXNywO/u1ahxAcCiczH
         Pj3r8znQrDvZAjz1x8CCsVKn5NPi4R/xua5eVQb9QbTnqEYGVDu/eHz0JplHDmLqIegr
         bPjQDIj1G13G3/KTSZLmwa75s2sroLHquTbZoRlAX53iyMS+fU7H5Z1d/AVjEMzWqM9J
         XuNOMXjIaC4yJIon2rX5jdF1TsP/IDbuEGsXuSfEQP8dukMrKuD6Z5PWKM5qQ+pKThkl
         3z9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id d6si13209166plj.181.2019.10.23.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 12:26:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id F1D8D3F2403C;
	Wed, 23 Oct 2019 12:26:57 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f22q8JQ4hIgC; Wed, 23 Oct 2019 12:26:57 -0700 (PDT)
Received: from keithp.com (keithp-172.keithp.com [10.0.0.172])
	by elaine.keithp.com (Postfix) with ESMTPSA id 85D563F23FF8;
	Wed, 23 Oct 2019 12:26:57 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
	id 6A1671582118; Wed, 23 Oct 2019 12:26:57 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH] Semihost SYS_READC implementation (v3)
Date: Wed, 23 Oct 2019 12:26:40 -0700
Message-Id: <20191023192640.13125-1-keithp@keithp.com>
X-Mailer: git-send-email 2.24.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T9OIKAjxd3MU

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

v2:
	Add implementation in linux-user/arm/semihost.c

v3:  (thanks to Paolo Bonzini <pbonzini@redhat.com>)
	Replace hand-rolled fifo with fifo8
	Avoid mixing code and declarations
	Remove spurious (void) cast of function parameters
	Define qemu_semihosting_console_init when CONFIG_USER_ONLY

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/console.c          | 73 +++++++++++++++++++++++++++++++
 include/hw/semihosting/console.h  | 12 +++++
 include/hw/semihosting/semihost.h |  4 ++
 linux-user/arm/semihost.c         | 24 ++++++++++
 target/arm/arm-semi.c             |  3 +-
 vl.c                              |  3 ++
 6 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index b4b17c8afb..197bff079b 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -98,3 +98,76 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
                       __func__, addr);
     }
 }
+
+#include <pthread.h>
+#include "chardev/char-fe.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qemu/fifo8.h"
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
index a16b525eec..13a097515b 100644
--- a/linux-user/arm/semihost.c
+++ b/linux-user/arm/semihost.c
@@ -47,3 +47,27 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
         }
     }
 }
+
+#include <poll.h>
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
