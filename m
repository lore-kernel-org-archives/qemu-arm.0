Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE046CA0EE6
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:26:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXhQ-000140-5t; Thu, 14 Aug 2025 09:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhN-0000v3-NI
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:54 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhF-0005ym-E0
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-24457f3edd4so6484455ad.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176923; x=1755781723; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1ak1ZU/AR0+1y4HNoJj/qDB25/smzJJgjU2bzP6iSw=;
 b=y0ycavbTbeHBg24zlS/TfS1/itLrBDtb5K8r8Y9PPei7DNSi4yhu4aEClep5wRlOFF
 IwmiJdftAhTsZ1ST36YKnrwzqmG9ckQVTb1/jjugS+weN2ILyWppIvsSR0gMxlZ34Azv
 Qu6nzhWGK1oSaJ0WmR2Dgq3h+B9JKA6Yu92ESulzvncP3cMRMtRANkwEEshHm33aN12E
 MOwWkjfpNQStrv9mm9CkSNs4t9XijFPXIkEZXGe3ggdjMvjtMqzDf+TkMQI4+8Y2kqD3
 pIns4yeZWO6FSPVsnvuCs7fuzzoOfxwQchwlm6gkNMJbSVW9fjn9/3FlkmMVyzk6iSeC
 cq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176923; x=1755781723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1ak1ZU/AR0+1y4HNoJj/qDB25/smzJJgjU2bzP6iSw=;
 b=K/3BjcFwBBnVLPcCofUnQMJpxexmigqSPRThdzKwWZorTB/zKyC59kS4UsE6V6bwoI
 uYCF0/lt6zK2mHrHF9OyyqamSCk/7nUiNvI4NzNxf3PLsWRb2kgCosvUN8QsAlk7WvXL
 JdGd8gySqp0QoRO8JeYzxBIXCtVStaVfcusXO97yTftXYF0aslOeAiwDHVcUqlksOJZs
 eGI8cAge6EFU3d6yrES5ptbmu1Eayo1BiVXyTdqDtdKSU8zE0Ae91cTlXjMuczOqUN7M
 A3w9ErFlzKPNAbJkqb13+VSmUtN9tcwCF1nc91c6pQcGHek3yweN9AQuUCGUqjBlzPEw
 JOig==
X-Gm-Message-State: AOJu0YzT08GnnMfMYlnAIb5WrOVi1D38nom0HHqjHwqf3itIgWilTINM
 Gaf2JfP4Us4U+psu0nYseL9cWDB2exmKhidT9WtS50vfDXg3wdD87JAwH7IaZG1oUydwe/vnpUn
 PtJswH8g=
X-Gm-Gg: ASbGnctwD+q65oBW7GqnnLgHhV/FXUA5aH7E15B6NaYXgotPcveA9xuSmaDJFJL7nQW
 xQdyNI5BP+xCOOe9OpUf9wp4qATm07DV8BDs3Yj7EvG4btvEDIXJ+BWHWy7zYOOh8AHwbdXLwPq
 JacSSlIA8lYbRYedsLnL4iOPLv7oYwsEKfmLJhSC8CXkH8IVV09Xy3gnVL+Jlm17iFTypVddQ8w
 1ztNd3Ba/cGwHv8yecKtMzlb7dOYh526TQld3FTC2TeyEdn60XPsoGKNDPVu27+j3/HYflNCGzK
 MjfiJTLCiS/j93iuBeR8JIK8pOBcx8MVJkLScXigs2eGgj08MJyU9JRt5CLCMwS5RlZGQAelM8y
 rR/I/GKDlRqVP1LSYwaVikYoBOtoxkpaznJec7enOozloOQc=
X-Google-Smtp-Source: AGHT+IG/dkbB6uvMypOJlf2Fesz59oY3wr5wGmYP0fPlPty09Gplf1zoGQfiwLuUwQe3Z84A+u++UQ==
X-Received: by 2002:a17:903:2285:b0:240:cd3e:d860 with SMTP id
 d9443c01a7336-24458b5546bmr39662555ad.41.1755176923376; 
 Thu, 14 Aug 2025 06:08:43 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24304c2943asm64438335ad.30.2025.08.14.06.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:08:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 85/85] tests/tcg/aarch64: Add gcsss
Date: Thu, 14 Aug 2025 22:57:52 +1000
Message-ID: <20250814125752.164107-86-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index c6f401c317..b858f8692e 100644
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


