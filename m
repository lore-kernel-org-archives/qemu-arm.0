Received: by 10.25.21.96 with SMTP id l93csp609211lfi;
        Wed, 15 Jun 2016 08:45:57 -0700 (PDT)
X-Received: by 10.55.159.72 with SMTP id i69mr25444434qke.29.1466005557581;
        Wed, 15 Jun 2016 08:45:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z145si22625018qkb.120.2016.06.15.08.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 08:45:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDD0u-0004g7-VA
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 11:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDD0A-00045n-2Q
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 11:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDD03-0003vK-TZ
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 11:45:09 -0400
Received: from 8.mo6.mail-out.ovh.net ([178.33.42.204]:51377)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDD03-0003uY-Ey
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 11:45:03 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3E514FFAD1A
	for <qemu-arm@nongnu.org>; Wed, 15 Jun 2016 17:45:01 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id 09E9E1005;
	Wed, 15 Jun 2016 17:44:50 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 15 Jun 2016 17:44:48 +0200
Message-Id: <1466005488-21400-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8646066859732601682
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkeeigdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.42.204
Subject: [Qemu-arm] [PATCH] ssi: change ssi_slave_init to be a realize ops
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CoWaa/C3dD4O

This enables qemu to handle late inits and report errors. All the SSI
slave routine names were changed accordingly. Code was modified to
handle errors when possible (m25p80)

Tested with the m25p80 slave object.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Should apply on top of :
=20
    m25p80: fix test on blk_pread() return value
    https://lists.gnu.org/archive/html/qemu-devel/2016-05/msg05574.html

 hw/arm/spitz.c       | 12 ++++--------
 hw/arm/tosa.c        |  5 ++---
 hw/arm/z2.c          |  6 ++----
 hw/block/m25p80.c    | 12 +++++-------
 hw/display/ads7846.c |  5 ++---
 hw/display/ssd0323.c |  5 ++---
 hw/misc/max111x.c    | 12 ++++++------
 hw/sd/ssi-sd.c       |  7 +++----
 hw/ssi/ssi.c         |  6 +++---
 include/hw/ssi/ssi.h |  2 +-
 10 files changed, 30 insertions(+), 42 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index ba40f8302bc6..41cc2eeeb1ba 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -598,15 +598,13 @@ static uint32_t spitz_lcdtg_transfer(SSISlave *dev,=
 uint32_t value)
     return 0;
 }
=20
-static int spitz_lcdtg_init(SSISlave *dev)
+static void spitz_lcdtg_realize(SSISlave *dev, Error **errp)
 {
     SpitzLCDTG *s =3D FROM_SSI_SLAVE(SpitzLCDTG, dev);
=20
     spitz_lcdtg =3D s;
     s->bl_power =3D 0;
     s->bl_intensity =3D 0x20;
-
-    return 0;
 }
=20
 /* SSP devices */
@@ -666,7 +664,7 @@ static void spitz_adc_temp_on(void *opaque, int line,=
 int level)
         max111x_set_input(max1111, MAX1111_BATT_TEMP, 0);
 }
=20
-static int corgi_ssp_init(SSISlave *d)
+static void corgi_ssp_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev =3D DEVICE(d);
     CorgiSSPState *s =3D FROM_SSI_SLAVE(CorgiSSPState, d);
@@ -675,8 +673,6 @@ static int corgi_ssp_init(SSISlave *d)
     s->bus[0] =3D ssi_create_bus(dev, "ssi0");
     s->bus[1] =3D ssi_create_bus(dev, "ssi1");
     s->bus[2] =3D ssi_create_bus(dev, "ssi2");
-
-    return 0;
 }
=20
 static void spitz_ssp_attach(PXA2xxState *cpu)
@@ -1121,7 +1117,7 @@ static void corgi_ssp_class_init(ObjectClass *klass=
, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D corgi_ssp_init;
+    k->realize =3D corgi_ssp_realize;
     k->transfer =3D corgi_ssp_transfer;
     dc->vmsd =3D &vmstate_corgi_ssp_regs;
 }
@@ -1150,7 +1146,7 @@ static void spitz_lcdtg_class_init(ObjectClass *kla=
ss, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D spitz_lcdtg_init;
+    k->realize =3D spitz_lcdtg_realize;
     k->transfer =3D spitz_lcdtg_transfer;
     dc->vmsd =3D &vmstate_spitz_lcdtg_regs;
 }
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 4e9494f94c20..2db66508b5b6 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -127,10 +127,9 @@ static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint=
32_t value)
     return 0;
 }
