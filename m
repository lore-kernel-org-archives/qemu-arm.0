Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q19sm9085241wmc.44.2021.06.04.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8F0421FFBD;
	Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 37/99] target/arm: move sve_zcr_len_for_el to common_cpu
Date: Fri,  4 Jun 2021 16:52:10 +0100
Message-Id: <20210604155312.15902-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9SaaKUeOvUED

From: Claudio Fontana <cfontana@suse.de>

it is required by arch-dump.c and cpu.c, so apparently
we need this for KVM too

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 43 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 33 -------------------------------
 2 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 040e06392a..a34f7f19d8 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -299,3 +299,46 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
 
     return ret;
 }
+
+/*
+ * these are AARCH64-only, but due to the chain of dependencies,
+ * between HELPER prototypes, hflags, cpreg definitions and functions in
+ * tcg/ etc, it becomes incredibly messy to add what should be here:
+ *
+ * #ifdef TARGET_AARCH64
+ */
+
+static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+{
+    uint32_t end_len;
+
+    end_len = start_len &= 0xf;
+    if (!test_bit(start_len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, start_len);
+        assert(end_len < start_len);
+    }
+    return end_len;
+}
+
+/*
+ * Given that SVE is enabled, return the vector length for EL.
+ */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint32_t zcr_len = cpu->sve_max_vq - 1;
+
+    if (el <= 1) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+    }
+    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+    }
+
+    return sve_zcr_get_valid_len(cpu, zcr_len);
+}
+
+/* #endif TARGET_AARCH64 , see matching comment above */
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index a4630b4039..93fa3fa2a9 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -322,39 +322,6 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    end_len = start_len &= 0xf;
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
-/*
- * Given that SVE is enabled, return the vector length for EL.
- */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
-
-    if (el <= 1) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
-    }
-    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
-    }
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
-    }
-
-    return sve_zcr_get_valid_len(cpu, zcr_len);
-}
-
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
-- 
2.20.1
