Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC50CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:57:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4140-0002kI-A7; Wed, 01 Oct 2025 13:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413b-0002Gi-2U
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413B-000147-N8
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e52279279so590615e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341329; x=1759946129; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fleHOEnabQgFu4exvE553p6CfO/pKwnn0eJLyN72P70=;
 b=TrhBjCFWGyK80c0vIX5aTSIvzyPosQJd933KAphvOyt1l5jKdr5KeDzv6wjr/QqHOs
 i2wfduOhZ3eqRvKTyZ3Bei7MINMt1fSMZojDy90DHOCcXXo0aFiTrY9n/GnYwTn4fU/s
 /3QJ9q03xABcxiCiyKXwzFBxg+sB5u4CvM8Kf60urB/JjqA1bKvOZZxqQ8aLNfQjz+iG
 UrYYcMGlTKsaCI8F7gaAeDArHJ9utKdbyu7lJm8aYk5zGKte8M17e/pNPfPN/IKadhlV
 rM9Jykw0fIFG41ovixQTXlZzexwmcUJy6zle0isdhdhBkxIW5UAqdxZfZBFRMAgRCB2B
 xNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341329; x=1759946129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fleHOEnabQgFu4exvE553p6CfO/pKwnn0eJLyN72P70=;
 b=JCPvvHOtAoIcT1MK/FYdq1x2EcFqaRLO12ubwEkZMbaUToytozwwjgrqX6Cl5aYbO2
 MbR/guIdsYnwCo4B1/JxZp5LM0U+3mdTTyruUlume6kzOKVkaD2005X49RPojuLunbFx
 Wgh5JUWTvVxVl8PXzkPD6Ve1dcDJ97Qn7t9fhrFaeoS7lsGPjVlkk2EVTwK6grMQF3Em
 UNK3YDlq5gqfGHapXFfg+1+Nemw6CfBZB7v/Vv4tVzDjgHTYL5irZhRvLaelWsNuOOCj
 cubAw9deNIz23vL0/4K17DkBrvu3nBn0XLp+qga1xjittyuPCoEBWqSFR38eMZxj45P3
 uWZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXawmfcPHhcPRuuuL4tFeW90WtnnbcbUlrVouql0g6uRetELVEnnw7ZeqkZygN8D4zVWIum4ru1xw==@nongnu.org
X-Gm-Message-State: AOJu0Yw8sfSJhrY3SYE4VSjAVY9HT/n8EAnuQdIw1Pqm1RWyz8DoOLx0
 yGv3tJto+zyN/MyWgux/vZQPvmqloIOGw2gYDEKtkrypfqw/uMPDTEWpvLTsDVm3BdE=
X-Gm-Gg: ASbGncs1XYguIXf2MhQPtLL6sg5pUo3Za8dfW9KZ3779gMUo/VBLJn3foxq93zGR8FW
 JUFx7nAL689nYUktSAza0zMTrwNNdX3+G9+3xJ/DYmlTdCtQeQg/3OUrwvpxM8U+tF7EpWXHxwa
 ws0vLhSuS2HDOEM3BNmBWPMIKkW/YVpdy5uaJ/y5R0BB5Q32Ay0cAgIq7cjlF+0aUTMCZmovYau
 yIDajM2GvZjS5AxfipfvDyUj8tKM5OgWOPCz1tGk50r/xY+zYjJMS6QyAN/NPRhgJXVXOq3x2bA
 v1alq2TvLg2hbPy1RxPkVvC+2i8eQ6nS/DGLvfmIexhrJk/ohuzCBImhrZQKTegkT5IJNLJLB3i
 tBmh3gF6RDtkxQYrz/+6LkbjMO0E/8Ri8DUekYGvJN7KLXzNowhpu0zknSKXYsyqjADkmFHdeVU
 6+QefWgzjZCucwXk6BBKQU02MXow==
