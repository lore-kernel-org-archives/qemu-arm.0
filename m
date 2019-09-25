Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp895455wrp;
        Wed, 25 Sep 2019 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyAjL2YK0hC4VlAOXaWW7rteG1JMb4tAc4b7zOxHoNWV5kRWsSWNuXZZ5IoehAPZyH4kh6
X-Received: by 2002:ac8:2e58:: with SMTP id s24mr6066224qta.52.1569423154999;
        Wed, 25 Sep 2019 07:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569423154; cv=none;
        d=google.com; s=arc-20160816;
        b=JOr70cOHe6PaHlq2Sqk/I/FBebcjuC/gcDSj5rPly6Gykky3m4P0VRowwqAaNr3upF
         +kVuOoT+wBCBZhu6y6y+/3sWdpSjgf6Y2EbIJSmy1luDdQev76URP1/YyTeVY/r2IBRC
         JkrdTz6tQ4lhXfwX3DCXnwZhHtumKca5yNgn3097NuFFI71vbOg/XufO9mx9w5snfMpH
         8WEODa9DscfuIm51YVSDUyM/jP53kxiENs8c/eEHDg6m67CSrn7KyymStsRpUGmEDzGW
         jHTWRb3Kq+EYTEsaIH13Yy1nhP8g0+LkEp9z0A3BGFp9OOKteLrsFxB3urgmzK/WzRHc
         rDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=wmP6c0PPYGY3nQUju8oLhTTFdGvAo8aU8ezTlyDbK2w=;
        b=kuBL7+jw435YV7V30OvL6ZMnbOAMFAggDUTU3zG8w6ksMarEJDCI/MAWpxv7uwcWgr
         zg3x+GgT/TLRilfkh3q5asiKLs2D/zD0HgDqzge3mjixIXnqIGVok/XG/adGxv1Awfz3
         j2Ea15RpFq5Qk0vt355Jlm+dTYlMZhaF5qMOgbRwJFrYEbVyb8iniDDj8aXbPzkEvnEy
         6DFpcdypGMeYZukKfpyX/DnoHIUM8ekNL4UyNerrDfnQgjgJM3yv/KLByddSgehafl3a
         +hT7+aY3glQ0T1c/b3E78WkoAonzkQX1n2fw4egVeZtfFU9OxxWMJBx4SKTDWnYaP3pC
         kksQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si4016807qvz.177.2019.09.25.07.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8ef-0005F8-RK
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8NZ-0004aL-EE
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8NX-0001PY-S8
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:53 -0400
Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36]:57652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8NX-0001P6-Mn
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:51 -0400
Received: from player786.ha.ovh.net (unknown [10.109.146.50])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2F06F2278A2
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:34:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id B22A5A4D40F2;
 Wed, 25 Sep 2019 14:34:40 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 15/23] aspeed/i2c: Introduce an object class per SoC
Date: Wed, 25 Sep 2019 16:32:40 +0200
Message-Id: <20190925143248.10000-16-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8865054393088576273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.75.36
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtf0L8VVV/+2

It prepares ground for register differences between SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/i2c/aspeed_i2c.h | 15 ++++++++++
 hw/arm/aspeed_soc.c         |  3 +-
 hw/i2c/aspeed_i2c.c         | 60 ++++++++++++++++++++++++++++++++-----
 3 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index a2753f0bbbaa..6e2dae7db818 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -25,6 +25,8 @@
 #include "hw/sysbus.h"
=20
 #define TYPE_ASPEED_I2C "aspeed.i2c"
+#define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
+#define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
 #define ASPEED_I2C(obj) \
     OBJECT_CHECK(AspeedI2CState, (obj), TYPE_ASPEED_I2C)
=20
@@ -59,6 +61,19 @@ typedef struct AspeedI2CState {
     AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
 } AspeedI2CState;
=20
+#define ASPEED_I2C_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedI2CClass, (klass), TYPE_ASPEED_I2C)
+#define ASPEED_I2C_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedI2CClass, (obj), TYPE_ASPEED_I2C)
+
+typedef struct AspeedI2CClass {
+    SysBusDeviceClass parent_class;
+
+    uint8_t num_busses;
+    uint8_t reg_size;
+    uint8_t gap;
+} AspeedI2CClass;
+
 I2CBus *aspeed_i2c_get_bus(DeviceState *dev, int busnr);
=20
 #endif /* ASPEED_I2C_H */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5c5fcb810944..e60f198d92c1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -188,8 +188,9 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
                                    OBJECT(&s->scu), &error_abort);
