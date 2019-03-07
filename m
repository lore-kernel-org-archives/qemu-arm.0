Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7196441wrx;
        Thu, 7 Mar 2019 06:19:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxynCt6OlSlg7ubZoqod3eV4sKF0yeHFe/uIXhmML/D6IzX1pXvwmoNKe8K9kIU8v9+0vhT
X-Received: by 2002:a81:524d:: with SMTP id g74mr9893253ywb.461.1551968363443;
        Thu, 07 Mar 2019 06:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968363; cv=none;
        d=google.com; s=arc-20160816;
        b=Mthp/c0YXpe7ogBUJUHcoz+LPYxklDDpxAIqOX7YW23MKWlWkBIgVrdgq6HbJdqrzD
         Ym1bM0QW3O1PHMUkurfRdqchd8YSxhHmO2ohz35gpXJIudsaxZvzgmjDgE4DLiqcxb+x
         surKA973qd+QddoSIlJTpqTkloimRd7JVRF/FiZJoYH0cn4xcKTXp+5Xbq9rSilW8Ei5
         cb++WztZfvCLNr3+wZ6uzedfA2K2uapgQ4N8MOiJcejytAtidFmYrO+Agp8cA1y0FrIt
         TFAVWErvv8XBYdZExOTcUBQMLw/HzoapZsAHo6YqMq3EabszwzX2hz/At55mFJiRbuzz
         vxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=TK9jPoOd2KbU3KpT9VWaLtczCsQWd7IXR5LA50EyexA=;
        b=bfFEtm+Hwzx4zuLak7H/2SPY6xQpTIXJgXe0eNXGg92+eH6G2x6xm0ol39/GaR4Bfh
         CXqEOQGt1vmdHvYA69zQhZ7ybal2huX7hoVmLvscArKEfEC+MxXDU0ywR1bfaz6WHNif
         WjE6yT+iJ7T/rTuRUFY+o4zO6UVqhhvss4nwVoJu/Dq7XJVEQCCOxteN6utTBgRMC83B
         Bw/H3b+gYsNomnXEJ3P0B4TuZkgZ1zaLG8sE6wDnn1ASWtMqiAkQ0eRcqmHRcny5CSL5
         AmGYeB8ZahXonL42lomP815ou5dfKHC5XXmEMXQgQCggZYn8jZadntxdugIkwn3azonD
         YnCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si2650520ybg.458.2019.03.07.06.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:19:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1trm-0004DN-QT
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tra-0004Bm-FL
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1trZ-0007wr-FZ
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1trZ-0007wc-6p; Thu, 07 Mar 2019 09:19:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 493D630718DB;
	Thu,  7 Mar 2019 14:19:08 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4B465C28C;
	Thu,  7 Mar 2019 14:18:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:25 +0100
Message-Id: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 07 Mar 2019 14:19:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 00/29] Kconfig dependencies for ARM machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z+8w5UKser1m

This series reworks the default-configs/arm-softmmu.mak and
default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
dependencies instead.

Based-on: 1551723614-1823-1-git-send-email-pbonzini@redhat.com
          ("Support Kconfig in QEMU")

Some of the patches are slightly based on the work by =C3=81kos Kov=C3=A1=
cs:

https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html

The other patches have been created by looking at the sources and finding
out the dependencies the hard way via trial-and-error (i.e. by enabling
only one machine at a time and checking whether it can be compiled and
started).

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

Thomas Huth (29):
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
 default-configs/arm-softmmu.mak     | 175 +++-----------------
 hw/arm/Kconfig                      | 319 ++++++++++++++++++++++++++++++=
+++++-
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
 15 files changed, 514 insertions(+), 261 deletions(-)
 create mode 100644 hw/sd/sdhci-pci.c

--=20
1.8.3.1

