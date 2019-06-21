Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp849650wrg;
        Fri, 21 Jun 2019 09:35:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJsP6lJp94mZ4Tq6hPQvUcUYZUwbMyoPQq5Qery0r3q0oqUbdx6djzDDn2eunKARLstGSH
X-Received: by 2002:a37:a095:: with SMTP id j143mr6683385qke.449.1561134935113;
        Fri, 21 Jun 2019 09:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134935; cv=none;
        d=google.com; s=arc-20160816;
        b=sbU8iZYliOY0vd6a87DvrZ9XPpv0OL/O2RPxn9UePvdt2i9S2EpLF+V8/A+07Exk6e
         /NjprvSHHN//cecxDo0OUfkd/iP7hloDfkLv6cSV+DPOazu9+aSbilDxS1j73Ipue5Or
         Rp187kHJ3huoB+eW1JnhgHTuAnnkgnxl3p0MQ6fngIRVtKsclgu0UyInW8aTg8yxZ7rY
         S+Dqvzzglw0cl1Ab0WgHtiI6KOFAfH1vrgd27bG21PODwL3LpzwOVYalYqA/3WyDvLmN
         /uVE5++wvoNYK4wAiyodUf/u7ZHUGr4qhEbx6GXOxqVGxCVOInMw9UGRBwj51jH+o4vt
         C+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PVNumoTb+reb+VBrYjhZ9HsIfU57dbN6YJWp9HvS8uU=;
        b=IWPjrWtt73bQLFclUdHLhzA1k950N+aiLUIU8Fh1ejLCqksOcpoaYUqC8F+aEG9XiS
         lXWDNraDsILBNQYfuXJGO6yilzupusNAvPuwILw6nJa68wulKMDqn1LgawnoPn03p7Jd
         3oOH2apOIWGe6QvK7uB0Dd2LRRS99MOd72LasKIwapu4N4MXN9YYp/pY+HVDnw+U3PC3
         tmSxWFO6ITAB2xxb0ATMhuIwaHzN7Rl3shYajxxXa9oatwv/o8RjZTJLF3V+SEn6uIe5
         atl7qXnYvpGvg2mbP2Yl//Jq+PrB19IWL0r5SSo+a4dace5LatOs9wS2sNfuRyY6EYVV
         vbxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g13si2129484qtc.334.2019.06.21.09.35.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2120FC18B2C4;
	Fri, 21 Jun 2019 16:35:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 979FE1001B1D;
	Fri, 21 Jun 2019 16:35:28 +0000 (UTC)
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
Subject: [PATCH v2 14/14] target/arm/kvm: host cpu: Add support for sve<vl-bits> properties
Date: Fri, 21 Jun 2019 18:34:22 +0200
Message-Id: <20190621163422.6127-15-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 21 Jun 2019 16:35:34 +0000 (UTC)
X-TUID: C8tCo68E7NwS

Allow cpu 'host' to enable SVE when it's available, unless the
user chooses to disable it with the added 'sve=off' cpu property.
Also give the user the ability to select vector lengths with the
sve<vl-bits> properties. We don't adopt 'max' cpu's other sve
property, sve-max-vq, because that property is difficult to
use with KVM. That property assumes all vector lengths in the
range from 1 up to and including the specified maximum length are
supported, but there may be optional lengths not supported by the
host in that range. With KVM one must be more specific when
enabling vector lengths.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c         |  1 +
 target/arm/cpu.h         |  2 ++
 target/arm/cpu64.c       | 47 ++++++++++++++++++++++++++--------------
 tests/arm-cpu-features.c | 21 +++++++++---------
 4 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e060a0d9df0e..9d05291cb5f6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2407,6 +2407,7 @@ static void arm_host_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     kvm_arm_set_cpu_features_from_host(cpu);
+    aarch64_add_sve_properties(obj);
     arm_cpu_post_init(obj);
 }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8a1c6c66a462..52a6b219b74a 100644
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
 
 target_ulong do_arm_semihosting(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6e92aa54b9c8..89396a7729ec 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -753,6 +753,36 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
     }
 }
 
