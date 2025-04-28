Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783857njd;
        Sun, 27 Apr 2025 23:41:31 -0700 (PDT)
X-Received: by 2002:a17:903:947:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22dc6a096b1mr116567855ad.25.1745822491156;
        Sun, 27 Apr 2025 23:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822491; cv=none;
        d=google.com; s=arc-20240605;
        b=FbdrrNaTAdaaqUbMipYN7m303EPRkSsQp4Qv46JS9yH4+QOUMSSG/yXdj93S0C2ADb
         fLmE4CHBAiUAKhP4g2mmqXxeTPr88WgxfZavXW7Y/YTyScsegVrRVpeRjtYnRZnGO0Bj
         w5+NPW6+2OvbbmeL228ZRZMkqURz3ibwELwvY43mie+Zv2QSDI7z2dXXljsPf1wor+Xd
         1lII7WMfKwjiMjTiJx/HMunDRmPqnrq/wCiHLaHUuv7AAn9417s5Ou/pSdIPosmjO2Z5
         SbwIu/rpI6NYop41k9u9D9ljwI5Py2hmh+CClBhIDPhb8UqeBZPJpdwyf5dZj4s67U98
         BrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=md0bOrXsOXSIxMEGQoCK4EyNzS22P/xGEc8XAoKzPWE=;
        fh=rg2pKVP7GuK8ikFtBY/Gq+i1fOv8jJmvnu/ee+RRL+k=;
        b=BmjQv5ckM3CZJnv+Q51lp6WHZLG2lEHKh8vDhzSK4WwS/ZtUMCOLJa3MDb3Amzk87J
         7ruTVw0B7IYS0ihV0+kVflLQPECehY/WhmFd3Aj/50QwR3Bo0kPP0ryDCVXKS+Qsa0HW
         Ks4qRel7IvDhSMLNWeTZwy6EcF6ljDaRvZQKuH1ae84F9fpdZ9h6cfWsGteBkek62UdM
         zFZzAnW2K1FJtYO8byjScFesV3eXjuiRT0achiXG1HA0U4bY4doWg+6IPg5QfSbHzx8V
         J5MQBgNtLgdArxh+MAm6VDNWFmOkJhTfDgqws+v7IMk05SmmuIU5zh11GoOkEJun0jw7
         T5LQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmqMK4hT;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4e15386sor49046585ad.10.2025.04.27.23.41.30
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmqMK4hT;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822490; x=1746427290; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md0bOrXsOXSIxMEGQoCK4EyNzS22P/xGEc8XAoKzPWE=;
        b=kmqMK4hTYtX1nTjoc6RYX3Ztpl09KZrZ5qQaQVZ7c0eoqj7eVz2d+FWJWm1pOKLVwv
         fkTofRFLAQs5lp8DTWCpGJsBvEhj8DiIRFEhlsQkyN9703p83yn0qE/bXLwi7F5y/Ngd
         2NnBQko6Bcz4nGwqbkRrWd0W+DWjNp2Fm8gCiFyH5QamyfE1f2BpwAJYnkY7p/D8ZVAf
         rOnX4Bn2TFin4vnbpdmaTfE+17p3s7U2nfFKWQBPjG4BEfOcOiH4yG6SdEQ0/AfHyZCE
         wJC1oDni+gFpky1p1JLaEA5nn5j1wVaz8ltiu7jKcTmatF/XbUpOpr5BEpk+D9ACqTpP
         Hy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822490; x=1746427290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md0bOrXsOXSIxMEGQoCK4EyNzS22P/xGEc8XAoKzPWE=;
        b=waHCMfHGuhn/npWLOnpr2ueDAZfv9jfqhX60bNbrgt2XJ+7SNvtNwEIs2IQCN5xxSg
         RvJK5IAnOwaxDMj5FKWa0cmhtxs0te1KL5oQsDmG7G/lUiysDuupC4aYiUJYEZibDJNP
         WOLYEy6tgwmY00TFCuOb/gc+syUQghIso09/jfswuusVcuYirdhU9lajrRs4BW4OZY7J
         u1zdu9O4Lj6ribTsitUNsl5Ea0u29O1Dg2ruVYw/aNoNiI00/NKberIWHhDjUK+vphUy
         Yms6K438Vve8U5lRW9plBduRbpmMJ3bbK3zEMg/mxfSyXMnupZdAyBIzvMURRGUnlxV5
         R76g==
