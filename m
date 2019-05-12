Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641147wrg;
        Sun, 12 May 2019 01:37:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZb/91F324pgaN2MVtN2GSxj+5QQPBM7ouS0HbxP7/4af9OClx7OETu3sIFzo5LEryn64y
X-Received: by 2002:a0c:d442:: with SMTP id r2mr17578327qvh.9.1557650225729;
        Sun, 12 May 2019 01:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650225; cv=none;
        d=google.com; s=arc-20160816;
        b=c5aELS89PAXWECktEs8mpEFe+436fvvgme8nNkiPs9CmiHI8CKWfOmg/RFczc+fDdv
         RQNRMjgOaJrHeBMHGbEoz+cg+h+fupi3MhKJMy4PaFRA39H/QFAu6F84/i1rmcmwNRp0
         mxY+sGs9PMUZPYcTtZCk3j8cc5CCSpvI5982nIjqrVpMf8TReJyOGQB4DXZyhcxb2zvj
         J5/CtdRXM/WHD6eAQm6WG3sTR7mJyKz/j172Oba941cFO7h/yFws5W1ooy/6n6Vvhtwe
         FSKemrXK33vKz/P/LMnxB0kA0b8PLcr+z6yeNkPfQVI5Q0RvdpzVeiwVDlNj/6gJTUpb
         OD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/rMsfJ4v0rswHa3VC7M59WzabzRAsls46QDSruWXX9g=;
        b=0XrOR7QJYjG2ozM7SvfEjCkkiITI5f/jDlsgQS3tZB48gxelX0JZHDqcvWQmcDFoDb
         bpPWm3bQ6G9dgvrBLZ9SD8zWW7NB2qYGsvDYkX12Bi73niHIfwKJVQDbdNjyNTIA5bTw
         CvrA4qULnEHWhySlQJEvzYvm0y0uQqYy+3t0l5CZRsDzBB4F1xXosBPvXrMWUyEy4EE7
         Psv9VClipAIAwLEUoEt4BR+TSQcidfxdyTaiihVjg02lccrh3b6UL69giQG59nwQ/nY8
         4ddssrfi4Qod6Vy8Iwe5zOt0y+s7JOpeDd6+U9u7uAUa6D8dahENWNG4UP0lNB0uhaxE
         suTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t14si906686qvh.116.2019.05.12.01.37.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7F50DC8EF;
	Sun, 12 May 2019 08:37:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 237625D706;
	Sun, 12 May 2019 08:37:00 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 07/13] target/arm/kvm: max cpu: Allow sve max vector length setting
Date: Sun, 12 May 2019 10:36:18 +0200
Message-Id: <20190512083624.8916-8-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Sun, 12 May 2019 08:37:04 +0000 (UTC)
X-TUID: UQ2EywDLv7qM

Allow the cpu type 'max' sve-max-vq property to work with kvm
too. If the property is not specified then the maximum kvm
supports is used. If it is specified we check that kvm supports
that exact length or error out if it doesn't.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.h   |  4 +++
 target/arm/cpu64.c |  7 ++--
 target/arm/kvm64.c | 80 ++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 733b840a7127..8292d547e8f9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3122,6 +3122,10 @@ static inline uint64_t arm_sctlr(CPUARMState *env, int el)
     }
 }
 
+static inline int arm_cpu_fls64(uint64_t v)
+{
+    return !v ? 0 : 64 - clz64(v);
+}
 
 /* Return true if the processor is in big-endian mode. */
 static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6c19ef6837d5..3756e7e2a3e5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -292,7 +292,7 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        cpu->sve_max_vq = ARM_MAX_VQ;
+        cpu->sve_max_vq = -1; /* set in kvm_arch_init_vcpu() */
     } else {
         uint64_t t;
         uint32_t u;
@@ -374,9 +374,10 @@ static void aarch64_max_initfn(Object *obj)
 #endif
 
         cpu->sve_max_vq = ARM_MAX_VQ;
-        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
-                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
     }
+
+    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
+                        cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
 }
 
 struct ARMCPUInfo {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index c2d92df75353..0c666e405357 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -446,6 +446,59 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }
 }
 
+static int kvm_arm_get_sve_vls(CPUState *cs, uint64_t sve_vls[])
+{
+    struct kvm_one_reg reg = {
+        .id = KVM_REG_ARM64_SVE_VLS,
+        .addr = (uint64_t)&sve_vls[0],
+    };
+    int i, ret;
+
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    ret = 0;
+    for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
+        if (sve_vls[i]) {
+            ret = arm_cpu_fls64(sve_vls[i]) + i * 64;
+            break;
+        }
+    }
+
+    return ret;
+}
+
+static int kvm_arm_set_sve_vls(CPUState *cs, uint64_t sve_vls[], int max_vq)
+{
+    struct kvm_one_reg reg = {
+        .id = KVM_REG_ARM64_SVE_VLS,
+        .addr = (uint64_t)&sve_vls[0],
+    };
+    int i;
+
+    for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
+        if (sve_vls[i]) {
+            int vq = arm_cpu_fls64(sve_vls[i]) + i * 64;
+            while (vq > max_vq) {
+                sve_vls[i] &= ~BIT_MASK(vq - 1);
+                vq = arm_cpu_fls64(sve_vls[i]) + i * 64;
+            }
+            if (vq < max_vq) {
+                error_report("sve-max-vq=%d is not a valid length", max_vq);
+                error_printf("next lowest is %d\n", vq);
+                return -EINVAL;
+            }
+            if (vq == max_vq) {
+                break;
+            }
+        }
+    }
+
+    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+}
+
 static inline void set_feature(uint64_t *features, int feature)
 {
     *features |= 1ULL << feature;
@@ -605,7 +658,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
-        fprintf(stderr, "KVM is not supported for this guest CPU type\n");
+        error_report("KVM is not supported for this guest CPU type");
         return -EINVAL;
     }
 
@@ -631,7 +684,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     if (cpu->sve_max_vq) {
         if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
-            cpu->sve_max_vq = 0;
+            if (cpu->sve_max_vq == -1) {
+                cpu->sve_max_vq = 0;
+            } else {
+                error_report("This KVM host does not support SVE");
+                return -EINVAL;
+            }
         } else {
             cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
         }
@@ -644,6 +702,24 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     if (cpu->sve_max_vq) {
+        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
+        ret = kvm_arm_get_sve_vls(cs, sve_vls);
+        if (ret < 0) {
+            return ret;
+        }
+        if (cpu->sve_max_vq == -1) {
+            cpu->sve_max_vq = ret;
+        } else if (cpu->sve_max_vq > ret) {
+            error_report("This KVM host does not support SVE vectors "
+                         "of length %d quadwords (%d bytes)",
+                         cpu->sve_max_vq, cpu->sve_max_vq * 16);
+            return -EINVAL;
+        } else {
+            ret = kvm_arm_set_sve_vls(cs, sve_vls, cpu->sve_max_vq);
+            if (ret < 0) {
+                return ret;
+            }
+        }
         ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
         if (ret) {
             return ret;
-- 
2.20.1
