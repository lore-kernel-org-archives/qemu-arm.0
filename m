Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85C0ECD99C
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:01:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo5VM-0006jO-6l; Thu, 05 Feb 2026 14:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VK-0006ig-FB
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vo5VI-00036n-PA
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 14:59:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso1081117f8f.2
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770321543; x=1770926343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qvuMaHRp0wLKOuMUSBaArgy1/39Q2HJlclOT444aA8=;
 b=jpHbZtTem+jq5SEi4byKQZXOv/h6irGjWKppFzxaB3papJIh241zBCFPuaJ7BKcIQ/
 mxjgtDudIy/I56i+/hFZn0NhMTGPcX8VVO8V7vhLH+Jekw1RUdy6jMQbr/m8HBo+ATkO
 DaprmqrpjgF6ZMNFXQiDgR7FHBQqURmrr+XtvIFZMowdzeoPickVKk3jBy0OhA0yXnfY
 MltOi/oAnltcEO+kSuDqd9ZSy5w5FDPpS8bc3NJfpFcbZWmSehRgSrqoRfdbO7LiVcSP
 iBxrN4ejOgn2DCMpXsrRgLXe2m0KRAmTznc8wANjF3hjWwV1hXBFGQlmGeNdQ8xjVhR/
 7ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770321543; x=1770926343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5qvuMaHRp0wLKOuMUSBaArgy1/39Q2HJlclOT444aA8=;
 b=M8uq4+jejELt7A6JDS3I7e2Z/DMhzX910pAtcZ/GbSpUCrSvkY+v8Fyykh44vuzwHH
 ogQhsJKawo23PDTX904JM1lg1wEnDrIgGfYCYhcesK7Og9ZbB6KGuPJXan5BEBFvTbx8
 Ak+K29b0/D2G5NSbOjVxqLjVTLDzjyb2dH8mwjHtc/5kYNe83Q5FZFht0OnsyUGJZ5K3
 4dyjtQBPggPd5y0GigtXR77xi6ZfSodEg/haH41mmV6o75qTOdOF5JPLaOb+46UtkyKt
 IjeZeFJd3nWThgUJcXj/Juyn5P/6JV8r+WIDEf2GDw3OBCRaItWdGfpWqHd1kjBkv4QT
 YnYQ==
X-Gm-Message-State: AOJu0YzRbD6Ky33yWdyDiGYqc5AqPVLyJ+m/3tGqtmDQQCKlYCJ/HRxY
 WQvbBDoGjQ0P9FRT77KvjNGi8wNKyyhF5+UpNu4vVSftC4s3iZ578TJ2nSXRWaAdkV8=
X-Gm-Gg: AZuq6aKqcdyvvYARkHSFZoZ83SPgGZNLhntYKs2InAHo6QDFTsyPl6luK0ZqKY4bYW3
 99TjzIFGV5kuEtWzTxRCnBb4OLlFMBl/DObm1NDNDryWwZUTp9HCfd6yflFU0vVp1VFSEHr0oBU
 ZICKGtWdgtCpwhergl4evMWdFK/2pJhQQTlQV7Bnrz71zfUkFRostUx9Ka1zVHnBqbpE97biHjm
 nR6Aav4QqVl3roqSeXr6P09piXUfHds/rD/avkMFXaSup+wPgSxnAQWi3IOzTDU+lPaswj7UnKE
 Ni9jBJIa0ParX0vNUS+z2/vgj+7smR4n72u6huQwOBnkGfAlBnQ/oy4bgBARzkVuYK+EtNhwJKn
 +qxBs2Hw07IZGrOwMES6ZbQDfgk3DDnAm12dYp0U4e74NwVVWJl+CFSyNzDZpHasoT5BFr2QmUW
 WqCeOceqH4hOFaibJOh1r4KtvvvV5jow==
X-Received: by 2002:a05:6000:2889:b0:436:1a24:df81 with SMTP id
 ffacd0b85a97d-4362904b702mr635949f8f.2.1770321543005; 
 Thu, 05 Feb 2026 11:59:03 -0800 (PST)
Received: from thinkpad-t470s.. ([93.140.16.93])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-436297450b4sm514079f8f.34.2026.02.05.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:59:01 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 francisco.iglesias@amd.com, Ruslan_Ruslichenko@epam.com,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 13/29] system/memory: Introduce unified MemoryTransaction and
 .access callback
Date: Thu,  5 Feb 2026 20:58:08 +0100
Message-ID: <20260205195824.2610192-14-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Introduce a unified 'MemoryTransaction' structure to encapsulate all
parameters of a memory access, including address, data, size, and
attributes.