X-Forwarded-Encrypted: i=1; AJvYcCU+4OoXzspPZBcCQMSpuGKd5ro5DOOQsV6bJVod4p7Spx/mpOjSNMQlSaLgn0BA2Xj9im0oN0NIrfLqrg3K@linaro.org, AJvYcCUnGi9aB8qj2l9V/6vUnO0c7J6ZSghQO/pDRrmasKumT23CwunvJwdiTQp/iOqhtDsQ1PgP4z0bCq52ZVSsekmihg==@linaro.org, AJvYcCXQJPiP6riCGfj1mwi39+4bwyXcR65yWIp/p2hLHRAucLe6N9LQGWjbRgb0RfRzItGZYLqZHTG1@linaro.org, AJvYcCXXgfNjUtMjzwySvlSTlpvOo/z12fOk+ymH6o/3Ky/WdKLGCmnFhFu25PEnHLNKG+dZnlNQYG/Y0hbwlG+LiWq875g=@linaro.org
X-Gm-Message-State: AOJu0Yx/NnnFf0Vooy/sepVEz5z5Umah8dNW1WMTENir9kXS5gn45BVS
	o8kvhXerVHRso549nCZxHhxDWgW0fAvR7Yvk4DchsAz0ekxG6qVT
X-Gm-Gg: ASbGncuEaujG2fZPwWPzc8t/PQoMu5in7HdjMaP2tdOIYJb+J6xpMlG75JsLh4q66lQ
	XoqonY4ZMD6+w0ay4pWFF1ZRyQRfe8d0fBoGjELRcrMN2I5LFZCR5ElSWWWwv4vTMY8fIHKZxiK
	EjPlnwBaW2IgUq3NfFNWePyqxxuZhJKMLcVpqxJ3nd1uxUpFt79L38nsk2BpySL3Bk3a4qpIy4u
	D7s/JVZaYvUd335/1uRpShGZmKosPsdJPyTXhwcqg6UqsRzUVtyvoN/2cvjmJahG1oehp/dsFt7
	s2hJIwrHWJY+kHyOTuUmBYDQOn814sPSLU5KbKq4pmEoYUI+
X-Google-Smtp-Source: AGHT+IEoWfFGWHkKuTAY/P7locxmQI8SKE4QHEVHqm9TgMr9WGIJw2NnM8CEHdBoBvdpXR1JbKPFFg==
X-Received: by 2002:a17:902:ce04:b0:224:10b9:357a with SMTP id d9443c01a7336-22dc6a54811mr122429565ad.32.1745822490409;
        Sun, 27 Apr 2025 23:41:30 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:29 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 14/20] include/qemu/osdep.h: Add Emscripten-specific OS dependencies
Date: Mon, 28 Apr 2025 15:39:03 +0900
Message-ID: <9fc7b106ecf86675b4532bd6778b7b5945442f89.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bFIQdxhRfKQi

