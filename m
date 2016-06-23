Received: by 10.25.21.96 with SMTP id l93csp614896lfi;
        Thu, 23 Jun 2016 09:37:28 -0700 (PDT)
X-Received: by 10.55.5.144 with SMTP id 138mr47263619qkf.196.1466699848726;
        Thu, 23 Jun 2016 09:37:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a66si912917qkf.17.2016.06.23.09.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 09:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG7dA-0000m0-2I
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 12:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bG7ZY-00042t-7j
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bG7ZT-0001OX-Np
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:33:42 -0400
Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]:51227)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bG7ZT-0001OP-HZ
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:33:39 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id AB9B6FF9F79
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 18:33:38 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id A2D822C00A5;
	Thu, 23 Jun 2016 18:33:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Thu, 23 Jun 2016 18:33:22 +0200
Message-Id: <1466699607-30406-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1108448461453363985
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdeigdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.76.26
Subject: [Qemu-arm] [PATCH v3 0/5] ast2400: SMC controllers
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kk7UCbbwOOlu

Hello,

The following adds support for the AST2400 SMC controllers. The device
model does not implement all the HW features, linear addressing mode
is underway, but it should be complete enough for the OpenBMC distro.

Code is based on Andrew's SCU model (v2) :=20

    https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg06626.html

Flash images can be grabbed here for testing :

    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalm=
etto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

Changes Since v2:

  - switched to a realize ops =20
  - moved the initialization of the flash modules under the palmetto
    platform
  - changed mkstemp() path prefix

Changes Since v1:

  - included Paolo's fix adding a "drive" property to the flash device
    model   =20
  - fixed drive definition in the test command line

Thanks,


C=C3=A9dric Le Goater (4):
  ast2400: add SMC controllers (FMC and SPI)
  ast2400: add SPI flash slave object
  ast2400: create SPI flash slaves
  tests: add a m25p80 test

Paolo Bonzini (1):
  m25p80: qdev-ify drive property

 hw/arm/ast2400.c                    |  31 +++
 hw/arm/palmetto-bmc.c               |  28 +++
 hw/arm/xilinx_zynq.c                |   8 +-
 hw/arm/xlnx-ep108.c                 |   9 +-
 hw/block/m25p80.c                   |  10 +-
 hw/microblaze/petalogix_ml605_mmu.c |   9 +-
 hw/ssi/Makefile.objs                |   1 +
 hw/ssi/aspeed_smc.c                 | 437 ++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h            |   3 +
 include/hw/ssi/aspeed_smc.h         | 103 +++++++++
 tests/Makefile.include              |   2 +
 tests/m25p80-test.c                 | 242 ++++++++++++++++++++
 12 files changed, 872 insertions(+), 11 deletions(-)
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/ssi/aspeed_smc.h
 create mode 100644 tests/m25p80-test.c

--=20
2.1.4

