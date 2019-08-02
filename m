Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782276wrv;
        Fri, 2 Aug 2019 05:26:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXzJ1oVayTYdZYBZI7NQqRouu1mAWG9kCnVV76LL7HthTUEK0sTRqivNQY8NmBi7m10qre
X-Received: by 2002:a37:ac19:: with SMTP id e25mr90085055qkm.155.1564748780593;
        Fri, 02 Aug 2019 05:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748780; cv=none;
        d=google.com; s=arc-20160816;
        b=rDJ/+RS2falcEX4H7uQnVQKUIpVuUB79Et8o5+5FYAKA9sidL5eRbvVnjJElhvdh66
         HNgsfbINxe8N/FI+0rvSYUJqRUSr4Wvr0s5TKPZig30SLaD4/myj+qsDCcE4yZlcUx3t
         YdYuykeFXNa/0++YZzwBQzzJM0W+mDYlkWDuu/EL51psh7ZbBAXO2MjDhHhGm4vdMQu2
         lIYHa9ggpwDhSn8CMacrpFgy9L4bALVyDFu3OsYqF9Mxj07ACgnHu4fldX/EGI+ajQmu
         iBKzqPxxvbKRK8PsCIu0pNkhJBLzH5TKMVnJFxaALhALWUaRjm8LY3Sm32UYhl+PRKTz
         dpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=CQXUlYw53DPHXHtOQAGkwiNFnIyDbqFFqtFp1kYqgyY=;
        b=NpSKj7dyA+RbWuge/7241G3zMqrZ6UFyfDPgfD4XuPrg75a3zDnQauOPYD2VxYepJz
         K5DjPnb2uaP5VDFaiPhEt8gHDrFV4OJ+WyBY8IGFY9Jg8Je5RDRS10NThm/R708cN0er
         lnw+qN1HM3RQEOE38cLhB/v/iMs6Tje5Dzg9mMvCQzcqTnLG6vRCongeJ2o2Y4fAWjT5
         IYfjzTZkzBGoDU5tcbPmOWlxvuHItznQrzo3UKvYFXGvAjNXR/gTVNr6zhGaw0K5i1/W
         Bl+ndJo9dRiNCMDFQQu9S2jBhIp+fhOWtHqV0U6kXIdq09Otdp/keWhR8VoNDfc5Mgjl
         RtPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s22si45916155qvs.40.2019.08.02.05.26.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A56F882F2;
	Fri,  2 Aug 2019 12:26:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 453BC5C205;
	Fri,  2 Aug 2019 12:26:17 +0000 (UTC)
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
Subject: [PATCH v3 07/15] target/arm: Allow SVE to be disabled via a CPU property
Date: Fri,  2 Aug 2019 14:25:32 +0200
Message-Id: <20190802122540.26385-8-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 02 Aug 2019 12:26:19 +0000 (UTC)
X-TUID: jBiC7NhoO84N

Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
a CPU property") we can disable the 'max' cpu model's VFP and neon
features, but there's no way to disable SVE. Add the 'sve=on|off'
property to give it that flexibility. We also rename
cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
to follow the typical *_get/set_<property-name> pattern.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c         |  3 ++-
 target/arm/cpu64.c       | 42 ++++++++++++++++++++++++++++++++++------
 target/arm/monitor.c     |  2 +-
 tests/arm-cpu-features.c |  1 +
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8b86ce478fc0..930f4579ccae 100644
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
index 946994838d8a..e470c34f89ac 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -257,15 +257,15 @@ static void aarch64_a72_initfn(Object *obj)
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
@@ -280,6 +280,34 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
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
@@ -373,8 +401,10 @@ static void aarch64_max_initfn(Object *obj)
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
index 96ada22d9cc7..36a86cb83ce5 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -91,7 +91,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 }
 
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
