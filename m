Received: by 10.25.21.96 with SMTP id l93csp1494488lfi;
        Mon, 4 Jul 2016 05:26:32 -0700 (PDT)
X-Received: by 10.55.136.133 with SMTP id k127mr16165201qkd.20.1467635192750;
        Mon, 04 Jul 2016 05:26:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i52si1884983qti.38.2016.07.04.05.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2xL-0008JM-Ue
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rO-0007VV-3E
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rI-0003v0-1c
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:20:21 -0400
Received: from 11.mo3.mail-out.ovh.net ([87.98.184.158]:56007)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2rH-0003ul-Om
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:20:15 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id D67E7FFBEC4
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 14:20:14 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 037B74800A3;
	Mon,  4 Jul 2016 14:20:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon,  4 Jul 2016 14:18:56 +0200
Message-Id: <1467634738-28642-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467634738-28642-1-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6087459325574023953
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.184.158
Subject: [Qemu-devel] [PATCH 5/7] ast2400: handle SPI flash Command mode
 (read only)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, mar.krzeminski@gmail.com,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: drC+qzrIs/0e

To handle memory accesses when the SPI flash slave is configured in
Command mode, let's change the memory region of the SPI flash object
to a ROM memory region (like the pflash_cfi* object). The m25p80 flash
object creation is changed accordingly to use the new memory region as
a storage.

Only read only accesses are handled. Supporting write accesses would
demand using internal routines of the m25p80 flash model. This is not
required for the moment.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c       |  2 ++
 hw/ssi/aspeed_smc.c         | 60 +++++++++++++++++++++++++++++++++++++++=
++----
 include/hw/ssi/aspeed_smc.h |  1 +
 3 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index c0bb922f6406..b00757dcbc69 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -20,6 +20,7 @@
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "hw/block/flash.h"
=20
 static struct arm_boot_info palmetto_bmc_binfo =3D {
     .loader_start =3D AST2400_SDRAM_BASE,
@@ -51,6 +52,7 @@ static void palmetto_bmc_init_flashes(AspeedSMCState *s=
, const char *flashtype,
             qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(=
dinfo),
                                 errp);
         }
+        m25p80_set_rom_storage(fl->flash, &fl->mmio);
         qdev_init_nofail(fl->flash);
=20
         cs_line =3D qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index cb0b23750bcf..f88edf953dee 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -23,11 +23,13 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "include/qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "hw/block/flash.h"
=20
 #include "hw/ssi/aspeed_smc.h"
=20
@@ -198,6 +200,37 @@ static inline bool aspeed_smc_is_writable(const Aspe=
edSMCState *s, int cs)
     return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
 }
=20
+/*
+ * Sanity checks on the command mode and the SPI flash command being
+ * used
+ */
+static inline bool aspeed_smc_check_mode(const AspeedSMCState *s, int cs=
)
+{
+    uint8_t mode =3D aspeed_smc_flash_mode(s, cs);
+    uint8_t cmd =3D (s->regs[s->r_ctrl0 + cs] >> CTRL_CMD_SHIFT) && CTRL=
_CMD_MASK;
+    bool ret;
+
+    switch (mode) {
+    case CTRL_READMODE:
+        ret =3D (cmd =3D=3D 0x3 || cmd =3D=3D 0x0);
+        break;
+    case CTRL_FREADMODE:
+        ret =3D true;
+        break;
+    case CTRL_WRITEMODE:
+    default:
+        ret =3D false;
+        break;
+    }
+
+    if (!ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mode/command: %d/%d\=
n",
+                      __func__, cmd, mode);
+    }
+
+    return ret;
+}
+
 static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
 {
     AspeedSMCFlash *fl =3D opaque;
@@ -210,9 +243,11 @@ static uint64_t aspeed_smc_flash_read(void *opaque, =
hwaddr addr, unsigned size)
             ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
         }
     } else {
-        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
-                      __func__);
-        ret =3D -1;
+        if (aspeed_smc_check_mode(s, fl->id)) {
+            for (i =3D 0; i < size; i++) {
+                ret =3D fl->storage[addr + i] << (8 * i);
+            }
+        }
     }
=20
     return ret;
@@ -336,6 +371,12 @@ static void aspeed_smc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
      */
     s->regs[addr] =3D value;
     if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+        int i;
+
+        for (i =3D 0; i < s->num_cs; ++i) {
+            memory_region_rom_device_set_romd(&s->flashes[i].mmio,
+                                              !aspeed_smc_is_usermode(s,=
 i));
+        }
         aspeed_smc_update_cs(s);
     }
 }
@@ -355,6 +396,7 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
     int i;
     char name[32];
     hwaddr offset =3D 0;
+    Error *err =3D NULL;
=20
     s->ctrl =3D mc->ctrl;
=20
@@ -409,8 +451,16 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
         fl->id =3D i;
         fl->controller =3D s;
         fl->size =3D s->ctrl->segments[i].size;
-        memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_op=
s,
-                              fl, name, fl->size);
+        memory_region_init_rom_device(&fl->mmio, OBJECT(s),
+                                      &aspeed_smc_flash_ops,
+                                      fl, name, fl->size, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        vmstate_register_ram(&fl->mmio, DEVICE(s));
+        fl->storage =3D memory_region_get_ram_ptr(&fl->mmio);
+
         memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
         offset +=3D fl->size;
     }
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index def3b4507e75..4796b4ca0138 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -47,6 +47,7 @@ typedef struct AspeedSMCController {
=20
 typedef struct AspeedSMCFlash {
     const struct AspeedSMCState *controller;
+    uint8_t *storage;
=20
     uint8_t id;
     uint32_t size;
--=20
2.1.4

