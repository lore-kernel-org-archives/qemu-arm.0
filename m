Received: by 10.25.21.96 with SMTP id l93csp1781044lfi;
        Tue, 28 Jun 2016 11:24:58 -0700 (PDT)
X-Received: by 10.55.36.72 with SMTP id w69mr4092329qkg.30.1467138297275;
        Tue, 28 Jun 2016 11:24:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si13767503qtr.72.2016.06.28.11.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxgu-0006Ik-Ny
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:24:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxgq-0006Gd-T9
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxgm-0002Eo-It
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:24:51 -0400
Received: from 9.mo3.mail-out.ovh.net ([87.98.184.141]:59307)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHxgm-0002ET-84
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:24:48 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2D98BFF8E44
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 20:24:43 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 7AE714C0070;
	Tue, 28 Jun 2016 20:24:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 28 Jun 2016 20:24:21 +0200
Message-Id: <1467138270-32481-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13901204678297029393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfeehmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.184.141
Subject: [Qemu-arm] [PATCH v5 0/9] ast2400: SMC controllers
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
X-TUID: w9Yk7c/o8rxE

Hello,

The following adds support for the AST2400 SMC controllers. The device
model does not implement all the HW features, linear addressing mode
is underway, but it should be complete enough for the OpenBMC distro.

Flash images can be grabbed here for testing :

    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalm=
etto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

Based on commit dc154b1db4b9.

Changes Since v4:
  - included "ssi: change ssi_slave_init to be a realize op" which is a
    prereq =20
  - included more fixes from Paolo on m25p80
  - fixed qtest command line and Makefile

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

Thanks,

C.

C=C3=A9dric Le Goater (5):
  ssi: change ssi_slave_init to be a realize ops
  ast2400: add SMC controllers (FMC and SPI)
  ast2400: add SPI flash slaves
  ast2400: create SPI flash slaves
  tests: add a m25p80 test

Paolo Bonzini (4):
  m25p80: do not put iovec on the stack
  m25p80: avoid out of bounds accesses
  m25p80: change cur_addr to 32 bit integer
  m25p80: qdev-ify drive property

 hw/arm/ast2400.c                    |  39 ++-
 hw/arm/palmetto-bmc.c               |  31 +++
 hw/arm/sabrelite.c                  |  18 +-
 hw/arm/spitz.c                      |  12 +-
 hw/arm/tosa.c                       |   5 +-
 hw/arm/xilinx_zynq.c                |   8 +-
 hw/arm/xlnx-ep108.c                 |   9 +-
 hw/arm/z2.c                         |   6 +-
 hw/block/m25p80.c                   |  76 +++---
 hw/display/ads7846.c                |   5 +-
 hw/display/ssd0323.c                |   5 +-
 hw/microblaze/petalogix_ml605_mmu.c |   9 +-
 hw/misc/max111x.c                   |  12 +-
 hw/sd/ssi-sd.c                      |   9 +-
 hw/ssi/Makefile.objs                |   1 +
 hw/ssi/aspeed_smc.c                 | 470 ++++++++++++++++++++++++++++++=
++++++
 hw/ssi/ssi.c                        |   6 +-
 include/hw/arm/ast2400.h            |   3 +
 include/hw/ssi/aspeed_smc.h         | 100 ++++++++
 include/hw/ssi/ssi.h                |   2 +-
 tests/Makefile.include              |   2 +
 tests/m25p80-test.c                 | 242 +++++++++++++++++++
 22 files changed, 985 insertions(+), 85 deletions(-)
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/ssi/aspeed_smc.h
 create mode 100644 tests/m25p80-test.c

--=20
2.1.4

