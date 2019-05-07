Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3832727wrh;
        Tue, 7 May 2019 09:35:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDjFRrdRqvnv5Luw9Gmt/Usgcy8qXWxKeERT528hPUmAwh4ojSsft4rUagrHbQxt7vPKoD
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr5222387wrn.128.1557246926685;
        Tue, 07 May 2019 09:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557246926; cv=none;
        d=google.com; s=arc-20160816;
        b=aTe5g8KWJrJ0S6Gpm4VVlgL2wVbK8cATgCgBKxV+VJfdj9LMSIlVjuZPgSU0qFdrly
         iiAMjuIhAGb6lFw0tPsuVtWQRFFwwQHdT4L4LsRUnKTqeZTLCVu0jlM9WbaIqBhgPdS6
         GmP4sq1vddTsK3lco2WEXXCcoWjMDgZdQ/UqfcRNrZYwxUr9uu2srg91DXUjigjBTyfb
         hg1fNiHMdDthknNCA70lQhbgqbl3VBoqe1sQ6/dq/zblm7DgmMl+rmYJqgIKej6c7iQx
         d+elEdR/cwmxr8nMMKdqWEvdKFw8hULvGpKbdrVHeLD0nswetvoVmH7LPmZM/19/x9OO
         N20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=XeZiOo+yjrkFuqKXr6QCfCgEko3Vt3mwEkD8m60aMf4=;
        b=ewFJoEq1LO6Kh5s7vym3+MpejdbjVnA08mZzqtAfcxzhTYUVI42ZEd6IyNNYrEpKw3
         QO1t0ueCPxOH8BVatE40W1cOD5cWYsyU1PxbDqzsdwCs0UxxS1PcxIx35z18tu0gQP/7
         h0N4YxG13n2pvopZ/u8SnY6BHsQ9nC2/k3BvrG1Q30KjNzKg5qMN/Ypi/tFjb/8r/zZA
         9NCl6T2EjxtuVoA/Ra83OZeGpdTrJb/b3Mck5/yR213NZILEuUBvRMOgLVAKIFivaoRc
         E51OEIXV1POGAzqdQkpkjTIgzxKZ2OGSrVgWeKmTejKkwfaj80YB7oBpBDSnttDyfdCt
         sTxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v189si8786301wme.189.2019.05.07.09.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO33t-0000Ty-Kk
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:35:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33K-0008SS-0O
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33I-0000e7-3j
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:34:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO33E-0000VY-VH; Tue, 07 May 2019 12:34:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39E373001829;
	Tue,  7 May 2019 16:34:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C25208162;
	Tue,  7 May 2019 16:34:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:00 +0200
Message-Id: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 07 May 2019 16:34:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/16] hw: Use object_initialize_child for
 correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4rOR0+QW9OtQ

Hi,

This series looks at Eduardo suggestions from [1]
and Thomas commit aff39be0ed97 to replace various
object_initialize + qdev_set_parent_bus calls by
sysbus_init_child_obj().

Important comment from Eduardo:

  It's possible, but we need a volunteer to review each
  hunk because the existing code might be (correctly)
  calling object_unref() (either immediately or when
  parent is finalized).

I tried to split it enough to make the review process
easier.

Regards,

Phil.

[*] https://patchwork.ozlabs.org/patch/943333/#1953608
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05931.html

Philippe Mathieu-Daud=C3=A9 (16):
  hw/ppc/pnv: Use object_initialize_child for correct reference counting
  hw/misc/macio: Use object_initialize_child for correct ref. counting
  hw/virtio: Use object_initialize_child for correct reference counting
  hw/arm/bcm2835: Use TYPE_PL011 instead of hardcoded string
  hw/arm/bcm2835: Use object_initialize() on PL011State
  hw/arm/bcm2835: Use object_initialize_child for correct ref. counting
  hw/arm/aspeed: Use object_initialize_child for correct ref. counting
  hw/arm: Use object_initialize_child for correct reference counting
  hw/mips: Use object_initialize() on MIPSCPSState
  hw/mips: Use object_initialize_child for correct reference counting
  hw/microblaze/zynqmp: Move the IPI state into the PMUSoC state
  hw/microblaze/zynqmp: Let the SoC manage the IPI devices
  hw/microblaze/zynqmp: Use object_initialize_child for correct ref.
    counting
  hw/microblaze/zynqmp: Use object_initialize_child for correct ref.
    counting
  hw/arm/mps2: Use object_initialize_child for correct reference
    counting
  hw/intc/nvic: Use object_initialize_child for correct reference
    counting

 hw/arm/aspeed.c                      |  6 +--
 hw/arm/aspeed_soc.c                  | 50 +++++++++--------------
 hw/arm/bcm2835_peripherals.c         | 61 +++++++++++-----------------
 hw/arm/digic.c                       | 17 +++-----
 hw/arm/imx25_pdk.c                   |  5 +--
 hw/arm/kzm.c                         |  5 +--
 hw/arm/mps2-tz.c                     |  8 ++--
 hw/arm/mps2.c                        |  8 ++--
 hw/arm/raspi.c                       |  7 ++--
 hw/arm/sabrelite.c                   |  5 +--
 hw/arm/xlnx-zcu102.c                 |  5 +--
 hw/arm/xlnx-zynqmp.c                 |  8 ++--
 hw/intc/armv7m_nvic.c                |  6 +--
 hw/microblaze/xlnx-zynqmp-pmu.c      | 45 ++++++++++----------
 hw/mips/boston.c                     | 25 ++++++------
 hw/mips/cps.c                        | 20 ++++-----
 hw/mips/mips_malta.c                 | 17 ++++----
 hw/misc/macio/macio.c                |  8 ++--
 hw/ppc/pnv.c                         | 12 ++----
 hw/virtio/virtio.c                   |  5 +--
 include/hw/arm/bcm2835_peripherals.h |  3 +-
 21 files changed, 140 insertions(+), 186 deletions(-)

--=20
2.20.1

