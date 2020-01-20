Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp11886lfp;
        Mon, 20 Jan 2020 02:11:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/Pzxd+UaECLx2jn1WMBed2phvjUyAk+Hk2XBcKay0phRhVc3leApQmBz08PoO5V3BGXfJ
X-Received: by 2002:a05:620a:210a:: with SMTP id l10mr49353231qkl.382.1579515089131;
        Mon, 20 Jan 2020 02:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579515089; cv=none;
        d=google.com; s=arc-20160816;
        b=1LRjkm8MVk9YHOUd1GZrcwNnRxfbZeJD/od9kXGHoEWX/xgZFroIrFKwB57kCz8lkV
         hLPnfD53hy+CdKCsEG69fH0RzjbGRaz3c0nqxYXtvqhjVZbZ5dtR1LkO8YPCj//CkKr9
         TEw+M4bkYxXa+1fPZrzI3C/ZeILK7pnNY106XuI5C4bmRtHOxtqiGLyXEg+4k8Ii8Avy
         falnR47KcOu75GCzu1VlULykXX4lE7GAcF1PYi47K4hGFzx7ejgCfaXrrsFfyNq53nKa
         bQ9pfkr/P8ocbJH7dHdD5DgUtiYm7I9rkeO13yMfEh+jlBhxJeBUTkfBBNanarnYPqd4
         hYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FIuyqTwYjniU8Rv/Up3Ucm43QkJkGzsnOMywuHYKg/I=;
        b=kMDtLd+l6WORXhsVU1wgSZXIIAwTNEE3shnP1xUfT4Lg86DVFKIO0sWAV8jO9IBX4X
         7+FSkjxzNakTzSbWrcsyEmORVQkxBIPufevWav/OsLeDvgeYos6ZiTJ0EhlZoR7vBudM
         dHpQeRh2XzjfX7xq5bprfYUaK4/0lRSZvEzLpY2mMUnWRZ1/l/h9OFAELGABXz1u+3c6
         vgkOH/59NM+Adj9W5gLNg9ffGSJDZ1mRJ+pL51V4dnPdej8WGGIubcjAziJzSlk/+qsV
         ZaZKuB8N9RoCSfwfaQVBRH3Qz8t4Jbw7myqe0R3GEsgOPInZ9JPX8mh58tmc5IVf89TN
         BPDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QUb7lSxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si18496479qvo.102.2020.01.20.02.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QUb7lSxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itU1o-0006IX-GC
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itU16-0005XF-Ij
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itU14-00037y-Jm
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37844
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itU14-00037U-Et
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIuyqTwYjniU8Rv/Up3Ucm43QkJkGzsnOMywuHYKg/I=;
 b=QUb7lSxQN/U4cwob0Yvr3x7EHnPNSoHMQQm71QXXsoI42rgw+btq3vO49B3BkaHQHonxLi
 AV2Ws+dpzFRpdNERnjZxowv9dm4et/EUT43kc2LBgRS3u7Hoj5kJvoUByEmb2CHV5sgq5D
 kP3YiltIYiPZExWIz84JO1uSosZQP3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-NO4lindWOHGhJyon4cnzXA-1; Mon, 20 Jan 2020 05:10:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5275E107ACC4;
 Mon, 20 Jan 2020 10:10:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86F8248;
 Mon, 20 Jan 2020 10:10:37 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v3 6/6] target/arm/cpu: Add the kvm-no-adjvtime CPU
 property
Date: Mon, 20 Jan 2020 11:10:23 +0100
Message-Id: <20200120101023.16030-7-drjones@redhat.com>
In-Reply-To: <20200120101023.16030-1-drjones@redhat.com>
References: <20200120101023.16030-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: NO4lindWOHGhJyon4cnzXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KboZVXRtVzNz

kvm-no-adjvtime is a KVM specific CPU property and a first of its
kind. To accommodate it we also add kvm_arm_add_vcpu_properties()
and a KVM specific CPU properties description to the CPU features
document.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 docs/arm-cpu-features.rst      | 37 +++++++++++++++++++++++++++++++++-
 hw/arm/virt.c                  |  8 ++++++++
 include/hw/arm/virt.h          |  1 +
 target/arm/cpu.c               |  2 ++
 target/arm/cpu64.c             |  1 +
 target/arm/kvm.c               | 28 +++++++++++++++++++++++++
 target/arm/kvm_arm.h           | 11 ++++++++++
 target/arm/monitor.c           |  1 +
 tests/qtest/arm-cpu-features.c |  4 ++++
 9 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index 9b537a75e695..dbf3b7cf42c0 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -31,7 +31,9 @@ supporting the feature or only supporting the feature und=
er certain
 configurations.  For example, the `aarch64` CPU feature, which, when
 disabled, enables the optional AArch32 CPU feature, is only supported
 when using the KVM accelerator and when running on a host CPU type that
