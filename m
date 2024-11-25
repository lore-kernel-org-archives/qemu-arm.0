Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569286njc;
        Mon, 25 Nov 2024 11:59:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdEPZYvfK4uJmPa3ahSZWA8ytiU1hnJzMAljxp73aQrqWnk/9TplEA8om2NLoqZ57AcuqbeMNwsfYQYA==@linaro.org
X-Received: by 2002:a05:600c:1d28:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-433ce41e40emr142380885e9.11.1732564768960;
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564768; cv=none;
        d=google.com; s=arc-20240605;
        b=TLQ3I6eoFrSYEzVnXamqu8Wauw/gMHF1F+bk1+1sRxpwMZ45He6fuM+vYfmrmCsNDE
         xz/O6h1T4RKSxJQlQcyhhxqPRDtHk8rA+2FBDNZhja/+txWrIUDHPsxUr7/Fr9i/Vpyp
         byDgyJS4gaf61FVL3nzau0GTlKKepmC4QYgCYKRgMKsIOrRnhtu9Q32OtjlIqJu8Khu2
         oF0NT3CVarr2o9Fh5ItKhJBZ8nkXGGZRDPYnAKqX1HlMK0UqBow0rUrAcj5m7v0ZAb/Z
         owFGyky+7fQ1bWVugaGDuLrLR2hhU/vAvcTPfj7Uw4JLL3/ZxodrQTprqWuO1BSE/FUN
         IX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y1yqlpej3WjW1JQDA6ksx54DWAhTx2FxYXSqrclmH28=;
        fh=rW583VtQmylumERCfV0PFyTo9Xsn+mjOXx7n/3WLA/c=;
        b=gJQJ7CJp0HsuZ9LI5kWE5XdPr7qWL7y79gwfN3Ncrkb9slEEg6WaDiwypkx320JjYh
         eRWCDwW1n311p3Ztu0xZgt4rk3rnabrjC+Hp1wTlJh9MPA31roh7UpNV26DRiu+WOSqJ
         zBWnvcM+o94YWvpvPvPwTLuYF1CLQaf1iGR8EHY8x6QUg1vCeTsn5txuvVq3bvWzSUJa
         XLnJscCCly5p2n+TjhoCwlem+ueTLNW6S2B0oiQBJyydAKk1kI85AQ6jV8wt8W2YuvZv
         KGz7qiklYVALaB5XD6IFURaXWQdqUOjgu7mPdeiJW3TqvhUSOZTKs+pOwud22gQtpztL
         A2uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hO2hkDaj;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a3223fc4sor5643165e9.1.2024.11.25.11.59.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hO2hkDaj;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564768; x=1733169568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1yqlpej3WjW1JQDA6ksx54DWAhTx2FxYXSqrclmH28=;
        b=hO2hkDajuXV77ghAzaU80kQvJYr0LHNzG4yrWtqywS01aB8fy3quM+Oeak8yuEvZzk
         Gnx9RQxaQ6PuTSRX3YVDKXh7+vGU6NbHRl6P/8fsQ5TXzk9ZFxHk4lFuGY+tHN9rpW4M
         VCkfQzo+CPYySMB7+9w+mthFPRmp/XMSZ9ZsEa1OP3EatDrNOSQyIerMjj9CMitih0ae
         oVicGTP9cfi2/i68/1bG1GmMuqjmDDIDMoFs3XXfWJzpVa7YpvG0zejvo5ZBq8o59Tcw
         qg/DGguCPU9ccgLeXjxB10smTPQzQ2FsrSz0v1gIPiNErbkmRRwGDFafR2Stk4nk2lS2
         rKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564768; x=1733169568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1yqlpej3WjW1JQDA6ksx54DWAhTx2FxYXSqrclmH28=;
        b=DNXvp/9Hi+s6d0y5Y7t4FyKuF7h4p1aw7JWsQG1/J0JatGoATQ9kldIcdcC7emlUq0
         Eq7dU2Av6LwxDs3jikmtfHI2nJk3Rfs8VJOoDa37ZymAGAyeZqcSAgZvFm+4LGs40Rtj
         mHgKPWHbM/3IWvwijB4GrQJaBeWYMTozyw8QtFKTkC0fIC/gYr23BF2m3iS8uZQFYzv+
         FEEq3KE7cOryL2x5aVYUuKvzSpjWUWKhuq9WL3HfmFDKYaMf54sb8T2VPfFrQmPTFUVg
         u3rn4dn232D7kDVewgXCNMM8WTpwvKs2DwcO2uotqMag3zu+onb7ewq7gKzWnkJjB6VD
         Pntg==
