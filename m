Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7184099ejc;
        Wed, 1 Mar 2023 08:58:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+EIWe5cEJnFG9dLeQgiWe38U2IUNDvEUsSxda4Ak4iE/3tVjC866Wx3gf7/EVEEIaCCLJF
X-Received: by 2002:a05:6214:23c9:b0:56e:a899:1611 with SMTP id hr9-20020a05621423c900b0056ea8991611mr11004033qvb.0.1677689898701;
        Wed, 01 Mar 2023 08:58:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677689898; cv=none;
        d=google.com; s=arc-20160816;
        b=fqpdC9xZdSyLlHupyD3j/UPMiNr9NVlCgBLCeY+Rm3uDYp5UQjaAx2eyiM2IZ8bN55
         7rR1iqqZOmRZ+EbP57+LfShiWSs9m3ZWAncUT7P8+A24fDD+0brmHED2fvVIjTgts2lD
         dTDzXgNQKXvnbtDDgcYtVd+ekZhW6h6KPPnZTc+pzzC2HRN7XPAsMdNyBJElAc5I5oZN
         oW17mvhjO4B9nlfbI6y+mph2G7bhIFRZbYGAhaqZrsxV/tI++TdTd/h0Bvgn7uOBI2l0
         dMB45YFqrG1D0vt7vOHDJ2lMkw9YgZLGbehdySKtsrBjN6zn7qn5PKqZMQMJUFOOOg5Y
         wJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FSAJ5By49VdX2UMsNK6ResU1HyeX4Zp2iPC2Bj+V9JY=;
        b=bQoSSMq/nU0bxEPrwn9UoEGFX9OXXbicdnLyUyTB4jMq9+XT5m+m0PZDIaz3FqT8cO
         7CbBwjKDQNZ8+Dv+pD1bdHEQwO27ktLatKTF2yVXt7xHQ7wnmqd8DMUeVxelAit6Lfhv
         pAZrg71ANbw2a0kAFzDDyUkTSpvxJU6HU+tlWsLiSBOd/7x69h9ojIzKBzLzkce/Y0hV
         /MyROH6d4yVo41NZv8btjLnxnMMpeTDO3A/j2pvyMvT1PTuSPaNlmKunBXuWC8KTpvpI
         Z2EOpjYo+RHAHiX6vilT2MXsvzhZpvCTbFMkzOrlvHKxnDSoc7UV2SPq3u8B+V7wdatq
         QCSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188-20020a3743c5000000b007426a1ceb86si10590033qka.426.2023.03.01.08.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 08:58:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPlN-0000np-Tg; Wed, 01 Mar 2023 11:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlJ-0000lv-Dj; Wed, 01 Mar 2023 11:57:07 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlF-0007i9-O4; Wed, 01 Mar 2023 11:57:04 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPm4wB8z4x7x;
 Thu,  2 Mar 2023 03:57:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPk4p4wz4x1R;
 Thu,  2 Mar 2023 03:56:58 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 10/11] aspeed: Add a boot_rom overlap region in the SoC
 spi_boot container
Date: Wed,  1 Mar 2023 17:56:18 +0100
Message-Id: <20230301165619.2171090-11-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lb3IGHoGEsoF

To avoid the SPI transactions fetching instructions from the FMC CE0
flash device and speed up boot, a ROM can be created if a drive is
available.

Reverse the logic to allow a machine to boot without a drive, using a
block device instead :

    -blockdev node-name=fmc0,driver=file,filename=/path/to/flash.img \
    -device mx66u51235f,bus=ssi.0,drive=fmc0

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4a2814b7ea..e2617388ad 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -241,12 +241,9 @@ static void aspeed_reset_secondary(ARMCPU *cpu,
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
-#define FIRMWARE_ADDR 0x0
-
-static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
+static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
                            Error **errp)
 {
-    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
     g_autofree void *storage = NULL;
     int64_t size;
 
@@ -272,6 +269,22 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
 
+/*
+ * Create a ROM and copy the flash contents at the expected address
+ * (0x0). Boots faster than execute-in-place.
+ */
+static void aspeed_install_boot_rom(AspeedSoCState *soc, BlockBackend *blk,
+                                    uint64_t rom_size)
+{
+    MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+
+    memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom", rom_size,
+                           &error_abort);
+    memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
+                                        boot_rom, 1);
+    write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
+}
+
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
@@ -332,7 +345,6 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineState *bmc = ASPEED_MACHINE(machine);
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
-    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
     int i;
     NICInfo *nd = &nd_table[0];
 
@@ -382,21 +394,6 @@ static void aspeed_machine_init(MachineState *machine)
                               bmc->spi_model ? bmc->spi_model : amc->spi_model,
                               1, amc->num_cs);
 
-    /* Install first FMC flash content as a boot rom. */
-    if (drive0) {
-        AspeedSMCFlash *fl = &bmc->soc.fmc.flashes[0];
-        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
-        uint64_t size = memory_region_size(&fl->mmio);
-
-        if (!ASPEED_MACHINE(machine)->mmio_exec) {
-            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
-                                   size, &error_abort);
-            memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                        boot_rom);
-            write_boot_rom(drive0, FIRMWARE_ADDR, size, &error_abort);
-        }
-    }
-
     if (machine->kernel_filename && sc->num_cpus > 1) {
         /* With no u-boot we must set up a boot stub for the secondary CPU */
         MemoryRegion *smpboot = g_new(MemoryRegion, 1);
@@ -427,6 +424,16 @@ static void aspeed_machine_init(MachineState *machine)
                            drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
     }
 
+    if (!bmc->mmio_exec) {
+        DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);
+
+        if (mtd0) {
+            uint64_t rom_size = memory_region_size(&bmc->soc.spi_boot);
+            aspeed_install_boot_rom(&bmc->soc, blk_by_legacy_dinfo(mtd0),
+                                    rom_size);
+        }
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
-- 
2.39.2

