Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3832ejb;
        Tue, 6 Jun 2023 21:40:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ456/7nhPt5gj3DlVEyHAVsnjIeFm5iD7qlN0UGEo1bgGhOTe1WAjbIwfx/nL3wGQEqT2Rz
X-Received: by 2002:a05:6214:e6d:b0:61b:6e8a:4366 with SMTP id jz13-20020a0562140e6d00b0061b6e8a4366mr1853810qvb.1.1686112842839;
        Tue, 06 Jun 2023 21:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112842; cv=none;
        d=google.com; s=arc-20160816;
        b=AP8ACREhdfVzAJVcmkbwiNKKISVu6PH8U8f3tKqIyov7ARCaMWFP/FmtxsHGWWr3na
         rGLmvEIZcRTyRy2fukj6L69g+Nu/47oi3BH/mMdc57F472uOUJjhrZJ/MEq+CHKYAh/i
         o5veky2VyF/rNsyrJZ7zePfKcYXc9KQrn9YFUPx6CIgxms7SIdp7/62cF8J/H2v9tIib
         p/7umw899MFGNx4ZLIyNATBqBYvoEgaGUTSGNGVfTMqBLPc34/jlPJuOvuC8X9dtLEFJ
         nGF1ABARu75/HCNKcJcokOdgcFtfMdJqtSAxXuPSf78ftS3/H7DW9shy2jztFQE0M4nf
         AedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FUhq3LUrDAROCAaBuq2dnzlFdHpF6qV44gMUmxYzl1Q=;
        b=iDXgviU0JXm+/RUldftfC/dOmOPGL7ZS7GJ4ACuuuJemwYclz0EAWuc36mDuT80Feh
         6NvHK9ByQgXllaT7wsnz2JITMPr7y3t8hpGHL5mPmRfgs9rg2QKIqijjGpivGVdOtNpl
         ep/T2R+kS2s8fyZzbVGnLNi0IyX6tcQh+uMMiHx8VMw/31ewqUXUpZDj+krNjvcg5aPe
         qEU6OfAZ5h6i0yhkug0JRJLUdkUYNa9crXoU5/3vs2l7APEXgXBlCzIteWQLWxB/p2FR
         /dC1ZIXpED0T5G9XxRyj9NsSIPAAhVWwR3PjgHS2rz3YfnDOfHsQfqMwHa7Q6wGxBljV
         4IzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420e800b0061b6e8a435dsi7205144qvk.409.2023.06.06.21.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6kxy-0001m7-Ny; Wed, 07 Jun 2023 00:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kxx-0001lG-6X; Wed, 07 Jun 2023 00:40:13 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kxv-0003Xe-Ay; Wed, 07 Jun 2023 00:40:12 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQJ4FKBz4x3g;
 Wed,  7 Jun 2023 14:40:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQF1z7Mz4x4F;
 Wed,  7 Jun 2023 14:40:04 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH v2 03/12] aspeed: Use the boot_rom region of the fby35 machine
Date: Wed,  7 Jun 2023 06:39:34 +0200
Message-Id: <20230607043943.1837186-4-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xBUO0zXsJg7n

This change completes commits 5aa281d757 ("aspeed: Introduce a
spi_boot region under the SoC") and 8b744a6a47 ("aspeed: Add a
boot_rom overlap region in the SoC spi_boot container") which
introduced a spi_boot container at the SoC level to map the boot rom
region as an overlap.

It also fixes a Coverity report (CID 1508061) for a memory leak
warning when the QEMU process exits by using an bmc_boot_rom
MemoryRegion available at the machine level.

Cc: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index f4600c290b62..f2ff6c1abfd9 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -70,8 +70,6 @@ static void fby35_bmc_write_boot_rom(DriveInfo *dinfo, MemoryRegion *mr,
 
 static void fby35_bmc_init(Fby35State *s)
 {
-    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
-
     object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
 
     memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
@@ -95,18 +93,21 @@ static void fby35_bmc_init(Fby35State *s)
     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
 
     /* Install first FMC flash content as a boot rom. */
-    if (drive0) {
-        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
-        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
-        uint64_t size = memory_region_size(&fl->mmio);
-
-        if (!s->mmio_exec) {
-            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
-                                   size, &error_abort);
-            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-                                        boot_rom);
-            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
-                                     size, &error_abort);
+    if (!s->mmio_exec) {
+        DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);
+
+        if (mtd0) {
+            AspeedSoCState *bmc = &s->bmc;
+            uint64_t rom_size = memory_region_size(&bmc->spi_boot);
+
+            memory_region_init_rom(&s->bmc_boot_rom, NULL, "aspeed.boot_rom",
+                                   rom_size, &error_abort);
+            memory_region_add_subregion_overlap(&bmc->spi_boot_container, 0,
+                                                &s->bmc_boot_rom, 1);
+
+            fby35_bmc_write_boot_rom(mtd0, &s->bmc_boot_rom,
+                                     FBY35_BMC_FIRMWARE_ADDR,
+                                     rom_size, &error_abort);
         }
     }
 }
-- 
2.40.1

