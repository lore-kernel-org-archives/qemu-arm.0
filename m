Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2EFC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:04:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLx3-0004In-Sw; Sat, 02 Aug 2025 19:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLs5-0004Wo-KC
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:46 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLs4-0006t0-0f
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:37 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e8d96ff2dfaso3053756276.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754178154; x=1754782954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QFj8gESh/eq5jJW2e2RUPuhA+cwRUSiqjJJ5xCzpQk=;
 b=a3Rztez4k/4hNiHCrzXl3AhGJukOGvWNmKy5dtapiVe4uKnsV9gCyzVevy312gBSqB
 +03BCqVQk5v4NHmuU1DlscNVI/onLXOZXMZyWodXN+NSnD61StLBQuPGRMfI3o4qKV64
 MIB5CvOeGPL6fe/mCO+Cp3dnooQw3qgpZxO9BQgg7g5uaBN7CHP1RuZIr9NKP7xLzIfe
 Hf5nWrLcGbhnT+AMiMYWoGGIzTlcZLuvInIet1SpU5pdg79ODuKiATos1ITekHmxA+jh
 JRnFK47fXTEuTVPDgyhMTCbFYA3u5Pz7KIiF2k0mkCSCx0WlYYINzqcQ+8MM9IAJXW0W
 F6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754178154; x=1754782954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QFj8gESh/eq5jJW2e2RUPuhA+cwRUSiqjJJ5xCzpQk=;
 b=CHjNcZ3He3OKcXGFaL8n6CCXhOX7McXb7WDtmg2I7wONcXNTW+RSwHveL9R2qleXNa
 8Uiq442rZJMFRlQyf6s2FshBkBiml19+t3mNnwGT3Pc/BhSA5J3AA2XCFI1mVs4Gq48n
 BD3otUaNRvvvhrDaz05ZLNRsjjYqMVosVqzQPiuvHz2ThtMPBivILBBArWLrXICwjo+J
 zricTxFH3FBNM7Nksgc5afzFFGDN+vdowDC6dP9gcCYt5lVNOPed3UvnDyD07JRa7DxB
 RJRA9Qkj7XRQTplh6NxQ0oNc9F/9mC5NAfeQg8agaceAGsc/xJE+kQQqAPBTpfrvFqj4
 PADQ==
X-Gm-Message-State: AOJu0Yzft+17AZdDkpN1b8MBFyuXFWkf+8fDY7JI/taqgEcbvD5Ka6mZ
 IwIOThX6OIIdLMj0GKyaKjRWyAwetlzrKkc5ItE/T0/1ssvra1T7OYDcnGF5cdbJo8+bNGlrv71
 pUqSO1Yk=
X-Gm-Gg: ASbGncsc8MosBqqv59G3QAPaFSqWPaud3q0jvt6wRvPFOgvbQpPUE4ap3/J1EM1oe2Z
 Y4ReRx2nUq2XXfR3y5xm4F2nXqKHEwDxBYY6KM12/sWRl8QHpkccoI3xSobL7lJnVj8tXVzpGQS
 EGaa4MAiK33i1aOBDx249kBRwd5oxOvAK9ZGRufbL4TRoArkY+HQ2B7PTzUlta5yfBu7EF645Bp
 SAsMlTt+JiGE1dEfzl2jXIEkvvAqBxIU+gQ1vtjGT7/60O6+kxkkWfqCiUUvs52rDVKR6KfeBjw
 w0V46VzMn/7p2qY8YOflfdKNgng8yTYFoPTkyOpGhWAnNs6pwyIidcaZgMg3A9LQ6WIwObGqh5H
 lzRxPR4W5Y+x/26Pt9JaU4cHKgeoHJz/ZH7N7ue4KZhGwpCjLxlqUv310qpreOcg=
X-Google-Smtp-Source: AGHT+IHwbPBZqcAskzzAbai35QDmedvuArmT8sNZACP/fgu8f87SPEu8xANkoaeaPJD+ft3UQhj64Q==
X-Received: by 2002:a05:690c:9a82:b0:71a:3f0:b474 with SMTP id
 00721157ae682-71b7f3ce0c6mr56501287b3.15.1754178154228; 
 Sat, 02 Aug 2025 16:42:34 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a423f38sm18461527b3.40.2025.08.02.16.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:42:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 83/85] tests/tcg/aarch64: Add gcsstr
Date: Sun,  3 Aug 2025 09:29:51 +1000
Message-ID: <20250802232953.413294-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


