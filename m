Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b7sm7288622wri.83.2021.06.04.11.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 85BAB1FFE0;
	Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 72/99] target/arm: cpu-sve: rename functions according to module prefix
Date: Fri,  4 Jun 2021 16:52:45 +0100
Message-Id: <20210604155312.15902-73-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9/qwkFF3Y4hY

From: Claudio Fontana <cfontana@suse.de>

external functions have the cpu_sve prefix,
while for static functions it can be omitted.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h     |  6 +++---
 target/arm/cpu-sve.c     | 32 ++++++++++++++++----------------
 target/arm/cpu.c         |  2 +-
 target/arm/cpu64.c       |  4 ++--
 target/arm/kvm/kvm-cpu.c |  2 +-
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 692509d419..ece36d2a0c 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -26,12 +26,12 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
-void aarch64_add_sve_properties(Object *obj);
+void cpu_sve_add_props(Object *obj);
 
 /* add the CPU SVE properties specific to the "MAX" CPU */
-void aarch64_add_sve_properties_max(Object *obj);
+void cpu_sve_add_props_max(Object *obj);
 
 #endif /* CPU_SVE_H */
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 129fb9586e..da60330cc2 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -27,7 +27,7 @@
 #include "qapi/visitor.h"
 #include "cpu-sve.h"
 
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
+void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
 {
     /*
      * If any vector lengths are explicitly enabled with sve<N> properties,
@@ -229,8 +229,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     cpu->sve_max_vq = max_vq;
 }
 
-static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+static void get_prop_max_vq(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t value;
@@ -244,8 +244,8 @@ static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
     visit_type_uint32(v, name, &value, errp);
 }
 
-static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+static void set_prop_max_vq(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t max_vq;
@@ -276,8 +276,8 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
  * of the contents of "name" to determine which bit on which
  * to operate.
  */
-static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void get_prop_vq(Object *obj, Visitor *v, const char *name,
+                        void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq = atoi(&name[3]) / 128;
@@ -292,8 +292,8 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
-static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void set_prop_vq(Object *obj, Visitor *v, const char *name,
+                        void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq = atoi(&name[3]) / 128;
@@ -317,13 +317,13 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
     set_bit(vq - 1, cpu->sve_vq_init);
 }
 
-static bool cpu_arm_get_sve(Object *obj, Error **errp)
+static bool get_prop_sve(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     return cpu_isar_feature(aa64_sve, cpu);
 }
 
-static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
+static void set_prop_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
@@ -338,21 +338,21 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     cpu->isar.id_aa64pfr0 = t;
 }
 
-void aarch64_add_sve_properties(Object *obj)
+void cpu_sve_add_props(Object *obj)
 {
     uint32_t vq;
 
-    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
+    object_property_add_bool(obj, "sve", get_prop_sve, set_prop_sve);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
         sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq, cpu_arm_set_sve_vq, NULL, NULL);
+        object_property_add(obj, name, "bool", get_prop_vq, set_prop_vq, NULL, NULL);
     }
 }
 
 /* properties added for MAX CPU */
-void aarch64_add_sve_properties_max(Object *obj)
+void cpu_sve_add_props_max(Object *obj)
 {
-    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq, cpu_max_set_sve_max_vq, NULL, NULL);
+    object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6db37b42d1..e4ad92ffec 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -821,7 +821,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 
 #ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        arm_cpu_sve_finalize(cpu, &local_err);
+        cpu_sve_finalize_features(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3a6b7cf5d1..03ed637bdb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -452,8 +452,8 @@ static void aarch64_max_initfn(Object *obj)
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
     }
 
-    aarch64_add_sve_properties(obj);
-    aarch64_add_sve_properties_max(obj);
+    cpu_sve_add_props(obj);
+    cpu_sve_add_props_max(obj);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index a23831e3c6..09aede9319 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -89,7 +89,7 @@ static void host_cpu_instance_init(Object *obj)
 
     kvm_arm_set_cpu_features_from_host(cpu);
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
+        cpu_sve_add_props(obj);
     }
     arm_cpu_post_init(obj);
 }
-- 
2.20.1
