Received: by 10.25.15.230 with SMTP id 99csp3476690lfp;
        Sat, 1 Apr 2017 05:59:38 -0700 (PDT)
X-Received: by 10.55.94.198 with SMTP id s189mr6797939qkb.225.1491051577937;
        Sat, 01 Apr 2017 05:59:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v144si7309542qka.79.2017.04.01.05.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Apr 2017 05:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cuIcx-0002aE-Bo
	for alex.bennee@linaro.org; Sat, 01 Apr 2017 08:59:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cuIcn-0002Zq-MQ
	for qemu-arm@nongnu.org; Sat, 01 Apr 2017 08:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cuIci-0004DZ-SZ
	for qemu-arm@nongnu.org; Sat, 01 Apr 2017 08:59:25 -0400
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:48065)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cuIci-00049Y-Mo
	for qemu-arm@nongnu.org; Sat, 01 Apr 2017 08:59:20 -0400
Received: from player799.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 01D66E44CC
	for <qemu-arm@nongnu.org>; Sat,  1 Apr 2017 14:59:12 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id AE059520078;
	Sat,  1 Apr 2017 14:58:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  1 Apr 2017 14:57:53 +0200
Message-Id: <1491051477-10455-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11826171149267602193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrleefgdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.124.100
Subject: [Qemu-arm] [PATCH 0/4] FTGMAC100 nic model for the Aspeed SoCs
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mrENZtdwAm2G

Hi,

The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
controllers. This serie proposes a model for this device and a way to
customize the bit definitions which are slightly different from the
Faraday definitions.

The last patch adds a fake NC-SI (Network Controller Sideband
Interface) backend to pretend a NIC is being managed. This is only
usable with the slirp stack.

The model has been tested on the 'palmetto' and the 'romulus' machine
using different implementations of the Linux driver and with U-Boot.
It has been stressed with iperf.

Thanks,

C.=20

C=C3=A9dric Le Goater (4):
  net: add FTGMAC100 support
  net/ftgmac100: add a 'aspeed' property
  aspeed: add a FTGMAC100 nic
  slirp: add a fake NC-SI backend

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed_soc.c             |  21 +
 hw/net/Makefile.objs            |   1 +
 hw/net/ftgmac100.c              | 990 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/aspeed_soc.h     |   2 +
 include/hw/net/ftgmac100.h      |  62 +++
 include/hw/net/mii.h            |   6 +
 include/net/eth.h               |   1 +
 slirp/Makefile.objs             |   2 +-
 slirp/ncsi-pkt.h                | 418 +++++++++++++++++
 slirp/ncsi.c                    |  78 ++++
 slirp/slirp.c                   |   4 +
 slirp/slirp.h                   |   3 +
 13 files changed, 1588 insertions(+), 1 deletion(-)
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 include/hw/net/ftgmac100.h
 create mode 100644 slirp/ncsi-pkt.h
 create mode 100644 slirp/ncsi.c

--=20
2.7.4