X-Forwarded-Encrypted: i=1; AJvYcCW8h9ul+c6QpmNfW2A2asPgpGkqp76GG8QLfQm7M0he2Cabuo7He/j2vlq5iozYwb49MMq6RHXvtaPfCA==@linaro.org
X-Gm-Message-State: AOJu0YyvpoLKee/ZanUVltGcc4VAPt42/W3eyyxPveuAFpgPdy2/1QMK
	Rp4SngpCKBFa4lWrA0eUmx8rC8UApiIqcIsAbPuIo0KVedH3SFtaJAPdcVRHqhFnPw==
X-Gm-Gg: ASbGncs89wQX9tNb08LfVVRZqIZZM93mZ9O58pf0O4X5dngZd7MdBAEZ7HNq7Y4E5Ne
	eiq2Ts8Gx+dudAlxIzmrj9Tmot7r87Z744dPxCcFSE+ZgCiHO9YAN7O5wUR16JIGY4X3SAzCCc1
	mayqOyNjPRhgA2wYYNZU/h1FGLGrYwFUt6n1WwLkMk9c4jl6mZU9s/lsWyN8GllZqX6UKNjbP16
	pYi60KHzkh/Qi1uaoW9o8qw9EJSEz8DLReGJWxGuyq/auR6OmxABMAnMbZ+689d+U0M
X-Google-Smtp-Source: AGHT+IFsIzPEH/whkFkArGEmVc/nnWnbFUS8SKjy/3ZNik9sJI/dbV0ygS/lbB2p3m1K4Zl/8as48w==
X-Received: by 2002:a5d:47cc:0:b0:382:506b:f627 with SMTP id ffacd0b85a97d-38260bea7a0mr17079479f8f.57.1732564766896;
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 04/26] target/arm/kvm-rme: Initialize realm
Date: Mon, 25 Nov 2024 19:56:03 +0000
Message-ID: <20241125195626.856992-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hi1wnbs19/FT

The machine code calls kvm_arm_rme_vm_type() to get the VM flag and KVM
calls kvm_arm_rme_init() to prepare for launching a Realm. Once VM
creation is complete, create the Realm:

* Create the realm descriptor,
* load images into Realm RAM (in another patch),
* finalize the REC (vCPU) after the registers are reset,
* activate the realm, at which point the realm is sealed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3:
* Cleaner error handling
---
 target/arm/kvm_arm.h |  39 ++++++++++++++++
 target/arm/kvm-rme.c | 106 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c     |   9 +++-
 3 files changed, 152 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2e6b49bf13..9d6a89f9b1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -153,6 +153,14 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
  */
 void kvm_arm_add_vcpu_properties(ARMCPU *cpu);
 
