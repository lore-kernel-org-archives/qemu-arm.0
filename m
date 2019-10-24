Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2271258wrq;
        Thu, 24 Oct 2019 05:18:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz56Zlw/AjVp+il5cxpMkMzW8iItYzmObU9H2MAf6zANj66VXm34xTrLYNZT/mTXAC0CuL7
X-Received: by 2002:a37:a690:: with SMTP id p138mr13166919qke.274.1571919519259;
        Thu, 24 Oct 2019 05:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571919519; cv=none;
        d=google.com; s=arc-20160816;
        b=TK+HyVJe8jru0/pWENw1hoDZ2FbcyFHqxuWjxFDH807XG00aOyYTJDR5KZAYs89y0u
         rnR836ef/2+w/oTjwjXp8ZnD6Sde81ijoFglTMa9AepolK7mbySxYHmqV+X7KfJ2U0pb
         EE6okRTBgCpxmulYz4FmjCsLITxx3ttKm2j3/UpOfdMzNYDTfkNfnu93XeEimgPcNgCU
         oG6dRVy71s2GbE0y6hcPpMk7AMNVOi74fAFdYSA7B7Ui4y76iY1dKaPYuXXqwk7SmxAc
         rYt9OM/gF4XlKFOd6PxPM5djvZZnPn+qaDq3RbZN8Qfu+Kf6bqju3YvpGkl4hZfBGOwT
         8rEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r001ev/QWo0iXQWWhga9Wzo8hKWyq94EvY8sPz6b0y4=;
        b=oh1ownyNh6cUaqZryTYOPoA9MJQh//OuFsKxTJDGYu8Dmvdjz+DOabJZrgG71qEMAa
         HLJYbTHGwVG3InafeC1+PqoJzLWSJMbM9xDBd0GFA1iuss0g4T17Zmshxsg86qwMmtrf
         6sfVv47P9Auo4UwKkYub38AFfSBYSv5YNWwQ79/peG8S9MWzlu8O9+12NfJDraIvdFJh
         2P7E3t9xf3OZgounVE7Nf31ilztHMzFJLVT+CzdzLZWJwv+dzMQsjV6JTK54mkBfLKPW
         6RgdFSSXEXo8nVgFCJZe7ix4QqFJwGDca7jW7xzFFdf69euUWjkJsTiQePzlLpN66YJo
         RNKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+G4trt3;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id z2si5996244qkj.295.2019.10.24.05.18.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 05:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+G4trt3;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571919518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r001ev/QWo0iXQWWhga9Wzo8hKWyq94EvY8sPz6b0y4=;
	b=X+G4trt3z/nHAUm0qR69lIqfsyLTQeHXrmstfnQLMC8+oeFPznSy1O0Rp8hlM08UINl2KC
	CbIoBCobNTt1D3wDRdboosVeuVHMh/N1ZJOzL9RG4nnyucT71zcHX4oomnnU0TKO/UFWHC
	7ZSJODb/2kcH80qmKWWMFG2jjghJMTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-5vEZNzfWN2ixbaLFtW_yDA-1; Thu, 24 Oct 2019 08:18:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70A6800D49;
	Thu, 24 Oct 2019 12:18:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF88E60BF3;
	Thu, 24 Oct 2019 12:18:30 +0000 (UTC)
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
Subject: [PATCH v7 3/9] target/arm: Allow SVE to be disabled via a CPU property
Date: Thu, 24 Oct 2019 14:18:02 +0200
Message-Id: <20191024121808.9612-4-drjones@redhat.com>
In-Reply-To: <20191024121808.9612-1-drjones@redhat.com>
References: <20191024121808.9612-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 5vEZNzfWN2ixbaLFtW_yDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: BGQ5ro23075X

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
index 13813fb21354..2a1e95e90df3 100644
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
index c59fcf409c89..6342cd2e4ecc 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -179,6 +179,7 @@ static void test_query_cpu_model_expansion(const void *=
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
