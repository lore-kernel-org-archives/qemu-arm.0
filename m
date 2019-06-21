Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp849546wrg;
        Fri, 21 Jun 2019 09:35:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqv4nNiq9u6fBDp2PHXNF9UzbFv5Mehn/a5M4WTeeny2Ck281qlvcjon0GizkLVSv4povx
X-Received: by 2002:a37:9e93:: with SMTP id h141mr90370782qke.142.1561134928667;
        Fri, 21 Jun 2019 09:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134928; cv=none;
        d=google.com; s=arc-20160816;
        b=OdwUhsfaEDkATrLVDDwzJ2qsUx2sjtUmsLnoZL4qtzjCpzE3CdZhA/vQNB319ItAcl
         HW71Fj5c2sKqhmaDNyl60Dzc1O4IMoDfotmPCssknc9U4Rs+MxK1RzXqBBNSIO3/T7ce
         pGrBUdOWbFDDW/e1+V3TCdlsCyQh0Q5hLO51RA51uEpUrnsKaHZLRu+LNvgb8Si6Ljna
         Z1vvUnP71tRXu7Tytw+HeHW4z0Mgr/oZ/BztqnhONICHYqgUCrbiPDt/erXZ990fI7tR
         vnY5ZQzF27D7BuDDnEMk/hzkC6mG5dZKyX5rTPP8AQIXA9fJSeX4j/RkFppQR25y6kzp
         d/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=azEuKNwOGZOR7xdGh5pmP2t4xlE6jcbY7DiWNeb0hkA=;
        b=M1WIZN5mHYCr3Dn+qjrv/hZmF9KzxHipF8xsm/umR8/VBSlbzzqAKxNg7jd2jPCX43
         tk+QsrKaj6EFPuYQjNkkDU7mtC7+qOqPhaTuZgOOLiukRHqW0foGDndq6iB41dhd3FmM
         xojvM3jkgV9xDFnApaWY+Qli5I9+7sPsOUMQAdU4MTIAfWGltlBGR9WGkJcuq+1dUB8f
         LWjW8Pp96jL3Pdvx6SGdRby/CVgKRA2vWtFHYWGcBN2KCY3Lw7XZDTaZeyiP4TFcx3qw
         VRgJ6jK0B6H2k/YKZrm03E4uWMrK9NhpFWtM9ROdHRg9E4+BoRctdMdl/SXEOn8MjQS1
         nrDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n55si2093768qtk.397.2019.06.21.09.35.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A79327F746;
	Fri, 21 Jun 2019 16:35:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 785791001DD9;
	Fri, 21 Jun 2019 16:35:18 +0000 (UTC)
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
Subject: [PATCH v2 11/14] target/arm/kvm64: max cpu: Enable SVE when available
Date: Fri, 21 Jun 2019 18:34:19 +0200
Message-Id: <20190621163422.6127-12-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 21 Jun 2019 16:35:22 +0000 (UTC)
X-TUID: TTQc+eE/ZIrR

Enable SVE in the KVM guest when the 'max' cpu type is configured
and KVM supports it. KVM SVE requires use of the new finalize
vcpu ioctl, so we add that now too. For starters SVE can only be
turned on or off, getting all vector lengths the host CPU supports
when on. We'll add the other SVE CPU properties in later patches.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c       | 24 ++++++++++++++++++++++--
 target/arm/kvm.c         |  5 +++++
 target/arm/kvm64.c       | 25 ++++++++++++++++++++++++-
 target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
 tests/arm-cpu-features.c |  1 +
 5 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5def82111dee..2e595ad53137 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -371,6 +371,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
         return;
     }
 
+    /* sve-max-vq and sve<vl-bits> properties not yet implemented for KVM */
+    if (kvm_enabled()) {
+        return;
+    }
+
     if (cpu->sve_max_vq == ARM_SVE_INIT) {
         object_property_set_uint(OBJECT(cpu), ARM_MAX_VQ, "sve-max-vq", &err);
         if (err) {
@@ -632,6 +637,10 @@ static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
     ARMCPU *cpu = ARM_CPU(obj);
     bool value = !!cpu->sve_max_vq;
 
+    if (kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+        value = false;
+    }
+
     visit_type_bool(v, name, &value, errp);
 }
 
@@ -649,6 +658,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
     }
 
     if (value) {
+        if (kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+            error_setg(errp, "'sve' feature not supported by KVM on this host");
+            return;
+        }
+
         /*
          * We handle the -cpu <cpu>,sve=off,sve=on case by reinitializing,
          * but otherwise we don't do anything as an sve=on could come after
@@ -675,6 +689,11 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        /*
+         * KVM doesn't yet support the sve-max-vq property, but
+         * setting cpu->sve_max_vq is also used to turn SVE on.
+         */
+        cpu->sve_max_vq = ARM_SVE_INIT;
     } else {
         uint64_t t;
         uint32_t u;
@@ -764,8 +783,6 @@ static void aarch64_max_initfn(Object *obj)
         cpu->sve_max_vq = ARM_SVE_INIT;
         object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                             cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
-        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
 
         /*
          * sve_vq_map uses a special state while setting properties, so
@@ -780,6 +797,9 @@ static void aarch64_max_initfn(Object *obj)
                                 cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
         }
     }
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
 }
 
 struct ARMCPUInfo {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 69c961a4c62c..60645a196d3d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -49,6 +49,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
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
index 706541327491..9fc7f078cf68 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -604,6 +604,15 @@ bool kvm_arm_aarch32_supported(CPUState *cpu)
     return ret > 0;
 }
 
+bool kvm_arm_sve_supported(CPUState *cpu)
+{
+    KVMState *s = KVM_STATE(current_machine->accelerator);
+    int ret;
+
+    ret = kvm_check_extension(s, KVM_CAP_ARM_SVE);
+    return ret > 0;
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
 
 int kvm_arch_init_vcpu(CPUState *cs)
@@ -632,13 +641,20 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
+    if (cpu->sve_max_vq) {
+        if (!kvm_arm_sve_supported(cs)) {
+            cpu->sve_max_vq = 0;
+        } else {
+            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
+        }
+    }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
@@ -646,6 +662,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
 
+    if (cpu->sve_max_vq) {
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
index e0ded3607996..2367f8ab78ed 100644
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
@@ -224,6 +238,14 @@ bool kvm_arm_aarch32_supported(CPUState *cs);
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
@@ -274,6 +296,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *cs)
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
index a4bf6aec00df..67ad5f2b78d5 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -393,6 +393,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature(qts, "max", "sve");
 
         assert_error(qts, "cortex-a15",
             "The CPU definition 'cortex-a15' cannot "
-- 
2.20.1
