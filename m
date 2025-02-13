Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp589881njc;
        Thu, 13 Feb 2025 05:51:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUX+pkLZqN9/AMhNPKJRG6zakpxEjxZV9lameecXqRbtJDQ3IE6IDfjdZbXsV9nO61BOUcrGEJyLJPBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEvnWIE0q08AWc3bK08gdR/gsrNQA7Ru4e4On97UiIAkE9+WVa/0jrVv23l+XFApHdogowF
X-Received: by 2002:a05:6214:4011:b0:6d8:8b9d:1500 with SMTP id 6a1803df08f44-6e46edabd25mr149746266d6.36.1739454670921;
        Thu, 13 Feb 2025 05:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739454670; cv=none;
        d=google.com; s=arc-20240605;
        b=HzRwUp9J1/4UGW0rp389ngVVHCAuB3IAJ/bu9OGsOg6/x9A5p6v/LhSga12zWXXYrK
         EdsLqls0/FSkTyszP1Jr9JvBvoc7e2M6uk+TDyKIjBWsGeYrKZtU6eNtYPtRtt3nPr1+
         jDCtczddLoLLBN2yiptfpjwPdUE4i3DouPc7CfqVkhcwZxfgCftolDVddUJBxVa6cNY5
         a0puIlBQESYMY8L23VbtKLNNU3zLp91vvIaqwofQkIJkDP1Vl7CDdQ0eMh3NnxEvcaYA
         VC/4509XzfXs7x3Dl06WiWKdbv4JJ6O5Jimvb+DEkrOuxQfX9RYyAeATcd6dkGbuhODh
         um0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i61uZKOUpSCeJlTNk3nSmeaPm5pItDiwyvp2HBiI56Y=;
        fh=MnhyUl3vVgRMrTIm5urs1XY+2V00f3MxvY4hBV+jHPk=;
        b=Ghn4d5t5FAFnbL7e1/kzVI6MbT6jkVJnZDojyz3WuZSEI8S4HqW/gt9PiX2d7uj0ZX
         QuE99afY9F8c6b0+48ATfJItpU68jDB/pfhmHyoCcfZhfPQ6OI2NSIpT9Ua0Wx52Dcxv
         NosTamYbboa2JEXx8nTSkD0DJ3Hlk+ny+3yd+HDOMifoklfxW9BUvfpo4kPnZROEj6qF
         uFVn52lfLYvSbhvV3XhQlJjh+TkfaE2regmQPM2/7kyOmSYEuSLAnW9XIZ6DJcjmMXYM
         MF37f4HjbLCmMyDNZLHAbMTvFrLxZb9o3wCSSr3OqFCAkD9el0dpFNHrcvyni5Ovnrxo
         eWoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F6n8/UVn";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c5063si13541406d6.372.2025.02.13.05.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:51:10 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F6n8/UVn";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739454670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i61uZKOUpSCeJlTNk3nSmeaPm5pItDiwyvp2HBiI56Y=;
	b=F6n8/UVn7FEyVr0rGgnHqfzLo82q80qYm55AMGDOMePKj8hw57OSdXwfaBpz1fjR31nr0X
	sGJ3+ndocdrbuSKqilHsoeeLUnwwWdyri7jEbhjuekP6zzW2+J6u+nLisy/BJkschV0aIV
	Thu6PBMHAmkEZpL4zm3AflBSI9vYCQ0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-Uay8ptp2NqaZ5swOhTHFVw-1; Thu,
 13 Feb 2025 08:51:09 -0500
X-MC-Unique: Uay8ptp2NqaZ5swOhTHFVw-1
X-Mimecast-MFC-AGG-ID: Uay8ptp2NqaZ5swOhTHFVw_1739454666
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7288C1800992;
	Thu, 13 Feb 2025 13:51:04 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.45.242.15])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 928733000197;
	Thu, 13 Feb 2025 13:50:52 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: maz@kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Ninad Palsule <ninad@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yi Liu <yi.l.liu@intel.com>,
	Hao Wu <wuhaotsh@google.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	sebott@redhat.com,
	Steven Lee <steven_lee@aspeedtech.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Troy Lee <leetroy@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v2 1/3] docs/cpu-features: Consistently use vCPU instead of VCPU
Date: Thu, 13 Feb 2025 14:50:29 +0100
Message-ID: <20250213135032.2987289-2-kchamart@redhat.com>
In-Reply-To: <20250213135032.2987289-1-kchamart@redhat.com>
References: <20250213135032.2987289-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: SOO84Ar0Du4d

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
