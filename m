Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp848824wrg;
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkGiUu8BiPVEGzNsgRh6FjGZKSk1kdhDFqL5R4baR1wx4maZhAcZJJCnLTykVaMM6qpNgs
X-Received: by 2002:a05:620a:16a6:: with SMTP id s6mr4930340qkj.39.1561134880867;
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134880; cv=none;
        d=google.com; s=arc-20160816;
        b=pyBwkdK1ktXmmaWb4CYbAzpdLBdrR4gZqk3hrucvbzdu6M9dWxHevYoZGyXYxwlGqF
         m/ewoZeaFrOw0X3orkHroVypcwqYEBY1glk/w2y+ElwiefGGmpP6HwfEWLWLKA76Ssr3
         Pw3WjeoORBFv2FdwIKCNBeNZI8+2OLRAJPAE+7FVr1fpj1UsJ+n2Wfyh8S5mJzzy/OrZ
         UKZFdFXly55YcE8/kW3XoclT1/vxC7cXfYxcYrN2E+m1eO54i64Xjw4AufepSYsm9glI
         B67Fo7Rh2Sf67mDq15qTtaJxFA+LnoJJc9a0udDzcVjk4E/YXS5nKAgKJQkIEHgPbwOi
         iWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ahkLZF7/AkhWmKjUzmDEa7g5et4puEsh2iKfVvuB1JY=;
        b=MhMYvIm2+C6dxlOhACDjgNfgIQcEsm0eJ1Koy3zFWvdSsSUL0Qg9OZ/5wAntKFRhwX
         hEy+EITFP/ZOZRdLPXfNJKlC2Gke2JSrVvbWhQvsroMJP+DRxAN+kKy54mDaHS1JLYe8
         YLXgHmalRDWwLC4915zApZcXVuR7P3D0ZeOOLOpjmbLmVWT6B1G3VQyBjteAETZD0l7d
         +DJ71hKpkuFqsNzVbof3E1BYuSwkyWbNKqCrQKx+fslvHhGnxc53XhlxoD5+KZrAhMud
         QDHiXkzUUZ4xLKb3+V4ei6udJAQBKJJPrcFskFLzx6TTBQxNmZr3VykZY4wqGXST+lRx
         vTZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a7si2347951qva.0.2019.06.21.09.34.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F496C18B2FA;
	Fri, 21 Jun 2019 16:34:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D07041001DF3;
	Fri, 21 Jun 2019 16:34:34 +0000 (UTC)
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
Subject: [PATCH v2 02/14] target/arm/cpu: Ensure we can use the pmu with kvm
Date: Fri, 21 Jun 2019 18:34:10 +0200
Message-Id: <20190621163422.6127-3-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 21 Jun 2019 16:34:38 +0000 (UTC)
X-TUID: DFEWnnAGZ6kp

We first convert the pmu property from a static property to one with
its own accessors. Then we use the set accessor to check if the PMU is
supported when using KVM. Indeed a 32-bit KVM host does not support
the PMU, so this check will catch an attempt to use it at property-set
time.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c     | 30 +++++++++++++++++++++++++-----
 target/arm/kvm.c     |  9 +++++++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 3 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 376db154f008..858f668d226e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -759,10 +759,6 @@ static Property arm_cpu_has_el3_property =
 static Property arm_cpu_cfgend_property =
             DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
 
-/* use property name "pmu" to match other archs and virt tools */
-static Property arm_cpu_has_pmu_property =
-            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
-
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
@@ -785,6 +781,29 @@ static Property arm_cpu_pmsav7_dregion_property =
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
 
+static bool arm_get_pmu(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    return cpu->has_pmu;
+}
+
+static void arm_set_pmu(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (value) {
+        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
+            error_setg(errp, "'pmu' feature not supported by KVM on this host");
+            return;
+        }
+        set_feature(&cpu->env, ARM_FEATURE_PMU);
+    } else {
+        unset_feature(&cpu->env, ARM_FEATURE_PMU);
+    }
+    cpu->has_pmu = value;
+}
+
 static void arm_get_init_svtor(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
@@ -859,7 +878,8 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
+        cpu->has_pmu = true;
+        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu,
                                  &error_abort);
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index fe4f461d4ef6..69c961a4c62c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -162,6 +162,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features = arm_host_cpu_features.features;
 }
 
+bool kvm_arm_pmu_supported(CPUState *cpu)
+{
+    KVMState *s = KVM_STATE(current_machine->accelerator);
+    int ret;
+
+    ret = kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
+    return ret > 0;
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 812125f805a1..e0ded3607996 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -216,6 +216,14 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
  */
 bool kvm_arm_aarch32_supported(CPUState *cs);
 
+/**
+ * bool kvm_arm_pmu_supported:
+ * @cs: CPUState
+ *
+ * Returns true if the KVM VCPU can enable its PMU and false otherwise.
+ */
+bool kvm_arm_pmu_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -261,6 +269,11 @@ static inline bool kvm_arm_aarch32_supported(CPUState *cs)
     return false;
 }
 
+static inline bool kvm_arm_pmu_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
-- 
2.20.1
