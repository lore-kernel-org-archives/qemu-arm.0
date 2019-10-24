Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2271521wrq;
        Thu, 24 Oct 2019 05:18:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8fcorMtHAKryceDSh6GWSU92Khs5B19neuZdchfF9b8f4yFZ32L959WGY0hAOZMeKcNZs
X-Received: by 2002:a25:408f:: with SMTP id n137mr10744472yba.23.1571919531605;
        Thu, 24 Oct 2019 05:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571919531; cv=none;
        d=google.com; s=arc-20160816;
        b=HbvLQK122t8xs7vjHsZoSUxc3pTz5XeP9Jou5h2FBW2EbE05D1z8UApVwL9y8v3zf0
         TvKm/t+nkzYaxwwymX5b20gjOGTrh5HmDz6nwFM/5YDxDYsaoTWzPCSGT9NbO0BSiHq8
         Q/ovgOYYinCzH1FnTmo045ZUsJmf9y8MqMoljL6stOlU8S2KK8hX5xbT/ia6sKKFNoZR
         kPlW2R8q1tFKaWL1M6KfY8EJagCuYGUnYsQzz+tYyiJJ1+sfiLo0fIP/5/dCnyswMzvI
         /xPayW+Erlfb0OG2VYnApggIwsYy9G5NarcObzFbwubkFEGn0jD7MbsqB8pfGXFH21+1
         NhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0q2eLdG4tSE/+xsUHJsEF/xBfS1hzvUal90RKZ0xNtE=;
        b=Bpn8hAlFqpnhN9oQUEKkDb+tIr3nFbnDHUtXBiAKKv88cB2orzy8rtcSHnpgqVJkZE
         uLOeOQ/+bf7dVldDf23oBrrd+fkNOYyl+vD73ZHhQ9Wy87tn15+o2cw8Q418IP04CiHG
         BxrWYRgmEo5adUP9NZ3vvrLK5CiYWrnRJBaEbit9wDKMzwwp0vg+ZplNhsMH+IQnQncF
         J/WN1uVBf2i9STo0L7znfQpFnHtiYT7dVrRNzQcvym2cepMSya7pnXEwJG5CnK8AD3gV
         grbJjeiKbss+1xZV8NXWD8Uik2j3RatZZopiD7ZCyXlqd9cT+WXtVC+TIhSW/LM9L+16
         /B4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUcGWqSx;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id v1si7338836ybp.320.2019.10.24.05.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 05:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUcGWqSx;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571919531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0q2eLdG4tSE/+xsUHJsEF/xBfS1hzvUal90RKZ0xNtE=;
	b=XUcGWqSxudKOSXFpeNP+gP1kucWlOMYb7lUOOhFnfJcqBcs/RAZk9ZHb+aY57KbhGImlHE
	mN9G3WNSQUjnR11RLU60DCKHLZ44E4IU8uycmAikxKE+L6WwukBvu1NwGQJYZXaqA90EL4
	dOOJp3SUnlyFSUsPrgxHfPnRscbrQg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-M8H-TqQeOW-V-eidFrAbPQ-1; Thu, 24 Oct 2019 08:18:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B9AC800D49;
	Thu, 24 Oct 2019 12:18:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A427360BF3;
	Thu, 24 Oct 2019 12:18:43 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	eric.auger@redhat.com,
	beata.michalska@linaro.org,
	m.mizuma@jp.fujitsu.com,
	alex.bennee@linaro.org,
	Dave.Martin@arm.com,
	armbru@redhat.com,
	eblake@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v7 6/9] target/arm/kvm64: max cpu: Enable SVE when available
Date: Thu, 24 Oct 2019 14:18:05 +0200
Message-Id: <20191024121808.9612-7-drjones@redhat.com>
In-Reply-To: <20191024121808.9612-1-drjones@redhat.com>
References: <20191024121808.9612-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: M8H-TqQeOW-V-eidFrAbPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: AgHflLQ+uuCi

