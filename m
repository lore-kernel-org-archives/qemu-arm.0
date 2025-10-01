Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE1CCA474
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:28:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s8w-0003DY-7T; Wed, 01 Oct 2025 04:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s8g-0002e4-II
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7i-0006an-IX
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e5b7dfeb0so8567085e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759307014; x=1759911814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZaIr6FH1wkvEsTTc63UU90krHzSjNDiVQPaADhPhLlM=;
 b=Gj/w1VeTFXCEovv6PsIcUu3huC15U0kAbN8V10jLnWYIdPKM0W2Z6mZaKkFOlEypA4
 k4EDoflPLzFlu8KcPx2LHJYz1GXw31sW8DmlzxIMiIy576e54zgmDIkgh+PbFOwBqohb
 omwz4YfxYQ000awQTRvMzu1v7xvK0xSnBxMEU6X3meRdcyiqWdKD8WgFTnVVr7dy27jr
 S3CUAhI4h0EeUU+6biGyAPa6QD2gB+9UwETlaf0RV5U49gKph39vhPuJTKb7RE97CVhA
 ymqDAgDHkRLUcHmLJ34irv+CpRIiDO8CJZ8v5+y7lJ+zfm6eMjW8BYuKIQf5JRzYg9Ml
 zL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759307014; x=1759911814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZaIr6FH1wkvEsTTc63UU90krHzSjNDiVQPaADhPhLlM=;
 b=NjNXMGCoD99D0cfTQquxfNsaU07X5fP0uqfB1vNSCLukNLWwiRmXgXSltCPCdPuCLb
 VexgUGniNkzK7sFUnKNcUmIIOqmSj53VjFXRaFvT5hWTAQ/eYqBlv1BvrT3gXdQzQ/Jp
 WYmQE4Yn9dpL4JE7XKavN9uZS5rx1Iv6Dx8koOtYWbxZo5n68JbBtENzCnWHBzAXvkgk
 tBtmADww2YQGt5eD0/5MK32ekxH73d83sPP8LK5CWXjU6jPBDMIHhUSuLZONmQY23XAN
 yUiSHvHMfgKgasVQihP1/9XIFzWONdNj2DKFN7pmGth2Wie2C4+RnHyDZmPOUSznbpOQ
 5nGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwIruoqARlS9bNk2zT+7Zd57RjwgIAkV8DmkDNjuFshhBZlAVXhALRJN3Cdb7Cm7c7v2h7JpTdtg==@nongnu.org
X-Gm-Message-State: AOJu0Yyi5Mwf6RUN+P0s3AeqmNUeEJlDEWrZnB7uffgvADNXLWzHL+fQ
 AQUpz7T8YETjlNk9sN/2Tq07NJRLvycndI9cShy0ZX4ZQB+dP6WQg/GnJyR+TbXiros=
X-Gm-Gg: ASbGncucfvE7IaYV9XyHZ08AFR59aIDo/FMRgxRldz4/eJ0L0wCnd5kVjfrrdISj1/H
 SEJtfSnnkFUv/1QxzrV+6j7E7stvT/fXGpBKJUNRPqHVn1JVK8GnuT9UrYEtaoU+ip6tymKHzpV
 VJ/CHPsrxVNxEDAT1PiqbiVUBxQt2VYzD3Xcxi07NfrB8j5ywD3XpYy5T/4nC2iw0tzgftpevDy
 DH9m3dOhFUsWGP+gGYRd350s1pZe0bqmTHI2BlvxQZ4KzhZPSdAPWWZXjda6fzSZBYpJN6UW3jq
 clkwf8zn+mN9yODaqbD2+a9HiB1LhImjd1RRtfrhS5e3V1trQTp7fbFKDwG3JQNDWZUH1mATIuP
 pGokLFbeTJt0mue87yT4/5IPJ6XRn7gRdysRO0wt7WZUwY3aUh7G+aDDw+jNwP/mFa3EEi/gf/H
 hz/cco12p4HZZoMW7+/C0S
X-Google-Smtp-Source: AGHT+IGHB98tVMlfkOs0dlElGAUP3aU+L+HmrJm4W0gtdrPotgwnKOReHREs6U+cd2rGbgJkY6IrKQ==
X-Received: by 2002:a05:600c:c4aa:b0:46d:d949:daba with SMTP id
 5b1f17b1804b1-46e61262469mr24022125e9.4.1759307014182; 
 Wed, 01 Oct 2025 01:23:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b622f37sm31576505e9.1.2025.10.01.01.23.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:23:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 23/25] system/physmem: Reduce
 cpu_physical_memory_sync_dirty_bitmap() scope
Date: Wed,  1 Oct 2025 10:21:23 +0200
Message-ID: <20251001082127.65741-24-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

cpu_physical_memory_sync_dirty_bitmap() is now only called within
system/physmem.c, by ramblock_sync_dirty_bitmap(). Reduce its scope
by making it internal to this file. Since it doesn't involve any CPU,
remove the 'cpu_' prefix.
Remove the now unneeded "qemu/rcu.h" and "system/memory.h" headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 79 ---------------------------------------
 migration/ram.c           | 78 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 80 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index c55e3849b0e..24dba1fba1c 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -21,10 +21,7 @@
 
 #include "exec/ramlist.h"
 #include "system/ramblock.h"
-#include "system/memory.h"
 #include "exec/target_page.h"
-#include "qemu/rcu.h"
-
 #include "exec/hwaddr.h"
 
 extern uint64_t total_dirty_pages;
