Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1527562ejb;
        Sun, 9 Apr 2023 13:05:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBXJ0MqVnPSDyPr0Lhj39uEccibgrFxXjYwk1Tis5r5r2g3NnBWkfbsG2KhTv/7jLtyOS5
X-Received: by 2002:ac8:5753:0:b0:3da:7226:7539 with SMTP id 19-20020ac85753000000b003da72267539mr14729479qtx.66.1681070759147;
        Sun, 09 Apr 2023 13:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681070759; cv=none;
        d=google.com; s=arc-20160816;
        b=0Wu68dNZXW8YYF3k8YBitd7MNFE/6niH8BnHzgCYQ6RsqVcnJlYzItopUm6PWvZbuR
         mbE6mmBUoepFyVTpVxOb8sL2qI6AiWrRUc2gtrHfOsSBY1Vz8YfOG/95lMGnp6085xHP
         o9yNW12WtupxDD+8wrgr86LtGo7Yic6/aHio9zlFQQgd6qUQWofBY2pEVQeFX5uAELHl
         MYDCLtjTNlCqtEYNSTIKAKpOKtFpBp9WZsZWDWFZ0THDLlgsHFuQo1Jnccqe8xGEXG5+
         wkESrQO6sUBIIzux5sEVS64Fkq0rXKI7DvrTiK2+Jr34a3ihETKtIiN/yg+3UDYoccIG
         EJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=CH26KLfupyWDuzwszndEohgitNOFxjzbBtAhVBHQTH4=;
        b=hE4DazThgpqITZLlNb8pUvYRbDtmyWDnu+rGszHehMa6iybRGmVDNUvHUK8cvE5yjx
         XCetBOIs5ARtzJv6YlRerYsyCo0e/9aOqsfqkun6GUsv7cQz22K0NBs3FR5fYXeSKktt
         JPlKyvp4xdK6eHpMloaHaFiXAS27zi2U1EO0fMVQvx5YaBr081/S0n1vrrkmD1LIbvM4
         knymUtjmGnyxvwItwJWVBzSTVpEto2PMhYumHSx5I0l8U6a1RPLyeoqHU0B20pl2dFbj
         msM//x8mAxuVldrdcP5owqGaL6YDwdXmTIlGPUS2b7/IVMYDrR5KMXyhfkHPykF99s4U
         y6Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a370a0c000000b0071eb8581636si6005611qkk.666.2023.04.09.13.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Apr 2023 13:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1plbIM-0000v0-Tz; Sun, 09 Apr 2023 16:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1plbII-0000ub-1s; Sun, 09 Apr 2023 16:05:47 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1plbIG-0006UN-4J; Sun, 09 Apr 2023 16:05:45 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 80C1EDA0498;
 Sun,  9 Apr 2023 22:05:38 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id C7F5F4668B2; Sun,  9 Apr 2023 22:05:37 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] hw/arm: Fix some typos in comments (most found by codespell)
Date: Sun,  9 Apr 2023 22:05:25 +0200
Message-Id: <20230409200526.1156456-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OJeVLcB4N3rr

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

The patch does not change code and could also be applied for 8.0.

 hw/arm/Kconfig            | 2 +-
 hw/arm/exynos4210.c       | 4 ++--
 hw/arm/musicpal.c         | 2 +-
 hw/arm/omap1.c            | 2 +-
 hw/arm/omap2.c            | 2 +-
 hw/arm/virt-acpi-build.c  | 2 +-
 hw/arm/virt.c             | 2 +-
 hw/arm/xlnx-versal-virt.c | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..db1105c717 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -126,7 +126,7 @@ config OLIMEX_STM32_H405
 config NSERIES
     bool
     select OMAP
-    select TMP105   # tempature sensor
+    select TMP105   # temperature sensor
     select BLIZZARD # LCD/TV controller
     select ONENAND
     select TSC210X  # touchscreen/sensors/audio
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 6f2dda13f6..de39fb0ece 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -326,7 +326,7 @@ static int mapline_size(const int *mapline)
 
 /*
  * Initialize board IRQs.
- * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
+ * These IRQs contain split Int/External Combiner and External Gic IRQs.
  */
 static void exynos4210_init_board_irqs(Exynos4210State *s)
 {
@@ -744,7 +744,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
          * - SDMA
          * - ADMA2
          *
-         * As this part of the Exynos4210 is not publically available,
+         * As this part of the Exynos4210 is not publicly available,
          * we used the "HS-MMC Controller S3C2416X RISC Microprocessor"
          * public datasheet which is very similar (implementing
          * MMC Specification Version 4.0 being the only difference noted)
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index c9010b2ffb..58f3d30c9b 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -100,7 +100,7 @@
 #define MP_LCD_SPI_CMD          0x00104011
 #define MP_LCD_SPI_INVALID      0x00000000
 
-/* Commmands */
+/* Commands */
 #define MP_LCD_INST_SETPAGE0    0xB0
 /* ... */
 #define MP_LCD_INST_SETPAGE7    0xB7
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 559c066ce9..d5438156ee 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -4057,7 +4057,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *dram,
     s->led[1] = omap_lpg_init(system_memory,
                               0xfffbd800, omap_findclk(s, "clk32-kHz"));
 
-    /* Register mappings not currenlty implemented:
+    /* Register mappings not currently implemented:
      * MCSI2 Comm	fffb2000 - fffb27ff (not mapped on OMAP310)
      * MCSI1 Bluetooth	fffb2800 - fffb2fff (not mapped on OMAP310)
      * USB W2FC		fffb4000 - fffb47ff
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 366d6af1b6..d5a2ae7af6 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2523,7 +2523,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sdram,
                     omap_findclk(s, "func_96m_clk"),
                     omap_findclk(s, "core_l4_iclk"));
 
-    /* All register mappings (includin those not currenlty implemented):
+    /* All register mappings (including those not currently implemented):
      * SystemControlMod	48000000 - 48000fff
      * SystemControlL4	48001000 - 48001fff
      * 32kHz Timer Mod	48004000 - 48004fff
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49..4af0de8b24 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -694,7 +694,7 @@ static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
     build_append_int_noprefix(table_data, 0xE, 1);  /* Type */
     build_append_int_noprefix(table_data, 16, 1);   /* Length */
     build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
-    /* Discovery Range Base Addres */
+    /* Discovery Range Base Address */
     build_append_int_noprefix(table_data, base, 8);
     build_append_int_noprefix(table_data, size, 4); /* Discovery Range Length */
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..4983f5fc93 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2052,7 +2052,7 @@ static void machvirt_init(MachineState *machine)
         int pa_bits;
 
         /*
-         * Instanciate a temporary CPU object to find out about what
+         * Instantiate a temporary CPU object to find out about what
          * we are about to deal with. Once this is done, get rid of
          * the object.
          */
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 37fc9b919c..668a9d65a4 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -659,7 +659,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
 
     /* Make the APU cpu address space visible to virtio and other
-     * modules unaware of muliple address-spaces.  */
+     * modules unaware of multiple address-spaces.  */
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
-- 
2.39.2

