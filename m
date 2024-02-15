Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp413133ejb;
        Thu, 15 Feb 2024 00:00:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsFw6TDpIEGPjNdFQ0787LgwGrZc0xUpuI4UH0ffz6TjL5inqoFA89miGdLI+fIYCuHkg9LpPgPTFrdFwCb78Y5+CPxKFn
X-Google-Smtp-Source: AGHT+IE0SBc9b5coSq4HGpxQ3LS6dbTp/4f3f+p2jgdGrO9Nvdmsq5EGaAKDpS1KnXP7jOVLiqNs
X-Received: by 2002:a05:620a:1474:b0:787:1849:53b1 with SMTP id j20-20020a05620a147400b00787184953b1mr1093043qkl.22.1707984009311;
        Thu, 15 Feb 2024 00:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707984009; cv=none;
        d=google.com; s=arc-20160816;
        b=lmshL4kHNJeEc0UOyjk975in74Vw7eYfvm1EaOVyBgQh7s2lgeJnTIganSjLJJ6aYA
         2IvCBJxQgkbq7QzxCuC6kuRpQYf9HVJxElESdeS9VmJSO9UaLawgBjFOCNNDbcV6MZGR
         S0g/ktzRIQF0VfudZPLsqfjBXhaX9wimA/QjGu28ZXtN0rmfhfluuL2+u66M1u7zDLg5
         +/LOdzWuq2emf54VVqmuYb7MOtPwqv3jRJJN9dTEkDJzZH/5VppQBEDmG1zgyrdR2ULZ
         1a9WA63abIwbbVWXnKULepk95qEjfLPOJQIG/wt2+BFMtpiFdC+uHm3YVXzV+s7r9Fq3
         r1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Z0wf6JZzG8xUcnGKWrGjDxKIyiQDaeeLXJBRVT+lZaM=;
        fh=jkt7ehUcUSTQBo264eWmsavDvXA1+0nMupSr24pggQ4=;
        b=wpLDeq7UJEXVpzsvm2MpmtIuX3dUe+kDGJqmcajacWaV5tVDoMIzk4QqMME6aAoOtF
         hdAGmRBJEnTPXOulwMo6cEoU6OxR4Lxnrj24HzQz9uBFqGLbTsh/1ZLGwAMkuMNr/QI+
         htEl7AECTPgAHbvYharjfnvCO+pf6PZBAdq8W4+u2lvKFdyEHrdYZ6ZO2yF/2h9rrPKl
         a/0bi5HMRVwV8AGMWHcf/hWSLIo/xbxCPTHeJCJPu309zOLFU0ynuQ53+8lyaOxijLEp
         B0F9BSJZHQ+y4UrWyzO98ps/ZTsbyuVjNeO3ODiRG3p4yYZ+RIsmMh8UOBQdA+w1bMQW
         8IaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020a05620a12d600b007873b342533si11217qkl.478.2024.02.15.00.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 00:00:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raWed-0007cz-PS; Thu, 15 Feb 2024 02:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raWec-0007ck-KR; Thu, 15 Feb 2024 02:59:34 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raWea-0006V0-Ts; Thu, 15 Feb 2024 02:59:34 -0500
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Feb
 2024 15:59:16 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Feb 2024 15:59:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 2/2] aspeed: fix hardcode boot address 0
Date: Thu, 15 Feb 2024 15:59:14 +0800
Message-ID: <20240215075914.2544262-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240215075914.2544262-1-jamin_lin@aspeedtech.com>
References: <20240215075914.2544262-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KMnsfhwiMv+I

In the previous design of ASPEED SOCs QEMU model, it set the boot
address at "0" which was the hardcode setting for ast10x0, ast2600,
ast2500 and ast2400.

According to the design of ast2700, it has a bootmcu(riscv-32) which
is used for executing SPL and initialize DRAM and copy u-boot image
from SPI/Flash to DRAM at address 0x400000000 at SPL boot stage.
Then, CPUs(cortex-a35) execute u-boot, kernel and rofs.

Currently, qemu not support emulate two CPU architectures
at the same machine. Therefore, qemu will only support
to emulate CPU(cortex-a35) side for ast2700 and the boot
address is "0x4 00000000".

Fixed hardcode boot address "0" for future models using
a different mapping address.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c             | 4 +++-
 hw/arm/aspeed_ast2400.c     | 4 ++--
 hw/arm/aspeed_ast2600.c     | 2 +-
 include/hw/arm/aspeed_soc.h | 2 --
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index aa165d583b..9fec245e4e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -289,12 +289,14 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
                                     uint64_t rom_size)
 {
     AspeedSoCState *soc = bmc->soc;
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(soc);
 
     memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_size,
                            &error_abort);
     memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
                                         &bmc->boot_rom, 1);
-    write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
+    write_boot_rom(blk, sc->memmap[ASPEED_DEV_SPI_BOOT],
+                   rom_size, &error_abort);
 }
 
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index 95da85fee0..d125886207 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -26,7 +26,7 @@
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
 
 static const hwaddr aspeed_soc_ast2400_memmap[] = {
-    [ASPEED_DEV_SPI_BOOT]  =  ASPEED_SOC_SPI_BOOT_ADDR,
+    [ASPEED_DEV_SPI_BOOT]  = 0x00000000,
     [ASPEED_DEV_IOMEM]  = 0x1E600000,
     [ASPEED_DEV_FMC]    = 0x1E620000,
     [ASPEED_DEV_SPI1]   = 0x1E630000,
@@ -61,7 +61,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
 };
 
 static const hwaddr aspeed_soc_ast2500_memmap[] = {
-    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
+    [ASPEED_DEV_SPI_BOOT]  = 0x00000000,
     [ASPEED_DEV_IOMEM]  = 0x1E600000,
     [ASPEED_DEV_FMC]    = 0x1E620000,
     [ASPEED_DEV_SPI1]   = 0x1E630000,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f74561ecdc..174be53770 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -22,7 +22,7 @@
 #define ASPEED_SOC_DPMCU_SIZE       0x00040000
 
 static const hwaddr aspeed_soc_ast2600_memmap[] = {
-    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
+    [ASPEED_DEV_SPI_BOOT]  = 0x00000000,
     [ASPEED_DEV_SRAM]      = 0x10000000,
     [ASPEED_DEV_DPMCU]     = 0x18000000,
     /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e1a023be53..c60fac900a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -224,8 +224,6 @@ enum {
     ASPEED_DEV_FSI2,
 };
 
-#define ASPEED_SOC_SPI_BOOT_ADDR 0x0
-
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
 void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
-- 
2.25.1

