Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1DECCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:32:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jPl-0003WI-7g; Fri, 03 Oct 2025 13:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLz-00082l-EV
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:14:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKI-0007x6-Om
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:58 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-78a9793aa09so3053538b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511528; x=1760116328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CvJSXdiWhbprsJzICEFPWeYtoNE9+mbwDhHlNPU7kM=;
 b=vHTTngC08Wz9eA2pA9HT4opgCc+fHAgjx9NAiCq1f2nPGTZcY/2zZUDHZhv1u3rKBI
 Y77VCs6tNM0oc42u8KUMp/5Z9gfHAh17wGPJKJ8NnXxRXfX9u/r6JetiFq1Kf65GtzXW
 xSE94aHVm4VKHxhv7Wz2QjhE4l6uwO3ZACotW7DNTg9zZPHtGGGvzasef8SsGycD0Ncz
 Nh3WiY9TtbFvWqzA+ihcAHePrpPbnOjd4kJQrrikU2JdsB8meygXLAeCCOWqQdvRUcy8
 w4oty/KKlarW7610tDpbBwr4doHRevLmWg1+26qBBn+E5AOVT1iz6nPKYL65kcudLK8A
 0s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511528; x=1760116328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CvJSXdiWhbprsJzICEFPWeYtoNE9+mbwDhHlNPU7kM=;
 b=fsB4/dmm/6X/7HvMoajTcixP8MHKAS9bp7uccG+YHds3ZRulde4J16NG0TrSRsIGDO
 2MYAdVp3Yd+nXGpetBpkMn/oDSyzvNih8BaRXxkH7XyqeNSordXyT1FoHUgVha1KKlp7
 2UXlMAgSutIfuGGz50oydusJBX2G76bUv/xSsCjbEAuEL5uJ5WO/6zbCn5Orp5XqGgaH
 5pwa1TWIkkHpdvmt0rXD72rY3SkrMVO6ULBeEJbRtCJhJL9WvkTuoP0UVcfaF+FbkI77
 qeI9SGQu4/vcizjNEDTc8UM0Rk6uKGszNHY46xIS4IOTFedFrIPm+AMZrahlVbWk09zK
 NdWQ==
X-Gm-Message-State: AOJu0YxuT7pW5z/2Ky9DPCKrgRjqjuvPK3MyYgmy5fvvS90VPYJd3sfj
 5s+SLIfGdGxkNBGZ+Aww4jr67nWSbVm8ACZAIV0pQs90qmlfOoLs2FGSdBlaSwu+OH0ay9VINcd
 iuL9UkZo=
X-Gm-Gg: ASbGnctDuSOMTt2EhbJNvB9bF1Mp9AS6I2CJ9IhAL+2BJjIAS6YyqSQjHOFamwvvCTU
 rxeU/GtOaXHjemsNXVh82TfRZx+9guFivaqYECVxP4rdAVQH8Oz0TyqkYVNUkTaZOmgzAqMdqxr
 moNU+XmGE0/DIO1jdyzAYGbA7oU1+gVJNbJIfxIEA8QsNTVdcJDBJvR+c7LyvFGVGQe2dWbJiMp
 P+B6h5kRwmIXXqUx4AtKqyjBGdSw9n10yAaHwalcmCvVHCfapZ7Bi2e9oDMtHj71b/gQVt7mqY/
 hGJF/HiMXSQVld1Or5JCI6X6eBDGibXRiOzyZlTbMw5Tp2i8bJNztQ41qdDf57ZlxWRCE4YFoTH
 YQloXBxtosdrlot2GdVNRt2ScvXLYA4H7nzBV52GpgxW5pttGuAInw8tn
X-Google-Smtp-Source: AGHT+IFIZC16UCijyCh9B7zChtX+PV0Q2oYCTm+SN5h0gsau+sPYqcG+3MRivcuQAD4wAjIe9oukww==
X-Received: by 2002:a05:6a00:6c99:b0:78a:f784:e8cf with SMTP id
 d2e1a72fcca58-78c98cdf03bmr4633284b3a.27.1759511528030; 
 Fri, 03 Oct 2025 10:12:08 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:12:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 73/73] tests/tcg/aarch64: Add gcsss
Date: Fri,  3 Oct 2025 10:08:00 -0700
Message-ID: <20251003170800.997167-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


