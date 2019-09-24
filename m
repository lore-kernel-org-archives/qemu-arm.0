Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3786716wrp;
        Tue, 24 Sep 2019 04:31:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxxrpk7kNA0XAqNlfMGgVffYiKzgDe5rAakt4LiKuNIRBwXDRXy6IADMgxKFPAeZKgFyrh
X-Received: by 2002:a6b:6117:: with SMTP id v23mr2808407iob.95.1569324699508;
        Tue, 24 Sep 2019 04:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569324699; cv=none;
        d=google.com; s=arc-20160816;
        b=tvvTrXBtKkLUU2Ions4c/Xv3VtbPNHlK6Yqypu9gpaX26q42PArgaArrwEYNJiJkCh
         GrKMrJ3RZSykO+5CM7QKndVIO7Zyhk/sFehUpITJ04KKWJN6Rv0bqiFpnB07tCdm6UPw
         aj0zyHHLd2Fr5ApO/fd4cKhk6ObG/E0ZiHUiamiKTXGKfcb3KiIoAwSXATh3f694wvEF
         HhsYFjUgQC9tpoj8t/OWjeWvii/L5YnBAVUHCCg2uEWMxQ27HvmQ1uIqcTJKvBI2wr+t
         eq0uYEBl+5N81YUixf17WuSNj6Fvup+yPZ3dcbQK0wh/M1OSWMRTXW6Ii4cVbdq3d0Vg
         dXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LCnDu748V7A+Z+fQrrWZcYZ6c9BNroqYhvYX5a/4oaA=;
        b=bEVzFJd0wfUQrSS0m0UCKLEWqruehKF2B59qFEKzt+7I6kaygqa9qme4EjTir67OQH
         0tlSpO47S5Fwj13pdw6YwhevyAlPhfTQTIUT51BTVnb0KF/5knBiEH11Oc2+d6VGUFTx
         WZNnYqXHECIx35qaxb39MUQJ+Ass0x1RCAmfxSQdf6BsypEAk7i0X65hQV2/Ah408tLG
         wnmE3DuZ2k+JBDR5rxaZTfDB1GZ/6Y2hTUoGLgVEOmeMM3mfx+g9w+Wt594Ym2gXUXOa
         rsUetAc0ia/wH5lq0ubrbJjz4kMp9rhbnBGJH06fdinvW+qoV6mghzDNOeBMIOqc4Ozu
         nGMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n7si2008124iom.55.2019.09.24.04.31.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 04:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAF03C054907;
	Tue, 24 Sep 2019 11:31:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A406161F21;
	Tue, 24 Sep 2019 11:31:36 +0000 (UTC)
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
Subject: [PATCH v4 9/9] target/arm/kvm: host cpu: Add support for sve<N> properties
Date: Tue, 24 Sep 2019 13:31:05 +0200
Message-Id: <20190924113105.19076-10-drjones@redhat.com>
In-Reply-To: <20190924113105.19076-1-drjones@redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 24 Sep 2019 11:31:38 +0000 (UTC)
X-TUID: 56zct5xY1k8D

Allow cpu 'host' to enable SVE when it's available, unless the
user chooses to disable it with the added 'sve=off' cpu property.
Also give the user the ability to select vector lengths with the
sve<N> properties. We don't adopt 'max' cpu's other sve property,
sve-max-vq, because that property is difficult to use with KVM.
That property assumes all vector lengths in the range from 1 up
to and including the specified maximum length are supported, but
there may be optional lengths not supported by the host in that
range. With KVM one must be more specific when enabling vector
lengths.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 docs/arm-cpu-features.rst | 19 ++++++++++++-------
 target/arm/cpu.c          |  3 +++
 target/arm/cpu.h          |  2 ++
 target/arm/cpu64.c        | 33 +++++++++++++++++----------------
 target/arm/kvm64.c        | 14 +++++++++++++-
 tests/arm-cpu-features.c  | 21 +++++++++++----------
 6 files changed, 58 insertions(+), 34 deletions(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index 939366f959cf..0c16eef7c8c2 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -256,31 +256,36 @@ SVE CPU Property Examples
 
      $ qemu-system-aarch64 -M virt -cpu max
 
-  3) Only enable the 128-bit vector length::
+  3) When KVM is enabled, implicitly enable all host CPU supported vector
+     lengths with the `host` CPU type::
+
+     $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
+
+  4) Only enable the 128-bit vector length::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve128=on
 
-  4) Disable the 256-bit vector length and all larger vector lengths
+  5) Disable the 256-bit vector length and all larger vector lengths
      since 256 is a power-of-two (this results in only the 128-bit length
      being enabled)::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve256=off
 
-  5) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
+  6) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve128=on,sve256=on,sve512=on
 
-  6) The same as (5), but since the 128-bit and 256-bit vector
+  7) The same as (6), but since the 128-bit and 256-bit vector
      lengths are required for the 512-bit vector length to be enabled,
      then allow them to be auto-enabled::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve512=on
 
-  7) Do the same as (6), but by first disabling SVE and then re-enabling it::
+  8) Do the same as (7), but by first disabling SVE and then re-enabling it::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve=off,sve512=on,sve=on
 
-  8) Force errors regarding the last vector length::
+  9) Force errors regarding the last vector length::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve128=off
      $ qemu-system-aarch64 -M virt -cpu max,sve=off,sve128=off,sve=on
@@ -292,5 +297,5 @@ The examples in "SVE CPU Property Examples" exhibit many ways to select
 vector lengths which developers may find useful in order to avoid overly
 verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
