Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o6sm8006091wre.73.2021.06.04.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7163C20007;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 87/99] target/arm: move arm_cpu_finalize_features into cpu64
Date: Fri,  4 Jun 2021 16:53:00 +0100
Message-Id: <20210604155312.15902-88-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /tl/MxbitkS2

From: Claudio Fontana <cfontana@suse.de>

all the features in arm_cpu_finalize_features are actually
TARGET_AARCH64-only now, since KVM is now only supported on 64bit.

Therefore move the function to cpu64.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c     | 36 ++----------------------------------
 target/arm/cpu64.c   | 34 ++++++++++++++++++++++++++++++++++
 target/arm/monitor.c |  4 ++++
 3 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8709c11784..0adbf36347 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -820,40 +820,6 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
-{
-    Error *local_err = NULL;
-
-#ifdef TARGET_AARCH64
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        if (!cpu_sve_finalize_features(cpu, &local_err)) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
-        /*
-         * KVM does not support modifications to this feature.
-         * We have not registered the cpu properties when KVM
-         * is in use, so the user will not be able to set them.
-         */
-        if (tcg_enabled()) {
-            if (!cpu_pauth_finalize(cpu, &local_err)) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-    }
-#endif /* TARGET_AARCH64 */
-
-    if (kvm_enabled()) {
-        kvm_arm_steal_time_finalize(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-}
-
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -876,6 +842,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+#ifdef TARGET_AARCH64
     arm_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -892,6 +859,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                    "AArch64 CPUs must have both VFP and Neon or neither");
         return;
     }
+#endif /* TARGET_AARCH64 */
 
     if (!cpu->has_vfp) {
         uint64_t t;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fefb6954fc..c762f3f07a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -469,6 +469,40 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
+void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+{
+    Error *local_err = NULL;
+
+#ifdef TARGET_AARCH64
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        if (!cpu_sve_finalize_features(cpu, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /*
+         * KVM does not support modifications to this feature.
+         * We have not registered the cpu properties when KVM
+         * is in use, so the user will not be able to set them.
+         */
+        if (tcg_enabled()) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
+    }
+#endif /* TARGET_AARCH64 */
+
+    if (kvm_enabled()) {
+        kvm_arm_steal_time_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+}
+
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 0c72bf7c31..95c1e72cd1 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         if (!err) {
             visit_check_struct(visitor, &err);
         }
+#ifdef TARGET_AARCH64
         if (!err) {
             arm_cpu_finalize_features(ARM_CPU(obj), &err);
         }
+#endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
         visit_free(visitor);
         if (err) {
@@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
             return NULL;
         }
     } else {
+#ifdef TARGET_AARCH64
         arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+#endif /* TARGET_AARCH64 */
     }
 
     expansion_info = g_new0(CpuModelExpansionInfo, 1);
-- 
2.20.1
