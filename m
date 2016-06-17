Received: by 10.25.21.96 with SMTP id l93csp235233lfi;
        Fri, 17 Jun 2016 05:20:49 -0700 (PDT)
X-Received: by 10.55.26.94 with SMTP id a91mr1937777qka.26.1466166048994;
        Fri, 17 Jun 2016 05:20:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w77si31219081qkb.113.2016.06.17.05.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 05:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDslU-0006om-9f
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 08:20:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDsh9-00028S-VM
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDsh4-0003C0-Ua
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:16:18 -0400
Received: from 9.mo53.mail-out.ovh.net ([87.98.186.128]:39943)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDsh4-0003BZ-JJ
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 08:16:14 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id B3480FF9492
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 14:16:13 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 3B1226200A4;
	Fri, 17 Jun 2016 14:16:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 17 Jun 2016 14:15:22 +0200
Message-Id: <1466165724-7620-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466165724-7620-1-git-send-email-clg@kaod.org>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16865136183255796497
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrledtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.186.128
Subject: [Qemu-arm] [PATCH v2 3/5] ast2400: add SPI flash slave object
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N96tHqRt20um

Each SPI flash slave can operate in two modes: Command and User. When
in User mode, accesses to the memory segment of the slaves are
translated in SPI transfers. When in Command mode, the HW generates
the SPI commands automatically and the memory segment is accessed as
if doing a MMIO. Other SPI controllers call that mode linear
addressing mode.

This object is a model proposal for a SPI flash module, gathering SPI
slave properties and a MemoryRegion handling the memory accesses.
Only the User mode is supported for now but we are preparing ground
for the Command mode.

The framework below is sufficient to support Linux which only uses
User Mode.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 97 +++++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/ssi/aspeed_smc.h | 16 ++++++++
 2 files changed, 113 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7937a9030903..6a02906c8f97 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -112,6 +112,21 @@ static bool aspeed_smc_is_ce_stop_active(AspeedSMCSt=
ate *s, int cs)
     return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
 }
=20
+static inline int aspeed_smc_flash_mode(AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
+}
+
+static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
+{
+    return (aspeed_smc_flash_mode(s, cs) =3D=3D CTRL_USERMODE);
+}
+
+static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
+}
+
 static void aspeed_smc_update_cs(AspeedSMCState *s)
 {
     int i;
@@ -298,3 +313,85 @@ static void aspeed_smc_register_types(void)
 }
=20
 type_init(aspeed_smc_register_types)
+
+static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
+{
+    AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opaque);
+    AspeedSMCState *s =3D fl->controller;
+    uint64_t ret =3D 0;
+    int i;
+
+    if (aspeed_smc_is_usermode(s, fl->id)) {
+        for (i =3D 0; i < size; i++) {
+            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
+        }
+    } else {
+        error_report("%s: flash not in usermode", __func__);
+        ret =3D -1;
+    }
+
+    return ret;
+}
+
+static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
+                           unsigned size)
+{
+    AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opaque);
+    AspeedSMCState *s =3D fl->controller;
+    int i;
+
+    if (!aspeed_smc_is_writable(s, fl->id)) {
+        error_report("%s: flash is not writable", __func__);
+        return;
+    }
+
+    if (!aspeed_smc_is_usermode(s, fl->id)) {
+        error_report("%s: flash not in usermode", __func__);
+        return;
+    }
+
+    for (i =3D 0; i < size; i++) {
+        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+    }
+}
+
+static const MemoryRegionOps aspeed_smc_flash_ops =3D {
+    .read =3D aspeed_smc_flash_read,
+    .write =3D aspeed_smc_flash_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
+static const VMStateDescription vmstate_aspeed_smc_flash =3D {
+    .name =3D "aspeed.smc_flash",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT8(id, AspeedSMCFlashState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->vmsd =3D &vmstate_aspeed_smc_flash;
+}
+
+static const TypeInfo aspeed_smc_flash_info =3D {
+    .name           =3D TYPE_ASPEED_SMC_FLASH,
+    .parent         =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size  =3D sizeof(AspeedSMCState),
+    .class_init     =3D aspeed_smc_flash_class_init,
+};
+
+static void aspeed_smc_flash_register_types(void)
+{
+    type_register_static(&aspeed_smc_flash_info);
+}
+
+type_init(aspeed_smc_flash_register_types)
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 2d3e9f6b46d5..abd0005b01c2 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -27,6 +27,22 @@
=20
 #include "hw/ssi/ssi.h"
=20
+struct AspeedSMCState;
+
+typedef struct AspeedSMCFlashState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    uint8_t id;
+    size_t size;
+    struct AspeedSMCState *controller;
+    DeviceState *flash;
+} AspeedSMCFlashState;
+
+#define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
+#define ASPEED_SMC_FLASH(obj) \
+    OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
+
 typedef struct AspeedSMCController {
     const char *name;
     uint8_t r_conf;
--=20
2.1.4