=20
-static int tosa_ssp_init(SSISlave *dev)
+static void tosa_ssp_realize(SSISlave *dev, Error **errp)
 {
     /* Nothing to do.  */
-    return 0;
 }
=20
 #define TYPE_TOSA_DAC "tosa_dac"
@@ -283,7 +282,7 @@ static void tosa_ssp_class_init(ObjectClass *klass, v=
oid *data)
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D tosa_ssp_init;
+    k->realize =3D tosa_ssp_realize;
     k->transfer =3D tosa_ssp_tansfer;
 }
=20
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index aea895a500ef..68a92f3184d7 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -151,14 +151,12 @@ static void z2_lcd_cs(void *opaque, int line, int l=
evel)
     z2_lcd->selected =3D !level;
 }
=20
-static int zipit_lcd_init(SSISlave *dev)
+static void zipit_lcd_realize(SSISlave *dev, Error **errp)
 {
     ZipitLCD *z =3D FROM_SSI_SLAVE(ZipitLCD, dev);
     z->selected =3D 0;
     z->enabled =3D 0;
     z->pos =3D 0;
-
-    return 0;
 }
=20
 static VMStateDescription vmstate_zipit_lcd_state =3D {
@@ -181,7 +179,7 @@ static void zipit_lcd_class_init(ObjectClass *klass, =
void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D zipit_lcd_init;
+    k->realize =3D zipit_lcd_realize;
     k->transfer =3D zipit_lcd_transfer;
     dc->vmsd =3D &vmstate_zipit_lcd_state;
 }
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 51d85960566f..e6f6e23fb71d 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -28,6 +28,7 @@
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
=20
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
@@ -878,7 +879,7 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32=
_t tx)
     return r;
 }
=20
-static int m25p80_init(SSISlave *ss)
+static void m25p80_realize(SSISlave *ss, Error **errp)
 {
     DriveInfo *dinfo;
     Flash *s =3D M25P80(ss);
@@ -899,18 +900,15 @@ static int m25p80_init(SSISlave *ss)
=20
         s->storage =3D blk_blockalign(s->blk, s->size);
=20
-        /* FIXME: Move to late init */
         if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
-            fprintf(stderr, "Failed to initialize SPI flash!\n");
-            return 1;
+            error_setg(errp, "failed to read the initial flash content")=
;
+            return;
         }
     } else {
         DB_PRINT_L(0, "No BDRV - binding to RAM\n");
         s->storage =3D blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
-
-    return 0;
 }
=20
 static void m25p80_reset(DeviceState *d)
@@ -960,7 +958,7 @@ static void m25p80_class_init(ObjectClass *klass, voi=
d *data)
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
     M25P80Class *mc =3D M25P80_CLASS(klass);
=20
-    k->init =3D m25p80_init;
+    k->realize =3D m25p80_realize;
     k->transfer =3D m25p80_transfer8;
     k->set_cs =3D m25p80_cs;
     k->cs_polarity =3D SSI_CS_LOW;
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 05aa2d1e6b6e..166edade7dc0 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -133,7 +133,7 @@ static const VMStateDescription vmstate_ads7846 =3D {
     }
 };
=20
-static int ads7846_init(SSISlave *d)
+static void ads7846_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev =3D DEVICE(d);
     ADS7846State *s =3D FROM_SSI_SLAVE(ADS7846State, d);
@@ -152,14 +152,13 @@ static int ads7846_init(SSISlave *d)
     ads7846_int_update(s);
=20
     vmstate_register(NULL, -1, &vmstate_ads7846, s);
-    return 0;
 }
=20
 static void ads7846_class_init(ObjectClass *klass, void *data)
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D ads7846_init;
+    k->realize =3D ads7846_realize;
     k->transfer =3D ads7846_transfer;
 }
=20
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 14c1bf339ccf..6d1faf44afd7 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -361,7 +361,7 @@ static const GraphicHwOps ssd0323_ops =3D {
     .gfx_update  =3D ssd0323_update_display,
 };
=20
-static int ssd0323_init(SSISlave *d)
+static void ssd0323_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev =3D DEVICE(d);
     ssd0323_state *s =3D FROM_SSI_SLAVE(ssd0323_state, d);
