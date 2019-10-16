Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6858081wrm;
        Wed, 16 Oct 2019 01:54:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMvlLEF9ui0d1s6sBV0yMBiogdORXLJTiDokroMwKxnheXYxg9XE2AlXaxSMNVY+UhJfrF
X-Received: by 2002:a02:ac0f:: with SMTP id a15mr46937416jao.86.1571216064662;
        Wed, 16 Oct 2019 01:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571216064; cv=none;
        d=google.com; s=arc-20160816;
        b=mYVVijgaHUxWVS0HT/4r0kcZzqoZ8/iXwrnjkgWlUM74aF/WhtRtTrYM7Nbgd+LrNe
         J0YR0Dz9DoDdr0S7I/D2AchLPzX8g6b218RhjzYa5MAuPnfK24rrhj1MLGBDWASnoB/D
         sHJqKXhQ97zHQQO0Hvk9HTWi7D6luXVfJBkYxw+xKzaxBEc3V1GHZ2Idps/CZQ69LPDD
         nGjW46yVV9V9ra/pvTbJDQIL4hJWeesKggIm1nA8LRgHsznCpAfzW6NLslVlYakieCpr
         SPWXjImSklPX4QLTfUi0P/Hq5K3YFGzGCa+gpfxBt57uhZ+EGvB8hHMyz38hE2hj1Wa7
         NyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=D/NS8wYzYGKTbD0layV653Y60UbJvqIspxq9Wm7qXVc=;
        b=MiKpkHoEk6nKObVB+EWkhJAWenyiaJKSpxx4TnjRkkrN+NMim0P6DA9tswIcVeJgXg
         m3EjOWO1Xo0w8jXL9CVLqijotreelNYjdChUQqVOQcxjJ4nJB8x/DrEXvrZT8jui3ZUD
         N9eS/Tj492rI144XaXgHAQl3OaQCa6YLhVfxCvwKgj4+LLFoLgWGNWfu96WAO3AWN4S7
         LABAISqZ4Zpd5RdfroE1cEauaHbQ1w3J9TMzrWFIMgKzu2BkCqJUxUgiTV6Pt9+o23jl
         3JYPzDAYVm3dhNgtiGqcjGy9t0XvlNZr/Fp0Y/5STOaOEhDjADFwz96vVVP8KBe+p82d
         MAkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o16si32169816ioo.45.2019.10.16.01.54.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 01:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD96E3079B77;
	Wed, 16 Oct 2019 08:54:23 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4A9C5D9CD;
	Wed, 16 Oct 2019 08:54:21 +0000 (UTC)
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
Subject: [PATCH v6 3/9] target/arm: Allow SVE to be disabled via a CPU property
Date: Wed, 16 Oct 2019 10:54:02 +0200
Message-Id: <20191016085408.24360-4-drjones@redhat.com>
In-Reply-To: <20191016085408.24360-1-drjones@redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 16 Oct 2019 08:54:23 +0000 (UTC)
X-TUID: bjAbpbKPUICV

Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
a CPU property") we can disable the 'max' cpu model's VFP and neon
features, but there's no way to disable SVE. Add the 'sve=on|off'
property to give it that flexibility. We also rename
cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
to follow the typical *_get/set_<property-name> pattern.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu.c         |  3 ++-
 target/arm/cpu64.c       | 52 ++++++++++++++++++++++++++++++++++------
 target/arm/monitor.c     |  2 +-
 tests/arm-cpu-features.c |  1 +
 4 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 13813fb21354..2a1e95e90df3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -200,7 +200,8 @@ static void arm_cpu_reset(CPUState *s)
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
         env->cp15.cptr_el[3] |= CPTR_EZ;
         /* with maximum vector length */
-        env->vfp.zcr_el[1] = cpu->sve_max_vq - 1;
+        env->vfp.zcr_el[1] = cpu_isar_feature(aa64_sve, cpu) ?
+                             cpu->sve_max_vq - 1 : 0;
         env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
         env->vfp.zcr_el[3] = env->vfp.zcr_el[1];
         /*
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d7f5bf610a7d..89a8ae77fe84 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -256,15 +256,23 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
-static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
+    uint32_t value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value = 0;
+    } else {
+        value = cpu->sve_max_vq;
+    }
+    visit_type_uint32(v, name, &value, errp);
 }
 
-static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     Error *err = NULL;
@@ -279,6 +287,34 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
     error_propagate(errp, err);
 }
 
+static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    bool value = cpu_isar_feature(aa64_sve, cpu);
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    Error *err = NULL;
+    bool value;
+    uint64_t t;
+
+    visit_type_bool(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
+    cpu->isar.id_aa64pfr0 = t;
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -391,8 +427,10 @@ static void aarch64_max_initfn(Object *obj)
 #endif
 
         cpu->sve_max_vq = ARM_MAX_VQ;
-        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
-                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
+        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
+                            cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
+        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
     }
 }
 
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 560970de7f5c..2209b27b9a08 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -97,7 +97,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
  * then the order that considers those dependencies must be used.
  */
 static const char *cpu_model_advertised_features[] = {
-    "aarch64", "pmu",
+    "aarch64", "pmu", "sve",
     NULL
 };
 
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 198ff6d6b495..202bc0e3e823 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -179,6 +179,7 @@ static void test_query_cpu_model_expansion(const void *data)
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "max", "aarch64");
+        assert_has_feature(qts, "max", "sve");
         assert_has_feature(qts, "cortex-a57", "pmu");
         assert_has_feature(qts, "cortex-a57", "aarch64");
 
-- 
2.21.0
