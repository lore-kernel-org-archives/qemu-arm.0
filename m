Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4401373wrh;
        Tue, 30 Apr 2019 00:14:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpcpZCnXPw2F4jOwLzeI+AHgWNuHp3kRrr11zTGZNX25/+6FX8UC/+rZgMKTJHVWkiiE9F
X-Received: by 2002:a1c:2317:: with SMTP id j23mr2007015wmj.80.1556608484441;
        Tue, 30 Apr 2019 00:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556608484; cv=none;
        d=google.com; s=arc-20160816;
        b=HMREAg6yqwAJaX2djThYUzP81CW1dwt3IpYn1ITR6RexlXZMqJzt4K27xy84ot6JGa
         ZAPH/kFS/tvbJICnPGrh2z6sT2pWHY1k+/V2XvtHtbUZsw2vWF+wJNYpiMwQ0l4H0Kbc
         bdWDwDR03FicTSjdmPfKt/FQUGfPJQBwbgxp8sKfwWR8uP1iuOBzKYg+NyDJh+SecXnB
         Hx+Typ4g5OCiGwnq7qwUtQRN+bXbKJVcZInHjM0FUcGGQyqaCf9JrzQdImmT4IzuJH2a
         uESgMVr5RL4GI9jumJeCtcLvhy72iKMbLjVhgt2jTyL1M9NlRMBEkNbn+05UKxfvUiyC
         Bqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=NVSD4Hynm1Ge9/OHz/2NaQlMXS5e+jmvnxRIDB3VUfg=;
        b=JSsIq5dajHqkUCHHxWUuaFDfRqq2DvaBvVY6pdV4/nb6eL9wCS5mwl92wxvVWVlfH3
         3O2BvzWh5/NCyuwOEol4VUYedkNV52Dk6I4Gvelcf8VxFJ8sBbr89w/XLUF0dO3qouxE
         GztZB01jYv4zo9RCeNtxdu9r74GvzA3ni0jKsCsHNXVgdyP/bANL0ZbJaZwU14WpQe4y
         qBivMiBEHJRqwTK8cVNUoRwe5UD4gGCbqsrCHB3V9h8zL2sVgOiC+0IEik9Lkz5mtf5A
         nBs/QArVqUrFEVmPe+/Fn2RsNcklJfKTF+3kycfPlgHXwXpbe5QIVk028ahQKfAT04g6
         RVvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si4229169wrm.330.2019.04.30.00.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLMyR-0005OP-D3
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:14:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMyD-0005N3-7N
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:14:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMyB-00041J-Tf
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:14:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLMyB-00040s-Lr; Tue, 30 Apr 2019 03:14:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1115D3091785;
	Tue, 30 Apr 2019 07:14:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A08871001E85;
	Tue, 30 Apr 2019 07:14:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:35 +0200
Message-Id: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 30 Apr 2019 07:14:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 00/30] Kconfig dependencies for ARM machines
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ITSzoqQAmVBK

This series reworks the default-configs/arm-softmmu.mak and
default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
dependencies instead.

Some of the patches are slightly based on the work by =C3=81kos Kov=C3=A1=
cs:

 https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html

The other patches have been created by looking at the sources and finding
out the dependencies the hard way via trial-and-error (i.e. by enabling
only one machine at a time and checking whether it can be compiled and
started).

v6:
 - Addressed the review feedback from Phillipe in v5
 - Added Reviewed-bys and Tested-bys
 - Use the "split" ohci patches instead of the single big one

v5:
 - Rebased the series to the current master branch
 - Added "hw/usb/hcd-ohci: Move PCI-related code into a separate file"
   patch and got rid of unneeded dependencies to CONFIG_PCI in the
   ARM machines that do not have a PCI bus

v4:
 - Rebased the series to Paolo's latest kconfig tree

v3:
 - Addressed review feedback from v2
 - Included patches to clean up the PCI dependencies of AHCI and SDHCI
   (so CONFIG_AHCI and CONFIG_SDHCI do not depend on CONFIG_PCI anymore)
 - Added an additional patch for the new "musca" machines

v2: Adressed review-feedback from v1
 - CONFIG_SDHCI and CONFIG_AHCI now select CONFIG_PCI
 - Added switches for MICROBIT and EMCRAFT_SF2

Thomas Huth (30):
  hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci stubs
  hw/ide/ahci: Add a Kconfig switch for the AHCI-ICH9 device
  hw/usb/hcd-ohci: Do not use PCI functions with sysbus devices in
    ohci_die()
  hw/usb/hcd-ohci: Move PCI-related code into a separate file
  hw/arm: Express dependencies of the exynos machines with Kconfig
  hw/arm: Express dependencies of the highbank machines with Kconfig
  hw/arm: Express dependencies of integratorcp with Kconfig
  hw/arm: Express dependencies of the fsl-imx31 machine with Kconfig
  hw/arm: Express dependencies of musicpal with Kconfig
  hw/arm: Express dependencies of the OMAP machines with Kconfig
  hw/arm: Express dependencies of stellaris with Kconfig
  hw/arm: Express dependencies of realview, versatile and vexpress with
    Kconfig
  hw/arm: Express dependencies of the PXA2xx machines with Kconfig
  hw/arm: Express dependencies of xilinx-zynq with Kconfig
  hw/arm: Express dependencies of collie with Kconfig
  hw/arm: Express dependencies of the aspeed boards with Kconfig
  hw/arm: Express dependencies of the virt machine with Kconfig
  hw/arm: Express dependencies of netduino / stm32f2xx with Kconfig
  hw/arm: Express dependencies of allwinner / cubieboard with Kconfig
  hw/arm: Express dependencies of the MPS2 boards with Kconfig
  hw/arm: Express dependencies of the raspi machines with Kconfig
  hw/arm: Express dependencies of canon-a1100 with Kconfig
  hw/arm: Express dependencies of sabrelite with Kconfig
  hw/arm: Express dependencies of the MSF2 / EMCRAFT_SF2 machine with
    Kconfig
  hw/arm: Express dependencies of the remaining IMX boards with Kconfig
  hw/arm: Express dependencies of the microbit / nrf51 machine with
    Kconfig
  hw/arm: Express dependencies of the ZynqMP zcu102 machine with Kconfig
  hw/arm: Express dependencies of the xlnx-versal-virt machine with
    Kconfig
  hw/arm: Express dependencies of the musca machines with Kconfig
  hw/arm: Remove hard-enablement of the remaining PCI devices

 default-configs/aarch64-softmmu.mak |   5 -
 default-configs/arm-softmmu.mak     | 179 +++-------------
 hw/arm/Kconfig                      | 317 +++++++++++++++++++++++++++-
 hw/arm/Makefile.objs                |  25 ++-
 hw/display/Kconfig                  |   3 +
 hw/i2c/Kconfig                      |   2 +-
 hw/ide/Kconfig                      |   6 +-
 hw/ide/Makefile.objs                |   2 +-
 hw/misc/Kconfig                     |   2 +
 hw/pci/pci-stub.c                   |  11 +
 hw/sh4/Kconfig                      |   2 +-
 hw/usb/Kconfig                      |   6 +-
 hw/usb/Makefile.objs                |   1 +
 hw/usb/hcd-ohci-pci.c               | 163 ++++++++++++++
 hw/usb/hcd-ohci.c                   | 219 ++-----------------
 hw/usb/hcd-ohci.h                   | 104 +++++++++
 16 files changed, 676 insertions(+), 371 deletions(-)
 create mode 100644 hw/usb/hcd-ohci-pci.c
 create mode 100644 hw/usb/hcd-ohci.h

--=20
2.21.0

