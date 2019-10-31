Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1248027wri;
        Thu, 31 Oct 2019 07:33:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxduF+jaGrkHtEEZq40xq4kfCphSSyBlZO3pDETMJHsnS2d+uJgObKPYa+eGzEOcK9umygc
X-Received: by 2002:a17:907:40f4:: with SMTP id no4mr3788117ejb.55.1572532391591;
        Thu, 31 Oct 2019 07:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572532391; cv=none;
        d=google.com; s=arc-20160816;
        b=kQkuBJ8qWfjPQBBgJ2IxXOAb6KPOjGPZ4AcvL6pgAUdrKjV+m/enBBcdH89D0RH8JD
         KKAjJ3B51Y5dV/K678ihoGwq7pZwfhbjSbW8juBGOAo9yfibAIe4jIkEGXcABTmHIiR7
         wLy5eteBGLcVWnTB2lx0LJDf2jtN+cBsNjYLIuSJJvkj5pfRFpOuADQ9gkL00p9M9uxX
         4eEEW6AvCLQPDQXPeE+k0wqZbSdbY4RWMOguoNtnWuigfbeP+9ePSBKEfH7O42kKzENz
         POiZ6Ecv245mMo2tOC2XqSuvCP3tG5DzoW0iGxWuamOdqiyXwVl3CD8V1XDb2AKirTH/
         c4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m+hjtdZK8nXTjayXIeRLDCvtKUrNY8dq/7RaY57DgXI=;
        b=xvGEGt1ha1Uzxuo835NoqIfk0n7rPHnqVFvPOxrOm+6XCHdCb6tAcqeYsYLqJeElPJ
         dITdphV2Vj/gDIrk5w/awYswv883kkks6tCLdJjA+5UTtPar66NC9Ag8R3s+R7PTuyJ7
         t7Uk4FH4tK+YFXlc+UCyDn6aqVs8dT6ohKeE8dUptGlx9Jzcd+yDnkVSDyTfhflcMFHL
         pwaf+6hK31btac42aTLvXpccnNRytUGRb+N8haLawYi14L3zEPHcvnwDQ6P2R4kKYhZ7
         qjmkRQiUmM6K2xCrdgqgdVBInoEjrQGfNRbqUbeKETRjAvDakMnbEYC85NMbN3oDwIrR
         qLwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RmzNnoK9;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id j16si4383089eda.161.2019.10.31.07.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 07:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RmzNnoK9;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572532390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+hjtdZK8nXTjayXIeRLDCvtKUrNY8dq/7RaY57DgXI=;
	b=RmzNnoK9aNmJsaTZqXgMpx/Vz1dqzjfyFIzyI0zQj6Ks9uckHGWyXuCzf/hW2rhEl1avAQ
	05ulGS67GIGO8L7u70gdaAI2vaNBq1HtZ1SDrq01/pynXVZ7KwLYiTJzNRlZQMYm2+Dfk0
	fa29RJmW20zL+7OXq0tOYbT07HUfGLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-3HJ2wRKsN8iCst8Hc7i2WQ-1; Thu, 31 Oct 2019 10:33:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA6931800D55;
	Thu, 31 Oct 2019 14:33:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0034060870;
	Thu, 31 Oct 2019 14:32:15 +0000 (UTC)
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
Subject: [PATCH v8 3/9] target/arm: Allow SVE to be disabled via a CPU property
Date: Thu, 31 Oct 2019 15:27:28 +0100
Message-Id: <20191031142734.8590-4-drjones@redhat.com>
In-Reply-To: <20191031142734.8590-1-drjones@redhat.com>
References: <20191031142734.8590-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 3HJ2wRKsN8iCst8Hc7i2WQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: 7RyYMoxwR5lg

Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
a CPU property") we can disable the 'max' cpu model's VFP and neon
features, but there's no way to disable SVE. Add the 'sve=3Don|off'
property to give it that flexibility. We also rename
cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
to follow the typical *_get/set_<property-name> pattern.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Reviewed-by: Beata Michalska <beata.michalska@linaro.org>
---
 target/arm/cpu.c         |  3 ++-
 target/arm/cpu64.c       | 52 ++++++++++++++++++++++++++++++++++------
 target/arm/monitor.c     |  2 +-
 tests/arm-cpu-features.c |  1 +
 4 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ab3e1a036164..72a27ec4b0e3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -200,7 +200,8 @@ static void arm_cpu_reset(CPUState *s)
         env->cp15.cpacr_el1 =3D deposit64(env->cp15.cpacr_el1, 16, 2, 3);
         env->cp15.cptr_el[3] |=3D CPTR_EZ;
         /* with maximum vector length */
-        env->vfp.zcr_el[1] =3D cpu->sve_max_vq - 1;
+        env->vfp.zcr_el[1] =3D cpu_isar_feature(aa64_sve, cpu) ?
+                             cpu->sve_max_vq - 1 : 0;
         env->vfp.zcr_el[2] =3D env->vfp.zcr_el[1];
         env->vfp.zcr_el[3] =3D env->vfp.zcr_el[1];
         /*
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d7f5bf610a7d..89a8ae77fe84 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -256,15 +256,23 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
=20
-static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *na=
me,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
-    visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
+    uint32_t value;
+
+    /* All vector lengths are disabled when SVE is off. */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        value =3D 0;
+    } else {
+        value =3D cpu->sve_max_vq;
+    }
+    visit_type_uint32(v, name, &value, errp);
 }
=20
-static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *na=
me,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
     Error *err =3D NULL;
@@ -279,6 +287,34 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v=
, const char *name,
     error_propagate(errp, err);
 }
=20
+static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    bool value =3D cpu_isar_feature(aa64_sve, cpu);
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    Error *err =3D NULL;
+    bool value;
+    uint64_t t;
+
+    visit_type_bool(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    t =3D cpu->isar.id_aa64pfr0;
+    t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
+    cpu->isar.id_aa64pfr0 =3D t;
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this ho=
st);
  * otherwise, a CPU with as many features enabled as our emulation support=
s.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -391,8 +427,10 @@ static void aarch64_max_initfn(Object *obj)
 #endif
=20
         cpu->sve_max_vq =3D ARM_MAX_VQ;
-        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_v=
q,
-                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
+        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_m=
ax_vq,
+                            cpu_max_set_sve_max_vq, NULL, NULL, &error_fat=
al);
+        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
     }
 }
=20
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 560970de7f5c..2209b27b9a08 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -97,7 +97,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **err=
p)
  * then the order that considers those dependencies must be used.
  */
 static const char *cpu_model_advertised_features[] =3D {
-    "aarch64", "pmu",
+    "aarch64", "pmu", "sve",
     NULL
 };
=20
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 6ebb03d7ad67..d5e18eb66622 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -197,6 +197,7 @@ static void test_query_cpu_model_expansion(const void *=
data)
=20
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "max", "aarch64");
+        assert_has_feature(qts, "max", "sve");
         assert_has_feature(qts, "cortex-a57", "pmu");
         assert_has_feature(qts, "cortex-a57", "aarch64");
=20
--=20
2.21.0
