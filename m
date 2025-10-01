Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D18CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:03:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v414l-00040a-GC; Wed, 01 Oct 2025 13:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v414S-0003UL-6r
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413j-0001Bg-8O
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso565565e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341361; x=1759946161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mkNvNweP1pxd0bnKscXA4YxA7b00HLHFCf5l8AtEj4=;
 b=nzBr+v/KNiY7FEh05RZlSrWuk3iR3+cXStRFRO8RrTuQzfmmSx/03jqNtTOKuABAtr
 cahCivcccr4XfpSpLPpG0IztrlP0ZJZAH9QKRvgH3+qhlQMJZ675OdVnHQGUhs1c1FUv
 fkALax7MmpEvYwgQ4344EbnDz0JoeQgw9ZddOquYWwXLsW3O4hRa6/6D7ydfRX2DdmFF
 L8JsP31gER3VX+350bpv3/panJ/0mH6D6iADLkG+Otnuzk6KeOGdJIcop/wmGt2YBqNr
 52QMtIHXv9OcxMHpvRPJkogHmfrso5vd/MadgQKyNV7+hOAO+Nj2xJLhfUkHb8/z+5zx
 3g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341361; x=1759946161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mkNvNweP1pxd0bnKscXA4YxA7b00HLHFCf5l8AtEj4=;
 b=ZMKdj/lhmS9nD01JZwEe4wIfsWn32qA1bg5pn0rMiJcICdh/sF5hnvIMHDslzE701B
 znIV0bbI+DRJXSI+ijqnrPWw3Bc3LgjJZtr3KpbJlxBiC7DSsN8Gqj1pmMY2Qyh3/B3G
 p16L+2+6dQz+fe+QDpIWbSq91yF8I0Sd+IYq/gsWHOZfVUWUGQUYtKeK8oCH+ZTSeIZP
 FcGjSXQZtV0Y+NOlTndJ6VxK5XTWopnjZ76FgCFlFkFrG5Yz4qv9Y3M6Vd7XgxLNnOSj
 m+TOVvtUDWkkL3jS4sN0/D0rlvs1LijYNf/g8xow9Tz8t3zMpCWw5EbJza03Xf6bM06r
 QfCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURRh1/VHVFxkQqqpD7+WTqoWh6dgH7FIAT0fN29Ncxdlv7XLYTqdtpRRKHSjLOHtd16RKNVmTvFw==@nongnu.org
X-Gm-Message-State: AOJu0YyVGREf3f2KJQ2cSAA58joDXODrn3NWHtePblcnKwh1oapKbfEH
 aczhRBicUN85P8sTNVcswVECyY3RmtWdfgLZ395LrM9aMCY0//YK2Hqw9xgYALaqDcs=
X-Gm-Gg: ASbGncu/g/7S+1YRmUowMaWUyxrpRHEOjBTlwcaIwHQyeS134ihbhtRq016SvxAgHVq
 sr2Noy44KvobJpT7gyLqrVKmrfAmmXSdAdBeo7YrDU+YSfLIs8oz2HCGpXSzpd1U1shnYq59y3S
 CjEGxcWuGXVgoNE6eQm7HAsXNoBG08+79P4rGPKSjhc925AotMFfsUKfJAaQGMBzH+YOW1LG5wp
 obvLMt8toWgYbQ8n/EC1mGNdRlQqzhuxCoNBD78NwiMEgtTOciDBxdAxmIqei86UesU6oNACXxW
 5weCIgle0mtmzQoZKd7/2Cn3dNW2/8YYTKUn4LHlc3PDXzRmyPpVyLyZ9AXQ4kymvlVtUAQjvXC
 K6s5dtBKn+ssOuTIO/1/Sst2+tVsgCrMQo/Qvb8766EXV1qSMcBOCILh+J3fmA6BN1VlaH/+FJV
 Ty2AUtBN1HiC9lvD+AKtIrDHmOAg==
