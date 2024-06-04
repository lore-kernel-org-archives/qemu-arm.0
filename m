Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718168ejs;
        Mon, 3 Jun 2024 22:47:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9NOkU0A2VaibI6BfnOtKiwK9KfNiFcuAQIIvA66wQ52FadzpMU7KzlqDEGrgUwm41SXyxjVU+m0LS3LMJk5G7NdBBGJuc
X-Google-Smtp-Source: AGHT+IGsmD84t9llQ1rurUFPMg0UC6QwJN0LQFgnrEC/8B3ILKE57TCk2clFdekmd0KnEnXu9/Qe
X-Received: by 2002:a05:6214:5682:b0:6af:c289:b96e with SMTP id 6a1803df08f44-6afc289bf0bmr48960116d6.56.1717480056217;
        Mon, 03 Jun 2024 22:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480056; cv=none;
        d=google.com; s=arc-20160816;
        b=e17y7UF3qOCahAnW4IRlQtjayV9Mj5kVkJE8P+5czHIPd7dJiGQwKO8g71t0ZUqmVc
         TPkPFBRGMrrbFd/+jzDKbMFakVtVXfNQjOY8kqEFy8hmoiZ3UccpX2Kmns6M2+7s6jr7
         i7AK+82f57vi5y6OikblhnKc+8HeY86XAsXxTH6qvV3dzpON863t0l4TapJUmHsVS22r
         hGdrgdjH4hrG7QtBBOO7lsSyy30CfrCje9D/DITIXNQEC5qK0BebPX4yiFVdVXkT2g+y
         /Tbv2oQ0IfzNXnod/08d1dHP3HwJFLZbu4szi6q/L7o2qbqI/kKdWTqjrpM9hFJnXnKY
         WzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=KpBT36/Sf+V7oaZspXR05aOFNOw/DZvRpxWjKobb4+o=;
        fh=GYhH0uUPR6/wogcCeDtqLdCDfiE/891GxRAjoHRzhEo=;
        b=ojIHBol8tdqY28mftGHdz/yz886Aa8gwS/it1WraLqlciLt0tPqCqpvVs/JSMYeHzh
         q1vKi2wxJQeyoAaPEBJIEdO5aE1nBTNqQibzkHmw9SX7q+nVxLSQaPfU3U8PpP+ewEfL
         0hn8K/d+wOnUcv45/TEzMMnKfEBS9JB/lcgh/GEgUx6pf5NiKphDo9KWTw9z/CWTvxFR
         vLWAuHqylvhDiW30oAoXfA3NqhcEtOO0cm2L/t9ifDih9+oZ0f2wmqfzYYv0Jm+jA43S
         WSsKEU1mrPHzoWYbYVWzYltMRzzkBRN5o6Mt2EZClInEbyphh96GtZbTjcknRi8X5yPG
         uV2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b40420bsi100862506d6.246.2024.06.03.22.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEMyt-0005ds-Um; Tue, 04 Jun 2024 01:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMys-0005de-TX; Tue, 04 Jun 2024 01:45:10 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyr-0008TH-0f; Tue, 04 Jun 2024 01:45:10 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:43 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Jun
 2024 13:44:43 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:42 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v5 07/17] aspeed/smc: support dma start length and 1 byte
 length unit
Date: Tue, 4 Jun 2024 13:44:28 +0800
Message-ID: <20240604054438.3424349-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: stLNJxXCanXy

DMA length is from 1 byte to 32MB for AST2600 and AST10x0
and DMA length is from 4 bytes to 32MB for AST2500.

In other words, if "R_DMA_LEN" is 0, it should move at least 1 byte
data for AST2600 and AST10x0 and 4 bytes data for AST2500.
To support all ASPEED SOCs, adds dma_start_length parameter to store
the start length, add helper routines function to compute the dma length
and update DMA_LENGTH mask to "1FFFFFF" to support dma 1 byte
length unit for AST2600 and AST1030.
Currently, only supports dma length 4 bytes aligned.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/ssi/aspeed_smc.c         | 43 ++++++++++++++++++++++++++++++-------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index fe1cd96b80..0b8488a113 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -178,13 +178,17 @@
  * DMA flash addresses should be 4 bytes aligned and the valid address
  * range is 0x20000000 - 0x2FFFFFFF.
  *
- * DMA length is from 4 bytes to 32MB
+ * DMA length is from 4 bytes to 32MB (AST2500)
  *   0: 4 bytes
- *   0x7FFFFF: 32M bytes
+ *   0x1FFFFFC: 32M bytes
+ *
+ * DMA length is from 1 byte to 32MB (AST2600, AST10x0)
+ *   0: 1 byte
+ *   0x1FFFFFF: 32M bytes
  */
 #define DMA_DRAM_ADDR(asc, val)   ((val) & (asc)->dma_dram_mask)
 #define DMA_FLASH_ADDR(asc, val)  ((val) & (asc)->dma_flash_mask)
-#define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
+#define DMA_LENGTH(val)         ((val) & 0x01FFFFFF)
 
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
@@ -843,6 +847,13 @@ static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
     }
 }
 
