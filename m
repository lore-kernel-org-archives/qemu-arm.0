Received: by 10.25.21.96 with SMTP id l93csp1493186lfi;
        Mon, 4 Jul 2016 05:23:30 -0700 (PDT)
X-Received: by 10.129.155.136 with SMTP id s130mr1590833ywg.48.1467635010667;
        Mon, 04 Jul 2016 05:23:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a184si182531qkb.78.2016.07.04.05.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2uQ-0003lX-06
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:23:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rQ-0007XL-EM
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:20:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rM-0003w4-7I
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:20:24 -0400
Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]:37697)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2rL-0003vh-U4
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:20:20 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 07100FFBCB7
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 14:20:19 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 7B5FD48009E;
	Mon,  4 Jul 2016 14:20:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon,  4 Jul 2016 14:18:57 +0200
Message-Id: <1467634738-28642-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467634738-28642-1-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6089429647671659281
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.165.232
Subject: [Qemu-arm] [PATCH 6/7] ast2400: use contents of first SPI flash as
 a rom
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
X-TUID: vMJSAOQQvBLQ

This provides support for U-Boot images which are loaded at 0x0.

A Palmetto BMC guest can now be simply booted with :

  $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
	-mtdblock ./flash-palmetto-20160512040959  \
	-mtdblock ./palmetto.pnor

The first block device uses the file './flash-palmetto-20160512040959'
which will act as a SPI flash module for the BMC, handled by the
SMC/FMC controller. The second block device uses the file
'./palmetto.pnor' which is an OpenPower firmware image for a palmetto
OpenPower system. This one will be handled by the SMC/SPI controller.

The flash images can be grabbed here :

    https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalm=
etto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

We could add a second BMC SPI flash by changing the 'num-cs' property
of the controller and emulate a golden image flash module.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index b00757dcbc69..fcbb4f197162 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -33,6 +33,8 @@ typedef struct PalmettoBMCState {
     MemoryRegion ram;
 } PalmettoBMCState;
=20
+static bool palmetto_bmc_has_flash0;
+
 static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
                                       Error **errp)
 {
@@ -51,6 +53,7 @@ static void palmetto_bmc_init_flashes(AspeedSMCState *s=
, const char *flashtype,
         if (dinfo) {
             qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(=
dinfo),
                                 errp);
+            palmetto_bmc_has_flash0 =3D true;
         }
         m25p80_set_rom_storage(fl->flash, &fl->mmio);
         qdev_init_nofail(fl->flash);
@@ -82,6 +85,21 @@ static void palmetto_bmc_init(MachineState *machine)
     palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
     palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635f", &error_abort=
);
=20
+    /*
+     * Install first SMC/FMC flash content as a rom.
+     */
+    if (palmetto_bmc_has_flash0) {
+        AspeedSMCFlash *flash0 =3D &bmc->soc.smc.flashes[0];
+        MemoryRegion *flash0alias =3D g_new(MemoryRegion, 1);
+
+        memory_region_init_alias(flash0alias, OBJECT(&bmc->soc.smc),
+                                 "flash0alias", &flash0->mmio, 0,
+                                 flash0->size);
+
+        memory_region_add_subregion(get_system_memory(), 0, flash0alias)=
;
+        palmetto_bmc_binfo.firmware_loaded =3D true;
+    }
+
     palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
--=20
2.1.4

