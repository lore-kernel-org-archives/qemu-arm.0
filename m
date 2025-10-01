Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A52BCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:33:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s8I-0001xo-A7; Wed, 01 Oct 2025 04:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7m-0001TX-Rj
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s71-00066Q-LN
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-41174604d88so3565375f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306970; x=1759911770; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS0AsgoYLx5zmqVgHt+NhBtygpQInsuKcPvgvZX3Bjg=;
 b=S2DxneVXM6sGcmFCAK8nyZyxJhG43axt9/cX1TN7kEWIWtQOQS+hToT7/q8y4SgQJW
 4wqNPG+dnbu+YHgSZ4ZFWWjTd8xNx7nFD5pXRXBPg8CWaxGHG4h8QD2flDYStGTFg4kl
 Bt0EvVunW14dVF+eMa3JnBqI/RgH4EXTfHDFJbEsa2IPlsDs1RFr3r39A2b5cJ83/fMA
 e2TulO7up/iziQ17HzwlTobVPx3ppU4FoBz2SO5/XKUQQCw7hCuEkbK8Sj6hfbiGvUxz
 XJD2nX1rsYYq8RCnEYvh+GRulGu8rqkQmkfmqB328axSzflzUu1rYx+NdgywBB0l0wHN
 iYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306970; x=1759911770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bS0AsgoYLx5zmqVgHt+NhBtygpQInsuKcPvgvZX3Bjg=;
 b=lMkqXlNI0Ab7ES4M+HfilzxLpwH0aPc475eqKO6Qk6anV6dC8Q/nx13OZGkEYyUkA+
 72hv+wbreiXWTOguNkApiH97NIjg7TkHjEn2tU+pHVYVr+cgR7Dr0Jk83U6QCy/zSGlX
 typ97lvyePjMXb1J6QVHpGCINlFcRNNw1oPCh/GpbXqlZhHSc7G2zMAzTKp8dIjQlYMU
 s3RlDBhVNLAhvwQvEJJMjYAmnsxgxqyCXPM1RL205WKrf1nk1pd6T5ikVV6DCnBhfSpt
 WJRXr/uc2wm8xM+w1O2g2R2kJkYxevTORIjH9ApRWjV5qiS3w4ZCN+256KdGCo9gPeF5
 a6HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnwMeyWsrwqJTCmxXBQWo/YdodBvIcgCeKe4M+R3LUccHuTRNhIOeFUwG0cBiyty6nNYYHJ0HLeg==@nongnu.org
X-Gm-Message-State: AOJu0Yzfev6qcWlTAkvSNdYbcXTwMh3XTiWSgliazITdOJb9PTHwaIza
 GWjLUPmPflr1XAq23CL/0v9KjZOkVrmJ5CSe1icSlnisDsWurEG+1qKbYCZj3nIoM38=
X-Gm-Gg: ASbGncu9uMxdy93rHJyWVafKvDS8aVEDijAxfl8as9Hy0NI9v7wf6+oH3S+6N4247HO
 LkK9fPYWe27zuMPPTmIGM8bjiwQUkyBqhD1/Z3OdsdLISPjzLEgFtfBYA5CJGgxShPbcUYolum6
 TzFBmt255rH8fZBbotog8IX9M6PuxPBDN4zQBkqt3mHdHJfbMx5GyxXO6kNrh1xuy+HEoRQCGPE
 bgCtpcPCxgddjdBCXLmXDcFYwBzDjL6OTdMXnIMl75amfFB8dElwaK12rCktjaKb7NX8d8e9/vS
 Wq18XEJG4jqhhinPwfC8AeolwT/gKSYvKy/0v7N7Ajf+M26sqCsfzgRw2EJ1m2HN13ITGMCxp12
 tGDR7O5tncYki3dtrbyYuTVE2RyXOGqYIvXKA8EwraTdteoTwjIg9h8gzFWEGzOSJEM66wi4VwP
 XVT6j93XtFtwAxQMu8JgcT
X-Google-Smtp-Source: AGHT+IELRO2S115j4kOaHozbeuDB7zNDQhho1vpx/wRXV7Li514LzRMsEuYYyG6n31n8p/YE2pMIzg==
X-Received: by 2002:a05:6000:2510:b0:3f8:e016:41b5 with SMTP id
 ffacd0b85a97d-425577f0ab9mr1753806f8f.14.1759306970313; 
 Wed, 01 Oct 2025 01:22:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm26245714f8f.8.2025.10.01.01.22.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:49 -0700 (PDT)
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
Subject: [PATCH 15/25] system/physmem: Un-inline
 cpu_physical_memory_set_dirty_flag()
Date: Wed,  1 Oct 2025 10:21:15 +0200
Message-ID: <20251001082127.65741-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
 include/system/ram_addr.h | 19 +------------------
 system/physmem.c          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 809169b9903..6ed17b455b4 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -150,24 +150,7 @@ uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
                                                  ram_addr_t length,
                                                  uint8_t mask);
 
-static inline void cpu_physical_memory_set_dirty_flag(ram_addr_t addr,
-                                                      unsigned client)
-{
-    unsigned long page, idx, offset;
-    DirtyMemoryBlocks *blocks;
-
-    assert(client < DIRTY_MEMORY_NUM);
-
-    page = addr >> TARGET_PAGE_BITS;
-    idx = page / DIRTY_MEMORY_BLOCK_SIZE;
-    offset = page % DIRTY_MEMORY_BLOCK_SIZE;
-
-    RCU_READ_LOCK_GUARD();
-
-    blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
-
-    set_bit_atomic(offset, blocks->blocks[idx]);
-}
+void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client);
 
 static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
                                                        ram_addr_t length,
diff --git a/system/physmem.c b/system/physmem.c
index 11b08570b62..cb0efbeabb2 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1015,6 +1015,24 @@ uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
     return ret;
 }
 
+void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client)
+{
+    unsigned long page, idx, offset;
+    DirtyMemoryBlocks *blocks;
+
+    assert(client < DIRTY_MEMORY_NUM);
+
+    page = addr >> TARGET_PAGE_BITS;
+    idx = page / DIRTY_MEMORY_BLOCK_SIZE;
+    offset = page % DIRTY_MEMORY_BLOCK_SIZE;
+
+    RCU_READ_LOCK_GUARD();
+
+    blocks = qatomic_rcu_read(&ram_list.dirty_memory[client]);
+
+    set_bit_atomic(offset, blocks->blocks[idx]);
+}
+
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


