Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1980648njc;
        Tue, 11 Mar 2025 09:32:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdIrbGH09GibI2Dc+3f4oowk8YRqUs6lExHXxyMA65jCNMQWKWLGSaXa3JuGxa+5/T0FfuW/nBio/fIg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZPfi2V+oNOqNFbgOSLYDU7gU9MiDFkGYiW6gs7DbwjitpaqHx15otMHO9sk0YE+2JoWf2
X-Received: by 2002:a05:620a:1712:b0:7a8:554:c368 with SMTP id af79cd13be357-7c55eeb55a1mr595753385a.6.1741710767117;
        Tue, 11 Mar 2025 09:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741710767; cv=none;
        d=google.com; s=arc-20240605;
        b=iFjgKOGVacWO0jQX2P5MWHNYWudG6eHY9iQASYCbAeuqvXmY9ktUL0mlZ7GJI0i3Ug
         UfBY75uxF5Z5W2XhsFkxcK7BNHl6aCq7r0dOFP6UbXIckipOfblC7KH613Jr0uJjgimi
         8X0C4N3gVfNq4ruQNdvysCJRMTnDwsxTbnPyUFQLzt4oMf1bFjEtS1MXhJvnXqIf65dE
         tlaG34KMBrHNa7kCvu9axVSGNnCo6CKKjmWZWGacai+Af6wwPcYa4bcHuSGFq1zHhsFV
         7FXRECJ+9t0Py56/VKyjoeua2iRHJFaOz6TRDGiyJ1Jdw64sCY5v5coDntHA/IjnXzDe
         ew7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MUiBjS3COnwmRwZzukNCDF0MQ4HGMsvyipVhCLvdRu8=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=lW5mm2kYB4G+1lgI/84i88HqH+OkguYQI+D0u0ahi23bklhmRU5W0c1M/K+gUB3blv
         7oFPiFIf1dPfB/nG1KXjajOylzW0iBh+puvdXNSjJzae9jEhwynyijiZqbL8RukkTMF4
         64mXfkmxJiMXeuPaKKi7ZuinfkqyagytMABwrfLDRP98XUQ9MekCA0XU2ljwKqrHNcVo
         ifDYslNC2AHiSTwZjcasROS6FwIe9EmrsXXDXCkP+UxZ3TDJie5sRAp/N+KT1JSdz/HQ
         jlwinDu1M0HiwzadhvU3cmFr2WJ+U+y3GImi7euFGXdwI1JlQ1RoOBvcIScCa67Pu0Tm
         /elA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PrItRKFF;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e533c5c8si1164724185a.58.2025.03.11.09.32.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PrItRKFF;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741710766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUiBjS3COnwmRwZzukNCDF0MQ4HGMsvyipVhCLvdRu8=;
	b=PrItRKFF0F5WKyLFmP29EUozx5Dk1h/Clu9mREnZmBD0N0OxHPsJqb/Sm/6FsgXObSGgCa
	0wPywD59U/d17UbVxTAtwReYUPM1XFK/t6iWyM467qp0gS9k1gpBgX4qgpQHBGy1mktT1T
	UV2zZmIsQ/8OZPIEl1W0hF+sXDD/L04=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-jpkppMDMMtiL7FEpZ6ojpw-1; Tue,
 11 Mar 2025 12:32:43 -0400
X-MC-Unique: jpkppMDMMtiL7FEpZ6ojpw-1
X-Mimecast-MFC-AGG-ID: jpkppMDMMtiL7FEpZ6ojpw_1741710761
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E01D51809CA3;
	Tue, 11 Mar 2025 16:32:40 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.185])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C07C1800373;
	Tue, 11 Mar 2025 16:32:25 +0000 (UTC)
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
Subject: [PATCH v3 14/14] arm/cpu: switch to a generated cpu-sysregs.h.inc
Date: Tue, 11 Mar 2025 17:28:24 +0100
Message-ID: <20250311162824.199721-15-cohuck@redhat.com>
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: xeVNajwtZaG/

Generated against Linux 6.14-rc1.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h.inc | 161 ++++++++++++++++++++++++++++++++---
 1 file changed, 148 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 6c9f9981cc5d..a3829f40d3da 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -1,18 +1,14 @@
-DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
-DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
-DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
-DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
-DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
-DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
-DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
-DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
-DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
-DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
-DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
-DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
+
+DEF(OSDTRRX_EL1, 2, 0, 0, 0, 2)
+DEF(MDCCINT_EL1, 2, 0, 0, 2, 0)
+DEF(MDSCR_EL1, 2, 0, 0, 2, 2)
+DEF(OSDTRTX_EL1, 2, 0, 0, 3, 2)
+DEF(OSECCR_EL1, 2, 0, 0, 6, 2)
+DEF(OSLAR_EL1, 2, 0, 1, 0, 4)
 DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
 DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
 DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
+DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)
 DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
 DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
 DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
