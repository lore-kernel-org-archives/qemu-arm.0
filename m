Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp892608ejt;
        Thu, 15 Jun 2023 10:38:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yPLkA6ehQmfMdpbdluOP9STJH7NrCT9dNCZTNySBqpuEwRcojp8aWofa3OA/n3Mg/Bfe3
X-Received: by 2002:a05:620a:4723:b0:75b:23a1:366f with SMTP id bs35-20020a05620a472300b0075b23a1366fmr19784040qkb.48.1686850736643;
        Thu, 15 Jun 2023 10:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686850736; cv=none;
        d=google.com; s=arc-20160816;
        b=vh94MvqtX4wpmNRI/m13D4GLVbFJySnBGQE8tzQZV+PvHQ6e7gbKGFMh1Z7NLiYFLo
         7rFF16xZQeuqJornd4g7WI6M9k/urYtgzkhPkeiN/pepCVSVX4Yh+JvjEuGJGG6wumAJ
         25f38SAaBykXRK8jPoiI/Exfa/MeDwn0iDSlaj2Nit6sUgCLLLnmm0Mu6RdxjdGnnSlW
         aQmMMMQOBb9Ykgmmelz7d0N7U+2l6aMf4GxZuCtk8bfByPQ2ma539uWJVVvmHHh+WFCm
         1nZJ2NaLkgHwoodgDXdjEPmbJeQxysekXK95ACSvrz/XVqhpNk233vY2YIbKeNU6ltzw
         eFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kssWgeCApOsOcp9kciJKxwv9zRomzLj/N8xGZFFsE/w=;
        b=yatKvsmBzXJoEooE6kyzJu2FSq8poqosKRry2g4T+lVvzUbe8nFRB9hGV6O5cElNYu
         M2/scadZCwOxMwLW64DCrOqCOB7JlzP0hvEATmNCZIfxGs1xdOYi2bGmunO09XR5H0W2
         ChFTsSEjY0OYY2vjaL7HmAa+aNsfN3B8BJzDE6clwomuPRSWhMA7NseGxHMSintOtus4
         9JoiQba4cz/uxMrIKN1foM3wj7WZY98CCKaDBuvtVhD5q2EbdL9dsdxnMOHJxIYCWPmv
         fPiqHLlLmMOrgCcyaxddIQYtQQPanGb7M9K3bHf7yS9Zufw36l9+2o6YcOsg6L/ysy7b
         Wo0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020ae9c215000000b0075f008549f2si7465547qkg.130.2023.06.15.10.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 10:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9qt6-0000e7-5B; Thu, 15 Jun 2023 13:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qt1-0000bo-FN; Thu, 15 Jun 2023 13:35:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qsx-0007ha-OV; Thu, 15 Jun 2023 13:35:54 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QhqFb1SHlz4x1R;
 Fri, 16 Jun 2023 03:35:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhqFX5LZQz4x0H;
 Fri, 16 Jun 2023 03:35:44 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 3/6] aspeed: Introduce a boot_rom region at the machine level
Date: Thu, 15 Jun 2023 19:35:22 +0200
Message-Id: <20230615173525.428831-4-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615173525.428831-1-clg@kaod.org>
References: <20230615173525.428831-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=xCJj=CD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: u6O7DwmlvQDa

This should also avoid Coverity to report a memory leak warning when
the QEMU process exits. See CID 1508061.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

