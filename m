Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497936ejd;
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPdHSRQWHaslPI2e5HRkFnga/wpYEKGsVhG+GJYWzQFUFOCxO8oiedkHsVOI4DcKS3cBwB0ptUQ8bb1L3IjHzFwcC99ngq
X-Received: by 2002:a05:600c:35d6:b0:418:3eb7:e8c6 with SMTP id r22-20020a05600c35d600b004183eb7e8c6mr1538116wmq.5.1713542389930;
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542389; cv=none;
        d=google.com; s=arc-20160816;
        b=zGxCw2+UHobC5juTgAjAFPGFy1y3kKc4HY/qn9Tm7pCNJNP8GpAJUnuwYU6bVsRhv8
         djNM0q/9vEeksH86JW/UrVhr+Qnma+++eyBLSG0UKoV7RLvEMlj+FwyixtrsTEwsLtrK
         h97beioBBao9IvOBKlCYHEZ9St0mGuyaoyJh2IA7w9gJST3kQ7R6Ys+LQk9EdXSlud4V
         Hq3LnmlA+wYz0EVpJ+HFUsGPmkpC7Q9aZAdvMeSRXDabGrgDKwIKxOXYd6dJY44Mttx1
         CnFtp35rgKao5cQVyuwfqW9xb9MT/4tuHjMkWeA54Gi+qLPMtqjfO+2JwPTtG0hJ+yLf
         Kikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fwLE1XkqbTWykZyFGjxxFRV6aZ7S9m/Sx/51Il4WLdA=;
        fh=gOQszPquwr1HdIVn2Y4LddbrUkG/a7UfV+ZRRHMunco=;
        b=hV0vwZRNXj0GGOE+GancjI38vy06akQr0RFmQiEJs7ljYem8abV9446iungHl2C8hO
         NBTWolqh6HoBPSWDbxUlcQynny0siTfIw6hXMEmMUaF8OQtX3QlOaPqXQUUaIB5wAec9
         WJct75wZAhyqi7Rogx56Pbn5gC1Rnt2Wpa6KllVt+4xLw9wXkS8WLUKQ17MSJX0/7Co6
         to+1zUlm35deanm4JPBlOet6S/QeDyBd+ivK5jaZaRhmiQBe8b+Jgrycr+Ty7DPNZCWm
         0E5Oz22rP9v+vKdBqyzgl5wcf3Fi85mSlLSqgNjNaYlx9jfSOHuxOr2cbfjQOS9HCfTT
         extA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s8jEVxhA;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h20-20020adfa4d4000000b003484183b42fsor1112231wrb.4.2024.04.19.08.59.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s8jEVxhA;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542389; x=1714147189; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwLE1XkqbTWykZyFGjxxFRV6aZ7S9m/Sx/51Il4WLdA=;
        b=s8jEVxhA6ImwsdvWIvoMVUdgxHkJyZb/lo/B5l+dVoOEdWoUv3YAJ2NMJUu0DNvgm3
         vaiVoT5kTs5LyeuzLLfuS1kHGFWYryDPVUAwWh5pHQAIm02LJnDgvnI1CFwksid/oju1
         rJoL1KS4VfedSdxWnTjSgEI5sfrkAj/G9oAMVJGB94zkoSxgqG91IED9S6xU0aX7A7Zg
         YoDLnmsX7yENWEqeSVObeRJg2eYDHYsGvBP2HKFItUff2aNR4DhjH1UCkal1qt79aUs5
         nZUooBHdTIRNw/Hm/dUBzoCA8/Cx4dJzVpM1ivE8q9QRigDCxEegV+uLZmLRRnLfe7/r
         WbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542389; x=1714147189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwLE1XkqbTWykZyFGjxxFRV6aZ7S9m/Sx/51Il4WLdA=;
        b=BfBDQKgiFTm4Z0UlbuQa7ekLg5W1+2ssCbfJOLgUkIORhqtiDHvQ25/5z8reKDmbLA
         Gaa0yS47A3SLIm3wAYlT13gJOd4Skc2ErzE3Y3uhfQs5tHXxLQkogTWYI+PMNjQqANy7
         w7WybiKVy6OIgxNltgfRDpY/HZFsn/tS+bMKOuglK1qL6HcPtJlcmNn6r3XZcUh97wxO
         2aZxU9QLC9oZU2JYpgM2lW4tYk8mvGhcjCOkvcRhsQaGUh0/Gd6AE69+hlMjBeBo0qPF
         DE7MajI3RFUHDZATCZuGkqH5HWj5Vcf6smZQoMrd8u61WgLUXWpIAu+LCZIMBDLn7iiP
         pBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyeSYJ8RYcStzQFofuUl4c3Ptd27bQ6hOc1d144KO/qRTO8JknFEEyorQY1a0+sS4Qs5ZXJmj/bsSOS3lA3eNOaYig5cIB
