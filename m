Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75E5C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 11:01:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi8x1-0006ZC-43; Fri, 10 Jul 2026 06:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8ww-0006Sz-Mb
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:18 -0400
Received: from mail-wm2-x01.google.com ([2a00:1450:4864:31::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wu-0001P6-Pf
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:18 -0400
Received: by mail-wm2-x01.google.com with SMTP id
 5b1f17b1804b1-493b567a019so6189215e9.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681155; x=1784285955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TwtMnO8OPUvmvUO/Mqi1pAdDOfN8vKq344KVKqtA96Y=;
 b=uApEtj/al8Mp9tWlqegjtZ8pnI1DRkQtt0gZBhkD4ay3zLtVPUcEw4Ao5CEA4b5Xdf
 hatN25FSRz5tS2JyHQWn1vJV+Bb+MU4ur3ROV6ag3bQ6ftiRrEr0vhNIYc++SSXCiab0
 GdT/2mNsXsaVMNdl0IFVM+hIBih6RCNLg1QyBTRdAJSwKkeNUnFF9fqXxGGTx8H+CZxK
 QDS0p2gDSxWUtr3+77dHEkNOa/TC1Xdu+FvfqtRSWHqzG1PSJTIuGo/yHDAOFJwhRn/G
 dBgs7GH8Xk/boaOJ5TsrafVbbI0kfsBAM3hgw0J72+xAwUyWDwMM/rRQNfiuFuEG0cfb
 ITLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681155; x=1784285955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TwtMnO8OPUvmvUO/Mqi1pAdDOfN8vKq344KVKqtA96Y=;
 b=MGKoy6tpPUVZMBut4hFj5bhuNnOkfOD2m2G7CW1V08JetBy/MgZwTC+PMk9IrrCiFu
 EiK4ll6jXtQWpRo/QAXOJJOigrujc2zPoJsOYAc/4/z+i0ltp06Lt7s5hvL2Uw3L0wmL
 xjhxdpxXU3hHFTKG/u3uJrGhKMGWDNAgJWuKO/b7vNJfZq19ghIwuLGSILY2GHTV2h9J
 T77vP+wL/XaOGgThiQLeQLewpdh8N3OUdgArOl0Ur1u7TWXJdGVnQdd70qLCKMY41PcC
 XWFRAKLwQsZqw9i9ZRmG2s43PLKDl3QrYR/o0fH0p6SzcTC1/gs0JOiGMQIHzN1/S7We
 I3Fg==
X-Gm-Message-State: AOJu0YzEh8uY5EeUjVhJU6NPPLSNhQo9vnAmtWsBuLqyBZOGh22x2B/U
 OlpJEhD5naJ+zXazIXa9jcxmrx/yTLoVS1FZWj/W6JV0LRSOXtCZ4Gmbctlurth9dOyEnmRglXH
 /l7fM5v2bgGPm
X-Gm-Gg: AfdE7cmxte/1ycuC6BrVuimR48rUHGb0fvhTmsWAEQWcVD3VQtTV6sATsw0or4dcRiO
 //SZOFvtNkQzygWclflweT/XetlZKGtmFrqlhnxG2mR1ZhzOQJAo6GI9hPO5/SBawLjG0xzUO0N
 EaoH0A5lIV4wPy54Fzb8S8GieIb0e6q3Tt4XmhRDL6DA7JUiBjBzKMSAExjcCLyZVMD61L3fANP
 UicBTb5S5UwVY9Wfzxvb6aRZ5MTmq6QSUpXMVWpu/d6CmFINARAPMwc1gaqqa5k0x6Dr3L3Ojc8
 13WmuNcr52clyt840nW7JDo/2Ej5qaod2omh1r4kY9JvoBRuhFI7Zg1nUQROKgOmNsXEDeSaiCl
 y+go/sFgy/HGXvuDmpFI0dCYMYV20bfOiCaqU900L9LtGjJvt+n16Oe7PqOe3mtiWITw7BAK2KB
 7nXtR5bdKD5c8TTbaKq+IIF/t6mN6VXvbthu3jr0oiVoqaU+QoH5hxIj8+j1b7/vwetLYKxm80o
 i2EIzbho5pOOl8Y/eEalg==
X-Received: by 2002:a05:600c:4743:b0:493:c1a1:68f0 with SMTP id
 5b1f17b1804b1-493e68c80b5mr115463735e9.20.1783681155277; 
 Fri, 10 Jul 2026 03:59:15 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm51946175e9.1.2026.07.10.03.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 03:59:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 6/9] hw/dma/soc_dma: Use physical_memory_map() for mem2mem
 transfers
Date: Fri, 10 Jul 2026 11:59:04 +0100
Message-ID: <20260710105907.2570621-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710105907.2570621-1-peter.maydell@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::1;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm2-x01.google.com
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

The soc_dma code has a fastpath for when DMA transfers are from RAM
to RAM.  The current implementation of this has the caller of
soc_dma_port_add_mem() pass the underlying host address of the RAM
block that the DMA port is connected to (obtained via
memory_region_get_ram_ptr()).  Then the actual transfer function does
a simple memcpy(). This has several problems.

Most importantly, no bounds checking is done on the address and size
passed by the guest, so the memcpy source and destination might be
outside the backing host RAM entirely.  Secondly, because the DMA
access is done via this back door, there is no updating of the dirty
region when memory is written this way (there is a TODO comment
in omap_dma.c noting this).

Fix both of these by making the memory to memory transfer function
use physical_memory_map() to get the host addresses for the memory
copy.  That function will automatically give us the bounds check that
we want and return a short length if the transfer would run off the
end of the RAM MemoryRegion it starts in.  Since the OMAP DMA
documentation states that it's a guest error to misprogram the
addresses so that they fall outside the range that is valid for the
particular DMA port being addressed and that this can result in guest
memory corruption , we don't need to loop for short transfers, but
can simply log them and continue.

Note that we don't need to update addresses or bytecount here in the
transfer function, because when soc_dma_ch_update() selects
transfer_mem2mem it also sets ch->update to 1, which tells the
omap_dma_transfer_setup() code that it is responsible for updating
all the guest visible fields to match "transfer completed".

(We use physical_memory_map() here to match the use of
physical_memory_read() and physical_memory_write() in omap_dma.c;
making the DMA controller use an explicit AddressSpace would be
a separate cleanup task.)

Together with the preceding commits that fixed some integer overflow
problems, this fixes the "guest can provoke a bad memcpy() operation"
reported in issue #3204.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3204
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/omap_dma.c |  5 -----
 hw/dma/soc_dma.c  | 51 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 14b310bf40..1a3ae74726 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -559,11 +559,6 @@ static void omap_dma_transfer_setup(struct soc_dma_ch_s *dma)
         if (!ch->sync && frames) {
             ch->cpc = a->dest & 0xffff;
         }
-
-        /*
-         * TODO: if the destination port is IMIF or EMIFF, set the dirty
-         * bits on it.
-         */
     }
 
     omap_dma_interrupts_update(s);
diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 1b93aaf565..6e325122d9 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -20,13 +20,58 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
+#include "system/physmem.h"
 #include "hw/arm/soc_dma.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
-    memcpy(ch->paddr[0], ch->paddr[1], ch->bytes);
-    ch->paddr[0] += ch->bytes;
-    ch->paddr[1] += ch->bytes;
+    /*
+     * Memory-to-memory transfer: do the whole thing in one go.  The
+     * hardware spec says that it is invalid to program the OMAP DMA
+     * controller with addresses that don't match the port (i.e. to
+     * ask for a transfer to/from a memory port with a physaddr that
+     * isn't within that port range) and that if you do then the
+     * transfer continues and memory can be corrupted.  So we can map
+     * both source and destination, and treat short mappings and
+     * failed mappings as a guest error.
+     */
+    hwaddr srclen = ch->bytes;
+    hwaddr dstlen = ch->bytes;
+    hwaddr srcaddr = ch->vaddr[0];
+    hwaddr dstaddr = ch->vaddr[1];
+    void *srcmem, *dstmem;
+    hwaddr xferlen = 0;
+
+    srcmem = physical_memory_map(srcaddr, &srclen, false);
+    if (!srcmem) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "soc_dma mem2mem transfer: could not map source; "
+                      "guest error programming source port/address\n");
+        return;
+    }
+
+    dstmem = physical_memory_map(dstaddr, &dstlen, true);
+    if (!dstmem) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "soc_dma mem2mem transfer: could not map destination; "
+                      "guest error programming destination port/address\n");
+        goto unmap_src;
+    }
+
+    xferlen = MIN(srclen, dstlen);
+    if (xferlen < ch->bytes) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "soc_dma mem2mem transfer: could not transfer all data; "
+                      "guest error programming src or destination addresses\n");
+        /* Continue to transfer whatever did fit in the port window */
+    }
+
+    memmove(dstmem, srcmem, xferlen);
+
+    physical_memory_unmap(dstmem, dstlen, true, xferlen);
+unmap_src:
+    physical_memory_unmap(srcmem, srclen, false, xferlen);
 }
 
 struct dma_s {
-- 
2.43.0


