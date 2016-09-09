Received: by 10.80.163.71 with SMTP id 65csp200461edn;
        Fri, 9 Sep 2016 09:33:16 -0700 (PDT)
X-Received: by 10.55.5.11 with SMTP id 11mr4921166qkf.280.1473438796399;
        Fri, 09 Sep 2016 09:33:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b34si2534404qtb.136.2016.09.09.09.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOjr-0002nL-Op
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:33:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObG-00037Q-DL
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biObC-0005zy-BQ
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:22 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:47270)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biObC-0005zq-5I
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:18 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id B489DFFC8E6
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:24:17 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 4648D3C006C;
	Fri,  9 Sep 2016 18:24:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:53 +0200
Message-Id: <1473438177-26079-11-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16298808529949002513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.44.197
Subject: [Qemu-arm] [PATCH v5 10/14] palmetto-bmc: remove extra no_sdcard
 assignement
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
X-TUID: kF7AKbwEQwSp

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2af9fe934441..9013d35a674c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -145,7 +145,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
     mc->no_sdcard =3D 1;
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
-    mc->no_sdcard =3D 1;
     mc->no_parallel =3D 1;
 }
=20
--=20
2.7.4

