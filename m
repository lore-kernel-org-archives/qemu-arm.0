Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2272107wrq;
        Thu, 24 Oct 2019 05:19:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK3Jmoy0s6JjZZKiPtM2jDPpdGeBgM07xNwQc+EWsEw5buvjlAKacIIdIQ6y+PqAXxCwRj
X-Received: by 2002:aa7:d852:: with SMTP id f18mr16537135eds.110.1571919560512;
        Thu, 24 Oct 2019 05:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571919560; cv=none;
        d=google.com; s=arc-20160816;
        b=epiZ3aBtsJDPEAVwQDo/XAcTYXjuoxTMnLSeT+iC50NWtt3/hDYC7bU3PwpdRCPiJC
         5pgZyP62rq6nQLVEuEffwdRX09CrJh/ABMVXImsMkNE+aOpWPJfnMNRzdea13CpUt+d9
         9cb/mOhG7j4kU7RANa0fAM5IzV2v5I8appElikX9P7SB5mIjunuTaJTQKLrj9J011bCw
         dcTv0kKn2MvYII7sH4dj9OLU08TQCKSnBdDNwoX2lcr0Hf/ytKA8w15IPo0vlzmY+DmL
         J0iHsEZRtBaGFCrdwHaR/zVOYH+FTGCCyT1vjZofnwM/MsjQZOAHOY41pZ16Rde9/1ej
         6enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dvKtZiXb1wOgDLs2UmUJZtGwed89qpNJCH0wIB7h53c=;
        b=UGY9zHdfIb8tY2h7RIR6ZaVCSCyHms10rUT8QDWdvTPieaXl+aOIG+saHfnF9pSEoz
         vzv7R5PWXuUFwuL1EA5ElqbOR+ru83SPBuQnCyFama5DyHQ2/d/BmH92iY1y5e1j5ODa
         4fJD1NNfvA+Vqgup0+RFFa9BSFcuqVY8vul5ZKBPKww76hhc2cj2cXw0LQe1iNmJV0+Z
         TLHPo2A2PbojWOwerfjBAOdYlrldQhUqRPp4ydFnGMukdCAtMLqTYVH+51kN1JWbS9Gm
         8QFg51AVsiR1glF7G5Mo/QCtDboDuFVGJsZy2X3uopRGte03+mTiTKI+JVRfs5lfElvB
         HKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SSoxjqdl;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id p5si10733391eja.141.2019.10.24.05.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 05:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SSoxjqdl;
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571919559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvKtZiXb1wOgDLs2UmUJZtGwed89qpNJCH0wIB7h53c=;
	b=SSoxjqdltnOuydP99Asyv7g+FjxYs2/C1aeD7mGoxuoT/cxcwnxF9gPkg2EDZk2f6PahWe
	4HHVXf82n/xlmI9J8TZhWWqv7yBIH8mdebOy6WXFnUetlweDjrqtVChVFAQ+OFbEtniDVN
	7VK5RfAUl6HnL4hpGu2ZsDOq6W762Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-1xpu-PzaOlCGLMKfnLy6fw-1; Thu, 24 Oct 2019 08:19:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56CD51800D6B;
	Thu, 24 Oct 2019 12:19:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F18B60BF3;
	Thu, 24 Oct 2019 12:19:06 +0000 (UTC)
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
Subject: [PATCH v7 9/9] target/arm/kvm: host cpu: Add support for sve<N> properties
Date: Thu, 24 Oct 2019 14:18:08 +0200
Message-Id: <20191024121808.9612-10-drjones@redhat.com>
In-Reply-To: <20191024121808.9612-1-drjones@redhat.com>
References: <20191024121808.9612-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 1xpu-PzaOlCGLMKfnLy6fw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: AwraSpakgxSp

Allow cpu 'host' to enable SVE when it's available, unless the
user chooses to disable it with the added 'sve=3Doff' cpu property.
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
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 docs/arm-cpu-features.rst | 19 ++++++++++++-------
 target/arm/cpu.c          |  3 +++
 target/arm/cpu.h          |  2 ++
 target/arm/cpu64.c        | 33 +++++++++++++++++----------------
 target/arm/kvm64.c        | 14 +++++++++++++-
 tests/arm-cpu-features.c  | 23 +++++++++++------------
 6 files changed, 58 insertions(+), 36 deletions(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index bed218d44619..1b367e22e16e 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -272,31 +272,36 @@ SVE CPU Property Examples
=20
      $ qemu-system-aarch64 -M virt -cpu max
=20
-  3) Only enable the 128-bit vector length::
+  3) When KVM is enabled, implicitly enable all host CPU supported vector
+     lengths with the `host` CPU type::
+
+     $ qemu-system-aarch64 -M virt,accel=3Dkvm -cpu host
+
+  4) Only enable the 128-bit vector length::
=20
      $ qemu-system-aarch64 -M virt -cpu max,sve128=3Don
