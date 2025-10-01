Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E12CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:04:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v414L-0003In-RJ; Wed, 01 Oct 2025 13:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413u-0002eE-LL
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413L-00016W-MJ
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so787785e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341340; x=1759946140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4FpKgP4EA24JaZyt14rp8t6FdQHApouicK9Mpxbqsc=;
 b=OHfGS9VBxQwLopQOSSpKRlx+f4QDjAypAm53a+B1F83jr9ATLoJ8WscKaOOs5gjaiZ
 j++AZFyuwsEDMXW7b/vDPrisrni5h8MmAtLFMqIDDRi8bej/VgphJ9TfQyfIPj687v0b
 m64MJYcciDIGdGVGu9tOBHzkR2HeHT9YaZ91uKi+V9ttVTwLZ+qgzraDT2YdsITm1Cjf
 hTVRY5FDiHmOEsUxhZvW+8BBk3meU2sImAVGWddW4R5QhwrEOgLmD8s8yTsINyHJmuSU
 pQa0bgy+AvHUH8hUhtkgPty5NotTfBTw+Z2WDCofmn5gtyn9kQxXabUT5RGQ8K1sVSBp
 Q+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341340; x=1759946140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4FpKgP4EA24JaZyt14rp8t6FdQHApouicK9Mpxbqsc=;
 b=E4uvMPIYxmg0+lfXRPUWG9AtGWf4YlwhCjzrSD8oMFKPx0MppiL8nxeSmuj+OrJ6zR
 KsOeuSMIPQOHBjPjaUlngdZ882zOpYM4ZG5d3d5ZGkqS8loZezIZuOVxlpTIITXYC134
 IYH+/x+9aLOBD9M7vAhdAP5kNzNpzkuYoxi39VJGjJ3zJDfCkzdY+rc1dp8nkColoOJP
 lyy+sXb0EUnaTqRP0Csg5SJCN9KZzSjBUsP63/NhWMxtsW8+wJZCv/+3ZQ9oeAef4T0R
 uMUTOdhZyKxxbxLp4tCX6P1EKkJ+s4AN+VRJoWTy5fVV2iXhE83ijcicKEg74LrAJF6T
 r8cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8gqSOPBeKQEeXgSZ6h54f8GBMU51blwoYpgMVvnwpnxPk/svHjtCZsfofu+Dxl5n/IM4kdbu+Rw==@nongnu.org
X-Gm-Message-State: AOJu0YwaIBxZ2089FnXLdliYmRzN86JxL+LL1KfOoVYpueIDpyxQb3pC
 6KXRyIgfrp/M9nRDW9OgHg2qtLhA3K6w4b8Bx1Eod5gvj+iniQjVQVmKYvEb/vVBAtc=
X-Gm-Gg: ASbGnctcUg6DeXvq3C8zRbem/QrccavIcnG+ZCP/brKOoeVM5NpwE8QWzYIR+1YODX7
 9LaGmJSBQ7pM8JOKJD9blq7ENz29bkMUvMdBn0bxtoJ5DLOcjAd1NOiP1uD3sb4f38mvAwv4k22
 LOW82Ng8QZTSOhDyFoRTLLk2Aywx/RX7Fj3E7HKvLjTSv9U4b/enmcG2rnWAE4RDN61mZ2dy7r+
 R92/Ux97y8A+5whFDub8CuQzgD1eCGEzOGqWveR6Zz/ZpyulnUSLMmxfumZ1zq29GXwDbmZqMbb
 K8iWKElF+gnIPzdN1l+uCkOd8VLA5YreuKRG7dREOYShOjrvUDpB63P/7Ey3/1odYKRYpYlraiF
 vvH/v5cumO2W1T763s3WPmtr6h4fvoX0m2KoX167EQeAYSvJlKfYBq7QTYO2MKZD6YeZN4P1Hnf
 zenBfP9YoHCeWcQZGxp7SbQGpf8Q6IpGFvSHkO
X-Google-Smtp-Source: AGHT+IF0xbC1IEd8QMB22IhbYKtfRZKDX/TCaConk1RKW1e7VjrGfmv9+PMY2JeZ2AZyw41zjVsNuw==
X-Received: by 2002:a05:600c:620d:b0:46d:996b:828c with SMTP id
 5b1f17b1804b1-46e61218f70mr40496535e9.10.1759341339699; 
 Wed, 01 Oct 2025 10:55:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b8507sm48708415e9.3.2025.10.01.10.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:39 -0700 (PDT)
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
Subject: [PATCH v2 09/18] system/physmem: Un-inline
 cpu_physical_memory_range_includes_clean()
Date: Wed,  1 Oct 2025 19:54:38 +0200
Message-ID: <20251001175448.18933-10-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

