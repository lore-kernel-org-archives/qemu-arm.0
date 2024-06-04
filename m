Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718508ejs;
        Mon, 3 Jun 2024 22:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3QXBcu0NPgCOwSwEwl2KnFqMvdTXz3oRrSuaQs3ZwcHX9rnKNX91x+LogTOr4MJmLn2iyVUEf171zGX94ebJHtUG8x/pN
X-Google-Smtp-Source: AGHT+IGznOUNSYLIcF8msME27apRbLF2Qeg+EaRGqfblFhC6gTOKSll4On6Wdoq/1Qe8MMf+rFXu
X-Received: by 2002:a05:6214:2d43:b0:6af:c491:8cfe with SMTP id 6a1803df08f44-6afc4918f78mr43959986d6.45.1717480121449;
        Mon, 03 Jun 2024 22:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480121; cv=none;
        d=google.com; s=arc-20160816;
        b=PBTY48+S1pd4/3vW9tdK9v0YfyXrYAbcihFuEziCxOM5oFvBtfZFoMvOcmUBSL2zQL
         DYqtIvMoTeKM7p07SMbimsl3w17NSjzSOeTfSS1fw6EjY//hpP+TUhEaDpUYUcZpb+8C
         Stqggng68GJxENFFqgpss3eqbtP0XokzXYOYQhC2t4p/oEXVbNaC6Y8H/etZNvXkMM0/
         DTU7nbZZkuOo8daTzQa6VtVrZ5bT7pHYO9Se7NzX/vKi0REXiOzS7tklTOiq0Ceidd9U
         acjN9a8Y0q7ms43MPF2hKHwzdNy3KwzwFgTBIMnTq/VtPpD52ea0YQd6RDGtD3on1j/a
         n10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=8eLxxDQtOYMA+VStNUwM6/Mqf6poyUStUCWpK7gTkwY=;
        fh=GYhH0uUPR6/wogcCeDtqLdCDfiE/891GxRAjoHRzhEo=;
        b=NCDfVXKmejewdQHJIEoyEbXzvFQL/mKZv0gqwaM7NAR3q0gPFhA2EtOhZ6WIi+eSfe
         pPLANgZqY+vTK8WO9aiZglDNN3LAAB6+fYJjFcRvPubddIs3ovxq4fLytAn05cr+hY0G
         XzB7Eu/uaN6ge58LfdJKJ2Jz5zAXo5CFExwZS7ZJyNNyKypgSdl5CvvKy0hJvJcdUHlG
         BZ4AZ6ho2Uh+HERBfSsjnQI0uaxFgNGsSmCD50N9Ovr0pRWdWC8Sbnz+drnVYAP5OQkG
         jDPj9Kc/ia8HUPhuOTNSTRV/1BCbJTFwpUfGHMR9egef20htkEvbXsb5mV4zqtTWTz7K
         Mcjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42b8cfsi106348296d6.516.2024.06.03.22.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEMyx-0005mo-FI; Tue, 04 Jun 2024 01:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyv-0005id-KS; Tue, 04 Jun 2024 01:45:13 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyt-0008TH-S2; Tue, 04 Jun 2024 01:45:13 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:43 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:43 +0800
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
Subject: [PATCH v5 08/17] aspeed/smc: support 64 bits dma dram address
Date: Tue, 4 Jun 2024 13:44:29 +0800
Message-ID: <20240604054438.3424349-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: aAwiVxDM0Lkx

AST2700 support the maximum dram size is 8GiB
and has a "DMA DRAM Side Address High Part(0x7C)"
register to support 64 bits dma dram address.
Add helper routines functions to compute the dma dram
address, new features and update trace-event
to support 64 bits dram address.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/ssi/aspeed_smc.c | 51 ++++++++++++++++++++++++++++++++++++++-------
 hw/ssi/trace-events |  2 +-
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 0b8488a113..df0c63469c 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -132,6 +132,9 @@
 #define   FMC_WDT2_CTRL_BOOT_SOURCE      BIT(4) /* O: primary 1: alternate */
 #define   FMC_WDT2_CTRL_EN               BIT(0)
 
+/* DMA DRAM Side Address High Part (AST2700) */
+#define R_DMA_DRAM_ADDR_HIGH   (0x7c / 4)
+
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
 #define   DMA_CTRL_REQUEST      (1 << 31)
@@ -187,6 +190,7 @@
  *   0x1FFFFFF: 32M bytes
  */
 #define DMA_DRAM_ADDR(asc, val)   ((val) & (asc)->dma_dram_mask)
+#define DMA_DRAM_ADDR_HIGH(val)   ((val) & 0xf)
 #define DMA_FLASH_ADDR(asc, val)  ((val) & (asc)->dma_flash_mask)
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFF)
 
@@ -207,6 +211,7 @@ static const AspeedSegments aspeed_2500_spi2_segments[];
 #define ASPEED_SMC_FEATURE_DMA       0x1
 #define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
 #define ASPEED_SMC_FEATURE_WDT_CONTROL 0x4
+#define ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH 0x08
 
 static inline bool aspeed_smc_has_dma(const AspeedSMCClass *asc)
 {
@@ -218,6 +223,11 @@ static inline bool aspeed_smc_has_wdt_control(const AspeedSMCClass *asc)
     return !!(asc->features & ASPEED_SMC_FEATURE_WDT_CONTROL);
 }
 
