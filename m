Received: by 10.25.21.156 with SMTP id 28csp320854lfv;
        Fri, 8 Jul 2016 09:08:14 -0700 (PDT)
X-Received: by 10.55.103.137 with SMTP id b131mr8527053qkc.175.1467994093920;
        Fri, 08 Jul 2016 09:08:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si2864329qkf.151.2016.07.08.09.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jul 2016 09:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bLYK5-00007o-8m
	for alex.bennee@linaro.org; Fri, 08 Jul 2016 12:08:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJv-0008U5-Dm
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:08:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bLYJq-0002Jd-Ew
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:08:02 -0400
Received: from mo179.mail-out.ovh.net ([178.32.228.179]:48781)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bLYJq-0002JP-7t
	for qemu-arm@nongnu.org; Fri, 08 Jul 2016 12:07:58 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id BABBC100C3FC
	for <qemu-arm@nongnu.org>; Fri,  8 Jul 2016 18:07:57 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 6B08F1C007D;
	Fri,  8 Jul 2016 18:07:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri,  8 Jul 2016 18:06:54 +0200
Message-Id: <1467994016-11678-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467994016-11678-1-git-send-email-clg@kaod.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14978127938664368913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.179
Subject: [Qemu-arm] [PATCH 3/5] ast2400: pretend DMAs are done for U-boot
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
X-TUID: kQm8iwONeZE9

U-boot does SPI timing calibration using DMA tranfers. To let the
initialization continue, we fake success by setting the DMA status of
the Interrupt Control Register.

For the moment, DMA support is not required as it is not used in
normal operation.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 854474b642ea..d319e04a27f0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -273,6 +273,9 @@ static void aspeed_smc_reset(DeviceState *d)
=20
     memset(s->regs, 0, sizeof s->regs);
=20
+    /* Pretend DMA is done (u-boot initialization) */
+    s->regs[R_INTR_CTRL] =3D INTR_CTRL_DMA_STATUS;
+
     /* Unselect all slaves */
     for (i =3D 0; i < s->num_cs; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
@@ -297,6 +300,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
     if (addr =3D=3D s->r_conf ||
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
+        addr =3D=3D R_INTR_CTRL ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
         return s->regs[addr];
     } else {
--=20
2.1.4

