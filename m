Received: by 10.25.21.156 with SMTP id 28csp315597lfv;
        Tue, 2 Aug 2016 10:18:04 -0700 (PDT)
X-Received: by 10.55.116.70 with SMTP id p67mr73977990qkc.150.1470158284197;
        Tue, 02 Aug 2016 10:18:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81si2086665qkt.63.2016.08.02.10.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdKN-0006y5-Ep
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:18:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIW-000635-9D
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIS-000784-8s
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:08 -0400
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:52908)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdIR-00077m-VL
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:04 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 191401000C5C
	for <qemu-devel@nongnu.org>; Tue,  2 Aug 2016 19:16:00 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id C11671000A0;
	Tue,  2 Aug 2016 19:15:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:37 +0200
Message-Id: <1470158147-16378-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15370785530134170385
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.75.26
Subject: [Qemu-devel] [PATCH v3 00/10]  arm: add ast2500 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMyHVL2mGFvA

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

Notes :

    On the AST2500, I am still having a little issue under uboot which
    sets the vbar doing :

	mcr     p15, 0, r0, c12, c0, 0  /* Set VBAR */

    and this is trapped as an undefined instruction by qemu.

    Looking at hw/arm/helper.c, the VBAR register seems to be defined
    only for feature ARM_FEATURE_V7 (v7_cp_reginfo). The AST2500 SoC
    uses a arm1176 which defines ARM_FEATURE_EL3 which gives us a
    VBAR_EL3.  According to th specs, the arm1176jzf-s has a Vector
    Base Address Register. So am I missing something in the board
    definition or is uboot being too optimistic on the cpu features ?
    This is confusing for me, some direction would be welcomed :)

A part from that, the SoC behaves fine.

Thanks,

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

 hw/arm/Makefile.objs         |   2 +-
 hw/arm/aspeed.c              | 187 ++++++++++++++++++++++++++++++++
 hw/arm/aspeed_soc.c          | 251 +++++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/ast2400.c             | 229 -------------------------------------=
--
 hw/arm/palmetto-bmc.c        | 102 ------------------
 hw/misc/aspeed_scu.c         |  45 +++++++-
 hw/misc/aspeed_sdmc.c        |   1 +
 include/hw/arm/aspeed_soc.h  |  59 ++++++++++
 include/hw/arm/ast2400.h     |  44 --------
 include/hw/misc/aspeed_scu.h | 193 +++++++++++++++++++++++++++++++++
 10 files changed, 736 insertions(+), 377 deletions(-)
 create mode 100644 hw/arm/aspeed.c
 create mode 100644 hw/arm/aspeed_soc.c
 delete mode 100644 hw/arm/ast2400.c
 delete mode 100644 hw/arm/palmetto-bmc.c
 create mode 100644 include/hw/arm/aspeed_soc.h
 delete mode 100644 include/hw/arm/ast2400.h

--=20
2.7.4