+/**
+ * @cpu: The CPU object to finalize
+ * @feature: a KVM_ARM_VCPU_* feature
+ *
+ * Finalize the configuration of the given vcpu feature.
+ */
+int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature);
+
 /**
  * kvm_arm_steal_time_finalize:
  * @cpu: ARMCPU for which to finalize kvm-steal-time
@@ -221,6 +229,22 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
 
+/**
+ * kvm_arm_rme_init
+ * @ms: the machine state
+ *
+ * Prepare the machine to be a Realm, if the user enabled it.
+ */
+int kvm_arm_rme_init(MachineState *ms);
+
+/**
+ * kvm_arm_rme_vm_type
+ * @ms: the machine state
+ *
+ * Returns the Realm KVM VM type if the user requested a Realm, 0 otherwise.
+ */
+int kvm_arm_rme_vm_type(MachineState *ms);
+
 #else
 
 /*
@@ -260,6 +284,11 @@ static inline void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
     g_assert_not_reached();
 }
 
+static inline int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
+{
+    g_assert_not_reached();
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 {
     g_assert_not_reached();
@@ -300,6 +329,16 @@ static inline void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
     g_assert_not_reached();
 }
 
+static inline int kvm_arm_rme_init(MachineState *ms)
+{
+    g_assert_not_reached();
+}
+
+static inline int kvm_arm_rme_vm_type(MachineState *ms)
+{
+    g_assert_not_reached();
+}
+
 #endif
 
 #endif
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 67909349c1..60d967a842 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -12,6 +12,7 @@
 #include "kvm_arm.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
@@ -27,14 +28,119 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
                                           CONFIDENTIAL_GUEST_SUPPORT,
                                           { TYPE_USER_CREATABLE }, { })
 
+static RmeGuest *rme_guest;
+
+static int rme_init_cpus(Error **errp)
+{
+    int ret;
+    CPUState *cs;
+
+    /*
+     * Now that do_cpu_reset() initialized the boot PC and
+     * kvm_cpu_synchronize_post_reset() registered it, we can finalize the REC.
+     */
+    CPU_FOREACH(cs) {
+        ret = kvm_arm_vcpu_finalize(ARM_CPU(cs), KVM_ARM_VCPU_REC);
+        if (ret) {
+            error_setg_errno(errp, -ret, "failed to finalize vCPU");
+            return ret;
+        }
+    }
+    return 0;
+}
+
+static int rme_create_realm(Error **errp)
+{
+    int ret;
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_CREATE_RD);
+    if (ret) {
+        error_setg_errno(errp, -ret, "failed to create Realm Descriptor");
+        return -1;
+    }
+
+    if (rme_init_cpus(errp)) {
+        return -1;
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_ACTIVATE_REALM);
+    if (ret) {
+        error_setg_errno(errp, -ret, "failed to activate realm");
+        return -1;
+    }
+
+    kvm_mark_guest_state_protected();
+    return 0;
+}
+
+static void rme_vm_state_change(void *opaque, bool running, RunState state)
+{
+    Error *err = NULL;
+
+    if (!running) {
+        return;
+    }
+
+    if (rme_create_realm(&err)) {
+        error_propagate_prepend(&error_fatal, err, "RME: ");
+    }
+}
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
 }
 
 static void rme_guest_init(Object *obj)
 {
+    if (rme_guest) {
+        error_report("a single instance of RmeGuest is supported");
+        exit(1);
+    }
+    rme_guest = RME_GUEST(obj);
 }
 
 static void rme_guest_finalize(Object *obj)
 {
 }
+
+int kvm_arm_rme_init(MachineState *ms)
+{
+    static Error *rme_mig_blocker;
+    ConfidentialGuestSupport *cgs = ms->cgs;
+
+    if (!rme_guest) {
+        return 0;
+    }
+
+    if (!cgs) {
+        error_report("missing -machine confidential-guest-support parameter");
+        return -EINVAL;
+    }
+
+    if (!kvm_check_extension(kvm_state, KVM_CAP_ARM_RME)) {
+        return -ENODEV;
+    }
+
+    error_setg(&rme_mig_blocker, "RME: migration is not implemented");
+    migrate_add_blocker(&rme_mig_blocker, &error_fatal);
+
+    /*
+     * The realm activation is done last, when the VM starts, after all images
+     * have been loaded and all vcpus finalized.
+     */
+    qemu_add_vm_change_state_handler(rme_vm_state_change, NULL);
+
+    cgs->require_guest_memfd = true;
+    cgs->ready = true;
+    return 0;
+}
+
+int kvm_arm_rme_vm_type(MachineState *ms)
+{
+    if (rme_guest) {
+        return KVM_VM_TYPE_ARM_REALM;
+    }
+    return 0;
+}
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 95bcecf804..440c3ac8c6 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -95,7 +95,7 @@ static int kvm_arm_vcpu_init(ARMCPU *cpu)
  *
  * Returns: 0 if success else < 0 error code
  */
-static int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
+int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
 {
     return kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_VCPU_FINALIZE, &feature);
 }
@@ -627,7 +627,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return 0;
+    ret = kvm_arm_rme_init(ms);
+    if (ret) {
+        error_report("Failed to enable RME: %s", strerror(-ret));
+    }
+
+    return ret;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.47.0
