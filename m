Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E04CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ljK-0003E4-4b; Mon, 22 Sep 2025 14:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lga-0006DK-Da
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfZ-00053w-2k
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b550a522a49so4043220a12.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567226; x=1759172026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CvJSXdiWhbprsJzICEFPWeYtoNE9+mbwDhHlNPU7kM=;
 b=moC7dobDRaaxwjYpGVXVfUmGMmQZd0e/+z8KYu7Q4zJha3PHCT7Q6itGMs/mdQKy04
 ykuUUg0kttTqpcJetHOpta7hH4+FgMhCDRjfHE3qVtY5QyxiqZZgeAxQF/DNRs7EV27r
 QJmicYSmD5JnpnpQ4WqT1iwksT8dnqLwWrbLDPqADAewghqKN8QAUIMd3lr0VViLTYnh
 KEbw4kFMwMtZDRTBZkFiOM6aQPxBR6ICQBO2MvIte3YieAm/2C3VF3qGzW4SvSgO7NBA
 35xZSIiNmeKZTCFT2382wQ7pO6C2XJDF06MyFtAFJYQ0f9t3GapnZId44jiqPxwF/BDM
 LcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567226; x=1759172026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CvJSXdiWhbprsJzICEFPWeYtoNE9+mbwDhHlNPU7kM=;
 b=dVV1x7TSRDRp4Hu0KE9fPkqxvDFV83MPvXn3rXRvvqqtNboXyGd0uO/CHq6o7kbPnw
 ERatV42NXyZluh1vh2Y5XRSBV+ZtVbgewJlNNsXRTCZYtPaXFNAtxLF8D6ofPIqTpJxU
 soiqW3ZfSFOrYLtT6ULsD/AMh59U2gOhec+10TYRyL+mJlyUVsqL0HX072Nnj/v2NcEr
 f7jbQC4Lutt/mPSPs2W81dppaQceFrHS2DQ+7CkiQfU4hrMmhg5OnMXoKCLNYekgFT9X
 rP4+njljKHMfNRi2uA226/pbu9MsBF2rabAaS9T4nVnb2HDo0YdaO61Y+L8m2SZHGZEi
 Z3YQ==
X-Gm-Message-State: AOJu0YxMXW3wldmmkNApwVJgugdqvPNJe2OcVKC/UEKJl4GlYcLfrG2M
 U9i1WPM7u6B6vz4M6ockc0k7epiFv62+Aw9XSnQu0+6EbOg0Z9racdVamPs0zLYNZL6vhLVDk3B
 wdFJn
X-Gm-Gg: ASbGnctV8L8P1SMuYbXmQ7VPQbFb0QPX/N6ThC9Hkv3NpFOdG/oJWiEMHzF49hJziHl
 ava5kRC5S4b86G97nAKQDeTbumS5hjvF2EbOaHb5YFO7PlTfmdKWQZRqEAm1TFZwc5tEsqQAQ2y
 c1vFJmFBQywr6gJrmx/RFPgbPxaF3ei/2s0gl0OM+2poh9gpcmbvC/zYcYJJRYVcypQNSSNPI4e
 g5M/cbVgZZKYLxwtR7GWdUR3ptvgRpphqmJDcJPW2tswyWp+AxuEy+A8hj+lwuaPMSc46a+fo1t
 UOG5RLozn503lR1zm10hFkLGeQ2pB0YHfq3z1vBkESU2vpfOvB7GPV/OCAMMp7mojNraIMjuuwL
 l37msa6f3DvCxPmFcbmr2OCPsRbdr
X-Google-Smtp-Source: AGHT+IF2x+qiyjIjYIwD42/r8yX6ivjTvn2+lUHWTUGcC3Z1o6cpVa0xTyE9bV7vgURRdUNKQOlc6g==
X-Received: by 2002:a17:903:2285:b0:269:d978:7ec0 with SMTP id
 d9443c01a7336-269d9788368mr163743025ad.28.1758567225974; 
 Mon, 22 Sep 2025 11:53:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 76/76] tests/tcg/aarch64: Add gcsss
