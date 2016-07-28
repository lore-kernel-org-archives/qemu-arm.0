Received: by 10.25.21.156 with SMTP id 28csp836161lfv;
        Thu, 28 Jul 2016 07:29:07 -0700 (PDT)
X-Received: by 10.129.20.214 with SMTP id 205mr27941629ywu.127.1469716147461;
        Thu, 28 Jul 2016 07:29:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128si8143358qkd.192.2016.07.28.07.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmJ8-0007hV-US
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:29:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmIo-0007Hv-0N
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmIi-0005mj-Ac
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:45 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:35328)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmIi-0005mL-54
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:40 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3787C1000C04
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:28:39 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id E112D5C0092;
	Thu, 28 Jul 2016 16:28:34 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:10 +0200
Message-Id: <1469716099-8975-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1627769792790039313
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.72.216
Subject: [Qemu-arm] [PATCH v2 0/9] arm: add ast2500 support
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
X-TUID: TamNj/PTMceK

The ast2500 soc being very close to the ast2400 soc, the goal of the
changes below is to modify the existing platform 'palmetto-bmc' and
existing soc 'ast2400' to take into account the small differences and
avoid code duplication. This is mostly inspired by the realview
platform.

First patches rework the 'palmetto-bmc' platform and the 'ast2400' soc
models to provide room to other platforms and socs which have a common
design. Being able to set the 'silicon-rev' and the cpu model are the
primary motivation.

The last patches add support for the new ast2500 soc in the required
controller (sdmc and scu) and define a new platform for an Aspeed
evaluation board.

On the ast2500, I am still having a little issue under uboot which
sets the vbar doing :

	mcr     p15, 0, r0, c12, c0, 0  /* Set VBAR */

and this is trapped as an undefined instruction by qemu.

Looking at hw/arm/helper.c, the VBAR register seems to be defined only
for feature ARM_FEATURE_V7 (v7_cp_reginfo). The ast2500 soc uses a
arm1176 which defines ARM_FEATURE_EL3 which gives us a VBAR_EL3.
According to th specs, the arm1176jzf-s has a Vector Base Address
Register. So am I missing something in the board definition or is
uboot being too optimistic on the cpu features ? This is confusing for
me, some direction would be welcomed :)

A part from that, the soc behaves fine.

Thanks,

Most notable changes in v2 are :

  - palmetto_bmc.c file rename
  - SCU macros to define the hardware strapping register=20

C=C3=A9dric Le Goater (9):
  palmetto-bmc: rename file to aspeed.c
  palmetto-bmc: add a "silicon-rev" property at the soc level
  palmetto-bmc: replace palmetto_bmc with aspeed
  ast2400: use machine cpu_model to initialize the soc cpu
  palmetto-bmc: add board specific configuration
  hw/misc: use macros to define hw-strap1 register on Aspeed SOC
  aspeed: add ast2500 support to scu and sdmc controllers
  arm: add support for an ast2500 evaluation board
  palmetto-bmc: remove extra no_sdcard assignement

 hw/arm/Makefile.objs         |   2 +-
 hw/arm/aspeed.c              | 166 +++++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/ast2400.c             |  21 ++++--
 hw/arm/palmetto-bmc.c        | 102 --------------------------
 hw/misc/aspeed_scu.c         |  45 +++++++++++-
 hw/misc/aspeed_sdmc.c        |   1 +
 include/hw/arm/ast2400.h     |   5 ++
 include/hw/misc/aspeed_scu.h | 165 +++++++++++++++++++++++++++++++++++++=
+++++
 8 files changed, 397 insertions(+), 110 deletions(-)
 create mode 100644 hw/arm/aspeed.c
 delete mode 100644 hw/arm/palmetto-bmc.c

--=20
2.1.4