@@ -375,14 +375,13 @@ static int ssd0323_init(SSISlave *d)
=20
     register_savevm(dev, "ssd0323_oled", -1, 1,
                     ssd0323_save, ssd0323_load, s);
-    return 0;
 }
=20
 static void ssd0323_class_init(ObjectClass *klass, void *data)
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D ssd0323_init;
+    k->realize =3D ssd0323_realize;
     k->transfer =3D ssd0323_transfer;
     k->cs_polarity =3D SSI_CS_HIGH;
 }
diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index 9014f0f705d6..2a277bdb86dd 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -147,14 +147,14 @@ static int max111x_init(SSISlave *d, int inputs)
     return 0;
 }
=20
-static int max1110_init(SSISlave *dev)
+static void max1110_realize(SSISlave *dev, Error **errp)
 {
-    return max111x_init(dev, 8);
+    max111x_init(dev, 8);
 }
=20
-static int max1111_init(SSISlave *dev)
+static void max1111_realize(SSISlave *dev, Error **errp)
 {
-    return max111x_init(dev, 4);
+    max111x_init(dev, 4);
 }
=20
 void max111x_set_input(DeviceState *dev, int line, uint8_t value)
@@ -183,7 +183,7 @@ static void max1110_class_init(ObjectClass *klass, vo=
id *data)
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D max1110_init;
+    k->realize =3D max1110_realize;
 }
=20
 static const TypeInfo max1110_info =3D {
@@ -196,7 +196,7 @@ static void max1111_class_init(ObjectClass *klass, vo=
id *data)
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D max1111_init;
+    k->realize =3D max1111_realize;
 }
=20
 static const TypeInfo max1111_info =3D {
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 075e4ed5df85..ca7718d38dfc 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -249,7 +249,7 @@ static int ssi_sd_load(QEMUFile *f, void *opaque, int=
 version_id)
     return 0;
 }
=20
-static int ssi_sd_init(SSISlave *d)
+static void ssi_sd_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev =3D DEVICE(d);
     ssi_sd_state *s =3D FROM_SSI_SLAVE(ssi_sd_state, d);
@@ -260,17 +260,16 @@ static int ssi_sd_init(SSISlave *d)
     dinfo =3D drive_get_next(IF_SD);
     s->sd =3D sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, true);
     if (s->sd =3D=3D NULL) {
-        return -1;
+        return;
     }
     register_savevm(dev, "ssi_sd", -1, 1, ssi_sd_save, ssi_sd_load, s);
-    return 0;
 }
=20
 static void ssi_sd_class_init(ObjectClass *klass, void *data)
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D ssi_sd_init;
+    k->realize =3D ssi_sd_realize;
     k->transfer =3D ssi_sd_transfer;
     k->cs_polarity =3D SSI_CS_LOW;
 }
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 9791c0d94714..7eaaf565fd67 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -54,7 +54,7 @@ static uint32_t ssi_transfer_raw_default(SSISlave *dev,=
 uint32_t val)
     return 0;
 }
=20
-static int ssi_slave_init(DeviceState *dev)
+static void ssi_slave_realize(DeviceState *dev, Error **errp)
 {
     SSISlave *s =3D SSI_SLAVE(dev);
     SSISlaveClass *ssc =3D SSI_SLAVE_GET_CLASS(s);
@@ -64,7 +64,7 @@ static int ssi_slave_init(DeviceState *dev)
         qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
     }
=20
-    return ssc->init(s);
+    ssc->realize(s, errp);
 }
=20
 static void ssi_slave_class_init(ObjectClass *klass, void *data)
@@ -72,7 +72,7 @@ static void ssi_slave_class_init(ObjectClass *klass, vo=
id *data)
     SSISlaveClass *ssc =3D SSI_SLAVE_CLASS(klass);
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    dc->init =3D ssi_slave_init;
+    dc->realize =3D ssi_slave_realize;
     dc->bus_type =3D TYPE_SSI_BUS;
     if (!ssc->transfer_raw) {
         ssc->transfer_raw =3D ssi_transfer_raw_default;
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 4a0a53903c66..6a0c3c3cdb28 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -37,7 +37,7 @@ enum SSICSMode {
 struct SSISlaveClass {
     DeviceClass parent_class;
=20
-    int (*init)(SSISlave *dev);
+    void (*realize)(SSISlave *dev, Error **errp);
=20
     /* if you have standard or no CS behaviour, just override transfer.
      * This is called when the device cs is active (true by default).
--=20
2.1.4

