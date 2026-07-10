Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D0FC44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 11:01:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi8x2-0006ab-IN; Fri, 10 Jul 2026 06:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wt-0006Sq-Dy
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wr-0001Nq-Qi
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493f0ae9572so2828045e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681152; x=1784285952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nAPCdwrWWBDYxeA6TQlHH2OHF4Kfqc3umJBBZYyOgHU=;
 b=nSa4UfoNF511HvnuoRJEZByq2KMP2fCP9MhbHursags4O3Wc8B8uNWFtCYjUEsK2nv
 8t7/snIdWyhmpjTstP8KCwXhXrPZ8/wT510LRGmvuUQPbFqGqX5sT8bx1XjTrelHUlxp
 daNnfKQP3bivQ3+LMQx/PAi9F85wirGZ7Ta/5mBhXjZpWMv0X5rMLTIOcgK6tU3Fm/G9
 U36mwLlK9f50Jom82fwDkLpjQwm1JUFO2OB5nQyv0WAK0cM8RufpAiu1KPlTYIcJo2l7
 iJ1Wj+fttkc+WsWjiLAJ+ZS6PrP8NvdkuHRZc+4CIIKgG1hZJzZvKfGs1a8rrrwNAm9V
 3hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681152; x=1784285952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nAPCdwrWWBDYxeA6TQlHH2OHF4Kfqc3umJBBZYyOgHU=;
 b=C2FfV4eRt5MD3DlwwKRwdePVttsiXeFPx0TJdsx50nvOO26d0GjeImvTn0+o+ju2/w
 W83Dq8eHGi268k1D6h18u5CrRidvZ/RLbi4yLR0g5Q6sJ/A9+u53+ngYkRnrMB/PynnF
 drCMwh//ONENcJkmkFGjFyGb+u93jCDdC1Lac3o7SLuhZB9M+t1tN3N221EP1KNgvCAs
 QQTKC4avPZQCPoMRdJNl1E5CXaCys+pyerj0umekOOwqmbKAVOW+PCI6yhkU8qmRtkX0
 vyBhTbZfjiLnjpHTN8sWwkKpR7RSz/TlSC/254uPeXaQWtOfoOnnpfww0T8Z4Ui9SMcH
 uaxA==
X-Gm-Message-State: AOJu0YxiQN6FZKE91OxbjZhrisvt3srmxaBLcH27ca6Z6khurStzAAth
 wYpphnhVy6qG0V+yvFd6/1yxAfKaVxEC+J7sRxuw52Sj2zSvrGAp3Aki+0CVnOYJWPddE3cjBZm
 A0XMzJPdeQQ==
X-Gm-Gg: AfdE7ckhOrnfX2B9CtWI3eoSzYlM0CE0XqkicIKOVdhoq0Qu6qyIgT+1h16PDDh767P
 f3Wa84Y3Nscx4D833hsbtyrjxSBikPltHiyrfjErhcDKxPRujTXcUKWN6lFKTDAKFSN9EU62jsv
 ZG9io1D+JAqn1IGAQ5DQ5Mz0Hh9JJmbsXxIPWPxQ4nwSpiJfgKgRPcJb3S3YH4VyRpyceDVaUNO
 NONEp7p3Zexfv3Z2Fsu/qj5te1OE7Pbm1oFCeuiSsHmbRnm5j81s4gW0e0LiGcuanwWjOU6lZup
 3rNHx4mu36pyFfUoCeCeHbvxaiTYhGws6mMeukJuVVxeLDrhaQcN++vL38gqXnmF2twCOnWaCjn
 d/CZvU42FM2xdDAc6CVFO7PWQgtVQlpJIFQ6Sr5Pocvy5TCHeQWIWmQ4ZsjTXKtLwVTbfCzuJy9
 3DMcjL+T5L8dgcJyhw5xFWWHV2XynQ6wJqU4iCyhOGBmjbHIWjKae25oooWA91TqBfSb2eX1LD5
 DaguzQyvcipNBkhwAOr0A==
X-Received: by 2002:a05:600c:630c:b0:492:53e8:3bc1 with SMTP id
 5b1f17b1804b1-493e6a4a615mr100164985e9.17.1783681152404; 
 Fri, 10 Jul 2026 03:59:12 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm51946175e9.1.2026.07.10.03.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 03:59:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 3/9] hw/dma/soc_dma: Remove union from memmap_entry_s struct
Date: Fri, 10 Jul 2026 11:59:01 +0100
Message-ID: <20260710105907.2570621-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710105907.2570621-1-peter.maydell@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

There's only one field in the union inside memmap_entry_s now that
we've removed the soc_dma_port_fifo handling.  Simplify by removing
the union.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/soc_dma.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index ff51338388..bbcd2bdcd5 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -39,12 +39,10 @@ struct dma_s {
     struct memmap_entry_s {
         enum soc_dma_port_type type;
         hwaddr addr;
-        union {
-           struct {
-               void *base;
-               size_t size;
-           } mem;
-        } u;
+        struct {
+            void *base;
+            size_t size;
+        } mem;
     } *memmap;
     int memmap_size;
 
@@ -99,7 +97,7 @@ static inline enum soc_dma_port_type soc_dma_ch_update_type(
 
     if (entry->type == soc_dma_port_mem) {
         if (entry->addr > ch->vaddr[port] ||
-                        entry->addr + entry->u.mem.size <= ch->vaddr[port])
+                        entry->addr + entry->mem.size <= ch->vaddr[port])
             return soc_dma_port_other;
 
         /* TODO: support constant memory address for source port as used for
@@ -107,7 +105,7 @@ static inline enum soc_dma_port_type soc_dma_ch_update_type(
         if (ch->type[port] != soc_dma_access_const)
             return soc_dma_port_other;
 
-        ch->paddr[port] = (uint8_t *) entry->u.mem.base +
+        ch->paddr[port] = (uint8_t *) entry->mem.base +
                 (ch->vaddr[port] - entry->addr);
         /* TODO: save bytes left to the end of the mapping somewhere so we
          * can check we're not reading beyond it.  */
@@ -212,12 +210,12 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, uint8_t *phys_base,
         if (entry->type == soc_dma_port_mem) {
             if ((entry->addr >= virt_base && entry->addr < virt_base + size) ||
                             (entry->addr <= virt_base &&
-                             entry->addr + entry->u.mem.size > virt_base)) {
+                             entry->addr + entry->mem.size > virt_base)) {
                 error_report("%s: RAM at %"PRIx64 "-%"PRIx64
                              " collides with RAM region at %"PRIx64
                              "-%"PRIx64, __func__,
                              virt_base, virt_base + size,
-                             entry->addr, entry->addr + entry->u.mem.size);
+                             entry->addr, entry->addr + entry->mem.size);
                 exit(-1);
             }
 
@@ -246,8 +244,8 @@ void soc_dma_port_add_mem(struct soc_dma_s *soc, uint8_t *phys_base,
 
     entry->addr          = virt_base;
     entry->type          = soc_dma_port_mem;
-    entry->u.mem.base    = phys_base;
-    entry->u.mem.size    = size;
+    entry->mem.base    = phys_base;
+    entry->mem.size    = size;
 }
 
 /* TODO: port removal for ports like PCMCIA memory */
-- 
2.43.0


