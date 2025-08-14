Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8318CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXhP-0000xB-1H; Thu, 14 Aug 2025 09:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhH-0000la-76
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhB-0005xu-Qx
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b4717543ed9so538569a12.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176917; x=1755781717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QFj8gESh/eq5jJW2e2RUPuhA+cwRUSiqjJJ5xCzpQk=;
 b=v9HftAT7k3q1G8PR+IfoL0zVLM8Jpw1kjW6Xom3lwhEFLQXmw5hIunw588iZwzs2IU
 exxMp6v4Z7yRLm94W8vEXxxRY0URkT7qGnSdEEqHmaxLHmAzEC9dDTJXCvKR3107jvUe
 50WPkvgimlOfs0C6L6ROySv/1fY4TIsCBAyAecE4J2Bncz/EleVoOcPmfDponWMwQyjn
 5NpVFWHT3/JLjn6Ui8iW2XAMO6WhesgUSHQUxqhb0I3+MQ2KLraVeg5MMgUnNPOCB8AT
 jXkJ1EYNYmJ73EAC5nLT37YeXI6/X1xx7xLs2D86RkjPzanpUgeg9CEniLm8TEEYXoVI
 AFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176917; x=1755781717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QFj8gESh/eq5jJW2e2RUPuhA+cwRUSiqjJJ5xCzpQk=;
 b=Y/06u3iDQhx140h5pDuhFR+4QmZdSeGflO+ohqDD/rbPlNJ5VrvchcrhnFPx2hCC9r
 KNe9fdt5I4Em2RzG6uIXh7Oo3+19XDmKAKxU+u4fWgRyH8fppldWMhVixZV6v6HAoLou
 ETClitBthbP2oKchfQY0N1N+0yz+xG+q1j3V/RrQClUUnl+jz+kxGb+1RBv5pMHAsywB
 1Aad6a3UUVjRN1yTgHB9dHyxtlsgBIVI6y7lil5RKgWTPhfWOiKE7jc5LuRqdXrG8LaU
 oJ37DAAFLBBVyjJE/XTqLHMb1uYlvN7oLrIN9ed+y22x0uGugiH4RnXVQFHFp49FuU7I
 Gl5A==
X-Gm-Message-State: AOJu0YxGumk6pa2Nimgks9hFL3nVzH1Xa7xh4lvLnSlLsQ4C5oKhVlj8
 E9Ji3tPVHMK9bue6rm9cpiNNp9Me4n4UkHoLTce7S4J42VqIv44N8MXb3WKs6MaUCJI=
X-Gm-Gg: ASbGncu7ylAvbTQqLCAxIz+9FtJ23VlzUdfNi2ShX05rgrQpcKKNpdzzdbBHXGcx9A3
 suypMtlcXk9j+aoflGd9IGsKy+Drm/KbR15sa9e7Rz9WfwLtKGXKQj7hpur/Fil+DX0OzFuKUbL
 DXOCcDMKd5W0MuIzynjum/tGGSa32zAlQTI1QZqCZruilnxSKgXZ2cbjr8Nqqt1+HEYjeNyG0fO
 RcRPGBEdIKEINCn7CzvC7WIzYIaSz38g2l4xg0WnIzyfj24se2wuJWYbhOUi1o8XvzrPFEtoOxy
 ctFDT9tb+g3Ldgw1iixy48niHva3/c775vVSP5VkGyW3Dvu28MwoVTm/x97YJgWaKgUBzaRqh/d
 QK1LxE02cLSslDUUoR4TABuSiuWcGVZUNL6lFpbZLcLEtorc=
X-Google-Smtp-Source: AGHT+IH8941VP1uXJa8jY6Ah37eo+jnrj+VojjCO4TWc4GEFEY/n1VI2va7JGvGfcN5krkBIkPU9CQ==
X-Received: by 2002:a17:903:1984:b0:240:7725:18de with SMTP id
 d9443c01a7336-2445867ee51mr46813895ad.37.1755176917333; 
 Thu, 14 Aug 2025 06:08:37 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24304c2943asm64438335ad.30.2025.08.14.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:08:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 83/85] tests/tcg/aarch64: Add gcsstr
Date: Thu, 14 Aug 2025 22:57:50 +1000
Message-ID: <20250814125752.164107-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


