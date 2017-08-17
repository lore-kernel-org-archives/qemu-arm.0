Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e76sm5963760wmd.36.2017.08.17.11.04.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 11:04:10 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 036333E1363;
	Thu, 17 Aug 2017 19:04:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: rth@twiddle.net,
	cota@braap.org,
	batuzovk@ispras.ru
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH 7/9] target/arm/translate-a64: register global vectors
Date: Thu, 17 Aug 2017 19:04:02 +0100
Message-Id: <20170817180404.29334-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170817180404.29334-1-alex.bennee@linaro.org>
References: <20170817180404.29334-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6sE0dXr2VBjW

Register the vector registers with TCG.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 805af51900..b5f48605a7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -36,8 +36,10 @@
 
 #include "trace-tcg.h"
 
+/* Global registers */
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
+static TCGv_vec cpu_V[32];
 
 /* Load/store exclusive handling */
 static TCGv_i64 cpu_exclusive_high;
@@ -50,6 +52,13 @@ static const char *x_regnames[] = {
     "x24", "x25", "x26", "x27", "x28", "x29", "lr", "sp"
 };
 
+static const char *v_regnames[] = {
+    "v0", "v1", "v2", "v3", "v4", "v5", "v6", "v7",
+    "v8", "v9", "v10", "v11", "v12", "v13", "v14", "v15",
+    "v16", "v17", "v18", "v19", "v20", "v21", "v22", "v23",
+    "v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31"
+};
+
 enum a64_shift_type {
     A64_SHIFT_TYPE_LSL = 0,
     A64_SHIFT_TYPE_LSR = 1,
@@ -91,10 +100,18 @@ void a64_translate_init(void)
     cpu_pc = tcg_global_mem_new_i64(cpu_env,
                                     offsetof(CPUARMState, pc),
                                     "pc");
-    for (i = 0; i < 32; i++) {
+
+    for (i = 0; i < ARRAY_SIZE(cpu_X); i++) {
         cpu_X[i] = tcg_global_mem_new_i64(cpu_env,
                                           offsetof(CPUARMState, xregs[i]),
-                                          regnames[i]);
+                                          x_regnames[i]);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(cpu_V); i++) {
+        cpu_V[i] = tcg_global_mem_new_vec(cpu_env,
+                                          offsetof(CPUARMState,
+                                                   vfp.regs[i * 2]),
+                                          v_regnames[i]);
     }
 
     cpu_exclusive_high = tcg_global_mem_new_i64(cpu_env,
-- 
2.13.0
