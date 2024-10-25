Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp940318njx;
        Fri, 25 Oct 2024 03:22:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPqgH8sNURxEvvSBYAdh93QK058BzCT+y3wnk+7fAl4DeCcOEv6UhBKbVrPOhsCLURQnIi4kOMXRc4ag==@linaro.org
X-Google-Smtp-Source: AGHT+IHkZhF1BoBRp8iFMAlNnkcco9IUoZWMra3Vd8NTTULO738G8uU2BA/AzLPVeXugCUIT9Brm
X-Received: by 2002:a05:6102:3f0b:b0:4a3:c6f3:89d4 with SMTP id ada2fe7eead31-4a751a80cfemr5642923137.5.1729851730088;
        Fri, 25 Oct 2024 03:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851730; cv=none;
        d=google.com; s=arc-20240605;
        b=LGrEMcjF5rurWcToBvOwcnaWTZlaeoNdOd97crze4mY61qaQn5zb0lrO3+ywrVWv8w
         UroVk3DgjYvRKC8XnaRozCSf3LUmtYnwOqjtF/SHMhqdU/lsYEwfO5Dg2VGlTzQlCtkS
         N+oNcW5YXRM3v3WRJDFpDHu/jK97NsYZetuFHKZejlwQTQRS+HuF/a50Hb6GJ+iaaTzg
         YzbFyuBYZykZg9N7mOESDLIwSHG8GlGxIpkAobFs8D3qKFbwwMqcaed/vGDEA0liCLcQ
         XU2ADdw3Xf2DKYoAtvFbPsyar6MkBYMXCPZqlYeSGP4WC3PZjronLX0QZyDWSHr09TJ/
         subQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zbD69XCuYcyIs0z1Iu29EwF5abMuXv4H1xcBzN781Yc=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=Z5As//O2gxXcmD8A9IM+DgMk1rc+xP13cr6V23tlH2IawjfXmoh3GZ+undO/rnHmdV
         MAeJPWoMNoCuWCznRvCQAEjzKbwYxj5WneXMlzFMQfqBXTton8KfIQpVErQTcLqmkI4H
         k6SMGfs7qBmqM0GI9fzCyd2O2VWx8LWkQlN+5OvzLTsJyTv62wJ24jsx7/EbUw+8XOIt
         xv+i+LJUFnIbWOSSvA3eq2NpkWgoxh5jTmkiS5+jy9CmIHdI4iAPArqbFm+aV3K/TwDD
         uCnNTOQR7VU3t5IabZPW2weqdttZJiu/fhHzRJF3+sh7LLIW4xr2nSqTnrRPs+LTt5JE
         Dktg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTMqSo1E;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46132130f27si12021281cf.201.2024.10.25.03.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTMqSo1E;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbD69XCuYcyIs0z1Iu29EwF5abMuXv4H1xcBzN781Yc=;
	b=PTMqSo1EQqobM00GTZQEr2LM0Fwh1WKDPhrzI1izP2dhUb9h9TEbPBpUYE68byABge40mi
	NsJqhxUSrn4E0A+0uqhGEezxIjIi4XoYb6fZFaBA/VUXIBk2vX/mLKlBDVhHRdZy1kYqCw
	g/nprJcLUfdrfgsGCBD2dEAit//0CK8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-o-9TlUjEPHCugcPwj0ipvw-1; Fri,
 25 Oct 2024 06:22:06 -0400
X-MC-Unique: o-9TlUjEPHCugcPwj0ipvw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2548C1955F41;
	Fri, 25 Oct 2024 10:22:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98654196BB7D;
	Fri, 25 Oct 2024 10:21:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: [RFC 17/21] arm/kvm: write back modified ID regs to KVM
Date: Fri, 25 Oct 2024 12:17:36 +0200
Message-ID: <20241025101959.601048-18-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: XEmJAHzThd51

We want to give a chance to override the value of host ID regs.
In a previous patch we made sure all their values could be fetched
through kvm_get_one_reg() calls before their modification. After
their potential modification we need to make sure we write back
the values through kvm_set_one_reg() calls.

Make sure the cpreg_list is modified with updated values and
transfer those values back to kvm.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm.c        | 36 +++++++++++++++++++++++++++++++++++-
 target/arm/trace-events |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index a0daf4c382..b63578789d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1052,6 +1052,31 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
     }
 }
 
+static void kvm_arm_writable_idregs_to_cpreg_list(ARMCPU *cpu)
+{
+    for (int i = 0; i < NR_ID_REGS; i++) {
+        uint64_t writable_mask = cpu->writable_map->regs[i];
+        uint64_t *cpreg;
+
+        if (writable_mask) {
+            uint64_t regidx;
+            uint64_t previous, new;
+            ARM64SysReg *sysregdesc = &arm64_id_regs[i];
+            ARMSysReg *sr = sysregdesc->sysreg;
+
+            regidx = ARM64_SYS_REG(sr->op0, sr->op1, sr->crn, sr->crm, sr->op2);
+            cpreg = kvm_arm_get_cpreg_ptr(cpu, regidx);
+            previous = *cpreg;
+            new = cpu->isar.idregs.regs[i];
+            if (previous != new) {
+                *cpreg = new;
+                trace_kvm_arm_writable_idregs_to_cpreg_list(sysregdesc->name,
+                                                            previous, new);
+            }
+        }
+    }
+}
+
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
@@ -2019,7 +2044,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
-    return kvm_arm_init_cpreg_list(cpu);
+    ret = kvm_arm_init_cpreg_list(cpu);
+    if (ret) {
+        return ret;
+    }
+    /* overwrite writable ID regs with their updated property values */
+    kvm_arm_writable_idregs_to_cpreg_list(cpu);
+
+    write_list_to_kvmstate(cpu, 3);
+
+    return 0;
 }
 
 int kvm_arch_destroy_vcpu(CPUState *cs)
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 0df3bfafff..668acf94ab 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -14,3 +14,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
 get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu gost value for %s is 0x%"PRIx64
+kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
-- 
2.41.0
