Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp556645lfb;
        Thu, 31 Mar 2022 20:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4bJuRSmcx9/9FW2IzdMsnEMV2sVZuccq+ylEWUVHdtYMs6VnWdSE+M4/aC2rH1BkHX+MS
X-Received: by 2002:a05:620a:25c9:b0:67b:4634:49c8 with SMTP id y9-20020a05620a25c900b0067b463449c8mr5380404qko.712.1648782563921;
        Thu, 31 Mar 2022 20:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648782563; cv=none;
        d=google.com; s=arc-20160816;
        b=XQP0k+2WS5bUHNTWYviRlfD0Ij/igy/oAv91kDzI1/aD+YE1itzH40AujNA/U9i0Ku
         POtXdeGhXNSlcNKdgYi4SinJh3nuNJfR3z+z2JB0+gnvbfrDhm4Hv3+JWWDtffzz0VFH
         JBdS8au9ScQYnmy6Txh4z+RtS/YnNWiz102QKteWC48cf3uQZTiZT9V46vO4wBWLq+Xf
         lJY6yEj/DiW+lV+UwghqfQDwpV8T1/hWyWv3haW/jX6eSnwQ6XeunajPCjuypKxTcL0b
         XpgeVbnpSvDVLxCUNEPMNO07YF66nzygMqmDwwQp+gv/XUEhSQLG1Q5mAqf92X0JgqM0
         eNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=OdI6TR3FdC4svTMvMdhcbErnIZA2XCWzHd5GyxQZldQ=;
        b=MFNPA0l+lYQQohtdxoEq3h0NRqTUydmsGC09Gf/lYroaOMwc+I+GpzjimD8Uf/65BF
         wMy5Rc/TRpTNKxHp1J1G1GV0SwIC9y1m/nOGKszzsU+hVF+iPIvFTGHJGTkzOEBNFeZ9
         AYEJ2gg6CbsqismO0AhmqH9XwZtc0QC+dmHOvyCs0mRQT0Fzmf9uKEHUkUz2unxBzpXL
         TJv1iDmgcxH9ARVTfEmMcbOP0QpmNpmj38wQ9zayAVOYlU5sVimdnS/kl/aACk76pbjv
         ummc9iUlMhhbrlZo5G2LffrVot5TJgUprU05jQuHPnSZ7OqXNGUaYofgLLlN6wbg7CS3
         LGMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a123-20020a379881000000b0067e4be23956si769404qke.411.2022.03.31.20.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na7f9-0000T7-BX
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:09:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7bz-00048B-F9; Thu, 31 Mar 2022 23:06:07 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7bt-0002j6-SE; Thu, 31 Mar 2022 23:06:06 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2312sAQG090570;
 Fri, 1 Apr 2022 10:54:10 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:05:10 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/9] aspeed/smc: Add AST1030 support
Date: Fri, 1 Apr 2022 11:05:01 +0800
Message-ID: <20220401030508.28133-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
References: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2312sAQG090570
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J9GKo7aJ3iWu

From: Steven Lee <steven_lee@aspeedtech.com>

AST1030 spi controller's address decoding unit is 1MB that is identical
to ast2600, but fmc address decoding unit is 512kb.
Introduce seg_to_reg and reg_to_seg handlers for ast1030 fmc controller.
In addition, add ast1030 fmc, spi1, and spi2 class init handler.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 159 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 48305e1574..39367489a7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1696,6 +1696,162 @@ static const TypeInfo aspeed_2600_spi2_info = {
     .class_init = aspeed_2600_spi2_class_init,
 };
 
