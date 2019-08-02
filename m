Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp781897wrv;
        Fri, 2 Aug 2019 05:25:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySYu0U1IbYBblbA0Pj9/vdm7SVzBJw0zbpgOrGo36BOJmVC1KXer2ssIrBZv+LxAfwbKGt
X-Received: by 2002:a37:6982:: with SMTP id e124mr54810851qkc.291.1564748754242;
        Fri, 02 Aug 2019 05:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748754; cv=none;
        d=google.com; s=arc-20160816;
        b=eG8ZrnJCpzlthf3969jvr7+RZnbzRS7XFVhgVxEpZMM7Zr7dElWPutnOKLEbhhdRio
         LY6pvxDAx2UCxUjfE4Dnkk7nFGHdEH+VMHaxkYH84PwKiyWHpRjnw2w5wCXXB6nS1Xzz
         qYR490NY+CqzeZuvfTnKqpFY5SSXIRsm5uvuxRpBq9/hMBApdB6wslzqnVEvQTpKzHf6
         nw3nAlAuiKXXKGzUXwvd3oAqkjNmRpt32ocu0yJb2xMnDW/z6XZEoHV/bZYiBPoyGTW7
         opsCTyDTkwLIlXW39Gmyjh5UcODzttT7Jv9AgxQTTJN8CZC+IuhQLurQv/WUAVCOndJq
         6UvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=lL6w9AOEEweHsthHZ3xzBBMgS73ZIYMU7VjN0rjITJI=;
        b=ORHTAzrRRFP3NSMuapaISkbaP0iatJm2Fgq8pPJgQtfDhJF8gtAr6lCq7QuR5bldXp
         KwWAbspKjfPFpxzzO2S0matcIBc6kYRGI+PyXMYpgk2izZDY3lhQ0AUJcgB0wQ7aXsdV
         2nf10iqwNrgaTL5UJTxJYv93XXMDXVh2BVbAXpwMYfSHVsEcZ39GUwjHdTMM6JvJO9Ry
         0yCpPplObeGxCO3yNUmNABqnehzBGZ9I49wpzqEG+79YsPxEl3jDH/8IAE7UQu7mmCQ9
         Wt7L61x7cDDOJLRPY32SKHFqtgEYrgPeKNGVTAvrvd6PBSj6+u6xIY1yRxOkKA1olqXL
         sibA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n38si45832316qvc.79.2019.08.02.05.25.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 466073087958;
	Fri,  2 Aug 2019 12:25:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 331885C205;
	Fri,  2 Aug 2019 12:25:51 +0000 (UTC)
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
Subject: [PATCH v3 01/15] target/arm/cpu64: Ensure kvm really supports aarch64=off
Date: Fri,  2 Aug 2019 14:25:26 +0200
Message-Id: <20190802122540.26385-2-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 02 Aug 2019 12:25:53 +0000 (UTC)
X-TUID: aJxwIJQ3LEZ1

If -cpu <cpu>,aarch64=off is used then KVM must also be used, and it
and the host must support running the vcpu in 32-bit mode. Also, if
-cpu <cpu>,aarch64=on is used, then it doesn't matter if kvm is
enabled or not.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu64.c   | 12 ++++++------
 target/arm/kvm64.c   |  9 +++++++++
 target/arm/kvm_arm.h | 14 ++++++++++++++
 3 files changed, 29 insertions(+), 6 deletions(-)

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
index 22d19c9aec6f..3d91846beb8f 100644
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
@@ -593,6 +595,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     return true;
 }
 
+bool kvm_arm_aarch32_supported(CPUState *cpu)
+{
+    KVMState *s = KVM_STATE(current_machine->accelerator);
+
+    return kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
+}
+
 #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
 
 int kvm_arch_init_vcpu(CPUState *cs)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2a07333c615f..98af1050a753 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -207,6 +207,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
+/**
+ * kvm_arm_aarch32_supported:
+ * @cs: CPUState
+ *
+ * Returns: true if the KVM VCPU can enable AArch32 mode
+ * and false otherwise.
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