@@ -177,80 +174,4 @@ bool cpu_physical_memory_snapshot_get_dirty(DirtyBitmapSnapshot *snap,
                                             ram_addr_t start,
                                             ram_addr_t length);
 
-/* Called with RCU critical section */
-static inline
-uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
-                                               ram_addr_t start,
-                                               ram_addr_t length)
-{
-    ram_addr_t addr;
-    unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
-    uint64_t num_dirty = 0;
-    unsigned long *dest = rb->bmap;
-
-    /* start address and length is aligned at the start of a word? */
-    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) ==
-         (start + rb->offset) &&
-        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
-        int k;
-        int nr = BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
-        unsigned long * const *src;
-        unsigned long idx = (word * BITS_PER_LONG) / DIRTY_MEMORY_BLOCK_SIZE;
-        unsigned long offset = BIT_WORD((word * BITS_PER_LONG) %
-                                        DIRTY_MEMORY_BLOCK_SIZE);
-        unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
-
-        src = qatomic_rcu_read(
-                &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
-
-        for (k = page; k < page + nr; k++) {
-            if (src[idx][offset]) {
-                unsigned long bits = qatomic_xchg(&src[idx][offset], 0);
-                unsigned long new_dirty;
-                new_dirty = ~dest[k];
-                dest[k] |= bits;
-                new_dirty &= bits;
-                num_dirty += ctpopl(new_dirty);
-            }
-
-            if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
-                offset = 0;
-                idx++;
-            }
-        }
-        if (num_dirty) {
-            cpu_physical_memory_dirty_bits_cleared(start, length);
-        }
-
-        if (rb->clear_bmap) {
-            /*
-             * Postpone the dirty bitmap clear to the point before we
-             * really send the pages, also we will split the clear
-             * dirty procedure into smaller chunks.
-             */
-            clear_bmap_set(rb, start >> TARGET_PAGE_BITS,
-                           length >> TARGET_PAGE_BITS);
-        } else {
-            /* Slow path - still do that in a huge chunk */
-            memory_region_clear_dirty_bitmap(rb->mr, start, length);
-        }
-    } else {
-        ram_addr_t offset = rb->offset;
-
-        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
-            if (cpu_physical_memory_test_and_clear_dirty(
-                        start + addr + offset,
-                        TARGET_PAGE_SIZE,
-                        DIRTY_MEMORY_MIGRATION)) {
-                long k = (start + addr) >> TARGET_PAGE_BITS;
-                if (!test_and_set_bit(k, dest)) {
-                    num_dirty++;
-                }
-            }
-        }
-    }
-
-    return num_dirty;
-}
-
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 91e65be83d8..e797c0710d3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -935,11 +935,87 @@ bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t start)
     return false;
 }
 
+/* Called with RCU critical section */
+static inline
+uint64_t physical_memory_sync_dirty_bitmap(RAMBlock *rb,
+                                           ram_addr_t start,
+                                           ram_addr_t length)
+{
+    ram_addr_t addr;
+    unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
+    uint64_t num_dirty = 0;
+    unsigned long *dest = rb->bmap;
+
+    /* start address and length is aligned at the start of a word? */
+    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) ==
+         (start + rb->offset) &&
+        !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
+        int k;
+        int nr = BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
+        unsigned long * const *src;
+        unsigned long idx = (word * BITS_PER_LONG) / DIRTY_MEMORY_BLOCK_SIZE;
+        unsigned long offset = BIT_WORD((word * BITS_PER_LONG) %
+                                        DIRTY_MEMORY_BLOCK_SIZE);
+        unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
+
+        src = qatomic_rcu_read(
+                &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
+
+        for (k = page; k < page + nr; k++) {
+            if (src[idx][offset]) {
+                unsigned long bits = qatomic_xchg(&src[idx][offset], 0);
+                unsigned long new_dirty;
+                new_dirty = ~dest[k];
+                dest[k] |= bits;
+                new_dirty &= bits;
+                num_dirty += ctpopl(new_dirty);
+            }
+
+            if (++offset >= BITS_TO_LONGS(DIRTY_MEMORY_BLOCK_SIZE)) {
+                offset = 0;
+                idx++;
+            }
+        }
+        if (num_dirty) {
+            cpu_physical_memory_dirty_bits_cleared(start, length);
+        }
+
+        if (rb->clear_bmap) {
+            /*
+             * Postpone the dirty bitmap clear to the point before we
+             * really send the pages, also we will split the clear
+             * dirty procedure into smaller chunks.
+             */
+            clear_bmap_set(rb, start >> TARGET_PAGE_BITS,
+                           length >> TARGET_PAGE_BITS);
+        } else {
+            /* Slow path - still do that in a huge chunk */
+            memory_region_clear_dirty_bitmap(rb->mr, start, length);
+        }
+    } else {
+        ram_addr_t offset = rb->offset;
+
+        for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
+            if (cpu_physical_memory_test_and_clear_dirty(
+                        start + addr + offset,
+                        TARGET_PAGE_SIZE,
+                        DIRTY_MEMORY_MIGRATION)) {
+                long k = (start + addr) >> TARGET_PAGE_BITS;
+                if (!test_and_set_bit(k, dest)) {
+                    num_dirty++;
+                }
+            }
+        }
+    }
+
+    return num_dirty;
+}
+
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
     uint64_t new_dirty_pages =
-        cpu_physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length);
+        physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length);
 
     rs->migration_dirty_pages += new_dirty_pages;
     rs->num_dirty_pages_period += new_dirty_pages;
-- 
2.51.0


