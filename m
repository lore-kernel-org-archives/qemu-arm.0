Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023ABCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s7X-0001EG-Gh; Wed, 01 Oct 2025 04:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6x-0000sm-HF
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6T-0005l4-Dv
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so61752355e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306938; x=1759911738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xhfwnxQYenTq/tp2PJW4+khvxCsXeRr52wkCrvc1Lg=;
 b=XWefImCLVlMOl8WHLuDd5/aE+5OspPkeTbcdbMzWECR2TONXz+ff0iTFa0QIwjJ93J
 R7iVCKDcb5a7JW5bvREY9QIo9GUg/yFg0T8z47Dw/VX9fdopjgwCS96UIldiI13MmiXw
 ZVW3EwSSAvrhm4hcT7Sp9tCxDwebz1ZKImCSQJNDY13/r5MGuuLPuN8wC46xD/KS/ZWS
 Fj1b09mozhzBxkBjLzATi8oYhvtp2xLj05weL2YAOi2/v5nt4YpLBAhw7IPFqFwfE6vF
 RjbY+8u2572vzL7dM5NUoVMaey3zp3NDFtmql3rC/kloZDeq4CB+WQL31pdZb387ZRYs
 CvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306938; x=1759911738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xhfwnxQYenTq/tp2PJW4+khvxCsXeRr52wkCrvc1Lg=;
 b=o9gdvmHohGTbFFD0Xlq3H4y/OS+Y30ow7WonTQguUdFmTUKGf/MTkLUcJIrOgBtiAY
 o2AvNR7YiQyKm0Ld0JnGHEbId8rEga9GkpRliU3ogoHnhKA8DzV9cmYfvf2sNG/VhCCL
 OgT1y7Mf+xKkQPL2Kq91CDVEKmJtLi6yj8Zq/Otrh0cYx1gx8qwzdxeVoGs4qfn7npPo
 Vqk2PfQ8VmSIt6LiTUAKdz8rrNrc9KjIsHQjqkhIN/5neJGM1H6XwD+O18wRomdIc7Vy
 qNVhZwFfujt9Yzt55NZ1HfTFZ9Rlav3EnbhrokqGycU2kNDkL2U5FC/PrSzVD4/UelPp
 qV+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/qSlbG9G3wqSCNwOd0JXp8D1awXl9Bz/ZzwwTP+R8mzZZbCaslCjwyb9LTp16LPZy2Uy1on3c4g==@nongnu.org
X-Gm-Message-State: AOJu0YzB1+D6g9J+DSkiIbizCjxj9reD1sZ/Iign4VjgO2BCmjW8EhhB
 5N2yGuwQbg4WbN18SxLSfJuO6McjEKLG10UhCIhUMLW3n6MsboYJZ1hZF+d0foo0qWU=
X-Gm-Gg: ASbGncvF+h4SA7KGnOAeCOFXbWUO/3eN82yWYeIDO+T1pR+BRwd2hd1k3btv/zoLQ/k
 mhjigcIZYkP25/U6Di1AKfFAWwVKGU/tu638gIyq8rnrjy5qZm9sSowpu9i6Ssji5SmKqrEiIIG
 8L3euo9mAKagIxUAstYmKolKgWtPslxqXB8KrX5G2I/yhc0ZEuFYhCkydC7mqnEBGvZPconenbI
 +51SKx7sh7be7+vbJUGsiP1PChtVnwsf+vr5zl3C8gpa2TIeVGemLxS5gyZOGFjzxuwD2uWbwSJ
 muzQF7IPs1Wt+swP1w2otS4BC4BjQF6IJBGD78/A8VmyXgZSlw608FtyAEEseP0jYdXraFjD3aj
 6YHSYYcDLgHkHyBwi4keQPxR3AQx4phbxsgYRf2NBLhYqu7UfcUPgncKfE0SMQL5qJBqbF8Fr4z
 fB/JWnm0SsUwZyeLck+nNLpT5xRN32+Mg=
X-Google-Smtp-Source: AGHT+IE3/WBiSCnGGpTVJZHThDWbhBUy9EPBmlkD33neM3UntZWo4n6MtKxXgYiQOUKYg6/g1hOLew==
X-Received: by 2002:a05:600c:524e:b0:45f:2919:5e6c with SMTP id
 5b1f17b1804b1-46e6127c38emr26519685e9.16.1759306938235; 
 Wed, 01 Oct 2025 01:22:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6199f589sm28791645e9.10.2025.10.01.01.22.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:17 -0700 (PDT)
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
Subject: [PATCH 09/25] system/physmem: Rename @start argument of
 physical_memory_get_dirty()
Date: Wed,  1 Oct 2025 10:21:09 +0200
Message-ID: <20251001082127.65741-10-philmd@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Here as cpu_physical_memory_get_dirty() operates on a range,
rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index f74a0ecee56..585ed78c767 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -142,7 +142,7 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
+static inline bool cpu_physical_memory_get_dirty(ram_addr_t addr,
                                                  ram_addr_t length,
                                                  unsigned client)
 {
@@ -153,8 +153,8 @@ static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
 
     assert(client < DIRTY_MEMORY_NUM);
 
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    page = start >> TARGET_PAGE_BITS;
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    page = addr >> TARGET_PAGE_BITS;
 
     WITH_RCU_READ_LOCK_GUARD() {
         blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
-- 
2.51.0