X-Google-Smtp-Source: AGHT+IHq9VNc9JggIDZKso6cjA0ZuxmHGfw+jg4YC7/WYfBxvvIDxxthg/1nTg2Nzka46BbMEMaitw==
X-Received: by 2002:a05:600c:6692:b0:46e:502c:8d6a with SMTP id
 5b1f17b1804b1-46e64641e65mr26102255e9.25.1759341361449; 
 Wed, 01 Oct 2025 10:56:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6917a867sm1316275e9.5.2025.10.01.10.55.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:56:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 13/18] system/physmem: Un-inline
 cpu_physical_memory_set_dirty_lebitmap()
Date: Wed,  1 Oct 2025 19:54:42 +0200
Message-ID: <20251001175448.18933-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Avoid maintaining large functions in header, rely on the
linker to optimize at linking time.

Remove the now unneeded "system/xen.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/ram_addr.h | 102 +------------------------------------
 system/physmem.c          | 103 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 101 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index fbf57a05b2a..49e9a9c66d8 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -19,7 +19,6 @@
 #ifndef SYSTEM_RAM_ADDR_H
 #define SYSTEM_RAM_ADDR_H
 
-#include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
@@ -161,108 +160,9 @@ void cpu_physical_memory_set_dirty_range(ram_addr_t start, ram_addr_t length,
  * cpu_physical_memory_sync_dirty_bitmap() returns newly dirtied pages that
  * weren't set in the global migration bitmap.
  */
-static inline
 uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                                                 ram_addr_t start,
-                                                ram_addr_t pages)
-{
-    unsigned long i, j;
-    unsigned long page_number, c, nbits;
-    hwaddr addr;
-    ram_addr_t ram_addr;
-    uint64_t num_dirty = 0;
-    unsigned long len = (pages + HOST_LONG_BITS - 1) / HOST_LONG_BITS;
-    unsigned long hpratio = qemu_real_host_page_size() / TARGET_PAGE_SIZE;
-    unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
-
-    /* start address is aligned at the start of a word? */
-    if ((((page * BITS_PER_LONG) << TARGET_PAGE_BITS) == start) &&
-        (hpratio == 1)) {
-        unsigned long **blocks[DIRTY_MEMORY_NUM];
-        unsigned long idx;
-        unsigned long offset;
-        long k;
-        long nr = BITS_TO_LONGS(pages);
-
-        idx = (start >> TARGET_PAGE_BITS) / DIRTY_MEMORY_BLOCK_SIZE;
-        offset = BIT_WORD((start >> TARGET_PAGE_BITS) %
-                          DIRTY_MEMORY_BLOCK_SIZE);
-
-        WITH_RCU_READ_LOCK_GUARD() {
-            for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
-                blocks[i] =
-                    qatomic_rcu_read(&ram_list.dirty_memory[i])->blocks;
-            }
-
-            for (k = 0; k < nr; k++) {
-                if (bitmap[k]) {
-                    unsigned long temp = leul_to_cpu(bitmap[k]);
-
-                    nbits = ctpopl(temp);
-                    qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
-
-                    if (global_dirty_tracking) {
-                        qatomic_or(
-                                &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
-                                temp);
-                        if (unlikely(
-                            global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
-                            total_dirty_pages += nbits;
-                        }
-                    }
-
-                    num_dirty += nbits;
-
-                    if (tcg_enabled()) {
-                        qatomic_or(&blocks[DIRTY_MEMORY_CODE][idx][offset],
-                                   temp);
-                    }
-                }
-
-                if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
-                    offset = 0;
-                    idx++;
-                }
-            }
-        }
-
-        if (xen_enabled()) {
-            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
-        }
-    } else {
-        uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
-
-        if (!global_dirty_tracking) {
-            clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
-        }
-
-        /*
-         * bitmap-traveling is faster than memory-traveling (for addr...)
-         * especially when most of the memory is not dirty.
-         */
-        for (i = 0; i < len; i++) {
-            if (bitmap[i] != 0) {
-                c = leul_to_cpu(bitmap[i]);
-                nbits = ctpopl(c);
-                if (unlikely(global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
-                    total_dirty_pages += nbits;
-                }
-                num_dirty += nbits;
-                do {
-                    j = ctzl(c);
-                    c &= ~(1ul << j);
-                    page_number = (i * HOST_LONG_BITS + j) * hpratio;
-                    addr = page_number * TARGET_PAGE_SIZE;
-                    ram_addr = start + addr;
-                    cpu_physical_memory_set_dirty_range(ram_addr,
-                                       TARGET_PAGE_SIZE * hpratio, clients);
-                } while (c != 0);
-            }
-        }
-    }
-
-    return num_dirty;
-}
+                                                ram_addr_t pages);
 
 static inline void cpu_physical_memory_dirty_bits_cleared(ram_addr_t start,
                                                           ram_addr_t length)
