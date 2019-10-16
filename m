Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6858419wrm;
        Wed, 16 Oct 2019 01:54:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqza+fLV+TdBB/ihBr3t2J+st9MYZti+ovih8OeawB79NRmp22d6sIvhcI3FnNbMm9BBrNMJ
X-Received: by 2002:a02:cabb:: with SMTP id e27mr7265179jap.113.1571216089797;
        Wed, 16 Oct 2019 01:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571216089; cv=none;
        d=google.com; s=arc-20160816;
        b=RH8qfDMauPTzl4Vp6xTr9lLE3mGb8wjzUn8b34wYODhCXxswJfO6ijt4/PZUZVxvMN
         AP6+Fz/yMMVMzmf8AV5omhn+Eefqm/xd8vBtYD/VWJg+AbMgcbX7sNyE3CVKlD4jwKo6
         SWZo5jjBNLc9ZTvu4Rkiw4U+zmwo1g89FBGONon+hxvBZWbjo9f5BpKchijzomd6sZEM
         ISi6BZ/Un3IX1/u/jI0nOiGb/IuhUSpl1lzgxBq4qmRWsNTS9tsGBHjfF8c0exzu1LOi
         +HZNypS1pqZRIA5ZUN1NCXKujuhY3Ay7BBYFmQWs9ckvGsrHKeFbZ/lsPYeZ01dSwiOF
         AUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=JgTVyDNa0K7GI3JUablauiQCcrrCGaTYrbmGrBAtroo=;
        b=OiTJW94DXsPpGnJ+R5zFVhr/HPQFMNCMpKLiFVa9kd49LsT8NaMzkQpKZ//vR2iydg
         Va2gaJURfoT61/kndW14Wig9LcgDXpL+EEIAyO7RRQ6dMl0Ahnvj4a2WhHp1JLi89nS+
         /jmTUqIZBH/fvh38LzM6CkNgySh0R7EkWtbVzV/AMmNeUdlIMiWzk2LQtubU9xGDaa1n
         MkOMB3Dqf+iYDkeSUs27SwWn+BpnE1iRghP4+F1yPBCv7rKwPs9p9dC36aIB41gLdxW5
         F3vc0LPRRTbdN8S41FnOXmy6ibnf9uHs2KgSBSFXDrf+M+7adRagg/y+rPA1evcJJqtN
         dB0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w19si10119140ill.24.2019.10.16.01.54.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 01:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED0FB189F446;
	Wed, 16 Oct 2019 08:54:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 965755D9CD;
	Wed, 16 Oct 2019 08:54:38 +0000 (UTC)
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
Subject: [PATCH v6 9/9] target/arm/kvm: host cpu: Add support for sve<N> properties
Date: Wed, 16 Oct 2019 10:54:08 +0200
Message-Id: <20191016085408.24360-10-drjones@redhat.com>
In-Reply-To: <20191016085408.24360-1-drjones@redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Wed, 16 Oct 2019 08:54:49 +0000 (UTC)
X-TUID: nzPYiuGhmXEg

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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/arm-cpu-features.rst | 19 ++++++++++++-------
 target/arm/cpu.c          |  3 +++
 target/arm/cpu.h          |  2 ++
 target/arm/cpu64.c        | 33 +++++++++++++++++----------------
 target/arm/kvm64.c        | 14 +++++++++++++-
 tests/arm-cpu-features.c  | 21 +++++++++++----------
 6 files changed, 58 insertions(+), 34 deletions(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index bed218d44619..1b367e22e16e 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -272,31 +272,36 @@ SVE CPU Property Examples
 
      $ qemu-system-aarch64 -M virt -cpu max
 
-  3) Only enable the 128-bit vector length::
+  3) When KVM is enabled, implicitly enable all host CPU supported vector
+     lengths with the `host` CPU type::
+
+     $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
+
+  4) Only enable the 128-bit vector length::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve128=on
 
