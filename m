Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fe2fsm9977563a12.57.2025.05.07.09.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:58:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 43D715F858;
	Wed,  7 May 2025 17:58:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: allow gdb to read ARM_CP_NORAW regs
Date: Wed,  7 May 2025 17:58:40 +0100
Message-Id: <20250507165840.401623-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 34Mdu4LG9hRE

Before this we suppress all ARM_CP_NORAW registers being listed under
GDB. This includes useful registers like CurrentEL which gets tagged
as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
registers. These are registers TCG can directly compute because we
have the information at compile time but until now with no readfn.

Add a .readfn to return the CurrentEL and then loosen the restrictions
in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
be read if there is a readfn available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Julian Armistead <julian.armistead@linaro.org>
---
 target/arm/gdbstub.c |  6 +++++-
 target/arm/helper.c  | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ce4497ad7c..029678ac9a 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -282,7 +282,11 @@ static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
     CPUARMState *env = &cpu->env;
     DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
 
-    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
+    if (!(ri->type & ARM_CP_NO_GDB)) {
+        /* skip ARM_CP_NO_RAW if there are no helper functions */
+        if ((ri->type & ARM_CP_NO_RAW) && !ri->readfn) {
+            return;
+        }
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
                 arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7fb6e88630..7ea1307c20 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4993,6 +4993,17 @@ static void ic_ivau_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 #endif
 
+/*
+ * Normally the current_el is known at translation time and we can
+ * emit the result directly in TCG code. However this helper exists
+ * only so we can also expose CURRENTEL to gdb.
+ */
+static uint64_t aa64_currentel_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    int el = arm_current_el(env);
+    return el;
+}
+
 static const ARMCPRegInfo v8_cp_reginfo[] = {
     /*
      * Minimal set of EL0-visible registers. This will need to be expanded
@@ -5031,7 +5042,9 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     },
     { .name = "CURRENTEL", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 2, .crn = 4, .crm = 2,
-      .access = PL1_R, .type = ARM_CP_CURRENTEL },
+      .access = PL1_R, .type = ARM_CP_CURRENTEL,
+      .readfn = aa64_currentel_read
+    },
     /*
      * Instruction cache ops. All of these except `IC IVAU` NOP because we
      * don't emulate caches.
-- 
2.39.5
