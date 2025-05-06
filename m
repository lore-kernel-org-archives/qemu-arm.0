Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2973887njj;
        Tue, 6 May 2025 01:54:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWR32s6TgYj5C53F0IWGXwbkDLjSSfcEibZPmLAhjrmUaF4zjbefiBwHLOqtUf9n0/Sb4cKo3fcHwFKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9I6bT+hQdFUth9hgYeIXgNSTs+kuWGWrP4one6DvRkMkseh4O+vcBKC4gRxEFtSU8dvnn
X-Received: by 2002:a05:6214:20a8:b0:6e6:6699:7e58 with SMTP id 6a1803df08f44-6f535889fa3mr28526596d6.1.1746521668127;
        Tue, 06 May 2025 01:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746521668; cv=none;
        d=google.com; s=arc-20240605;
        b=Uli3GCDOWl8l77VpfH/0T23VKASTEIoCr3LmwX0u8VQULB8GkTBsFZb2y0IlkuVAbd
         m5/pxC/YmqujZPEm0QLex+minCrCnZC1MqCgwiU47DDefwLKCJExW3lf3bEeBa9LbITn
         2CUsyKmvPOxTJzAUr2ggR1/44IET+1kk3yqdijPTZ0pVM3Ick1+HawX25GCBw/rl+fZW
         sFddh2hmUzOF6xMcFccBJN4AjAXi8l5/gNKN+1/6hgj15lyTdMgZlr3WAkMpR3ctLQ0/
         BxHNIJcYt4Z+3xpGw9r3nuI8pnONuWe2w6Y4ZaoT55YJVmzWLMBlXQtpZEdLBnttrWVn
         oRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wPvglNEukGQhD+Y5wPUIpn0NUeRZN0KH5RrHoWHnaGE=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=SAmLpRIg604AqWK6rg5Sb3M/SZP4wtP6tXqcDIfEgZhqaNEypyvIJ1nclgF/dz2SeB
         zsFBwt/eCykLq+6hu7F/ClGUBW+cfrrGAXViNymMg8/ZnAycVYedvEslcPuUHIXM+gHZ
         8a537khR8h/OrzZp5FWjCkCfKBjzrqfcbEpUaI1MFdyUnWTiXThjCJwppIBJ9MHtKV5f
         EjB89vGYzIcaLm449a9injpiTduV0rJh9x+2V2QNP5tiica7PDN+xQmCwdUHPAWbn4HQ
         r99UgEUGZu62FbO0teZWB5CyvFC3O+PHLZe2fF7UJNgMfyf7PHWHbrWMwjgWc+Ekb2jK
         UMBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TEQ9VBD4;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f3a9273si110678366d6.4.2025.05.06.01.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TEQ9VBD4;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746521667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPvglNEukGQhD+Y5wPUIpn0NUeRZN0KH5RrHoWHnaGE=;
	b=TEQ9VBD4fYTr29E7qDh+emKXxa0xWddRpFM6Oz8tYcpwLvknfrkJFA4X/sMRRsA4xMKrcO
	fLM3CiAOkfqoXhQv0TxuoPr1iH33lisW01YX+SIjaRBqP2wHcLzcmzqnnHuO/CNoMQ5zRV
	1kalRF1IKVUUTfQSqzsAbtTueSGZlV8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-0afWw-StMpm-_caYvSph6w-1; Tue,
 06 May 2025 04:54:23 -0400
X-MC-Unique: 0afWw-StMpm-_caYvSph6w-1
X-Mimecast-MFC-AGG-ID: 0afWw-StMpm-_caYvSph6w_1746521661
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B20F51955DC7;
	Tue,  6 May 2025 08:54:21 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30E631956094;
	Tue,  6 May 2025 08:54:14 +0000 (UTC)
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
Subject: [PATCH v6 14/14] arm/kvm: use fd instead of fdarray[2]
Date: Tue,  6 May 2025 10:52:34 +0200
Message-ID: <20250506085234.855779-15-cohuck@redhat.com>
In-Reply-To: <20250506085234.855779-1-cohuck@redhat.com>
References: <20250506085234.855779-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: vhTdqVUEhw/h

We have fd, so might as well neaten things up.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index abb63b7f617f..1ffd67a39056 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -387,11 +387,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
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
@@ -429,7 +429,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
         if (pmu_supported) {
             /* PMCR_EL0 is only accessible if the vCPU has feature PMU_V3 */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+            err |= read_sys_reg64(fd, &ahcf->isar.reset_pmcr_el0,
                                   ARM64_SYS_REG(3, 3, 9, 12, 0));
         }
 
-- 
2.49.0
