Received: by 10.25.21.96 with SMTP id l93csp6094lfi;
        Wed, 15 Jun 2016 14:16:52 -0700 (PDT)
X-Received: by 10.237.37.142 with SMTP id x14mr952882qtc.9.1466025412894;
        Wed, 15 Jun 2016 14:16:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t32si23640512qgt.101.2016.06.15.14.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 14:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDIBA-0002vQ-8Q
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 17:16:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDIB4-0002rQ-D2
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 17:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDIAy-0000bf-2Q
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 17:16:45 -0400
Received: from mo6.mail-out.ovh.net ([178.32.228.6]:48124)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDIAx-0000bC-LI
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 17:16:39 -0400
Received: from player738.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 8E58AFFA479
	for <qemu-arm@nongnu.org>; Wed, 15 Jun 2016 23:16:37 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id 53A3440D;
	Wed, 15 Jun 2016 23:16:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 15 Jun 2016 23:16:20 +0200
Message-Id: <1466025380-6186-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14246293000111033170
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkeeigdduheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.6
Subject: [Qemu-arm] [PATCH v2] ssi: change ssi_slave_init to be a realize ops
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
	Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7JWiqmp4+MR

This enables qemu to handle late inits and report errors. All the SSI
slave routine names were changed accordingly. Code was modified to
handle errors when possible (m25p80 and ssi-sd)

Tested with the m25p80 slave object.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Should apply on top of :
=20
    m25p80: fix test on blk_pread() return value
    https://lists.gnu.org/archive/html/qemu-devel/2016-05/msg05574.html

 Changes since v1 :

 - added a error_setg() report in ssi_sd_realize()

 hw/arm/spitz.c       |   12 ++++--------
 hw/arm/tosa.c        |    5 ++---
 hw/arm/z2.c          |    6 ++----
 hw/block/m25p80.c    |   12 +++++-------
 hw/display/ads7846.c |    5 ++---
 hw/display/ssd0323.c |    5 ++---
 hw/misc/max111x.c    |   12 ++++++------
 hw/sd/ssi-sd.c       |    9 +++++----
 hw/ssi/ssi.c         |    6 +++---
 include/hw/ssi/ssi.h |    2 +-
 10 files changed, 32 insertions(+), 42 deletions(-)

