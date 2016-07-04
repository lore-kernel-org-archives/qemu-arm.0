Received: by 10.25.21.96 with SMTP id l93csp1491575lfi;
        Mon, 4 Jul 2016 05:19:45 -0700 (PDT)
X-Received: by 10.237.33.147 with SMTP id l19mr18050888qtc.33.1467634785002;
        Mon, 04 Jul 2016 05:19:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si2657764qkb.231.2016.07.04.05.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2qm-0006tS-Bb
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2qi-0006tG-FY
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2qd-0003am-Gh
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:19:40 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:37946)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2qd-0003a4-Ab
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:19:35 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 356F0FFB172
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 14:19:34 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 9840948009A;
	Mon,  4 Jul 2016 14:19:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon,  4 Jul 2016 14:18:51 +0200
Message-Id: <1467634738-28642-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6077044750273514257
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.178.58
Subject: [Qemu-arm] [PATCH 0/7] ast2400: U-boot support
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
	qemu-devel@nongnu.org, mar.krzeminski@gmail.com,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5OfYwzhmytc

Hello,

Here is a serie adding the changes requires to boot a ast2400 guest
directly from a flash image. These images generally start with the
U-boot bootloader.

U-boot on the Aspeed SOCs makes use of the SPI controller in the
Command mode. In this mode, the flash content is mapped to a memory
region and accesses are treated like mmios. The proposal below adds a
routine which permits us to share the memory storage between the flash
object and the SPI controller handling the MMIOs. This is very close
to the approach taken by the pflash_cfi object.


The patchset starts with a test case for the m25p80 which now supports
BE host, followed with an addon for the mx25l25635f flash modules.
These modules are common in the OpenPower ecosystem. Then come the
changes to support the SPI controller Command mode and the mapping of
the first BMC flash at 0x0. Last, is initial support for the memory
controller which is used in some occasion to retrieve the size of the
RAM.

Thanks,

C.

C=C3=A9dric Le Goater (7):
  tests: add a m25p80 test
  m25p80: add mx25l25635f chip
  ast2400: use a mx25l25635f chip
  m25p80: add a m25p80_set_rom_storage() routine
  ast2400: handle SPI flash Command mode (read only)
  ast2400: use contents of first SPI flash as a rom
  ast2400: add a memory controller device model

 hw/arm/ast2400.c              |  13 +++
 hw/arm/palmetto-bmc.c         |  22 +++-
 hw/block/m25p80.c             |  18 ++-
 hw/misc/Makefile.objs         |   2 +-
 hw/misc/aspeed_sdmc.c         | 126 +++++++++++++++++++++
 hw/ssi/aspeed_smc.c           |  60 +++++++++-
 include/hw/arm/ast2400.h      |   1 +
 include/hw/block/flash.h      |   2 +
 include/hw/misc/aspeed_sdmc.h |  49 ++++++++
 include/hw/ssi/aspeed_smc.h   |   1 +
 tests/Makefile.include        |   2 +
 tests/m25p80-test.c           | 256 ++++++++++++++++++++++++++++++++++++=
++++++
 12 files changed, 544 insertions(+), 8 deletions(-)
 create mode 100644 hw/misc/aspeed_sdmc.c
 create mode 100644 include/hw/misc/aspeed_sdmc.h
 create mode 100644 tests/m25p80-test.c

--=20
2.1.4

