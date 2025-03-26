Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3483398njc;
        Wed, 26 Mar 2025 10:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi8/pgzxyfyNs+XIw0dvGOjrPBXNd65h8PHzzj1T0tywQYV+ugZlEwmY52iP3D/4j3pd3bC+d+evvvFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1xPsskMST3cshC09d8AJRstTQiQ2Ne0bJUNHtvi00tfTrWAh3mkAtXrVQoPY3uJs6Ti0r
X-Received: by 2002:a05:622a:996:b0:476:b82b:ac91 with SMTP id d75a77b69052e-4776e255ed5mr10418421cf.49.1743010889296;
        Wed, 26 Mar 2025 10:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743010889; cv=none;
        d=google.com; s=arc-20240605;
        b=hZy2jmvXdztR5MgrqgAeqrBiuX6Lenu9rRqnui2qa12iMcuVMEDKDfHT3iC8EWrRE3
         w1lCkDDps3B6Dahj5bg2bAyFuVtniR3J5cIakzo7A2egTh8oMQuEPwNxUriGvbGv40lr
         ip+J3+d3zsjb0YTjqMKhe9K4Li/hf9waizQWxKSljt+23zC15euStwBoutluxmA9cHEH
         oU9iwkD+lCmt+kIITAKlmBRc/pPlxuYXhTNFSMTracrxdVvS0Rj78byIzVlKzsKxcNoe
         zyiNaMBEFjHL8OdCxfnHyLNS/ourFlrxV9JJLDxXe/Fwv+UQLR9PssZTS1ZWWnL1dCHd
         pJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ekskBF5GBKj4mH3h42hATvRtDb2eBG485Gn9iKgB1aU=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=c5Qa+buvT4QHlg4QVXnBhhAyIu3aVJRoG5YkGsf0+bwXlU+/uUwjds0B0PyIDPOEoj
         725WDf6k251KrVAR+Mv3dJQpPhMnJU4JT0f9mIHxAN8E/RmDf4EAkP3gLXwlU7CFHxcT
         9gvucKaF6DPPu0JrBFOd15kVHRNjWFcLRhsZ7nzRT3JdCXcPzS/AnpxoDsF7GeAS1hJU
         5efXNYrnyEPtXhJPoz1sjw4WjqiZCUv5z92Uvp32GBL6auEHt1oRAZW/dLBfXaD0AY+Q
         3Zc3oug/rDDH1s3M0V37q3bfBqts/hcR3pdyCHyMdyRp+jFGEgy4CCcXyFXtkvMaW2F5
         XYSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P7UsGv6M;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d180479si128265351cf.165.2025.03.26.10.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P7UsGv6M;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743010889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekskBF5GBKj4mH3h42hATvRtDb2eBG485Gn9iKgB1aU=;
	b=P7UsGv6MIM5dSz27kbokHhFw4p0ne3TMbC0tmMoQNYzS8quOs8I3zaiV6cPIm4rXbNnHky
	xxbJobp+gPEPK8MXNop8ptjB6f5jpz79DYu7XmBo/h1WyJ6YKEvCH4FPrz1345wpsYxcei
	FKT7+1qi38snoQI00UtIlHaqkvrwZ+g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-WAJJEppKPFWVHOQxz4CdVg-1; Wed,
 26 Mar 2025 13:41:23 -0400
X-MC-Unique: WAJJEppKPFWVHOQxz4CdVg-1
X-Mimecast-MFC-AGG-ID: WAJJEppKPFWVHOQxz4CdVg_1743010881
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74999196D2DC;
	Wed, 26 Mar 2025 17:41:21 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 12D10180B489;
	Wed, 26 Mar 2025 17:41:06 +0000 (UTC)
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
Subject: [PATCH for-10.1 v4 13/13] arm/cpu: switch to a generated cpu-sysregs.h.inc
Date: Wed, 26 Mar 2025 18:37:23 +0100
Message-ID: <20250326173723.389988-14-cohuck@redhat.com>
In-Reply-To: <20250326173723.389988-1-cohuck@redhat.com>
References: <20250326173723.389988-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: N0Zu4VxY18Ww

Generated against Linux 6.14-rc1.

Reviewed-by: Sebastian Ott <sebott@redhat.com>
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
2.48.1