Enable SVE in the KVM guest when the 'max' cpu type is configured
and KVM supports it. KVM SVE requires use of the new finalize
vcpu ioctl, so we add that now too. For starters SVE can only be
turned on or off, getting all vector lengths the host CPU supports
when on. We'll add the other SVE CPU properties in later patches.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Reviewed-by: Beata Michalska <beata.michalska@linaro.org>
---
 target/arm/cpu64.c       | 17 ++++++++++++++---
 target/arm/kvm.c         |  5 +++++
 target/arm/kvm64.c       | 20 +++++++++++++++++++-
 target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
 tests/arm-cpu-features.c |  4 ++++
 5 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 34b0ba2cf6f7..a771a28daa56 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -493,6 +493,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, c=
onst char *name,
         return;
     }
=20
+    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
+        error_setg(errp, "'sve' feature not supported by KVM on this host"=
);
+        return;
+    }
+
     t =3D cpu->isar.id_aa64pfr0;
     t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
     cpu->isar.id_aa64pfr0 =3D t;
@@ -507,11 +512,16 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
     uint32_t vq;
+    uint64_t t;
=20
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        if (kvm_arm_sve_supported(CPU(cpu))) {
+            t =3D cpu->isar.id_aa64pfr0;
+            t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+            cpu->isar.id_aa64pfr0 =3D t;
+        }
     } else {
-        uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
=20
@@ -612,8 +622,6 @@ static void aarch64_max_initfn(Object *obj)
=20
         object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_m=
ax_vq,
                             cpu_max_set_sve_max_vq, NULL, NULL, &error_fat=
al);
-        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
=20
         for (vq =3D 1; vq <=3D ARM_MAX_VQ; ++vq) {
             char name[8];
@@ -622,6 +630,9 @@ static void aarch64_max_initfn(Object *obj)
                                 cpu_arm_set_sve_vq, NULL, NULL, &error_fat=
al);
         }
     }
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
 }
=20
 struct ARMCPUInfo {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b473c63edb1c..f07332bbda30 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -51,6 +51,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
     return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
 }
=20
+int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
+{
+    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
+}
+
 void kvm_arm_init_serror_injection(CPUState *cs)
 {
     cap_has_inject_serror_esr =3D kvm_check_extension(cs->kvm_state,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4c0b11d105a4..850da1b5e6aa 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -602,6 +602,13 @@ bool kvm_arm_aarch32_supported(CPUState *cpu)
     return kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
 }
=20
+bool kvm_arm_sve_supported(CPUState *cpu)
+{
+    KVMState *s =3D KVM_STATE(current_machine->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_SVE);
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
=20
 int kvm_arch_init_vcpu(CPUState *cs)
@@ -630,13 +637,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
     if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-            cpu->has_pmu =3D false;
+        cpu->has_pmu =3D false;
     }
     if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_PMU_V3;
     } else {
         unset_feature(&env->features, ARM_FEATURE_PMU);
     }
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        assert(kvm_arm_sve_supported(cs));
+        cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_SVE;
+    }
=20
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret =3D kvm_arm_vcpu_init(cs);
@@ -644,6 +655,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
         return ret;
     }
=20
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret =3D kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
+        if (ret) {
+            return ret;
+        }
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b4e19457a094..7c12f1501a8b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -27,6 +27,20 @@
  */
 int kvm_arm_vcpu_init(CPUState *cs);
=20
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
=20
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
@@ -276,6 +298,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *cs)
     return false;
 }
=20
+static inline bool kvm_arm_sve_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 5eecd38f6c60..3efc168d62a4 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -391,12 +391,16 @@ static void test_query_cpu_model_expansion_kvm(const =
void *data)
         assert_has_feature(qts, "host", "aarch64");
         assert_has_feature(qts, "host", "pmu");
=20
+        assert_has_feature(qts, "max", "sve");
+
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
             "with KVM on this host", NULL);
     } else {
         assert_has_not_feature(qts, "host", "aarch64");
         assert_has_not_feature(qts, "host", "pmu");
+
+        assert_has_not_feature(qts, "max", "sve");
     }
=20
     qtest_quit(qts);
--=20
2.21.0