=20
+    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
-                          TYPE_ASPEED_I2C);
+                          typename);
=20
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     sysbus_init_child_obj(obj, "fmc", OBJECT(&s->fmc), sizeof(s->fmc),
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index a956eb384922..fabdb01e9747 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -408,10 +408,11 @@ static void aspeed_i2c_reset(DeviceState *dev)
 {
     int i;
     AspeedI2CState *s =3D ASPEED_I2C(dev);
+    AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLASS(s);
=20
     s->intr_status =3D 0;
=20
-    for (i =3D 0; i < ASPEED_I2C_NR_BUSSES; i++) {
+    for (i =3D 0; i < aic->num_busses; i++) {
         s->busses[i].intr_ctrl =3D 0;
         s->busses[i].intr_status =3D 0;
         s->busses[i].cmd =3D 0;
@@ -421,7 +422,7 @@ static void aspeed_i2c_reset(DeviceState *dev)
 }
=20
 /*
- * Address Definitions
+ * Address Definitions (AST2400 and AST2500)
  *
  *   0x000 ... 0x03F: Global Register
  *   0x040 ... 0x07F: Device 1
@@ -446,22 +447,24 @@ static void aspeed_i2c_realize(DeviceState *dev, Er=
ror **errp)
     int i;
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedI2CState *s =3D ASPEED_I2C(dev);
+    AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLASS(s);
=20
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
                           "aspeed.i2c", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
=20
-    for (i =3D 0; i < ASPEED_I2C_NR_BUSSES; i++) {
-        char name[16];
-        int offset =3D i < 7 ? 1 : 5;
+    for (i =3D 0; i < aic->num_busses; i++) {
+        char name[32];
+        int offset =3D i < aic->gap ? 1 : 5;
         snprintf(name, sizeof(name), "aspeed.i2c.%d", i);
         s->busses[i].controller =3D s;
         s->busses[i].id =3D i;
         s->busses[i].bus =3D i2c_init_bus(dev, name);
         memory_region_init_io(&s->busses[i].mr, OBJECT(dev),
-                              &aspeed_i2c_bus_ops, &s->busses[i], name, =
0x40);
-        memory_region_add_subregion(&s->iomem, 0x40 * (i + offset),
+                              &aspeed_i2c_bus_ops, &s->busses[i], name,
+                              aic->reg_size);
+        memory_region_add_subregion(&s->iomem, aic->reg_size * (i + offs=
et),
                                     &s->busses[i].mr);
     }
 }
@@ -481,11 +484,51 @@ static const TypeInfo aspeed_i2c_info =3D {
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(AspeedI2CState),
     .class_init    =3D aspeed_i2c_class_init,
+    .class_size =3D sizeof(AspeedI2CClass),
+    .abstract   =3D true,
+};
+
+static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedI2CClass *aic =3D ASPEED_I2C_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2400 I2C Controller";
+
+    aic->num_busses =3D 14;
+    aic->reg_size =3D 0x40;
+    aic->gap =3D 7;
+}
+
+static const TypeInfo aspeed_2400_i2c_info =3D {
+    .name =3D TYPE_ASPEED_2400_I2C,
+    .parent =3D TYPE_ASPEED_I2C,
+    .class_init =3D aspeed_2400_i2c_class_init,
+};
+
+static void aspeed_2500_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedI2CClass *aic =3D ASPEED_I2C_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2500 I2C Controller";
+
+    aic->num_busses =3D 14;
+    aic->reg_size =3D 0x40;
+    aic->gap =3D 7;
+}
+
+static const TypeInfo aspeed_2500_i2c_info =3D {
+    .name =3D TYPE_ASPEED_2500_I2C,
+    .parent =3D TYPE_ASPEED_I2C,
+    .class_init =3D aspeed_2500_i2c_class_init,
 };
=20
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_info);
+    type_register_static(&aspeed_2400_i2c_info);
+    type_register_static(&aspeed_2500_i2c_info);
 }
=20
 type_init(aspeed_i2c_register_types)
@@ -494,9 +537,10 @@ type_init(aspeed_i2c_register_types)
 I2CBus *aspeed_i2c_get_bus(DeviceState *dev, int busnr)
 {
     AspeedI2CState *s =3D ASPEED_I2C(dev);
+    AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLASS(s);
     I2CBus *bus =3D NULL;
=20
-    if (busnr >=3D 0 && busnr < ASPEED_I2C_NR_BUSSES) {
+    if (busnr >=3D 0 && busnr < aic->num_busses) {
         bus =3D s->busses[busnr].bus;
     }
=20
--=20
2.21.0

