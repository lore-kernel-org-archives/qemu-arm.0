Received: by 10.25.21.96 with SMTP id l93csp1782987lfi;
        Tue, 28 Jun 2016 11:30:14 -0700 (PDT)
X-Received: by 10.237.39.167 with SMTP id a36mr4340346qtd.103.1467138614351;
        Tue, 28 Jun 2016 11:30:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r30si4846963qtd.31.2016.06.28.11.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxm1-0003nQ-Oy
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:30:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxhw-0007Rp-1G
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:26:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxhs-0002ZA-LG
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:59 -0400
Received: from 14.mo3.mail-out.ovh.net ([188.165.43.98]:60055)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHxhs-0002Yi-AX
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:56 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7F994FF8D8F
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 20:25:55 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 149504C0069;
	Tue, 28 Jun 2016 20:25:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 28 Jun 2016 20:24:29 +0200
Message-Id: <1467138270-32481-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467138270-32481-1-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13921470877216443153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.43.98
Subject: [Qemu-arm] [PATCH v5 8/9] ast2400: create SPI flash slaves
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
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBi4MLSozhRA

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

