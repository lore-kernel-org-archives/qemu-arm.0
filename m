Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp306200lfy;
        Fri, 14 Aug 2020 03:15:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjj4TxlsKjPaUuCtXlbXbrNPXhVqr7DTBXb5IkkYuC/5kV5U2+L0K9PDygTxQuPl02sNAF
X-Received: by 2002:a25:8812:: with SMTP id c18mr2927979ybl.330.1597400109840;
        Fri, 14 Aug 2020 03:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597400109; cv=none;
        d=google.com; s=arc-20160816;
        b=d/9IG6eGlVFIrI4ozMTFdxnLwwJ+f6d6g0rTdUH8lyHYoFO4r4i17I2VvCs+ngA/9t
         3dT2jfOnFb+siTY0p1AGcnbMJiQiE+zIXJw5HVu5RyZPuK1++iHg1fVeYhSR/uz7fska
         7iCst0ArvHUMxnj3n/iF5jARXZXFyd6sz9yGyypBeXndCbTTgi3N0u2LeOhzo7CpbBBN
         WvD4vzF+v0LyqliouvlxbP0C5KFOWAmO2jQqCBoCEEeKpuDBIUTLAuK0RHRqTv8G7IGV
         fbmMAJHvVUboY5JGs/6/N/DqroEXrZaqLymJNMomBJKuXlpMo+L3oxaxTzYivQXWHCAb
         9/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+SM9WQG7FQprX3XJR8P9C1nTjo7SJFd726jcTzAOzTs=;
        b=ToA6fzPsA/vk1U8xDo+m69HSOyPJ1Tr5dKgSpsGr1TCRzVeZdJQmHLM2mZ4Bi60iUU
         qujgZQqKWFswoI41F/S6byRRUfqnifxAPTISvF3BR3nPPZWP+ybj52dhLBO8qNLF+UsE
         +H+HbVeAM0VCTjJHR/Og1pwSsuIbrPDnEWX+MvPynu2xEXgjtfF8zJXZm8qdS6HhpokW
         fVtUGxNv8lmatVtlM/3Q7iDb1jzoDO4YK7LiGF1RLQtH42S600CVtCQWuku2cMXdoA96
         ucskNvNZjN/maVN2pwbrpPzkoR9YF73WEgK9iX13SmUtf0EW6Uix1ttd55geGAzy1hwD
         vkEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lKenzRGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si8941536yba.492.2020.08.14.03.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 03:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lKenzRGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Wjt-0005Zu-6a
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 06:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6VwP-0005iv-Iv; Fri, 14 Aug 2020 05:24:01 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6VwN-0004Ld-TA; Fri, 14 Aug 2020 05:24:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id r4so7706052wrx.9;
 Fri, 14 Aug 2020 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+SM9WQG7FQprX3XJR8P9C1nTjo7SJFd726jcTzAOzTs=;
 b=lKenzRGtng+h3EN1lYVeitQ9FA8NUTByJSLwVswW6+8cq0RubPlHxnkcEAWWfvWXQd
 Z76MbaBJYKr+vPd5UtzUZT9UMxIf+82WGFHsezWx508b05JGNsVsH+G1a/435OyvGxtC
 DpjkT4kKE6n007wQv4WCiUuDm0nQb3GwEMcOsgdl6j+VaRJ9yz+v8KnzOOhL1ieDH0ZU
 EtCCGRoE68dX+EpA1CPrkMiQrBSfURrDLXXxAwjUg7W7By48l4COGQTvRgD/y/QHl9gs
 BQsPhOHTMnePVUqfPg0H16igr+gHLfW2I0wDKBWmx/yoIRAIixJHuFtDAq2XEdSEcduY
 3PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+SM9WQG7FQprX3XJR8P9C1nTjo7SJFd726jcTzAOzTs=;
 b=fd1cmLnsh9tdfSTdsP0XsXM0RgA8weqwY9WRozwUUcD8BeQYymqyrVZ2oshyQrM61V
 lmSwCF7/Wziuhn5+mkxKGTyfS+Ve0DfyymJVYdqxdfzBvTuiZ+Wmor5Dj8v1ZCN+1WHQ
 NMQE/CRFE4YLMgKQP/jJHv8H7oqgTz/vUfGwgKYa7dFkQwAvLc5NXgCzYSBZikS/yxit
 FHd/wGrR3b0TEoX94FWpy32OoGT5g3aiGvLbejnlIJVGwU55ZQyH62NPyeftj5yz3EjR
 9eiu/+VXqul8bBLR8uYJIPrSLwWfm3drTOZisCHf1udOolbb/2uFkUqY11Dt1uEAIgm0
 cgsQ==
X-Gm-Message-State: AOAM532a+gkTpcbLKcBuMx7ngBicwVWWzmzSOGDDg2HlRzbYXeR17N5t
 NGmodTRtIaQ3eODdN6mD/8mG1WsfEUA=
X-Received: by 2002:adf:f849:: with SMTP id d9mr1855286wrq.295.1597397037625; 
 Fri, 14 Aug 2020 02:23:57 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id b11sm12889395wrq.32.2020.08.14.02.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:23:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] hw/sd: Use sdbus_read_data() instead of sdbus_read_byte()
 when possible
Date: Fri, 14 Aug 2020 11:23:46 +0200
Message-Id: <20200814092346.21825-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200814092346.21825-1-f4bug@amsat.org>
References: <20200814092346.21825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xDbcDQrat0ga

