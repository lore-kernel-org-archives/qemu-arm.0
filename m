Received: by 10.28.91.67 with SMTP id p64csp1200932wmb;
        Thu, 8 Mar 2018 05:06:30 -0800 (PST)
X-Google-Smtp-Source: AG47ELs8KguZ9sn2sr1y1V+7Q+AyamHMPNN3WtoAF8eoqDGE+fRew/jGNW2t/S/BZClPZlWt6iFS
X-Received: by 10.223.138.153 with SMTP id y25mr22125540wry.257.1520514390435;
        Thu, 08 Mar 2018 05:06:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514390; cv=none;
        d=google.com; s=arc-20160816;
        b=aqvrhmVnATxIMJpRjussibVLdhS8U276h1Tp6Ua5lKfyfevnpcS4/LjOUnf/AkMCo7
         INjhaCGe0mMK0NHZQoh0EJeWEFBab+4LzLCP3Ljw6BbJBR6La2jZ2cUUQaSlcwcGpSMn
         WLbhmol+y+Poa6VoaZHvnIfyPXVhA3jDmgzCbNRvWGddwtl5U6pn5E7DR2MVUMqERtmw
         QETbOs1eAAp6v2KNNRYmqciie+CHzeF8W2DW5LYnAmSgUuEbwm9R6YPowzSXhcztty3s
         HAURkvB0VwUJ/tJM8CpAq7CR3qYVjaDlBWfQVjyZVs3emiayeHimbTBasdVvSOp853GA
         bT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=8DYTh3ifXlfM9ksJAhKjNRRsCx5UKF086u9co5t48gU=;
        b=L7E3sWVO6boNW08UKIlynGjR1kc2xJEoK9EyVOkUe00Xphla1jcW0JNx3u4PShTeq4
         ywGIWfw07NZBRnDAdlJZJoM+iFrRYQfyxp3o3oF5oFEaCKlvZdxE10+JoPm47cphebZc
         FpsK3FM2Fzey6hzRcyoOdaamNzYJeMwP5tzneAI5gCSyeMfARXx3oaEdUXAXUGFq6lY3
         I4Rpqlnh4Lsww0xUjKxz39w9SLTKBR7pCKdkFbDWsdWnMrQV3C+EOWdvVTprUqHxMvLo
         pDgsEgmi2/doI4SU9L+VW/kA8aAFiu/CxfJKCc5eJdOnfh34TutGsMnkPYAUv80Q3O0y
         rrrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id l17si602911wrb.418.2018.03.08.05.06.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFc-0005yI-Oo; Thu, 08 Mar 2018 13:06:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 1/6] target/arm: Query host CPU features on-demand at instance init
Date: Thu,  8 Mar 2018 13:06:21 +0000
Message-Id: <20180308130626.12393-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180308130626.12393-1-peter.maydell@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vGxu7eCoZzce

Currently we query the host CPU features in the class init function
for the TYPE_ARM_HOST_CPU class, so that we can later copy them
from the class object into the instance object in the object
instance init function. This is awkward for implementing "-cpu max",
which should work like "-cpu host" for KVM but like "cpu with all
implemented features" for TCG.

Move the place where we store the information about the host CPU from
a class object to static variables in kvm.c, and then in the instance
init function call a new kvm_arm_set_cpu_features_from_host()
function which will query the host kernel if necessary and then
fill in the CPU instance fields.

This allows us to drop the special class struct and class init
function for TYPE_ARM_HOST_CPU entirely.

We can't delay the probe until realize, because the ARM
instance_post_init hook needs to look at the feature bits we
set, so we need to do it in the initfn. This is safe because
the probing doesn't affect the actual VM state (it creates a
separate scratch VM to do its testing), but the probe might fail.
Because we can't report errors in retrieving the host features
in the initfn, we check this belatedly in the realize function
(the intervening code will be able to cope with the relevant
fields in the CPU structure being zero).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.h     |  5 +++++
 target/arm/kvm_arm.h | 35 ++++++++++++++++++++++++-----------
 target/arm/cpu.c     | 13 +++++++++++++
 target/arm/kvm.c     | 36 +++++++++++++++++++-----------------
 target/arm/kvm32.c   |  8 ++++----
 target/arm/kvm64.c   |  8 ++++----
 6 files changed, 69 insertions(+), 36 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8dd6b788df..1df46ad7a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -745,6 +745,11 @@ struct ARMCPU {
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
 
+    /* True if we tried kvm_arm_host_cpu_features() during CPU instance_init
+     * and the probe failed (so we need to report the error in realize)
+     */
+    bool host_cpu_probe_failed;
+
     /* The instance init functions for implementation-specific subclasses
      * set these fields to specify the implementation-dependent values of
      * various constant registers and reset values of non-constant
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cfb7e5af72..1e2364007d 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -152,20 +152,16 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
 void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
 
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
-#define ARM_HOST_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(ARMHostCPUClass, (klass), TYPE_ARM_HOST_CPU)
-#define ARM_HOST_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ARMHostCPUClass, (obj), TYPE_ARM_HOST_CPU)
-
-typedef struct ARMHostCPUClass {
-    /*< private >*/
-    ARMCPUClass parent_class;
-    /*< public >*/
 
+/**
+ * ARMHostCPUFeatures: information about the host CPU (identified
+ * by asking the host kernel)
+ */
+typedef struct ARMHostCPUFeatures {
     uint64_t features;
     uint32_t target;
     const char *dtb_compatible;
-} ARMHostCPUClass;
+} ARMHostCPUFeatures;
 
 /**
  * kvm_arm_get_host_cpu_features:
@@ -174,8 +170,16 @@ typedef struct ARMHostCPUClass {
  * Probe the capabilities of the host kernel's preferred CPU and fill
  * in the ARMHostCPUClass struct accordingly.
  */
-bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc);
+bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
 
+/**
+ * kvm_arm_set_cpu_features_from_host:
+ * @cpu: ARMCPU to set the features for
+ *
+ * Set up the ARMCPU struct fields up to match the information probed
+ * from the host CPU.
+ */
+void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
 /**
  * kvm_arm_sync_mpstate_to_kvm
@@ -200,6 +204,15 @@ void kvm_arm_pmu_init(CPUState *cs);
 
 #else
 
+static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    /* This should never actually be called in the "not KVM" case,
+     * but set up the fields to indicate an error anyway.
+     */
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
+    cpu->host_cpu_probe_failed = true;
+}
+
 static inline int kvm_arm_vgic_probe(void)
 {
     return 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6b77aaa445..abf9fb2160 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -725,6 +725,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     int pagebits;
     Error *local_err = NULL;
 
+    /* If we needed to query the host kernel for the CPU features
+     * then it's possible that might have failed in the initfn, but
+     * this is the first point where we can report it.
+     */
+    if (cpu->host_cpu_probe_failed) {
+        if (!kvm_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with KVM");
+        } else {
+            error_setg(errp, "Failed to retrieve host CPU features");
+        }
+        return;
+    }
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 1219d0062b..1c0e57690a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -33,6 +33,8 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 
 static bool cap_has_mp_state;
 
+static ARMHostCPUFeatures arm_host_cpu_features;
+
 int kvm_arm_vcpu_init(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -129,30 +131,32 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray)
     }
 }
 
-static void kvm_arm_host_cpu_class_init(ObjectClass *oc, void *data)
+void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
 {
-    ARMHostCPUClass *ahcc = ARM_HOST_CPU_CLASS(oc);
+    CPUARMState *env = &cpu->env;
 
-    /* All we really need to set up for the 'host' CPU
-     * is the feature bits -- we rely on the fact that the
-     * various ID register values in ARMCPU are only used for
-     * TCG CPUs.
-     */
-    if (!kvm_arm_get_host_cpu_features(ahcc)) {
-        fprintf(stderr, "Failed to retrieve host CPU features!\n");
-        abort();
+    if (!arm_host_cpu_features.dtb_compatible) {
+        if (!kvm_enabled() ||
+            !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
+            /* We can't report this error yet, so flag that we need to
+             * in arm_cpu_realizefn().
+             */
+            cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
+            cpu->host_cpu_probe_failed = true;
+            return;
+        }
     }
+
+    cpu->kvm_target = arm_host_cpu_features.target;
+    cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
+    env->features = arm_host_cpu_features.features;
 }
 
 static void kvm_arm_host_cpu_initfn(Object *obj)
 {
-    ARMHostCPUClass *ahcc = ARM_HOST_CPU_GET_CLASS(obj);
     ARMCPU *cpu = ARM_CPU(obj);
-    CPUARMState *env = &cpu->env;
 
-    cpu->kvm_target = ahcc->target;
-    cpu->dtb_compatible = ahcc->dtb_compatible;
-    env->features = ahcc->features;
+    kvm_arm_set_cpu_features_from_host(cpu);
 }
 
 static const TypeInfo host_arm_cpu_type_info = {
@@ -163,8 +167,6 @@ static const TypeInfo host_arm_cpu_type_info = {
     .parent = TYPE_ARM_CPU,
 #endif
     .instance_init = kvm_arm_host_cpu_initfn,
-    .class_init = kvm_arm_host_cpu_class_init,
-    .class_size = sizeof(ARMHostCPUClass),
 };
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index f77c9c494b..1740cda47d 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -28,7 +28,7 @@ static inline void set_feature(uint64_t *features, int feature)
     *features |= 1ULL << feature;
 }
 
-bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
+bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
      * fill out the ARMHostCPUClass fields accordingly. To do this
@@ -74,13 +74,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
         return false;
     }
 
-    ahcc->target = init.target;
+    ahcf->target = init.target;
 
     /* This is not strictly blessed by the device tree binding docs yet,
      * but in practice the kernel does not care about this string so
      * there is no point maintaining an KVM_ARM_TARGET_* -> string table.
      */
-    ahcc->dtb_compatible = "arm,arm-v7";
+    ahcf->dtb_compatible = "arm,arm-v7";
 
     for (i = 0; i < ARRAY_SIZE(idregs); i++) {
         ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &idregs[i]);
@@ -132,7 +132,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
         set_feature(&features, ARM_FEATURE_VFP4);
     }
 
-    ahcc->features = features;
+    ahcf->features = features;
 
     return true;
 }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ac728494a4..e0b8246283 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -443,7 +443,7 @@ static inline void unset_feature(uint64_t *features, int feature)
     *features &= ~(1ULL << feature);
 }
 
-bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
+bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
      * fill out the ARMHostCPUClass fields accordingly. To do this
@@ -471,8 +471,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
         return false;
     }
 
-    ahcc->target = init.target;
-    ahcc->dtb_compatible = "arm,arm-v8";
+    ahcf->target = init.target;
+    ahcf->dtb_compatible = "arm,arm-v8";
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -486,7 +486,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
     set_feature(&features, ARM_FEATURE_AARCH64);
     set_feature(&features, ARM_FEATURE_PMU);
 
-    ahcc->features = features;
+    ahcf->features = features;
 
     return true;
 }
-- 
2.16.2
