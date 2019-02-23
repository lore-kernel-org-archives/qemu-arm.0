Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7781262wrx;
        Fri, 22 Feb 2019 23:49:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbA/8fPICMshy/MCKCA4bfbn3Gmt7UxQETXRSUBZlI2gAyz7CIHGGVJLhE1VF7ZoBNBRfVJ
X-Received: by 2002:a5b:b0b:: with SMTP id z11mr4361661ybp.323.1550908197620;
        Fri, 22 Feb 2019 23:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908197; cv=none;
        d=google.com; s=arc-20160816;
        b=NIpacU+Dpgnlx//Fd33QyjT5mK8O3d050/M6X2mXJ21vYTqOO1ljeMAm2kzIAxWUZ9
         dXCacEqvp7gfvjWrF6aVPs+l0Ebbb8kXoLPE/myvGmiMi9YRZg8fJGuclbAZRWxpNK47
         AV4upl7Y77PCJbkelG0yiegA3u0nDFNpBSrCV+mpxO+EI8T07+qnCen47cUEO7OSuDhG
         zyzoZ2x6roA9SmGo2oEQGTAXepcTzAAnzvPtgzkUuxkljBHljdKLYCcgL3Tcff3KQGfN
         7P5TpymEZ+frjQdoyb6sT9n0bjqvqI2LdOqy8ze97lSTbJ+aLvgbDZtspdlX1KJaeEby
         HWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=pB5+qbG3Bk/bL30DKO1REe5xFKm9Zot5669k+QzMFow=;
        b=a0q0reJ9Dd2WVBMpRlUJeKZOx+y+Fs8FdGTI4EWugm8xXIKfemmeReut+xGzQwOYoE
         TpQaNDxz2pHwSZ63t4lpM8ZnrbE1V2SsNyPxU+1lPWmk7RbaqLIggBtjF+PzQRIsySep
         X84OOOQ1V8UQMjFhCMf11kiS2+lMsaNcb3fTK6mvtJxXOKLAMzR/trAyK+XvoaY+/emx
         IGLscN03x1w4V1WftzZG0QOoxUd98hujamAkCKXzUvAKCtqtJi7e5s0momnHFyvkZikn
         3lXWteR1Troh5R6JhNT6ypjuh3QptGtYiyjRL5ZYR46ckYPcFD51XW5cp6+raC7RKN78
         3tTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o126si2115680ybb.80.2019.02.22.23.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS4L-0004RD-2I
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS40-0004Pe-3M
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS3x-0001ju-VA
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS3w-0001fU-5Q; Sat, 23 Feb 2019 02:49:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D079307D978;
	Sat, 23 Feb 2019 07:49:29 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD40D5D9CA;
	Sat, 23 Feb 2019 07:49:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:52 +0100
Message-Id: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 23 Feb 2019 07:49:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 00/30] Kconfig dependencies for ARM machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /qX5j1IuEhn2

This series reworks the default-configs/arm-softmmu.mak and
default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
dependencies instead.

Based-on: 1549562254-41157-1-git-send-email-pbonzini@redhat.com
          ("Support Kconfig in QEMU")

Some of the patches are slightly based on the work by =C3=81kos Kov=C3=A1=
cs:

https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html

The other patches have been created by looking at the sources and finding
out the dependencies the hard way via trial-and-error (i.e. by enabling
only one machine at a time and checking whether it can be compiled and
started).

v3:
 - Addressed review feedback from v2
 - Included patches to clean up the PCI dependencies of AHCI and SDHCI
   (so CONFIG_AHCI and CONFIG_SDHCI do not depend on CONFIG_PCI anymore)
 - Added an additional patch for the new "musca" machines

v2: Adressed review-feedback from v1
 - CONFIG_SDHCI and CONFIG_AHCI now select CONFIG_PCI
 - Added switches for MICROBIT and EMCRAFT_SF2

Thomas Huth (30):
  hw/arm/Kconfig: Add a config switch for MUSCA
  hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci stubs
  hw/ide/ahci: Add a Kconfig switch for the AHDI-ICH9 device
  hw/sd/sdhci: Move PCI-related code into a separate file
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
  hw/arm: Express dependencies for remaining IMX boards with Kconfig
  hw/arm: Express dependencies of the microbit / nrf51 machine with
    Kconfig
  hw/arm: Express dependencies of the ZynqMP zcu102 machine with Kconfig
  hw/arm: Express dependencies of the xlnx-versal-virt machine with
    Kconfig
  hw/arm: Express dependencies of the musca machines with Kconfig
  hw/arm: Remove hard-enablement of the remaining PCI devices

 default-configs/aarch64-softmmu.mak |   4 -
 default-configs/arm-softmmu.mak     | 177 +++-----------------
 hw/arm/Kconfig                      | 316 ++++++++++++++++++++++++++++++=
++++++
 hw/arm/Makefile.objs                |  25 ++-
 hw/display/Kconfig                  |   3 +
 hw/i2c/Kconfig                      |   2 +-
 hw/ide/Kconfig                      |   6 +-
 hw/ide/Makefile.objs                |   2 +-
 hw/misc/Kconfig                     |   2 +
 hw/pci/pci-stub.c                   |  11 ++
 hw/sd/Kconfig                       |   6 +-
 hw/sd/Makefile.objs                 |   1 +
 hw/sd/sdhci-internal.h              |  34 ++++
 hw/sd/sdhci-pci.c                   |  87 ++++++++++
 hw/sd/sdhci.c                       |  98 +----------
 15 files changed, 514 insertions(+), 260 deletions(-)
 create mode 100644 hw/sd/sdhci-pci.c

--=20
1.8.3.1

