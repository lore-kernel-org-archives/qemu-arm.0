Received: by 10.80.163.71 with SMTP id 65csp1917744edn;
        Tue, 27 Sep 2016 05:14:15 -0700 (PDT)
X-Received: by 10.129.77.67 with SMTP id a64mr19725891ywb.129.1474978455425;
        Tue, 27 Sep 2016 05:14:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d83si670754ywe.130.2016.09.27.05.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borH4-000320-Rv
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:14:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6W-0000yX-Ie
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6R-0002k6-Ib
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:19 -0400
Received: from 6.mo178.mail-out.ovh.net ([46.105.53.132]:54325)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor6R-0002jq-CL
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:15 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 7DD60FFA253
	for <qemu-arm@nongnu.org>; Tue, 27 Sep 2016 14:03:14 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id B51C4580085;
	Tue, 27 Sep 2016 14:02:53 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:36 +0200
Message-Id: <1474977462-28032-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6918091980184193809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.53.132
Subject: [Qemu-arm] [PATCH 0/6] aspeed: add support for the ast2500 SMC
 controllers
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
X-TUID: /32oUn59J+lY

Hello,

The Aspeed AST2500 has one 'SPI' controller for the BMC firmware and
two 'SPI' for the host firmware. All controllers have now the same set
of registers compatible with the AST2400 'FMC' controller and the
legacy 'SMC' controller is fully gone.

This serie adds support for the second SPI controller and for the
segment registers which are used to configure the mapping of each
flash module in the SoC address space.

Thanks,

C.=20

C=C3=A9dric Le Goater (6):
  aspeed: rename smc object to fmc
  aspeed: move the flash module mapping address under the controller
    definition
  aspeed: extend the number of host SPI controllers
  aspeed: add support for the AST2500 SoC SMC controllers
  aspeed: create mapping regions for the maximum number of slaves
  aspeed: add support for the SMC segment registers

 hw/arm/aspeed.c             |   4 +-
 hw/arm/aspeed_soc.c         |  74 +++++++++++------
 hw/ssi/aspeed_smc.c         | 194 ++++++++++++++++++++++++++++++++++++++=
+++---
 include/hw/arm/aspeed_soc.h |  10 ++-
 include/hw/ssi/aspeed_smc.h |   3 +-
 5 files changed, 241 insertions(+), 44 deletions(-)

--=20
2.7.4

