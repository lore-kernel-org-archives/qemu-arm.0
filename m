Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA208C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:12:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwTw-0001Nj-PY; Sun, 27 Jul 2025 04:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwSu-0000BI-Q5
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:10:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwSq-0005R0-12
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:10:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so2618835b3a.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603834; x=1754208634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BmpRZBaWh5no0akyUOZ9r4Fxe0S4GM46R9zVbkzAxU=;
 b=gFWt12CQzc1OWDxDsIr0cyId/38D9g8g3orHaGHXH/vuB3STstqflfll0xC3HalktX
 L3Qir0QSPxqIun4wkER7oOx16/ZRrhUQGn/njyeQE8mZ7o5305m7a4XYR4xzZJvxxPeo
 RAa0SCclNwncQeuBvkc/tJX9tPZ3QMOM8DSWZEtGSMqtDSx5/BeXkK5ocsKTjPlSHkMM
 mNhlnxXTmc63d8hhylOkLImb1+6rLbCncoltLSTTfp861fWpae/p9FUASZz2MODvj0HU
 GSee7ZalrOu01xtbINOc2I6EqC0Yci43+fCMme52c5hCx9vL486GIcKPERkIjBTYiXC7
 bWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603834; x=1754208634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BmpRZBaWh5no0akyUOZ9r4Fxe0S4GM46R9zVbkzAxU=;
 b=ToqbTq2L+VVjz/0mI+jHASzs4jJgnpnWN3/blJcNwftmmf6Kkr9McrbUCvMUlEOcAC
 OSEQOws6pHFHcveKYEgNUiYsHmp1dKxOd7t0PMEvyNtxcxhLkvh9GkA/5OWVaL7itPJ4
 G+W2T/ef+KqXeeUfW0McGifPuPNYamVsUQu8sizGxwvI7szllLqwpVwDjcKuDCjYrXF/
 2vUyeTtXYvvZ1wogVINqYy3DmByBV7RLB7f19DjgAVaEaIy/+xgxOy6uJCHGJcfEdSmA
 AQqnbdM4ZB1Bt80WvjcyBkOVGzCPQWsKTfRFVSz/23D+/a/M7d/W1jNWwwvR+J3tZpao
 ytRg==
X-Gm-Message-State: AOJu0YxvTEvZLPyjG448MBELU5ecnTlQ/jSD4pQQDOjJdJtVYW4ADuEm
 HVVQvay0ABw4o6WgVUvHgtQsN04xWsbeN6517J5n2IHXOHfCtRbiHqjJxmmKKYnAmRQ=
X-Gm-Gg: ASbGncvIPcWc42VuTK46rMg181Z1rNb0XiZ5EsJsTXk32FY4Lta9NoiFUUxc0dqIelM
 cVlvFJuOVAmAW/XDP6HbDUona4fhEeYwd1n8CbH+do+60PmF369kLHkaJpouJA7WEhnGmLyOoNV
 EmwCQYM1PzWDx3EuG+Jcn8HFfGSTLERgbyvYJ9gu+hjSVhT0RqEMAqX1u/H0+YAdb+Iy7QORsbN
 Uvf9tkruHUBoCHEG2bDAtpSCN3Xr03fWvV5wafZKzfA0bAFfLZFhNkUBpA7kkrqg5ReRlb6hs6c
 j/mSfqI/cuGe7YMCygtjQ4HD458uUD7iXKkFFAvRnq+FoG3d56DHneeuv6IqJXgUh+A483rC2qI
 PaBB92vcBqhj0Z59LKrnBryYD0KG4M9tNNe164HPZijwSyEoWy/ZP64DNl0swc9p4CpUEfB7ije
 2yiS+iqy8e7A==
X-Google-Smtp-Source: AGHT+IED5/K/3pO98rUvykzieWT76IGk2lsmulFAD0opY1CGyfjPmahkMCkAIuNDBW2l/+wV9hkoqw==
X-Received: by 2002:a05:6a00:18a2:b0:736:8c0f:7758 with SMTP id
 d2e1a72fcca58-76336a42c17mr9417550b3a.10.1753603833757; 
 Sun, 27 Jul 2025 01:10:33 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0271csm3085491b3a.49.2025.07.27.01.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:10:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 80/82] tests/tcg/aarch64: Add gcsstr
Date: Sat, 26 Jul 2025 22:02:52 -1000
Message-ID: <20250727080254.83840-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add some infrastructure for testing gcs in userspace.
Validate successful and trapped executions of GCSSTR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/gcs.h           | 71 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/gcsstr.c        | 48 +++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 +++
 3 files changed, 124 insertions(+)
 create mode 100644 tests/tcg/aarch64/gcs.h
 create mode 100644 tests/tcg/aarch64/gcsstr.c

