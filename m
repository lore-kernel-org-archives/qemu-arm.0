Received: by 10.25.87.130 with SMTP id l124csp1790703lfb;
        Sun, 4 Sep 2016 23:01:04 -0700 (PDT)
X-Received: by 10.55.113.197 with SMTP id m188mr35811675qkc.55.1473055264456;
        Sun, 04 Sep 2016 23:01:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q29si15753256qkl.91.2016.09.04.23.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgmxr-0001P6-MV
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:01:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxV-0001CC-S4
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxK-0001nC-Be
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:41 -0400
Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21]:36928)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxK-0001mm-6A
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:30 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id E9855100024A
	for <qemu-arm@nongnu.org>; Mon,  5 Sep 2016 08:00:27 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 86E2D640072;
	Mon,  5 Sep 2016 08:00:24 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 07:59:59 +0200
Message-Id: <1473055209-18864-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 719168567989865233
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.180.21
Subject: [Qemu-arm] [PATCH v4 00/10] arm: add ast2500 support
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gm9GiUGVbXaN

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

Thanks,

C.

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

C=C3=A9dric Le Goater (10):
  ast2400: rename the Aspeed SoC files to aspeed_soc
  ast2400: replace ast2400 with aspeed_soc
  aspeed-soc: provide a framework to add new SoCs
  palmetto-bmc: rename the Aspeed board file to aspeed.c
  palmetto-bmc: replace palmetto_bmc with aspeed
  palmetto-bmc: add board specific configuration
  hw/misc: use macros to define hw-strap1 register on the AST2400 Aspeed
    SoC
  aspeed: add a AST2500 SoC and support to the SCU and SDMC controllers
    controllers
  arm: add support for an ast2500 evaluation board
  palmetto-bmc: remove extra no_sdcard assignement

 hw/arm/Makefile.objs               |   2 +-
 hw/arm/aspeed.c                    | 187 +++++++++++++++++++++++++++++++=
++++
 hw/arm/{ast2400.c =3D> aspeed_soc.c} | 126 ++++++++++++++----------
 hw/arm/palmetto-bmc.c              | 102 --------------------
 hw/misc/aspeed_scu.c               |  45 ++++++++-
 hw/misc/aspeed_sdmc.c              |   1 +
 include/hw/arm/aspeed_soc.h        |  59 ++++++++++++
 include/hw/arm/ast2400.h           |  44 ---------
 include/hw/misc/aspeed_scu.h       | 193 +++++++++++++++++++++++++++++++=
++++++
 9 files changed, 559 insertions(+), 200 deletions(-)
 create mode 100644 hw/arm/aspeed.c
 rename hw/arm/{ast2400.c =3D> aspeed_soc.c} (60%)
 delete mode 100644 hw/arm/palmetto-bmc.c
 create mode 100644 include/hw/arm/aspeed_soc.h
 delete mode 100644 include/hw/arm/ast2400.h

--=20
2.7.4

