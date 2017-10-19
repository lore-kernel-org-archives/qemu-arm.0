Received: by 10.223.197.9 with SMTP id q9csp7025131wrf;
        Thu, 19 Oct 2017 10:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QD+xXBpGYx9RqBDqNKFit2mvc1HV7upDKW2nL+iXz34VCmG/M+gDOGEbRCv4EKe3UysPq7
X-Received: by 10.28.109.28 with SMTP id i28mr2410492wmc.67.1508432557371;
        Thu, 19 Oct 2017 10:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508432557; cv=none;
        d=google.com; s=arc-20160816;
        b=qDRDdMerpJ3iCu1OTk8PI5Txbi8ycHgWOOujQc0vfd8sv5D65rYs6aE9AkdUSWWQap
         6fGSQ59C2JtBTjCOuT2HU3ANuN0a07NqOvhyv7ko00VwqZJxlg3BPh65pJ5ux/LgghSm
         nzNKIyk2Q2Hv/daX1ADOsENGYEL7drccahbsw7jeu1oGgEHHDlVoaV655xiVRY/1t2cB
         vqxA3ZNaqkphdBs0yuYXt7AgGN1yNdVGOAvYsetiwTDScU8Ed2g7GaMJUG+Kmzn66ksc
         5qopakZ5NHWyaCF1+dkM6jAzJHCE+HLvkXf+GBFOcU8JFlWE6FbNYXKWTwdMPAWACGc5
         PWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=f8vWuMoLOoCc2nZkX/TnYYamBNwa5phpFH92O03thto=;
        b=lW7ApfeKS0TpCgDRH/KtMFr/06/x1mKeBwFP6+oLNAOVw2b3HPrQY+4HDXpVKYGcaz
         dfaF3vLGWYF7AtVf4APkx8cHHQ3nkcvX0FiI6mykcqpl56ivlp7vfnmLIjnZg4fPViyy
         FB6BVraIEKlzHkcMkQrEszC4EEcwj6G26Q6rNJmHNWMbkzkgBT9MYAJCNlgrsPHcWTDX
         XhTln5vRRkSE5R6svQEUb0mFWb5wlOhvlXzwkBnJG2aye7IW+Ei0yGaruHmJC2hPn/4e
         oLU+5hJEZLAlcMQz1RsS/2OyXj7C+qzCmuZ7bScAM1o+02171zni72S9ssn3XEpUW4f9
         PslQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q63si11874057wrb.533.2017.10.19.10.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 10:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5EDM-0006mH-Bd
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 13:02:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dnl-00017z-G7
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dng-0003O4-QL
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:09 -0400
Received: from 4.mo5.mail-out.ovh.net ([178.33.111.247]:42757)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5Dng-0003Mx-Kn
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:04 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 48CF71461E6
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 18:36:03 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 1362680072;
	Thu, 19 Oct 2017 18:35:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:39 +0200
Message-Id: <20171019163546.2039-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019163546.2039-1-clg@kaod.org>
References: <20171019163546.2039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15308579559762135825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.111.247
Subject: [Qemu-devel] [PATCH v6 1/8] aspeed: use a ROM memory region to
 catch invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YfzeNBpQC/q9

Some legacy firmwares access unimplemented addresses on the Aspeed SoC
(old U-Boot code using variables in the bss when it shouldn't do).
Let's use a ROM memory region to catch the invalid writes and support
new boards without using the 'ignore_memory_transaction_failures'
flag.

This change is breaking migration compatibility for the Aspeed
machines.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v5 :

 - added a comment on migration compatibility
 - created the ROM memory region even if there is no file backend
   specified by the user

 Changes since v4 :

 - use a ROM memory region

 hw/arm/aspeed.c | 51 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..e6a890659a97 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -166,12 +166,31 @@ static void aspeed_board_init_flashes(AspeedSMCStat=
e *s, const char *flashtype,
     }
 }
=20
+/*
+ * This is to track invalid writes done in the ROM by some legacy
+ * firmwares
+ */
+static void boot_rom_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
+                  __func__, offset, value, size);
+}
+
+static const MemoryRegionOps boot_rom_ops =3D {
+    .write =3D boot_rom_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
 static void aspeed_board_init(MachineState *machine,
                               const AspeedBoardConfig *cfg)
 {
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
     DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
+    MemoryRegion *boot_rom;
+    size_t boot_rom_size;
=20
     bmc =3D g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
@@ -205,22 +224,24 @@ static void aspeed_board_init(MachineState *machine=
,
     aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abor=
t);
     aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_a=
bort);
=20
-    /* Install first FMC flash content as a boot rom. */
+    /*
+     * create a ROM region using the default mapping window size of
+     * the FMC CS0 flash module. The window size is 64MB for the
+     * AST2400 SoC and 128MB for the AST2500 SoC, which is twice as
+     * big as needed by the flash modules of the Aspeed machines.
+     */
+    boot_rom =3D g_new(MemoryRegion, 1);
+    boot_rom_size =3D bmc->soc.fmc.flashes[0].size;
+
+    memory_region_init_rom_device(boot_rom, OBJECT(bmc), &boot_rom_ops,
+                                  NULL, "aspeed.boot_rom", boot_rom_size=
,
+                                  &error_abort);
+    memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
+                                boot_rom);
+
+    /* Install first FMC flash content (if any) as a boot rom. */
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
-        memory_region_init_rom_nomigrate(boot_rom, OBJECT(bmc), "aspeed.=
boot_rom",
-                               fl->size, &error_abort);
-        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                    boot_rom);
-        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+        write_boot_rom(drive0, FIRMWARE_ADDR, boot_rom_size, &error_abor=
t);
     }
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
--=20
2.13.6