X-Google-Smtp-Source: AGHT+IFMtKi1Svtg3gm2PuIJU4mwz8reGwTlJrr0LpXP0uY8sPVOOOXNQc26D9Q0woV86ESbmtFHHQ==
X-Received: by 2002:a05:600c:8119:b0:46e:385c:3e0e with SMTP id
 5b1f17b1804b1-46e6128604bmr35524515e9.29.1759341328882; 
 Wed, 01 Oct 2025 10:55:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693c2e6fsm1006675e9.17.2025.10.01.10.55.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:28 -0700 (PDT)
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
Subject: [PATCH v2 07/18] system/physmem: Un-inline
 cpu_physical_memory_get_dirty_flag()
Date: Wed,  1 Oct 2025 19:54:36 +0200
Message-ID: <20251001175448.18933-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Avoid maintaining large functions in header, rely on the
linker to optimize at linking time.

cpu_physical_memory_get_dirty() doesn't involve any CPU,
remove the 'cpu_' prefix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/ram_addr.h | 46 +--------------------------------------
 system/physmem.c          | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index f74a0ecee56..f8a307d1a3d 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -142,46 +142,6 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
-                                                 ram_addr_t length,
-                                                 unsigned client)
-{
-    DirtyMemoryBlocks *blocks;
-    unsigned long end, page;
-    unsigned long idx, offset, base;
-    bool dirty = false;
-
-    assert(client < DIRTY_MEMORY_NUM);
-
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    page = start >> TARGET_PAGE_BITS;
-
-    WITH_RCU_READ_LOCK_GUARD() {
-        blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
-
-        idx = page / DIRTY_MEMORY_BLOCK_SIZE;
-        offset = page % DIRTY_MEMORY_BLOCK_SIZE;
-        base = page - offset;
-        while (page < end) {
-            unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
-            unsigned long num = next - base;
-            unsigned long found = find_next_bit(blocks->blocks[idx],
-                                                num, offset);
-            if (found < num) {
-                dirty = true;
-                break;
-            }
-
-            page = next;
-            idx++;
-            offset = 0;
-            base += DIRTY_MEMORY_BLOCK_SIZE;
-        }
-    }
-
-    return dirty;
-}
-
 static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
                                                  ram_addr_t length,
                                                  unsigned client)
@@ -221,11 +181,7 @@ static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
     return dirty;
 }
 
-static inline bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr,
-                                                      unsigned client)
-{
-    return cpu_physical_memory_get_dirty(addr, 1, client);
-}
+bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client);
 
 static inline bool cpu_physical_memory_is_clean(ram_addr_t addr)
 {
diff --git a/system/physmem.c b/system/physmem.c
index 0ff7349fbbf..a8d201d7048 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -901,6 +901,50 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
     }
 }
 
+static bool physical_memory_get_dirty(ram_addr_t start, ram_addr_t length,
+                                      unsigned client)
+{
+    DirtyMemoryBlocks *blocks;
+    unsigned long end, page;
+    unsigned long idx, offset, base;
+    bool dirty = false;
+
+    assert(client < DIRTY_MEMORY_NUM);
+
+    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
+    page = start >> TARGET_PAGE_BITS;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
+
+        idx = page / DIRTY_MEMORY_BLOCK_SIZE;
+        offset = page % DIRTY_MEMORY_BLOCK_SIZE;
+        base = page - offset;
+        while (page < end) {
+            unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
+            unsigned long num = next - base;
+            unsigned long found = find_next_bit(blocks->blocks[idx],
+                                                num, offset);
+            if (found < num) {
+                dirty = true;
+                break;
+            }
+
+            page = next;
+            idx++;
+            offset = 0;
+            base += DIRTY_MEMORY_BLOCK_SIZE;
+        }
+    }
+
+    return dirty;
+}
+
+bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client)
+{
+    return physical_memory_get_dirty(addr, 1, client);
+}
+
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