+/*
+ * The FMC Segment Registers of the AST1030 have a 512KB unit.
+ * Only bits [27:19] are used for decoding.
+ */
+#define AST1030_SEG_ADDR_MASK 0x0ff80000
+
+static uint32_t aspeed_1030_smc_segment_to_reg(const AspeedSMCState *s,
+        const AspeedSegments *seg)
+{
+    uint32_t reg = 0;
+
+    /* Disabled segments have a nil register */
+    if (!seg->size) {
+        return 0;
+    }
+
+    reg |= (seg->addr & AST1030_SEG_ADDR_MASK) >> 16; /* start offset */
+    reg |= (seg->addr + seg->size - 1) & AST1030_SEG_ADDR_MASK; /* end offset */
+    return reg;
+}
+
+static void aspeed_1030_smc_reg_to_segment(const AspeedSMCState *s,
+        uint32_t reg, AspeedSegments *seg)
+{
+    uint32_t start_offset = (reg << 16) & AST1030_SEG_ADDR_MASK;
+    uint32_t end_offset = reg & AST1030_SEG_ADDR_MASK;
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+
+    if (reg) {
+        seg->addr = asc->flash_window_base + start_offset;
+        seg->size = end_offset + (512 * KiB) - start_offset;
+    } else {
+        seg->addr = asc->flash_window_base;
+        seg->size = 0;
+    }
+}
+
+static const uint32_t aspeed_1030_fmc_resets[ASPEED_SMC_R_MAX] = {
+    [R_CONF] = (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0 |
+                            CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1),
+};
+
+static const AspeedSegments aspeed_1030_fmc_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_1030_fmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 1030 FMC Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->cs_num_max        = 2;
+    asc->segments          = aspeed_1030_fmc_segments;
+    asc->segment_addr_mask = 0x0ff80ff8;
+    asc->resets            = aspeed_1030_fmc_resets;
+    asc->flash_window_base = 0x80000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x000BFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_1030_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_1030_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_1030_fmc_info = {
+    .name =  "aspeed.fmc-ast1030",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_1030_fmc_class_init,
+};
+
+static const AspeedSegments aspeed_1030_spi1_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_1030_spi1_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 1030 SPI1 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->cs_num_max        = 2;
+    asc->segments          = aspeed_1030_spi1_segments;
+    asc->segment_addr_mask = 0x0ff00ff0;
+    asc->flash_window_base = 0x90000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_WDT_CONTROL;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x000BFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_1030_spi1_info = {
+    .name =  "aspeed.spi1-ast1030",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_1030_spi1_class_init,
+};
+static const AspeedSegments aspeed_1030_spi2_segments[] = {
+    { 0x0, 128 * MiB }, /* start address is readonly */
+    { 0x0, 0 }, /* disabled */
+};
+
+static void aspeed_1030_spi2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
+
+    dc->desc               = "Aspeed 1030 SPI2 Controller";
+    asc->r_conf            = R_CONF;
+    asc->r_ce_ctrl         = R_CE_CTRL;
+    asc->r_ctrl0           = R_CTRL0;
+    asc->r_timings         = R_TIMINGS;
+    asc->nregs_timings     = 2;
+    asc->conf_enable_w0    = CONF_ENABLE_W0;
+    asc->cs_num_max        = 2;
+    asc->segments          = aspeed_1030_spi2_segments;
+    asc->segment_addr_mask = 0x0ff00ff0;
+    asc->flash_window_base = 0xb0000000;
+    asc->flash_window_size = 0x10000000;
+    asc->features          = ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_WDT_CONTROL;
+    asc->dma_flash_mask    = 0x0FFFFFFC;
+    asc->dma_dram_mask     = 0x000BFFFC;
+    asc->nregs             = ASPEED_SMC_R_MAX;
+    asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
+    asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
+    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
+}
+
+static const TypeInfo aspeed_1030_spi2_info = {
+    .name =  "aspeed.spi2-ast1030",
+    .parent = TYPE_ASPEED_SMC,
+    .class_init = aspeed_1030_spi2_class_init,
+};
+
 static void aspeed_smc_register_types(void)
 {
     type_register_static(&aspeed_smc_flash_info);
@@ -1709,6 +1865,9 @@ static void aspeed_smc_register_types(void)
     type_register_static(&aspeed_2600_fmc_info);
     type_register_static(&aspeed_2600_spi1_info);
     type_register_static(&aspeed_2600_spi2_info);
+    type_register_static(&aspeed_1030_fmc_info);
+    type_register_static(&aspeed_1030_spi1_info);
+    type_register_static(&aspeed_1030_spi2_info);
 }
 
 type_init(aspeed_smc_register_types)
-- 
2.17.1

