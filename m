Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FFECCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:01:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v414V-0003Xf-A6; Wed, 01 Oct 2025 13:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4144-0002zT-If
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413U-00018w-GV
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e47cca387so845575e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341350; x=1759946150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlX52AqMxcJ9LNLdVjn3foYDM5SyvBDKXm2bxWrANs8=;
 b=JUtYxyYbZgEbS0jrT816/3t+3Ig65S/ymjYM3j6/7+D8koGsF3XiHO6XdXe9mNmAnb
 uQVW2+HtCYfrCK/v8PJSv27VoOhu1sZwI+7eYrDHsslyOXHgz1YQ8RMk7pD2Syt6BaEn
 E11ad/2KDIKV6gNHwd9+YAKhYPn+g0SE/WM2J4T7aMxDB53NdGc6y2c17AlYSRgWFimk
 B7wNtSgxkxFqM5ir1bUffbev2pLQ/rpttczLWOr9OPqpmrDt5vuU+o4iVbiHEQkVKh1j
 osiyoNij0gt4T+/0fZ5i9rv/W3SiURF1g4oXrKLS8RcmsXG9G++yJyV2ZU0a6/krk66C
 3tYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341350; x=1759946150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlX52AqMxcJ9LNLdVjn3foYDM5SyvBDKXm2bxWrANs8=;
 b=wHsC5k2FHb60dwFexFJg9hGmaSJaBYBvahEW2sJybwjQxnbdABtezSXm9iUA44IP3j
 OK06jwtF5e9I95CHZGGcj6DO/aoIndpNnBDWeHkToXAKBjCv3dcNRjIhB4x7J+/wA+9G
 3z3sxMZMqbXn6x8Wk3OwZP620WRw+bm1fF/bg1htvoTZ2Hi6EfB+71+mdwWyk6ngkOup
 i3BMtNhMO6DfiCPy9TsgRd95VO0kWZ/ZtaYid2A4NqhmjILMRA1WmYWweUznKVwMn5va
 2K7v4XXZwGrLcRdSEuqYY0qji/lB5nGovLUV8HpxOX7Pbm4kpYc6U2jKJIch4xZ1J+Do
 Muqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Lp4PGokWE7UyvI/bo/Suv1xkcdIY1CRFLVdpmjZRbrVzdgqFaAN5JKkOpVWVQaE25lHUuWNFyg==@nongnu.org
X-Gm-Message-State: AOJu0YxUm8fn2REJk7W6XuU7+hT6BjR9/MXEV15x2DVPgi0T/5h3mjk6
 j+Z/vNCX4AOrUrgFd9no2vFamUiBjYC3HPx8kGDJvWrizDpnG5eck+dtZytIzzzpLiQ=
X-Gm-Gg: ASbGnctU22aeE/w/RXFy5MtD+Fj332iN8UdfLluAUeG5HGVOjWgJeZR82oZYKEhxEBj
 66x0neH00LAgyBoM5mWQ1DfMaF5PSHJCHVg4nuNMW05zN5niM8OIJvCTmy81A4iRbdfXNN8mSCr
 i8Ny3VcYiSbP08CxcMOIw2NjJVQ46rD2rxA0HY8nJK9elXHqGvoDUsMRfVxTv0CX1n/Rq3JXTME
 2M1u3nd0G4lPZT3aSA1A5kjHHmKJdyfFrgJ448w8nRslV37rZjB9/9NG85ZUW8V+ixB5jbQ0SHr
 t23yg/RD5uF7SRcU5KSGVsFxi244bp8KEOCgzaCOBSuRQA373EJXBWgdNXw3sr42Z27mg6kIIhQ
 Cy5ux1tFEk5oYm3rHT/xcRu0mxAro/HuGdwi7zXfi//FCDC20Yyra6kdVXMrIGbc0ZnfccrA7I9
 EXM54tFH5bsawPy5ZBH0YYIOxDxg==
X-Google-Smtp-Source: AGHT+IEdMJXNlprZNiwoJA4l58HVFC1XaFPZuELKIVRciAk0YuvIQOgBQYES04V4KQYXxWUhzUUTsw==
X-Received: by 2002:a05:600c:4e87:b0:46e:32a5:bd8d with SMTP id
 5b1f17b1804b1-46e6126af28mr38459905e9.3.1759341350307; 
 Wed, 01 Oct 2025 10:55:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e674b6591sm20288105e9.4.2025.10.01.10.55.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:49 -0700 (PDT)
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
Subject: [PATCH v2 11/18] system/physmem: Un-inline
 cpu_physical_memory_set_dirty_range()
