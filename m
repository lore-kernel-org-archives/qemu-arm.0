Received: by 10.25.150.194 with SMTP id y185csp2463290lfd;
        Tue, 29 Nov 2016 09:27:18 -0800 (PST)
X-Received: by 10.55.186.70 with SMTP id k67mr28263167qkf.265.1480440438515;
        Tue, 29 Nov 2016 09:27:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d76si35417932qkc.278.2016.11.29.09.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 09:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBmBZ-0001TO-7v
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 12:27:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmBU-0001RQ-Cq
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:27:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBmBQ-0004uU-99
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:27:12 -0500
Received: from mo69.mail-out.ovh.net ([178.32.228.69]:56602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBmBQ-0004u0-30
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 12:27:08 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id B747DCDCB
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 18:27:06 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 5ED3D240082;
	Tue, 29 Nov 2016 18:26:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 18:26:48 +0100
Message-Id: <1480440408-30674-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480440408-30674-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480440408-30674-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13432548842182183697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.228.69
Subject: [Qemu-arm] [PATCH for-2.9 30/30] wdt: aspeed: use scu to get clock
 freq
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
X-TUID: zQpQKN8vZJzd

Add a link to the object model and a helper routine to retrieve the
value instead of using a constant value.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_soc.c              |  2 ++
 hw/watchdog/wdt_aspeed.c         | 19 +++++++++++++++----
 include/hw/watchdog/wdt_aspeed.h |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 6df76382f007..712ae9d6c54d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -175,6 +175,8 @@ static void aspeed_soc_init(Object *obj)
     object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
     object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
     qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
+    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->sc=
u),
+                                   NULL);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index cdba3983b7af..01266fb1b76b 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -7,10 +7,12 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "sysemu/watchdog.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
+#include "hw/misc/aspeed_scu.h"
=20
 #define WDT_IO_REGION_SIZE      0x20
=20
@@ -56,8 +58,6 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr of=
fset, unsigned size)
=20
 }
=20
-#define PCLK_HZ 24000000
-
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
@@ -82,7 +82,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offse=
t, uint64_t data,
=20
             if (pclk) {
                 reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
-                                  PCLK_HZ) ;
+                                  s->pclk_freq);
             } else {
                 reload =3D s->reg_reload_value * 1000;
             }
@@ -99,7 +99,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offse=
t, uint64_t data,
=20
             if (pclk) {
                 reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
-                                  PCLK_HZ);
+                                  s->pclk_freq);
             } else {
                 reload =3D s->reg_reload_value * 1000;
             }
@@ -177,10 +177,21 @@ static void aspeed_wdt_realize(DeviceState *dev, Er=
ror **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedWDTState *s =3D ASPEED_WDT(dev);
+    Object *obj;
+    Error *err =3D NULL;
=20
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expir=
ed,
                             dev);
=20
+    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_setg(errp, "%s: required link 'scu' not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->pclk_freq =3D aspeed_scu_get_clk(ASPEED_SCU(obj));
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
                           TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index dbf45ae968db..0483335ecee5 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
     uint32_t reg_reload_value;
     uint32_t reg_restart;
     uint32_t reg_ctrl;
+
+    uint32_t pclk_freq;
 } AspeedWDTState;
=20
 #endif  /* ASPEED_WDT_H */
--=20
2.7.4