The logic in memory_region_dispatch_read/write is updated to prioritize
the new 'access' callback when available.

This change simplifies the integration of transaction-based subsystems,
such as the Remote Port, by providing a standard container for memory
access metadata.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/system/memory.h | 23 ++++++++++++++
 system/memory.c         | 66 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index 0562af3136..e1fb82608d 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -84,6 +84,28 @@ extern unsigned int global_dirty_tracking;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
 
+typedef struct MemoryTransaction {
+    union {
+        /*
+         * Data is passed by values up to 64bit sizes. Beyond
+         * that, a pointer is passed in p8.
+         *
+         * Note that p8 has no alignment restrictions.
+         */
+        uint8_t *p8;
+        uint64_t u64;
+        uint32_t u32;
+        uint16_t u16;
+        uint8_t  u8;
+    } data;
+    bool rw;
+    hwaddr addr;
+    unsigned int size;
+    MemTxAttrs attr;
+    void *opaque;
+} MemoryTransaction;
+
+
 struct ReservedRegion {
     Range range;
     unsigned type;
@@ -298,6 +320,7 @@ static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
  * Memory region callbacks
  */
 struct MemoryRegionOps {
+    MemTxResult (*access)(MemoryTransaction *tr);
     /* Read from the memory region. @addr is relative to @mr; @size is
      * in bytes. */
     uint64_t (*read)(void *opaque,
diff --git a/system/memory.c b/system/memory.c
index 0b1462f028..4f62796cd3 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -431,6 +431,31 @@ static int get_cpu_index(void)
     return -1;
 }
 
+static MemTxResult memory_region_read_accessor_attr(MemoryRegion *mr,
+                                                    hwaddr addr,
+                                                    uint64_t *value,
+                                                    unsigned size,
+                                                    signed shift,
+                                                    uint64_t mask,
+                                                    MemTxAttrs attrs)
+{
+    MemoryTransaction tr = { { 0 } };
+    MemTxResult ret;
+
+    if (mr->flush_coalesced_mmio) {
+        qemu_flush_coalesced_mmio_buffer();
+    }
+
+    tr.opaque = mr->opaque;
+    tr.addr = addr;
+    tr.size = size;
+    tr.attr = attrs;
+    ret = mr->ops->access(&tr);
+    *value |= (tr.data.u64 & mask) << shift;
+
+    return ret;
+}
+
 static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
                                                 hwaddr addr,
                                                 uint64_t *value,
@@ -476,6 +501,31 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
     return r;
 }
 
+static MemTxResult memory_region_write_accessor_attr(MemoryRegion *mr,
+                                                     hwaddr addr,
+                                                     uint64_t *value,
+                                                     unsigned size,
+                                                     signed shift,
+                                                     uint64_t mask,
+                                                     MemTxAttrs attrs)
+{
+    MemoryTransaction tr = { { 0 } };
+
+    if (mr->flush_coalesced_mmio) {
+        qemu_flush_coalesced_mmio_buffer();
+    }
+
+    tr.opaque = mr->opaque;
+    tr.rw = true;
+    tr.addr = addr;
+    tr.size = size;
+    tr.attr = attrs;
+    tr.data.u64 = (*value >> shift) & mask;
+    trace_memory_region_ops_write(get_cpu_index(), mr, tr.addr, tr.data.u64,
+                                  tr.size, memory_region_name(mr));
+    return mr->ops->access(&tr);
+}
+
 static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
                                                 hwaddr addr,
                                                 uint64_t *value,
@@ -1603,7 +1653,13 @@ static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
 {
     *pval = 0;
 
-    if (mr->ops->read) {
+    if (mr->ops->access) {
+        return access_with_adjusted_size(addr, pval, size,
+                                         mr->ops->impl.min_access_size,
+                                         mr->ops->impl.max_access_size,
+                                         memory_region_read_accessor_attr,
+                                         mr, attrs);
+    } else if (mr->ops->read) {
         return access_with_adjusted_size(addr, pval, size,
                                          mr->ops->impl.min_access_size,
                                          mr->ops->impl.max_access_size,
@@ -1698,7 +1754,13 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
         return MEMTX_OK;
     }
 
-    if (mr->ops->write) {
+    if (mr->ops->access) {
+        return access_with_adjusted_size(addr, &data, size,
+                                         mr->ops->impl.min_access_size,
+                                         mr->ops->impl.max_access_size,
+                                         memory_region_write_accessor_attr,
+                                         mr, attrs);
+    } else if (mr->ops->write) {
         return access_with_adjusted_size(addr, &data, size,
                                          mr->ops->impl.min_access_size,
                                          mr->ops->impl.max_access_size,
-- 
2.43.0


