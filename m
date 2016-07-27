Received: by 10.25.21.156 with SMTP id 28csp349438lfv;
        Wed, 27 Jul 2016 09:51:24 -0700 (PDT)
X-Received: by 10.55.12.1 with SMTP id 1mr36736427qkm.136.1469638284481;
        Wed, 27 Jul 2016 09:51:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q187si4877861qkd.89.2016.07.27.09.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 09:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSS3H-00027G-TY
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 12:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzT-0007Ad-0h
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzQ-0001sp-5n
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:26 -0400
Received: from 9.mo7.mail-out.ovh.net ([46.105.60.248]:57234)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSRzP-0001rJ-VP
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:24 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 5CACBFFCFBF
	for <qemu-devel@nongnu.org>; Wed, 27 Jul 2016 18:47:20 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 3F3625C0086;
	Wed, 27 Jul 2016 18:47:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2016 18:46:52 +0200
Message-Id: <1469638018-17590-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16543973234748853009
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.60.248
Subject: [Qemu-devel] [PATCH 0/6] arm: add ast2500 support
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
X-TUID: xrfE+zLT3skB

The ast2500 soc being very close to the ast2400 soc, the goal of the
changes below is to modify the existing platform 'palmetto-bmc' and
existing soc 'ast2400' to take into account the small differences and
avoid code duplication. This is mostly inspired by the realview
platform.

First patches rework the palmetto-bmc platform and the ast2400 soc
models to provide room to other platforms and socs which have a common
design. Being able to set the 'silicon-rev' and the cpu model are the
primary motivation.

I tried to link all the silicon-rev properties to a common one (in the
SCU controller) but I failed to find the right pattern. I am not sure
it is possible to have multiple aliases on the same property. You will
see what I came up with in the first patch.

The last patches add support for the new ast2500 soc in the required
controller (sdmc and scu) and define a new platform for an Aspeed
evaluation board.

The 'palmetto-bmc.c' file could be renamed to 'aspeed.c' now that it
contains more than one platform, but I don't really like the idea as
it breaks history. As for the ast2400.c file, I think we are fine as
we are just adding a configurable cpu. Nothing major. Please advise on
that topic.


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


C=C3=A9dric Le Goater (6):
  palmetto-bmc: add a "silicon-rev" property at the soc level
  palmetto-bmc: replace palmetto_bmc with aspeed
  ast2400: use machine cpu_model to initialize the soc cpu
  palmetto-bmc: add board specific configuration
  aspeed/scu: add ast2500 support
  arm: add support for an ast2500 evaluation board

 hw/arm/ast2400.c             |  26 +++++++---
 hw/arm/palmetto-bmc.c        | 115 ++++++++++++++++++++++++++++++++++---=
------
 hw/misc/aspeed_scu.c         |  45 ++++++++++++++++-
 hw/misc/aspeed_sdmc.c        |   1 +
 include/hw/arm/ast2400.h     |   5 ++
 include/hw/misc/aspeed_scu.h |   1 +
 6 files changed, 163 insertions(+), 30 deletions(-)

--=20
2.1.4

