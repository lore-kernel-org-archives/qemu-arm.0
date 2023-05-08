Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1883928ejq;
        Mon, 8 May 2023 01:00:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dzH6px32kLJFoM+f5gjswrlSSRqjjVvWk0GMsDdR0z3voB7uA4AhGmnGBIc/r3aTE7K8Q
X-Received: by 2002:a05:622a:1008:b0:3ef:6353:2c58 with SMTP id d8-20020a05622a100800b003ef63532c58mr12242386qte.21.1683532808674;
        Mon, 08 May 2023 01:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532808; cv=none;
        d=google.com; s=arc-20160816;
        b=Ch7xn2/IZzzYHefhJK/O6FFDcl/hfyTAbzZW5ekdoJPZdZG+P3F+1+HGWd4/FAAJz9
         d47auQ0bLVUcWv/MQCkqgTwhypPBfInR+GVpK7nwuL5f1JMnLr5TIdDesFcL1yiHkcrV
         i+giRzPBFyWTPtjmqpUQZ1X6wb+YRhEkrmlnFg2By8LBQbqN1P5BCUsJG272/KEcvJzB
         WRz8XpEThL0wVTNCqRQk/WvVU9tJQJRRK29/BY4G0t8h2y4zivG20vtwr2t9BP9dKmed
         V7NPdS4+aOr8YsPcfrD4Tq4u1FGdb+EXv2QnaiKOEbzXqzXC4BEK0EPnnBrUn1p/XaqH
         Sabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0yK4YfnH1Mb5S1bQtnoph7zQ9suJ4x2CbR1aknQSJNs=;
        b=lOxfHdi6r2qtWPxPuAztF8u+49T6VNcct2Am8dAKeX0R2t3CIeBrdR5D6Mqs+M+MO/
         j/a3XEtyhDdXqwELleYoIwaVr5a9x841Oe7VaVND4SnSnIJiHJ2oVpUkYC1itLLzxaMF
         n5GwvNKDZdCxwUQBZ/PUcJKv4Hol9srmoVyE14VbL28f8d10jb8ohC4K/nDZEcVbM2u4
         pxTAkR1bnIm3td6PTjyPbTM8nkZjswyRiBW2bJ7VzNtvk7EgJ46IQ5BG3HhyLBNW3ioT
         DSYP1n4osg7wYb01QDFPd1nqMh/8VpKsC0Ip1nzjT5jTI0ojVuieudBlw6vHptuBEuY/
         p6jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05622a010e00b003f21db65c82si2648471qtw.71.2023.05.08.01.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvmI-0007z4-Uo; Mon, 08 May 2023 03:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmF-0007xc-7k; Mon, 08 May 2023 03:59:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmD-00016d-7a; Mon, 08 May 2023 03:59:22 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDFv1HrMz4x48;
 Mon,  8 May 2023 17:59:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDFs05yKz4x44;
 Mon,  8 May 2023 17:59:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 02/12] aspeed: Introduce a boot_rom region at the machine level
Date: Mon,  8 May 2023 09:58:49 +0200
Message-Id: <20230508075859.3326566-3-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 3Ew5MIuCudK7

This should also avoid Coverity to report a memory leak warning when
the QEMU process exits. See CID 1508061.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0b29028fe1..b654513f35 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -40,6 +40,7 @@ struct AspeedMachineState {
     /* Public */
 
     AspeedSoCState soc;
+    MemoryRegion boot_rom;
     bool mmio_exec;
     char *fmc_model;
     char *spi_model;
@@ -275,15 +276,15 @@ static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
  * Create a ROM and copy the flash contents at the expected address
  * (0x0). Boots faster than execute-in-place.
  */
-static void aspeed_install_boot_rom(AspeedSoCState *soc, BlockBackend *blk,
+static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
                                     uint64_t rom_size)
 {
-    MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+    AspeedSoCState *soc = &bmc->soc;
 
-    memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom", rom_size,
+    memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_size,
                            &error_abort);
     memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
-                                        boot_rom, 1);
+                                        &bmc->boot_rom, 1);
     write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
 }
 
@@ -431,8 +432,7 @@ static void aspeed_machine_init(MachineState *machine)
 
         if (mtd0) {
             uint64_t rom_size = memory_region_size(&bmc->soc.spi_boot);
-            aspeed_install_boot_rom(&bmc->soc, blk_by_legacy_dinfo(mtd0),
-                                    rom_size);
+            aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(mtd0), rom_size);
         }
     }
 
-- 
2.40.0

