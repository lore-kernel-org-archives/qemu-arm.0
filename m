Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782481wrv;
        Fri, 2 Aug 2019 05:26:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytbI6IKjnrC+kb54nCrr7/xXkjdQYjB55dWr7r05xfA4JfDopjCorArMrgjt30vCVwfwEY
X-Received: by 2002:a37:648:: with SMTP id 69mr90838472qkg.248.1564748793173;
        Fri, 02 Aug 2019 05:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748793; cv=none;
        d=google.com; s=arc-20160816;
        b=ClJ3l6YiIe2F17riX1QrvZdMwwRnl1W/LyWw9wB2HT1D+CHmsZ2IDaoZdPD5Oeznp1
         b3Cce/58bkhTh4hR3F9OmeuPjzTLHPrbuzZO6ZyJinDI6yoPazCSU8vCoRS96sXFRjwj
         dSzM2nNd8LRZpj+PxdLJmQugt1JV4Xx10qlIex4ShX890lKAtlkQhlHJR5FAKuP4k7c/
         YbsKVCGSD2Ost/oDGVREZObudjnVfy6tw/4ds57rcw5N0pW+rlr9YJLJ2Hhh6/TH7lC9
         sds20CnpykP0OO0Mz//NIUkNCmxa9/fajgpYMrgX4xaLXklibAqW0HEqizkUuP6/HoAx
         z3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=imY9t0Xcq40FXYm9mk+jB8R+UZnvqXhG3xDpfOzNRTc=;
        b=u/XDN5fRiGPv1DGH7RxZkdZ7JdU7SF0qfAD/mB1AnJ+G2dVS3ZybERz5FLZMe1I4fs
         0XYjIpuE3ed+LGbpD3J9uu0DK+5mLGznxr0MJnGXVBEmgEKEj7JURtwCX9AFQ3z/yCyJ
         nH/NgVKodULplOy91Icirt/z8lo/nYseAaImqLxZN+i5zBeA+je0ZA5SxwojYq7ByXVm
         hbbmUMuSHQa6ahd6KdPujRnYWympzqlJzQo/YCTLbNl4Pt59BGgOWvV590HmQ6HwXw9v
         4IYDElPgHYycVceoU1qfufrJ7K+BQe3YgoNEkQ5XxBt6JrABdkUZHyn96YDMMbnzfWgm
         D+OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f11si40784947qkb.182.2019.08.02.05.26.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5323D3082E20;
	Fri,  2 Aug 2019 12:26:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55A8A5C205;
	Fri,  2 Aug 2019 12:26:29 +0000 (UTC)
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
Subject: [PATCH v3 11/15] target/arm/kvm64: Add kvm_arch_get/put_sve
Date: Fri,  2 Aug 2019 14:25:36 +0200
Message-Id: <20190802122540.26385-12-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 02 Aug 2019 12:26:32 +0000 (UTC)
X-TUID: NwEt6Rd4ys/n

These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
swabbing is different than it is for fpsmid because the vector format
is a little-endian stream of words.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 150 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 146 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 0b004d5d3050..f5c99984f25f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -671,11 +671,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
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
@@ -761,6 +762,85 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
     return 0;
 }
 
+/*
+ * SVE registers are encoded in KVM's memory in an endianness-invariant format.
+ * The byte at offset i from the start of the in-memory representation contains
+ * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
+ * lowest offsets are stored in the lowest memory addresses, then that nearly
+ * matches QEMU's representation, which is to use an array of host-endian
+ * uint64_t's, where the lower offsets are at the lower indices. To complete
+ * the translation we just need to byte swap the uint64_t's on big-endian hosts.
+ */
+#ifdef HOST_WORDS_BIGENDIAN
+static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
+{
+    int i;
+
+    for (i = 0; i < nr; ++i) {
+        dst[i] = bswap64(src[i]);
+    }
+
+    return dst;
+}
+#endif
+
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
+ * code the slice index to zero for now as it's unlikely we'll need more than
+ * one slice for quite some time.
+ */
+static int kvm_arch_put_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+#ifdef HOST_WORDS_BIGENDIAN
+    uint64_t tmp[ARM_MAX_VQ * 2];
+#endif
+    uint64_t *r;
+    struct kvm_one_reg reg;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r = &env->vfp.zregs[n].d[0];
+#ifdef HOST_WORDS_BIGENDIAN
+        r = sve_bswap64(tmp, r, cpu->sve_max_vq * 2);
+#endif
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r = &env->vfp.pregs[n].p[0];
+#ifdef HOST_WORDS_BIGENDIAN
+        r = sve_bswap64(tmp, r, DIV_ROUND_UP(cpu->sve_max_vq, 8));
+#endif
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
+#ifdef HOST_WORDS_BIGENDIAN
+    r = sve_bswap64(tmp, r, DIV_ROUND_UP(cpu->sve_max_vq, 8));
+#endif
+    reg.addr = (uintptr_t)r;
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
@@ -855,7 +935,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
     }
 
-    ret = kvm_arch_put_fpsimd(cs);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_put_sve(cs);
+    } else {
+        ret = kvm_arch_put_fpsimd(cs);
+    }
     if (ret) {
         return ret;
     }
@@ -918,6 +1002,60 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
     return 0;
 }
 
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
+ * code the slice index to zero for now as it's unlikely we'll need more than
+ * one slice for quite some time.
+ */
+static int kvm_arch_get_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    uint64_t *r;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r = &env->vfp.zregs[n].d[0];
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+#ifdef HOST_WORDS_BIGENDIAN
+        sve_bswap64(r, r, cpu->sve_max_vq * 2);
+#endif
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r = &env->vfp.pregs[n].p[0];
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+#ifdef HOST_WORDS_BIGENDIAN
+        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq, 8));
+#endif
+    }
+
+    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
+    reg.addr = (uintptr_t)r;
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+#ifdef HOST_WORDS_BIGENDIAN
+    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq, 8));
+#endif
+
+    return 0;
+}
+
 int kvm_arch_get_registers(CPUState *cs)
 {
     struct kvm_one_reg reg;
@@ -1012,7 +1150,11 @@ int kvm_arch_get_registers(CPUState *cs)
         env->spsr = env->banked_spsr[i];
     }
 
-    ret = kvm_arch_get_fpsimd(cs);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_get_sve(cs);
+    } else {
+        ret = kvm_arch_get_fpsimd(cs);
+    }
     if (ret) {
         return ret;
     }
-- 
2.20.1