Date: Wed,  1 Oct 2025 19:54:40 +0200
Message-ID: <20251001175448.18933-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/ram_addr.h | 53 ++-------------------------------------
 system/physmem.c          | 51 +++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 51 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 81d26eb1492..ca5ae842442 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -152,57 +152,8 @@ uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t start,
 
 void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client);
 
-static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
-                                                       ram_addr_t length,
-                                                       uint8_t mask)
-{
-    DirtyMemoryBlocks *blocks[DIRTY_MEMORY_NUM];
-    unsigned long end, page;
-    unsigned long idx, offset, base;
-    int i;
-
-    if (!mask && !xen_enabled()) {
-        return;
-    }
-
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    page = start >> TARGET_PAGE_BITS;
-
-    WITH_RCU_READ_LOCK_GUARD() {
-        for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
-            blocks[i] = qatomic_rcu_read(&ram_list.dirty_memory[i]);
-        }
-
-        idx = page / DIRTY_MEMORY_BLOCK_SIZE;
-        offset = page % DIRTY_MEMORY_BLOCK_SIZE;
-        base = page - offset;
-        while (page < end) {
-            unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
-
-            if (likely(mask & (1 << DIRTY_MEMORY_MIGRATION))) {
-                bitmap_set_atomic(blocks[DIRTY_MEMORY_MIGRATION]->blocks[idx],
-                                  offset, next - page);
-            }
-            if (unlikely(mask & (1 << DIRTY_MEMORY_VGA))) {
-                bitmap_set_atomic(blocks[DIRTY_MEMORY_VGA]->blocks[idx],
-                                  offset, next - page);
-            }
-            if (unlikely(mask & (1 << DIRTY_MEMORY_CODE))) {
-                bitmap_set_atomic(blocks[DIRTY_MEMORY_CODE]->blocks[idx],
-                                  offset, next - page);
-            }
-
-            page = next;
-            idx++;
-            offset = 0;
-            base += DIRTY_MEMORY_BLOCK_SIZE;
-        }
-    }
-
-    if (xen_enabled()) {
-        xen_hvm_modified_memory(start, length);
-    }
-}
+void cpu_physical_memory_set_dirty_range(ram_addr_t start, ram_addr_t length,
+                                         uint8_t mask);
 
 #if !defined(_WIN32)
 
diff --git a/system/physmem.c b/system/physmem.c
index 96d23630a12..8e6c6dddc3c 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1032,6 +1032,57 @@ void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client)
     set_bit_atomic(offset, blocks->blocks[idx]);
 }
 
+void cpu_physical_memory_set_dirty_range(ram_addr_t start, ram_addr_t length,
+                                         uint8_t mask)
+{
+    DirtyMemoryBlocks *blocks[DIRTY_MEMORY_NUM];
+    unsigned long end, page;
+    unsigned long idx, offset, base;
+    int i;
+
+    if (!mask && !xen_enabled()) {
+        return;
+    }
+
+    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
+    page = start >> TARGET_PAGE_BITS;
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
+            blocks[i] = qatomic_rcu_read(&ram_list.dirty_memory[i]);
+        }
+
+        idx = page / DIRTY_MEMORY_BLOCK_SIZE;
+        offset = page % DIRTY_MEMORY_BLOCK_SIZE;
+        base = page - offset;
+        while (page < end) {
+            unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
+
+            if (likely(mask & (1 << DIRTY_MEMORY_MIGRATION))) {
+                bitmap_set_atomic(blocks[DIRTY_MEMORY_MIGRATION]->blocks[idx],
+                                  offset, next - page);
+            }
+            if (unlikely(mask & (1 << DIRTY_MEMORY_VGA))) {
+                bitmap_set_atomic(blocks[DIRTY_MEMORY_VGA]->blocks[idx],
+                                  offset, next - page);
+            }
+            if (unlikely(mask & (1 << DIRTY_MEMORY_CODE))) {
+                bitmap_set_atomic(blocks[DIRTY_MEMORY_CODE]->blocks[idx],
+                                  offset, next - page);
+            }
+
+            page = next;
+            idx++;
+            offset = 0;
+            base += DIRTY_MEMORY_BLOCK_SIZE;
+        }
+    }
+
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
+}
+
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


