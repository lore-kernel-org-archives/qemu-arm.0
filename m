Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp205676njc;
        Thu, 14 Nov 2024 01:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5wqZ4rTXFrwDYg9rmkL+uoBgH4ErE3CzKDV8Ff2sWGE53zOcXfJlizwTwZmUA+tz/N594EdrwfI8TeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEd7L9303gvFBA7V7+vgq27deegbQ+NNtg9OgHe5bVczounwWsUZhg87RSypXkHQ0tqV60V
X-Received: by 2002:a05:622a:540f:b0:462:ac16:e72f with SMTP id d75a77b69052e-4634b49845dmr73442871cf.8.1731577787814;
        Thu, 14 Nov 2024 01:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731577787; cv=none;
        d=google.com; s=arc-20240605;
        b=N9LWTipsaGdL9WL4EoLev4GE3h0kJNZbx0etAbjtZ/tC24Qhtwlj67ib14VtLroRdw
         Q7qlJMHvNl/1wycecL+n0rvxM303HBJEv4KBCFQpuwNwCcs1SGOtsPcHNcOw2AOe/u0d
         Wf/2YZwANv3+OCjRZeA+n+1OjC3nV/v79D8nuVZn0PTHBUBkk05Tu0byG77xKDC/xvev
         LiO2z3RV59RFh2Nv/P0e41R6xu3f/jydEFs55sXw3beNtp4zgVpJs91WxUUAMq8Q7il4
         6IB1TYoee/vqaoSf5282R7RaWCjfh/eK09B+vUL4NgqQC8GhXJGM5k3kY5D2sjCjgtvM
         rm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JRUK6PXq8/4HriI+2EFscKbQJOX9iss9CdtmoA83dH4=;
        fh=7EWEpVkwAKt238OnwFP+5VqXSxu55vPOeusd31PKmFE=;
        b=I49bfSRuFPJqBUUJYNHEi5WQ36e3Ea0uX65b1dve1oq16tcrxBexnNzX9OV7v1ADu5
         ovQiZgsD9o/e46jGED33QHtggkdGbRfEy7yK9Mu+ZFaf1WsvPFouE8n2E0O1MZVJfEzj
         Oh4xH4C7Z2yAKdovZ2ppcdFOZm/0cJHfwZd8Z4nv4/6XDz1owOtP0pBWITNk8vnMQkFm
         d9Rt5qPCk9YI7Lk6SDTGDq1rCz/7SJfkAIuHZUU0pZXHOysUUgdJe+Glnka7OA5/AvqG
         RFSu8eLl0H3MX22S+QT/AyvLMKeesNYsdoua44q5yjTzt0C2om3GGSM7G9yiqutawrXX
         7RqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635ab3b882si7240911cf.566.2024.11.14.01.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 01:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBWTL-0002Py-0K; Thu, 14 Nov 2024 04:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWTI-0002Ph-M3; Thu, 14 Nov 2024 04:49:04 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWT6-0000F8-SN; Thu, 14 Nov 2024 04:48:54 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 14 Nov
 2024 17:48:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 14 Nov 2024 17:48:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 1/3] hw/sd/sdhci: Fix coding style