X-Gm-Message-State: AOJu0Yzaa4k499xEmWkbOlVS3YxKA3u7mlptIcyDAV+BgR31nlLeqP+Q
	fGvuDeNMf22r4n8nvrctl/EC11CbyG4xSgh/Rdwks38PeNFyTdYHGgXn01p4eC1OjA==
X-Google-Smtp-Source: AGHT+IHS0L5Lujp82y+sqaO4BTWg9DjNFxI+SKshLzHu9CH18UI8obwKTQQYCL3Od25ds4fcgbtbBg==
X-Received: by 2002:a05:6000:a8c:b0:349:9b7f:8df3 with SMTP id dh12-20020a0560000a8c00b003499b7f8df3mr1687174wrb.40.1713542389606;
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 04/22] target/arm/kvm-rme: Initialize realm
Date: Fri, 19 Apr 2024 16:56:52 +0100
Message-ID: <20240419155709.318866-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8dVOqwQVScX7

The machine code calls kvm_arm_rme_vm_type() to get the VM flag and KVM
calls kvm_arm_rme_init() to issue KVM hypercalls:

* create the realm descriptor,
* load images into Realm RAM (in another patch),
* finalize the REC (vCPU) after the registers are reset,
* activate the realm at the end, at which point the realm is sealed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2:
* Use g_assert_not_reached() in stubs
* Init from kvm_arch_init() rather than hw/arm/virt
* Cache rme_guest
---
 target/arm/kvm_arm.h |  16 +++++++
 target/arm/kvm-rme.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c     |   7 ++-
 3 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cfaa0d9bc7..8e2d90c265 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -203,6 +203,8 @@ int kvm_arm_vgic_probe(void);
 void kvm_arm_pmu_init(ARMCPU *cpu);
 void kvm_arm_pmu_set_irq(ARMCPU *cpu, int irq);
 
+int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature);
+
 /**
  * kvm_arm_pvtime_init:
  * @cpu: ARMCPU
@@ -214,6 +216,11 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa);
 
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
+int kvm_arm_rme_init(MachineState *ms);
+int kvm_arm_rme_vm_type(MachineState *ms);
+
+bool kvm_arm_rme_enabled(void);
+
 #else
 
 /*
@@ -283,6 +290,15 @@ static inline uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
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
 #endif
 
 #endif
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 960dd75608..23ac2d32d4 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -23,14 +23,115 @@ struct RmeGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
+static RmeGuest *rme_guest;
+
+bool kvm_arm_rme_enabled(void)
+{
+    return !!rme_guest;
+}
+
+static int rme_create_rd(Error **errp)
+{
+    int ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                                KVM_CAP_ARM_RME_CREATE_RD);
+
+    if (ret) {
+        error_setg_errno(errp, -ret, "RME: failed to create Realm Descriptor");
+    }
+    return ret;
+}
+
+static void rme_vm_state_change(void *opaque, bool running, RunState state)
+{
+    int ret;
+    CPUState *cs;
+
+    if (!running) {
+        return;
+    }
+
+    ret = rme_create_rd(&error_abort);
+    if (ret) {
+        return;
+    }
+
+    /*
+     * Now that do_cpu_reset() initialized the boot PC and
+     * kvm_cpu_synchronize_post_reset() registered it, we can finalize the REC.
+     */
+    CPU_FOREACH(cs) {
+        ret = kvm_arm_vcpu_finalize(ARM_CPU(cs), KVM_ARM_VCPU_REC);
+        if (ret) {
+            error_report("RME: failed to finalize vCPU: %s", strerror(-ret));
+            exit(1);
+        }
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
+                            KVM_CAP_ARM_RME_ACTIVATE_REALM);
+    if (ret) {
+        error_report("RME: failed to activate realm: %s", strerror(-ret));
+        exit(1);
+    }
+}
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
+
 static void rme_guest_class_init(ObjectClass *oc, void *data)
 {
 }
 
+static void rme_guest_instance_init(Object *obj)
+{
+    if (rme_guest) {
+        error_report("a single instance of RmeGuest is supported");
+        exit(1);
+    }
+    rme_guest = RME_GUEST(obj);
+}
+
 static const TypeInfo rme_guest_info = {
     .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
     .name = TYPE_RME_GUEST,
     .instance_size = sizeof(struct RmeGuest),
+    .instance_init = rme_guest_instance_init,
     .class_init = rme_guest_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_USER_CREATABLE },
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a5673241e5..b00077c1a5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -93,7 +93,7 @@ static int kvm_arm_vcpu_init(ARMCPU *cpu)
  *
  * Returns: 0 if success else < 0 error code
  */
-static int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
+int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
 {
     return kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_VCPU_FINALIZE, &feature);
 }
@@ -608,6 +608,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
+    ret = kvm_arm_rme_init(ms);
+    if (ret) {
+        error_report("Failed to enable RME: %s", strerror(-ret));
+    }
+
     return ret;
 }
 
-- 
2.44.0
