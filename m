Received: by 10.25.190.12 with SMTP id o12csp386138lff;
        Wed, 18 Jan 2017 09:12:42 -0800 (PST)
X-Received: by 10.237.36.208 with SMTP id u16mr4057047qtc.105.1484759562569;
        Wed, 18 Jan 2017 09:12:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z93si639371qkg.289.2017.01.18.09.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jan 2017 09:12:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTtmp-00005G-L6
	for alex.bennee@linaro.org; Wed, 18 Jan 2017 12:12:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cTtWy-0003o1-Uc
	for qemu-devel@nongnu.org; Wed, 18 Jan 2017 11:56:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cTtWv-0008AR-2R
	for qemu-devel@nongnu.org; Wed, 18 Jan 2017 11:56:17 -0500
Received: from 12.mo1.mail-out.ovh.net ([87.98.162.229]:55052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cTtWu-00089t-Sn
	for qemu-devel@nongnu.org; Wed, 18 Jan 2017 11:56:13 -0500
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 340493CB75
	for <qemu-devel@nongnu.org>; Wed, 18 Jan 2017 17:56:11 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 3C1C858008B;
	Wed, 18 Jan 2017 17:56:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Jan 2017 17:55:31 +0100
Message-Id: <1484758531-15093-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484758531-15093-1-git-send-email-clg@kaod.org>
References: <1484758531-15093-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11397203282045537041
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrfeelgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.162.229
Subject: [Qemu-devel] [PATCH 2/2] aspeed: add a watchdog controller
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
X-TUID: MbY5035pGYra

This enables reboot of a guest from U-Boot and Linux.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_soc.c         | 13 +++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 4fb777e6df6e..6df76382f007 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -31,6 +31,7 @@
 #define ASPEED_SOC_SCU_BASE         0x1E6E2000
 #define ASPEED_SOC_SRAM_BASE        0x1E720000
 #define ASPEED_SOC_TIMER_BASE       0x1E782000
+#define ASPEED_SOC_WDT_BASE         0x1E785000
 #define ASPEED_SOC_I2C_BASE         0x1E78A000
=20
 static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
@@ -170,6 +171,10 @@ static void aspeed_soc_init(Object *obj)
                          sc->info->silicon_rev);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size", &error_abort);
+
+    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
+    object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
+    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -289,6 +294,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
+
+    /* Watch dog */
+    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, ASPEED_SOC_WDT_BASE);
 }
=20
 static void aspeed_soc_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 1ab5deaa0813..dbec0c159885 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -19,6 +19,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/watchdog/wdt_aspeed.h"
=20
 #define ASPEED_SPIS_NUM  2
=20
@@ -37,6 +38,7 @@ typedef struct AspeedSoCState {
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
+    AspeedWDTState wdt;
 } AspeedSoCState;
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
--=20
2.7.4

