Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86E3CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:27:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s8L-00020z-C2; Wed, 01 Oct 2025 04:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s87-0001kB-FF
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7C-0006Fo-Pf
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so30546005e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306981; x=1759911781; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOqPvVAdOz/3hFjUsdAFf2tJOS39s9qPYq5sN81Yu4U=;
 b=VpFDDgi3E9BuE06VArKCx00Yo1D/Zuv/Ofp6SxSnF8b/UUosLq3gl4ihgYYtBeLSzp
 TdS3Zw8wOJY2gh17PAqtJUkfd2CRtPLljOkREFIrILK+SiHYEPgJsBpscW+tMXm7EYV5
 m6PUo9jMIdEHbc+o7+PyEuAqg2oh7nTtRHSBtsU4Yl7ZGbipJb+pMqkXpGiFxO7Mcx4d
 vzsiGUmooD8eI1bJJPbf00ne5rThmzqXNL5cn2qNovoAqoN0Q1TTG7WZ0n30qTTQi22h
 Ko67yWHFaZRgZukStKvsl3iYQof6aaMQ/+9JIblN7epDrQyJg/UzSBtvLhBO4cUgD9ZQ
 LbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306981; x=1759911781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOqPvVAdOz/3hFjUsdAFf2tJOS39s9qPYq5sN81Yu4U=;
 b=tD4aJmFU9KrC1EJ2QcKPEJJrtpPOiXNlCNyQ7/BkD9s8QU+G9iHBvvk5zVbG5kP3K5
 Xn8jlkC/GpRRAjQEaumUeMZZYuJsUHRlhZTJRdIlJdsSW16vwNZLmMvD2SZe/m94avy7
 Rqw2/FvXH+vPG5kjNvFa6dSlf154WNgyiUALj3/sXP3f//LB4yZ4gtdrkyL6r5uHNyZi
 Hr/VBzuHcOYLsy3v6bz+iEeZ4pwuBWRAC3En7Ow7KyXkIsLL9Q9XWUm80jhtCH8AQCk9
 lJVtgfnO6g/4WhYG6vUtiFeipfss7uJj0jeGnNivZ0nGoG5ARKFrdQvfzUM3CfP8nF/P
 rNpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCmJAGZPLSi9SPSpghCyDsKyjd+6znZkg3aeSpkW0iG8c+z8aAjy6BAjdt21N9nCekJEPYuXl/3Q==@nongnu.org
X-Gm-Message-State: AOJu0YyVB3mrwKSSEJnaskKM9Q5w5a7gHigTgmBAgHsnYxxahb22b4O1
 H26CxVz9i80lNr6g+1yZ9PAVeL+mF+KGl5D7yragUFwkUti2mHri5Csj+IuFPvrL1jk=
X-Gm-Gg: ASbGncte4p/7U9SgMyW6/KjQrJmlwadwomQ4WMFlhrtUSmJ0TmSMffcLCMquBKtB4ty
 2vSmHeYPjf8sz/ernBkvm+K8ok1vcuGgsNxrlUOGYzs08+SuBakXyPxqQWEfbAhlA99h4srYX8y
 Mzp4cytLQtyjcZucoGTliTxCR13CWv1TSQBLIyGOYr0c3uB/ZOKEecL3vORYB6b2yw2y5kbfJK8
 00WH6/dwPcnsrvpXdpX9O6QkGVU22EazZePeJK3GWAtdfkw92OT5985VQE3dQ12Dv32XLBwDnlk
 L4+7vlkLqIN7HKxvw5irmuoNeuOzRN+DCzJ3guNDVynt1xOzkYDEhJXE9YrTPycKOtE0NsVp/gi
 68dSa/jR+RjjCjuBGhyYxQjN8N5E4gB1/6ySM4ova7vBjg583nmUt6dGTAouwq7aHPtuEW7Z6YL
 CiD3VwyNOkhsxYqpDtNaA4
X-Google-Smtp-Source: AGHT+IEfJgBTWJXo/xTm4FeZN+2Or//riROV16Lac62nDF49jLqWqoeqFpWnxe66gIQZozq8Gvzg1w==
X-Received: by 2002:a05:600c:3b22:b0:46e:36fa:6b40 with SMTP id
 5b1f17b1804b1-46e612baa03mr22761255e9.24.1759306981243; 
 Wed, 01 Oct 2025 01:23:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b9c88sm28154505e9.22.2025.10.01.01.22.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:23:00 -0700 (PDT)
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
Subject: [PATCH 17/25] system/physmem: Un-inline
 cpu_physical_memory_set_dirty_range()
Date: Wed,  1 Oct 2025 10:21:17 +0200
Message-ID: <20251001082127.65741-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
---
 include/system/ram_addr.h | 53 ++-------------------------------------
 system/physmem.c          | 51 +++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 51 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 84a8b5c003d..6377dd19a2f 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -152,57 +152,8 @@ uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
 
 void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client);
 
-static inline void cpu_physical_memory_set_dirty_range(ram_addr_t addr,
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
-    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
-    page = addr >> TARGET_PAGE_BITS;
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
-        xen_hvm_modified_memory(addr, length);
-    }
-}
+void cpu_physical_memory_set_dirty_range(ram_addr_t addr, ram_addr_t length,
+                                         uint8_t mask);
 
 #if !defined(_WIN32)
 
diff --git a/system/physmem.c b/system/physmem.c
index cb0efbeabb2..383aecb391f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1033,6 +1033,57 @@ void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client)
     set_bit_atomic(offset, blocks->blocks[idx]);
 }
 
+void cpu_physical_memory_set_dirty_range(ram_addr_t addr, ram_addr_t length,
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
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    page = addr >> TARGET_PAGE_BITS;
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
+        xen_hvm_modified_memory(addr, length);
+    }
+}
+
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


