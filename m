Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp155962njb;
        Mon, 17 Feb 2025 08:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWns0A5ZptjwPl0Co3fX0xn5c/Zu2IZkWtUUQZMos7ghh7MmPZCXcpMdKp6qiczrjdfWlTz2C5lzOtxHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGFFdQwq/9AdTHpevsoR8ZOANFq+c5Kf+NPCoqDahpuTbR8dn+UJclMzB4jq1yRmwffHbB0
X-Received: by 2002:a05:6214:19e3:b0:6e6:6089:4978 with SMTP id 6a1803df08f44-6e66ccef4b5mr139443566d6.24.1739810278890;
        Mon, 17 Feb 2025 08:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810278; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWl12QSLJl+1ECQY5Cs5cW/RG7irxN0KD/WyPP1cHNH9Bq6OkEH/qOuJ1BbgTH+d8f
         js/v+zgtYjZax/AK4pzT+ktv6XffDGVOd/2NxyxF+88Y5LZQgr+Ww9/6s4QMn58yDQPc
         zRfXb4uqVgugv95KDz2/3dBc2EAfrnVvZUx3S6Ge8kg7yeiIbXrcmK9vrvhfxIWIlEoj
         YVnviHuVgQv5iQuA1WOApMBAG7vUkfyqT+rvMsJREQJtq5DLDoYr60eRmbGMDBgKfaDc
         4qpoFfkg0YhmP48lTkiJhUBcHdXEZLRNnC5n9aUlJ2u7QwTB1cdYZs1wo4yd9YBjH32w
         Hcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6tmWoQnR31ab0SOfOf/zp0XJOqEY62yB1ZfgBQboIKg=;
        fh=8HFrK9WzRn1Htl2sMAazRSSdLKGd+QwHnTTYiDgfI2w=;
        b=O2Op2Z0nt1O4PN2a0TuK9rrkE8HwwjvGcbgrtNDtNNJ4rqwmoEJ7rj82IkFvgRqWNl
         zXvypl5qS3Z3lA+c68YAKaVrXd46fre34PdxbqZ+4qHcU2SmQvgHOrsu4P30weoeRkIB
         d68u1/1jAfLU6RmWmEDzY2BFPFhJpx6QGhtpMlZvUjH5JaRoLyMiNd/GMPHILQXNNUHW
         +5DaBSm2mGvk1hMvApZKQ4ZFC3ggu3DcdiDhhIr55o/kvrHjfZ6cza5JQVxxEZ1kmjRp
         uBXi/V7NaoLDcwZgig3W38PurauQ6DIVmioGghvVTj5rvyCfyXhbYj/sih//zWxoA3aX
         X3JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1UnFay4;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b6357dsi91930151cf.558.2025.02.17.08.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1UnFay4;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739810278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6tmWoQnR31ab0SOfOf/zp0XJOqEY62yB1ZfgBQboIKg=;
	b=J1UnFay4sQulicXQEbstZEBn78kkkM1st0z/idVbBTg2/JZnCkdi/hySx+gVxzAUGC0LWZ
	kHe8MGpnLno9dxcLNZkEqoAxC2E8H59uzXvCvbWIWEKiiQUtA2so9K6c5FWBdTEmEYpF7u
	YsVgqLzeNGoRrgzQINUUi3E5Ud0lRMc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-Fk4vEc8sOrSUDOs_SISWKg-1; Mon,
 17 Feb 2025 11:37:55 -0500
X-MC-Unique: Fk4vEc8sOrSUDOs_SISWKg-1
X-Mimecast-MFC-AGG-ID: Fk4vEc8sOrSUDOs_SISWKg_1739810271
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8358F190F9C9;
	Mon, 17 Feb 2025 16:37:49 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.44.32.23])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8DF119560AA;
	Mon, 17 Feb 2025 16:37:34 +0000 (UTC)
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
Subject: [PATCH v2 0/3] docs: Small changes to system/arm/cpu-features and more
Date: Mon, 17 Feb 2025 22:07:26 +0530
Message-ID: <20250217163732.3718617-1-kchamart@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: F5CY8Jim3l4i

[
    Resending v2, Peter pointed out that only patches 1 and 2 made it to
    the list; so I'm re-sending with a commit message touch-up:
    s/capitalization/capitaliaztion.

    Alex Bennée reviewed the first two patches that did show up:
    - https://lists.nongnu.org/archive/html/qemu-devel/2025-02/msg02838.html
    - https://lists.nongnu.org/archive/html/qemu-devel/2025-02/msg02837.html
]

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
  docs: Fix "Arm" capitalization

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