+static inline bool aspeed_smc_has_dma64(const AspeedSMCClass *asc)
+{
+    return !!(asc->features & ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH);
+}
+
 #define aspeed_smc_error(fmt, ...)                                      \
     qemu_log_mask(LOG_GUEST_ERROR, "%s: " fmt "\n", __func__, ## __VA_ARGS__)
 
@@ -747,6 +757,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
         (aspeed_smc_has_dma(asc) && addr == R_DMA_CTRL) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_FLASH_ADDR) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_DRAM_ADDR) ||
+        (aspeed_smc_has_dma(asc) && aspeed_smc_has_dma64(asc) &&
+         addr == R_DMA_DRAM_ADDR_HIGH) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN) ||
         (aspeed_smc_has_dma(asc) && addr == R_DMA_CHECKSUM) ||
         (addr >= R_SEG_ADDR0 &&
@@ -847,6 +859,12 @@ static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
     }
 }
 
+static uint64_t aspeed_smc_dma_dram_addr(AspeedSMCState *s)
+{
+    return s->regs[R_DMA_DRAM_ADDR] |
+        ((uint64_t) s->regs[R_DMA_DRAM_ADDR_HIGH] << 32);
+}
+
 static uint32_t aspeed_smc_dma_len(AspeedSMCState *s)
 {
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
@@ -903,24 +921,34 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
 
 static void aspeed_smc_dma_rw(AspeedSMCState *s)
 {
+    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    uint64_t dma_dram_offset;
+    uint64_t dma_dram_addr;
     MemTxResult result;
     uint32_t dma_len;
     uint32_t data;
 
     dma_len = aspeed_smc_dma_len(s);
+    dma_dram_addr = aspeed_smc_dma_dram_addr(s);
+
+    if (aspeed_smc_has_dma64(asc)) {
+        dma_dram_offset = dma_dram_addr - s->dram_base;
+    } else {
+        dma_dram_offset = dma_dram_addr;
+    }
 
     trace_aspeed_smc_dma_rw(s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE ?
                             "write" : "read",
                             s->regs[R_DMA_FLASH_ADDR],
-                            s->regs[R_DMA_DRAM_ADDR],
+                            dma_dram_offset,
                             dma_len);
     while (dma_len) {
         if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
-            data = address_space_ldl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
+            data = address_space_ldl_le(&s->dram_as, dma_dram_offset,
                                         MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
-                aspeed_smc_error("DRAM read failed @%08x",
-                                 s->regs[R_DMA_DRAM_ADDR]);
+                aspeed_smc_error("DRAM read failed @%" PRIx64,
+                                 dma_dram_offset);
                 return;
             }
 
@@ -940,11 +968,11 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
                 return;
             }
 
-            address_space_stl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
+            address_space_stl_le(&s->dram_as, dma_dram_offset,
                                  data, MEMTXATTRS_UNSPECIFIED, &result);
             if (result != MEMTX_OK) {
-                aspeed_smc_error("DRAM write failed @%08x",
-                                 s->regs[R_DMA_DRAM_ADDR]);
+                aspeed_smc_error("DRAM write failed @%" PRIx64,
+                                 dma_dram_offset);
                 return;
             }
         }
@@ -953,8 +981,12 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
          * When the DMA is on-going, the DMA registers are updated
          * with the current working addresses and length.
          */
+        dma_dram_offset += 4;
+        dma_dram_addr += 4;
+
+        s->regs[R_DMA_DRAM_ADDR_HIGH] = dma_dram_addr >> 32;
+        s->regs[R_DMA_DRAM_ADDR] = dma_dram_addr & 0xffffffff;
         s->regs[R_DMA_FLASH_ADDR] += 4;
-        s->regs[R_DMA_DRAM_ADDR] += 4;
         dma_len -= 4;
         s->regs[R_DMA_LEN] = dma_len;
         s->regs[R_DMA_CHECKSUM] += data;
@@ -1107,6 +1139,9 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
     } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN &&
                aspeed_smc_dma_granted(s)) {
         s->regs[addr] = DMA_LENGTH(value);
+    } else if (aspeed_smc_has_dma(asc) && aspeed_smc_has_dma64(asc) &&
+               addr == R_DMA_DRAM_ADDR_HIGH) {
+        s->regs[addr] = DMA_DRAM_ADDR_HIGH(value);
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
                       __func__, addr);
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 2d5bd2b83d..7b5ad6a939 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -6,7 +6,7 @@ aspeed_smc_do_snoop(int cs, int index, int dummies, int data) "CS%d index:0x%x d
 aspeed_smc_flash_write(int cs, uint64_t addr,  uint32_t size, uint64_t data, int mode) "CS%d @0x%" PRIx64 " size %u: 0x%" PRIx64" mode:%d"
 aspeed_smc_read(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
 aspeed_smc_dma_checksum(uint32_t addr, uint32_t data) "0x%08x: 0x%08x"
-aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint32_t dram_addr, uint32_t size) "%s flash:@0x%08x dram:@0x%08x size:0x%08x"
+aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint64_t dram_addr, uint32_t size) "%s flash:@0x%08x dram:@0x%" PRIx64 " size:0x%08x"
 aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
 aspeed_smc_flash_select(int cs, const char *prefix) "CS%d %sselect"
 
-- 
2.25.1

