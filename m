Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp156147njb;
        Mon, 17 Feb 2025 08:38:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVPZeTk2+ruSQQNeoyywptxzFmuKuwaeHPCthF/0Uvs3BbwCC/APAg0jtKPvbVNLXz/+zTmZsMoUUdEnw==@linaro.org
X-Google-Smtp-Source: AGHT+IHlUS/jhMY81gRxbvLb/RZMmyOqSvEHF3NkxZjMRsbJmHW8qnwj6dQCc7gtQHHyq8kgqosa
X-Received: by 2002:a05:6214:20ad:b0:6e6:2395:7634 with SMTP id 6a1803df08f44-6e66ccdb1c9mr164772976d6.27.1739810302498;
        Mon, 17 Feb 2025 08:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810302; cv=none;
        d=google.com; s=arc-20240605;
        b=EBuURh5Rv5sSqgllyEA2JX6ZL1ImXhz2iG+f+Kdmb4mlekDD18q0WT2Lc/awDpGmGP
         L2yWNn3Ho02ATVFzdWD28pQZ5CEP8wblEpuYQ+FwOTeX76zwHw24ra4fAO5WCjMmWIYO
         yvwylkfesNHVWGodHr/aae6Vf21o3/dVDwKKOLpDUHEwA65onGyGUQae+TWuZ80/TlCE
         HjgHhoNoKzEAodj+TFVRyYETpkdmkwh4qgXmL0nF3d5Iy2VO/ZrCuH9NJm0e98SFkg3E
         X4ZZ8CAxOl3lrzwln4M86upkhU+19YM0kWHrPGqe6q0agPRsvPsVWTKaM17R0zkKOJvF
         w4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v3Ka5DD552tfRB8O8dTkD7Lnt3ngyuMwpr7Jbz6905c=;
        fh=8HFrK9WzRn1Htl2sMAazRSSdLKGd+QwHnTTYiDgfI2w=;
        b=AFrfd8SpqhiOtGr3XJRi69zASf3NbAO02QlKVToMpyWQ0BxdrZwN02cJODAj4g7KbM
         1IdcXAd66qm5R+SGEhb1KaqbuW5cQHSXhW5gea1IhU/BOS3WDcOn8gezRAUVMK6aSmas
         KTrL790Fn2RgOeGu/7BJ9IWoUY6arFItOXb56KE+CNMRk1Xa2kjo9G7f9+kauCxBUixe
         7LH5W0qVuCi7WvvN5+Rtf3DhA0PG0uygADw875Od9eUf7VUtDz9DYYsxSJdwC/4TqCPh
         1UdxSvyrUGehTfBn6Sj+oOJVG2lmMdJhcMgABKS0bR91iYzP0Rl2IwVr/TORkcQARMus
         r8Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZrhR1e/v";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9cc346si89577376d6.453.2025.02.17.08.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZrhR1e/v";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739810302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3Ka5DD552tfRB8O8dTkD7Lnt3ngyuMwpr7Jbz6905c=;
	b=ZrhR1e/v7eHpFQHLfem5JKyrX+mhQ/cnA11S53lhxDFFPriTaBjsvf4t+yPW9EKQiinfht
	nAE94epGTcSj4UgzYlA/tdimzDWXtkrjvvwDJOBHaFBZcTHcaSRd9NcTtzgaCH3pZqnxxH
	OC5FNe1q0+T7Y+8Pl9Fmt3GcdkSP3gc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-mGn3oMIpPp6L2x004nL3jA-1; Mon,
 17 Feb 2025 11:38:18 -0500
X-MC-Unique: mGn3oMIpPp6L2x004nL3jA-1
X-Mimecast-MFC-AGG-ID: mGn3oMIpPp6L2x004nL3jA_1739810296
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5176D18EB2C3;
	Mon, 17 Feb 2025 16:38:14 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24DFD19560AA;
	Mon, 17 Feb 2025 16:38:02 +0000 (UTC)
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
Subject: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer Authentication) details
Date: Mon, 17 Feb 2025 22:07:28 +0530
Message-ID: <20250217163732.3718617-3-kchamart@redhat.com>
In-Reply-To: <20250217163732.3718617-1-kchamart@redhat.com>
References: <20250217163732.3718617-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 0DD8iX9sVRJJ

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
