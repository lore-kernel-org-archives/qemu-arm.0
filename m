Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp256284lfi;
        Mon, 18 Nov 2019 08:19:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPu8aJJZxjbzbuWaKnOxLb79sRFz5vJZHOj8+EbModISkN70Besp1rZXvvvgJXhKj8WbiG
X-Received: by 2002:a0c:b40d:: with SMTP id u13mr26556277qve.54.1574093955784;
        Mon, 18 Nov 2019 08:19:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574093955; cv=none;
        d=google.com; s=arc-20160816;
        b=BxZRggHp/u9q7kW0yh+JN1C1T6ZRG/lcPbZujG3jjeCehCTY0r4bDf3VCzJuv3Oryn
         hf7UVaISUoWV94RpArtHCXRwDC7fFradu+sMLExslIkysT4NVuXQVf4UV1BGzoFBwMQ8
         Ed5ZxDfvI+fET7LgEBrCPbfAlGbK5HWF8wZSgypkCKppRvNTTRv6RMdnPZeZ2rvDu0/7
         VGOdaGvU3bM37NodLftxN0YJlYLv4jT/zBkOyEZmC4s0nYSUB1gZ0653s6Ea3hZ8U/TV
         LR8yOoWQTXQ0PoH64KFpmdUK55AmepnSUpn8o12ke6EGadFd49Hwy/qpGStbVGhhtxLA
         Xa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fYjbvFrvwDJ+jAyMdCEqOMLqUimeUQIroJHcjPN7qHQ=;
        b=uw6wXZSmS/SxcbxlnCsDwBTPJ5QJITlP/6u6MS10tV1ws2s8L0LvWvQUYlyvqNx+2c
         jI4hjgqmFQ/kYIB/V4biqFTSOg/3S7k3osnpP2U9P5RomhMJHKCfFAT/FBxd0LVBcjxO
         84bi69hC73fwtqQKbVUuXHXh1M3irrg41YY8vsaCaibF7w6zKJy95WpT3ucvu+XiKvkS
         kt+Jo9bxa149V+kIM6K9rCiC6A0gaf03elcrQQRpGaFQJ6RtJI/GrZyXj8SMnSHOflUR
         ilRBhyg0YAOtgf0jMd6DhHHIXXFyp6PDfuJ29i5vz6WT+hP6WaRyvn9sjC/oftY4EqsN
         0oUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g198si11141085qke.185.2019.11.18.08.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 08:19:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWjkA-0002cA-Hc
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 11:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iWjia-00014M-Nb
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:17:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iWjiZ-00067s-06
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:17:36 -0500
Received: from 8.mo173.mail-out.ovh.net ([46.105.46.122]:59655)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iWjiY-00067e-LA
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:17:34 -0500
Received: from player796.ha.ovh.net (unknown [10.108.57.245])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id A996311B6FA
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 17:17:32 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id D58D9C1CB381;
 Mon, 18 Nov 2019 16:17:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.0 1/2] aspeed: change the "scu" property definition
Date: Mon, 18 Nov 2019 17:17:11 +0100
Message-Id: <20191118161712.6712-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118161712.6712-1-clg@kaod.org>
References: <20191118161712.6712-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14131169733724179217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegiedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.46.122
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0AyjpqGOXf0O

The Aspeed Watchdog and Timer models have a link pointing to the SCU
controller model of the machine.

Change the "scu" property definition so that it explicitly sets the
pointer. The property isn't optional : not being able to set the link
is a bug and QEMU should rather abort than exit in this case.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c  |  8 ++++----
 hw/arm/aspeed_soc.c      |  8 ++++----
 hw/timer/aspeed_timer.c  | 17 +++++++++--------
 hw/watchdog/wdt_aspeed.c | 17 ++++++++---------
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0881eb25983e..810fd7de0c06 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -146,8 +146,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
                           sizeof(s->timerctrl), typename);
-    object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
-                                   OBJECT(&s->scu), &error_abort);
=20
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
@@ -177,8 +175,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
                               sizeof(s->wdt[i]), typename);
-        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
-                                       OBJECT(&s->scu), &error_abort);
     }
=20
     for (i =3D 0; i < sc->macs_num; i++) {
@@ -323,6 +319,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_RTC));
=20
     /* Timer */