diff --git a/system/physmem.c b/system/physmem.c
index 8e6c6dddc3c..e01b27ac252 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1207,6 +1207,109 @@ bool cpu_physical_memory_snapshot_get_dirty(DirtyBitmapSnapshot *snap,
     return false;
 }
 
+uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
+                                                ram_addr_t start,
+                                                ram_addr_t pages)
+{
+    unsigned long i, j;
+    unsigned long page_number, c, nbits;
+    hwaddr addr;
+    ram_addr_t ram_addr;
+    uint64_t num_dirty = 0;
+    unsigned long len = (pages + HOST_LONG_BITS - 1) / HOST_LONG_BITS;
+    unsigned long hpratio = qemu_real_host_page_size() / TARGET_PAGE_SIZE;
+    unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
+
+    /* start address is aligned at the start of a word? */
+    if ((((page * BITS_PER_LONG) << TARGET_PAGE_BITS) == start) &&
+        (hpratio == 1)) {
+        unsigned long **blocks[DIRTY_MEMORY_NUM];
+        unsigned long idx;
+        unsigned long offset;
+        long k;
+        long nr = BITS_TO_LONGS(pages);
+
+        idx = (start >> TARGET_PAGE_BITS) / DIRTY_MEMORY_BLOCK_SIZE;
+        offset = BIT_WORD((start >> TARGET_PAGE_BITS) %
+                          DIRTY_MEMORY_BLOCK_SIZE);
+
+        WITH_RCU_READ_LOCK_GUARD() {
+            for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
+                blocks[i] =
+                    qatomic_rcu_read(&ram_list.dirty_memory[i])->blocks;
+            }
+
+            for (k = 0; k < nr; k++) {
+                if (bitmap[k]) {
+                    unsigned long temp = leul_to_cpu(bitmap[k]);
+
+                    nbits = ctpopl(temp);
+                    qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
+
+                    if (global_dirty_tracking) {
+                        qatomic_or(
+                                &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
+                                temp);
+                        if (unlikely(
+                            global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                            total_dirty_pages += nbits;
+                        }
+                    }
+
+                    num_dirty += nbits;
+
+                    if (tcg_enabled()) {
+                        qatomic_or(&blocks[DIRTY_MEMORY_CODE][idx][offset],
+                                   temp);
+                    }
+                }
+
+                if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
+                    offset = 0;
+                    idx++;
+                }
+            }
+        }
+
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
+    } else {
+        uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL
+                                        : DIRTY_CLIENTS_NOCODE;
+
+        if (!global_dirty_tracking) {
+            clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
+        }
+
+        /*
+         * bitmap-traveling is faster than memory-traveling (for addr...)
+         * especially when most of the memory is not dirty.
+         */
+        for (i = 0; i < len; i++) {
+            if (bitmap[i] != 0) {
+                c = leul_to_cpu(bitmap[i]);
+                nbits = ctpopl(c);
+                if (unlikely(global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                    total_dirty_pages += nbits;
+                }
+                num_dirty += nbits;
+                do {
+                    j = ctzl(c);
+                    c &= ~(1ul << j);
+                    page_number = (i * HOST_LONG_BITS + j) * hpratio;
+                    addr = page_number * TARGET_PAGE_SIZE;
+                    ram_addr = start + addr;
+                    cpu_physical_memory_set_dirty_range(ram_addr,
+                                       TARGET_PAGE_SIZE * hpratio, clients);
+                } while (c != 0);
+            }
+        }
+    }
+
+    return num_dirty;
+}
+
 static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
                             uint16_t section);
 static subpage_t *subpage_init(FlatView *fv, hwaddr base);
-- 
2.51.0


