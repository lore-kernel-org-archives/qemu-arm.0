Received: by 10.25.21.156 with SMTP id 28csp320907lfv;
        Fri, 8 Jul 2016 09:08:18 -0700 (PDT)
X-Received: by 10.200.37.9 with SMTP id 9mr10098222qtm.31.1467994096593;
        Fri, 08 Jul 2016 09:08:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b76si2294051qkc.289.2016.07.08.09.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jul 2016 09:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bLYK7-0000Ae-Uf
	for alex.bennee@linaro.org; Fri, 08 Jul 2016 12:08:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJj-0008KX-1s
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJc-0002Ee-St
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:07:49 -0400
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:35579)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bLYJc-0002EJ-Mh
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:07:44 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 32937100C3FC
	for <qemu-arm@nongnu.org>; Fri,  8 Jul 2016 18:07:38 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 1D5A71C007D;
	Fri,  8 Jul 2016 18:07:32 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri,  8 Jul 2016 18:06:51 +0200
Message-Id: <1467994016-11678-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14972779912666843921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.36.149
Subject: [Qemu-arm] [PATCH 0/5] ast2400: some cleanups and a simple memory
 controller model
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
X-TUID: C5lzNw4UJtEH

Hello,

Here are a couple of cleanups and a very basic memory controller model
providing a configuration register. This is needed to determine the
RAM size of the SOC, only used by U-Boot as of today.

Ultimately, we would want to add more support for U-Boot and be able
to boot from flash 0 but the device model of the m25p80 object is not
designed to use a memory region. And so, it is difficult to define a
rom device for the flash backend.

Some initial patches were proposed but they are not being friendly
with the object interface. Work in progress.

Thanks,

C.=20

C=C3=A9dric Le Goater (5):
  hw/misc: fix typo in Aspeed SCU hw-strap2 property name
  ast2400: replace aspeed_smc_is_implemented()
  ast2400: pretend DMAs are done for U-boot
  ast2400: externalize revision numbers
  ast2400: add a memory controller device model

 hw/arm/ast2400.c              |  17 ++-
 hw/misc/Makefile.objs         |   2 +-
 hw/misc/aspeed_scu.c          |   6 +-
 hw/misc/aspeed_sdmc.c         | 245 ++++++++++++++++++++++++++++++++++++=
++++++
 hw/ssi/aspeed_smc.c           |  39 ++++---
 include/hw/arm/ast2400.h      |   2 +
 include/hw/misc/aspeed_scu.h  |   5 +
 include/hw/misc/aspeed_sdmc.h |  31 ++++++
 8 files changed, 320 insertions(+), 27 deletions(-)
 create mode 100644 hw/misc/aspeed_sdmc.c
 create mode 100644 include/hw/misc/aspeed_sdmc.h

--=20
2.1.4

