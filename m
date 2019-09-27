Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3462722wrp;
        Fri, 27 Sep 2019 06:00:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUe6rybKLEvI4YabDdNDQIairyTIFFBxlRwZdJdURQUXJftXNeA5YMbmbUDnhGtdXFq4xs
X-Received: by 2002:a92:db0c:: with SMTP id b12mr4361956iln.27.1569589220992;
        Fri, 27 Sep 2019 06:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569589220; cv=none;
        d=google.com; s=arc-20160816;
        b=fzlQ42Alyc0uf/LkI9v33JEuM5a3E2h4Kvq9cZioIChP2AZoaIkPkyIclsEjSM8Hp4
         7fwn2iasaIjBAsRGE2gM2LfBc90JMOTNd9SCraNBaKoFOzR0ImG6iuyDUSnfs1Eq4OaG
         FheYx3U1gQ/qPawZvFST8hGo/93XghNw2bwTSeGRuat0yfxZTunQ9JlqFQflCApnJl14
         OYtXn9MF1yRwJ3+f/brNKAu4pyiWKl9o/eXjleOWoP1SZi7qdZeYMBTNIntOiTjL/qK6
         F1umNc6hqsq7KZRI8BD34T3rY+yDuK0Kv58CyjqvOMIQZUnnZVq5XSKCjKTyu/Z78twM
         NzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=hYkkn7zBsnJLIFMHETxTbP4EquDL4qa5F56ONFXlsKw=;
        b=M76d2CMtKkMDcCt15J3vDJgrOUfXln+LRsDBdgWnhCPd6kRQM7fE0VfMbI8hMplXHu
         afh/KewGwgqI9ZKbamyzMIq+x6yXtN6tyZhOK51g+/nnM93aGfhA0Ch4bXxob/fXYkA7
         MwwLtbovIottjJMyfmwl00era2M3uTH2qgJHKbMTQWeK9kPpjYhDvkTED0wJEQ7M1YcW
         U8UUCrXBKVwb74TnhbqdjPicMW4Q3q6RolzP9tNzhwXOv0TsmmmrT/QLa82PVszvdbQo
         EmhQK7OH63c04xZbjNT3B/S7OfPWVv3+Hpnon/PR4AQaIVN4YN7k3UW/gEIdLkqddToM
         Aqug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k11si7137541jaa.35.2019.09.27.06.00.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 06:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1466730BC58E;
	Fri, 27 Sep 2019 13:00:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 914AF60606;
	Fri, 27 Sep 2019 13:00:10 +0000 (UTC)
Date: Fri, 27 Sep 2019 15:00:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
	Dave.Martin@arm.com, eric.auger@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v4 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20190927130008.lh3t2tz26cknvvmf@kamzik.brq.redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924113105.19076-6-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 27 Sep 2019 13:00:20 +0000 (UTC)
X-TUID: JtiELDS491S0

On Tue, Sep 24, 2019 at 01:31:01PM +0200, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/kvm64.c | 137 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 133 insertions(+), 4 deletions(-)
>

It looks like I need to add the below changes to this patch as well,
since FPSR and FPCR are still in use with SVE.

Thanks,
drew


diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 2da366ba113e..be31e56a1ab0 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -854,10 +854,8 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 
 static int kvm_arch_put_fpsimd(CPUState *cs)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUARMState *env = &ARM_CPU(cs)->env;
     struct kvm_one_reg reg;
-    uint32_t fpr;
     int i, ret;
 
     for (i = 0; i < 32; i++) {
@@ -875,22 +873,6 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
         }
     }
 
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpsr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpcr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-
     return 0;
 }
 
@@ -970,6 +952,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 {
     struct kvm_one_reg reg;
     uint64_t val;
+    uint32_t fpr;
     int i, ret;
     unsigned int el;
 
@@ -1069,6 +1052,22 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
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
     ret = kvm_put_vcpu_events(cpu);
     if (ret) {
         return ret;
@@ -1087,10 +1086,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 
 static int kvm_arch_get_fpsimd(CPUState *cs)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUARMState *env = &ARM_CPU(cs)->env;
     struct kvm_one_reg reg;
-    uint32_t fpr;
     int i, ret;
 
     for (i = 0; i < 32; i++) {
@@ -1108,22 +1105,6 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
         }
     }
 
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    vfp_set_fpsr(env, fpr);
-
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    vfp_set_fpcr(env, fpr);
-
     return 0;
 }
 
@@ -1180,6 +1161,7 @@ int kvm_arch_get_registers(CPUState *cs)
     struct kvm_one_reg reg;
     uint64_t val;
     unsigned int el;
+    uint32_t fpr;
     int i, ret;
 
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1278,6 +1260,22 @@ int kvm_arch_get_registers(CPUState *cs)
         return ret;
     }
 
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
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
