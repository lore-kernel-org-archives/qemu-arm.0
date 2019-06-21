Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp849433wrg;
        Fri, 21 Jun 2019 09:35:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYR3jTWKMYtLLJ0fWp41sQw1b+wdjeFzWPHZj9dYwGilfGHotSiLnn6sCj27ApSgl61PSB
X-Received: by 2002:a37:b0c6:: with SMTP id z189mr62324924qke.208.1561134920683;
        Fri, 21 Jun 2019 09:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134920; cv=none;
        d=google.com; s=arc-20160816;
        b=ejoWvIFV+2FUA8fNLARViFVVUGzoE34FPCnT2qy9QoqbwsMP4DbIbUk5CNdqOERJlE
         dNuAWIc73NB+fyTq23TqC9CfrrQnwwXbCdgIsLoYJmTmppDriA2Gbb08Sjl+zSCdyRzf
         gJywIjdFGCbbgVCRGtyD5CjhjrjJ7QqLFz/zC65svWBVKJHtxdHn9vDVqqPQI9JXIFfR
         zel47Xey+9uWGeXCgtnWI1JXoShVUkmxO3qFkUsnRkqrPFAsF16+DZe3U28xJCN3aiTj
         WOR4kVVXCw6Gx2ITxN6bruBRzSCKlFFulA2D1d8viHodDZhocUz3k3hvuxFG+FHqMC80
         LM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=xDccPhAnTNfKZ/zWCHka/mSUH6qzVn8+RNnZj2Ih9g8=;
        b=GgMnN9U8ZtTcU5/iZnfi7+oI2gDjU5n6S4wYggWK4kgXBlngQI4zF3Tx/YYMahdDHF
         HIKra1RGhWMMBmQPKVTXFgtKNlVXYwhbtldFWIxyicff2fsZ51uClVlUsIcrBZirjCu1
         iVBDIRQP2ZcryunQB0MMfUNbHf6a+WafBVXhpUlVvxiSj3hVfGKJ0pkJYSbUZOoLni0x
         vdwyzRJiOmFWmNNM/EKHKpD1aX/goDBkX8toeyqmStHYjm5XnAhXG//PqoHfrT+vk9pJ
         OJG7VYEDSAWyLpaYDXwJ/5toReOwSpeWUUmQ6hD1V8RsZCOG6ysapLB5x0MPKcHzafGG
         qpbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y36si2147246qtk.15.2019.06.21.09.35.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D322731628FA;
	Fri, 21 Jun 2019 16:35:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A9D91001DE0;
	Fri, 21 Jun 2019 16:35:09 +0000 (UTC)
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
Subject: [PATCH v2 09/14] target/arm/kvm64: Move the get/put of fpsimd registers out
Date: Fri, 21 Jun 2019 18:34:17 +0200
Message-Id: <20190621163422.6127-10-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 21 Jun 2019 16:35:15 +0000 (UTC)
X-TUID: S37pwcAIbIdr

Move the getting/putting of the fpsimd registers out of
kvm_arch_get/put_registers() into their own helper functions
to prepare for alternatively getting/putting SVE registers.

No functional change.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm64.c | 148 +++++++++++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 60 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9ca9a0ce821d..a2485d447e6a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -721,13 +721,53 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
                  KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
 
+static int kvm_arch_put_fpsimd(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    uint32_t fpr;
+    int i, ret;
+
+    for (i = 0; i < 32; i++) {
+        uint64_t *q = aa64_vfp_qreg(env, i);
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t fp_val[2] = { q[1], q[0] };
+        reg.addr = (uintptr_t)fp_val;
+#else
+        reg.addr = (uintptr_t)q;
+#endif
+        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    fpr = vfp_get_fpsr(env);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    fpr = vfp_get_fpcr(env);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     struct kvm_one_reg reg;
-    uint32_t fpr;
     uint64_t val;
-    int i;
-    int ret;
+    int i, ret;
     unsigned int el;
 
     ARMCPU *cpu = ARM_CPU(cs);
@@ -817,33 +857,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
     }
 
-    /* Advanced SIMD and FP registers. */
-    for (i = 0; i < 32; i++) {
-        uint64_t *q = aa64_vfp_qreg(env, i);
-#ifdef HOST_WORDS_BIGENDIAN
-        uint64_t fp_val[2] = { q[1], q[0] };
-        reg.addr = (uintptr_t)fp_val;
-#else
-        reg.addr = (uintptr_t)q;
-#endif
-        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
-        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpsr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    fpr = vfp_get_fpcr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    ret = kvm_arch_put_fpsimd(cs);
     if (ret) {
         return ret;
     }
@@ -864,14 +878,54 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     return ret;
 }
 
+static int kvm_arch_get_fpsimd(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    uint32_t fpr;
+    int i, ret;
+
+    for (i = 0; i < 32; i++) {
+        uint64_t *q = aa64_vfp_qreg(env, i);
+        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
+        reg.addr = (uintptr_t)q;
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        } else {
+#ifdef HOST_WORDS_BIGENDIAN
+            uint64_t t;
+            t = q[0], q[0] = q[1], q[1] = t;
+#endif
+        }
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpsr(env, fpr);
+
+    reg.addr = (uintptr_t)(&fpr);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpcr(env, fpr);
+
+    return 0;
+}
+
 int kvm_arch_get_registers(CPUState *cs)
 {
     struct kvm_one_reg reg;
     uint64_t val;
-    uint32_t fpr;
     unsigned int el;
-    int i;
-    int ret;
+    int i, ret;
 
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -960,36 +1014,10 @@ int kvm_arch_get_registers(CPUState *cs)
         env->spsr = env->banked_spsr[i];
     }
 
-    /* Advanced SIMD and FP registers */
-    for (i = 0; i < 32; i++) {
-        uint64_t *q = aa64_vfp_qreg(env, i);
-        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
-        reg.addr = (uintptr_t)q;
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-        if (ret) {
-            return ret;
-        } else {
-#ifdef HOST_WORDS_BIGENDIAN
-            uint64_t t;
-            t = q[0], q[0] = q[1], q[1] = t;
-#endif
-        }
-    }
-
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    vfp_set_fpsr(env, fpr);
-
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    ret = kvm_arch_get_fpsimd(cs);
     if (ret) {
         return ret;
     }
-    vfp_set_fpcr(env, fpr);
 
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
-- 
2.20.1
