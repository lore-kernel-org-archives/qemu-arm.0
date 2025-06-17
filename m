Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2602678njc;
        Tue, 17 Jun 2025 08:41:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWCX1Xy6h6yiKAYiaa7Zkzl/jvtT+uHQ513n2wTJypjidy58Zj83FJSajHcUV7k8MXrItB2bjfuW19UA==@linaro.org
X-Google-Smtp-Source: AGHT+IE8tlYrq6EVZEygvn42hRDi/xh0L1G9+blrCZEUSA4gwhLUt4bjrK7r4JJ3c65DIAb2QHyF
X-Received: by 2002:a17:903:440f:b0:235:60e:3704 with SMTP id d9443c01a7336-2366b32ccafmr219118725ad.12.1750174882972;
        Tue, 17 Jun 2025 08:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750174882; cv=none;
        d=google.com; s=arc-20240605;
        b=AFgz+GpGqiMPl5hAwRD2b/STdaU0OfaVsk5JDOMX3Rfh7+7ZRTYpqZFpccXjaiTjPb
         VawGqyklBl8lnccn2zS6nEky0SkJvM5GAZZY68KohHGfq5NdKfXOKEa6mx4/6UzcRIbQ
         VO/RA1dfUBH4Qfv4J1B5U/t9IKLLrhSwylkv+B7XODc3vZpuoGcKaMbntTRbWalRmXwl
         lhWAUSjWfmtILmiakBfgpjiEkyw+mM9RvTKD7v/JDfdnbA5H6xzaEmB8SvULczQ6B2rK
         BBt1Ju3CwRPJOT7QZsNejpqMP0uT/uI3P+xc/wxlsukfNOGEh/jvCxzOSbo1riwbUZlP
         8Kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aSFgDrP9kHSG5CJCRypPsuwvrYcuRcBe7vg+Zrvp1qY=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=hihx2443TNl8f3qJdQgnbuNyjTRJXJsDRNxLE0tY4JJAIP/+t5NrbYngoeWineA+HP
         SuOkiEmwcuDOerEZUFb9MmwHA0ZWv6/x4PMMfkXX/CrKn9A1QhVmHFSvqEehy1OqzJZO
         KZpejluqgGa23WTT0bR2mNRO5HVClc5OHP3KHrarZdilLNzIrxx/9Xie13aMq9nimqkX
         GGjnHTWIqADVJvOMFqPyOVTCMBPy8Ttg7Y6jXW/N+JhJ3LShWOvUsrcOYoEAtXBkzGlF
         CcnWrzlx6AGESJ390lUo9DaMjmrPm52ZXRV65M5IH9WL6sLdp6AQbWmSictLYVSNVDXC
         3ypg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=epFXIAGC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-2365de6401fsi132824735ad.198.2025.06.17.08.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=epFXIAGC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750174880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSFgDrP9kHSG5CJCRypPsuwvrYcuRcBe7vg+Zrvp1qY=;
	b=epFXIAGCPHNiFBjwWK9M9Ta4aLbVQuQmf/Und3M/n1mjfsiC7QC7GbITDAFB+7tVT900bS
	sGeGH/DBH6ryRvjWLIGkD7wM8XXo9yuC1iIqiCKpxinaGRKzpYCJlrWm7udfZCjaAho7ng
	f+2ufmMtVU2YEEYn/hBIy4fkQQLltuU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-4FPw8sDeNuyYaJs4eO6ETg-1; Tue,
 17 Jun 2025 11:41:16 -0400
X-MC-Unique: 4FPw8sDeNuyYaJs4eO6ETg-1
X-Mimecast-MFC-AGG-ID: 4FPw8sDeNuyYaJs4eO6ETg_1750174872
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0873B18001D6;
	Tue, 17 Jun 2025 15:41:12 +0000 (UTC)
Received: from gondolin.str.redhat.com (pixel-6a.str.redhat.com [10.33.192.205])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72300180035C;
	Tue, 17 Jun 2025 15:41:06 +0000 (UTC)
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
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v8 14/14] arm/kvm: use fd instead of fdarray[2]
Date: Tue, 17 Jun 2025 17:39:31 +0200
Message-ID: <20250617153931.1330449-15-cohuck@redhat.com>
In-Reply-To: <20250617153931.1330449-1-cohuck@redhat.com>
References: <20250617153931.1330449-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: Jn2VqtBYARfn

We have fd, so might as well neaten things up.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3df046b2b911..70919aedd0a4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -348,11 +348,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= get_host_cpu_reg(fd, ahcf, ID_ISAR6_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_MMFR4_EL1_IDX);
 
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr0,
+        err |= read_sys_reg32(fd, &ahcf->isar.mvfr0,
                               ARM64_SYS_REG(3, 0, 0, 3, 0));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr1,
+        err |= read_sys_reg32(fd, &ahcf->isar.mvfr1,
                               ARM64_SYS_REG(3, 0, 0, 3, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
+        err |= read_sys_reg32(fd, &ahcf->isar.mvfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= get_host_cpu_reg(fd, ahcf, ID_PFR2_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_DFR1_EL1_IDX);
@@ -390,7 +390,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
         if (pmu_supported) {
             /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+            err |= read_sys_reg64(fd, &ahcf->isar.reset_pmcr_el0,
                                   ARM64_SYS_REG(3, 3, 9, 12, 0));
         }
 
-- 
2.49.0
