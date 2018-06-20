Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp761816wrq;
        Wed, 20 Jun 2018 06:20:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKuuBIB0OJQ/LtVq7KafEOf0GN6Wti4/eJH8FkB3Fs7JNnsuTvuOgx30uJiRFARUIuGfuw5
X-Received: by 2002:adf:ab96:: with SMTP id s22-v6mr18813382wrc.90.1529500838219;
        Wed, 20 Jun 2018 06:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500838; cv=none;
        d=google.com; s=arc-20160816;
        b=mreCxspQNkpNX8ANb2SPwQorOKZgKOFucuVj8yVhd8YuV7xJPwNBnAJW4AmlcJyiKC
         FNlDCYhPv7U8WkzhMci3G+3mMiOU4X8n6AkJ2CVdGVrcvYiZHJfCTqkA/vyOc6QazFre
         n6WXnblpMcOTdRoEMuYHFZM7ip9bibwkG58s/GzvtbXKfhZcKVYznMx2c9ER1z6OhbGr
         YV+BNHt3LNjscpMJ/QfPNP/8R0K/qI1LeHP3c2rywnc+gW6fzjNOD9g0AM2E91ulZG/5
         BRaDO7DQJkoEf7pQNQuTC/brgRl/0FQ527vQWakAkx5RZHjKTB2wf2jQKm43z+sxQ5ED
         9/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=mdFPRQCW4BCIlfNDT23ZYFxxl6l7liMYhPOLb4yRR9w=;
        b=gFUaWryPF7amLazru/mguno/LDOhVaj0Z5ExgL6Q+zA+OqfZvX1zMXJqz74eEpg0eI
         ihuy2lQB71j0a5PiwvWGaC8KbMUGzgzMPDaKcsy0ACvuiym1nv67zBCXB/qOhzG+xJap
         9BmMntQ6VNm0Wx/sxi/YaHQ3esOVvAjhBZmC6J0qu1Jam2FGHlXdaD9+iEU58/UN/ORD
         Q1rkWSnxnzLWYA18AFoYLGMDVewhvqzjvVPkZne/9p3qPncBY11v3nH48kDNAnY4TEcA
         yrLgAgZfUjDDQmGlaLefNPuwOrVQo2UO6exh881BY0TQ4MECV0Gwx335PD2ftJ1ulGjM
         HYNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id c49-v6si2816228wrc.208.2018.06.20.06.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 06:20:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVd2L-0001a4-NC; Wed, 20 Jun 2018 14:20:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 4/8] hw/misc/tz_mpc.c: Honour the BLK_LUT settings in translate
Date: Wed, 20 Jun 2018 14:20:28 +0100
Message-Id: <20180620132032.28865-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
X-TUID: QXOd29FTB83j

The final part of the Memory Protection Controller we need to
implement is actually using the BLK_LUT data programmed by the
guest to determine whether to block the transaction or not.

Since this means we now change transaction mappings when
the guest writes to BLK_LUT, we must also call the IOMMU
notifiers at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tz-mpc.c     | 53 ++++++++++++++++++++++++++++++++++++++++++--
 hw/misc/trace-events |  1 +
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index fded5922a21..8316079b4bf 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -72,6 +72,53 @@ static void tz_mpc_irq_update(TZMPC *s)
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
+        bool block_is_ns;
+
+        if (!((oldlut ^ newlut) & (1 << i))) {
+            continue;
+        }
+        /* This changes the mappings for both the S and the NS space,
+         * so we need to do four notifies: an UNMAP then a MAP for each.
+         */
+        block_is_ns = newlut & (1 << i);
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
+        if (block_is_ns) {
+            entry.target_as = &s->blocked_io_as;
+        } else {
+            entry.target_as = &s->downstream_as;
+        }
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
+        if (block_is_ns) {
+            entry.target_as = &s->downstream_as;
+        } else {
+            entry.target_as = &s->blocked_io_as;
+        }
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+    }
+}
+
 static void tz_mpc_autoinc_idx(TZMPC *s, unsigned access_size)
 {
     /* Auto-increment BLK_IDX if necessary */
@@ -237,6 +284,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
         s->blk_idx = value % s->blk_max;
         break;
     case A_BLK_LUT:
+        tz_mpc_iommu_notify(s, s->blk_idx, s->blk_lut[s->blk_idx], value);
         s->blk_lut[s->blk_idx] = value;
         tz_mpc_autoinc_idx(s, size);
         break;
@@ -383,9 +431,10 @@ static IOMMUTLBEntry tz_mpc_translate(IOMMUMemoryRegion *iommu,
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
