Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1747652lfg;
        Fri, 2 Apr 2021 14:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMoxScJD36D001Ekrm8jUhT5vtHUZoSwhaMnf8GWvgbpZ/In9ugxxvCV+/m83Ev1O55k1j
X-Received: by 2002:a92:1910:: with SMTP id 16mr12197990ilz.201.1617400038987;
        Fri, 02 Apr 2021 14:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617400038; cv=none;
        d=google.com; s=arc-20160816;
        b=mNPuj3bNpR6gPCph5WI7Al7LFePYtQcjJE0+91oS9/zWcng18niU+RwlNYtXl7f9vq
         BaoTao2Gxn/tEiCHEtdPDJdl/UV1wsWo9IAG6rBNLbgaZgTT3ds1+L5J3KHnpdKI4gWH
         IpicHqL6uIgNLLxlRo5898DGO5j+8Z4hZEQGhcZLj491ZbCLOJpsZabuFBDqwgwcL0r7
         9epa4UyFSWY7cIeMuklUFA475OYrerI+6eyKkYCf1mn6HDYVbI5MA9I69WzdQIJYxoDx
         g+mhllYasmpEjPEO+wbr3jdDFt6F9lTIaIX2h1RWqeVAY1miT2kLGkW7yC88qLt85GSH
         G8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
        b=AlmJTrB0cYEwyN15IqQqkujxQUv6NVTdM8VGXFlMWiLpJ74eU7r0mnS4YOo6pxsaAa
         Sl6Ju/l+haPgfB5aYSDTEeqYCYxzzOJHSOSJz1DOT5rOcU+2aOX9gN55cAPwMXl2wOZZ
         hRnAxCfbXhtiUxTw3fy/EMFp9+7sZD17Xj9OTI31Lt9r8TmL6gLdf/6D2c4Q1Gltif50
         dH9AlxMro7aZmjgRVrhjZW1XbsWvFAvAU7NpdR0EnVtXTYwNoKmCdT9gVJYrXPDN6oKK
         iCtCkYUNETzGnErUeGYY11SdSVfoolUtGRal4PlW/oEIXOr8yfUy68h07Qb+Qa78mebw
         9pGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJ+fRRKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si10096403jat.91.2021.04.02.14.47.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJ+fRRKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRdO-00086P-Bo
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYl-0000Q4-Ir
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:31 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYj-0007id-Mh
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m11so1680795pfc.11
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=sJ+fRRKRHVe4k1QdnpvFL3P9/4rCwCNXUKcyDTJaKzpzdwZmTWi+X3FpCGgjLYqkUp
 5D3Vdml6HWQXZu4mQh8F2VmyJ+23OO+aR4wx90EDfkkdzJIZWAhc0msVTopSgqTb2Oz6
 SnEbPrH0V8kr18hfobM/a3d1tNNQgUWOPUUk2yRbfFGA33yj6wp5kGG2kQ8G24Lfbxbb
 SUqIOBvkt7ygia4CV5b12NC4jhzZ2HYq48XVlbTDCi5R/I5UjAytkw2ZpgAny77ArJRo
 iwKyRdj6Mgbw6qeZ0emZR8O4DwbTi7RnOvOflokaY2swRT5+OkWnn1ok79U5W5UVm2KL
 BmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=lliQNy5Ws9Dy7+YgvI9yttu4HkqMoZOG8EFGdJov14LmogftlSo67XC7NJBgeaDCWx
 Mm1Dw1KPfHCZzVyfR/ZoVVlLGVj1tpRB8zIly2GAHu8gVgLckHOvLjD7NwOj0Ly47YpY
 +8OFKWfd2+v9Bqb4fHg4D/J/+e483/LfEaROiBNLu9whav+75MJ8fHmNL0ACbPcoKT29
 1RZgqXS2Cbn7ZJICiQpokOGBrqW6Q6nbUQn5Pms7lmhPmYXK4TOkgkRBSc/gSYCYGXzZ
 CmUROtbeCy+ESwaw0/+cc6RmOMVX8+SpQVdxWWUeNCEshG5RnKgEh42YW4era9BbRDJv
 u5mw==
X-Gm-Message-State: AOAM532isrsnqsQsYPwuSCRBouU6P4Xlm8+IeRLs84M/UmyQFeAkRcE0
 qVIHGxCrV+qeIgTQYb9aE6FJpuiVbU7Bgw==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr13262929pgh.192.1617399748187; 
 Fri, 02 Apr 2021 14:42:28 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/11] test/tcg/aarch64: Add mte-5
Date: Fri,  2 Apr 2021 14:42:12 -0700
Message-Id: <20210402214217.422585-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ecRhoHSdHxzL

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-5.c         | 44 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

diff --git a/tests/tcg/aarch64/mte-5.c b/tests/tcg/aarch64/mte-5.c
new file mode 100644
index 0000000000..6dbd6ab3ea
--- /dev/null
+++ b/tests/tcg/aarch64/mte-5.c
@@ -0,0 +1,44 @@
+/*
+ * Memory tagging, faulting unaligned access.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTESERR);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    void *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /* Store store two different tags in sequential granules. */
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("stg %0, [%0]" : : "r"(p2 + 16));
+
+    /* Perform an unaligned load crossing the granules. */
+    asm volatile("ldr %0, [%1]" : "=r"(p0) : "r"(p1 + 12));
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 05b2622bfc..928357b10a 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-6
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.25.1