=20
-  4) Disable the 512-bit vector length and all larger vector lengths,
+  5) Disable the 512-bit vector length and all larger vector lengths,
      since 512 is a power-of-two.  This results in all the smaller,
      uninitialized lengths (128, 256, and 384) defaulting to enabled::
=20
      $ qemu-system-aarch64 -M virt -cpu max,sve512=3Doff
=20
-  5) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
+  6) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
=20
      $ qemu-system-aarch64 -M virt -cpu max,sve128=3Don,sve256=3Don,sve512=
=3Don
=20
-  6) The same as (5), but since the 128-bit and 256-bit vector
+  7) The same as (6), but since the 128-bit and 256-bit vector
      lengths are required for the 512-bit vector length to be enabled,
      then allow them to be auto-enabled::
=20
      $ qemu-system-aarch64 -M virt -cpu max,sve512=3Don
=20
-  7) Do the same as (6), but by first disabling SVE and then re-enabling i=
t::
+  8) Do the same as (7), but by first disabling SVE and then re-enabling i=
t::
=20
      $ qemu-system-aarch64 -M virt -cpu max,sve=3Doff,sve512=3Don,sve=3Don
=20
-  8) Force errors regarding the last vector length::
+  9) Force errors regarding the last vector length::
=20
      $ qemu-system-aarch64 -M virt -cpu max,sve128=3Doff
      $ qemu-system-aarch64 -M virt -cpu max,sve=3Doff,sve128=3Doff,sve=3Do=
n
@@ -308,5 +313,5 @@ The examples in "SVE CPU Property Examples" exhibit man=
y ways to select
 vector lengths which developers may find useful in order to avoid overly
 verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
-example's (1), (3), and (5) exhibit recommended uses of the properties.
+example's (1), (4), and (6) exhibit recommended uses of the properties.
=20
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 48c18871f6ea..0c4465880ddd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2669,6 +2669,9 @@ static void arm_host_initfn(Object *obj)
     ARMCPU *cpu =3D ARM_CPU(obj);
=20
     kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+    }
     arm_cpu_post_init(obj);
 }
=20
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 11162484465a..5b9c3e4cd73d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -974,11 +974,13 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uin=
t8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
+void aarch64_add_sve_properties(Object *obj);
 #else
 static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { =
}
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
+static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
=20
 #if !defined(CONFIG_TCG)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c161a146ff0d..68baf0482ffa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -594,6 +594,21 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, c=
onst char *name,
     cpu->isar.id_aa64pfr0 =3D t;
 }
=20
+void aarch64_add_sve_properties(Object *obj)
+{
+    uint32_t vq;
+
+    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
+
+    for (vq =3D 1; vq <=3D ARM_MAX_VQ; ++vq) {
+        char name[8];
+        sprintf(name, "sve%d", vq * 128);
+        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
+                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
+    }
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this ho=
st);
  * otherwise, a CPU with as many features enabled as our emulation support=
s.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -602,17 +617,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, =
const char *name,
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
-    uint32_t vq;
-    uint64_t t;
=20
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        if (kvm_arm_sve_supported(CPU(cpu))) {
-            t =3D cpu->isar.id_aa64pfr0;
-            t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-            cpu->isar.id_aa64pfr0 =3D t;
-        }
     } else {
+        uint64_t t;
         uint32_t u;
         aarch64_a57_initfn(obj);
=20
@@ -712,17 +721,9 @@ static void aarch64_max_initfn(Object *obj)
 #endif
     }
=20
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
+    aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_v=
q,
                         cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
-
-    for (vq =3D 1; vq <=3D ARM_MAX_VQ; ++vq) {
-        char name[8];
-        sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
-    }
 }
=20
 struct ARMCPUInfo {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index c93bbee425ae..876184b8fe4d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -488,7 +488,9 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *=
ahcf)
      * and then query that CPU for the relevant ID registers.
      */
     int fdarray[3];
+    bool sve_supported;
     uint64_t features =3D 0;
