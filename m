Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp156107njb;
        Mon, 17 Feb 2025 08:38:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuOaV2LFBkaZuf3pMJu8s2C6EJ0EsG739eUGyY8tAPwhmfhHA0FrTU2wNG/u0E45DgvdkaHxjIplsllw==@linaro.org
X-Google-Smtp-Source: AGHT+IHuXyUNWmqcHEfbr9QAxvIQpLtdrDHLLAWGOnWQwqURDiu+S1Krj+R+8VuNQDMS4F+4BwMF
X-Received: by 2002:a05:620a:488b:b0:7c0:ab10:1132 with SMTP id af79cd13be357-7c0ab101287mr74294385a.38.1739810297143;
        Mon, 17 Feb 2025 08:38:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810297; cv=none;
        d=google.com; s=arc-20240605;
        b=ToRT2MXNaiVxNLVdBSqMZEr1HnMkTsclwOUrvDTXrZ7XnEGTRxwLDB4RgoQU9VQPui
         Nuj4yD9bWyBItMDQQLyZo/Kn2AcInlaK0KH8eFVxWoreyTr7N6mQNrBQ08CWSTSoXl50
         Ye1TIEQxC1bbVp8YWaODb/ReF1x90TzmIoPBheC6lvAl5QrB9r9gNdE58V7cUnzztqWB
         19kUjCWk/OxEsEOet6LdAHoxhMSPIdgGsKyVS9jgyZdu/XIXLooPYRxT8O8/Z8roDsSx
         UskUjpxGwQGGtxHsU1Zdv8DYq1nOfAF7kYNVFmDxaewZgDIkZlzlFJV8uTkQQJacH8u5
         Uh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i61uZKOUpSCeJlTNk3nSmeaPm5pItDiwyvp2HBiI56Y=;
        fh=8HFrK9WzRn1Htl2sMAazRSSdLKGd+QwHnTTYiDgfI2w=;
        b=HCFe1woMrlYxSgq6DnRWvkNYQzhQ0WzOI5mjyjjhJZvuAqhtkGov6rs0mGOM71DWh+
         pIHB0ByYTmNDuX0d0bQjK3ZwebJdbpDI+M6AZarONWjwC0Cq7ZRphF/EwFPah8ARwjCa
         qkizY0gtJrntGeEi8bWz/JOtETngzj5pIvlDJg4pYMb1CMeefn3H0vPj+iHBOPZTUvsd
         HWBr7+M3jBxJErmEBn+SaKTD4IQSTQ4LBnOihesTHCC2mTwI620Y/DMxVucxfaew7MgT
         P11nv57gWrT4UPwOnOd44CEMd+1HuHBSSQl+2kdyXcIRxTwb9EteYz+FhYYpzTgLoMht
         co8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVIr4I89;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c09a0e2f64si274127585a.493.2025.02.17.08.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:38:17 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVIr4I89;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739810296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i61uZKOUpSCeJlTNk3nSmeaPm5pItDiwyvp2HBiI56Y=;
	b=KVIr4I89kSczhvUDLO2w7MwQYZeYIhkkUDrrraj6bCiifLvzsaZL9MzQcRWVUuYet+wL8G
	+bkEVCZWTcjscYo40yeU8hfu8pq1/F2zbu4XR0KAXtQOUHuYICO0tvTyFpYxfOOuP99QpH
	iKmhqnKvA6pS051YZrYu7/UDk0R+5jA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-D3E4VVlIOtaP1ZQ91JkFLA-1; Mon,
 17 Feb 2025 11:38:12 -0500
X-MC-Unique: D3E4VVlIOtaP1ZQ91JkFLA-1
X-Mimecast-MFC-AGG-ID: D3E4VVlIOtaP1ZQ91JkFLA_1739810290
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 265A0190F9ED;
	Mon, 17 Feb 2025 16:38:02 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 545C219560AB;
	Mon, 17 Feb 2025 16:37:49 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	sebott@redhat.com,
	maz@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Eric Auger <eric.auger@redhat.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Yi Liu <yi.l.liu@intel.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v2 1/3] docs/cpu-features: Consistently use vCPU instead of VCPU
Date: Mon, 17 Feb 2025 22:07:27 +0530
Message-ID: <20250217163732.3718617-2-kchamart@redhat.com>
In-Reply-To: <20250217163732.3718617-1-kchamart@redhat.com>
References: <20250217163732.3718617-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 8HBcEtDjQHfJ

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/system/arm/cpu-features.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 37d5dfd15b..a596316384 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -27,7 +27,7 @@ disabled, enables the optional AArch32 CPU feature, is only supported
 when using the KVM accelerator and when running on a host CPU type that
 supports the feature.  While ``aarch64`` currently only works with KVM,
 it could work with TCG.  CPU features that are specific to KVM are
-prefixed with "kvm-" and are described in "KVM VCPU Features".
+prefixed with "kvm-" and are described in "KVM vCPU Features".
 
 CPU Feature Probing
 ===================
@@ -167,22 +167,22 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
 properties have special semantics (see "SVE CPU Property Parsing
 Semantics").
 
-KVM VCPU Features
+KVM vCPU Features
 =================
 
-KVM VCPU features are CPU features that are specific to KVM, such as
+KVM vCPU features are CPU features that are specific to KVM, such as
 paravirt features or features that enable CPU virtualization extensions.
 The features' CPU properties are only available when KVM is enabled and
-are named with the prefix "kvm-".  KVM VCPU features may be probed,
+are named with the prefix "kvm-".  KVM vCPU features may be probed,
 enabled, and disabled in the same way as other CPU features.  Below is
-the list of KVM VCPU features and their descriptions.
+the list of KVM vCPU features and their descriptions.
 
 ``kvm-no-adjvtime``
   By default kvm-no-adjvtime is disabled.  This means that by default
   the virtual time adjustment is enabled (vtime is not *not* adjusted).
 
   When virtual time adjustment is enabled each time the VM transitions
-  back to running state the VCPU's virtual counter is updated to
+  back to running state the vCPU's virtual counter is updated to
   ensure stopped time is not counted.  This avoids time jumps
   surprising guest OSes and applications, as long as they use the
   virtual counter for timekeeping.  However it has the side effect of
@@ -200,15 +200,15 @@ the list of KVM VCPU features and their descriptions.
 
   When kvm-steal-time is enabled a 64-bit guest can account for time
   its CPUs were not running due to the host not scheduling the
-  corresponding VCPU threads.  The accounting statistics may influence
+  corresponding vCPU threads.  The accounting statistics may influence
   the guest scheduler behavior and/or be exposed to the guest
   userspace.
 
-TCG VCPU Features
+TCG vCPU Features
 =================
 
-TCG VCPU features are CPU features that are specific to TCG.
-Below is the list of TCG VCPU features and their descriptions.
+TCG vCPU features are CPU features that are specific to TCG.
+Below is the list of TCG vCPU features and their descriptions.
 
 ``pauth``
   Enable or disable ``FEAT_Pauth`` entirely.
-- 
2.48.1
