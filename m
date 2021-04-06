Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1690407lfr;
        Tue, 6 Apr 2021 10:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKOuN/IvMCV34A1JrlXQCjf7qklwSSE9BNug4l7iPs912pnKgLTUXDh2PVzZVp5FOJ9tXT
X-Received: by 2002:a02:c899:: with SMTP id m25mr29797983jao.113.1617731146048;
        Tue, 06 Apr 2021 10:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731146; cv=none;
        d=google.com; s=arc-20160816;
        b=sama71HSiy111IPPw+efiimTXYAAGc9ddmF4WoFbdALO2m188l76JeTe80Gs6eECtx
         bHEHCj8babeAoZiHhMnTXrKQebUUsUYAr4phPYl9OZqqXI8Nn+t5JdVgtPXZS/HZUWbt
         fAeWK9X6Bp5FgqyerY+3c3TTk+vp4NLcCsqHLai9nRLM18LBp1VOGgaWK8x+YfUBUHHH
         /9WJTg2fN4N+kM6PkVhWWt8K9w49MG2BIUDQZdufXR6UZ1C+HNJdUvmFx5eYJcJpjvWm
         QaQC8MLfcD2kKB+wfOlGLOc3omOug9f6slsiqYr+vLeOTP3uSsBU24BjKq89vlDuDGc7
         2zhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
        b=sISf+BxjVjC5MuY69fvFpVblP6K2qMhaMgkCK32EnEPZPvGblDJcokNYImkDSUEi16
         LBOE4j03VH1sd9wj7cHIPnzdbji/egy19N3qtCisJDz4wPKvOuiWtGQOeadf3CCcuivM
         G/kbi827UDenSGYhngg+tcsHiijMkJjekbvmzvqK+rDEBocSC9DKGwOuHMzd8iN2FIco
         Ri/iIfzN2McpoHYzT4r6fMnU/AniqFaVnidOed1VWfa/dnvJlygzZ2QG7cwa1ubevE8z
         GqIRUAviLP0zeBmAh4pwr+oI2AVJ54uFyGD2i7z4DLeeDxHr9sWs5RXfEmcZ5qaap4ua
         YOiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K1mDPPAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si19260166jaj.118.2021.04.06.10.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K1mDPPAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTplp-0007lN-BN
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgx-0001k9-Lj
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgu-0006Ly-Qh
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:43 -0400
Received: by mail-pl1-x632.google.com with SMTP id g10so7897838plt.8
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=K1mDPPAfmucysrMDj0Px1VNFU9cwfF7MwVGzzKLNnJsoEht4/nwtW+Bkmyf2DbI5CG
 Nr7qfXJhkb4ObX2MrMntkrBUR/Tz5LDdFFBzZfnvduCCiZJMzs4ygglDiuGUzjesr3i6
 ZoBQi55gOnR2F/gwBxDy4JBn/Z3XXdk7TplFYpdsM1QaaNP7DbNdv7n4GvCfsACUhf8Y
 w+u4PnjqdCsL0FjsdACMuCwEJsz0RTteCXh/T4jELfZAJotA3vn2m4L68aVQZRBBU26B
 oH0jZ1/hE8zu8xmC+nGlm1V3kA0jbLE4m067IaoKrAx5YlLdtolc5vCYKlYBlyk9gEjx
 a2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=SHwLLEQgEbtMMsqTm3ztpJ40jv2TbfQXV7ieMDmfATX6JLC/kcfPtq8HQjL72RDPPR
 UOob9oTjKw3BGh//sPecb1Y4I5dSmwRLQfntZHZ3U/qq+qvOs41teBJTTls0Yt2BhCVL
 M2JL7IMF9OgvLd6nMLiWZh+8kpJlLZImFguJyZJx1iJSRKgJxajtJBSMnMapgDq9u5AL
 Y+zUXx1MKG6cD8XPzS+Xc7R7yKfxBVv28tSt1VMUHhCtpT8XbECBo2Nkw3J8RyGpuSK4
 9cA/WshDenJqhS4A8OB2nkgA9xjewjjY/gRrH7rYGI5xmUki6ww3PlBfNIVFUM7A+Z5x
 dr0g==
X-Gm-Message-State: AOAM5337zTbE/5MJI3VQAlbf8N2EeMNBF0acneulgEo9XPWkCkmnDm8D
 dFGuIMMB6s2X9goACdeP4h8TzPP8xJl07Q==
X-Received: by 2002:a17:90a:c08a:: with SMTP id
 o10mr5342090pjs.67.1617730839266; 
 Tue, 06 Apr 2021 10:40:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] test/tcg/aarch64: Add mte-5
Date: Tue,  6 Apr 2021 10:40:25 -0700
Message-Id: <20210406174031.64299-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: W+piIGWVAajd

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

