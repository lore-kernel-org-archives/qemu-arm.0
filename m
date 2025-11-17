Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458C9CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 01:42:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKoFK-0003Ag-2K; Sun, 16 Nov 2025 20:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEh-0002Zo-IC
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:56 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEf-0005zF-2z
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:55 -0500
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4ee19b1fe5dso9517531cf.0
 for <qemu-arm@nongnu.org>; Sun, 16 Nov 2025 17:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763343651; x=1763948451; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=34ktumR/fmkok2iT5/89XdGNb+d+wyQTRwC+kBFtXAA=;
 b=FqK0WQGkcGFYE+5AFV31dCk5vj9tXAvwcM3czoADeoyZawqXBircV9aDWcc/KlwsEO
 fcd8ncjqIGttKetP9NqBiLqv9RMC/UhGG1tcNHAlfkbt89akxsd0qXcyZfFvKyJ9mHTm
 IJA6Q0c6GKNJL+i885yv3FqTpoRyxVSCApuCi2P3S6twYVEHdiZAIREoD9vTePyJuQbj
 mQUtXvNF7E9X2AnmXS2QoMop1ho6FN09s2EKV2UFQrq8xfG/4onhnauCRm3ah43ULMMa
 TwXjIWb6sxVr/HMMWdIZZR7bCM7ttkat9Ju+dLFWTgXnk52HZXrQbBTMGAwvvM0zhYUg
 1MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763343651; x=1763948451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=34ktumR/fmkok2iT5/89XdGNb+d+wyQTRwC+kBFtXAA=;
 b=K8dro8dG2YpAUHNeeJpZ3Wys3H3IccOwnGFJgolY0XTxw0AqcAUv4BqL1C3WooYr0x
 G0MJoHPy3U3gCoTAirMJnH98vlDq2QpfKXsbCoA2gxU4X0d7KncFdyZQ7ZkN6vpsFBVv
 R9Np38HkUZzXyoHPKsJw9j8REKxLVv09Q+vS06hu9iUQ2dtICc/3TogVIvNSHTIRaLrA
 v14wyDK5L67scKCgHUlxIRqs1cKLKF39QTJpbafBYfEWb+Mu//wJyTBkxskECjMVTNfA
 P6Yt7RqDo1O+OpK9Ge29yAawazyHCqnyE8zOvOX+2j+gRLYSyzhxIRy0jhaScs1raR4E
 9kVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2MpBdakQ8Agm/uYqmI3Fqjbq9Q2rZzYUSEaiUXrOCWU9/RvzOEnpvrARAo9StMtCm9StxCgE4Mg==@nongnu.org
X-Gm-Message-State: AOJu0YzHA6+dWhvKA0bGicB9p/4q5F6AZNMzY2rY4b4ogCVoDrbWH1F6
 WvK1K7rAFmxQB6yBUJLmTsRzpf5AEHP5EvfqOzHNOZ2soG1Zsqm9mDKKXhTxmrsy
X-Gm-Gg: ASbGnctHCGCgjWvbcAQ7Ydcv48n6c3cu9BLi+iU/45nfQeMbzbkj4wlUpIAqo6QyPNc
 hqqRUi0Aizp1IcEaQNaDTJl+ou+c3/03+18BHRbswvVhwIz4HnV0P0wu/OvnFd86P2lCkY/eq51
 UIpA3uo8WNbzuYMwHG3HDd2gwrvO+m+l+R5Kzsia3XzcFD7qwNI8SUmW1tznG8gN7gavFQdVpH3
 jFOOvWCqfsemEVBg6dmYnhFANezRKUzs0H99AFSa22kfC1Hh7+33Tr16MMyhvoROBB6zOh+j/+B
 4pXLupotXwViSiUzgrmSlDzbYZ+hXdmZuKNYyGOXntkubV2mP8YWG5WsWP56lEc5H466n875eHi
 QstnE84KL44S6kNt31/MsM/wVXRosIMv/xLvgUYMaNYjQOS8c8EZp5Ti4/h9FqMtQHaTPM1iQUd
 bFCYKDU7cJbvJU1ZIx5f0xBW9n0mCP7w==
X-Google-Smtp-Source: AGHT+IF/jGsQ8lD+aMX20VfPJBdAWz6M0s5sUUTm4IbUGzRgpJaLI9ugiTvvxlxAdZNDRL7eRCo7Sw==
X-Received: by 2002:ac8:5746:0:b0:4ee:13d0:d02b with SMTP id
 d75a77b69052e-4ee13d0d42cmr61896721cf.50.1763343651349; 
 Sun, 16 Nov 2025 17:40:51 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm18246551cf.30.2025.11.16.17.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 17:40:50 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Sun, 16 Nov 2025 20:40:26 -0500
Subject: [PATCH RFC v2 09/10] tests/tcg: added test for MTE canonical and NAT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-feat-mte4-v2-9-9a7122b7fa76@gmail.com>
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
In-Reply-To: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763343639; l=2238;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=omw1g4lZFe7vILkkcTfo81X8l2MlNL9SA0t8yBt/E6w=;
 b=hH/sdUEP5eyqUlp/HXSvoAyM5FaF5N1gbqxkZXHVssW5Mkjr3Vd2hdu3K6Ncmf7TglxTWE8ld
 oHvYadkFatPBLaUvpDFRiqnIOheVN4agTw3775LETO/OniJHNtt6qcA
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

This test cannot run in user-mode because the control bit that enables
this feature is only writable at EL1.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/mte-11.c        | 46 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6203ac9b51..141c9db9c4 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -64,7 +64,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9 mte-10
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7 mte-8 mte-9 mte-10 mte-11
 mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
 endif
 
diff --git a/tests/tcg/aarch64/mte-11.c b/tests/tcg/aarch64/mte-11.c
new file mode 100644
index 0000000000..86f2206e41
--- /dev/null
+++ b/tests/tcg/aarch64/mte-11.c
@@ -0,0 +1,46 @@
+/*
+ * Memory tagging, canonical tag checking
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
+    int *p0, *p1, *p2;
+    long excl = 1;
+
+    /*
+     * NOTE FOR REVIEWERS: to run this test locally, I modified
+     * enable_mte to also activate canonical tagging checking by writing
+     * to the appropriate MTX control bits. I am not sure how to modify
+     * the test so that it works without that modification. Input appreciated.
+     */
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* shouldn't fault on a canonical ptr */
+    *p0 = 32;
+
+    /* decanonicalize ptr */
+    p0 = (int *) (((long) p0) | (1ll << 56));
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /* should fault on our modified ptr */
+    *p0 = 64;
+
+    abort();
+}

-- 
2.51.2


