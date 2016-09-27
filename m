Received: by 10.80.163.71 with SMTP id 65csp1920685edn;
        Tue, 27 Sep 2016 05:20:45 -0700 (PDT)
X-Received: by 10.55.174.2 with SMTP id x2mr29003849qke.63.1474978845798;
        Tue, 27 Sep 2016 05:20:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k192si1367027qke.306.2016.09.27.05.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borNN-0000cR-7g
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:20:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor72-0001PH-JE
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6x-0002wB-OA
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:51 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:41327)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor6x-0002vt-Im
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:47 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 185CCFFA280
	for <qemu-arm@nongnu.org>; Tue, 27 Sep 2016 14:03:47 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 9F4DD580091;
	Tue, 27 Sep 2016 14:03:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:41 +0200
Message-Id: <1474977462-28032-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6927380653503515409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.74.227
Subject: [Qemu-arm] [PATCH 5/6] aspeed: create mapping regions for the
 maximum number of slaves
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
X-TUID: R1fOl6Hl+24h

The SMC controller on the Aspeed SoC has a set of registers to
configure the mapping of each flash module in the SoC address
space. These mapping windows are configurable even though no SPI slave
is attached to the controller.

Also rewrite a bit the comments in the code on this topic.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 21943f4e5dfa..ecf39ccfde0e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -417,12 +417,15 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
=20
     aspeed_smc_reset(dev);
=20
+    /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
                           s->ctrl->name, ASPEED_SMC_R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
=20
     /*
-     * Memory region where flash modules are remapped
+     * The container memory region representing the address space
+     * window in which the flash modules are mapped. The size and
+     * address depends on the SoC model and controller type.
      */
     snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
=20
@@ -431,9 +434,16 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
                           s->ctrl->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash);
=20
-    s->flashes =3D g_new0(AspeedSMCFlash, s->num_cs);
+    s->flashes =3D g_new0(AspeedSMCFlash, s->ctrl->max_slaves);
=20
-    for (i =3D 0; i < s->num_cs; ++i) {
+    /*
+     * Let's create a sub memory region for each possible slave. All
+     * have a configurable memory segment in the overall flash mapping
+     * window of the controller but, there is not necessarily a flash
+     * module behind to handle the memory accesses. This depends on
+     * the board configuration.
+     */
+    for (i =3D 0; i < s->ctrl->max_slaves; ++i) {
         AspeedSMCFlash *fl =3D &s->flashes[i];
=20
         snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
--=20
2.7.4

