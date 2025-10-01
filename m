Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E72CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:25:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s8g-0002e5-Gy; Wed, 01 Oct 2025 04:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s8Y-0002Wl-2p
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7Y-0006Tx-3d
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e30ef74b0so47345645e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759307003; x=1759911803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyykhGLj1jkUgHcU5soenb3/DO81dJbtrcBKTf6Mydo=;
 b=KvYGZiKBEnzN05LRhz98nysbRl2XdBGQH43XofH8ysNmkzgCLWtKnR02uGCmTBX3fJ
 qggUWOonepueGaK8bcfAbC9oUQ0bC296igNXVvsyLjHIlHciE3JxpHqBUamEeokiyDbX
 hrIegZYqyli60gUgijX9L6KYfSkyFfdn/R7VifYcmRLlr77p+a9q1MmHknceB9BXii1E
 wuVohoQwhsAswTMfP79lrM75VrAoIHI1ou7j9LTVk1dFaDN7jN8ClsIsILNloXwsZLPv
 wxA5xZQwg9KYlPfT4nsA7sLWZ+agBh3w5jUknA7K97YT9zTFLdanltET3eKJZWeT/hQy
 Fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759307003; x=1759911803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EyykhGLj1jkUgHcU5soenb3/DO81dJbtrcBKTf6Mydo=;
 b=LfJ3aNwF4azQgHJ8g4sRdgltP06pPYzcgPdVjVOJN2RNpmtk/Ii1s1u1UO9yRt72M0
 ELOZUUMfmcQuAPBiGVhZN0QeRb650L3ATJtOemTEHy+ykWA8+29qoMIQsyaWf/PPXKOC
 qWXuZcz3BteDbBfQp4e6PX7TzWdTqC+izEWNnk8+23b9Xw2jPF9RXfAc/dxGryzwfQHQ
 xEJiXv7ahah3q7/KzDyu/kphFWxkXkVfcVfU+LczuyiOKrw8Ys6vvHGUEKOtXobqE/yy
 rd4Pdqa6Rrx74CMWBbu540w7s97CZuvVce4c3PChZWruYvyOyx2oG+4IKo6ovR1ts87x
 Encg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEea+RrFNCmgl0MYXxOxArKlLcwccRqlLxXi6ZbMBQRUI5CizOmY+VjN58crt/hLc9KPtKhHjDGA==@nongnu.org
X-Gm-Message-State: AOJu0Yys6LG/taqfzq5g0sJsBAy80FAKcnNWHpXJ+kEKpwem9PAfQq9J
 8GY5Sf2w8wCdbXUYMr/yEccZlenaup1gyjFZi0W28iKI701XN9CrQbn7hxbPMppU7AS+8HEUKv9
 7l/qIfAyW+A==
X-Gm-Gg: ASbGncsZuavrNnE91cs7a1gaFGPUKTFg+aea/RIHVegoEoN81CVkw3sv04sv5Aveio4
 wVPsFAZCFBXNv34j88G8KaI3QSlz0ssqzP5ViW6B+7jzaq4NcLelQx45zBhWJsRRxibn1Cn7Hib
 ik+WAzEBda7nwFFeo8kw7OAMx+StfbbKi7dzrU7ENe78rI7aw3IN/HXb+VqkFKsC1gM42WwwHvP
 WEF/70SMVr5QiPtoUnSYrkqSjcduwrqBiVmH1Lq6y3me8yL9jdJ3Ri/CI+31mI0vN76Ude2PuPw
 ZpaiuU6spJLjyfOQfXmkoAeJTjlW0Chr7BEo+enTL6DQl9OsTzfJMR72LT7KXU4aC6vvYvuxUOG
 lp+/wUulBFrlU3QNpCro4MsH8nu0f7Od1lc6r6AcGeag47ii+x2JW3Mn9/ymbpOgUQvNSXMXuUs
 n+IPdz12AC70RuYuoF3pqn
X-Google-Smtp-Source: AGHT+IEW9r/bw8qCoszWMVZkXC0nqD1HfNOEbFg+tiQXxaL8h0CvjflOEJAU8J3R9AYYkEr7d7Yj3w==
X-Received: by 2002:a05:600c:154e:b0:46e:6042:4667 with SMTP id
 5b1f17b1804b1-46e612e6912mr20563595e9.33.1759307003069; 
 Wed, 01 Oct 2025 01:23:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc88b0779sm25778005f8f.58.2025.10.01.01.23.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:23:22 -0700 (PDT)
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
Subject: [PATCH 21/25] system/physmem: Rename @start argument of
 physmem_test_and_clear_dirty()
Date: Wed,  1 Oct 2025 10:21:21 +0200
Message-ID: <20251001082127.65741-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Generally we want to clarify terminology and avoid confusions,
prefering @start with (exclusive) @end, and base @addr with
@length (for inclusive range).

Here as cpu_physical_memory_test_and_clear_dirty() operates on
a range, rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h |  2 +-
 system/physmem.c          | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 7197913d761..3899c084076 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -166,7 +166,7 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
 void cpu_physical_memory_dirty_bits_cleared(ram_addr_t addr, ram_addr_t length);
 
-bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
+bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t addr,
                                               ram_addr_t length,
                                               unsigned client);
 
diff --git a/system/physmem.c b/system/physmem.c
index c475ce0a5db..9e36748dc4a 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1092,7 +1092,7 @@ void cpu_physical_memory_set_dirty_range(ram_addr_t addr, ram_addr_t length,
 }
 
 /* Note: start and end must be within the same ram block.  */
-bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
+bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t addr,
                                               ram_addr_t length,
                                               unsigned client)
 {
@@ -1106,16 +1106,16 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
         return false;
     }
 
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    start_page = start >> TARGET_PAGE_BITS;
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    start_page = addr >> TARGET_PAGE_BITS;
     page = start_page;
 
     WITH_RCU_READ_LOCK_GUARD() {
         blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
-        ramblock = qemu_get_ram_block(start);
+        ramblock = qemu_get_ram_block(addr);
         /* Range sanity check on the ramblock */
-        assert(start >= ramblock->offset &&
-               start + length <= ramblock->offset + ramblock->used_length);
+        assert(addr >= ramblock->offset &&
+               addr + length <= ramblock->offset + ramblock->used_length);
 
         while (page < end) {
             unsigned long idx = page / DIRTY_MEMORY_BLOCK_SIZE;
@@ -1134,7 +1134,7 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
     }
 
     if (dirty) {
-        cpu_physical_memory_dirty_bits_cleared(start, length);
+        cpu_physical_memory_dirty_bits_cleared(addr, length);
     }
 
     return dirty;
-- 
2.51.0


