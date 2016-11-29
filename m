Received: by 10.25.150.194 with SMTP id y185csp2425193lfd;
        Tue, 29 Nov 2016 08:10:38 -0800 (PST)
X-Received: by 10.55.72.86 with SMTP id v83mr24391246qka.262.1480435838652;
        Tue, 29 Nov 2016 08:10:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t85si35206431qkl.237.2016.11.29.08.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkzN-0001pD-Aq
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:10:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkde-0000F0-UA
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkda-0005nP-03
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:48:10 -0500
Received: from 20.mo1.mail-out.ovh.net ([188.165.45.168]:55301)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkdZ-0005n2-QC
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:48:05 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2F64A1F974
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:48:01 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 944AE12007E;
	Tue, 29 Nov 2016 16:47:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:44:02 +0100
Message-Id: <1480434248-27138-25-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11759180103287343889
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.45.168
Subject: [Qemu-devel] [PATCH for-2.9 24/30] aspeed: use first SPI flash as a
 boot ROM
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hOuD3Q66MDtU

Fill a ROM region with the flash content to support U-Boot. This is a
little hacky but until we can boot from a MMIO region, it seems
difficult to do anything else.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 40c13838fb2d..a92c2f1c362b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -20,6 +20,8 @@
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "hw/loader.h"
+#include "qemu/error-report.h"
=20
 static struct arm_boot_info aspeed_board_binfo =3D {
     .board_id =3D -1, /* device-tree-only board */
@@ -104,6 +106,28 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
     },
 };
=20
+#define FIRMWARE_ADDR 0x0
+
+static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_siz=
e,
+                           Error **errp)
+{
+    BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
+    uint8_t *storage;
+
+    if (rom_size > blk_getlength(blk)) {
+        rom_size =3D blk_getlength(blk);
+    }
+
+    storage =3D g_new0(uint8_t, rom_size);
+    if (blk_pread(blk, 0, storage, rom_size) < 0) {
+        error_setg(errp, "failed to read the initial flash content");
+        return;
+    }
+
+    rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
+    g_free(storage);
+}
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
                                       Error **errp)
 {
@@ -135,6 +159,7 @@ static void aspeed_board_init(MachineState *machine,
 {
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
+    DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
=20
     bmc =3D g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
@@ -168,6 +193,22 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abor=
t);
     aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_a=
bort);
=20
+    /* Install first FMC flash content as a boot rom. */
+    if (drive0) {
+        AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
+        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
+
+        /*
+         * create a ROM region using the default mapping window size of
+         * the flash module.
+         */
+        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+                               fl->size, &error_abort);
+        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
+                                    boot_rom);
+        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+    }
+
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
     aspeed_board_binfo.initrd_filename =3D machine->initrd_filename;
     aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
--=20
2.7.4

