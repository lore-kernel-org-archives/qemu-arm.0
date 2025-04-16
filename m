Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179339njc;
        Wed, 16 Apr 2025 01:16:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3001:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73c2671557bmr1271167b3a.11.1744791404633;
        Wed, 16 Apr 2025 01:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791404; cv=none;
        d=google.com; s=arc-20240605;
        b=d2ruogh8AKmZDbT2N10le5cdxfYBt39aVcDPNPreURxf1EI9F1jPTjT+hw4+139ztt
         2GnxNDmBVoiPnip5mlK46IAjRDBTH4g2+GEbtZPUvxZOP3/KTO96/TMDyKmy8D3vv8mE
         bfvRmc5/fjlazADSf3K8KWC2Cm1YciB8gUGUM4jLIg1DVVfI1uLDr0fsvyYHnz4SibHs
         +lunlz9yWs01KtLHcabXrnIBYP+aATudRPFttN5LVbwKLXDpKjwkyG4Vq7BpHuPK1zYU
         LFueLygIaMZs4GZwu3P3Yb/qjuNR3t4ZuSrcMP/cmZe34hoqxcvpNtiKy4Mz3ZclOdpQ
         h7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ccz4kSlOllk0cHThqsViRN91zI+kCPXhAybNKVHZI0w=;
        fh=oMmBomJh7P+R4qaATBJHQYJBe8vj5z81ZnuBNbFMrX8=;
        b=OWWqMWoTeyA6WRkxZaC/6YlyubtUB5DJnnLUY29IIqaaH742jvHHMZmuEwiLRBiRzL
         O39RsaucohulWtHHDoPCQg07lnb1fJpporIRbpKPjEcc20RZ8yoYSHcpwW1YgPVTL53u
         3aSn4D72s+nhOcc/IzPXaZEOGYIu5d7jpOXg5kc26BHRChHZLRXtf81NrAUbmMNPJUAg
         vw/WBSvcN0VOTPbXIAPrutjMGPZZV/8RgjU1taN+G0qBuMsO4wTHq6YmAbOIcO7GyQwh
         fobnb+zjMBPUhlc9QxnPaP1p8jPHmMfWDvMSizPlbo3xRJHdOM0UnGQhggp7wKCYm+uV
         rUGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQTALHZr;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bc279b9a4sor7764561b3a.7.2025.04.16.01.16.44
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQTALHZr;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791404; x=1745396204; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccz4kSlOllk0cHThqsViRN91zI+kCPXhAybNKVHZI0w=;
        b=bQTALHZriq6ZvHGuufMM6HegYURwXaD+x7F5XOkEjyVHVI79fhLDvBcWwqNoTNeFiU
         SGgLfFzQDm4d4q1jpdPpK/lrq0VSRUAOfjhv5rbrR8q0uO1p9OJZ9vV6IxUECJM5SzEi
         Qqj5Apk2FSkL0n+IQlZvsOvAGehBF/fG1ykZGVND1vk+LUCZCEWlQsd9ByhdK/UAiVUO
         UHLdyvHAcWBK1bmA26ua+FPaTXCgK6OJ2OF8xlsIdwX+rm6/LWBfFh33/2ZwbYJlcH6b
         ZnVwbb/MQrB5dalITPMyYUVMEgJ69cjU2JXcvUjogGFNOeV7Nk7U+dvpOzHiu3uP1N3z
         2Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791404; x=1745396204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccz4kSlOllk0cHThqsViRN91zI+kCPXhAybNKVHZI0w=;
        b=liV8kvEMMbZTUnCcyVpGYo3ScJnMGZal5HqqF3CbxjofMj1qOZbsTCJ3UQ1pPufaIZ
         kMyYTTB1/3jGRfNNoYooUUlCE/2v+RBSOGZss44L/NfuyIySehKkDV1akAhO6hClgfzR
         kjuuolO6ILatXYUfETpZzd/IeT+6FMr0yjRYZ6wcVSdw6FSptLZLS3tjWOmqKkqdPhVJ
         SYfza5GS5i5vX1KsJFHsxWarX+4MUqv7yRsSUp11yK7sVt22tsNMGHqhjpWEufmG/h4J
         6w1viJx9GjDjplSYMNxHURzo9BgV2eYLtQ2w8n+3Dt+050jH5wEkxEtB/bfdu5RvaGp4
         s4jA==