+void aarch64_add_sve_properties(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t vq;
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
+
+    /*
+     * sve_max_vq is initially unspecified, but must be initialized to a
+     * non-zero value (ARM_SVE_INIT) to indicate that this cpu type has
+     * SVE. It will be finalized in arm_cpu_realizefn().
+     */
+    assert(!cpu->sve_max_vq || cpu->sve_max_vq == ARM_SVE_INIT);
+    cpu->sve_max_vq = ARM_SVE_INIT;
+
+    /*
+     * sve_vq_map uses a special state while setting properties, so
+     * we initialize it here with its init function and finalize it
+     * in arm_cpu_realizefn().
+     */
+    arm_cpu_vq_map_init(cpu);
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
@@ -761,7 +791,6 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t vq;
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
@@ -847,9 +876,6 @@ static void aarch64_max_initfn(Object *obj)
 #endif
     }
 
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
-
     /*
      * sve_max_vq is initially unspecified, but must be initialized to a
      * non-zero value (ARM_SVE_INIT) to indicate that this cpu type has
@@ -859,18 +885,7 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
 
-    /*
-     * sve_vq_map uses a special state while setting properties, so
-     * we initialize it here with its init function and finalize it
-     * in arm_cpu_realizefn().
-     */
-    arm_cpu_vq_map_init(cpu);
-    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
-        char name[8];
-        sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
-    }
+    aarch64_add_sve_properties(obj);
 }
 
 struct ARMCPUInfo {
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 349bd0dca6d1..dfe83f104b27 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -351,8 +351,8 @@ static void sve_tests_sve_off_kvm(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-accel kvm -cpu max,sve=off");
-    sve_tests_off(qts, "max");
+    qts = qtest_init(MACHINE "-accel kvm -cpu host,sve=off");
+    sve_tests_off(qts, "host");
     qtest_quit(qts);
 }
 
@@ -417,24 +417,24 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             "The CPU definition 'cortex-a15' cannot "
             "be used with KVM on this host", NULL);
 
-        assert_has_feature(qts, "max", "sve");
-        resp = do_query_no_props(qts, "max");
+        assert_has_feature(qts, "host", "sve");
+        resp = do_query_no_props(qts, "host");
         g_assert(resp);
         kvm_supports_sve = qdict_get_bool(resp_get_props(resp), "sve");
         qobject_unref(resp);
 
         if (kvm_supports_sve) {
-            resp = do_query_no_props(qts, "max");
+            resp = do_query_no_props(qts, "host");
             resp_get_sve_vls(resp, &vls, &max_vq);
             g_assert(max_vq != 0);
             qobject_unref(resp);
 
             /* Enabling a supported length is of course fine. */
             sprintf(name, "sve%d", max_vq * 128);
-            assert_sve_vls(qts, "max", vls, "{ %s: true }", name);
+            assert_sve_vls(qts, "host", vls, "{ %s: true }", name);
 
             /* Also disabling the largest lengths is fine. */
-            assert_sve_vls(qts, "max", (vls & ~BIT(max_vq - 1)),
+            assert_sve_vls(qts, "host", (vls & ~BIT(max_vq - 1)),
                            "{ %s: false }", name);
 
             for (vq = 1; vq <= max_vq; ++vq) {
@@ -446,7 +446,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             if (vq <= SVE_MAX_VQ) {
                 sprintf(name, "sve%d", vq * 128);
                 error = g_strdup_printf("cannot enable %s", name);
-                assert_error(qts, "max", error, "{ %s: true }", name);
+                assert_error(qts, "host", error, "{ %s: true }", name);
                 g_free(error);
             }
 
@@ -455,16 +455,17 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
                 vq = 64 - __builtin_clzll(vls & ~BIT(max_vq - 1));
                 sprintf(name, "sve%d", vq * 128);
                 error = g_strdup_printf("cannot disable %s", name);
-                assert_error(qts, "max", error, "{ %s: false }", name);
+                assert_error(qts, "host", error, "{ %s: false }", name);
                 g_free(error);
             }
         } else {
-            resp = do_query_no_props(qts, "max");
+            resp = do_query_no_props(qts, "host");
             resp_get_sve_vls(resp, &vls, &max_vq);
             g_assert(max_vq == 0);
             qobject_unref(resp);
         }
     } else {
+        assert_has_not_feature(qts, "host", "sve");
         assert_error(qts, "host",
                      "'pmu' feature not supported by KVM on this host",
                      "{ 'pmu': true }");
-- 
2.20.1
