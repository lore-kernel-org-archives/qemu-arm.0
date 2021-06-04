Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a12sm6236678wmj.36.2021.06.04.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8D2041FF90;
	Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 55/99] target/arm: move cpu_tcg to tcg/tcg-cpu-models.c
Date: Fri,  4 Jun 2021 16:52:28 +0100
Message-Id: <20210604155312.15902-56-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DBNGxem98F7g

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} | 7 +------
 target/arm/meson.build                         | 4 ----
 target/arm/tcg/meson.build                     | 1 +
 3 files changed, 2 insertions(+), 10 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (99%)

diff --git a/target/arm/cpu_tcg.c b/target/arm/tcg/tcg-cpu-models.c
similarity index 99%
rename from target/arm/cpu_tcg.c
rename to target/arm/tcg/tcg-cpu-models.c
index 4606ad8436..91af2174a1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG CPUs.
+ * QEMU ARM TCG-only CPUs.
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -9,10 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
-#endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -24,7 +21,6 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -48,7 +44,6 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0ccd2fb0bc..8d0c12b2fc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -18,10 +18,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gdbstub64.c',
 ))
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cpu_tcg.c',
-))
-
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 4e690eea6c..5b36a13a24 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -32,6 +32,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'crypto_helper.c',
   'debug_helper.c',
   'tcg-cpu.c',
+  'tcg-cpu-models.c',
 
 ), if_false: files(
   'tcg-stubs.c',
-- 
2.20.1
