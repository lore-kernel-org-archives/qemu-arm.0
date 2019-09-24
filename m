Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3786404wrp;
        Tue, 24 Sep 2019 04:31:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLepwAo5iKiqADnknoHCGY2Z6Hx7psa1rqdCVLMzbVdhCLnbNyvRfiNO69B8vCP8b/NhCc
X-Received: by 2002:a5d:8b02:: with SMTP id k2mr2732297ion.305.1569324682327;
        Tue, 24 Sep 2019 04:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569324682; cv=none;
        d=google.com; s=arc-20160816;
        b=q0fmFVEUbmF4TiWzDOphc24bC7r5l0JfumqiGdE3fZdmOAuqNrHcv9PSAnn0mQxP4J
         MZxwiVn0HnPe7UFeftEXMlxBGYzEoACyocCBWXIBWeOb9F803MCXNje8ni0wb0xwYhQ2
         f85EWRH8t3/Dhte5KcEZype9OPEImhH9hBngoCjGkYKOwgN+0CoklT2JxYd0x8AKxbdR
         WJRh7HzGVM0uXOTcN3VN0uZIx5rlfDrbvQjqYVIB4jO1k+vtAiSrYp9tkWb3q0qiyjQL
         LOuHigbLUr3hbq9FQS21BB223qKc8KfveaVJ6xz8l8GWESEGIbMx1RSXeANiyArkKWcZ
         otCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Sx2xQJiLNpzbgs6KG1HpKX+pJJSkL/LgjprAOeE12CY=;
        b=kN7OhbVQblGbtcFE8AX/AaDtieSXN1heOYg3+ll+PnYBwFQODW171fRYXGlnLBE61N
         SEI52DhBz6ZSR5G7X7Kyw4QNfN8miCBKO/EIZxzH+pyYnNCf58uFXCHQXStxIV1Io/21
         LWHHm0H1TWPIgQGAfqfM/lPKGBWrViBUn/rKAM1jzyoVKZZAou0KNU5/IuzeBf4tVVUM
         ryoQpXYzmeBpSeSpX+jpUNIjWWsLgaOgMVbzc1dxTetJnjOySl6tzRrMBPCTkMQ0WYch
         b/dFkbyMjzlyp+wo40fIJun3yE2GH4VzrqLvdYUa4X2iOCnV6nXaA9SsjiI05ksEAaiP
         C5OA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v8si2486450jao.74.2019.09.24.04.31.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 04:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8156310CC1F7;
	Tue, 24 Sep 2019 11:31:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65C0861F21;
	Tue, 24 Sep 2019 11:31:19 +0000 (UTC)
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
Subject: [PATCH v4 3/9] target/arm: Allow SVE to be disabled via a CPU property
Date: Tue, 24 Sep 2019 13:30:59 +0200
Message-Id: <20190924113105.19076-4-drjones@redhat.com>
In-Reply-To: <20190924113105.19076-1-drjones@redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Tue, 24 Sep 2019 11:31:21 +0000 (UTC)
X-TUID: zbTZr52U8W7Y

Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
a CPU property") we can disable the 'max' cpu model's VFP and neon
features, but there's no way to disable SVE. Add the 'sve=on|off'
property to give it that flexibility. We also rename
cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
to follow the typical *_get/set_<property-name> pattern.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c         |  3 ++-
 target/arm/cpu64.c       | 42 ++++++++++++++++++++++++++++++++++------
 target/arm/monitor.c     |  2 +-
 tests/arm-cpu-features.c |  1 +
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2399c144718d..73be2ebfdd39 100644
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
index d7f5bf610a7d..8cdb0c79fa7a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -256,15 +256,15 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
-static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
 }
 
-static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     Error *err = NULL;
@@ -279,6 +279,34 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
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
@@ -391,8 +419,10 @@ static void aarch64_max_initfn(Object *obj)
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
index edca8aa885f0..4fddb6c252a3 100644
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
2.20.1