cpu_physical_memory_all_dirty() doesn't involve any CPU,
remove the 'cpu_' prefix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/ram_addr.h | 62 ++-------------------------------------
 system/physmem.c          | 60 +++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 59 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index cdf25c315be..2dcca260b2b 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -142,69 +142,13 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
-                                                 ram_addr_t length,
-                                                 unsigned client)
-{
-    DirtyMemoryBlocks *blocks;
-    unsigned long end, page;
-    unsigned long idx, offset, base;
-    bool dirty = true;
-
-    assert(client < DIRTY_MEMORY_NUM);
-
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    page = start >> TARGET_PAGE_BITS;
-
-    RCU_READ_LOCK_GUARD();
-
-    blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
-
-    idx = page / DIRTY_MEMORY_BLOCK_SIZE;
-    offset = page % DIRTY_MEMORY_BLOCK_SIZE;
-    base = page - offset;
-    while (page < end) {
-        unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
-        unsigned long num = next - base;
-        unsigned long found = find_next_zero_bit(blocks->blocks[idx], num, offset);
-        if (found < num) {
-            dirty = false;
-            break;
-        }
-
-        page = next;
-        idx++;
-        offset = 0;
-        base += DIRTY_MEMORY_BLOCK_SIZE;
-    }
-
-    return dirty;
-}
-
 bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client);
 
 bool cpu_physical_memory_is_clean(ram_addr_t addr);
 
-static inline uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t start,
-                                                               ram_addr_t length,
-                                                               uint8_t mask)
-{
-    uint8_t ret = 0;
-
-    if (mask & (1 << DIRTY_MEMORY_VGA) &&
-        !cpu_physical_memory_all_dirty(start, length, DIRTY_MEMORY_VGA)) {
-        ret |= (1 << DIRTY_MEMORY_VGA);
-    }
-    if (mask & (1 << DIRTY_MEMORY_CODE) &&
-        !cpu_physical_memory_all_dirty(start, length, DIRTY_MEMORY_CODE)) {
-        ret |= (1 << DIRTY_MEMORY_CODE);
-    }
-    if (mask & (1 << DIRTY_MEMORY_MIGRATION) &&
-        !cpu_physical_memory_all_dirty(start, length, DIRTY_MEMORY_MIGRATION)) {
-        ret |= (1 << DIRTY_MEMORY_MIGRATION);
-    }
-    return ret;
-}
+uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t start,
+                                                 ram_addr_t length,
+                                                 uint8_t mask);
 
 static inline void cpu_physical_memory_set_dirty_flag(ram_addr_t addr,
                                                       unsigned client)
diff --git a/system/physmem.c b/system/physmem.c
index fb6a7378ff7..2667f289044 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -954,6 +954,66 @@ bool cpu_physical_memory_is_clean(ram_addr_t addr)
     return !(vga && code && migration);
 }
 
+static bool physical_memory_all_dirty(ram_addr_t start, ram_addr_t length,
+                                      unsigned client)
+{
+    DirtyMemoryBlocks *blocks;
+    unsigned long end, page;
+    unsigned long idx, offset, base;
+    bool dirty = true;
+
+    assert(client < DIRTY_MEMORY_NUM);
+
+    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
+    page = start >> TARGET_PAGE_BITS;
+
+    RCU_READ_LOCK_GUARD();
+
+    blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
+
+    idx = page / DIRTY_MEMORY_BLOCK_SIZE;
+    offset = page % DIRTY_MEMORY_BLOCK_SIZE;
+    base = page - offset;
+    while (page < end) {
+        unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
+        unsigned long num = next - base;
+        unsigned long found = find_next_zero_bit(blocks->blocks[idx],
+                                                 num, offset);
+        if (found < num) {
+            dirty = false;
+            break;
+        }
+
+        page = next;
+        idx++;
+        offset = 0;
+        base += DIRTY_MEMORY_BLOCK_SIZE;
+    }
+
+    return dirty;
+}
+
+uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t start,
+                                                 ram_addr_t length,
+                                                 uint8_t mask)
+{
+    uint8_t ret = 0;
+
+    if (mask & (1 << DIRTY_MEMORY_VGA) &&
+        !physical_memory_all_dirty(start, length, DIRTY_MEMORY_VGA)) {
+        ret |= (1 << DIRTY_MEMORY_VGA);
+    }
+    if (mask & (1 << DIRTY_MEMORY_CODE) &&
+        !physical_memory_all_dirty(start, length, DIRTY_MEMORY_CODE)) {
+        ret |= (1 << DIRTY_MEMORY_CODE);
+    }
+    if (mask & (1 << DIRTY_MEMORY_MIGRATION) &&
+        !physical_memory_all_dirty(start, length, DIRTY_MEMORY_MIGRATION)) {
+        ret |= (1 << DIRTY_MEMORY_MIGRATION);
+    }
+    return ret;
+}
+
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