+static uint32_t aspeed_smc_dma_len(AspeedSMCState *s)
+{
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+
+    return QEMU_ALIGN_UP(s->regs[R_DMA_LEN] + asc->dma_start_length, 4);
+}
+
 /*
  * Accumulate the result of the reads to provide a checksum that will
  * be used to validate the read timing settings.
@@ -850,6 +861,7 @@ static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
 static void aspeed_smc_dma_checksum(AspeedSMCState *s)
 {
     MemTxResult result;
+    uint32_t dma_len;
     uint32_t data;
 
     if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
@@ -861,7 +873,9 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
         aspeed_smc_dma_calibration(s);
     }
 
-    while (s->regs[R_DMA_LEN]) {
+    dma_len = aspeed_smc_dma_len(s);
+
+    while (dma_len) {
         data = address_space_ldl_le(&s->flash_as, s->regs[R_DMA_FLASH_ADDR],
                                     MEMTXATTRS_UNSPECIFIED, &result);
         if (result != MEMTX_OK) {
@@ -877,7 +891,8 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
          */
         s->regs[R_DMA_CHECKSUM] += data;
         s->regs[R_DMA_FLASH_ADDR] += 4;
-        s->regs[R_DMA_LEN] -= 4;
+        dma_len -= 4;
+        s->regs[R_DMA_LEN] = dma_len;
     }
 
     if (s->inject_failure && aspeed_smc_inject_read_failure(s)) {
@@ -889,14 +904,17 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
 static void aspeed_smc_dma_rw(AspeedSMCState *s)
 {
     MemTxResult result;
+    uint32_t dma_len;
     uint32_t data;
 
+    dma_len = aspeed_smc_dma_len(s);
+
     trace_aspeed_smc_dma_rw(s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE ?
                             "write" : "read",
                             s->regs[R_DMA_FLASH_ADDR],
                             s->regs[R_DMA_DRAM_ADDR],
-                            s->regs[R_DMA_LEN]);
-    while (s->regs[R_DMA_LEN]) {
+                            dma_len);
+    while (dma_len) {
         if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
             data = address_space_ldl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
                                         MEMTXATTRS_UNSPECIFIED, &result);
@@ -937,7 +955,8 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
          */
         s->regs[R_DMA_FLASH_ADDR] += 4;
         s->regs[R_DMA_DRAM_ADDR] += 4;
-        s->regs[R_DMA_LEN] -= 4;
+        dma_len -= 4;
+        s->regs[R_DMA_LEN] = dma_len;
         s->regs[R_DMA_CHECKSUM] += data;
     }
 }
@@ -1382,6 +1401,7 @@ static void aspeed_2400_fmc_class_init(ObjectClass *klass, void *data)
     asc->features          = ASPEED_SMC_FEATURE_DMA;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x1FFFFFFC;
+    asc->dma_start_length  = 4;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
@@ -1465,6 +1485,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     asc->features          = ASPEED_SMC_FEATURE_DMA;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->dma_start_length  = 4;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_smc_reg_to_segment;
@@ -1621,6 +1642,7 @@ static void aspeed_2600_fmc_class_init(ObjectClass *klass, void *data)
                              ASPEED_SMC_FEATURE_WDT_CONTROL;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->dma_start_length  = 1;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
@@ -1659,6 +1681,7 @@ static void aspeed_2600_spi1_class_init(ObjectClass *klass, void *data)
                              ASPEED_SMC_FEATURE_DMA_GRANT;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->dma_start_length  = 1;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
@@ -1698,6 +1721,7 @@ static void aspeed_2600_spi2_class_init(ObjectClass *klass, void *data)
                              ASPEED_SMC_FEATURE_DMA_GRANT;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x3FFFFFFC;
+    asc->dma_start_length  = 1;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
@@ -1779,6 +1803,7 @@ static void aspeed_1030_fmc_class_init(ObjectClass *klass, void *data)
     asc->features          = ASPEED_SMC_FEATURE_DMA;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x000BFFFC;
+    asc->dma_start_length  = 1;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_1030_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_1030_smc_reg_to_segment;
@@ -1816,6 +1841,7 @@ static void aspeed_1030_spi1_class_init(ObjectClass *klass, void *data)
     asc->features          = ASPEED_SMC_FEATURE_DMA;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x000BFFFC;
+    asc->dma_start_length  = 1;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
@@ -1852,6 +1878,7 @@ static void aspeed_1030_spi2_class_init(ObjectClass *klass, void *data)
     asc->features          = ASPEED_SMC_FEATURE_DMA;
     asc->dma_flash_mask    = 0x0FFFFFFC;
     asc->dma_dram_mask     = 0x000BFFFC;
+    asc->dma_start_length  = 1;
     asc->nregs             = ASPEED_SMC_R_MAX;
     asc->segment_to_reg    = aspeed_2600_smc_segment_to_reg;
     asc->reg_to_segment    = aspeed_2600_smc_reg_to_segment;
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 8791cc0ecb..d305ce2e2f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -107,6 +107,7 @@ struct AspeedSMCClass {
     uint32_t features;
     hwaddr dma_flash_mask;
     hwaddr dma_dram_mask;
+    uint32_t dma_start_length;
     uint32_t nregs;
     uint32_t (*segment_to_reg)(const AspeedSMCState *s,
                                const AspeedSegments *seg);
-- 
2.25.1

