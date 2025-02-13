Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp589776njc;
        Thu, 13 Feb 2025 05:51:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWO8b17KTp5qIMUzWJvJ2JASuxZNCD+vopMC4o6u4BJGMBLGzvG8fXSAUSrFi8cVIVoA71W9ccip8XPlw==@linaro.org
X-Google-Smtp-Source: AGHT+IHUGUWePWld9PGLzKeaH5TQ9jgDjQosxPk9um5779a6fpoYQLaIqjh8gp+UJ+qMdlc7+vGL
X-Received: by 2002:a05:6000:4714:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-38f24c5e374mr3090362f8f.0.1739454661102;
        Thu, 13 Feb 2025 05:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739454661; cv=none;
        d=google.com; s=arc-20240605;
        b=XmKKG27p2jJJAOdHxeQBI5hj3Z+7lX0iNQF6oro37T1xJZU+nHqqcNilASNZ/7K37n
         xUUdLQmwucajBkf2CK9SeVcwk/FCBudNRHLhcLyfVpxCuOaMAc0OirIyaBjgi66ulrxO
         BLjXLKecrtkrq1fxO5NHyFsg7+geGn8XcecN49zWQUWnpK4+iH6njve/KZbprETLPsHP
         EUMkHRWEzJ4Pqg+MHcCl17Qcv/pIQJB5jtLd7Wlrmcua/qlwuVTcL+pd5YSlo2jvAXZU
         5BP1bMxIeR/eKa8PWkor9hRECQIv+MVDD7PafyhLd9ExES0azF8Gq3mk+h1gOGiYECA2
         kSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=9y3iX25JXzJV4LsWdCKwdpyFNIF9HsTeFE8wOHwrl9Y=;
        fh=MnhyUl3vVgRMrTIm5urs1XY+2V00f3MxvY4hBV+jHPk=;
        b=ZuHmT7nGDkmeB5J9bI16OK5rJW7uwAAPlw5NLYj2Wl9GNn5ZKvgLuvgBHAB03x4u5T
         IxeTBOHqOCHfj17xj+JB8l9jDtkJESOI5C1MZ1Bv0UgJk7VF3EgO0n6n3R/c6mAwDJ5a
         BU1Z1Es0pbjEPV7cbq7n/POF+WrRKwD9HvjGJm1P7AAg1N3PjR/09SXrT0C/05lzVBax
         QuxgKVQReIQw8hVjox4Dhy08hqNGM85XKFQGPZ9/Fqc8f7uHZARtOs/GQinjD5UHQnFG
         HHxCb82XAryAfEKFtia4/gn0wWFohH/wD7qsMQCqkz7u7fyq1p/QRR4zAgYThKxgBKpt
         J8mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jVVjNZx2;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38f258f8d5bsi1527385f8f.222.2025.02.13.05.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jVVjNZx2;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739454659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9y3iX25JXzJV4LsWdCKwdpyFNIF9HsTeFE8wOHwrl9Y=;
	b=jVVjNZx2uMJAvRqcv+NxwZbvBNAErnJzmhMbD7M8VIc/PAog8e/8Uh9/wLcZmwq/XgOf56
	kvpnIE7U7rbShQoH3FgAG694TXLdfi6P6tSY1if1n7OaxhqUHlGErV6ailrjQeVN7I89jk
	xOhdBRsI7SiJx69QQeKdLV15xdNNjsw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-ZyrfqnmMM5mP6QUbieqWpQ-1; Thu,
 13 Feb 2025 08:50:56 -0500
X-MC-Unique: ZyrfqnmMM5mP6QUbieqWpQ-1
X-Mimecast-MFC-AGG-ID: ZyrfqnmMM5mP6QUbieqWpQ_1739454654
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF188180087C;
	Thu, 13 Feb 2025 13:50:51 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.45.242.15])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B6A22300018D;
	Thu, 13 Feb 2025 13:50:34 +0000 (UTC)
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
Subject: [PATCH v2 0/3] docs: Small changes to system/arm/cpu-features and more
Date: Thu, 13 Feb 2025 14:50:28 +0100
Message-ID: <20250213135032.2987289-1-kchamart@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: 1qNwY7WXer+F

In v2:

  - Add live-migration context to the PAuth docs (Marc Zyngier)

  - Fix the Arm capitlalization (Peter Maydell)
    (See:
    https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg05137.html)

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
