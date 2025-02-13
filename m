Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp589983njc;
        Thu, 13 Feb 2025 05:51:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsAY0E/xHNQxnYl6DQ14/7zSOGLboZDoyZEtPZkoq5kcWVdS3p3iTg60NvVXSRHkvni0sB++OwTUoAjw==@linaro.org
X-Google-Smtp-Source: AGHT+IHo73WVbhvJpB/uKrU0uaWraV3bF/xF/MdVst/2hccRli1HOd5pZcjxWSljE17HlZ3h9yI5
X-Received: by 2002:a05:622a:1214:b0:471:ac04:db99 with SMTP id d75a77b69052e-471bed863e0mr60193571cf.30.1739454682567;
        Thu, 13 Feb 2025 05:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739454682; cv=none;
        d=google.com; s=arc-20240605;
        b=A5/+bSz5YqN35rT3QCH78qZ10a4VBu+Yb9HxoU6PyPJPPDOeC3upwH0qRZ9bBO7Wo0
         pS84GvahyySV0d635iIiaNb/CnzK+NsANkWwV/X7gRDeg9ulbDVOoUSMAq66s40rMmRj
         USZGs3gdkKwhoHy6gdyJYAFXcGLlllgJ4bopzbTg0Lpv7h3gqe1PuVnV7DYX0mlRYdKC
         Bx8idwz1pERlmmgaqx8NzfsVuQy7Y3wKKhoxOsitMLmrUlgn/uuLDNRDwAE6Vya/qL5M
         DRu5/gTmp4M8iK6beN6hKiA+ErDfFY/5i3VNYwv4vzY0AOrENyhtORTbJIFTo6rhd9YS
         Cc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v3Ka5DD552tfRB8O8dTkD7Lnt3ngyuMwpr7Jbz6905c=;
        fh=MnhyUl3vVgRMrTIm5urs1XY+2V00f3MxvY4hBV+jHPk=;
        b=hvC9k734HOgo2AruBxf36ieXNTpBZzIOWRZVM/5VGy9Tup9ozCycM3h9WYM/5lEQmn
         qvsdRDF0ljr3LuBGwUtmqozhqapCzJsN4fyfkgsLMfb+g1z/R6NFY4M+EpsEtbltM+Xq
         9XJkwdlWAhuej5AIbCCAeUuQRnbMhLStYt5sqg39Zd53nA0C3Nt7D9mqztKSftJO6uXe
         JZ3xU/pSWF1fg472hmBQFH6vW1iO5c8BhUI5FMUlaCU/zWeiQglTSko8bcZuzWNJV2k3
         qXj8TaAhMoxGVkx5Oa855STxy/Xw/T5S5yAxAn5u8OenA1yl/2U+dvw5tas+VGGIyvCS
         2H+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JeiuymzQ;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-471c29ed3a8si14761001cf.34.2025.02.13.05.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JeiuymzQ;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739454682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3Ka5DD552tfRB8O8dTkD7Lnt3ngyuMwpr7Jbz6905c=;
	b=JeiuymzQi/ZHB3PEhs2/rGWSCTlGVeACND2rpO2w64nADt9WAw+PyzLjv5w8c5WDotJl/i
	loG6GeuQNDSPDOUSiL92Ral7ELcU6c3WT1MvHk3Ffjqsy/B3aDN9Xfz8f7lfMXz+EWc3h6
	4pDF+++4ixcvd0lwvNvepKVCef/v0TY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-xfyzvp6MPJ6Q6Up0RnLX5A-1; Thu,
 13 Feb 2025 08:51:19 -0500
X-MC-Unique: xfyzvp6MPJ6Q6Up0RnLX5A-1
X-Mimecast-MFC-AGG-ID: xfyzvp6MPJ6Q6Up0RnLX5A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCB0618E6952;
	Thu, 13 Feb 2025 13:51:15 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.45.242.15])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7175D300018D;
	Thu, 13 Feb 2025 13:51:05 +0000 (UTC)
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
Subject: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer Authentication) details
Date: Thu, 13 Feb 2025 14:50:30 +0100
Message-ID: <20250213135032.2987289-3-kchamart@redhat.com>
In-Reply-To: <20250213135032.2987289-1-kchamart@redhat.com>
References: <20250213135032.2987289-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: VXV/KdEOe7tD

PAuth (Pointer Authentication), a security feature in software, is
relevant for both KVM and QEMU.  Relect this fact into the docs:

  - For KVM, `pauth` is a binary, "on" vs "off" option.  The host CPU
    will choose the cryptographic algorithm.

  - For TCG, however, along with `pauth`, a couple of properties can be
    controlled -- they're are related to cryptographic algorithm choice.

Thanks to Peter Maydell and Marc Zyngier for explaining more about PAuth
on IRC (#qemu, OFTC).

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
v2: address Marc Zyngier's comments:
    https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg03451.html
---
 docs/system/arm/cpu-features.rst | 46 +++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a596316384..94d260b573 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -204,11 +204,49 @@ the list of KVM vCPU features and their descriptions.
   the guest scheduler behavior and/or be exposed to the guest
   userspace.
 
-TCG vCPU Features
-=================
+"PAuth" (Pointer Authentication)
+================================
+
+PAuth (Pointer Authentication) is a security feature in software that
+was introduced in Armv8.3-A.  It aims to protect against ROP
+(return-oriented programming) attacks.
+
+KVM
+---
+
+``pauth``
+
+  Enable or disable ``FEAT_Pauth``.  No other properties can be
+  controlled.
+
+  The host CPU will define the PAC (pointer authentication
+  code) cryptographic algorithm.
+
+  There are different "levels" of PAuth support.  The host CPU
+  definition will define that level (e.g. PAuth, EPAC, PAuth2, FPAC,
+  FPACCOMBINE, etc).  Refer to the Arm architecture extension documents
+  for details about the description of these features.
+
+Live migration and PAuth
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+The level of PAuth support depends on which Arm architecture a given CPU
+supports (e.g. Armv8.3 vs. Armv8.6).  This gradation in PAuth support
+has implications for live migration.  For example, to be able to
+live-migrate from host-A (with Armv8.3) to host-B (with Arm v8.6):
+
+  - the source and destination hosts must "agree" on (a) the PAC
+    signature algorithm, and (b) all the sub-features of PAuth; or
+
+  - the alternative (and less desirable) option is to turn off PAuth
+    off on both source and destination — this is generally not
+    recommended, as PAuth is a security feature.
+
+TCG
+---
 
-TCG vCPU features are CPU features that are specific to TCG.
-Below is the list of TCG vCPU features and their descriptions.
+For TCG, along with ``pauth``, it is possible to control a few other
+properties of PAuth:
 
 ``pauth``
   Enable or disable ``FEAT_Pauth`` entirely.
-- 
2.48.1