On emscripten, some implementations in os-posix.c can't be used such as
daemonizing and changing user. This commit introduces os-wasm.c and
os-wasm.h which are forked from os-posix.c and os-posix.h and patched for
targetting Emscripten.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS              |   6 ++
 include/qemu/osdep.h     |   8 ++-
 include/system/os-wasm.h | 104 ++++++++++++++++++++++++++++++++++
 os-wasm.c                | 119 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 235 insertions(+), 2 deletions(-)
 create mode 100644 include/system/os-wasm.h
 create mode 100644 os-wasm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 661a47db5a..dde5fd2a79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -628,6 +628,12 @@ F: .gitlab-ci.d/cirrus/macos-*
 F: */*.m
 F: scripts/entitlement.sh
 
+WebAssembly
+M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
+S: Maintained
+F: include/system/os-wasm.h
+F: os-wasm.c
+
 Alpha Machines
 --------------
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 4397a90680..96fe51bc39 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -8,7 +8,7 @@
  * To avoid getting into possible circular include dependencies, this
  * file should not include any other QEMU headers, with the exceptions
  * of config-host.h, config-target.h, qemu/compiler.h,
- * system/os-posix.h, system/os-win32.h, glib-compat.h and
+ * system/os-posix.h, system/os-win32.h, system/os-wasm.h, glib-compat.h and
  * qemu/typedefs.h, all of which are doing a similar job to this file
  * and are under similar constraints.
  *
@@ -164,10 +164,14 @@ QEMU_EXTERN_C int daemon(int, int);
 #include "system/os-win32.h"
 #endif
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 #include "system/os-posix.h"
 #endif
 
+#if defined(EMSCRIPTEN)
+#include "system/os-wasm.h"
+#endif
+
 #ifdef __cplusplus
 extern "C" {
 #endif
diff --git a/include/system/os-wasm.h b/include/system/os-wasm.h
new file mode 100644
index 0000000000..3abb3aaa03
--- /dev/null
+++ b/include/system/os-wasm.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * posix specific declarations forked from os-posix.h, removing functions not
+ * working on Emscripten
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2010 Jes Sorensen <Jes.Sorensen@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef QEMU_OS_WASM_H
+#define QEMU_OS_WASM_H
+
+#include <sys/mman.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <netinet/tcp.h>
+#include <arpa/inet.h>
+#include <netdb.h>
+#include <sys/un.h>
+
+#ifdef CONFIG_SYSMACROS
+#include <sys/sysmacros.h>
+#endif
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+void os_set_line_buffering(void);
+void os_setup_early_signal_handling(void);
+void os_set_proc_name(const char *s);
+void os_setup_signal_handling(void);
+void os_setup_limits(void);
+void os_setup_post(void);
+int os_mlock(bool on_fault);
+static inline int os_set_daemonize(bool d)
+{
+    return -1;
+};
+bool is_daemonized(void);
+static inline void os_daemonize(void) {}
+
+/**
+ * qemu_alloc_stack:
+ * @sz: pointer to a size_t holding the requested usable stack size
+ *
+ * Allocate memory that can be used as a stack, for instance for
+ * coroutines. If the memory cannot be allocated, this function
+ * will abort (like g_malloc()). This function also inserts an
+ * additional guard page to catch a potential stack overflow.
+ * Note that the memory required for the guard page and alignment
+ * and minimal stack size restrictions will increase the value of sz.
+ *
+ * The allocated stack must be freed with qemu_free_stack().
+ *
+ * Returns: pointer to (the lowest address of) the stack memory.
+ */
+void *qemu_alloc_stack(size_t *sz);
+
+/**
+ * qemu_free_stack:
+ * @stack: stack to free
+ * @sz: size of stack in bytes
+ *
+ * Free a stack allocated via qemu_alloc_stack(). Note that sz must
+ * be exactly the adjusted stack size returned by qemu_alloc_stack.
+ */
+void qemu_free_stack(void *stack, size_t sz);
+
+/* POSIX and Mingw32 differ in the name of the stdio lock functions.  */
+
+static inline void qemu_flockfile(FILE *f)
+{
+    flockfile(f);
+}
+
+static inline void qemu_funlockfile(FILE *f)
+{
+    funlockfile(f);
+}
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/os-wasm.c b/os-wasm.c
new file mode 100644
index 0000000000..d240c180c5
--- /dev/null
+++ b/os-wasm.c
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * os-wasm.c
+ * Forked from os-posix.c, removing functions not working on Emscripten
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2010 Red Hat, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/resource.h>
+#include <sys/wait.h>
+#include <pwd.h>
+#include <grp.h>
+#include <libgen.h>
+
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "system/runstate.h"
+#include "qemu/cutils.h"
+
+void os_setup_post(void){}
+void os_set_line_buffering(void)
+{
+    setvbuf(stdout, NULL, _IOLBF, 0);
+}
+void os_setup_early_signal_handling(void)
+{
+    struct sigaction act;
+    sigfillset(&act.sa_mask);
+    act.sa_flags = 0;
+    act.sa_handler = SIG_IGN;
+    sigaction(SIGPIPE, &act, NULL);
+}
+void os_set_proc_name(const char *s)
+{
+    error_report("Change of process name not supported by your OS");
+    exit(1);
+}
+static void termsig_handler(int signal, siginfo_t *info, void *c)
+{
+    qemu_system_killed(info->si_signo, info->si_pid);
+}
+
+void os_setup_signal_handling(void)
+{
+    struct sigaction act;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = termsig_handler;
+    act.sa_flags = SA_SIGINFO;
+    sigaction(SIGINT,  &act, NULL);
+    sigaction(SIGHUP,  &act, NULL);
+    sigaction(SIGTERM, &act, NULL);
+}
+void os_setup_limits(void)
+{
+    struct rlimit nofile;
+
+    if (getrlimit(RLIMIT_NOFILE, &nofile) < 0) {
+        warn_report("unable to query NOFILE limit: %s", strerror(errno));
+        return;
+    }
+
+    if (nofile.rlim_cur == nofile.rlim_max) {
+        return;
+    }
+
+    nofile.rlim_cur = nofile.rlim_max;
+
+    if (setrlimit(RLIMIT_NOFILE, &nofile) < 0) {
+        warn_report("unable to set NOFILE limit: %s", strerror(errno));
+        return;
+    }
+}
+int os_mlock(bool on_fault)
+{
+#ifdef HAVE_MLOCKALL
+    int ret = 0;
+    int flags = MCL_CURRENT | MCL_FUTURE;
+
+    if (on_fault) {
+#ifdef HAVE_MLOCK_ONFAULT
+        flags |= MCL_ONFAULT;
+#else
+        error_report("mlockall: on_fault not supported");
+        return -EINVAL;
+#endif
+    }
+
+    ret = mlockall(flags);
+    if (ret < 0) {
+        error_report("mlockall: %s", strerror(errno));
+    }
+
+    return ret;
+#else
+    (void)on_fault;
+    return -ENOSYS;
+#endif
+}
-- 
2.43.0
