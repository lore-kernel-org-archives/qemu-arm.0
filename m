Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2541600wrg;
        Mon, 13 May 2019 01:30:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsP+hgZanCHtLDtW82HqCJ2ojniTIwQv96QmUXADImt4qLTj333IkeQcab+W54JLMusGPa
X-Received: by 2002:a17:906:1596:: with SMTP id k22mr21269089ejd.162.1557736205733;
        Mon, 13 May 2019 01:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557736205; cv=none;
        d=google.com; s=arc-20160816;
        b=pTtdE/IegH/UC3+Wk00AWIu6j0mSb5hXzJb3rJc/xX4CdDPaEUgu6O93fBb0ahUzuR
         nxTY/ObyIhb/qnnebK5y0FydR8h8vVKBQtAUvRLew1Kk+e/AhhVNFroy2hGZKNNLwlJ9
         DbS4DjGweTGt50NlGEZtZj6cftxWhTYXCVi1t8OZH9hXGJllK/H08JReZxMc7u3tEk7f
         gTq69IRHe6rUf9qGMKjw11CD+OUMArKHiTt8meQQ3uKEVcuDQieVkYMMHACp7r2LShVE
         C1u2qyiyLbAUkuK4ctlB01WdR0NUcsJ2WCHiTmek55kdrqVjgO5HOKz6Su97bzkWdg/O
         BKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=i2WxpAPzM3rWKf97nVSpl5HeyL7ud+EtWa0NAIJitD4=;
        b=kp9+QHUHoWXE3njz4aJnEYn91ZuB5eOyEMyiTgOW2eNJYNZdHDHSFsUsnXNlwWPNpK
         3VonODl5S/skU5R7lQrnD8PG3CTXoQBc7aWZsHWEd8c7hQaPbonG4bsZah8s4rfhH036
         d89OMW81ZVQT+dfFF5qG5Iz1GRX87nWz0Pr5OJCI9pESZH6NnVEkSjJnY4aHMD+sQN3E
         OzVT6wIJnn6IiMiOGx45Fnf224WEHlPvbQh4C7mt2IoM+Q5XCCqIgOgDqfCGhYk4G2kM
         IhK1r9jaB+0Abs/BzAOZ5geqyUU6CYF+J2tMO5WGLKOOyT3KRk4bbe7HK88GeZl64V3Y
         0ZCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si3243943ejz.218.2019.05.13.01.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 01:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQ6LU-0005PK-QN
	for alex.bennee@linaro.org; Mon, 13 May 2019 04:30:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6LI-0005OI-Md
	for qemu-arm@nongnu.org; Mon, 13 May 2019 04:29:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6LC-0005No-4C
	for qemu-arm@nongnu.org; Mon, 13 May 2019 04:29:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQ6LB-0005NB-Cv; Mon, 13 May 2019 04:29:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B512C057F2E;
	Mon, 13 May 2019 08:29:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BDED6A97B;
	Mon, 13 May 2019 08:29:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:29:38 +0200
Message-Id: <20190513082940.30295-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 13 May 2019 08:29:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v3 00/29] Kconfig for Arm
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
X-TUID: QuzorcLqWxiG

 Hi Peter,

the following changes since commit efb4f3b62c69383a7308d7b739a3193e7c0cca=
e8:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request'=
 into staging (2019-05-10 14:49:36 +0100)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-13

for you to fetch changes up to 704d9892561d3b7ac4728296240a1b3ccfa2045a:

  hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-13=
 09:36:32 +0200)

----------------------------------------------------------------
Kconfig settings for the Arm machines
(v3: Added the config-devices.mak.d patch to fix the dependencies)
----------------------------------------------------------------

Thomas Huth (29):
      hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci stub=
s
      Makefile: Fix inclusion of the config-devices.mak.d Kconfig depende=
ncies
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

 Makefile                            |   2 +-
 configure                           |   2 +-
 default-configs/aarch64-softmmu.mak |   5 -
 default-configs/arm-softmmu.mak     | 179 ++++----------------
 docs/devel/kconfig.rst              |   2 +-
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
 14 files changed, 387 insertions(+), 173 deletions(-)