Date: Mon, 22 Sep 2025 11:49:24 -0700
Message-ID: <20250922184924.2754205-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Validate stack switching and recursion depth.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/gcs.h           |  9 ++++
 tests/tcg/aarch64/gcsss.c         | 74 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/gcsss.c

diff --git a/tests/tcg/aarch64/gcs.h b/tests/tcg/aarch64/gcs.h
index 99cb4d4e38..e821963cb8 100644
--- a/tests/tcg/aarch64/gcs.h
+++ b/tests/tcg/aarch64/gcs.h
@@ -69,3 +69,12 @@
 
 #define gcspr() \
     ({ uint64_t *r; asm volatile("mrs %0, s3_3_c2_c5_1" : "=r"(r)); r; })
+
+#define gcsss1(val) \
+    do {                                                                     \
+        asm volatile("sys #3, c7, c7, #2, %0" : : "r"(val) : "memory");      \
+    } while (0)
+
+#define gcsss2() \
+    ({ uint64_t *r;                                                          \
+       asm volatile("sysl %0, #3, c7, c7, #3" : "=r"(r) : : "memory"); r; })
diff --git a/tests/tcg/aarch64/gcsss.c b/tests/tcg/aarch64/gcsss.c
new file mode 100644
index 0000000000..9550c68e7e
--- /dev/null
+++ b/tests/tcg/aarch64/gcsss.c
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "gcs.h"
+
+#define IN_PROGRESS(X)  ((uint64_t)(X) | 5)
+#define CAP(X)          (((uint64_t)(X) & ~0xfff) + 1)
+
+static uint64_t * __attribute__((noinline)) recurse(size_t index)
+{
+    if (index == 0) {
+        return gcspr();
+    }
+    return recurse(index - 1);
+}
+
+int main()
+{
+    void *tmp;
+    uint64_t *alt_stack, *alt_cap;
+    uint64_t *orig_pr, *orig_cap;
+    uint64_t *bottom;
+    size_t pagesize = getpagesize();
+    size_t words;
+
+    enable_gcs(0);
+    orig_pr = gcspr();
+
+    /* Allocate a guard page before and after. */
+    tmp = mmap(0, 3 * pagesize, PROT_NONE, MAP_ANON | MAP_PRIVATE, -1, 0);
+    assert(tmp != MAP_FAILED);
+
+    /* map_shadow_stack won't replace existing mappings */
+    munmap(tmp + pagesize, pagesize);
+
+    /* Allocate a new stack between the guards. */
+    alt_stack = (uint64_t *)
+        syscall(__NR_map_shadow_stack, tmp + pagesize, pagesize,
+                SHADOW_STACK_SET_TOKEN);
+    assert(alt_stack == tmp + pagesize);
+
+    words = pagesize / 8;
+    alt_cap = alt_stack + words - 1;
+
+    /* SHADOW_STACK_SET_TOKEN set the cap. */
+    assert(*alt_cap == CAP(alt_cap));
+
+    /* Swap to the alt stack, one step at a time. */
+    gcsss1(alt_cap);
+
+    assert(gcspr() == alt_cap);
+    assert(*alt_cap == IN_PROGRESS(orig_pr));
+
+    orig_cap = gcsss2();
+
+    assert(orig_cap == orig_pr - 1);
+    assert(*orig_cap == CAP(orig_cap));
+    assert(gcspr() == alt_stack + words);
+
+    /* We should be able to use the whole stack. */
+    bottom = recurse(words - 1);
+    assert(bottom == alt_stack);
+
+    /* We should be back where we started. */
+    assert(gcspr() == alt_stack + words);
+
+    /* Swap back to the original stack. */
+    gcsss1(orig_cap);
+    tmp = gcsss2();
+
+    assert(gcspr() == orig_pr);
+    assert(tmp == alt_cap);
+
+    exit(0);
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index fddb7bc9cd..55ce34e45e 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -76,7 +76,7 @@ $(SME_TESTS): CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
 endif
 
 # GCS Tests
-GCS_TESTS += gcsstr gcspushm
+GCS_TESTS += gcsstr gcspushm gcsss
 AARCH64_TESTS += $(GCS_TESTS)
 $(GCS_TESTS): gcs.h
 
-- 
2.43.0