+    object_property_set_link(OBJECT(&s->timerctrl),
+                             OBJECT(&s->scu), "scu", &error_abort);
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
     if (err) {
         error_propagate(errp, err);
@@ -415,6 +413,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     for (i =3D 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
=20
+        object_property_set_link(OBJECT(&s->wdt[i]),
+                                 OBJECT(&s->scu), "scu", &error_abort);
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b01c97744196..a6237e594017 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -163,8 +163,6 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
                           sizeof(s->timerctrl), typename);
-    object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
-                                   OBJECT(&s->scu), &error_abort);
=20
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
@@ -194,8 +192,6 @@ static void aspeed_soc_init(Object *obj)
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
                               sizeof(s->wdt[i]), typename);
-        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
-                                       OBJECT(&s->scu), &error_abort);
     }
=20
     for (i =3D 0; i < sc->macs_num; i++) {
@@ -291,6 +287,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
                        aspeed_soc_get_irq(s, ASPEED_RTC));
=20
     /* Timer */
+    object_property_set_link(OBJECT(&s->timerctrl),
+                             OBJECT(&s->scu), "scu", &error_abort);
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
     if (err) {
         error_propagate(errp, err);
@@ -376,6 +374,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     for (i =3D 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
=20
+        object_property_set_link(OBJECT(&s->wdt[i]),
+                                 OBJECT(&s->scu), "scu", &error_abort);
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index bcce2192a92a..a8c38cc1189b 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -19,6 +19,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/qdev-properties.h"
 #include "trace.h"
=20
 #define TIMER_NR_REGS 4
@@ -603,15 +604,8 @@ static void aspeed_timer_realize(DeviceState *dev, E=
rror **errp)
     int i;
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedTimerCtrlState *s =3D ASPEED_TIMER(dev);
-    Object *obj;
-    Error *err =3D NULL;
=20
-    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
-    if (!obj) {
-        error_propagate_prepend(errp, err, "required link 'scu' not foun=
d: ");
-        return;
-    }
-    s->scu =3D ASPEED_SCU(obj);
+    assert(s->scu);
=20
     for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         aspeed_init_one_timer(s, i);
@@ -677,6 +671,12 @@ static const VMStateDescription vmstate_aspeed_timer=
_state =3D {
     }
 };
=20
+static Property aspeed_timer_properties[] =3D {
+    DEFINE_PROP_LINK("scu", AspeedTimerCtrlState, scu, TYPE_ASPEED_SCU,
+                     AspeedSCUState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -685,6 +685,7 @@ static void timer_class_init(ObjectClass *klass, void=
 *data)
     dc->reset =3D aspeed_timer_reset;
     dc->desc =3D "ASPEED Timer";
     dc->vmsd =3D &vmstate_aspeed_timer_state;
+    dc->props =3D aspeed_timer_properties;
 }
=20
 static const TypeInfo aspeed_timer_info =3D {
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 122aa8daaadf..f50dab922e0f 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -241,16 +241,8 @@ static void aspeed_wdt_realize(DeviceState *dev, Err=
or **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedWDTState *s =3D ASPEED_WDT(dev);
-    Error *err =3D NULL;
-    Object *obj;
=20
-    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
-    if (!obj) {
-        error_propagate(errp, err);
-        error_prepend(errp, "required link 'scu' not found: ");
-        return;
-    }
-    s->scu =3D ASPEED_SCU(obj);
+    assert(s->scu);
=20
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expir=
ed, dev);
=20
@@ -264,6 +256,12 @@ static void aspeed_wdt_realize(DeviceState *dev, Err=
or **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
=20
+static Property aspeed_wdt_properties[] =3D {
+    DEFINE_PROP_LINK("scu", AspeedWDTState, scu, TYPE_ASPEED_SCU,
+                     AspeedSCUState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -273,6 +271,7 @@ static void aspeed_wdt_class_init(ObjectClass *klass,=
 void *data)
     dc->reset =3D aspeed_wdt_reset;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->vmsd =3D &vmstate_aspeed_wdt;
+    dc->props =3D aspeed_wdt_properties;
 }
=20
 static const TypeInfo aspeed_wdt_info =3D {
--=20
2.21.0

