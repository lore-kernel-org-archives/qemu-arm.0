Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp849434wrg;
        Fri, 21 Jun 2019 09:35:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylFNIm1E0NfYFPMMvLdhaZjB0DKNsU4rT0QnThVoj1u0KJvfnVMc05E2oJF0U/eAH/Dap2
X-Received: by 2002:ac8:2dcf:: with SMTP id q15mr116985069qta.170.1561134920692;
        Fri, 21 Jun 2019 09:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134920; cv=none;
        d=google.com; s=arc-20160816;
        b=0aUzkVAuTeEqd3an+BYWl5H2t30wAQ4ivCo5rsVk6IFog/tm5z1k4UjE7ZGLARbxnU
         TmWY3VWGA00I01JayWBTNAwHoCvzHepEE9dwpQ9ytqUcDN1DfdKM8ISfWTlYm+uvMWF5
         jsn8WEgq7WkfL8D7Kg50TMpPYoiHyKb7fIUkJAfc2WJOfnQuR4Drx6OLkMUIvrXIv/IQ
         t1LkJtu/LkWxvpoPYob3oewU8/T227z/adPQzpJx2pQ4atzMgX8RrocKeHBoXucEMXqD
         6JGhc0ZGrl3FgpdxQRNzvvxd2qI/33Xqyh5GUmGwiGQR4ORANM+hRCyKJeKt/b/43io/
         vFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=cEX0sv4PbQoogp88GFzs42n1IxlZnDjWjetuuTHUHTE=;
        b=kmTBzovBgrNn1kgHHmjLsZpgyl98vmQHOqtEjeM3NRqDN3bpofTiECPXEahjIcrJ1p
         5Uqy4DVTAFFTkEi4vwbYLBdj/W5jBsoZLemkFVy0uKYWDn7YKvFaw0+PTub0LZb2benW
         HolPXgj3qKVzjobxGlrKxP3B7SmX+4MQ1GLWunUuzOZSVjUddKS8pTwyuuaTtpgncHR8
         prCM4+O5WAzYqIFcsHZeVkSCRtTTuzZ+5LKAe7DLNMDZYObe/E/+3l5y+0XqW3qUjMoW
         Qf3CGTrA1sarp6sGOz7bgAnQIvvIFi8Tn1UkQF+F+zDAmjBXmM+O5YaBSkGO9jkmDTJh
         n5HA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q28si2138020qte.31.2019.06.21.09.35.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31B0D301D680;
	Fri, 21 Jun 2019 16:35:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 207CE1001DC7;
	Fri, 21 Jun 2019 16:35:15 +0000 (UTC)
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
Subject: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
Date: Fri, 21 Jun 2019 18:34:18 +0200
Message-Id: <20190621163422.6127-11-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 21 Jun 2019 16:35:18 +0000 (UTC)
X-TUID: BcVns0mrc67F

These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
swabbing is different than it is for fpsmid because the vector format
is a little-endian stream of words.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 135 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a2485d447e6a..706541327491 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -673,11 +673,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
 bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
 {
     /* Return true if the regidx is a register we should synchronize
-     * via the cpreg_tuples array (ie is not a core reg we sync by
-     * hand in kvm_arch_get/put_registers())
+     * via the cpreg_tuples array (ie is not a core or sve reg that
+     * we sync by hand in kvm_arch_get/put_registers())
      */
     switch (regidx & KVM_REG_ARM_COPROC_MASK) {
     case KVM_REG_ARM_CORE:
+    case KVM_REG_ARM64_SVE:
         return false;
     default:
         return true;
@@ -763,6 +764,70 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
     return 0;
 }
 
+/*
+ * If ARM_MAX_VQ is increased to be greater than 16, then we can no
+ * longer hard code slices to 1 in kvm_arch_put/get_sve().
+ */
+QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
+
+static int kvm_arch_put_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int slices = 1;
+    int i, n, ret;
+
+    for (i = 0; i < slices; i++) {
+        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
+            uint64_t *q = aa64_vfp_qreg(env, n);
+#ifdef HOST_WORDS_BIGENDIAN
+            uint64_t d[ARM_MAX_VQ * 2];
+            int j;
+            for (j = 0; j < cpu->sve_max_vq * 2; j++) {
+                d[j] = bswap64(q[j]);
+            }
+            reg.addr = (uintptr_t)d;
+#else
+            reg.addr = (uintptr_t)q;
+#endif
+            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
+            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+
+        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
+            uint64_t *q = &env->vfp.pregs[n].p[0];
+#ifdef HOST_WORDS_BIGENDIAN
+            uint64_t d[ARM_MAX_VQ * 2 / 8];
+            int j;
+            for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
+                d[j] = bswap64(q[j]);
+            }
+            reg.addr = (uintptr_t)d;
+#else
+            reg.addr = (uintptr_t)q;
+#endif
+            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
+            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+
+        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
+        reg.id = KVM_REG_ARM64_SVE_FFR(i);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     struct kvm_one_reg reg;
@@ -857,7 +922,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
     }
 
-    ret = kvm_arch_put_fpsimd(cs);
+    if (!cpu->sve_max_vq) {
+        ret = kvm_arch_put_fpsimd(cs);
+    } else {
+        ret = kvm_arch_put_sve(cs);
+    }
     if (ret) {
         return ret;
     }
@@ -920,6 +989,60 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
     return 0;
 }
 
+static int kvm_arch_get_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int slices = 1;
+    int i, n, ret;
+
+    for (i = 0; i < slices; i++) {
+        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
+            uint64_t *q = aa64_vfp_qreg(env, n);
+            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
+            reg.addr = (uintptr_t)q;
+            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+            if (ret) {
+                return ret;
+            } else {
+#ifdef HOST_WORDS_BIGENDIAN
+                int j;
+                for (j = 0; j < cpu->sve_max_vq * 2; j++) {
+                    q[j] = bswap64(q[j]);
+                }
+#endif
+            }
+        }
+
+        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
+            uint64_t *q = &env->vfp.pregs[n].p[0];
+            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
+            reg.addr = (uintptr_t)q;
+            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+            if (ret) {
+                return ret;
+            } else {
+#ifdef HOST_WORDS_BIGENDIAN
+                int j;
+                for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
+                    q[j] = bswap64(q[j]);
+                }
+#endif
+            }
+        }
+
+        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
+        reg.id = KVM_REG_ARM64_SVE_FFR(i);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 int kvm_arch_get_registers(CPUState *cs)
 {
     struct kvm_one_reg reg;
@@ -1014,7 +1137,11 @@ int kvm_arch_get_registers(CPUState *cs)
         env->spsr = env->banked_spsr[i];
     }
 
-    ret = kvm_arch_get_fpsimd(cs);
+    if (!cpu->sve_max_vq) {
+        ret = kvm_arch_get_fpsimd(cs);
+    } else {
+        ret = kvm_arch_get_sve(cs);
+    }
     if (ret) {
         return ret;
     }
-- 
2.20.1
