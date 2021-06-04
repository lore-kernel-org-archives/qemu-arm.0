Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s1sm7503481wre.67.2021.06.04.09.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9026A20008;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 88/99] target/arm: cpu64: rename arm_cpu_finalize_features
Date: Fri,  4 Jun 2021 16:53:01 +0100
Message-Id: <20210604155312.15902-89-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 70bn7TQNlmgK

From: Claudio Fontana <cfontana@suse.de>

also remove the now useless ifdef TARGET_AARCH64 from the function

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h       | 2 +-
 target/arm/cpu.h           | 2 +-
 target/arm/tcg/cpu-pauth.h | 2 +-
 target/arm/cpu.c           | 2 +-
 target/arm/cpu64.c         | 4 +---
 target/arm/monitor.c       | 4 ++--
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index c83508ea0a..85078550bb 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -25,7 +25,7 @@
 
 #include "cpu.h"
 
-/* called by arm_cpu_finalize_features in realizefn */
+/* called by aarch64_cpu_finalize_features in realizefn */
 bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 02e0fe5dbd..847d3628e9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2127,7 +2127,7 @@ static inline int arm_feature(CPUARMState *env, int feature)
     return (env->features & (1ULL << feature)) != 0;
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp);
+void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp);
 
 #if !defined(CONFIG_USER_ONLY)
 /* Return true if exception levels below EL3 are in secure state,
diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
index a0ef74dc77..b106b9cefc 100644
--- a/target/arm/tcg/cpu-pauth.h
+++ b/target/arm/tcg/cpu-pauth.h
@@ -25,7 +25,7 @@
 
 #include "cpu.h"
 
-/* called by arm_cpu_finalize_features in realizefn */
+/* called by aarch64_cpu_finalize_features in realizefn */
 bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 
 /* add the CPU Pointer Authentication properties */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0adbf36347..fb04d768b5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -843,7 +843,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #ifdef TARGET_AARCH64
-    arm_cpu_finalize_features(cpu, &local_err);
+    aarch64_cpu_finalize_features(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c762f3f07a..3058e2c273 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -469,11 +469,10 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
     return g_strdup("aarch64");
 }
 
-void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         if (!cpu_sve_finalize_features(cpu, &local_err)) {
             error_propagate(errp, local_err);
@@ -492,7 +491,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             }
         }
     }
-#endif /* TARGET_AARCH64 */
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 95c1e72cd1..8a31c4dd04 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -186,7 +186,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
 #ifdef TARGET_AARCH64
         if (!err) {
-            arm_cpu_finalize_features(ARM_CPU(obj), &err);
+            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
         }
 #endif /* TARGET_AARCH64 */
         visit_end_struct(visitor, NULL);
@@ -198,7 +198,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         }
     } else {
 #ifdef TARGET_AARCH64
-        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
+        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
 #endif /* TARGET_AARCH64 */
     }
 
-- 
2.20.1
