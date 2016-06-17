Received: by 10.25.21.96 with SMTP id l93csp156724lfi;
        Fri, 17 Jun 2016 01:48:10 -0700 (PDT)
X-Received: by 10.200.53.142 with SMTP id k14mr905024qtb.63.1466153290544;
        Fri, 17 Jun 2016 01:48:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f31si4140287qkf.112.2016.06.17.01.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 01:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDpRi-00028o-1e
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 04:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDpOd-000880-4N
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 04:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDpOX-0003xB-5O
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 04:44:58 -0400
Received: from 2.mo53.mail-out.ovh.net ([178.33.254.39]:52355)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDpOW-0003wp-VO
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 04:44:53 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id B3215FF9404
	for <qemu-devel@nongnu.org>; Fri, 17 Jun 2016 10:36:23 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 2188A62009F;
	Fri, 17 Jun 2016 10:36:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 17 Jun 2016 10:35:51 +0200
Message-Id: <1466152555-10406-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13152481238417246993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrledtgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.254.39
Subject: [Qemu-devel] [PATCH 0/4] ast2400: SMC controllers
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JpuzsK67joTZ

Hello,

The following adds support for the AST2400 SMC controllers. The device
model does not implement all the HW features, linear addressing mode
is underway, but it should be complete enough for the OpenBMC distro.

Code is based on Andrew's SCU model :=20

    https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg04420.html

Flash images can be grabbed here for testing :

    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalm=
etto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

Thanks,

C=C3=A9dric Le Goater (4):
  ast2400: add SMC controllers (FMC and SPI)
  ast2400: add SPI flash slave object
  ast2400: create SPI flash slaves
  tests: add a m25p80 test

 hw/arm/ast2400.c            |  31 +++
 hw/arm/palmetto-bmc.c       |   3 +
 hw/ssi/Makefile.objs        |   1 +
 hw/ssi/aspeed_smc.c         | 451 ++++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h    |   3 +
 include/hw/ssi/aspeed_smc.h | 105 +++++++++++
 tests/Makefile.include      |   2 +
 tests/m25p80-test.c         | 241 +++++++++++++++++++++++
 8 files changed, 837 insertions(+)
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/ssi/aspeed_smc.h
 create mode 100644 tests/m25p80-test.c

--=20
2.1.4

