Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF89CD6E4C
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gk-0005Tg-SF; Fri, 29 May 2026 15:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gf-00057Y-QM
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:19 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gd-0005cm-Lu
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:16 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-69d8091533bso3625827eaf.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084394; x=1780689194; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i0UGA6W7acHfQzFgg07ojZd+ADYp8WlSjAFL26/Ip64=;
 b=fe+EH+PPineqjit5rcKFEs2zujjotQiRnBM2gNr95lDunfs9vLQ5Uz063XxFBwT5m7
 CP4JWtXNpQ3AKZ7cZCSRwQHlrzTA1RjaZyDJ7LrbZRwm0CP3wA/WgpBRBfr9Lcnd6xQv
 pHtRpZ7GRtWmbom7F+L8Ui7BxTIz2Q6CNWhh06VxZbRRKCIfPa4Ikjw0Q9tVum06wyi5
 Sy9p25uHX6lJYkiVCC4Xs1K7Qe+Lf5aFrLhzAOwtqHznJcrJ/i4ZD94LsoCMSu57NQOR
 DCcu33zRF1EFf2F3xfRhgPmndAIAxrahinxV+XB2vgH1HXyPlHv1jyfKyporsOXAwGjv
 gJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084394; x=1780689194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=i0UGA6W7acHfQzFgg07ojZd+ADYp8WlSjAFL26/Ip64=;
 b=m2stNzn5dRGW3/VIp5MspMohhxmXlzDymsmc8Wz3AOjYc+xLADBwQ3B4m/gK77++7n
 CIGclvZ7KsmS6HhEJMmEKwDj/6BUDM8Y04IJOGpPKrOduBQvAo+jV88MU1zgnoaftP/p
 P6D6s3Q6o3p2DbjrSKw/nTXPBQkurU5F8lVHQV0xV/wuJ9UAdWViKxuPRok/Qzchg+sM
 m76lJhaUIbafogQbVbmMB+Au9FG+JmIFzY6iVkfbmkx4fzD0Q4agIY6N08RYKv6EwaQa
 eATUxzcX9KVk//pPZkeoi0o8HpJVcyol6toZbveET/5b20TpOJhByxYQRNAjZn5PiTkb
 v4eA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+bwyIa3pO2eKYODbemxPLKBlMLeu9Zm+TJG/wbk9qgiXRnlpQLzU67Dh3Jy/VcmiG706sds7L72w==@nongnu.org
X-Gm-Message-State: AOJu0YyHXg3DoaSILirOeFxB/kUWVHWPSvf4T5FJo2OCb5tEi4gK03BB
 10XaKvgfMdIlVZ/AhF/u68PzJCUNrpPBcS18Wubg1W0N3CazLOT7q+Fh
X-Gm-Gg: Acq92OGj1y6INeWU1TO3wyd8ravU6BvvSWppkz3UBPuNddL5XMaQZFhi0OjqfdzlZSi
 R13g0RY6p1G/pkdYGBBCC5ZWYZ6ABd47X2Cu+YZ5vEwCA/qRVr36CQdpJvw5OeJyBmmGXkxZPsh
 01mERBBF7KjEXfL8bkTOWIsxTcU8uLkxbrJCHcqllUa2ZqIc7sjAoz6Wt6VkSAxmGg21Y9bFlmi
 YhYtemGimKWbpJgVedBK10hAHxEktzQtGo3GdAS7w5ltKccv/E3WYce2XvZT1L6iFfx2XwSI9qq
 D92IjndttB4MWKg7/S2ksQolb5TUAqopp8XXxf7mI/BE6Qu58QY4IJEiOMeGqYAp+PvLrCbnyhZ
 rRBq7a77wGJVZLiF64FTIoXFLAoter/cgoFwRaYxg/ERZBahe3qJ3KIf8a8fX0p/i0D6Yy+6/sG
 f6+z+TA1U+933bQtK9su4exF/GQVdEY6crUc8cUzDzAQc=
X-Received: by 2002:a05:6820:168f:b0:69d:c596:8cc9 with SMTP id
 006d021491bc7-69e101a90camr444753eaf.11.1780084394019; 
 Fri, 29 May 2026 12:53:14 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:13 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:54 -0700
Subject: [PATCH v7 14/15] tests/tcg: add test for MTE FAR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-14-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=2355;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=t9UKuOxOMkff21yBSwiqqFvgFWXDPNIeJTAexYT0IVc=;
 b=x0orTOCypGXifzrK5BDUMMfeWUXOlFokLjIDg0KOXWNk8eSn3YikyOBRDKFYU3pBJHiKNc9TV
 lPdNKXO4r0NDo4xIcqgbuNEO6NpGtiTjL41jVsqXqieFls44c9Y4Bu2
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This functionality was previously enabled but not advertised or tested.
This commit adds a new test, mte-9, that tests the code for proper
full-address reporting. FEAT_MTE_TAGGED_FAR requires that FAR_ELx
report the full logical address, including tag bits.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.54.0