Date: Thu, 14 Nov 2024 17:48:37 +0800
Message-ID: <20241114094839.4128404-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: IzWlNCAay8XT

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sdhci.c | 64 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index dbe5c2340c..37875c02c3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -233,7 +233,7 @@ static void sdhci_raise_insertion_irq(void *opaque)
 
     if (s->norintsts & SDHC_NIS_REMOVE) {
         timer_mod(s->insert_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + SDHC_INSERTION_DELAY);
+                qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + SDHC_INSERTION_DELAY);
     } else {
         s->prnsts = 0x1ff0000;
         if (s->norintstsen & SDHC_NISEN_INSERT) {
@@ -251,7 +251,7 @@ static void sdhci_set_inserted(DeviceState *dev, bool level)
     if ((s->norintsts & SDHC_NIS_REMOVE) && level) {
         /* Give target some time to notice card ejection */
         timer_mod(s->insert_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + SDHC_INSERTION_DELAY);
+                qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + SDHC_INSERTION_DELAY);
     } else {
         if (level) {
             s->prnsts = 0x1ff0000;
@@ -289,9 +289,11 @@ static void sdhci_reset(SDHCIState *s)
     timer_del(s->insert_timer);
     timer_del(s->transfer_timer);
 
-    /* Set all registers to 0. Capabilities/Version registers are not cleared
+    /*
+     * Set all registers to 0. Capabilities/Version registers are not cleared
      * and assumed to always preserve their value, given to them during
-     * initialization */
+     * initialization
+     */
     memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
 
     /* Reset other state based on current card insertion/readonly status */
@@ -305,7 +307,8 @@ static void sdhci_reset(SDHCIState *s)
 
 static void sdhci_poweron_reset(DeviceState *dev)
 {
-    /* QOM (ie power-on) reset. This is identical to reset
+    /*
+     * QOM (ie power-on) reset. This is identical to reset
      * commanded via device register apart from handling of the
      * 'pending insert on powerup' quirk.
      */
@@ -445,8 +448,10 @@ static void sdhci_read_block_from_card(SDHCIState *s)
         s->prnsts &= ~SDHC_DAT_LINE_ACTIVE;
     }
 
-    /* If stop at block gap request was set and it's not the last block of
-     * data - generate Block Event interrupt */
+    /*
+     * If stop at block gap request was set and it's not the last block of
+     * data - generate Block Event interrupt
+     */
     if (s->stopped_state == sdhc_gap_read && (s->trnmod & SDHC_TRNS_MULTI) &&
             s->blkcnt != 1)    {
         s->prnsts &= ~SDHC_DAT_LINE_ACTIVE;
@@ -548,8 +553,10 @@ static void sdhci_write_block_to_card(SDHCIState *s)
     sdhci_update_irq(s);
 }
 
-/* Write @size bytes of @value data to host controller @s Buffer Data Port
- * register */
+/*
+ * Write @size bytes of @value data to host controller @s Buffer Data Port
+ * register
+ */
 static void sdhci_write_dataport(SDHCIState *s, uint32_t value, unsigned size)
 {
     unsigned i;
@@ -594,9 +601,11 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
         return;
     }
 
-    /* XXX: Some sd/mmc drivers (for example, u-boot-slp) do not account for
+    /*
+     * XXX: Some sd/mmc drivers (for example, u-boot-slp) do not account for
      * possible stop at page boundary if initial address is not page aligned,
-     * allow them to work properly */
+     * allow them to work properly
+     */
     if ((s->sdmasysad % boundary_chk) == 0) {
         page_aligned = true;
     }
@@ -702,7 +711,8 @@ static void get_adma_description(SDHCIState *s, ADMADescr *dscr)
         dma_memory_read(s->dma_as, entry_addr, &adma2, sizeof(adma2),
                         MEMTXATTRS_UNSPECIFIED);
         adma2 = le64_to_cpu(adma2);
-        /* The spec does not specify endianness of descriptor table.
+        /*
+         * The spec does not specify endianness of descriptor table.
          * We currently assume that it is LE.
          */
         dscr->addr = (hwaddr)extract64(adma2, 32, 32) & ~0x3ull;
@@ -977,8 +987,10 @@ static bool sdhci_can_issue_command(SDHCIState *s)
     return true;
 }
 
-/* The Buffer Data Port register must be accessed in sequential and
- * continuous manner */
+/*
+ * The Buffer Data Port register must be accessed in sequential and
+ * continuous manner
+ */
 static inline bool
 sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
 {
@@ -1206,8 +1218,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         MASKED_WRITE(s->argument, mask, value);
         break;
     case SDHC_TRNMOD:
-        /* DMA can be enabled only if it is supported as indicated by
-         * capabilities register */
+        /*
+         * DMA can be enabled only if it is supported as indicated by
+         * capabilities register
+         */
         if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
             value &= ~SDHC_TRNS_DMA;
         }
@@ -1279,8 +1293,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         } else {
             s->norintsts &= ~SDHC_NIS_ERR;
         }
-        /* Quirk for Raspberry Pi: pending card insert interrupt
-         * appears when first enabled after power on */
+        /*
+         * Quirk for Raspberry Pi: pending card insert interrupt
+         * appears when first enabled after power on
+         */
         if ((s->norintstsen & SDHC_NISEN_INSERT) && s->pending_insert_state) {
             assert(s->pending_insert_quirk);
             s->norintsts |= SDHC_NIS_INSERT;
@@ -1396,8 +1412,10 @@ void sdhci_initfn(SDHCIState *s)
 {
     qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
 
-    s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
-    s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
+    s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                   sdhci_raise_insertion_irq, s);
+    s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                     sdhci_data_transfer, s);
 
     s->io_ops = &sdhci_mmio_le_ops;
 }
@@ -1445,11 +1463,13 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
 
 void sdhci_common_unrealize(SDHCIState *s)
 {
-    /* This function is expected to be called only once for each class:
+    /*
+     * This function is expected to be called only once for each class:
      * - SysBus:    via DeviceClass->unrealize(),
      * - PCI:       via PCIDeviceClass->exit().
      * However to avoid double-free and/or use-after-free we still nullify
-     * this variable (better safe than sorry!). */
+     * this variable (better safe than sorry!).
+     */
     g_free(s->fifo_buffer);
     s->fifo_buffer = NULL;
 }
-- 
2.34.1

