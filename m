Received: by 10.25.150.194 with SMTP id y185csp2421159lfd;
        Tue, 29 Nov 2016 08:03:54 -0800 (PST)
X-Received: by 10.55.49.76 with SMTP id x73mr24035480qkx.188.1480435434296;
        Tue, 29 Nov 2016 08:03:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n89si27881551qtd.91.2016.11.29.08.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:03:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBksr-0005B6-3x
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:03:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdA-0008HJ-Hd
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkd6-0005el-Kd
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:40 -0500
Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232]:49131)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkd6-0005eN-EJ
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:36 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id A25C91F850
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:47:30 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 14AC812009B;
	Tue, 29 Nov 2016 16:47:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:58 +0100
Message-Id: <1480434248-27138-21-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11750454379731323665
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.60.232
Subject: [Qemu-arm] [PATCH for-2.9 20/30] aspeed/smc: add a 'sdram_base'
 property
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I1JfwhSNG0M/

The setting of the DRAM address of the DMA transaction depends on the
DRAM base address of the SoC, so we add a property to give this
information to the model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c         | 5 ++++-
 hw/ssi/aspeed_smc.c         | 1 +
 include/hw/ssi/aspeed_smc.h | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b3e7f07b615d..4fb777e6df6e 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -253,7 +253,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
=20
     /* FMC, The number of CS is set at the board level */
-    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
+    object_property_set_int(OBJECT(&s->fmc), sc->info->sdram_base, "sdra=
m-base",
+                            &err);
+    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_e=
rr);
+    error_propagate(&err, local_err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8e7e3bd9e335..24c78aa57537 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -819,6 +819,7 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
 };
=20
 static Property aspeed_smc_properties[] =3D {
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 39ee601940e8..88a904849801 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -96,6 +96,9 @@ typedef struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
=20
+    /* for DMA support */
+    uint64_t sdram_base;
+
     AspeedSMCFlash *flashes;
 } AspeedSMCState;
=20
--=20
2.7.4

