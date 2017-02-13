Received: by 10.25.77.65 with SMTP id a62csp901121lfb;
        Mon, 13 Feb 2017 06:53:15 -0800 (PST)
X-Received: by 10.55.120.3 with SMTP id t3mr21175138qkc.0.1486997595599;
        Mon, 13 Feb 2017 06:53:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p63si7386088qtd.258.2017.02.13.06.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdI08-0005XY-V8
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:53:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cdHsx-0007Ko-0M
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cdHss-000240-RY
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:45:46 -0500
Received: from mo4.mail-out.ovh.net ([178.32.228.4]:48663)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cdHss-00023h-KQ
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:45:42 -0500
Received: from player772.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 270174A96B
	for <qemu-arm@nongnu.org>; Mon, 13 Feb 2017 15:45:40 +0100 (CET)
Received: from zorba.ttt.fr.ibm.com (deibp9eh1--blueice1n3.emea.ibm.com
	[195.212.29.165]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id CF84B409;
	Mon, 13 Feb 2017 15:44:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2017 15:44:21 +0100
Message-Id: <1486997062-23227-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486997062-23227-1-git-send-email-clg@kaod.org>
References: <1486997062-23227-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14293580796094286609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrleefgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.228.4
Subject: [Qemu-arm] [PATCH 1/2] aspeed/smc: add a 'sdram_base' property
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AdW6RfDXY9Yw

The setting of the DRAM address of the DMA transaction depends on the
DRAM base address of the SoC. Let's add a property to give this
information to the SMC controller model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c         | 5 ++++-
 hw/ssi/aspeed_smc.c         | 1 +
 include/hw/ssi/aspeed_smc.h | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 571e4f097b02..6df76382f007 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -258,7 +258,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
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
index cb515730c5ad..f6ecdc014436 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -798,6 +798,7 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
 };
=20
 static Property aspeed_smc_properties[] =3D {
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 1f557313fa93..2c375af7bcbb 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -97,6 +97,9 @@ typedef struct AspeedSMCState {
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

