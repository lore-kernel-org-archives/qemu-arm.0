Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab779832909sm246283066b.49.2025.02.07.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:31:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7F319609FC;
	Fri,  7 Feb 2025 15:31:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Kyle Evans <kevans@freebsd.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-rust@nongnu.org,
	qemu-riscv@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 12/17] user: Introduce user/signal.h
Date: Fri,  7 Feb 2025 15:31:07 +0000
Message-Id: <20250207153112.3939799-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M40vkBg/sKCp

From: Ilya Leoshkevich <iii@linux.ibm.com>

gdbstub needs target_to_host_signal(), so move its declaration to a
public header.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-4-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 bsd-user/signal-common.h   |  1 -
 include/user/signal.h      | 23 +++++++++++++++++++++++
 linux-user/signal-common.h |  1 -
 bsd-user/signal.c          |  1 +
 linux-user/signal.c        |  1 +
 linux-user/syscall.c       |  1 +
 6 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 include/user/signal.h

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 77d7c7a78b..4e634e04a3 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -42,7 +42,6 @@ void process_pending_signals(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info);
 void signal_init(void);
-int target_to_host_signal(int sig);
 void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
 
 /*
diff --git a/include/user/signal.h b/include/user/signal.h
new file mode 100644
index 0000000000..19b6b9e5dd
--- /dev/null
+++ b/include/user/signal.h
@@ -0,0 +1,23 @@
+/*
+ * Signal-related declarations.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef USER_SIGNAL_H
+#define USER_SIGNAL_H
+
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
+/**
+ * target_to_host_signal:
+ * @sig: target signal.
+ *
+ * On success, return the host signal between 0 (inclusive) and NSIG
+ * (exclusive) corresponding to the target signal @sig. Return any other value
+ * on failure.
+ */
+int target_to_host_signal(int sig);
+
+#endif
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 8584d9ecc2..196d2406f8 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -61,7 +61,6 @@ void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info);
 void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
 void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
-int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index b4e1458237..8c51f6ce65 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -24,6 +24,7 @@
 #include "user/cpu_loop.h"
 #include "exec/page-protection.h"
 #include "user/page-protection.h"
+#include "user/signal.h"
 #include "user/tswap-target.h"
 #include "gdbstub/user.h"
 #include "signal-common.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 087c4d270e..bffbef235c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -36,6 +36,7 @@
 #include "user/cpu_loop.h"
 #include "user/page-protection.h"
 #include "user/safe-syscall.h"
+#include "user/signal.h"
 #include "tcg/tcg.h"
 
 /* target_siginfo_t must fit in gdbstub's siginfo save area. */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6ee02383da..90afaa4426 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -138,6 +138,7 @@
 #include "user-mmap.h"
 #include "user/page-protection.h"
 #include "user/safe-syscall.h"
+#include "user/signal.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.39.5
