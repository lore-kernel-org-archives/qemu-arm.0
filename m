Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1250284wri;
        Thu, 31 Oct 2019 07:34:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyk4o8NI3wyiwtlLgxgBPVTGBkdeveuwuf32cWxSvFxeUFiLCQj6nNnO5H8fapo/AAoGADd
X-Received: by 2002:ac8:2fba:: with SMTP id l55mr5981347qta.167.1572532495501;
        Thu, 31 Oct 2019 07:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572532495; cv=none;
        d=google.com; s=arc-20160816;
        b=FmQijpygCQenbMHjqBx/kTApsrBTUinEvMTPdPu9vI45QTqn9htLjyVgPj6OYOuHWI
         kBYwyEehVzjH/ufPuI8Xms6WhdQEMyaUeM8fvR77T2XZBEqmTZltg9acThiJmiwPDwne
         s0m5apaEOdOtYsD99pHA2S/4xqB4LwTVVM14OpIgEg+t3XjRcUi8NLxzj1266Go1O0a2
         GfTzwYp51I660wbZqeKG0KQrHHnPBhUtdh/MOkw5XpEK1uESKa7ZgSC7BQZSLbkIjiVU
         HXNGzwDgoTshvRORhmTo7WFNgRE00RIPwkkPcVUNb2RNjAMcFd8qQh0vK/SiAXAO/tXi
         MQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=inFVYUzO9YS4A8Ly2zsnPPel9h9+jUPfLGKbk07PRRw=;
        b=ihheNl423LT7Yo9gjy6X4eTJFfnLaHrieCgxkDWM0igvHBLNdKzhVFqsVwoVvqhs4A
         1VOafYRx2JNAp+U6i7utevEhyYWdXGM3wR8B+x7b2Fq/BKiAgqiut7NEQs8WIp+MHpYS
         A288InG0gDrHs1TI0vXMPL1UXhdW10sYNYj13cktCZjI4EZ1fKsaxkMPaZiAyC93xNsF
         8NCaCv+//w/avCCHamlYI+B0Y9LMMY/dXXqI4LcFx1+1PObSVjd/5zEwXmPUwXqGFkQC
         6BEiXiH2LPsU/4JJxyxE1NNH7CQH1zxhJGLmHGYkCjd67Xav8vNkd2jaqHYR4w2qRVKv
         Qqwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Un/THii0";
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id w11si3495753qvz.128.2019.10.31.07.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 07:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Un/THii0";
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572532495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inFVYUzO9YS4A8Ly2zsnPPel9h9+jUPfLGKbk07PRRw=;
	b=Un/THii0LKlktL/M8zgn7rddloKEbRk1TurBbbDgrF2zn3hUtWamdsX0NkwW+eSVVlHaa4
	tA7ZprfZoXMYIR2XwtEVdmoga25AAgNznD/y28o0YK01MFKSUGFnMwkiwLswxPGWoAvosH
	FmGY9l5ZawRe3pFcSV8GrMJylov0ZCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364--nDddkYRONChI-JDj1g9jg-1; Thu, 31 Oct 2019 10:34:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06C101800D55;
	Thu, 31 Oct 2019 14:34:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4758C60852;
	Thu, 31 Oct 2019 14:34:17 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	eric.auger@redhat.com,
	beata.michalska@linaro.org,
	m.mizuma@jp.fujitsu.com,
	alex.bennee@linaro.org,
	Dave.Martin@arm.com,
	armbru@redhat.com,
	eblake@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v8 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
Date: Thu, 31 Oct 2019 15:27:30 +0100
Message-Id: <20191031142734.8590-6-drjones@redhat.com>
In-Reply-To: <20191031142734.8590-1-drjones@redhat.com>
References: <20191031142734.8590-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -nDddkYRONChI-JDj1g9jg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: 8M8Mz3BnP/RO

These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
swabbing is different than it is for fpsmid because the vector format
is a little-endian stream of words.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 target/arm/kvm64.c | 183 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 155 insertions(+), 28 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 28f6db57d5ee..4c0b11d105a4 100644
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
@@ -721,10 +722,8 @@ int kvm_arm_cpreg_level(uint64_t regidx)
=20
 static int kvm_arch_put_fpsimd(CPUState *cs)
 {
-    ARMCPU *cpu =3D ARM_CPU(cs);
-    CPUARMState *env =3D &cpu->env;
+    CPUARMState *env =3D &ARM_CPU(cs)->env;
     struct kvm_one_reg reg;
-    uint32_t fpr;
     int i, ret;
=20
     for (i =3D 0; i < 32; i++) {
@@ -742,17 +741,73 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
         }
     }
