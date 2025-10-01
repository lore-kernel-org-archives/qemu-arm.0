Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C8CCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:31:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s7s-0001Z9-G6; Wed, 01 Oct 2025 04:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7c-0001NM-9M
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6v-00062U-V1
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e430494ccso32090735e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306965; x=1759911765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ar/YH35Ozey5kVfE4PeoBGaZy8MaPZNMvHfkarTLI30=;
 b=B2FUP/8R3R01lg5UEK8a5mq27Ly7wjaYz9FCOXo0CiZUIjGx6IO5DoGHm5lBk1Xivx
 7CI5QqRSqxzcJTy2Ja4bTHZLThbBcSw4bFus4IpMEo9rUsPwbegcxYdlLibkercO9XWT
 ajn3HB67+Urv1omU9pXYO4uaEu2fckMYK7BZngee9z+xWzmn4aq3oidwoDOldnwVEr3r
 cphEQTgrpqyrxiec3adzjO6Cb9xxjxGChCuoCWKc5HkFCFe8b4Up1c8wTu6YRkvJrKOI
 ZLFxvopTZSLvqIWIk6bvLmlEcwj6r8Po4IPgHstTvkVwStGSNxcT1g9KJyfgRbdzrLma
 6v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306965; x=1759911765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ar/YH35Ozey5kVfE4PeoBGaZy8MaPZNMvHfkarTLI30=;
 b=euQ0FLFW6tBUBywJr636CcvByaI9wSv21BAEbLxtMRrryW4ydwAiuSeJA76VA8HKkE
 7QQZhi5SGRyXOF5QbKLTH3REUfiOGt3HubXeIttatZWXDRYcyiz96TdYfAvQKggmqNLa
 gg6s4JiR0vsQqxSzFaM/ZQBvOURz39bTDzQrbJdeEPVMjtoeSJ/VjI9tQI74xZ3lPl1R
 p1r0w3jQ6xNxIZvNGLcpDwrFxoZ/CA3fUlrCEE2kxq32EBaXqHn+i0DcSJOeLNPNAgZL
 zBbOueYhmKnmNGdRdJjGgs6P/4Lye0fThi7woho5Iw4KoEQSrpFF7o+W0I+cLu8hpGVy
 /Q3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb4cgLnu3GtfoMm6GQFmoE831WWMa6oY3QW3qkxDotNcQnfX6Kfv1VvPWvs8CQBzsxdRpmEaXFhw==@nongnu.org
X-Gm-Message-State: AOJu0YzfSjrZv7k2SP8HTTcxVXDf0jZQWTIgIgQxmHXoMaRR/FD8vRum
 G7uYdXIrmVzNfJpTpoyqbbvkFrLrb2XzNOg9bFRR4fzHn2r2w2IEFHB2A2ejNEyZnskOn5XgqKm
 /FLq+gmIJ/g==
X-Gm-Gg: ASbGncs2h4I2qt4xGfMpbzi9Mc04seBbP7aqf93w6SBzWHNMj1U4Agnk7+GcTka63HD
 q+fU5c6Psvxm2Ew1/MA9qHjIjXpniH7Ijd3fd3Dfi+VG4IEFThrZIYHmWG+erYXbUX4SuipQDUO
 czPG8x8G9jRI0+w19DZ62RVLOZG7IfWCCnZ2vDy5D8HggQ1LQdetjsLDl5v51ckdkHXN5WpqgiJ
 9u6ZPcByAt/CgtJ6aDrUTTeXIFSXsI6DbdKTJg69bR57BE98CYgbiVs0ZXA0Ll6jXV+GMOimm1t
 W30Cz1HD1YwFlL2b5HxScomVOZAv0ux7fE2vTe1XGuaxNzySBQEjm8l3vlockpH5TcmVvh9wKZ4
 hWn19SnyS4FH3m76xLY8CAijiPhw63AYZLwalX/Snfk4QN2mfinjQJmu3N0IEhRH6TowKS09qz3
 TnwJakRDFFpWLfClkUfoOV
