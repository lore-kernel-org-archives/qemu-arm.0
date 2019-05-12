Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1641026wrg;
        Sun, 12 May 2019 01:36:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyhvJmzgKrmmk4P3k7w8POu7VnPqWPVYQ3h57RhGJRcQ31EQpheJ4JqiB/1W0Kk/rWaMzi
X-Received: by 2002:a37:9cd5:: with SMTP id f204mr17125415qke.75.1557650215617;
        Sun, 12 May 2019 01:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650215; cv=none;
        d=google.com; s=arc-20160816;
        b=RRyUtUN6Umwqi9itu7+fghLHT7wjEYS1+nW4GQmrL7GaxlXOhnzMfhmOVsAC6ELIL4
         d17r/JEwPXVS/ncgnYGRl6TlshIOz9a3HQgo/OeqZ3hcc3dcOce3By3TQoowTrnDlRf+
         GLX4giqFPEN4zEMEfPzyidSdP8tFCVUeo3gn+nPobDpCU9zlylMU2XxKIbVh8NSN/bIZ
         UP9H/DoNqd39myTx4UsjSBNE17Zn0fuY6Lk+tLzu5P7v6aaWeRt3tqA9Y+KeKk5F9jRE
         ttQJzM8pIZxvdw9sK3WalTyxVD2ZZijIp5dLeJsXTXcc3uBP1XQhO9Tguz7pK/OvuW61
         MrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=0wsfTKyWrE7t8v7LUwersHoyyuJjRTMEh6MJXp0etPE=;
        b=J9wDrb33d6bseJ6bIyGJN/RmiwiZswNXyaujYSPmzKnDH4xilBX8FWelaAF4eRrEbE
         5MddxXyAmWDvoNr2G2PWPQ4dmVK+5O0WURG3kAtYWCkQfemjE6VYwk+SX1K1ptReTcBh
         A/2bMqe33JvxSczdb42P7W7o5PFx59Q724tRBmvVRXJmuTPkXB8PaShD8h5QPqOxL5Xk
         17sRsaFO5YEOWFtMPWBGbWz/2FKqxY8IJCoiibLoq3rPBd3Po9V1STAm4xnDNkw6JBA5
         tTRKlcoFQGqF02UJ+Ed2aFP+P4Zcs1I1cBoaxmzT+27srYALwPbYOn+HhM/1V365Q7Ng
         Q8Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c24si6489966qtm.228.2019.05.12.01.36.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B98283086212;
	Sun, 12 May 2019 08:36:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3376E5D706;
	Sun, 12 May 2019 08:36:50 +0000 (UTC)
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
Subject: [PATCH 05/13] target/arm/kvm: Add kvm_arch_get/put_sve
Date: Sun, 12 May 2019 10:36:16 +0200
Message-Id: <20190512083624.8916-6-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 12 May 2019 08:36:54 +0000 (UTC)
X-TUID: oCiZLabvHxJy

These are the SVE equivalents to kvm_arch_get/put_fpsimd.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 61947f3716e1..86362f4cd7d0 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -658,11 +658,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
@@ -748,6 +749,61 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
     return 0;
 }
 
+static int kvm_arch_put_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
+        uint64_t *q = aa64_vfp_qreg(env, n);
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t d[ARM_MAX_VQ * 2];
+        int i;
+        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
+            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
+        }
+        reg.addr = (uintptr_t)d;
+#else
+        reg.addr = (uintptr_t)q;
+#endif
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
+        uint64_t *p = &env->vfp.pregs[n].p[0];
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t d[ARM_MAX_VQ * 2];
+        int i;
+        for (i = 0; i < cpu->sve_max_vq * 2 / 8; i++) {
+            d[i] = p[cpu->sve_max_vq * 2 / 8 - 1 - i];
+        }
+        reg.addr = (uintptr_t)d;
+#else
+        reg.addr = (uintptr_t)p;
+#endif
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
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
@@ -842,7 +898,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
     }
 
-    ret = kvm_arch_put_fpsimd(cs);
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_put_fpsimd(cs);
+    } else {
+        ret = kvm_arch_put_sve(cs);
+    }
     if (ret) {
         return ret;
     }
@@ -905,6 +965,61 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
     return 0;
 }
 
+static int kvm_arch_get_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
+        uint64_t *q = aa64_vfp_qreg(env, n);
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        reg.addr = (uintptr_t)q;
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        } else {
+#ifdef HOST_WORDS_BIGENDIAN
+            int i = 0, j = cpu->sve_max_vq * 2 - 1;
+            while (i < j) {
+                uint64_t t;
+                t = q[i], q[i] = q[j], q[j] = t;
+                ++i, --j;
+            }
+#endif
+        }
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
+        uint64_t *p = &env->vfp.pregs[n].p[0];
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        reg.addr = (uintptr_t)p;
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        } else {
+#ifdef HOST_WORDS_BIGENDIAN
+            int i = 0, j = cpu->sve_max_vq * 2 / 8 - 1;
+            while (i < j) {
+                uint64_t t;
+                t = q[i], q[i] = q[j], q[j] = t;
+                ++i, --j;
+            }
+#endif
+        }
+    }
+
+    reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
 int kvm_arch_get_registers(CPUState *cs)
 {
     struct kvm_one_reg reg;
@@ -999,7 +1114,11 @@ int kvm_arch_get_registers(CPUState *cs)
         env->spsr = env->banked_spsr[i];
     }
 
-    ret = kvm_arch_get_fpsimd(cs);
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_get_fpsimd(cs);
+    } else {
+        ret = kvm_arch_get_sve(cs);
+    }
     if (ret) {
         return ret;
     }
-- 
2.20.1
