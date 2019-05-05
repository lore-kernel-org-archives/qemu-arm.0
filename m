Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1428229wrh;
        Sun, 5 May 2019 06:57:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7RFHmdlxyQVvfJ1j5F+cDo7QRcSOSBZH71/KAJnG8JBJfi8XBWSMbUUf0ZqkVwM2GjnN7
X-Received: by 2002:adf:dc8c:: with SMTP id r12mr11022613wrj.139.1557064660113;
        Sun, 05 May 2019 06:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064660; cv=none;
        d=google.com; s=arc-20160816;
        b=xfYCBnPZ3kDD3PUqlpPk4w8WYXqeE7QM75G6TGzON1KWxRLrk0ebrUz+fgahXNpw8A
         bd890odjtwOM5PWAMjM+TVxUhqssGS6eWApfFUiJWJnr8rOuQRzgYdh/gjCT4QSIwVPW
         vfmLB/E4+fFGhOZ7go6tTMJbI0O+Ts7REOj7vedLxjRqYhyFaUNIZJYzHKQSPx671jeO
         9QQsjzFX45YE4g7Yu9T7cKw0kV+jnUaJZT/aHA1YdyZln2pDuWNzP1QDbyq5G16gLtsq
         OfJPdN8/E3K6UHtbBXrDaLu0f5DFwOlK5LLWTST5efialGoto29+NZrRHRiN1UxAxtLx
         AR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=GqHqtVK0qxQkeav202WLxq8u21n9x0mpnOTb2t4MPo4=;
        b=CSy7B/2cZBfjKmFjlOWiulCFpyEovdgLKuBRQRttQqW1Y3WF7H0GMdLpekSTK2QSSP
         n7NJxEcWGOg6MD6YMaG3plPzQLIfmlPs7MLvtM0pL9VPE6Cj4SRuYGzT/3EH5bdhTm7n
         v17IwzwE8DdY6/WBKnmFntWXqF+sE+agBGmQUuYPjZEgjOHS63Qe284TeYoMKRzidqL1
         JP39slVzRGAPzyxpVVfU2ZoXlf1V8JNFFqZZ/PWeQabuZUGzqnzctoIzKt6Snnlo380/
         4cGj0JoSKs/cxoR+aQJFpK6Uni8bKsB5U9vUUFuw1VQVSwL3uBGtTdK9pVreRkiDCZDM
         Lfew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24si4952015wmh.125.2019.05.05.06.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 06:57:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHe5-00041t-29
	for alex.bennee@linaro.org; Sun, 05 May 2019 09:57:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdp-00041g-QP
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdo-0004W1-MF
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHdo-0004Tx-Em; Sun, 05 May 2019 09:57:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE9463001815;
	Sun,  5 May 2019 13:57:18 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAC8A60C43;
	Sun,  5 May 2019 13:57:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:46 +0200
Message-Id: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Sun, 05 May 2019 13:57:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 00/28] Kconfig for Arm machines
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DxaBJqshq9pd

 Hi Peter,

the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04=
f7:

  Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-re=
quest' into staging (2019-05-03 15:26:09 +0100)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-05

for you to fetch changes up to 55e5578fabf744e62038f7357369a68e460fe205:

  hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-03=
 17:06:20 +0200)

----------------------------------------------------------------
Kconfig settings for the Arm machines
----------------------------------------------------------------

Thomas Huth (28):
      hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci stub=
s
      hw/ide/ahci: Add a Kconfig switch for the AHCI-ICH9 device
      hw/arm: Express dependencies of the exynos machines with Kconfig
      hw/arm: Express dependencies of the highbank machines with Kconfig
      hw/arm: Express dependencies of integratorcp with Kconfig
      hw/arm: Express dependencies of the fsl-imx31 machine with Kconfig
      hw/arm: Express dependencies of musicpal with Kconfig
      hw/arm: Express dependencies of the OMAP machines with Kconfig
      hw/arm: Express dependencies of stellaris with Kconfig
      hw/arm: Express dependencies of realview, versatile and vexpress wi=
th Kconfig
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
      hw/arm: Express dependencies of the MSF2 / EMCRAFT_SF2 machine with=
 Kconfig
      hw/arm: Express dependencies of the remaining IMX boards with Kconf=
ig
      hw/arm: Express dependencies of the microbit / nrf51 machine with K=
config
      hw/arm: Express dependencies of the ZynqMP zcu102 machine with Kcon=
fig
      hw/arm: Express dependencies of the xlnx-versal-virt machine with K=
config
      hw/arm: Express dependencies of the musca machines with Kconfig
      hw/arm: Remove hard-enablement of the remaining PCI devices

 default-configs/aarch64-softmmu.mak |   5 -
 default-configs/arm-softmmu.mak     | 179 ++++----------------
 hw/arm/Kconfig                      | 317 ++++++++++++++++++++++++++++++=
+++++-
 hw/arm/Makefile.objs                |  25 ++-
 hw/display/Kconfig                  |   3 +
 hw/i2c/Kconfig                      |   2 +-
 hw/ide/Kconfig                      |   6 +-
 hw/ide/Makefile.objs                |   2 +-
 hw/misc/Kconfig                     |   2 +
 hw/pci/pci-stub.c                   |  11 ++
 10 files changed, 383 insertions(+), 169 deletions(-)
