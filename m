Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1640986wrg;
        Sun, 12 May 2019 01:36:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeD6m8QwLIXFNZGd5jGsbvwecjfAJGkt2ncAWuyvRMzhFzuzI6Ij2htr3oYkPqhV8AMXBj
X-Received: by 2002:aed:3c2e:: with SMTP id t43mr6060889qte.39.1557650211515;
        Sun, 12 May 2019 01:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650211; cv=none;
        d=google.com; s=arc-20160816;
        b=JdMs1Jyo4J702OZ3PeTQhrmDQXu2RBdIYLgwDc8JHpEenQE4UsTB9E2RiIi9r7FFg3
         9RwLweCjpAOdTWKRLv/97oxVYigRgkSGR4qqCBY97twMqGIGGeqXc6hDtrQuZYH88DE0
         QAYelJdmNoZc9eulxIRsnOp/+AT5of9dftyjRaRrkUb0Tg7NKyZSdK3bfS8jPTnr+Rmi
         K0yhoP1TtWc6hbmG4mmHJuVjliftrxzQ7X5UBabMC8qYv6rV05vgMil0Ji15OsWD70z/
         4I6SD2kYkPyGJFrJikV9boxslMshSwkp0Situ+E3HnCzF8KpwRsMFraKqLMki4H30kkJ
         XBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5Qw3Kjwcdh9TPT96XZSjoLzHa3F0WTj9EapCOH31oVs=;
        b=DoU4zhA3rvSzdPHaPpKcfmXG8CO43eYE1RhhFryhNsXq9xfPxWhu9mfWPsF+obazI8
         JfZ0ZZGHg0KX8qf00EF97aFZl7vSJKQG6EyV9X65Vx4pkdNNij1+RO1NiHqduoJZxm3n
         zBs31lyGiL47ajJeQD1PXjZWgB8R7qxvbJrVs1j2SE3Ky6wWjc4xfgR/ePlIbGLoPtty
         GPvs5A1Kv3klGR05mfYG0z110CVHTSq0d3vCQsEt+ysh3+T4qyrdkdpbZL/dPGZo2Bfo
         ttUh3YEq1OBN0jQpe7l1g4NeQQNoBQ+irPzRDCDftXFnJDTI7whEKx781V3ccvbcSq7B
         MEyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y16si7011471qty.288.2019.05.12.01.36.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E6E03082E25;
	Sun, 12 May 2019 08:36:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4DDC5D706;
	Sun, 12 May 2019 08:36:47 +0000 (UTC)
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
Subject: [PATCH 04/13] target/arm/kvm: Move the get/put of fpsimd registers out
Date: Sun, 12 May 2019 10:36:15 +0200
Message-Id: <20190512083624.8916-5-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Sun, 12 May 2019 08:36:50 +0000 (UTC)
X-TUID: LfeAK7iZEpBQ

Move the getting/putting of the fpsimd registers out of
kvm_arch_get/put_registers() into their own helper functions
to prepare for alternatively getting/putting SVE registers.

No functional change.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 148 +++++++++++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 60 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ba232b27a6d3..61947f3716e1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -706,13 +706,53 @@ int kvm_arm_cpreg_level(uint64_t regidx)
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
@@ -802,33 +842,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
@@ -849,14 +863,54 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
@@ -945,36 +999,10 @@ int kvm_arch_get_registers(CPUState *cs)
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