=20
-    reg.addr =3D (uintptr_t)(&fpr);
-    fpr =3D vfp_get_fpsr(env);
-    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
+    return 0;
+}
+
+/*
+ * SVE registers are encoded in KVM's memory in an endianness-invariant fo=
rmat.
+ * The byte at offset i from the start of the in-memory representation con=
tains
+ * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means t=
he
+ * lowest offsets are stored in the lowest memory addresses, then that nea=
rly
+ * matches QEMU's representation, which is to use an array of host-endian
+ * uint64_t's, where the lower offsets are at the lower indices. To comple=
te
+ * the translation we just need to byte swap the uint64_t's on big-endian =
hosts.
+ */
+static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
+{
+#ifdef HOST_WORDS_BIGENDIAN
+    int i;
+
+    for (i =3D 0; i < nr; ++i) {
+        dst[i] =3D bswap64(src[i]);
     }
=20
-    reg.addr =3D (uintptr_t)(&fpr);
-    fpr =3D vfp_get_fpcr(env);
-    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    return dst;
+#else
+    return src;
+#endif
+}
+
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 =
bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply =
hard
+ * code the slice index to zero for now as it's unlikely we'll need more t=
han
+ * one slice for quite some time.
+ */
+static int kvm_arch_put_sve(CPUState *cs)
+{
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    uint64_t tmp[ARM_MAX_VQ * 2];
+    uint64_t *r;
+    struct kvm_one_reg reg;
+    int n, ret;
+
+    for (n =3D 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r =3D sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * =
2);
+        reg.addr =3D (uintptr_t)r;
+        reg.id =3D KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    for (n =3D 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r =3D sve_bswap64(tmp, r =3D &env->vfp.pregs[n].p[0],
+                        DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+        reg.addr =3D (uintptr_t)r;
+        reg.id =3D KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    r =3D sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
+                    DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+    reg.addr =3D (uintptr_t)r;
+    reg.id =3D KVM_REG_ARM64_SVE_FFR(0);
     ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
     if (ret) {
         return ret;
@@ -765,6 +820,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 {
     struct kvm_one_reg reg;
     uint64_t val;
+    uint32_t fpr;
     int i, ret;
     unsigned int el;
=20
@@ -855,7 +911,27 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
     }
=20
-    ret =3D kvm_arch_put_fpsimd(cs);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret =3D kvm_arch_put_sve(cs);
+    } else {
+        ret =3D kvm_arch_put_fpsimd(cs);
+    }
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr =3D (uintptr_t)(&fpr);
+    fpr =3D vfp_get_fpsr(env);
+    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr =3D (uintptr_t)(&fpr);
+    fpr =3D vfp_get_fpcr(env);
+    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
     if (ret) {
         return ret;
     }
@@ -878,10 +954,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
=20
 static int kvm_arch_get_fpsimd(CPUState *cs)
 {
-    ARMCPU *cpu =3D ARM_CPU(cs);
-    CPUARMState *env =3D &cpu->env;
+    CPUARMState *env =3D &ARM_CPU(cs)->env;
     struct kvm_one_reg reg;
-    uint32_t fpr;
     int i, ret;
=20
     for (i =3D 0; i < 32; i++) {
@@ -899,21 +973,53 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
         }
     }
=20
-    reg.addr =3D (uintptr_t)(&fpr);
-    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
+    return 0;
+}
+
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 =
bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply =
hard
+ * code the slice index to zero for now as it's unlikely we'll need more t=
han
+ * one slice for quite some time.
+ */
+static int kvm_arch_get_sve(CPUState *cs)
+{
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    struct kvm_one_reg reg;
+    uint64_t *r;
+    int n, ret;
+
+    for (n =3D 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r =3D &env->vfp.zregs[n].d[0];
+        reg.addr =3D (uintptr_t)r;
+        reg.id =3D KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+        sve_bswap64(r, r, cpu->sve_max_vq * 2);
     }
-    vfp_set_fpsr(env, fpr);
=20
-    reg.addr =3D (uintptr_t)(&fpr);
-    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    for (n =3D 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r =3D &env->vfp.pregs[n].p[0];
+        reg.addr =3D (uintptr_t)r;
+        reg.id =3D KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+    }
+
+    r =3D &env->vfp.pregs[FFR_PRED_NUM].p[0];
+    reg.addr =3D (uintptr_t)r;
+    reg.id =3D KVM_REG_ARM64_SVE_FFR(0);
     ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
     if (ret) {
         return ret;
     }
-    vfp_set_fpcr(env, fpr);
+    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
=20
     return 0;
 }
@@ -923,6 +1029,7 @@ int kvm_arch_get_registers(CPUState *cs)
     struct kvm_one_reg reg;
     uint64_t val;
     unsigned int el;
+    uint32_t fpr;
     int i, ret;
=20
     ARMCPU *cpu =3D ARM_CPU(cs);
@@ -1012,10 +1119,30 @@ int kvm_arch_get_registers(CPUState *cs)
         env->spsr =3D env->banked_spsr[i];
     }
=20
-    ret =3D kvm_arch_get_fpsimd(cs);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret =3D kvm_arch_get_sve(cs);
+    } else {
+        ret =3D kvm_arch_get_fpsimd(cs);
+    }
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr =3D (uintptr_t)(&fpr);
+    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpsr(env, fpr);
+
+    reg.addr =3D (uintptr_t)(&fpr);
+    reg.id =3D AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
     if (ret) {
         return ret;
     }
+    vfp_set_fpcr(env, fpr);
=20
     ret =3D kvm_get_vcpu_events(cpu);
     if (ret) {
--=20
2.21.0
