Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1948148njb;
        Thu, 15 May 2025 08:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVe/oMI0zoYLxQDL8Qd5+ZR7xTi4jjual/8VzD7mOgq8NM3d1BptpCCH4SsFdXjvqCTqBXFiab6BCEd8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEPxyVdEM+2tJuT42RuXDe95QL9wZczE91vdYsxfz6PTdyuMJUgeeXClg8N6dxHgKfsnNyx
X-Received: by 2002:a05:6000:240e:b0:3a1:fc91:f784 with SMTP id ffacd0b85a97d-3a35c851fc6mr234987f8f.53.1747323666023;
        Thu, 15 May 2025 08:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747323666; cv=none;
        d=google.com; s=arc-20240605;
        b=IpOp92l4bgoRzYBzjhIIOXW+Btwg02Pw/JzRXtgFVOHd0V+seYgi8cyyFK4Zxbpm3k
         wHaa6eUo1Npa+LNSuhjoIrjOjgMnBcB9NYlDMVF4nXXNIJcGPHv93ZFaF3g/Fw84IB3B
         Qkk6SvZUsMSPDcfFZb5AXmFqFifTgIzdFmrxeaihP1IxMJ6KfmHMG0H+GmI1f0vHKgUp
         xLEoY7YI6V57xiZnucPl2GDHK2pbYVOoNZMHAkxqYlPD/lo66cCsQbNFK7BoMZu1gw6C
         XTID/M/rhYOjXJWAwhYwbOvnwa02I2/NtoI3OPbCkM2LPpcJ6OVN7orNGSMh+/8jrD4Y
         i1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ujhpAeNbvkPuTAuN/7tsjfNaVw5JmoHfwuVyChSTibM=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=WVDnrPP1nKJdnT6gYvfE8f0dG7OKqSgKghNbIqw+0mpI858lnY3ppxMapNBsW2H4Wz
         CLrbdCgDuAseT6zZn64/t1cl/rFoaiA5tvTcTrl/t3Usc5pjHmUIQaW43ejIoooBkAuw
         k5s4Dp+GTdQk8M9HlGDstT4mczA7a6WI6+wLGIMGGDRpow9DAALAlFuReyF/BL1pUCgd
         Y9XeusYizHeTT4J7nUvPFtk0ikdiBElkv7c1kO8pjYwwfEoSsNcArk4jfdDcebqyYeqb
         0yTGxNYD1hUE2HV9BxdWUjO+7cfCSc1VLjO7ROKdakfg3ECtfNoUB+0DVTPizfiJUZlL
         Yw+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VUKn6DZs;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a35b44f52csi664451f8f.376.2025.05.15.08.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VUKn6DZs;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747323664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujhpAeNbvkPuTAuN/7tsjfNaVw5JmoHfwuVyChSTibM=;
	b=VUKn6DZsrrKHbgfPMqJpUkMx93amJHECCDiK/CUsheK6nfAaEsWiDrT24IlnF3ZHbABpH3
	LQecgn/iWPme7jeKddmvkNJqtcWBSWe7qIntPG0U70brCgd6trFuplcJOMLgNSOgI2pDn5
	TEQMU/gQqAUz7hHa+f9BlqA4TjVuPbI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-pouvp3yCOLKtFsmVIGFRug-1; Thu,
 15 May 2025 11:41:02 -0400
X-MC-Unique: pouvp3yCOLKtFsmVIGFRug-1
X-Mimecast-MFC-AGG-ID: pouvp3yCOLKtFsmVIGFRug_1747323660
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B473180045C;
	Thu, 15 May 2025 15:41:00 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.45.225.145])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1EC3C1956066;
	Thu, 15 May 2025 15:40:53 +0000 (UTC)
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
Subject: [PATCH v7 14/14] arm/kvm: use fd instead of fdarray[2]
Date: Thu, 15 May 2025 17:39:07 +0200
Message-ID: <20250515153907.151174-15-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-1-cohuck@redhat.com>
References: <20250515153907.151174-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: FQr8b/WbTEO9

We have fd, so might as well neaten things up.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6c665334658b..a954a08a0fc3 100644
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
