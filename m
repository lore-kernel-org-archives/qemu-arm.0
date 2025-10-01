Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB7CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s7n-0001UO-IN; Wed, 01 Oct 2025 04:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s77-0000xi-6C
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6c-0005pZ-9S
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so4344819f8f.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306943; x=1759911743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfs8F1Ipyz4H9B11C2jVRNZlMC7r5eBMH2+MLD+93zw=;
 b=DAz3nCipq+voGbzvw65I12U92RWA2yP/0ZD0R9XYZiLL1+q1BYXGRnRNyUAx8azeRR
 lsbINIU/BZ96mNLtWUwW0firGEVd11UQ2RoA6xFynWcUhUH9mwCv6bafXksMTMgniPZ2
 nP25mcHIxXncihalsGp4ePklg6gIoE/Mt9I77o1wFDOroEvNrWVhw6cehY3NMz5ZIj67
 oCKeHzXyMDNeyTxRwQvt89VxH3RfF3xUvx+etrSGvKkc25fV3BG0yK4cPGvtia7AX3se
 nXZwu4aQZs1LHpzA5f/VuHqIZ9azYZeDQ+E2bviOjN3DQT+FJ67D6HpwVKy25mYB1d0b
 tbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306943; x=1759911743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfs8F1Ipyz4H9B11C2jVRNZlMC7r5eBMH2+MLD+93zw=;
 b=VJqFHhMTpON01IQc4DD4S8fZzEVrXUkpRRFylXUlQ0iQ4x42YVuO3pczqShOa5QL9t
 catid0xKSnzMFaRjBq9HVONLCrzYDXzDSoEHigJiOQjkPc2C84obDKq1zaRk3ZYLFIqs
 s1sfp44WwB9r2wJcm5X1gtK3oLuhbhWEA7Bgpm8UBDLXghzkTRQRXtK/mjx/rCoRVk8t
 bI9lQPsk9zbSdr4J8bZ/QCz82aJkD1wPBiL3Vn2mfoHITIEWCsIuUvGKbQ13LJ5fS/qE
 Pudjbz5SLWP4tZc0o7DhYbnPIuQb5QW2Y8x9t7G+wtSZo3XtVD2FjPDAxS1k8xPIXKqZ
 Wdqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8/uNUBOOCvdt12mJGEt3o1Sr6TW0x5/6EXgOk/TE4ujmiI6x/PF8QdcoZ8kLc9jCVK/4e1GRCkQ==@nongnu.org
X-Gm-Message-State: AOJu0YyDVlZKz3nIRNpD+BVPOBQaYHPB1IaNAQCoiO9l1Ep6NgPCZqeY
 sn7VuWEldTAIVg4bntfmlUG8Zs3EwXF9Fyx6iPvFFF/6QO+xmnbqwBDr0sMWnel27d8=
X-Gm-Gg: ASbGncsN+SnpHJZvGk2ZbfgUTUzwpQM3aAPlr+Ow470C34xlUD1KIQVw0zdAzd1sxnE
 WhFJ7N4tZUaz94tHsAzJ64gU2Jbu44ZcBDLFVZ5k+etcgwJZK0l2+OyDym5xfrRora+R4nN6784
 /9FNTSKMzBqw3X15e4LbG1cD4fronIafBtb9XsAZtxBACrL+qZgaAU3T7OztLxehSdqTpZLpn1Q
 wtaeioojjpDs5a6Ab4uGVvGYO4SpvQkXipaouyoYGQtCtyLKWiVP7DPonVOeiQQUX2vkRf5/YoV
 PyjxRcRVWSBh9BEjq6y/3dCDbTlnMFTC57Os6xJf31eOgNHNot8DflX94R4QpGcMYHJe1HXZH6A
 49khvnLcmiaxCT5NHwOrcVrplmZrZRICW+57uBi+xUqDRZprbGs7W32rsNvI8t6o3qVfKg4c0Oa
 FKHtKGiMKaiv9mGbzOEbBq
X-Google-Smtp-Source: AGHT+IGL9WtRdKQnKp3M6w/rb/CiOweA4I8JbHvDy9wOwcjwPw35D7mEMtHwDBAMRcJx5gheiFl6QQ==
X-Received: by 2002:a05:6000:2086:b0:3ee:1233:4681 with SMTP id
 ffacd0b85a97d-425577f32bbmr2123755f8f.23.1759306943546; 
 Wed, 01 Oct 2025 01:22:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb017sm25936129f8f.3.2025.10.01.01.22.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:23 -0700 (PDT)
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
Subject: [PATCH 10/25] system/physmem: Un-inline
 cpu_physical_memory_get_dirty_flag()
Date: Wed,  1 Oct 2025 10:21:10 +0200
Message-ID: <20251001082127.65741-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

cpu_physical_memory_get_dirty() doesn't involve any CPU,
remove the 'cpu_' prefix.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 46 +--------------------------------------
 system/physmem.c          | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 585ed78c767..f8a307d1a3d 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -142,46 +142,6 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-static inline bool cpu_physical_memory_get_dirty(ram_addr_t addr,
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
-    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
-    page = addr >> TARGET_PAGE_BITS;
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
index 098824ad1d2..7973448b3f8 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -902,6 +902,50 @@ void tlb_reset_dirty_range_all(ram_addr_t addr, ram_addr_t length)
     }
 }
 
+static bool physical_memory_get_dirty(ram_addr_t addr, ram_addr_t length,
+                                      unsigned client)
+{
+    DirtyMemoryBlocks *blocks;
+    unsigned long end, page;
+    unsigned long idx, offset, base;
+    bool dirty = false;
+
+    assert(client < DIRTY_MEMORY_NUM);
+
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    page = addr >> TARGET_PAGE_BITS;
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


