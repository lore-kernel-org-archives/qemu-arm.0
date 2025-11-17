Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A492CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 01:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKoF1-0002tV-6r; Sun, 16 Nov 2025 20:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEZ-0002VF-2U
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:48 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEX-0005x1-6a
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:46 -0500
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4ee158187aaso11592871cf.0
 for <qemu-arm@nongnu.org>; Sun, 16 Nov 2025 17:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763343643; x=1763948443; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dJg7o0njSoHw1PElRLxS8S96IWORDRuuiBXNi4x95ZY=;
 b=e58LTR10ytv8TUpFj90XrW8GvQ9GKsIVHf012q6LyWiR2qQrmUqF66S6AdQHyI9wQH
 wIjAk5vDJfBmumD+xkHJzpYuhxhBbqH9Euj+EF3j0yA7rePcZY/g91qzUc5hgoT2PiH8
 krxA/00eV7HThRk7oMPYSrGvvUAYI8Z5HbnQJ7JfV4PRMkX9W9Hs6KJOOdf90o9D9G+6
 ykRwJtMfvkMIZEhSmU66GKVeYseH3KdyR9ibhe0PraLz2BPKXRtmNOAcZlA1oBXsfYly
 C9Czcm14Dlz2qRULaEmTBShwJOAp1826l5WPjkWAMGY3X4+y4WJyRR2IxjVkH6YyE0nm
 YCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763343643; x=1763948443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dJg7o0njSoHw1PElRLxS8S96IWORDRuuiBXNi4x95ZY=;
 b=W/1i97zFW9KGSqmiCMAjpCrv/6T+DqgxcfNi/4eZhdukC+CniK7yLLdFOHNtuh1SPd
 GDCDw5yzHTDnnTeniISbCBFU3uF5Y7ficmgig/B1mfQFNvPXK3YfxMRqdkN6zwxqndN3
 aTZLXxs4bQNPYPsfPM8QiocV6Hyb9TRgo/917LNgw54eyLCZ78iCADlwrZoo9nVVD6d3
 0/jcqDii7O07SQnL3oIpAaJrcMZl48B/NVXAUbAdR2jbrRUWqd7Qlo4ck+sfyNDwvBLV
 eabGwYkXFn2ShmAncDhblTkkLOg5yVKGeeHWHIM40GXRIm+sZt+EShnPpDRhUW83N8Kb
 qkEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwdWpJd5h8NvVZ5RDHvodec9dFX/u4KelZV50UFbMHhRZd+BFhsNx60+MrSBv4d4XIIdgJtBCZCA==@nongnu.org
X-Gm-Message-State: AOJu0YwgfdK94mELjSLFdwraCzy/wY9LiJvj5CxIQ30K12GdJc7huQHS
 PiTFWVM7uZZk4Cfrz5pKyzzsUI7rOcsgPFYEsoX72/Yd4mu60kRD/9rinjLnHvIg
X-Gm-Gg: ASbGncvr/ipqo/0xhcJBFVoimSldJSOxzzUDIESUaqd1UC5+Z6mKs+W3HSpD0KI1CDM
 eVS4SYtHofBkoN7adywVkLWY57bhWTYN7EQlgvQ9gA3V5ZIW4sr39VMEAw16Lpy1cs3T7paYskQ
 WhVYs2Oe6gVbH2Qu1O6zfAJPHQwD1TmLphfmeLKE2gg6q76nV7ebst2ZtikGCxqTLbhJFD2iyBS
 DXEOhN7T+63SO3aqFsbT/NOiFTg/WZbSJQdP+foahLoCFX/6tlGK0yN//50vjzledNIOeotff88
 ytw4uo9Fl8S4WWIDNOFVxgAPLSgN8lIL55/zXYgktJ/scXrnmLDrVbZL393xHJ2hhfYfk0ICldH
 rHlonSUWvliwpva4kf8PVJcvqZctqieS9oYlPnvQlEJC7aytYkQmuPYko+X1NXDgLGKE0ZS8UKG
 6PKAnVHpG6mu1P7swin8c=
X-Google-Smtp-Source: AGHT+IFFj+4raECEysCuphQUuhGNp8KIK/ny0z6sl7nSvcuN1GQqnL7VSI7TtSrOgLK4m7h9HDNa/g==
X-Received: by 2002:ac8:7d94:0:b0:4ed:e337:2e52 with SMTP id
 d75a77b69052e-4edf20569bfmr187316451cf.30.1763343643421; 
 Sun, 16 Nov 2025 17:40:43 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm18246551cf.30.2025.11.16.17.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 17:40:42 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Sun, 16 Nov 2025 20:40:19 -0500
Subject: [PATCH RFC v2 02/10] tests/tcg: added test for MTE FAR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-feat-mte4-v2-2-9a7122b7fa76@gmail.com>
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
In-Reply-To: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763343639; l=2292;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=Lt766CnKW7qQoO+68NGtyaf2zeaQO6m4Et9tVGr/w2o=;
 b=6+nH/t0L6n4A+hz/XSL17/dCQDMoOme/+Q8sTn7VioIbOnjw3xohsjb8H65zFiKxN1T/BT7WK
 XaPJAZusNH8DUI0bw49V82OMdZ8HrwiOvzmWcPCu8QKL1JIYUCXxXLI
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This functionality was previously enabled but not advertised or tested.
This commit adds a new test, mte-9, that tests the code for proper
full-address reporting. FEAT_MTE_TAGGED_FAR requires that FAR_ELx
report the full logical address, including tag bits.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/mte-9.c         | 48 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9fa8687453..b491cfb5e1 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -64,7 +64,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9
 mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
 endif
 
diff --git a/tests/tcg/aarch64/mte-9.c b/tests/tcg/aarch64/mte-9.c
new file mode 100644
index 0000000000..9626a90c13
--- /dev/null
+++ b/tests/tcg/aarch64/mte-9.c
@@ -0,0 +1,48 @@
+/*
+ * Memory tagging, full-address reporting.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+static void *faulting_ptr;
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(faulting_ptr == info->si_addr);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    int *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers. */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    faulting_ptr = p2;
+    *p2 = 0;
+
+    abort();
+}

-- 
2.51.2