Index: qemu-ast2400-mainline.git/hw/arm/spitz.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/arm/spitz.c
+++ qemu-ast2400-mainline.git/hw/arm/spitz.c
@@ -598,15 +598,13 @@ static uint32_t spitz_lcdtg_transfer(SSI
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
@@ -666,7 +664,7 @@ static void spitz_adc_temp_on(void *opaq
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
@@ -1121,7 +1117,7 @@ static void corgi_ssp_class_init(ObjectC
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D corgi_ssp_init;
+    k->realize =3D corgi_ssp_realize;
     k->transfer =3D corgi_ssp_transfer;
     dc->vmsd =3D &vmstate_corgi_ssp_regs;
 }
@@ -1150,7 +1146,7 @@ static void spitz_lcdtg_class_init(Objec
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D spitz_lcdtg_init;
+    k->realize =3D spitz_lcdtg_realize;
     k->transfer =3D spitz_lcdtg_transfer;
     dc->vmsd =3D &vmstate_spitz_lcdtg_regs;
 }
Index: qemu-ast2400-mainline.git/hw/arm/tosa.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/arm/tosa.c
+++ qemu-ast2400-mainline.git/hw/arm/tosa.c
@@ -127,10 +127,9 @@ static uint32_t tosa_ssp_tansfer(SSISlav
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
@@ -283,7 +282,7 @@ static void tosa_ssp_class_init(ObjectCl
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D tosa_ssp_init;
+    k->realize =3D tosa_ssp_realize;
     k->transfer =3D tosa_ssp_tansfer;
 }
=20
Index: qemu-ast2400-mainline.git/hw/arm/z2.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/arm/z2.c
+++ qemu-ast2400-mainline.git/hw/arm/z2.c
@@ -151,14 +151,12 @@ static void z2_lcd_cs(void *opaque, int
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
@@ -181,7 +179,7 @@ static void zipit_lcd_class_init(ObjectC
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D zipit_lcd_init;
+    k->realize =3D zipit_lcd_realize;
     k->transfer =3D zipit_lcd_transfer;
     dc->vmsd =3D &vmstate_zipit_lcd_state;
 }
Index: qemu-ast2400-mainline.git/hw/block/m25p80.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/block/m25p80.c
+++ qemu-ast2400-mainline.git/hw/block/m25p80.c
@@ -28,6 +28,7 @@
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
=20
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
@@ -878,7 +879,7 @@ static uint32_t m25p80_transfer8(SSISlav
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
@@ -960,7 +958,7 @@ static void m25p80_class_init(ObjectClas
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
     M25P80Class *mc =3D M25P80_CLASS(klass);
=20
-    k->init =3D m25p80_init;
+    k->realize =3D m25p80_realize;
     k->transfer =3D m25p80_transfer8;
     k->set_cs =3D m25p80_cs;
     k->cs_polarity =3D SSI_CS_LOW;
Index: qemu-ast2400-mainline.git/hw/display/ads7846.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/display/ads7846.c
+++ qemu-ast2400-mainline.git/hw/display/ads7846.c
@@ -133,7 +133,7 @@ static const VMStateDescription vmstate_
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
Index: qemu-ast2400-mainline.git/hw/display/ssd0323.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/display/ssd0323.c
+++ qemu-ast2400-mainline.git/hw/display/ssd0323.c
@@ -361,7 +361,7 @@ static const GraphicHwOps ssd0323_ops =3D
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
Index: qemu-ast2400-mainline.git/hw/misc/max111x.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/misc/max111x.c
+++ qemu-ast2400-mainline.git/hw/misc/max111x.c
@@ -147,14 +147,14 @@ static int max111x_init(SSISlave *d, int
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
@@ -183,7 +183,7 @@ static void max1110_class_init(ObjectCla
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D max1110_init;
+    k->realize =3D max1110_realize;
 }
=20
 static const TypeInfo max1110_info =3D {
@@ -196,7 +196,7 @@ static void max1111_class_init(ObjectCla
 {
     SSISlaveClass *k =3D SSI_SLAVE_CLASS(klass);
=20
-    k->init =3D max1111_init;
+    k->realize =3D max1111_realize;
 }
=20
 static const TypeInfo max1111_info =3D {
Index: qemu-ast2400-mainline.git/hw/sd/ssi-sd.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/sd/ssi-sd.c
+++ qemu-ast2400-mainline.git/hw/sd/ssi-sd.c
@@ -15,6 +15,7 @@
 #include "sysemu/blockdev.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sd/sd.h"
+#include "qapi/error.h"
=20
 //#define DEBUG_SSI_SD 1
=20
@@ -249,7 +250,7 @@ static int ssi_sd_load(QEMUFile *f, void
     return 0;
 }
=20
-static int ssi_sd_init(SSISlave *d)
+static void ssi_sd_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev =3D DEVICE(d);
     ssi_sd_state *s =3D FROM_SSI_SLAVE(ssi_sd_state, d);
@@ -260,17 +261,17 @@ static int ssi_sd_init(SSISlave *d)
     dinfo =3D drive_get_next(IF_SD);
     s->sd =3D sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, true);
     if (s->sd =3D=3D NULL) {
-        return -1;
+        error_setg(errp, "Device initialization failed.");
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
Index: qemu-ast2400-mainline.git/hw/ssi/ssi.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/hw/ssi/ssi.c
+++ qemu-ast2400-mainline.git/hw/ssi/ssi.c
@@ -54,7 +54,7 @@ static uint32_t ssi_transfer_raw_default
     return 0;
 }
=20
-static int ssi_slave_init(DeviceState *dev)
+static void ssi_slave_realize(DeviceState *dev, Error **errp)
 {
     SSISlave *s =3D SSI_SLAVE(dev);
     SSISlaveClass *ssc =3D SSI_SLAVE_GET_CLASS(s);
@@ -64,7 +64,7 @@ static int ssi_slave_init(DeviceState *d
         qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
     }
=20
-    return ssc->init(s);
+    ssc->realize(s, errp);
 }
=20
 static void ssi_slave_class_init(ObjectClass *klass, void *data)
@@ -72,7 +72,7 @@ static void ssi_slave_class_init(ObjectC
     SSISlaveClass *ssc =3D SSI_SLAVE_CLASS(klass);
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    dc->init =3D ssi_slave_init;
+    dc->realize =3D ssi_slave_realize;
     dc->bus_type =3D TYPE_SSI_BUS;
     if (!ssc->transfer_raw) {
         ssc->transfer_raw =3D ssi_transfer_raw_default;
Index: qemu-ast2400-mainline.git/include/hw/ssi/ssi.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/include/hw/ssi/ssi.h
+++ qemu-ast2400-mainline.git/include/hw/ssi/ssi.h
@@ -37,7 +37,7 @@ enum SSICSMode {
 struct SSISlaveClass {
     DeviceClass parent_class;
=20
-    int (*init)(SSISlave *dev);
+    void (*realize)(SSISlave *dev, Error **errp);
=20
     /* if you have standard or no CS behaviour, just override transfer.
      * This is called when the device cs is active (true by default).