-example's (1), (3), and (5) exhibit recommended uses of the properties.
+example's (1), (4), and (6) exhibit recommended uses of the properties.
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 522fed95b339..7695ae551218 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2671,6 +2671,9 @@ static void arm_host_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+    }
     arm_cpu_post_init(obj);
 }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 11162484465a..5b9c3e4cd73d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -974,11 +974,13 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
+void aarch64_add_sve_properties(Object *obj);
 #else
 static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
+static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 #if !defined(CONFIG_TCG)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 18dd5e24ec61..e7cd420faa9d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -579,6 +579,21 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
     cpu->isar.id_aa64pfr0 = t;
 }
 
+void aarch64_add_sve_properties(Object *obj)
+{
+    uint32_t vq;
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
+
+    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
+        char name[8];
+        sprintf(name, "sve%d", vq * 128);
+        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
+                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
+    }
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -587,17 +602,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq;
-    uint64_t t;
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        if (kvm_arm_sve_supported(CPU(cpu))) {
-            t = cpu->isar.id_aa64pfr0;
-            t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-            cpu->isar.id_aa64pfr0 = t;
-        }
     } else {
+        uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
 
@@ -697,17 +706,9 @@ static void aarch64_max_initfn(Object *obj)
 #endif
     }
 
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
+    aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
-
-    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        char name[8];
-        sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
-    }
 }
 
 struct ARMCPUInfo {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index cff4217a8469..2da366ba113e 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -488,7 +488,9 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      * and then query that CPU for the relevant ID registers.
      */
     int fdarray[3];
+    bool sve_supported;
     uint64_t features = 0;
+    uint64_t t;
     int err;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -578,13 +580,23 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
     }
 
+    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
     if (err < 0) {
         return false;
     }
 
-   /* We can assume any KVM supporting CPU is at least a v8
+    /* Add feature bits that can't appear until after VCPU init. */
+    if (sve_supported) {
+        t = ahcf->isar.id_aa64pfr0;
+        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+        ahcf->isar.id_aa64pfr0 = t;
+    }
+
+    /*
+     * We can assume any KVM supporting CPU is at least a v8
      * with VFPv4+Neon; this in turn implies most of the other
      * feature bits.
      */
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index a0129aebf409..4dc067fb5558 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -351,7 +351,7 @@ static void sve_tests_sve_off_kvm(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-accel kvm -cpu max,sve=off");
+    qts = qtest_init(MACHINE "-accel kvm -cpu host,sve=off");
 
     /*
      * We don't know if this host supports SVE so we don't
@@ -360,8 +360,8 @@ static void sve_tests_sve_off_kvm(const void *data)
      * and that using sve<N>=off to explicitly disable vector
      * lengths is OK too.
      */
-    assert_sve_vls(qts, "max", 0, NULL);
-    assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
+    assert_sve_vls(qts, "host", 0, NULL);
+    assert_sve_vls(qts, "host", 0, "{ 'sve128': false }");
 
     qtest_quit(qts);
 }
@@ -428,8 +428,8 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             "We cannot guarantee the CPU type 'cortex-a15' works "
             "with KVM on this host", NULL);
 
-        assert_has_feature(qts, "max", "sve");
-        resp = do_query_no_props(qts, "max");
+        assert_has_feature(qts, "host", "sve");
+        resp = do_query_no_props(qts, "host");
         kvm_supports_sve = resp_get_feature(resp, "sve");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
@@ -440,7 +440,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             sprintf(max_name, "sve%d", max_vq * 128);
 
             /* Enabling a supported length is of course fine. */
-            assert_sve_vls(qts, "max", vls, "{ %s: true }", max_name);
+            assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
 
             /* Get the next supported length smaller than max-vq. */
             vq = 64 - __builtin_clzll(vls & ~BIT(max_vq - 1));
@@ -449,7 +449,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                  * We have at least one length smaller than max-vq,
                  * so we can disable max-vq.
                  */
-                assert_sve_vls(qts, "max", (vls & ~BIT(max_vq - 1)),
+                assert_sve_vls(qts, "host", (vls & ~BIT(max_vq - 1)),
                                "{ %s: false }", max_name);
 
                 /*
@@ -459,7 +459,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                  */
                 sprintf(name, "sve%d", vq * 128);
                 error = g_strdup_printf("cannot disable %s", name);
-                assert_error(qts, "max", error,
+                assert_error(qts, "host", error,
                              "{ %s: true, %s: false }",
                              max_name, name);
                 g_free(error);
@@ -472,7 +472,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             vq = __builtin_ffsll(vls);
             sprintf(name, "sve%d", vq * 128);
             error = g_strdup_printf("cannot disable %s", name);
-            assert_error(qts, "max", error, "{ %s: false }", name);
+            assert_error(qts, "host", error, "{ %s: false }", name);
             g_free(error);
 
             /* Get an unsupported length. */
@@ -484,13 +484,14 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             if (vq <= SVE_MAX_VQ) {
                 sprintf(name, "sve%d", vq * 128);
                 error = g_strdup_printf("cannot enable %s", name);
-                assert_error(qts, "max", error, "{ %s: true }", name);
+                assert_error(qts, "host", error, "{ %s: true }", name);
                 g_free(error);
             }
         } else {
             g_assert(vls == 0);
         }
     } else {
+        assert_has_not_feature(qts, "host", "sve");
         assert_error(qts, "host",
                      "'pmu' feature not supported by KVM on this host",
                      "{ 'pmu': true }");
-- 
2.20.1