X-Forwarded-Encrypted: i=1; AJvYcCU5SvVKilB562DJkqP9p0S96sSoK5NnvpvAUMx0eByr3PZ+26F6etOQshyKHmOwXodFc2+rap62@linaro.org, AJvYcCW0APdfdVeZWkkaI+LRB6cwnYwTbvVzojYheNcTvo1YFYDRwhQUkcSTbhZEO47hheCTTq/h1ISNukBPAVA3rKD36ws=@linaro.org, AJvYcCXWMGU8rruoCFodYc7eb9bjLVt0IgSZdJhSR7oyEH07p3pqkZfZJFl8KGfhOGppepEERI0WIRyvJYkpm8VI@linaro.org, AJvYcCXcJg8Tvsaebv8rOBH/8WxNGWTBC94TC56JlrbOpNiyMWmXvXeNJbR6qEK6tIGgoYGKabLo0KhMOtG1ncGcuz1lVg==@linaro.org
X-Gm-Message-State: AOJu0Yyrv0f92FI5d1omLYaLVM3ok1F9xfIUaUkjDA101P8x7U50Gyx/
	m8DklPNyCSwbJV/Aerdj2NkC9GuJVpi3RBLVqCn24gScfSMiC4O4
X-Gm-Gg: ASbGnctU2MVOjkkea/SU6W4ZeUnVG9r109jsVHclULmvQ8PUonJ9tUYAdDSytR2QIcn
	WY2mbpV9dAqlzHg7Msd0uk831iMB2UomuJktU+epMnaMl56rMVjAIoaE09ZIqcdeqG8tApyZZz1
	vPYCoI3gbLNvi9gJoxi2JNEgWwjZh0UzBy5dY22ksH3+r8xT7AKpwuJ8GKprAP6loZH54Z9LwhC
	SsfxBMkzeDVDGmt1PX4LF+NmX1wLEN8t6P9zRVwcCNzUkBW3qlx6EQF1d94ykoAqzM7fyEaXD9Y
	bF4IfgjdGRK8t5IgEDdMrF/c4zSx9T/bJ1rYUAp1rdixIdjCKwtCgImG7g==
X-Google-Smtp-Source: AGHT+IH7FmqWppk3JQIuvW4w32pZOoVj/pSA/IO3rWgKznIiLqDu3RFZw5/AmwOBaT1ZsrARHCFbIg==
X-Received: by 2002:a05:6a00:3d09:b0:739:b288:13e7 with SMTP id d2e1a72fcca58-73c267d3801mr1274214b3a.15.1744791403571;
        Wed, 16 Apr 2025 01:16:43 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:42 -0700 (PDT)
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
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 13/19] include/qemu/osdep.h: Add Emscripten-specific OS dependencies
Date: Wed, 16 Apr 2025 17:14:18 +0900
Message-Id: <58863961cf88a72b76a90279da09ea332943924d.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T+J1VtOqrCQR

On emscripten, some implementations in os-posix.c can't be used such as
daemonizing and changing user. This commit introduces os-wasm.c and
os-wasm.h which are forked from os-posix.c and os-posix.h and patched for
targetting Emscripten.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 include/qemu/osdep.h      |   8 ++-
 include/system/os-posix.h |   3 +-
 include/system/os-wasm.h  | 105 +++++++++++++++++++++++++++++++++
 os-wasm.c                 | 119 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+), 3 deletions(-)
 create mode 100644 include/system/os-wasm.h
 create mode 100644 os-wasm.c

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
diff --git a/include/system/os-posix.h b/include/system/os-posix.h
index ce5b3bccf8..e87cc36a3a 100644
--- a/include/system/os-posix.h
+++ b/include/system/os-posix.h
@@ -1,5 +1,6 @@
 /*
- * posix specific declarations
+ * posix specific declarations forked from os-posix.c, removing functions not
+ * working on Emscripten
  *
  * Copyright (c) 2003-2008 Fabrice Bellard
  * Copyright (c) 2010 Jes Sorensen <Jes.Sorensen@redhat.com>
diff --git a/include/system/os-wasm.h b/include/system/os-wasm.h
new file mode 100644
index 0000000000..061c123c6f
--- /dev/null
+++ b/include/system/os-wasm.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * posix specific declarations
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ * Copyright (c) 2010 Jes Sorensen <Jes.Sorensen@redhat.com>
+ *
+ * Forked from os-posix.h, removing functions not working on Emscripten
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
2.25.1
