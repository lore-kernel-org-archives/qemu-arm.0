Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4453013wre;
        Wed, 30 May 2018 00:55:30 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLmQ+RhO6hfVPAPsuteVkADT0Y/FYO0ICcCwi+rjR1bxItuSRuZbOAM/7Q9NRzP1Dv45pBH
X-Received: by 2002:a0c:d80f:: with SMTP id h15-v6mr1471037qvj.3.1527666929945;
        Wed, 30 May 2018 00:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527666929; cv=none;
        d=google.com; s=arc-20160816;
        b=qUWKsvEXJFoqgPWwJGbR418+NLTTsO5LKcWOzID866grpmM/s+EyuLU/DqqwDHlsyR
         8s54O+mkOfMZ4wENM6QOCcrNnKWexo6VbnJeFjZGnC1DKt5kBqCdbWGpi4iU7gY9n3tA
         DbnX0YTC7bMJJGNr50+YHLSyX1CfvZGvFd6MJlrWkePBcYg1Jyxs0EEAG6kRrJrKjj6x
         TLIdyacvOYgDm8cVokM1FmPqhT/JPCIvyiTbTWgdBXF04v4kduIbnD3teyaRsFXQ1EN9
         vLA/fiNULXEKvuQ7q2rwMWjW6RrNWZNJ63ZoE6ldKs81IhVLf5xVFEitGoScmtWGt9SF
         hg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qXtD52UbUMZE9YJJpHrl2XEhH+kub4il+KeTUZOahfU=;
        b=vUvkBsIygkusy1g3el+YC1d4ZcyGAuikV+Y6MMzkAF23POuLmDUTk4kl+x0atgB4/X
         A2Tp9zBZgA7ZGDwvTqcxplxjPz1vjeie+z4rW2dNtzIivme3Lk9ZmTPdKGqP8mRZI96M
         kGvcRTKeRbveTQQyl1AaJULGOM61QxTnweCQ5oxPXuZ+36gMj+CmQGB0JFbRz6HIso2K
         0YeSHhHHS1m+2yFEHmhrv6tFsH+hO3E+WTzdKPBODat83zFk2gu/1UuRDCnmffaHS6XH
         R0+6wm5Hyj+bGrTc2RO1OByurnc1r/B2f0TKMTlUslUca+l/XNqCaUUNSboUDO0JX9Mn
         Ncew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si7027613qtb.85.2018.05.30.00.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 00:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNvxB-0001Kx-Ft
	for alex.bennee@linaro.org; Wed, 30 May 2018 03:55:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsW-0006Mi-7f
	for qemu-devel@nongnu.org; Wed, 30 May 2018 03:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsU-0001GZ-28
	for qemu-devel@nongnu.org; Wed, 30 May 2018 03:50:40 -0400
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:40268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNvsT-0001GD-Qx
	for qemu-devel@nongnu.org; Wed, 30 May 2018 03:50:37 -0400
Received: from player770.ha.ovh.net (unknown [10.109.108.50])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 7BA64E5546
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 09:50:36 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player770.ha.ovh.net (Postfix) with ESMTPSA id 356BDC007F;
	Wed, 30 May 2018 09:50:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 09:50:02 +0200
Message-Id: <20180530075002.4618-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530075002.4618-1-clg@kaod.org>
References: <20180530075002.4618-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6326431577016339217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.74.219
Subject: [Qemu-devel] [PATCH 4/4] hw/arm/aspeed: boot from the FMC CE0 flash
 module
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: giMv9PdZ/zdH

When MMIO execution is activated on the FMC controller, remove the
copy of the flash module contents in a ROM memory region and boot
directly from CE0.

Booting from an alternate module (FMC CE1) should be possible. There
is still some work to support the module swap when the watchdog resets
the system.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e28170b7e1d8..e87a5899845f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -160,6 +160,32 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr =
addr, size_t rom_size,
     g_free(storage);
 }
=20
+static void install_boot_rom(AspeedBoardState *bmc, DriveInfo *drive,
+                             hwaddr addr)
+{
+    AspeedSMCState *fmc =3D &bmc->soc.fmc;
+    AspeedSMCFlash *fl =3D &fmc->flashes[0];
+    bool mmio_exec =3D object_property_get_bool(OBJECT(fmc), "mmio-exec"=
,
+                                              &error_abort);
+    if (mmio_exec) {
+        memory_region_add_subregion(get_system_memory(), addr,
+                                    &fl->mmio_rom);
+    } else {
+        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
+
+        /*
+         * create a ROM region using the default mapping window size of
+         * the flash module. The window size is 64MB for the AST2400
+         * SoC and 128MB for the AST2500 SoC, which is twice as big as
+         * needed by the flash modules of the Aspeed machines.
+         */
+        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+                               fl->size, &error_abort);
+        memory_region_add_subregion(get_system_memory(), addr, boot_rom)=
;
+        write_boot_rom(drive, addr, fl->size, &error_abort);
+    }
+}
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
                                       Error **errp)
 {
@@ -232,20 +258,7 @@ static void aspeed_board_init(MachineState *machine,
=20
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
-        AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
-        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
-
-        /*
-         * create a ROM region using the default mapping window size of
-         * the flash module. The window size is 64MB for the AST2400
-         * SoC and 128MB for the AST2500 SoC, which is twice as big as
-         * needed by the flash modules of the Aspeed machines.
-         */
-        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
-                               fl->size, &error_abort);
-        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                    boot_rom);
-        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+        install_boot_rom(bmc, drive0, FIRMWARE_ADDR);
     }
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
--=20
2.13.6

