Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp848823wrg;
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCQB8KFNyqtgRacABMZC1tt25kbPpErx/MeG0atOevfqNbcqgjC4usxoPT2Aq1Wf/sduGj
X-Received: by 2002:ac8:2535:: with SMTP id 50mr78966609qtm.373.1561134880866;
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134880; cv=none;
        d=google.com; s=arc-20160816;
        b=w2OEpG/038aU//bk4dSj5k1qmrEUBbZzwkH/4ncZYStwqXPmTnE0tEujjrG4gUisuh
         XIIX2cuBLxckCLu2Y0RjXyb8cgkLpjAKos+Pqemb5gklUVht7F+fNJQvMG+bJ2BTB+xG
         SWd6lAP/CgIuhsKHEcAENP5N2qu1Wx1hgr4jnQNpcjPfXalifNkG+YtO1D+Zvh5z1TF8
         uSPV0KWxElbg1hVZJrhFj6dCpy/QVl/OsyyZZ/3pbG54qITlRZzwh+tvyKO86UhK0usS
         9vhHrWO0gku1MlQoJptZLvpvRQClVuwD3xXl3rGpDa0fi9VbXkkpY/aPJMjl3Dhqlmtt
         D7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tKk1JuwA/2SIkfFL4MhpSntjD+oWT87CeHbGKvDOzLg=;
        b=Ce+RENy374CB45fDkSVU8OlhP7cxWxV6LpLEQHb00S8qggKjXKidzMpyOM749c47/m
         OIo9xq6Gh0kTRXUneaqRx6NI6+f25k/sSCZwIaJGOg9ohtoPt3XwgOyhcjyHZRMTDrE1
         Pg3fOWWITnNdiywnM9THLwUf+K8eHqvDeFcS7b47tqfVCo0Z+DAANqMmokiVgGG/+vsy
         yKcuueWmcRZyh+nsJzurCEWlcozmN9qXBpkBd5Lp5+HK605aJchFj1+jH/PrF/Abb8Av
         W+lMV0QQQ5CS1YR4TotmyoqsoeUnDuQ/GlbsnS4rtSp38DyUB+zYWgBlsJlBzGAQoKUV
         XwYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j24si2085248qtj.383.2019.06.21.09.34.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A714930C584D;
	Fri, 21 Jun 2019 16:34:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3D91001DC7;
	Fri, 21 Jun 2019 16:34:30 +0000 (UTC)
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
Subject: [PATCH v2 01/14] target/arm/cpu64: Ensure kvm really supports aarch64=off
Date: Fri, 21 Jun 2019 18:34:09 +0200
Message-Id: <20190621163422.6127-2-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 21 Jun 2019 16:34:35 +0000 (UTC)
X-TUID: xjXrSewnmVdi

If -cpu <cpu>,aarch64=off is used then KVM must also be used, and it
and the host must support running the vcpu in 32-bit mode. Also, if
-cpu <cpu>,aarch64=on is used, then it doesn't matter if kvm is
enabled or not.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c   | 12 ++++++------
 target/arm/kvm64.c   | 11 +++++++++++
 target/arm/kvm_arm.h | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1901997a0645..946994838d8a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -407,13 +407,13 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
      * restriction allows us to avoid fixing up functionality that assumes a
      * uniform execution state like do_interrupt.
      */
-    if (!kvm_enabled()) {
-        error_setg(errp, "'aarch64' feature cannot be disabled "
-                         "unless KVM is enabled");
-        return;
-    }
-
     if (value == false) {
+        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
+            error_setg(errp, "'aarch64' feature cannot be disabled "
+                             "unless KVM is enabled and 32-bit EL1 "
+                             "is supported");
+            return;
+        }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
     } else {
         set_feature(&cpu->env, ARM_FEATURE_AARCH64);
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 22d19c9aec6f..45ccda589903 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -24,7 +24,9 @@
 #include "exec/gdbstub.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
 #include "kvm_arm.h"
+#include "hw/boards.h"
 #include "internals.h"
 
 static bool have_guest_debug;
@@ -593,6 +595,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     return true;
 }
 
+bool kvm_arm_aarch32_supported(CPUState *cpu)
+{
+    KVMState *s = KVM_STATE(current_machine->accelerator);
+    int ret;
+
+    ret = kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
+    return ret > 0;
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
 
 int kvm_arch_init_vcpu(CPUState *cs)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2a07333c615f..812125f805a1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
+/**
+ * kvm_arm_aarch32_supported:
+ * @cs: CPUState
+ *
+ * Returns true if the KVM VCPU can enable AArch32 mode and false
+ * otherwise.
+ */
+bool kvm_arm_aarch32_supported(CPUState *cs);
+
 /**
  * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
  * IPA address space supported by KVM
@@ -247,6 +256,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     cpu->host_cpu_probe_failed = true;
 }
 
+static inline bool kvm_arm_aarch32_supported(CPUState *cs)
+{
+    return false;
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     return -ENOENT;
-- 
2.20.1
