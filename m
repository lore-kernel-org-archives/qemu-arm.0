Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136978njd;
        Mon, 21 Apr 2025 22:29:51 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:215:742e:5cff with SMTP id d9443c01a7336-22c53ef1653mr221428865ad.16.1745299791277;
        Mon, 21 Apr 2025 22:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299791; cv=none;
        d=google.com; s=arc-20240605;
        b=QSt69Yr8b/EegnhPNAgqBaj9cnl05AT2tn17fai8pm0YqPokT3B+4uHzluBlIFH8SC
         upidTvJ6SOoqKeGetJfdhBd3UCh9Q1gazR4VCIsEALgH8135ihfPU+FYrJLLN/CURAv5
         4TPVdzMb+mXbmKXX6zhU1j6NSfcRkLxlcFhROSNdSxul7uTmHUIQ5n96lCtGAmdeDm1Z
         6dPHClJgrREMAUpM/Jo9Tg/y1f2AVTVzN0p1VEzuWcpRh9Y82XVfj9X6a6wOdEErj4k3
         3lbMh/BfLSzAIw+XWN1cVqLoLM3EkNNQWoYUQfQDZktw0OE+zCdTSq9b75iw+KXM65Tt
         fVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mPwJWv1XdL1SZLXg2WZ4ZVDBFmolVnjhl88zidFmCfI=;
        fh=r6FO2w+tYMbUYW7LerozmulR4QujPt/h3Wv1bhC1ZQ0=;
        b=gdt5qY6WXXpb/DDVsr05R0QZ6W7bdhJ0RkkRiu3ggc5LPyiDL04jXA7wH/glbwPZKW
         T01Vn4jKuA8Y+bP6tFQGsQTeuCa98iPzi/yY6HxdwCPVCt9NeruVciY19PxMqwLS6f8q
         P7MKwMz5PMneGmGIH32WObkpWEdSmvptA/tpaUI4ooNwSvkkOZN0jjJ9jw8pa4HOT//+
         yFJnHx3WgRzj6g0/RcomPrtPXUSb1y3JzSD6IvSAHPxciGWyb0IhS3YNhF8yHVfq/T1J
         6qY5vPnnIO2Qt7JjtzJZt4bAfIK5puKPFMXDd8JqvahjSXaa/gOzoduk5hCSggYm3Tko
         AUzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVQrLOfZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50a76984sor45296035ad.0.2025.04.21.22.29.51
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVQrLOfZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299791; x=1745904591; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPwJWv1XdL1SZLXg2WZ4ZVDBFmolVnjhl88zidFmCfI=;
        b=fVQrLOfZmwrglEFCORy2eK4F4VZY9gfLCpnd0Xe6ymRa6EFkQy9d1/EorePrATLQcp
         kwL6kdJ75xpziomn5te34pOhAwl+ZHWXeE11YjgaO7ySBiQOkVCjufixfiYMehXHGq9U
         TPEOMSM++FvQL1I7xvoWfvrDQQDbo0YMhSuis9F9NkYxo386kgsDHJX3FI31tG0Oev6L
         9UPUCjNNlNZTpiyFttYQgSrOBVyJuQL0rnzPlexhAGJo89OntfPAA5skfvlGFx44Tcd+
         uZNlYgZqTLBU67PWvIsswEUio8mk7o7couanQ17va0+MlTfbx3cFBvJZ/TJeMSozPiPF
         iZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299791; x=1745904591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPwJWv1XdL1SZLXg2WZ4ZVDBFmolVnjhl88zidFmCfI=;
        b=GbPFmeh9DvrRdaJ45LPMj7N3nnmLp6MZef7lQrGTRH/8DpTJ1pf5VjHSKJrUBAU8l3
         iUpCIfzyiLG+WZxirw7xCVyVPVkVgN1lw99aY1sKVV6Uf08u5tlhIU8cMxOaCCVkakFb
         XRcRLkJn7SixOT8QzgNKA3pPLey3A0ackpFtXr1OhuLWUYAijlDVB4eibfg5/CaCuXwV
         46scl6nECzsjkTWWkIfVO2fQoiYOau+zQq29aI+Va+eyjkI042PlXHs7fyvTPA39TR74
         FyvupUSLtb2ykFut0/VoSP85PLtzVZKid0OVHJPqS/RvU4tVPt+qd4e3iUrdQ3L0SZzV
         BGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVrzyw1aEpbzPHnh7XtyfM5bxE2LgzzqlHofWoaqVtZt9jCOA/ZeKbWS7qt3HF5XGaLZVIervXPKQBANm+W@linaro.org, AJvYcCWV3nsw1j+eHky73IzOFluPn0WTnE5EKfy4A6o6bDxYEnjJbUocz8VDxBGZuue0udYyioaRb3Pb@linaro.org, AJvYcCWlN3etqWHL2ADTxB4uWoJn/dD0+GtyRH01uKfBlJF06n4STb57kxcmsLNPk3NrHiQSNljN952qiPU1vjs97ny5sB4=@linaro.org, AJvYcCXpKggp+BJT53J+gozgZSCrUtlv3kgRb7sQqrdwwqdMu2MlptPvgv5KGMAkZnFpF25zaMr/frCXmZBkV0jcowj7LA==@linaro.org
X-Gm-Message-State: AOJu0YyrmVwEDq8yrE3hkz3SDkOu3icM2NgWD9eqW91XMFZdq1yPpjIw
	UYQL1UEJNWz5day/d4QGwEwPDA9NYYg5hzUH7y9M+CbcysenEHdn
X-Gm-Gg: ASbGncvJo0C/ucm+XhouKBmPCmq/QNmkW28gZ5KinI4KQJdDqKTSWkLB1fnDlC9nngZ
	vsaKrfdZRskjtSWuzA6IeiVB3dNBcMD2xCy6HkQT36GWV53VVg++A4iRtai8F9HriqgptVogV/9
	YmtnTPUJLBCkRDHuB6ngimON/cNjpSpaG/K0l+9oDAP0SpkLPcAJ9eTtEJE4Dz3CdrrkpVhsmSQ
	89E60XbKEqZfIrWeArGpF9s1DU7X4RsNQQNTYudSFv6ubYjOU0cfJHP2A2xQo+4NZ7AwCnSxf/n
	yi2ZxfrorGw/EL8eDih4oj1uTur1R+RkWuKiwhDmkN/Dn+F1tjS2siQb/QY=
X-Google-Smtp-Source: AGHT+IFWgOdnfzbxh+RFwzENK0J0t5tRSDmDBnU3UXjP+CGN99+rxRf7Y1bXIP0QFV+SCqBDTzPFfg==
X-Received: by 2002:a17:902:d04b:b0:21f:40de:ae4e with SMTP id d9443c01a7336-22c53e3b254mr155646575ad.9.1745299790588;
        Mon, 21 Apr 2025 22:29:50 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:49 -0700 (PDT)
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
Subject: [PATCH v2 14/20] include/qemu/osdep.h: Add Emscripten-specific OS dependencies
Date: Tue, 22 Apr 2025 14:27:18 +0900
Message-Id: <5bad5a7ee50b6e3e18cf97ac07837988b25ad07f.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T43it8YCXcCW

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

V2:
- Moved the change that was incorrectly applied to os-posix.h into os-wasm.h
- Split the MAINTAINERS file change that adds os-wasm.c and os-wasm.h from
  the previous 19th patch into this commit.

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b5578f8..c7a20ac8d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -619,6 +619,12 @@ F: .gitlab-ci.d/cirrus/macos-*
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
2.25.1
