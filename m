Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311478wme;
        Mon, 21 May 2018 07:04:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqjjzvAGUkfAduPFDFVfx3AmNeuivW/SOjLGLHcTAszswbgJiCnBb8JQVS4rsT71NnhpR6+
X-Received: by 2002:a19:15da:: with SMTP id 87-v6mr562112lfv.136.1526911461145;
        Mon, 21 May 2018 07:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911461; cv=none;
        d=google.com; s=arc-20160816;
        b=pbaMuA3GCuK+HIicpIkqXZCShLPMqw7JpXqYipr7TP7MSvH6o3wHf3w5WMHQ+8UOQI
         jtenPfxlb7OzyKyCfC0KmWlfqEFehpWHeQ3ThuEMmCg7lJH5E3v4qZjHQA91Jmhagr6W
         aaFW9uNzdOp3V6bSNm7r/kxPn2xZAwFrMrgAuPhhzD5ShiAmb/RQXuKdXD2wytty+s+c
         6GUBbNNckcGqWm3XJv16CTrykyV6LA51ftbuA39OOLlpaKbKrFuq0L/TjuoygUuzKqWd
         wFeK12HIhDL1JW2zDDjFjh+D2JhMV9KsQgw2azmKHhMVz7H0JSgR7AzdIleVKSXoaOLE
         xzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=pNtuZHve1EzCCeN5765DxbcftLLAT1y3fDp2xoS18tU=;
        b=ghwgYLAY02ikVo5N0zivk9G0BqfZTN6hYlelLMoeNbU8o+8ZaVB6HDJGv7zy7qc8My
         GygWH91tXs84OTBY5JI41rm/nv8fkYW6oEpfN6xsCLa8RUWbd0iPV+yl+rFc6hmcEElo
         J3+g9JymX4VYPYMIoHjrHyIsIp1nWv6wH5sHwnIHr4JLOtVFd13Coavvq+F01rKN4zID
         5N6RmShw7OflLTTdlsD3NWdwM9acqmnWgElGzxDGTe5U2Wnuy562G/QSAqfc7a4ZJXlc
         rxxXmTTS0tQt7ZrAmCzpR+/nkSWSjB7UnkLawgTMeqle6aQFUCa0XQU4Su6xynsPbhd/
         rGCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id b14-v6si5876984ljb.202.2018.05.21.07.04.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:21 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQA-0007mU-No; Mon, 21 May 2018 15:04:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 21/27] hw/misc/tz_mpc.c: Honour the BLK_LUT settings in translate
Date: Mon, 21 May 2018 15:03:56 +0100
Message-Id: <20180521140402.23318-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: Ppi3j9AJjurT

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
index 39a72563b7..439f6b9496 100644
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
index d4835c8970..be3ee1707b 100644
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
2.17.0