@@ -23,13 +19,152 @@ DEF(ID_ISAR2_EL1, 3, 0, 0, 2, 2)
 DEF(ID_ISAR3_EL1, 3, 0, 0, 2, 3)
 DEF(ID_ISAR4_EL1, 3, 0, 0, 2, 4)
 DEF(ID_ISAR5_EL1, 3, 0, 0, 2, 5)
-DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
 DEF(ID_ISAR6_EL1, 3, 0, 0, 2, 7)
+DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
 DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
 DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
 DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
 DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
 DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
 DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
+DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
+DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
+DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
+DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
+DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
+DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
+DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
+DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
+DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
+DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
+DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
+DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
+DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
+DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
+DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
+DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
+DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
+DEF(ID_AA64MMFR4_EL1, 3, 0, 0, 7, 4)
+DEF(SCTLR_EL1, 3, 0, 1, 0, 0)
+DEF(CPACR_EL1, 3, 0, 1, 0, 2)
+DEF(TRFCR_EL1, 3, 0, 1, 2, 1)
+DEF(SMPRI_EL1, 3, 0, 1, 2, 4)
+DEF(ZCR_EL1, 3, 0, 1, 2, 0)
+DEF(SMCR_EL1, 3, 0, 1, 2, 6)
+DEF(GCSCR_EL1, 3, 0, 2, 5, 0)
+DEF(GCSPR_EL1, 3, 0, 2, 5, 1)
+DEF(GCSCRE0_EL1, 3, 0, 2, 5, 2)
+DEF(ALLINT, 3, 0, 4, 3, 0)
+DEF(FAR_EL1, 3, 0, 6, 0, 0)
+DEF(PMICNTR_EL0, 3, 3, 9, 4, 0)
+DEF(PMICFILTR_EL0, 3, 3, 9, 6, 0)
+DEF(PMSCR_EL1, 3, 0, 9, 9, 0)
+DEF(PMSNEVFR_EL1, 3, 0, 9, 9, 1)
+DEF(PMSICR_EL1, 3, 0, 9, 9, 2)
+DEF(PMSIRR_EL1, 3, 0, 9, 9, 3)
+DEF(PMSFCR_EL1, 3, 0, 9, 9, 4)
+DEF(PMSEVFR_EL1, 3, 0, 9, 9, 5)
+DEF(PMSLATFR_EL1, 3, 0, 9, 9, 6)
+DEF(PMSIDR_EL1, 3, 0, 9, 9, 7)
+DEF(PMBLIMITR_EL1, 3, 0, 9, 10, 0)
+DEF(PMBPTR_EL1, 3, 0, 9, 10, 1)
+DEF(PMBSR_EL1, 3, 0, 9, 10, 3)
+DEF(PMBIDR_EL1, 3, 0, 9, 10, 7)
+DEF(PMUACR_EL1, 3, 0, 9, 14, 4)
+DEF(PMSELR_EL0, 3, 3, 9, 12, 5)
+DEF(CONTEXTIDR_EL1, 3, 0, 13, 0, 1)
+DEF(RCWSMASK_EL1, 3, 0, 13, 0, 3)
+DEF(TPIDR_EL1, 3, 0, 13, 0, 4)
+DEF(RCWMASK_EL1, 3, 0, 13, 0, 6)
+DEF(SCXTNUM_EL1, 3, 0, 13, 0, 7)
+DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
+DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
+DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
+DEF(GMID_EL1, 3, 1, 0, 0, 4)
+DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
+DEF(CSSELR_EL1, 3, 2, 0, 0, 0)
 DEF(CTR_EL0, 3, 3, 0, 0, 1)
