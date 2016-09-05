Received: by 10.25.87.130 with SMTP id l124csp1791901lfb;
        Sun, 4 Sep 2016 23:04:42 -0700 (PDT)
X-Received: by 10.200.46.25 with SMTP id r25mr37141303qta.114.1473055482008;
        Sun, 04 Sep 2016 23:04:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l64si16644897qkf.101.2016.09.04.23.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgn1N-0004R0-E4
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:04:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxe-0001Ha-O7
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxZ-0001pv-Pc
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:49 -0400
Received: from 7.mo7.mail-out.ovh.net ([46.105.43.131]:60307)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxZ-0001pp-K6
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:45 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 14FB7100024A
	for <qemu-arm@nongnu.org>; Mon,  5 Sep 2016 08:00:45 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id C61F4640078;
	Mon,  5 Sep 2016 08:00:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 08:00:03 +0200
Message-Id: <1473055209-18864-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 724235116471225105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.43.131
Subject: [Qemu-arm] [PATCH v4 04/10] palmetto-bmc: rename the Aspeed board
 file to aspeed.c
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7r1ZZ7fVRfZ9

We plan to add more Aspeed boards to this file. There are no changes
in the code.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Makefile.objs                | 2 +-
 hw/arm/{palmetto-bmc.c =3D> aspeed.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{palmetto-bmc.c =3D> aspeed.c} (100%)

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 7901294630b1..4c5c4ee76c12 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,4 +17,4 @@ obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108=
.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o palmetto-bmc.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/aspeed.c
similarity index 100%
rename from hw/arm/palmetto-bmc.c
rename to hw/arm/aspeed.c
--=20
2.7.4

