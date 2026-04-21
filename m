Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D390F8FA78
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 14:23:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFC00-0006Dy-12; Tue, 21 Apr 2026 10:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzy-0006Ca-L7
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzu-0007Oz-F9
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4890098abbaso29491405e9.0
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2026 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776781360; x=1777386160; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XBTtSCI18DkWDQHBLKzhfLHt3mYdWEkzO4NSBhCDchs=;
 b=T2/Y1riSrZier7qOAMDNfq7XI26hR4tE/6dPJHZxLF9l8g9D1/1R0sjz+aH+63hGp5
 QpwxPkjmkk1tLSv3/NFNJctJGWYeL6yILk21jwGJkcboURwE20sjbVQ5NQzNm7RyMF+3
 ZYpWeWA4PIMCXVb6uUgXcq9m1wtaLU+szzjyjeL3+RVheqlHJ1/2uZm1zjpqEYntI1mQ
 P4vnZLgCTjhDm90GEm7xADXFR1Slu4oWdvyOodr2/OitDsybq0DuwiTnjWGBomUh5Vc2
 mhk1RYyWvpeU9pQ3xyb5LpoKZir5kZe6z8+8506fbBKcL7inNTrBYT4FQ4Ze9cSng/t3
 B3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776781360; x=1777386160;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XBTtSCI18DkWDQHBLKzhfLHt3mYdWEkzO4NSBhCDchs=;
 b=g8IMCQcrxxmajBqwMVC/OutSqlQnnb4mAOJs3gD5xk8Ma32M8lcoDUKydacOpSVaJY
 Jeorpv1ZrPQpRXFz18BHEnaCfOlvAy0Pxd/zXvxfV8qJ76OjKij/2dxQixsozVec9poe
 uZr9w3toDRelB1YtDiUBZtB5gO+XSClgv4m2B8/svCF0RB9IMS7GxYDhMs3Ue7OeCqW4
 +0TO7SlNITQypNk5VpkJLHD0AIYk8Mi/u4Oc5ZCZB8NQvPYCh+TLNxrXFGlO4/mBQcTp
 J3boEeAWgOXDjLm/DDc1CEtmVymNOanKiexaFfgzDfWELfs3WC0AtyFh4L3Uco+0+59L
 kisA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lgyeISQN23teSuXha8lyF9AhjQgKoiMEhKrdf9ALHVoAtZCX+4uHJ7YqLwUEmyLdA9BhUZ61V3w==@nongnu.org
X-Gm-Message-State: AOJu0YyyXq1lXiVBlJ6SLmKGll3HcNDADH2cvlPHrmK+UI6yEnCXvRvw
 WHHN9a8KIDlB/9Y7yYu4KjocEjiSaYxA7AfgM6BpKXar9X4sp1RR4TmUxizB1AVvpM0=
X-Gm-Gg: AeBDieuxjfIG50IUSqNe8rPYdzl5jGp+vtKYM846x/DJxhWg+eiWI6YTtC4z5K6sXFK
 b4nPzB4o9jYRn6B4QHslOp+sBoy0RDrTEXXen/g1s8b5tmUE809ViHZQcQ4ECxK8PzAwbfJxkK0
 EcaGajUZncvQSS1pUNxDWUfsZKQ+a9tQdIzvvAqEGz4NrUOw6HZkLuhJokiX4lXpti8rZpb3NkS
 z5NmpC2Pz6PM65UO0Ia1d6MnXyv7RC7ZIBeX4br5F4dWi2I7yxWNIBzUurrOaoexI2eTwJxZWCe
 PnNGgfxOCX/niDzuRvclk/s3Sz+IPdX9jvxaKc1FsWqWbObNnrmPlSIhczW0c9VEatMflTYVve/
 w/tz9GLTgfeUE02zhFKCB98zBfjduj9sxdJUg4C9m18vyYFrYWoHnFEpuxe103Q5oxwbcoYA6mz
 jSVYbK/BhUbX8I939J2/ZBmuvN6MgdNKmZYWL+4Q==
X-Received: by 2002:a05:600c:3596:b0:48a:563c:c8c5 with SMTP id
 5b1f17b1804b1-48a563cd1b2mr41046955e9.8.1776781360394; 
 Tue, 21 Apr 2026 07:22:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:5364:f814:f749:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cca5743sm164250465e9.9.2026.04.21.07.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 07:22:40 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 21 Apr 2026 15:22:37 +0100
Subject: [PATCH v3 4/4] tests/tcg/aarch64/system/rme_gdi.c: Very basic test
 of GDI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-jmac-feat_rme_gdi-v3-4-ecd20c77eae1@linaro.org>
References: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
In-Reply-To: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Simply tests GDI's prerequisites; that if GDI is enabled then
so are FEAT_RME and FEAT_RME_GPC2.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/system/rme_gdi.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/tcg/aarch64/system/rme_gdi.c b/tests/tcg/aarch64/system/rme_gdi.c
new file mode 100644
index 0000000000..e869943a13
--- /dev/null
+++ b/tests/tcg/aarch64/system/rme_gdi.c
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ * FEAT_RME_GDI Feature presence and enabled bits test
+ *
+ * Copyright (c) 2026 Linaro Ltd
+ *
+ */
+
+#include <stdint.h>
+#include <minilib.h>
+
+#define ID_AA64PFR0_EL1 "S3_0_C0_C4_0"
+#define ID_AA64MMFR4_EL1 "S3_0_C0_C7_4"
+
+int main()
+{
+    uint64_t mmfr4;
+    uint64_t pfr0;
+    int rme_status;
+    int rmegdi_status;
+
+    asm("mrs %[pfr0], " ID_AA64PFR0_EL1 "\n\t"
+        : [pfr0] "=r" (pfr0));
+
+    /* rme_status is 1 for RME, 2 for RME + GPC2, 3 for RME+GPC3 */
+    rme_status = (pfr0 >> 52) & 0xF;
+
+    asm("mrs %[mmfr4], " ID_AA64MMFR4_EL1 "\n\t"
+        : [mmfr4] "=r" (mmfr4));
+
+    rmegdi_status = ((mmfr4 >> 28) & 0xF);
+
+    if (rmegdi_status < 1) {
+        ml_printf("SKIP: GDI not implemented\n");
+        return 0;
+    }
+
+    /* Check FEAT_RME and FEAT_RME_GPC2 also present */
+    if (rme_status < 2) {
+        ml_printf("FAIL: GDI is %d, but RME is %d; RME should be >= 2\n",
+                  rmegdi_status, rme_status);
+        return 1;
+    }
+    return 0;
+}

-- 
2.43.0


