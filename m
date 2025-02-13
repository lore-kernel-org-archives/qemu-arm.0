Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp442944njc;
        Thu, 13 Feb 2025 00:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsulR3Kvf/T2es66BAE86FDH9NTsBaQVNmfaozwUtjdwoqtcVOPpWfYtuCoFSSBs6DP4QLLMCEApOc9w==@linaro.org
X-Google-Smtp-Source: AGHT+IG63rirZex7uXMltEszjJEXVmJu8SncAcacjKVRxQoYckK+KxU/glRywDseBxi0wjQcFMtD
X-Received: by 2002:a05:620a:c45:b0:7c0:7dfb:9a73 with SMTP id af79cd13be357-7c07dfb9c15mr93347185a.39.1739436249543;
        Thu, 13 Feb 2025 00:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739436249; cv=none;
        d=google.com; s=arc-20240605;
        b=SOeAVZ04ZLEMviiMlXnS9Ee+LVcrhPsXxmt8tXHrW/rxWNW2mwGVqOkR5GiKSwKieT
         Wzg4WQPvaNYmz4bPD6EAKW2gmBnE1vzA8pW4ej1u1T8HP1Qk0QIwHJ/YSd7Muqdkfto9
         TPeruw4ZAdqbVC+N+7o2SWsAkl+I3r46wpseNbj0G/gkJEC5l3haKdKjPyUODChfGge/
         c5KMV9fJHSyTpvam+BE2/Nor2YWDMp8wXyk7ZnQfcl80AGzayUgtBlepT2k9+ehs8C0y
         7YC6esMOB84d9Dh1h5hBOuuHVMwG+LGG8nkKEecQ+zztPlBtCjWxYr2hMS6UPG/9x4E3
         XBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=TDscnvDbzgsuXBKLjlRdr1DWJnCnoW2CdRilsJ4Cn6w=;
        fh=J7iIlZKBLqizLdAqfby8j3nWBmfuEqejuhWlnrppJY4=;
        b=bQ+UsWUlNqrUeg1aieM+HHgPEiDgd08o2si1AgtHLWja8tF3RGho2tM4JYyD1BhhwA
         JaV3vY82jkRU3TmkKE+uucc36+V4AvHPbCFN10l2u+zkaGzewJpJsNG2wXHXFsOvYqPd
         BSFZIxotxHzcxI225fnNexO4pPKvuo1kaCWMrN+WRc+Ymq27EXDX5wWaK1q7vGksTxqN
         8dtvGcG6ZCHbk+9LJSOtqGy9IJ/7v/uI2rfTry6J/55F/O98tHnPiBkoU6Nf7ktSjSas
         FLnNNxabRADvYF3wGbnrd5VerIES+4ZSSEwWd09tWVB8Mk0kqYDeydp35whjpVJ2M7h7
         yLCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NEnp/8St";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c873af3si87346285a.310.2025.02.13.00.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 00:44:09 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NEnp/8St";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739436249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TDscnvDbzgsuXBKLjlRdr1DWJnCnoW2CdRilsJ4Cn6w=;
	b=NEnp/8StKTy2JV+PKD7WpMV+AFepcSfACubRSR/PYOZcwRHacU/vupJvTLIjtgFPYshnyX
	suETnyMc6GB6wwCRYIyYjRY2CCW/xjcQ/KUmwlHkFq/c2n5Dd98KQOzKRp2C4cgTNB4tP4
	5Hbgs80dyTTfjywi0JHPMImcLhu2ih0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-VPoz4C7SPhCUYPQ0qbS4AA-1; Thu,
 13 Feb 2025 03:44:06 -0500
X-MC-Unique: VPoz4C7SPhCUYPQ0qbS4AA-1
X-Mimecast-MFC-AGG-ID: VPoz4C7SPhCUYPQ0qbS4AA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7BAA18011E4;
	Thu, 13 Feb 2025 08:43:57 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.45.225.218])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 55F2518004A7;
	Thu, 13 Feb 2025 08:42:47 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Yi Liu <yi.l.liu@intel.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alistair Francis <alistair@alistair23.me>,
	Tyrone Ting <kfting@nuvoton.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Joel Stanley <joel@jms.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Hao Wu <wuhaotsh@google.com>,
	sebott@redhat.com,
	Eric Auger <eric.auger@redhat.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v2 0/3] docs: Small changes to system/arm/cpu-features and more
Date: Thu, 13 Feb 2025 09:42:15 +0100
Message-ID: <20250213084219.2975727-1-kchamart@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: JJUyxgG063TC

In v2:

  - Add live-migration context to the PAuth docs (Marc Zyngier)

  - Fix the Arm capitlalization (Peter Maydell)
    - Context here:
      (https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg05137.html)

    * * *

v1 cover letter:

One is a trivial, mechanical change to consistenlty use "vCPU".  The
other updates some details about the "PAuth" (Pointer Authentication)
feature.

I replaced the "TCG vCPU Features" heading with "PAuth" because of this:
before this change, the section says, it is about "CPU features that are
specific to TCG".  But it has only PAuth-related parameters under it.
Since PAuth is relevant to both KVM and TCG, I moved them under a
separate PAuth section, instead of duplicating it.

But now we have a small inconsistency - there's a KVM-only CPU features
section, but no TCG-only section.  I thought when there are more
TCG-only CPU features, that section can be added back in.  Or I can add
that back in, if anyone feels strongly about it.

Kashyap Chamarthy (3):
  docs/cpu-features: Consistently use vCPU instead of VCPU
  docs/cpu-features: Update "PAuth" (Pointer Authentication) details
  docs: Fix "Arm" capitaliaztion

 docs/devel/testing/qgraph.rst        |  8 ++--
 docs/devel/vfio-iommufd.rst          |  2 +-
 docs/specs/fsi.rst                   |  2 +-
 docs/system/arm/aspeed.rst           |  6 +--
 docs/system/arm/b-l475e-iot01a.rst   |  2 +-
 docs/system/arm/cpu-features.rst     | 60 +++++++++++++++++++++++-----
 docs/system/arm/nrf.rst              |  4 +-
 docs/system/arm/nuvoton.rst          |  4 +-
 docs/system/arm/stm32.rst            | 12 +++---
 docs/system/arm/xlnx-versal-virt.rst | 12 +++---
 docs/system/arm/xlnx-zynq.rst        |  2 +-
 docs/system/guest-loader.rst         |  2 +-
 12 files changed, 77 insertions(+), 39 deletions(-)

-- 
2.48.1