X-Google-Smtp-Source: AGHT+IGN+bWrg5qo2djMQfrLkRUz4RRvn5SYFKJUC7nTMlaMtjSHo8h3I9oI8EbvaN2VVWqyt7ac8Q==
X-Received: by 2002:a05:600c:154e:b0:46e:49fd:5e30 with SMTP id
 5b1f17b1804b1-46e61201fd8mr25182005e9.6.1759306964804; 
 Wed, 01 Oct 2025 01:22:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619c3ac3sm28907875e9.9.2025.10.01.01.22.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:44 -0700 (PDT)
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
Subject: [PATCH 14/25] system/physmem: Un-inline
 cpu_physical_memory_range_includes_clean()
Date: Wed,  1 Oct 2025 10:21:14 +0200
Message-ID: <20251001082127.65741-15-philmd@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
---
 include/system/ram_addr.h | 62 ++-------------------------------------
 system/physmem.c          | 60 +++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 59 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index e06cc4d0c52..809169b9903 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -142,69 +142,13 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-static inline bool cpu_physical_memory_all_dirty(ram_addr_t addr,
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
-    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
-    page = addr >> TARGET_PAGE_BITS;
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
 
-static inline uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
-                                                               ram_addr_t length,
-                                                               uint8_t mask)
-{
-    uint8_t ret = 0;
-
-    if (mask & (1 << DIRTY_MEMORY_VGA) &&
-        !cpu_physical_memory_all_dirty(addr, length, DIRTY_MEMORY_VGA)) {
-        ret |= (1 << DIRTY_MEMORY_VGA);
-    }
-    if (mask & (1 << DIRTY_MEMORY_CODE) &&
-        !cpu_physical_memory_all_dirty(addr, length, DIRTY_MEMORY_CODE)) {
-        ret |= (1 << DIRTY_MEMORY_CODE);
-    }
-    if (mask & (1 << DIRTY_MEMORY_MIGRATION) &&
-        !cpu_physical_memory_all_dirty(addr, length, DIRTY_MEMORY_MIGRATION)) {
-        ret |= (1 << DIRTY_MEMORY_MIGRATION);
-    }
-    return ret;
-}
+uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
+                                                 ram_addr_t length,
+                                                 uint8_t mask);
 
 static inline void cpu_physical_memory_set_dirty_flag(ram_addr_t addr,
                                                       unsigned client)
diff --git a/system/physmem.c b/system/physmem.c
index b27519c3075..11b08570b62 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -955,6 +955,66 @@ bool cpu_physical_memory_is_clean(ram_addr_t addr)
     return !(vga && code && migration);
 }
 
+static bool physical_memory_all_dirty(ram_addr_t addr, ram_addr_t length,
+                                      unsigned client)
+{
+    DirtyMemoryBlocks *blocks;
+    unsigned long end, page;
+    unsigned long idx, offset, base;
+    bool dirty = true;
+
+    assert(client < DIRTY_MEMORY_NUM);
+
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    page = addr >> TARGET_PAGE_BITS;
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
+uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
+                                                 ram_addr_t length,
+                                                 uint8_t mask)
+{
+    uint8_t ret = 0;
+
+    if (mask & (1 << DIRTY_MEMORY_VGA) &&
+        !physical_memory_all_dirty(addr, length, DIRTY_MEMORY_VGA)) {
+        ret |= (1 << DIRTY_MEMORY_VGA);
+    }
+    if (mask & (1 << DIRTY_MEMORY_CODE) &&
+        !physical_memory_all_dirty(addr, length, DIRTY_MEMORY_CODE)) {
+        ret |= (1 << DIRTY_MEMORY_CODE);
+    }
+    if (mask & (1 << DIRTY_MEMORY_MIGRATION) &&
+        !physical_memory_all_dirty(addr, length, DIRTY_MEMORY_MIGRATION)) {
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