+    uint64_t t;
     int err;
=20
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -578,13 +580,23 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
     }
=20
+    sve_supported =3D ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_S=
VE) > 0;
+
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
=20
     if (err < 0) {
         return false;
     }
=20
-   /* We can assume any KVM supporting CPU is at least a v8
+    /* Add feature bits that can't appear until after VCPU init. */
+    if (sve_supported) {
+        t =3D ahcf->isar.id_aa64pfr0;
+        t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+        ahcf->isar.id_aa64pfr0 =3D t;
+    }
+
+    /*
+     * We can assume any KVM supporting CPU is at least a v8
      * with VFPv4+Neon; this in turn implies most of the other
      * feature bits.
      */
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 597c1cd78db2..6b8c48de8aa8 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -356,7 +356,7 @@ static void sve_tests_sve_off_kvm(const void *data)
 {
     QTestState *qts;
=20
-    qts =3D qtest_init(MACHINE "-accel kvm -cpu max,sve=3Doff");
+    qts =3D qtest_init(MACHINE "-accel kvm -cpu host,sve=3Doff");
=20
     /*
      * We don't know if this host supports SVE so we don't
@@ -365,8 +365,8 @@ static void sve_tests_sve_off_kvm(const void *data)
      * and that using sve<N>=3Doff to explicitly disable vector
      * lengths is OK too.
      */
-    assert_sve_vls(qts, "max", 0, NULL);
-    assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
+    assert_sve_vls(qts, "host", 0, NULL);
+    assert_sve_vls(qts, "host", 0, "{ 'sve128': false }");
=20
     qtest_quit(qts);
 }
@@ -432,8 +432,8 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
             "We cannot guarantee the CPU type 'cortex-a15' works "
             "with KVM on this host", NULL);
=20
-        assert_has_feature(qts, "max", "sve");
-        resp =3D do_query_no_props(qts, "max");
+        assert_has_feature(qts, "host", "sve");
+        resp =3D do_query_no_props(qts, "host");
         kvm_supports_sve =3D resp_get_feature(resp, "sve");
         vls =3D resp_get_sve_vls(resp);
         qobject_unref(resp);
@@ -444,7 +444,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
             sprintf(max_name, "sve%d", max_vq * 128);
=20
             /* Enabling a supported length is of course fine. */
-            assert_sve_vls(qts, "max", vls, "{ %s: true }", max_name);
+            assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
=20
             /* Get the next supported length smaller than max-vq. */
             vq =3D 64 - __builtin_clzll(vls & ~BIT_ULL(max_vq - 1));
@@ -453,7 +453,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
                  * We have at least one length smaller than max-vq,
                  * so we can disable max-vq.
                  */
-                assert_sve_vls(qts, "max", (vls & ~BIT_ULL(max_vq - 1)),
+                assert_sve_vls(qts, "host", (vls & ~BIT_ULL(max_vq - 1)),
                                "{ %s: false }", max_name);
=20
                 /*
@@ -463,7 +463,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
                  */
                 sprintf(name, "sve%d", vq * 128);
                 error =3D g_strdup_printf("cannot disable %s", name);
-                assert_error(qts, "max", error,
+                assert_error(qts, "host", error,
                              "{ %s: true, %s: false }",
                              max_name, name);
                 g_free(error);
@@ -476,7 +476,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
             vq =3D __builtin_ffsll(vls);
             sprintf(name, "sve%d", vq * 128);
             error =3D g_strdup_printf("cannot disable %s", name);
-            assert_error(qts, "max", error, "{ %s: false }", name);
+            assert_error(qts, "host", error, "{ %s: false }", name);
             g_free(error);
=20
             /* Get an unsupported length. */
@@ -488,7 +488,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
             if (vq <=3D SVE_MAX_VQ) {
                 sprintf(name, "sve%d", vq * 128);
                 error =3D g_strdup_printf("cannot enable %s", name);
-                assert_error(qts, "max", error, "{ %s: true }", name);
+                assert_error(qts, "host", error, "{ %s: true }", name);
                 g_free(error);
             }
         } else {
@@ -497,8 +497,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
     } else {
         assert_has_not_feature(qts, "host", "aarch64");
         assert_has_not_feature(qts, "host", "pmu");
-
-        assert_has_not_feature(qts, "max", "sve");
+        assert_has_not_feature(qts, "host", "sve");
     }
=20
     qtest_quit(qts);
--=20
2.21.0
