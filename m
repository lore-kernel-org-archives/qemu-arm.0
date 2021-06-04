Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m132sm6351030wmf.10.2021.06.04.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CAC8E1FFE6;
	Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 74/99] target/arm: cpu-sve: make cpu_sve_finalize_features return bool
Date: Fri,  4 Jun 2021 16:52:47 +0100
Message-Id: <20210604155312.15902-75-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eU71MdRP//7a

From: Claudio Fontana <cfontana@suse.de>

return false on error, true on success.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h |  2 +-
 target/arm/cpu-sve.c | 17 +++++++++--------
 target/arm/cpu.c     |  3 +--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index ece36d2a0c..6ab74b1d8f 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -26,7 +26,7 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
+bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
 void cpu_sve_add_props(Object *obj);
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 5190e4a639..24bffbba8b 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -49,7 +49,7 @@ static bool apply_max_vq(unsigned long *sve_vq_map, unsigned long *sve_vq_init,
     return true;
 }
 
-void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
+bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
 {
     /*
      * If any vector lengths are explicitly enabled with sve<N> properties,
@@ -86,7 +86,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                               "length, sve-max-vq=%d (%d bits)\n",
                               max_vq * 128, cpu->sve_max_vq,
                               cpu->sve_max_vq * 128);
-            return;
+            return false;
         }
         if (kvm_enabled()) {
             kvm_sve_enable_lens(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
@@ -98,7 +98,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         /* No explicit bits enabled, and no implicit bits from sve-max-vq. */
         if (!cpu_isar_feature(aa64_sve, cpu)) {
             /* SVE is disabled and so are all vector lengths.  Good. */
-            return;
+            return true;
         }
         if (kvm_enabled()) {
             max_vq = kvm_sve_disable_lens(cpu->sve_vq_map, cpu->sve_vq_init,
@@ -108,7 +108,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                                           errp);
         }
         if (!max_vq) {
-            return;
+            return false;
         }
         max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
     }
@@ -122,7 +122,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         max_vq = cpu->sve_max_vq;
         if (!apply_max_vq(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
                           errp)) {
-            return;
+            return false;
         }
     }
     /*
@@ -136,11 +136,11 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
     if (kvm_enabled()) {
         if (!kvm_sve_validate_lens(cpu->sve_vq_map, max_vq, kvm_supported,
                                    errp, cpu->sve_max_vq)) {
-            return;
+            return false;
         }
     } else if (tcg_enabled()) {
         if (!tcg_sve_validate_lens(cpu->sve_vq_map, max_vq, errp)) {
-            return;
+            return false;
         }
     }
 
@@ -153,11 +153,12 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         error_append_hint(errp, "SVE must be enabled to enable vector "
                           "lengths.\n");
         error_append_hint(errp, "Add sve=on to the CPU property list.\n");
-        return;
+        return false;
     }
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
+    return true;
 }
 
 static void get_prop_max_vq(Object *obj, Visitor *v, const char *name,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e4ad92ffec..0b20faaca0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -821,8 +821,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 
 #ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        cpu_sve_finalize_features(cpu, &local_err);
-        if (local_err != NULL) {
+        if (!cpu_sve_finalize_features(cpu, &local_err)) {
             error_propagate(errp, local_err);
             return;
         }
-- 
2.20.1