-  4) Disable the 512-bit vector length and all larger vector lengths,
+  5) Disable the 512-bit vector length and all larger vector lengths,
      since 512 is a power-of-two.  This results in all the smaller,
      uninitialized lengths (128, 256, and 384) defaulting to enabled::
 
      $ qemu-system-aarch64 -M virt -cpu max,sve512=off
 
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
@@ -308,5 +313,5 @@ The examples in "SVE CPU Property Examples" exhibit many ways to select
 vector lengths which developers may find useful in order to avoid overly
 verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
-example's (1), (3), and (5) exhibit recommended uses of the properties.
+example's (1), (4), and (6) exhibit recommended uses of the properties.
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 48c18871f6ea..0c4465880ddd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2669,6 +2669,9 @@ static void arm_host_initfn(Object *obj)
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
index c161a146ff0d..68baf0482ffa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -594,6 +594,21 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
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
@@ -602,17 +617,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
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
 
@@ -712,17 +721,9 @@ static void aarch64_max_initfn(Object *obj)
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
index c93bbee425ae..876184b8fe4d 100644
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
index 61694e2f8e0c..92668efb8f56 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -356,7 +356,7 @@ static void sve_tests_sve_off_kvm(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-accel kvm -cpu max,sve=off");
+    qts = qtest_init(MACHINE "-accel kvm -cpu host,sve=off");
 
     /*
      * We don't know if this host supports SVE so we don't
@@ -365,8 +365,8 @@ static void sve_tests_sve_off_kvm(const void *data)
      * and that using sve<N>=off to explicitly disable vector
      * lengths is OK too.
      */
-    assert_sve_vls(qts, "max", 0, NULL);
-    assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
+    assert_sve_vls(qts, "host", 0, NULL);
+    assert_sve_vls(qts, "host", 0, "{ 'sve128': false }");
 
     qtest_quit(qts);
 }
@@ -433,8 +433,8 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             "We cannot guarantee the CPU type 'cortex-a15' works "
             "with KVM on this host", NULL);
 
-        assert_has_feature(qts, "max", "sve");
-        resp = do_query_no_props(qts, "max");
+        assert_has_feature(qts, "host", "sve");
+        resp = do_query_no_props(qts, "host");
         kvm_supports_sve = resp_get_feature(resp, "sve");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
@@ -445,7 +445,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             sprintf(max_name, "sve%d", max_vq * 128);
 
             /* Enabling a supported length is of course fine. */
-            assert_sve_vls(qts, "max", vls, "{ %s: true }", max_name);
+            assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
 
             /* Get the next supported length smaller than max-vq. */
             vq = 64 - __builtin_clzll(vls & ~BIT_ULL(max_vq - 1));
@@ -454,7 +454,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                  * We have at least one length smaller than max-vq,
                  * so we can disable max-vq.
                  */
-                assert_sve_vls(qts, "max", (vls & ~BIT_ULL(max_vq - 1)),
+                assert_sve_vls(qts, "host", (vls & ~BIT_ULL(max_vq - 1)),
                                "{ %s: false }", max_name);
 
                 /*
@@ -464,7 +464,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                  */
                 sprintf(name, "sve%d", vq * 128);
                 error = g_strdup_printf("cannot disable %s", name);
-                assert_error(qts, "max", error,
+                assert_error(qts, "host", error,
                              "{ %s: true, %s: false }",
                              max_name, name);
                 g_free(error);
@@ -477,7 +477,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             vq = __builtin_ffsll(vls);
             sprintf(name, "sve%d", vq * 128);
             error = g_strdup_printf("cannot disable %s", name);
-            assert_error(qts, "max", error, "{ %s: false }", name);
+            assert_error(qts, "host", error, "{ %s: false }", name);
             g_free(error);
 
             /* Get an unsupported length. */
@@ -489,13 +489,14 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
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
2.21.0
