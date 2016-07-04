Received: by 10.25.21.96 with SMTP id l93csp1491772lfi;
        Mon, 4 Jul 2016 05:20:15 -0700 (PDT)
X-Received: by 10.200.42.43 with SMTP id k40mr18033801qtk.98.1467634815294;
        Mon, 04 Jul 2016 05:20:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t128si247552qke.104.2016.07.04.05.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2rG-0007Ju-L9
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:20:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rC-0007Fj-Qc
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2r8-0003oi-8J
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:20:10 -0400
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:38708)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2r8-0003o9-1y
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:20:06 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id D4646FFBEA8
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 14:20:03 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 86AAF480084;
	Mon,  4 Jul 2016 14:19:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon,  4 Jul 2016 14:18:55 +0200
Message-Id: <1467634738-28642-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467634738-28642-1-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6085207522885733137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.33.202
Subject: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
	qemu-devel@nongnu.org, mar.krzeminski@gmail.com,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PXtOozuB0PnB

Some SPI controllers, such as the Aspeed AST2400, have a mode in which
accesses to the flash content are no different than doing MMIOs. The
controller generates all the necessary commands to load (or store)
data in memory.

To emulate such a behavior, we need to have access to the underlying
storage of the flash object. The purpose of the routine is to set the
storage of a preinitialized SPI flash object, which can then be used
by the object itself but also by a SPI controller to handled the
MMIOs.

This is sufficient to support read only accesses. For writes, we would
certainly need to externalize flash_write8() routine.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c        | 14 +++++++++++++-
 include/hw/block/flash.h |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index aa964280beab..fec0fd4c2228 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -29,6 +29,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "hw/block/flash.h"
=20
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
@@ -1152,7 +1153,11 @@ static void m25p80_realize(SSISlave *ss, Error **e=
rrp)
=20
     if (s->blk) {
         DB_PRINT_L(0, "Binding to IF_MTD drive\n");
-        s->storage =3D blk_blockalign(s->blk, s->size);
+
+        /* using an external storage. see m25p80_create_rom() */
+        if (!s->storage) {
+            s->storage =3D blk_blockalign(s->blk, s->size);
+        }
=20
         if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
             error_setg(errp, "failed to read the initial flash content")=
;
@@ -1259,3 +1264,10 @@ static void m25p80_register_types(void)
 }
=20
 type_init(m25p80_register_types)
+
+void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom)
+{
+    Flash *s =3D M25P80(dev);
+
+    s->storage =3D memory_region_get_ram_ptr(rom);
+}
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 50ccbbcf1352..9d780f4ae0c9 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -61,4 +61,6 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
 void ecc_reset(ECCState *s);
 extern VMStateDescription vmstate_ecc_state;
=20
+void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom);
+
 #endif
--=20
2.1.4