diff --git a/tests/tcg/aarch64/gcs.h b/tests/tcg/aarch64/gcs.h
new file mode 100644
index 0000000000..99cb4d4e38
--- /dev/null
+++ b/tests/tcg/aarch64/gcs.h
@@ -0,0 +1,71 @@
+/*
+ * Linux kernel fallback API definitions for GCS and test helpers.
+ *
+ * Copyright (c) 2025 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <assert.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <errno.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <sys/syscall.h>
+
+#ifndef PR_GET_SHADOW_STACK_STATUS
+#define PR_GET_SHADOW_STACK_STATUS	74
+#endif
+#ifndef PR_SET_SHADOW_STACK_STATUS
+#define PR_SET_SHADOW_STACK_STATUS      75
+#endif
+#ifndef PR_LOCK_SHADOW_STACK_STATUS
+#define PR_LOCK_SHADOW_STACK_STATUS     76
+#endif
+#ifndef PR_SHADOW_STACK_ENABLE
+# define PR_SHADOW_STACK_ENABLE         (1 << 0)
+# define PR_SHADOW_STACK_WRITE		(1 << 1)
+# define PR_SHADOW_STACK_PUSH		(1 << 2)
+#endif
+#ifndef SHADOW_STACK_SET_TOKEN
+#define SHADOW_STACK_SET_TOKEN          (1 << 0)
+#endif
+#ifndef SHADOW_STACK_SET_MARKER
+#define SHADOW_STACK_SET_MARKER         (1 << 1)
+#endif
+#ifndef SEGV_CPERR
+#define SEGV_CPERR  10
+#endif
+#ifndef __NR_map_shadow_stack
+#define __NR_map_shadow_stack  453
+#endif
+
+/*
+ * Macros, and implement the syscall inline, lest we fail
+ * the checked return from any function call.
+ */
+#define enable_gcs(flags) \
+    do {                                                                     \
+        register long num  __asm__ ("x8") = __NR_prctl;                      \
+        register long arg1 __asm__ ("x0") = PR_SET_SHADOW_STACK_STATUS;      \
+        register long arg2 __asm__ ("x1") = PR_SHADOW_STACK_ENABLE | flags;  \
+        register long arg3 __asm__ ("x2") = 0;                               \
+        register long arg4 __asm__ ("x3") = 0;                               \
+        register long arg5 __asm__ ("x4") = 0;                               \
+        asm volatile("svc #0"                                                \
+                     : "+r"(arg1)                                            \
+                     : "r"(arg2), "r"(arg3), "r"(arg4), "r"(arg5), "r"(num)  \
+                     : "memory", "cc");                                      \
+        if (arg1) {                                                          \
+            errno = -arg1;                                                   \
+            perror("PR_SET_SHADOW_STACK_STATUS");                            \
+            exit(2);                                                         \
+        }                                                                    \
+    } while (0)
+
+#define gcspr() \
+    ({ uint64_t *r; asm volatile("mrs %0, s3_3_c2_c5_1" : "=r"(r)); r; })
diff --git a/tests/tcg/aarch64/gcsstr.c b/tests/tcg/aarch64/gcsstr.c
new file mode 100644
index 0000000000..b045aee925
--- /dev/null
+++ b/tests/tcg/aarch64/gcsstr.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "gcs.h"
+
+/*
+ * A single garbage store to the gcs stack.
+ * The asm inside must be unique, so disallow inlining.
+ */
+void __attribute__((noinline))
+test_gcsstr(void)
+{
+    register uint64_t *ptr __asm__("x0") = gcspr();
+    /* GCSSTR x1, x0 */
+    __asm__("inst_gcsstr: .inst 0xd91f1c01" : : "r"(--ptr));
+}
+
+static void test_sigsegv(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+    uint64_t inst_gcsstr;
+
+    __asm__("adr %0, inst_gcsstr" : "=r"(inst_gcsstr));
+    assert(uc->uc_mcontext.pc == inst_gcsstr);
+    assert(info->si_code == SEGV_CPERR);
+    /* TODO: Dig for ESR and verify syndrome. */
+    exit(0);
+}
+
+int main()
+{
+    struct sigaction sa = {
+        .sa_sigaction = test_sigsegv,
+        .sa_flags = SA_SIGINFO,
+    };
+
+    /* Enable GCSSTR and test the store succeeds. */
+    enable_gcs(PR_SHADOW_STACK_WRITE);
+    test_gcsstr();
+
+    /* Disable GCSSTR and test the resulting sigsegv. */
+    enable_gcs(0);
+    if (sigaction(SIGSEGV, &sa, NULL) < 0) {
+        perror("sigaction");
+        exit(1);
+    }
+    test_gcsstr();
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 16ddcf4f88..0347a36e8d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -75,6 +75,11 @@ AARCH64_TESTS += $(SME_TESTS)
 $(SME_TESTS): CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
 endif
 
+# GCS Tests
+GCS_TESTS += gcsstr
+AARCH64_TESTS += $(GCS_TESTS)
+$(GCS_TESTS): gcs.h
+
 # System Registers Tests
 AARCH64_TESTS += sysregs
 
-- 
2.43.0


