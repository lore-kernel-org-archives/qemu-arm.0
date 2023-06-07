Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3757ejb;
        Tue, 6 Jun 2023 21:40:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aZvlxqI3CWcPD3MBp7w2wY1aPS7Syp43+EWueetsMkOyiacm7PIDC297LcCxQDuFz/imM
X-Received: by 2002:a05:6214:5086:b0:62b:6bc5:7a1b with SMTP id kk6-20020a056214508600b0062b6bc57a1bmr1381149qvb.15.1686112831414;
        Tue, 06 Jun 2023 21:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112831; cv=none;
        d=google.com; s=arc-20160816;
        b=BSY5CM+kRr8joRe2RbEHt0thdR4or/LSYOxogDHD1Qw21V8qMXnnkhLxj/YsCOkjM0
         3Q5YfH07CgL80oYww8bLaM0tO0tW/CGV7H1lXzVcjiZxB5i6pEtqzc8htk374Sh4Lvfu
         vjD4tkzXGUj3tLE1/GkRpfjwZFJ6/C8DOTvhGJneFB87c/h/GdfK0pwaCn5w8v/El24e
         sPef0ZX12+3m8WzSV6DklscOqtJMasDEz3CGQtJkwDoYldFUMeAumq2HskIjo2vfNFhR
         yQLDXNt/Uq4nAipTQaGm74du7o8Tv/peO8q8wbvQkphvQt4MZubLuPwO19i6TIRFoh/o
         R9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Ij7etzy3IfIUSTzXf+0UHs4wwLI8rpBQg+zKn2c6DUA=;
        b=0X7vBAdPR6q8If60nJhQLqNLlNkvoXTHD+/WApswIhhTuv2rJ6COiDl8zDrwEqiEsm
         qpXjSFkrMXR59kNHmR+vwvv/jbekb44H/LFNZxmL15B1pWU89NIUuGU+Mp5TRVabpHgC
         +9Q7yw2bkzr01Tyv2rSvepKr19i9Byn/ol1zs/9WA2ro/Z4GyCgVdYUyb8Q9AJmGPDQF
         giKAkNWfybng8F3fbzrqlsMFXraX22WHh3LtX7y6mZ2UBO3PgZPBB1ICb4+z3uHdciGm
         aQQh9vZXgx5uutPMysvn6wh7UQfnQQ34+37agezDAopxKmgBJJe9/DgkBwgyG/jJ8Jw9
         Wv2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020a0562140e4400b006257cf747fasi7470650qvc.549.2023.06.06.21.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6kxw-0001kl-En; Wed, 07 Jun 2023 00:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kxu-0001jh-H7; Wed, 07 Jun 2023 00:40:10 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kxs-0003WY-I3; Wed, 07 Jun 2023 00:40:10 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQD53lXz4x4B;
 Wed,  7 Jun 2023 14:40:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQ96HXMz4x2c;
 Wed,  7 Jun 2023 14:40:01 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH v2 02/12] aspeed: Introduce a boot_rom region at the machine
 level
Date: Wed,  7 Jun 2023 06:39:33 +0200
Message-Id: <20230607043943.1837186-3-clg@kaod.org>
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
X-TUID: +GOUPhotPWqF

This should also avoid Coverity to report a memory leak warning when
the QEMU process exits. See CID 1508061.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bfc2070bd2ed..76a1e7303de1 100644
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
2.40.1