+DEF(DCZID_EL0, 3, 3, 0, 0, 7)
+DEF(GCSPR_EL0, 3, 3, 2, 5, 1)
+DEF(SVCR, 3, 3, 4, 2, 2)
+DEF(FPMR, 3, 3, 4, 4, 2)
+DEF(MDCR_EL2, 3, 4, 1, 1, 1)
+DEF(HFGRTR_EL2, 3, 4, 1, 1, 4)
+DEF(HFGWTR_EL2, 3, 4, 1, 1, 5)
+DEF(HFGITR_EL2, 3, 4, 1, 1, 6)
+DEF(TRFCR_EL2, 3, 4, 1, 2, 1)
+DEF(HDFGRTR_EL2, 3, 4, 3, 1, 4)
+DEF(HDFGWTR_EL2, 3, 4, 3, 1, 5)
+DEF(HAFGRTR_EL2, 3, 4, 3, 1, 6)
+DEF(ZCR_EL2, 3, 4, 1, 2, 0)
+DEF(HCRX_EL2, 3, 4, 1, 2, 2)
+DEF(SMPRIMAP_EL2, 3, 4, 1, 2, 5)
+DEF(SMCR_EL2, 3, 4, 1, 2, 6)
+DEF(GCSCR_EL2, 3, 4, 2, 5, 0)
+DEF(GCSPR_EL2, 3, 4, 2, 5, 1)
+DEF(DACR32_EL2, 3, 4, 3, 0, 0)
+DEF(FAR_EL2, 3, 4, 6, 0, 0)
+DEF(PMSCR_EL2, 3, 4, 9, 9, 0)
+DEF(MPAMHCR_EL2, 3, 4, 10, 4, 0)
+DEF(MPAMVPMV_EL2, 3, 4, 10, 4, 1)
+DEF(MPAM2_EL2, 3, 4, 10, 5, 0)
+DEF(MPAMVPM0_EL2, 3, 4, 10, 6, 0)
+DEF(MPAMVPM1_EL2, 3, 4, 10, 6, 1)
+DEF(MPAMVPM2_EL2, 3, 4, 10, 6, 2)
+DEF(MPAMVPM3_EL2, 3, 4, 10, 6, 3)
+DEF(MPAMVPM4_EL2, 3, 4, 10, 6, 4)
+DEF(MPAMVPM5_EL2, 3, 4, 10, 6, 5)
+DEF(MPAMVPM6_EL2, 3, 4, 10, 6, 6)
+DEF(MPAMVPM7_EL2, 3, 4, 10, 6, 7)
+DEF(CONTEXTIDR_EL2, 3, 4, 13, 0, 1)
+DEF(CNTPOFF_EL2, 3, 4, 14, 0, 6)
+DEF(CPACR_EL12, 3, 5, 1, 0, 2)
+DEF(ZCR_EL12, 3, 5, 1, 2, 0)
+DEF(TRFCR_EL12, 3, 5, 1, 2, 1)
+DEF(SMCR_EL12, 3, 5, 1, 2, 6)
+DEF(GCSCR_EL12, 3, 5, 2, 5, 0)
+DEF(GCSPR_EL12, 3, 5, 2, 5, 1)
+DEF(FAR_EL12, 3, 5, 6, 0, 0)
+DEF(MPAM1_EL12, 3, 5, 10, 5, 0)
+DEF(CONTEXTIDR_EL12, 3, 5, 13, 0, 1)
+DEF(TTBR0_EL1, 3, 0, 2, 0, 0)
+DEF(TTBR1_EL1, 3, 0, 2, 0, 1)
+DEF(TCR2_EL1, 3, 0, 2, 0, 3)
+DEF(TCR2_EL12, 3, 5, 2, 0, 3)
+DEF(TCR2_EL2, 3, 4, 2, 0, 3)
+DEF(MAIR2_EL1, 3, 0, 10, 2, 1)
+DEF(MAIR2_EL2, 3, 4, 10, 1, 1)
+DEF(AMAIR2_EL1, 3, 0, 10, 3, 1)
+DEF(AMAIR2_EL2, 3, 4, 10, 3, 1)
+DEF(PIRE0_EL1, 3, 0, 10, 2, 2)
+DEF(PIRE0_EL12, 3, 5, 10, 2, 2)
+DEF(PIRE0_EL2, 3, 4, 10, 2, 2)
+DEF(PIR_EL1, 3, 0, 10, 2, 3)
+DEF(PIR_EL12, 3, 5, 10, 2, 3)
+DEF(PIR_EL2, 3, 4, 10, 2, 3)
+DEF(POR_EL0, 3, 3, 10, 2, 4)
+DEF(POR_EL1, 3, 0, 10, 2, 4)
+DEF(POR_EL2, 3, 4, 10, 2, 4)
+DEF(POR_EL12, 3, 5, 10, 2, 4)
+DEF(S2POR_EL1, 3, 0, 10, 2, 5)
+DEF(S2PIR_EL2, 3, 4, 10, 2, 5)
+DEF(LORSA_EL1, 3, 0, 10, 4, 0)
+DEF(LOREA_EL1, 3, 0, 10, 4, 1)
+DEF(LORN_EL1, 3, 0, 10, 4, 2)
+DEF(LORC_EL1, 3, 0, 10, 4, 3)
+DEF(MPAMIDR_EL1, 3, 0, 10, 4, 4)
+DEF(LORID_EL1, 3, 0, 10, 4, 7)
+DEF(MPAM1_EL1, 3, 0, 10, 5, 0)
+DEF(MPAM0_EL1, 3, 0, 10, 5, 1)
+DEF(ISR_EL1, 3, 0, 12, 1, 0)
+DEF(ICC_NMIAR1_EL1, 3, 0, 12, 9, 5)
+DEF(TRBLIMITR_EL1, 3, 0, 9, 11, 0)
+DEF(TRBPTR_EL1, 3, 0, 9, 11, 1)
+DEF(TRBBASER_EL1, 3, 0, 9, 11, 2)
+DEF(TRBSR_EL1, 3, 0, 9, 11, 3)
+DEF(TRBMAR_EL1, 3, 0, 9, 11, 4)
+DEF(TRBTRG_EL1, 3, 0, 9, 11, 6)
+DEF(TRBIDR_EL1, 3, 0, 9, 11, 7)
+
-- 
2.48.1
