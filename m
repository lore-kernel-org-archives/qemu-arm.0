Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743563wrq;
        Mon, 4 Jun 2018 08:29:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJm6TnVOovX8g9M4dD496hIiVPwjslv4mKAmkTLM2Z7guJIGz/XBCtM7EHYZxzJeBxnhpqp
X-Received: by 2002:a5d:45cb:: with SMTP id b11-v6mr10245610wrs.106.1528126189312;
        Mon, 04 Jun 2018 08:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126189; cv=none;
        d=google.com; s=arc-20160816;
        b=gXo+4rEWUfdP+QhNTXSwLUz1xSWupG82nndTCudDLfN5cls+33hm2R6D0NcQa1vnPO
         q1Q/oEcttJKMCPGkQNvuAVsO9D6guaMsbxg7GvYA2AbVCHrkfyEr4t5U15sBUIarWd4h
         R4pbS6cq7iS+t/KoCCellHf2xTLJcHRWxJh9qmdtvsJwz6ZoQSiWTQPKRkdGsK8QuzMh
         1yxPAPfMFNfU00Ok2vp3Ju/fQdRqpsy4bCERTmC6TfAfaQkzP/Ol5zavOWktnSf0mhCo
         QD2FnLYWRxFhOWkf+7b7ADzlp9U3bpwL6/hf8FyA/VV1JiofyXfiw+72glBf4tcJEAWU
         rCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=hNvrcm+vVuj0vQairARxE8JVFvRa7XBKTjyniIGMGvs=;
        b=DJPEEEAACcRIOFJY0CaZuFo42oVlblMOpttYFAn3jwXLsmHq0NGeb6I2pogwzeCxuw
         WgB7ja9Lwctdt095qkE1dW4x0Qy2RLksKahUC1sbBTle4FAeyjSqBaMeI9wZD3xIV1ep
         zoUt4u+bAm9i+Z5+FZtICQFa//Svs52sQ7k6fuODH7bhhHfAc7n/hcgIPUYOCmCCd+sF
         3+4gAwvk93X2Kk3Q+dfaQD4Fha44BviavRuSWurZ7tlcyWg51camEvFc+HycPR6kdyBf
         Mlpy0vIfreuTECo3v6Pg7k5HV8wyRB8YczxGMVlVGV2hqCRgXIA1xfamMIDs63GRtlGb
         x1YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id h2-v6si311141wmg.141.2018.06.04.08.29.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQa-00073u-Pq; Mon, 04 Jun 2018 16:29:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 08/13] hw/misc/tz_mpc.c: Honour the BLK_LUT settings in translate
Date: Mon,  4 Jun 2018 16:29:36 +0100
Message-Id: <20180604152941.20374-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
X-TUID: UwoZpkUkcqbv

The final part of the Memory Protection Controller we need to
implement is actually using the BLK_LUT data programmed by the
guest to determine whether to block the transaction or not.

Since this means we now change transaction mappings when
the guest writes to BLK_LUT, we must also call the IOMMU
notifiers at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tz-mpc.c     | 50 ++++++++++++++++++++++++++++++++++++++++++--
 hw/misc/trace-events |  1 +
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 704bb3fb44d..7a6117c90b3 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -72,6 +72,50 @@ static void tz_mpc_irq_update(TZMPC *s)
     qemu_set_irq(s->irq, s->int_stat && s->int_en);
 }
 
+static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lutidx,
+                                uint32_t oldlut, uint32_t newlut)
+{
+    /* Called when the LUT word at lutidx has changed from oldlut to newlut;
+     * must call the IOMMU notifiers for the changed blocks.
+     */
+    IOMMUTLBEntry entry = {
+        .addr_mask = s->blocksize - 1,
+    };
+    hwaddr addr = lutidx * s->blocksize * 32;
+    int i;
+
+    for (i = 0; i < 32; i++, addr += s->blocksize) {
+        if (!((oldlut ^ newlut) & (1 << i))) {
+            continue;
+        }
+        /* This changes the mappings for both the S and the NS space,
+         * so we need to do four notifies: an UNMAP then a MAP for each.
+         */
+
+        trace_tz_mpc_iommu_notify(addr);
+        entry.iova = addr;
+        entry.translated_addr = addr;
+
+        entry.perm = IOMMU_NONE;
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+
+        entry.perm = IOMMU_RW;
+        if (newlut & (1 << i)) {
+            entry.target_as = &s->blocked_io_as;
+        } else {
+            entry.target_as = &s->downstream_as;
+        }
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
+        if (newlut & (1 << i)) {
+            entry.target_as = &s->downstream_as;
+        } else {
+            entry.target_as = &s->blocked_io_as;
+        }
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+    }
+}
+
 static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
                                    uint64_t *pdata,
                                    unsigned size, MemTxAttrs attrs)
@@ -213,6 +257,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
         s->blk_idx = value % s->blk_max;
         break;
     case A_BLK_LUT:
+        tz_mpc_iommu_notify(s, s->blk_idx, s->blk_lut[s->blk_idx], value);
         s->blk_lut[s->blk_idx] = value;
         if (size == 4) {
             s->blk_idx++;
@@ -362,9 +407,10 @@ static IOMMUTLBEntry tz_mpc_translate(IOMMUMemoryRegion *iommu,
     /* Look at the per-block configuration for this address, and
      * return a TLB entry directing the transaction at either
      * downstream_as or blocked_io_as, as appropriate.
-     * For the moment, always permit accesses.
+     * If the LUT cfg_ns bit is 1, only non-secure transactions
+     * may pass. If the bit is 0, only secure transactions may pass.
      */
-    ok = true;
+    ok = tz_mpc_cfg_ns(s, addr) == (iommu_idx == IOMMU_IDX_NS);
 
     trace_tz_mpc_translate(addr, flags,
                            iommu_idx == IOMMU_IDX_S ? "S" : "NS",
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 72bf9d57000..c956e1419b7 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -90,6 +90,7 @@ tz_mpc_reg_write(uint32_t offset, uint64_t data, unsigned size) "TZ MPC regs wri
 tz_mpc_mem_blocked_read(uint64_t addr, unsigned size, bool secure) "TZ MPC blocked read: offset 0x%" PRIx64 " size %u secure %d"
 tz_mpc_mem_blocked_write(uint64_t addr, uint64_t data, unsigned size, bool secure) "TZ MPC blocked write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 tz_mpc_translate(uint64_t addr, int flags, const char *idx, const char *res) "TZ MPC translate: addr 0x%" PRIx64 " flags 0x%x iommu_idx %s: %s"
+tz_mpc_iommu_notify(uint64_t addr) "TZ MPC iommu: notifying UNMAP/MAP for 0x%" PRIx64
 
 # hw/misc/tz-ppc.c
 tz_ppc_reset(void) "TZ PPC: reset"
-- 
2.17.1
