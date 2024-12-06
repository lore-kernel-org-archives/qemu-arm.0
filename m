Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp771041njb;
        Fri, 6 Dec 2024 03:24:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVt8Xz+eGAC7GCjahNrdsQ1h4fiw+Ic1gIbpHdSbxIYPFN+2UIZ4oObyI96hYc4PyDOwskWBWDNy8zhAg==@linaro.org
X-Google-Smtp-Source: AGHT+IHVX1hN1xHViamJqdFPfS0T2sY0yL1KUuPqZRcr7fNI28d1ilG1f3T/v4o3Azkz1IA16xc2
X-Received: by 2002:a05:6102:3707:b0:4af:ae02:d3bc with SMTP id ada2fe7eead31-4afca8e8592mr3377666137.5.1733484254360;
        Fri, 06 Dec 2024 03:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733484254; cv=none;
        d=google.com; s=arc-20240605;
        b=kf7MOIQ73j4SbftJcXrgOeGhZdbhhDG9ctNz09HL/1P6p9qiGXZXdvmWictOGOQD7/
         I4PVis/0WAkbDw8Nm17iLIStN5svmFE0MLKytcvGOVxL5kUzcJizNYlWc6DfpJ6xLMmr
         CzYY2xMqUw/Wi03YQtP43j5lEc6tpyds2MANy63yLHU0ZKWR52Dc742LZXL6ugi5Qv1O
         wTMytkuldLfDg8L8pu443phhlYXuIPCyoe2Hfv3C2NdCY36Vq4yuTHPc68lkvDmtDtv4
         FT8SoiMjVa0QZ+DmBigKvSb5qAxeLE+sAePZRjZX25nyLryCTcd8x67FISv1SnuvBmkQ
         6TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lFWn0G2Z/v7JVK2itFan8SiYF0Cp3PsLypgq8Fk6Lqk=;
        fh=ou9WwAWkFbBDtrYluijzdFLlSJKncehGww8dMC2w/x0=;
        b=Hnyaq/LKvhZM/EKzekX5YSmsHEXZ3ljx4AOYZpCfiB93sB78CW7pg/LUbNu5O6Bvwm
         bymCasDP5Wb/YXLLb6lS2XoDzlde1E56LHJE0cQzs32wZf+dmoz7MOEIUDjhIYevFm1x
         bT1hYikM/sxsIT1n2rVzU6S7hQHFNSFmUKBh16gIPxouratKR5E/yYiqsEiyMS6meF7p
         Mh9SkKC6D1uwRjUWSGVkCPGRF66qutd+dCZvGgQmWXkk3Crof/XTE59SxvlDO1W14npp
         J25BhDav38hu4AD0W5sIcJezoBmlg3guIdNhdYCK565lpBx1WhbRXYF/LWKl+sJmXas9
         39bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=igpFT2JU;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b9ee1si47558751cf.118.2024.12.06.03.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:24:14 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=igpFT2JU;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733484254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFWn0G2Z/v7JVK2itFan8SiYF0Cp3PsLypgq8Fk6Lqk=;
	b=igpFT2JUg6csrUxAfD/dH4VQqC3WzF8fiHh0DGg3gn9p+bsY4ggUARlGbCsdzoGbZTKzON
	EfOdKu79YrQwGNzukB+Kbcrq/EX99UAourCve+YaQ42Y2AIgD92Qfg0cL/LssurD7qdW0O
	uGRPczyTcSJ9yqTdtohK6Lb+I0szunA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-GdQTn2BbMV65ulZhsKL94A-1; Fri,
 06 Dec 2024 06:24:10 -0500
X-MC-Unique: GdQTn2BbMV65ulZhsKL94A-1
X-Mimecast-MFC-AGG-ID: GdQTn2BbMV65ulZhsKL94A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3686E1955F40;
	Fri,  6 Dec 2024 11:24:09 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BC7FC19560A2;
	Fri,  6 Dec 2024 11:24:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
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
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFCv2 17/20] arm/kvm: write back modified ID regs to KVM
Date: Fri,  6 Dec 2024 12:22:10 +0100
Message-ID: <20241206112213.88394-18-cohuck@redhat.com>
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 5jTAKaQXXlZR

From: Eric Auger <eric.auger@redhat.com>

We want to give a chance to override the value of host ID regs.
In a previous patch we made sure all their values could be fetched
through kvm_get_one_reg() calls before their modification. After
their potential modification we need to make sure we write back
the values through kvm_set_one_reg() calls.

Make sure the cpreg_list is modified with updated values and
transfer those values back to kvm.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c        | 36 +++++++++++++++++++++++++++++++++++-
 target/arm/trace-events |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4bb8094e846f..3b2f98041484 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1061,6 +1061,31 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
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
@@ -2028,7 +2053,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
index 0df3bfafffcc..668acf94ab60 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -14,3 +14,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
 get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu gost value for %s is 0x%"PRIx64
+kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
-- 
2.47.0
