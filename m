Received: by 10.25.21.96 with SMTP id l93csp1209000lfi;
        Mon, 27 Jun 2016 09:43:58 -0700 (PDT)
X-Received: by 10.200.44.136 with SMTP id 8mr25960681qtw.18.1467045838866;
        Mon, 27 Jun 2016 09:43:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1si6467788qkd.3.2016.06.27.09.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 09:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHZde-0001xJ-73
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 12:43:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZda-0001vx-5K
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZdW-00088g-4Y
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:43:54 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:33392)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHZdV-00088N-Tg
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:43:50 -0400
Received: from player728.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id E3B6710101E2
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 18:43:47 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id A4B9E54008E;
	Mon, 27 Jun 2016 18:43:38 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 27 Jun 2016 18:43:28 +0200
Message-Id: <1467045813-18144-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6323898302461283089
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.48.182
Subject: [Qemu-arm] [PATCH v4 0/5] ast2400: SMC controllers
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
X-TUID: 9AJOgFyEmnpN

Hello,

The following adds support for the AST2400 SMC controllers. The device
model does not implement all the HW features, linear addressing mode
is underway, but it should be complete enough for the OpenBMC distro.

Code is based on Andrew's SCU model (v3) :=20

    https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg07042.html

Flash images can be grabbed here for testing :

    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalm=
etto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor


Changes Since v3:
  - fixed sabrelite_init() to use drive_get_next()
  - fixed typos
  - fixed multiple error handling when setting properties
  - fixed error logging
  - added extra register definitions
  - constantified a couple of routine arguments
  - sorted out what was need for migration
  - reworked the structures handling the IOs on the flash modules
  - moved mapping in SOC initialization  =20

Changes Since v2:

  - switched to a realize ops =20
  - moved the initialization of the flash modules under the palmetto
    platform
  - changed mkstemp() path prefix

Changes Since v1:

  - included Paolo's fix adding a "drive" property to the flash device
    model   =20
  - fixed drive definition in the test command line


C=C3=A9dric Le Goater (4):
  ast2400: add SMC controllers (FMC and SPI)
  ast2400: add SPI flash slaves
  ast2400: create SPI flash slaves
  tests: add a m25p80 test

Paolo Bonzini (1):
  m25p80: qdev-ify drive property

 hw/arm/ast2400.c                    |  39 ++-
 hw/arm/palmetto-bmc.c               |  31 +++
 hw/arm/sabrelite.c                  |  18 +-
 hw/arm/xilinx_zynq.c                |   8 +-
 hw/arm/xlnx-ep108.c                 |   9 +-
 hw/block/m25p80.c                   |  10 +-
 hw/microblaze/petalogix_ml605_mmu.c |   9 +-
 hw/ssi/Makefile.objs                |   1 +
 hw/ssi/aspeed_smc.c                 | 470 ++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h            |   3 +
 include/hw/ssi/aspeed_smc.h         | 100 ++++++++
 tests/Makefile.include              |   2 +
 tests/m25p80-test.c                 | 242 +++++++++++++++++++
 13 files changed, 924 insertions(+), 18 deletions(-)
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/ssi/aspeed_smc.h
 create mode 100644 tests/m25p80-test.c

--=20
2.1.4

