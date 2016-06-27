Received: by 10.25.21.96 with SMTP id l93csp1211472lfi;
        Mon, 27 Jun 2016 09:50:07 -0700 (PDT)
X-Received: by 10.200.41.14 with SMTP id y14mr25715421qty.11.1467046207589;
        Mon, 27 Jun 2016 09:50:07 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e185si17923905qkc.201.2016.06.27.09.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 09:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHZjb-0008SZ-2O
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 12:50:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZe5-0002K7-GO
	for qemu-devel@nongnu.org; Mon, 27 Jun 2016 12:44:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZe3-0008Kt-AS
	for qemu-devel@nongnu.org; Mon, 27 Jun 2016 12:44:24 -0400
Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]:41961)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHZe2-0008Km-VW
	for qemu-devel@nongnu.org; Mon, 27 Jun 2016 12:44:23 -0400
Received: from player728.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 5AAABFFB896
	for <qemu-devel@nongnu.org>; Mon, 27 Jun 2016 18:44:22 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id E6425540076;
	Mon, 27 Jun 2016 18:44:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 27 Jun 2016 18:43:32 +0200
Message-Id: <1467045813-18144-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467045813-18144-1-git-send-email-clg@kaod.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6333749929921317649
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.181.248
Subject: [Qemu-devel] [PATCH v4 4/5] ast2400: create SPI flash slaves
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BjX4fV02pTCQ

A set of SPI flash slaves is attached under the flash controllers of
the palmetto platform. "n25q256a" flash modules are used for the BMC
and "mx25l25635e" for the host. These types are common in the
OpenPower ecosystem.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v3 :

 - moved memory mapping to platform initialization
=20
 Changes since v2 :

 - moved the initialization of the flash modules under the palmetto
   platform
=20
 hw/arm/palmetto-bmc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index b8eed21348d8..54e29a865d88 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -18,6 +18,8 @@
 #include "hw/arm/ast2400.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
=20
 static struct arm_boot_info palmetto_bmc_binfo =3D {
     .loader_start =3D AST2400_SDRAM_BASE,
@@ -30,6 +32,32 @@ typedef struct PalmettoBMCState {
     MemoryRegion ram;
 } PalmettoBMCState;
=20
+static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
+                                      Error **errp)
+{
+    int i ;
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        AspeedSMCFlash *fl =3D &s->flashes[i];
+        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
+        qemu_irq cs_line;
+
+        /*
+         * FIXME: check that we are not using a flash module exceeding
+         * the controller segment size
+         */
+        fl->flash =3D ssi_create_slave_no_init(s->spi, flashtype);
+        if (dinfo) {
+            qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(=
dinfo),
+                                errp);
+        }
+        qdev_init_nofail(fl->flash);
+
+        cs_line =3D qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+    }
+}
+
 static void palmetto_bmc_init(MachineState *machine)
 {
     PalmettoBMCState *bmc;
@@ -49,6 +77,9 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
+    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+
     palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
--=20
2.1.4