-supports the feature.
+supports the feature.  While `aarch64` currently only works with KVM,
+it could work with TCG.  CPU features that are specific to KVM are
+prefixed with "kvm-" and are described in "KVM VCPU Features".
=20
 CPU Feature Probing
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -171,6 +173,39 @@ disabling many SVE vector lengths would be quite verbo=
se, the `sve<N>` CPU
 properties have special semantics (see "SVE CPU Property Parsing
 Semantics").
=20
+KVM VCPU Features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+KVM VCPU features are CPU features that are specific to KVM, such as
+paravirt features or features that enable CPU virtualization extensions.
+The features' CPU properties are only available when KVM is enabled and
+are named with the prefix "kvm-".  KVM VCPU features may be probed,
+enabled, and disabled in the same way as other CPU features.  Below is
+the list of KVM VCPU features and their descriptions.
+
+  kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  This
+                           means that by default the virtual time
+                           adjustment is enabled (vtime is *not not*
+                           adjusted).
+
+                           When virtual time adjustment is enabled each
+                           time the VM transitions back to running state
+                           the VCPU's virtual counter is updated to ensure
+                           stopped time is not counted.  This avoids time
+                           jumps surprising guest OSes and applications,
+                           as long as they use the virtual counter for
+                           timekeeping.  However it has the side effect of
+                           the virtual and physical counters diverging.
+                           All timekeeping based on the virtual counter
+                           will appear to lag behind any timekeeping that
+                           does not subtract VM stopped time.  The guest
+                           may resynchronize its virtual counter with
+                           other time sources as needed.
+
+                           Enable kvm-no-adjvtime to disable virtual time
+                           adjustment, also restoring the legacy (pre-5.0)
+                           behavior.
+
 SVE CPU Properties
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27ca26b05e27..08b3c34c345c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1663,6 +1663,11 @@ static void machvirt_init(MachineState *machine)
             }
         }
=20
+        if (vmc->kvm_no_adjvtime &&
+            object_property_find(cpuobj, "kvm-no-adjvtime", NULL)) {
+            object_property_set_bool(cpuobj, true, "kvm-no-adjvtime", NULL=
);
+        }
+
         if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
             object_property_set_bool(cpuobj, false, "pmu", NULL);
         }
@@ -2153,8 +2158,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
=20
 static void virt_machine_4_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc =3D VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_5_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len);
+    vmc->kvm_no_adjvtime =3D true;
 }
 DEFINE_VIRT_MACHINE(4, 2)
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 38f0c33c77c4..71508bf40c34 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -109,6 +109,7 @@ typedef struct {
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
+    bool kvm_no_adjvtime;
 } VirtMachineClass;
=20
 typedef struct {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d62fd5fdc644..c2347f1cd335 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2562,6 +2562,7 @@ static void arm_max_initfn(Object *obj)
=20
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        kvm_arm_add_vcpu_properties(obj);
     } else {
         cortex_a15_initfn(obj);
=20
@@ -2755,6 +2756,7 @@ static void arm_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
     }
+    kvm_arm_add_vcpu_properties(obj);
     arm_cpu_post_init(obj);
 }
=20
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 61fd0ade29a8..2d97bf45e1ec 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -605,6 +605,7 @@ static void aarch64_max_initfn(Object *obj)
=20
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
+        kvm_arm_add_vcpu_properties(obj);
     } else {
         uint64_t t;
         uint32_t u;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 91e38def6b29..418bcedc3e6e 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -17,6 +17,8 @@
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qom/object.h"
+#include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
@@ -179,6 +181,32 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features =3D arm_host_cpu_features.features;
 }
=20
+static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
+{
+    return !ARM_CPU(obj)->kvm_adjvtime;
+}
+
+static void kvm_no_adjvtime_set(Object *obj, bool value, Error **errp)
+{
+    ARM_CPU(obj)->kvm_adjvtime =3D !value;
+}
+
+/* KVM VCPU properties should be prefixed with "kvm-". */
+void kvm_arm_add_vcpu_properties(Object *obj)
+{
+    if (!kvm_enabled()) {
+        return;
+    }
+
+    ARM_CPU(obj)->kvm_adjvtime =3D true;
+    object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
+                             kvm_no_adjvtime_set, &error_abort);
+    object_property_set_description(obj, "kvm-no-adjvtime",
+                                    "Set on to disable the adjustment of "
+                                    "the virtual counter. VM stopped time =
"
+                                    "will be counted.", &error_abort);
+}
+
 bool kvm_arm_pmu_supported(CPUState *cpu)
 {
     KVMState *s =3D KVM_STATE(current_machine->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 01a9a1827851..ae9e075d7545 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -255,6 +255,15 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *=
map);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
=20
+/**
+ * kvm_arm_add_vcpu_properties:
+ * @obj: The CPU object to add the properties to
+ *
+ * Add all KVM specific CPU properties to the CPU object. These
+ * are the CPU properties with "kvm-" prefixed names.
+ */
+void kvm_arm_add_vcpu_properties(Object *obj);
+
 /**
  * kvm_arm_aarch32_supported:
  * @cs: CPUState
@@ -345,6 +354,8 @@ static inline void kvm_arm_set_cpu_features_from_host(A=
RMCPU *cpu)
     cpu->host_cpu_probe_failed =3D true;
 }
=20
+static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
+
 static inline bool kvm_arm_aarch32_supported(CPUState *cs)
 {
     return false;
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index fa054f8a369c..9725dfff16d4 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -103,6 +103,7 @@ static const char *cpu_model_advertised_features[] =3D =
{
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
+    "kvm-no-adjvtime",
     NULL
 };
=20
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.=
c
index a039e3c8d724..469217367661 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -428,6 +428,8 @@ static void test_query_cpu_model_expansion(const void *=
data)
     assert_has_feature_enabled(qts, "cortex-a15", "pmu");
     assert_has_not_feature(qts, "cortex-a15", "aarch64");
=20
+    assert_has_not_feature(qts, "max", "kvm-no-adjvtime");
+
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature_enabled(qts, "max", "aarch64");
         assert_has_feature_enabled(qts, "max", "sve");
@@ -462,6 +464,8 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
         return;
     }
=20
+    assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
+
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
         char max_name[8], name[8];
--=20
2.21.1

