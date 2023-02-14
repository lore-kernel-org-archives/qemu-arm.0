Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1466421ejb;
        Tue, 14 Feb 2023 09:19:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+gaOG4S9bTmCDK34WxTRBbXOcah58/bWHdkYJG4xPU9cHlIltkqK+WhG6gw6ZCA8+1/sKg
X-Received: by 2002:ac8:5786:0:b0:3b8:58d0:b4e4 with SMTP id v6-20020ac85786000000b003b858d0b4e4mr5100124qta.33.1676395185881;
        Tue, 14 Feb 2023 09:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395185; cv=none;
        d=google.com; s=arc-20160816;
        b=IXqj8oE4XhPMxwcNh/L9StTfoy9tSAfEs/Awv32s5XjoOyaH+2vBwHoqmBhGCHIJtf
         +J8V35U+DC+ZhIzQ6yu4LVEBDzoGhtpFfzCb3HOuwUMVJC/0pvGiMzWhUPCWHjyCOUyY
         XNrkfsF9WOeuSTSXqdpb5SRXI+raTgDGEFL5hGbAE4Ctu/M8/sMOTO2F5h6Rnt/mUZu4
         oJ788VGgKRcE/qm8RLFSKj6/QREmY1qmtRERwvd33k8zc8R40VWovvQmfRXqZB8n1KKN
         OzH4wX+CGVjHL8cxH29ZK+6HCOFpNodugjwxB74twgy1QAkI8ejmKdLMJQW0jE3i6Tdo
         3ysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=OIuRb4iXACehsFIEu5d28794dlR4H6jzqE3OfBeVNew=;
        b=hCo6xIs36DGFiS2I8K45mHJU6LeK5MFQj4M5VFaHK2q9hR4/Gz1fuNRjKMTP1FAFDW
         bXOv7cFUVDGo6E6aroZzjyH0PNKkc3YfNixtS3R4rGSJz5+k8O+7TS3F/81OIwWeRX3F
         6eaCK/+WW+ZCr6pyeVLOa1vMtRzzYOO5DP46NxaTh79Ysd23STABKFvVBk5pv8pk05t4
         T4iS9FISHWKTYOTD9pKe40jLHN6lyZQakClmcs1JS9IulLqIfZv1seFNCeHJB87E2/mt
         /Sz4MzxfcVi5HVmYvg/J/SdVwBGvym7Yg2/Zto0UL6PbW7J+eBqg0P40hRQTZ/W17DNA
         QVvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a66-20020a37b145000000b0073b6a34832csi84632qkf.296.2023.02.14.09.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:19:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyxk-0001zn-7Y; Tue, 14 Feb 2023 12:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxX-0001ok-B9; Tue, 14 Feb 2023 12:19:15 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxU-0004tR-Bf; Tue, 14 Feb 2023 12:19:15 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGScF2Pwvz4x8H;
 Wed, 15 Feb 2023 04:19:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGScB3r57z4x82;
 Wed, 15 Feb 2023 04:19:06 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 8/8] aspeed: Add a boot_rom overlap region in the SoC spi_boot
 container
Date: Tue, 14 Feb 2023 18:18:30 +0100
Message-Id: <20230214171830.681594-9-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
References: <20230214171830.681594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: GmLypns5btKa

To avoid the SPI transactions fetching instructions from the FMC CE0
flash device and speed up boot, a ROM can be created if a drive is
available.

Reverse a bit the logic to allow a machine to boot without a drive,
using a block device instead :

    -blockdev node-name=fmc0,driver=file,filename=/path/to/flash.img \
    -device mx66u51235f,bus=ssi.0,drive=fmc0

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 998dc57969..13e719bae7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -243,10 +243,9 @@ static void aspeed_reset_secondary(ARMCPU *cpu,
 
 #define FIRMWARE_ADDR 0x0
 
-static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
+static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
                            Error **errp)
 {
-    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
     g_autofree void *storage = NULL;
     int64_t size;
 
@@ -272,6 +271,22 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
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
+    write_boot_rom(blk, FIRMWARE_ADDR, rom_size, &error_abort);
+}
+
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
@@ -328,7 +343,6 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineState *bmc = ASPEED_MACHINE(machine);
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
-    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
     int i;
     NICInfo *nd = &nd_table[0];
 
@@ -378,21 +392,6 @@ static void aspeed_machine_init(MachineState *machine)
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
@@ -423,6 +422,16 @@ static void aspeed_machine_init(MachineState *machine)
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
2.39.1

