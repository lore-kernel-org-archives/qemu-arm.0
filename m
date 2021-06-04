Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s62sm9232329wms.13.2021.06.04.09.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 502211FFD2;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Olaf Hering <OHering@suse.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 61/99] target/arm: remove broad "else" statements when checking accels
Date: Fri,  4 Jun 2021 16:52:34 +0100
Message-Id: <20210604155312.15902-62-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8qnUK4tVqoHf

From: Claudio Fontana <cfontana@suse.de>

There might be more than just KVM and TCG in the future,
so where appropriate, replace broad "else" statements
with the appropriate if (accel_enabled()) check.

Also invert some checks for !kvm_enabled() or !tcg_enabled()
where it seems appropriate to do so.

Note that to make qtest happy we need to perform gpio
initialization in the qtest_enabled() case as well.

Hopefully we do not break any Xen stuff.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Julien Grall <jgrall@amazon.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Olaf Hering <OHering@suse.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c     |  9 +++++----
 target/arm/cpu64.c   |  9 +++++----
 target/arm/machine.c | 18 ++++++------------
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7e3726ff00..57f975f5dc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -37,6 +37,7 @@
 #endif
 
 #include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
@@ -564,7 +565,7 @@ static void arm_cpu_initfn(Object *obj)
          * the same interface as non-KVM CPUs.
          */
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
-    } else {
+    } else if (tcg_enabled() || qtest_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
 
@@ -741,14 +742,14 @@ void arm_cpu_post_init(Object *obj)
         ? cpu_isar_feature(aa64_fp_simd, cpu)
         : cpu_isar_feature(aa32_vfp, cpu)) {
         cpu->has_vfp = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
         }
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
@@ -849,7 +850,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * We have not registered the cpu properties when KVM
          * is in use, so the user will not be able to set them.
          */
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             arm_cpu_pauth_finalize(cpu, &local_err);
             if (local_err != NULL) {
                 error_propagate(errp, local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a8ff1994ca..e3d818275c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "cpu32.h"
 #include "qemu/module.h"
+#include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
@@ -297,7 +298,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              */
             bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
             bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
-        } else {
+        } else if (tcg_enabled()) {
             /* Propagate enabled bits down through required powers-of-two. */
             for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
                 if (!test_bit(vq - 1, cpu->sve_vq_init)) {
@@ -334,7 +335,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "vector length must be enabled.\n");
                 return;
             }
-        } else {
+        } else if (tcg_enabled()) {
             /* Disabling a power-of-two disables all larger lengths. */
             if (test_bit(0, cpu->sve_vq_init)) {
                 error_setg(errp, "cannot disable sve128");
@@ -416,7 +417,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             }
             return;
         }
-    } else {
+    } else if (tcg_enabled()) {
         /* Ensure all required powers-of-two are enabled. */
         for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
             if (!test_bit(vq - 1, cpu->sve_vq_map)) {
@@ -610,7 +611,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-    } else {
+    } else if (tcg_enabled()) {
         uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 595ab94237..4acdccc22d 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -638,9 +638,11 @@ static int cpu_pre_save(void *opaque)
 
     if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
-    }
-
-    if (kvm_enabled()) {
+        if (!write_cpustate_to_list(cpu, false)) {
+            /* This should never fail. */
+            abort();
+        }
+    } else if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
             abort();
@@ -651,11 +653,6 @@ static int cpu_pre_save(void *opaque)
          * write_kvmstate_to_list()
          */
         kvm_arm_cpu_pre_save(cpu);
-    } else {
-        if (!write_cpustate_to_list(cpu, false)) {
-            /* This should never fail. */
-            abort();
-        }
     }
 
     cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
@@ -754,13 +751,10 @@ static int cpu_post_load(void *opaque, int version_id)
          */
         write_list_to_cpustate(cpu);
         kvm_arm_cpu_post_load(cpu);
-    } else {
+    } else if (tcg_enabled()) {
         if (!write_list_to_cpustate(cpu)) {
             return -1;
         }
-    }
-
-    if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
         hw_watchpoint_update_all(cpu);
 
-- 
2.20.1
