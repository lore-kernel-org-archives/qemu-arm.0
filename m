Received: by 10.25.150.194 with SMTP id y185csp2471426lfd;
        Tue, 29 Nov 2016 09:44:32 -0800 (PST)
X-Received: by 10.55.154.200 with SMTP id c191mr25474163qke.117.1480441472276;
        Tue, 29 Nov 2016 09:44:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l68si15812160qte.4.2016.11.29.09.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 09:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBmSF-0008Kl-2A
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 12:44:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmQ9-0007Ch-9Q
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 12:42:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmQ5-0001L6-9Z
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 12:42:21 -0500
Received: from mo69.mail-out.ovh.net ([178.32.228.69]:40503)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBmQ5-0001Je-2J
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 12:42:17 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4267FCE7B
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 18:42:15 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id D9F05240078;
	Tue, 29 Nov 2016 18:42:06 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 18:41:59 +0100
Message-Id: <1480441323-31417-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13688409595713981201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.228.69
Subject: [Qemu-devel] [RFC PATCH 0/4] FTGMAC100 model for the Aspeed SoCs
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RExisaGGL1ws

Hi,

The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
controllers. This serie proposes a model for this device and a way to
customize the bit definitions which are slightly different from the
Faraday definitions.

The last patch adds a fake NC-SI (Network Controller Sideband
Interface) backend to pretend a NIC is being managed.

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
 hw/net/ftgmac100.c              | 866 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/aspeed_soc.h     |   2 +
 include/hw/net/ftgmac100.h      |  54 +++
 include/net/eth.h               |   1 +
 slirp/Makefile.objs             |   2 +-
 slirp/ncsi-pkt.h                | 418 +++++++++++++++++++
 slirp/ncsi.c                    |  78 ++++
 slirp/slirp.c                   |   4 +
 slirp/slirp.h                   |   3 +
 12 files changed, 1450 insertions(+), 1 deletion(-)
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 include/hw/net/ftgmac100.h
 create mode 100644 slirp/ncsi-pkt.h
 create mode 100644 slirp/ncsi.c

--=20
2.7.4

