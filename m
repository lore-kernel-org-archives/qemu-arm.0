Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8157351wrp;
        Tue, 1 Oct 2019 05:59:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaWumKUzpa/vtfAb/J62gA+HoPDQGvTAzyhhtJAPT9gWB+wSLx1KGJ35WQFKm4n37kKVon
X-Received: by 2002:a92:498c:: with SMTP id k12mr24974286ilg.88.1569934756272;
        Tue, 01 Oct 2019 05:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569934756; cv=none;
        d=google.com; s=arc-20160816;
        b=lqlE2ILv3nDmcKIyBMFxaDrozQ8rfgFXjjnLQGcRtCjJ1e9+7ZDpAQqqXdIjMClB2R
         85pGJvWGpFa0a4ly8kcMawpDSrfwJ5WYh3C1aVHoPlS0mBy1KT/kC2SK4L6nURqoeF6M
         vSrz5IiL8zDd+Sfx3ee25GpJtvew4fp851n+vItkoJv6Sb4AhTjhdqoH5fZim1gOkr7Y
         eaga7++mog1iP9X+0yJPN/E8ZHmgr4xBaQ6hMNSONgMz0X6GBJs8m5v7OuZiejn6OPHT
         VUZguQ48s99PloylRpMEJe9/BtD7zndyNqLIFmwB8AcM6M5PF06/mdidHd7naHN8e0Xs
         injQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zMPmQ1WjRkoCCp4Gv1ZU6owHyyfNDmZ9xEKAVmr8GAg=;
        b=QBJ1UQGvCsozxmLBt76RbTdHOXyr82OT9MgdFPZKgWCxBi52ONKHgSFHFGb7/i2VkL
         v5UuglPjWrBe++aLEBkKRY82o85aoVUCs/M3jhZ8AjmSnSa3xMOO7XVG3vuifAIVfuhZ
         7X6teW+VyI0HbNxs8LeVRBMAoAy4HEWU9neuMm2iwZj9byUOkmvmoCZmM+KVwQGle5Nz
         vqeuC+lw6jcAhSPbaTw5CVuEpYmsCDaVBBgXbGsIcO+rgUbBJF8oazKCaKOYDhAc+jNs
         t5UUESnm3JaGzSkkBuoYJ7wIcGLIxNPQrE2M3Pf3Da6sJM6E1wZIsyCsTCur4JJyvW/B
         w14A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d30si19249807jai.2.2019.10.01.05.59.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 05:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 771CE1057867;
	Tue,  1 Oct 2019 12:59:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C33E46;
	Tue,  1 Oct 2019 12:59:13 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v5 6/9] target/arm/kvm64: max cpu: Enable SVE when available
Date: Tue,  1 Oct 2019 14:58:42 +0200
Message-Id: <20191001125845.8793-7-drjones@redhat.com>
In-Reply-To: <20191001125845.8793-1-drjones@redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 12:59:15 +0000 (UTC)
X-TUID: 5VUCqP1dR3Za

Enable SVE in the KVM guest when the 'max' cpu type is configured
and KVM supports it. KVM SVE requires use of the new finalize
vcpu ioctl, so we add that now too. For starters SVE can only be
turned on or off, getting all vector lengths the host CPU supports
when on. We'll add the other SVE CPU properties in later patches.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu64.c       | 17 ++++++++++++++---
 target/arm/kvm.c         |  5 +++++
 target/arm/kvm64.c       | 20 +++++++++++++++++++-
 target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
 tests/arm-cpu-features.c |  1 +
 5 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 34b0ba2cf6f7..a771a28daa56 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -493,6 +493,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+        error_setg(errp, "'sve' feature not supported by KVM on this host");
+        return;
+    }
+
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
     cpu->isar.id_aa64pfr0 = t;
@@ -507,11 +512,16 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
+    uint64_t t;
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        if (kvm_arm_sve_supported(CPU(cpu))) {
+            t = cpu->isar.id_aa64pfr0;
+            t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+            cpu->isar.id_aa64pfr0 = t;
+        }
     } else {
-        uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
 
@@ -612,8 +622,6 @@ static void aarch64_max_initfn(Object *obj)
 
         object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                             cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
-        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
 
         for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
             char name[8];
@@ -622,6 +630,9 @@ static void aarch64_max_initfn(Object *obj)
                                 cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
         }
     }
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
 }
 
 struct ARMCPUInfo {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b2eaa50b8df9..72569f71236e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -51,6 +51,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
 }
 
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+{
+    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
+}
+
 void kvm_arm_init_serror_injection(CPUState *cs)
 {
     cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4c0b11d105a4..850da1b5e6aa 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -602,6 +602,13 @@ bool kvm_arm_aarch32_supported(CPUState *cpu)
     return kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
 }
 
+bool kvm_arm_sve_supported(CPUState *cpu)
+{
+    KVMState *s = KVM_STATE(current_machine->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_SVE);
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
 
 int kvm_arch_init_vcpu(CPUState *cs)
@@ -630,13 +637,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
     if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-            cpu->has_pmu = false;
+        cpu->has_pmu = false;
     }
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
     } else {
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        assert(kvm_arm_sve_supported(cs));
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
@@ -644,6 +655,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
+        if (ret) {
+            return ret;
+        }
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b3106c8600af..1151877f97ea 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -27,6 +27,20 @@
  */
 int kvm_arm_vcpu_init(CPUState *cs);
 
+/**
+ * kvm_arm_vcpu_finalize
+ * @cs: CPUState
+ * @feature: int
+ *
+ * Finalizes the configuration of the specified VCPU feature by
+ * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
+ * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
+ * KVM's API documentation.
+ *
+ * Returns: 0 if success else < 0 error code
+ */
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
+
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
@@ -225,6 +239,14 @@ bool kvm_arm_aarch32_supported(CPUState *cs);
  */
 bool kvm_arm_pmu_supported(CPUState *cs);
 
+/**
+ * bool kvm_arm_sve_supported:
+ * @cs: CPUState
+ *
+ * Returns true if the KVM VCPU can enable SVE and false otherwise.
+ */
+bool kvm_arm_sve_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -275,6 +297,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *cs)
     return false;
 }
 
+static inline bool kvm_arm_sve_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 0190148260dc..3c8ed85b5adb 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -391,6 +391,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature(qts, "max", "sve");
 
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
-- 
2.20.1
