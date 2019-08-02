Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp781929wrv;
        Fri, 2 Aug 2019 05:25:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVh/ZRnYNdqkdX2N7DtzswYbPqY8TygIjyJYlxwhARKNjwd08iK+YFCW6mtKLg+nPUOpR5
X-Received: by 2002:ae9:f303:: with SMTP id p3mr88950211qkg.320.1564748756519;
        Fri, 02 Aug 2019 05:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748756; cv=none;
        d=google.com; s=arc-20160816;
        b=w7WGzU7WuitORdyleVga3ulPf8WMvvpNsKkpXVSCXpRw7OySCBbumJ9mTdYTyx4eVl
         lgEUeS/MkwSgsBHZvP7ACy492tt7GAgplclGqw21VHN0biZ/L16VT5Kh9SwyihryEg7W
         ke9LiUrq0XFgq6mgU6IN/YtGSF+xgSzChEAbA+ELVoArWb4XZwWgSnPjdhaKvg70FYWs
         OeZn8lq2JODBnnHPCJIq1EkjKjCwSIL6I6MgpDP5yTpShsxQNd8elb3rJwznFHWLUXn/
         s0VU/9f1b95i7pa1OSQEgjJAroHCDLowaYw8XhuI91oY9OdXK7GOmdXne4IaKPwxstFX
         vFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Ld+vqNz+lj7vUAgJTSPpkoujFoVqIw/bKvdgGte2xqM=;
        b=E5TVea/tW/wxVvWdffY2XUYEWd27O4M6JZZWEroNnNT/LFgJZ5zH9MlPYDs0cGUi0y
         PdgryONQwH+ovVsjpS/2xmLD0PbADg4vS1E6wNma+Wu5Xnm+UKvGAdh0BEXspBsHt1LW
         kF76Ui/XKlHJvrbyqa6OPKTakMpJBhyoLN+K7tkGzObgY2HNl6vA8PmBoKfrEImcLaQ+
         kM4isA3R4neA9ifwOOwdU1BQ8f69ocKfpE1v0xLABBzqY4KVKQ14EDUAVVPdoCPMMFsY
         ce5IjaABYlA9lhmZMiA5/z+Xbfqq0xgRzDecw8sgPT5ujQMMo3IL47cfSPN2nwGs+X1o
         qJ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p127si25605627qkb.356.2019.08.02.05.25.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D5D330832EA;
	Fri,  2 Aug 2019 12:25:55 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CAFC5C205;
	Fri,  2 Aug 2019 12:25:53 +0000 (UTC)
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
Subject: [PATCH v3 02/15] target/arm/cpu: Ensure we can use the pmu with kvm
Date: Fri,  2 Aug 2019 14:25:27 +0200
Message-Id: <20190802122540.26385-3-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 02 Aug 2019 12:25:55 +0000 (UTC)
X-TUID: r5Xke6yFn3bA

We first convert the pmu property from a static property to one with
its own accessors. Then we use the set accessor to check if the PMU is
supported when using KVM. Indeed a 32-bit KVM host does not support
the PMU, so this check will catch an attempt to use it at property-set
time.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu.c     | 30 +++++++++++++++++++++++++-----
 target/arm/kvm.c     |  7 +++++++
 target/arm/kvm_arm.h | 14 ++++++++++++++
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9eb40ff755f9..8b86ce478fc0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -986,10 +986,6 @@ static Property arm_cpu_has_el3_property =
 static Property arm_cpu_cfgend_property =
             DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
 
-/* use property name "pmu" to match other archs and virt tools */
-static Property arm_cpu_has_pmu_property =
-            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
-
 static Property arm_cpu_has_vfp_property =
             DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
 
@@ -1012,6 +1008,29 @@ static Property arm_cpu_pmsav7_dregion_property =
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
@@ -1086,7 +1105,8 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
+        cpu->has_pmu = true;
+        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu,
                                  &error_abort);
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index fe4f461d4ef6..bfe3d445e196 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -162,6 +162,13 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features = arm_host_cpu_features.features;
 }
 
+bool kvm_arm_pmu_supported(CPUState *cpu)
+{
+    KVMState *s = KVM_STATE(current_machine->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 98af1050a753..b3106c8600af 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -216,6 +216,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
  */
 bool kvm_arm_aarch32_supported(CPUState *cs);
 
+/**
+ * bool kvm_arm_pmu_supported:
+ * @cs: CPUState
+ *
+ * Returns: true if the KVM VCPU can enable its PMU
+ * and false otherwise.
+ */
+bool kvm_arm_pmu_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -261,6 +270,11 @@ static inline bool kvm_arm_aarch32_supported(CPUState *cs)
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