Use the recently added sdbus_read_data() to read multiple
bytes at once, instead of looping calling sdbus_read_byte().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/allwinner-sdhost.c  | 10 +++-------
 hw/sd/milkymist-memcard.c |  7 ++-----
 hw/sd/sdhci.c             | 28 ++++++++--------------------
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index eea5659c5f..f9eb92c09e 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -337,9 +337,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
 
         /* Read from SD bus */
         } else {
-            for (uint32_t i = 0; i < buf_bytes; i++) {
-                buf[i] = sdbus_read_byte(&s->sdbus);
-            }
+            sdbus_read_data(&s->sdbus, buf, buf_bytes);
             cpu_physical_memory_write((desc->addr & DESC_SIZE_MASK) + num_done,
                                        buf, buf_bytes);
         }
@@ -518,10 +516,8 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
         break;
     case REG_SD_FIFO:      /* Read/Write FIFO */
         if (sdbus_data_ready(&s->sdbus)) {
-            res = sdbus_read_byte(&s->sdbus);
-            res |= sdbus_read_byte(&s->sdbus) << 8;
-            res |= sdbus_read_byte(&s->sdbus) << 16;
-            res |= sdbus_read_byte(&s->sdbus) << 24;
+            sdbus_read_data(&s->sdbus, &res, sizeof(uint32_t));
+            le32_to_cpus(&res);
             allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
             allwinner_sdhost_auto_stop(s);
             allwinner_sdhost_update_irq(s);
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 12e091a46e..be89a93876 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -151,11 +151,8 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
         if (!s->enabled) {
             r = 0xffffffff;
         } else {
-            r = 0;
-            r |= sdbus_read_byte(&s->sdbus) << 24;
-            r |= sdbus_read_byte(&s->sdbus) << 16;
-            r |= sdbus_read_byte(&s->sdbus) << 8;
-            r |= sdbus_read_byte(&s->sdbus);
+            sdbus_read_data(&s->sdbus, &r, sizeof(r));
+            be32_to_cpus(&r);
         }
         break;
     case R_CLK2XDIV:
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index ddf3691561..1785d7e1f7 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -399,8 +399,6 @@ static void sdhci_end_transfer(SDHCIState *s)
 /* Fill host controller's read buffer with BLKSIZE bytes of data from card */
 static void sdhci_read_block_from_card(SDHCIState *s)
 {
-    int index = 0;
-    uint8_t data;
     const uint16_t blk_size = s->blksize & BLOCK_SIZE_MASK;
 
     if ((s->trnmod & SDHC_TRNS_MULTI) &&
@@ -408,12 +406,9 @@ static void sdhci_read_block_from_card(SDHCIState *s)
         return;
     }
 
-    for (index = 0; index < blk_size; index++) {
-        data = sdbus_read_byte(&s->sdbus);
-        if (!FIELD_EX32(s->hostctl2, SDHC_HOSTCTL2, EXECUTE_TUNING)) {
-            /* Device is not in tuning */
-            s->fifo_buffer[index] = data;
-        }
+    if (!FIELD_EX32(s->hostctl2, SDHC_HOSTCTL2, EXECUTE_TUNING)) {
+        /* Device is not in tuning */
+        sdbus_read_data(&s->sdbus, s->fifo_buffer, blk_size);
     }
 
     if (FIELD_EX32(s->hostctl2, SDHC_HOSTCTL2, EXECUTE_TUNING)) {
@@ -574,7 +569,7 @@ static void sdhci_write_dataport(SDHCIState *s, uint32_t value, unsigned size)
 static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
 {
     bool page_aligned = false;
-    unsigned int n, begin;
+    unsigned int begin;
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
     uint32_t boundary_chk = 1 << (((s->blksize & ~BLOCK_SIZE_MASK) >> 12) + 12);
     uint32_t boundary_count = boundary_chk - (s->sdmasysad % boundary_chk);
@@ -596,9 +591,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
                 SDHC_DAT_LINE_ACTIVE;
         while (s->blkcnt) {
             if (s->data_count == 0) {
-                for (n = 0; n < block_size; n++) {
-                    s->fifo_buffer[n] = sdbus_read_byte(&s->sdbus);
-                }
+                sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
             }
             begin = s->data_count;
             if (((boundary_count + begin) < block_size) && page_aligned) {
@@ -662,13 +655,10 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
 /* single block SDMA transfer */
 static void sdhci_sdma_transfer_single_block(SDHCIState *s)
 {
-    int n;
     uint32_t datacnt = s->blksize & BLOCK_SIZE_MASK;
 
     if (s->trnmod & SDHC_TRNS_READ) {
-        for (n = 0; n < datacnt; n++) {
-            s->fifo_buffer[n] = sdbus_read_byte(&s->sdbus);
-        }
+        sdbus_read_data(&s->sdbus, s->fifo_buffer, datacnt);
         dma_memory_write(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt);
     } else {
         dma_memory_read(s->dma_as, s->sdmasysad, s->fifo_buffer, datacnt);
@@ -731,7 +721,7 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
 
 static void sdhci_do_adma(SDHCIState *s)
 {
-    unsigned int n, begin, length;
+    unsigned int begin, length;
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
     ADMADescr dscr = {};
     int i;
@@ -765,9 +755,7 @@ static void sdhci_do_adma(SDHCIState *s)
             if (s->trnmod & SDHC_TRNS_READ) {
                 while (length) {
                     if (s->data_count == 0) {
-                        for (n = 0; n < block_size; n++) {
-                            s->fifo_buffer[n] = sdbus_read_byte(&s->sdbus);
-                        }
+                        sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
                     }
                     begin = s->data_count;
                     if ((length + begin) < block_size) {
-- 
2.21.3

