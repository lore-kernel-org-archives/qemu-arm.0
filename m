Received: by 10.25.0.144 with SMTP id 138csp659496lfa;
        Thu, 13 Apr 2017 02:42:31 -0700 (PDT)
X-Received: by 10.55.54.16 with SMTP id d16mr1542091qka.97.1492076551825;
        Thu, 13 Apr 2017 02:42:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m50si22202402qtm.193.2017.04.13.02.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 02:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cybGn-0001tW-6e
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 05:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cybGb-0001rs-RK
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cybGX-0000n9-UI
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:42:17 -0400
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:36318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cybGX-0000mu-NQ
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:42:13 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 23C67308E9
	for <qemu-arm@nongnu.org>; Thu, 13 Apr 2017 11:42:11 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 9112B1C00A5;
	Thu, 13 Apr 2017 11:42:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2017 11:41:49 +0200
Message-Id: <1492076514-28821-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5184487597427034897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedrudekgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.49.171
Subject: [Qemu-arm] [PATCH v2 0/5] FTGMAC100 nic model for the Aspeed SoCs
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
X-TUID: +QQQVpGyneg3

Hi,

The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
controllers. This serie proposes a model for this device and a way to
customize the bit definitions which are slightly different from the
Faraday definitions.

The last patch adds a fake NC-SI (Network Controller Sideband
Interface) backend to pretend a NIC is being managed. This is only
usable with the slirp stack.

The model has been tested on the 'palmetto', 'romulus' and
'ast2500-evb' machines using different implementations of the Linux
driver and with U-Boot.  It has been stressed with iperf.

Thanks,

C.=20

C=C3=A9dric Le Goater (5):
  hw/net: add MII definitions
  net: add FTGMAC100 support
  net/ftgmac100: add a 'aspeed' property
  aspeed: add a FTGMAC100 nic
  slirp: add a fake NC-SI backend

 default-configs/arm-softmmu.mak |    1 +
 hw/arm/aspeed_soc.c             |   21 +
 hw/net/Makefile.objs            |    1 +
 hw/net/ftgmac100.c              | 1016 +++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/aspeed_soc.h     |    2 +
 include/hw/net/ftgmac100.h      |   64 +++
 include/hw/net/mii.h            |   71 ++-
 include/net/eth.h               |    1 +
 slirp/Makefile.objs             |    2 +-
 slirp/ncsi-pkt.h                |  418 ++++++++++++++++
 slirp/ncsi.c                    |   78 +++
 slirp/slirp.c                   |    4 +
 slirp/slirp.h                   |    3 +
 13 files changed, 1663 insertions(+), 19 deletions(-)
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 include/hw/net/ftgmac100.h
 create mode 100644 slirp/ncsi-pkt.h
 create mode 100644 slirp/ncsi.c

--=20
2.7.4

