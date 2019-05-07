Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3649907wrh;
        Tue, 7 May 2019 06:45:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzh5sVkpu/JVMMEwTW8i2cT5QkiWyRgPqwF/OKUbOrjCMDwC7pmROceovB/s9VevRQgizLA
X-Received: by 2002:a1c:1a47:: with SMTP id a68mr2716171wma.88.1557236752488;
        Tue, 07 May 2019 06:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557236752; cv=none;
        d=google.com; s=arc-20160816;
        b=i2c+yd5UoS1QJZKwGpxp90fLHif9gg48KiKNXU2bx5hNE1NEm1unTNATbEKA2CY5a7
         83vY4HcSc7xXnamV5h1GqT23qGefgD9mBqkhCwC+G0pZl7pZneqO3kUOJ6KH1oAcFZWm
         fHMkLK1fNCLp3SWl08eyysTMQNTKN2TfXq0dD4ud+hB1J50ph6grXiTTdZE0WnuRCZGq
         Iav3sByz8Gldm+sjk5AtmYJYbA+dwJQhyr/WLVQJIi/cKRNG7Ilowiyf08EhkgfW0ma1
         XXMQdYMv4xml/DzaxOOTDlwV0dv84MD3KkCtZ3Ryu98pz2eHizoVi2SpzZiJ8if5dWIe
         lguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ZkBzP/IlY3KD7U8CETe2Fx1FjjRPtt8WCi31BJAO8RY=;
        b=Rx7Ppoaqo+JRPcTyxBQgH3sklrr9BE/wHBEMl0uhw1vViLSQMwDu0uWy2ycJvlwILN
         4iuP4MqU1fR9bKHKcwaFJ/vteymUCkHzMRn7DdUOpSrdYBLdjjX8oduT80Xwf6YHPr6j
         uA/ahWZVuHzVPTiEvCTGDpuHMES2xQJ5HPYrrTg2GJr4+/MMFsQ7H+fVpBFrTxii7lrW
         nu7ZX8Rsa0kpjhJNn27dNwI2HhvStNVzLm3Jt9j6enQ9A5sI1h40rCwtvwZa45Leai/G
         bT7mXHYinY6PWbYHSCeUW94z9gn+FXXpTezvupdNUeKr0JJrHYL6dwUB+/ZlYSTx1aUW
         zvow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si1803245wrn.408.2019.05.07.06.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 06:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO0Pn-000509-Ja
	for alex.bennee@linaro.org; Tue, 07 May 2019 09:45:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hO0PY-0004xp-7Z
	for qemu-arm@nongnu.org; Tue, 07 May 2019 09:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hO0PW-0006xs-VE
	for qemu-arm@nongnu.org; Tue, 07 May 2019 09:45:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hO0PW-0006wz-Nf; Tue, 07 May 2019 09:45:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8809301BE66;
	Tue,  7 May 2019 13:45:33 +0000 (UTC)
Received: from thuth.com (ovpn-116-130.ams2.redhat.com [10.36.116.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA0747341;
	Tue,  7 May 2019 13:45:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue,  7 May 2019 15:45:20 +0200
Message-Id: <20190507134521.31044-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 07 May 2019 13:45:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: jsnow@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +vAPId/XO93D

 Hi Peter,

the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04=
f7:

  Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-re=
quest' into staging (2019-05-03 15:26:09 +0100)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-07

for you to fetch changes up to 69f879e9fefab9aaf24893fe4ce23e07756d703c:

  hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-07=
 15:01:47 +0200)

----------------------------------------------------------------
Kconfig settings for the Arm machines
(v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
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
 hw/i386/Kconfig                     |   2 +-
 hw/ide/Kconfig                      |   6 +-
 hw/ide/Makefile.objs                |   2 +-
 hw/misc/Kconfig                     |   2 +
 hw/pci/pci-stub.c                   |  11 ++
 11 files changed, 384 insertions(+), 170 deletions(-)
