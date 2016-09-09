Received: by 10.80.163.71 with SMTP id 65csp198388edn;
        Fri, 9 Sep 2016 09:23:34 -0700 (PDT)
X-Received: by 10.200.46.161 with SMTP id h30mr4932079qta.133.1473438214593;
        Fri, 09 Sep 2016 09:23:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si2495596qke.305.2016.09.09.09.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOaU-0002Il-4B
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaQ-0002ID-BV
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaL-0005hN-93
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:30 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:41914)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biOaK-0005g5-Vs
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:25 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 168FCFFC8B6
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:23:23 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id C85DF3C006C;
	Fri,  9 Sep 2016 18:23:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:43 +0200
Message-Id: <1473438177-26079-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16283608878065290001
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddtucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.44.197
Subject: [Qemu-arm] [PATCH v5 00/14] arm: add ast2500 support
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPdXS9SNJXuf

The AST2500 SoC being very close to the AST2400 SoC, the goal of the
changes below is to modify the existing platform palmetto-bmc and the
AST2400 SoC to take into account the small differences and avoid code
duplication. This is mostly inspired by the realview and the rpi2
platforms.

First patches rework the 'palmetto-bmc' platform and the 'ast2400' SoC
models to provide room to other platforms and SoCs which have a common
design.=20

The last patches add support for the new AST2500 SoC in the required
controller (SDMC and SCU) and define a new platform for an Aspeed
evaluation board.


In v5, I have included a couple of improvements, suggested by Peter,
which let the Memory Controller decide if the setting of RAM size is
correct. The value is propagated to the controller through a property.

Thanks,

C.

Changes in v5 are :

  - fixed AspeedSoCClass definition which was using a DeviceState.
    This was coring on 32bit systems !!
  - sdmc improvements

Changes in v4 are :

  - used -M to detect file renames
  - fixed trailing comma in enums
  - fixed brackets around macro parameters
  - use '-1' for board ID to define device-tree-only board.

Changes in v3 are :

  - ast2400.c file rename
  - added a AspeedSocClass for each supported SoC
  - the silicon-rev and the cpu model are now constants at the SoC level=20
  - more precise definition of the hardware strapping register=20

Changes in v2 are :

  - palmetto_bmc.c file rename
  - SCU macros to define the hardware strapping register=20

C=C3=A9dric Le Goater (14):
  ast2400: rename the Aspeed SoC files to aspeed_soc
  ast2400: replace ast2400 with aspeed_soc
  aspeed-soc: provide a framework to add new SoCs
  palmetto-bmc: rename the Aspeed board file to aspeed.c
  palmetto-bmc: replace palmetto_bmc with aspeed
  palmetto-bmc: add board specific configuration
  hw/misc: use macros to define hw-strap1 register on the AST2400 Aspeed
    SoC
  aspeed: add a ast2500 SoC and support to the SCU and SDMC controllers
  arm: add support for an ast2500 evaluation board
  palmetto-bmc: remove extra no_sdcard assignement
  aspeed: calculate the RAM size bits at realize time
  aspeed: use error_report instead of LOG_GUEST_ERROR
  aspeed: add a ram_size property to the memory controller
  aspeed: allocate RAM after the memory controller has checked the size

 hw/arm/Makefile.objs               |   2 +-
 hw/arm/aspeed.c                    | 197 +++++++++++++++++++++++++++++++=
++++++
 hw/arm/{ast2400.c =3D> aspeed_soc.c} | 131 ++++++++++++++----------
 hw/arm/palmetto-bmc.c              | 102 -------------------
 hw/misc/aspeed_scu.c               |  45 ++++++++-
 hw/misc/aspeed_sdmc.c              |  45 ++++++---
 include/hw/arm/aspeed_soc.h        |  59 +++++++++++
 include/hw/arm/ast2400.h           |  44 ---------
 include/hw/misc/aspeed_scu.h       | 193 +++++++++++++++++++++++++++++++=
+++++
 include/hw/misc/aspeed_sdmc.h      |   2 +
 10 files changed, 605 insertions(+), 215 deletions(-)
 create mode 100644 hw/arm/aspeed.c
 rename hw/arm/{ast2400.c =3D> aspeed_soc.c} (59%)
 delete mode 100644 hw/arm/palmetto-bmc.c
 create mode 100644 include/hw/arm/aspeed_soc.h
 delete mode 100644 include/hw/arm/ast2400.h

--=20
2.7.4

