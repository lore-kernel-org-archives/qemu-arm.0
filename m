Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1948095njb;
        Thu, 15 May 2025 08:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWka2B4BnVn4WUL2ZWLQg0hq84ftVoiC1r5eELL0pfC+/KsYS3mb+AZqVMkQ1OX4KOpcpbh8i69oSldMw==@linaro.org
X-Google-Smtp-Source: AGHT+IHCL1xDHUrmb2CtGvqnkp7xv7uqVAPljA898e+8ke3v90cqsk8wscWnCfGY492odmwQASi6
X-Received: by 2002:a05:6122:82a1:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-52dba96f21cmr124962e0c.10.1747323659796;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747323659; cv=none;
        d=google.com; s=arc-20240605;
        b=dizE/bRm9sgFLXc+NtAIxO3Jcx/M0axKNP/QZqXEYowC+C6NUA0IERjnPLjO9a9+TX
         oVs1DzNjCZWRMbysZhA48fsguWeUjfzZQAIjVSu1vQO+zrrmK2eAY5fmnh7Ox/t86JKO
         nOumvx9cCceqJZC9XW9F1Y5KN+6CS8TSsWFmEp1/T45RDmidA7ELc1QQWabcPMektF1S
         Or8v+vxsOqazpvJAfDyBkXAvfJUASjpUr8SNH+dbe5udxbW053jqDK8Wl+lUH1uSdO0D
         V1NIMhurFQp8RXseO9CNsKF//SVjiJHdTi4vyiHC/ci7N0H/Vp0gQEgzMBSqc1DPUHdG
         p/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=plSAewDgQSL23UnTCL/HSs7WUtFViES+dDu1i/h4tt4=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=kg1TFmh3Rj3CWVbo1SLX9FO8Uh+lVgcuV8v7KVTya/8Jl/sHHtXR1W1S2XrWdzhDDZ
         SBRSXWByGrVygiWfH99gpBkmyKxvSxhwkDrdcbtNd/MRg2kTrDCiicU28vXJNszIW+5e
         W0O2p7nlonxh9T0W2IRUQ3D7SbvLA9alFQ1Q/alOGDX3m9yYkFVAp74+VK+sTWXzlnsS
         XrRFsw/VrNzThEWnpXvXqEDidTlK1m2EgBHP043MJyhUHJyR1LqF00WWZooVinFBzTkX
         OpPBGfDvH6BvC5yolVkIlaSO4KGlPeLFLfTrmqvfb9msv6gtGwWCp2rnVCa3bX7LW/BQ
         XGgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMXe+meo;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-52dbaa42906si21152e0c.128.2025.05.15.08.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMXe+meo;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747323659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plSAewDgQSL23UnTCL/HSs7WUtFViES+dDu1i/h4tt4=;
	b=QMXe+meoTFEFFLGzW7jEJQXviEhODZHoNOUoUHHayGo5Up8/d6iXO0vgdjD1BXhB7JWdOh
	IYEoTn8h62R01iJnerFnakJEAZP7NTOj6sINFAtPCExjhqUHDhhdDz6nY0hkbOK4tTM5lX
	U0pbqbyQdedNxApDN8zODlDWPG5VXw8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-bO4MeJupMDG6zDvD2hMSHg-1; Thu,
 15 May 2025 11:40:55 -0400
X-MC-Unique: bO4MeJupMDG6zDvD2hMSHg-1
X-Mimecast-MFC-AGG-ID: bO4MeJupMDG6zDvD2hMSHg_1747323653
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C424195608E;
	Thu, 15 May 2025 15:40:53 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.45.225.145])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E3081956066;
	Thu, 15 May 2025 15:40:47 +0000 (UTC)
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
Subject: [PATCH v7 13/14] arm/cpu: switch to a generated cpu-sysregs.h.inc
Date: Thu, 15 May 2025 17:39:06 +0200
Message-ID: <20250515153907.151174-14-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-1-cohuck@redhat.com>
References: <20250515153907.151174-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: CdtIqF3sFEWe

Generated against Linux 6.14-rc1.

Reviewed-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h.inc | 43 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 6c9f9981cc5d..02aae133eb67 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -1,18 +1,8 @@
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
 DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
 DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
 DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
+DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)
 DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
 DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
 DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
@@ -23,13 +13,40 @@ DEF(ID_ISAR2_EL1, 3, 0, 0, 2, 2)
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
+DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
+DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
+DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
+DEF(GMID_EL1, 3, 1, 0, 0, 4)
+DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
+DEF(CSSELR_EL1, 3, 2, 0, 0, 0)
 DEF(CTR_EL0, 3, 3, 0, 0, 1)
+DEF(DCZID_EL0, 3, 3, 0, 0, 7)
+
-- 
2.49.0
