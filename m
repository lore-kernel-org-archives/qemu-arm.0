Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6393C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:21:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwTh-0000rG-9T; Sun, 27 Jul 2025 04:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwSu-0000C0-SG
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:10:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwSq-0005R8-Pp
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:10:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7600271f3e9so2997028b3a.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603835; x=1754208635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAfnYZFojtklCwJRxymdFpeNN7gNQpULrXmCsUVIRjI=;
 b=w3tlnSnCioUiLKwALz9I5PlL8rT0RgExpLGitYUDQQAsRh+K7pECDT7sccDXKFPyf2
 cRjlJIeFZ6mF81P8MHduIoSvPSxnMK2FQOgmxHVxlwbjUfuzaKSHI6yVBTkBp9XwkeoP
 EK/xRhe0nl231p3yPo1H8FUTNvdB1MRVgjrtuSj2KVJfzwM8ehVwPX3vwmWa6h34/OFu
 MVXv3bV6cvWWVHEtOTyrTYdjkIhXYFbGgcjfSRim5BGPwkHbIXkC4kgsZg9vsLKnwz8K
 eNMWZj/kGaVq6YjP4WOSG0B+x34P5ykCa6BV/ShO0YR0u6L/sXuwIrM4W2jCbM+/YQia
 Z/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603835; x=1754208635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAfnYZFojtklCwJRxymdFpeNN7gNQpULrXmCsUVIRjI=;
 b=XTJrWd5eFq/P+f4mYbwCy35XGM/IYtIEGDVwSsZMtm/cNBu+tZvG1sPv+0wUY9+6Zn
 wqVlQL8ImcPeSeF0sQyDzNfJM8Q7tZQ/vPnhMf3h7d5cjHNw0UQkUj6nyH4Q/iPIBUNE
 N6QnZr8KkWpcL8fEOK6+rm8UqpFM58LN2DqD+xOjNxCwwuMPLaaK1pIhhDPUr89m39a+
 u0idx+LLiDnS4Uoac4J4lRhtcP3xOTBYLmm6vRmcEa5O/XU1putmmDu59aA/nwlOrr5K
 TQDjGEPu7BeL0kHR8CaZxA0ZJk+C6yBcv9L0CSS0bRsAqT9lBu99LTVnosak0eDkE1Pe
 UAaA==
X-Gm-Message-State: AOJu0YwGMlKv3v2HLqfyiKw4g/7KrFGEQMkqd1XCcaLVenQiXUHWc38X
 Gb0QvnqT7VRzPNwMlyWZkhCqZIsAHmGyEyOtlxTpeA1H8p5MJZN4n1xvb605oz44UIr/2lxxWpd
 Lqlbj
X-Gm-Gg: ASbGncspI2YlsQFNZhQo/1Z0/92pkSr3J/dhxm+HPtI5786y0W3agRl/TCyoLjI9IeD
 wuHIa8NUXwvX5idhzdCixtXAbImN2ceWKNouODCL4zNVuufN9Jb0TKXz4HOvwZ54nS661r2kwNL
 Btlt2NebesBHz5z+4uJhi5eZmiQQ882lHmeYrixbPrtuq7NbTpbvJBXS9zZ1Akw4dlXHgR/3qZs
 sI0KGLXJMCg10JL2ciEIrarLfKlOZSqgTCGfKsiy5gLR1gxdz1U/0DKeaGOEyk5pqpcId4C7GsT
 m1rkWJcluaIRBGKMA0QLcVVR/DMWzJNf/xx9XL8i1cR+MGBCz79Xrd+NOk6DPOlZO4E65KQVYIB
 fG0/uwFUe7vdEj9Ikp3WWK5JoCg7oMNtcS3W5wxKKtgAl5QOTSiieqJrYm+2qmvWMvi3yRU+8L5
 RqFx6bB+uHnQ==
X-Google-Smtp-Source: AGHT+IGEDv1rKx+ii9+DsUIH0u3zZgy2AbMLB5Sk/qBDzZpLvN5BKGULoBO4iBDaWkaloNky4Q1Tmw==
X-Received: by 2002:a05:6a20:914c:b0:21f:53e4:1919 with SMTP id
 adf61e73a8af0-23d6df7ea1dmr12511667637.3.1753603834878; 
 Sun, 27 Jul 2025 01:10:34 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0271csm3085491b3a.49.2025.07.27.01.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:10:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 81/82] tests/tcg/aarch64: Add gcspushm
Date: Sat, 26 Jul 2025 22:02:53 -1000
Message-ID: <20250727080254.83840-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Validate successful and trapped executions of GCSPUSHM, GCSPOPM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/gcspushm.c      | 77 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/gcspushm.c

diff --git a/tests/tcg/aarch64/gcspushm.c b/tests/tcg/aarch64/gcspushm.c
new file mode 100644
index 0000000000..0c7cc09065
--- /dev/null
+++ b/tests/tcg/aarch64/gcspushm.c
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "gcs.h"
+
+
+#define GCSPUSHM  "sys #3, c7, c7, #0, %[push]"
+#define GCSPOPM   "sysl %[pop], #3, c7, c7, #1"
+
+static volatile uint64_t test_pc;
+
+static void test_sigsegv(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+
+    assert(uc->uc_mcontext.pc == test_pc);
+    assert(info->si_code == SEGV_CPERR);
+    /* TODO: Dig for ESR and verify syndrome. */
+    uc->uc_mcontext.pc += 4;
+}
+
+static void test_sigill(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+
+    assert(uc->uc_mcontext.pc == test_pc);
+    assert(info->si_code == ILL_ILLOPC);
+    uc->uc_mcontext.pc += 4;
+}
+
+int main()
+{
+    struct sigaction sa = { .sa_flags = SA_SIGINFO };
+    uint64_t tmp, old, new;
+
+    enable_gcs(PR_SHADOW_STACK_PUSH);
+
+    /* Valid value -- low 2 bits clear */
+    old = 0xdeadbeeffeedcaec;
+    asm volatile(GCSPUSHM "\n\t" GCSPOPM
+                 : [pop] "=r" (new)
+                 : [push] "r" (old));
+    assert(old == new);
+
+    sa.sa_sigaction = test_sigsegv;
+    if (sigaction(SIGSEGV, &sa, NULL) < 0) {
+        perror("sigaction");
+        exit(1);
+    }
+
+    /* Invalid value -- SIGSEGV via EC_GCS */
+    asm volatile("adr %[tmp], 0f\n\t"
+                 "str %[tmp], %[test]\n\t"
+                 GCSPUSHM "\n"
+                 "0:" GCSPOPM
+                 : [tmp] "=&r" (tmp),
+                   [test] "=m" (test_pc),
+                   [pop] "=r" (new)
+                 : [push] "r" (1));
+
+    enable_gcs(0);
+
+    sa.sa_sigaction = test_sigill;
+    if (sigaction(SIGILL, &sa, NULL) < 0) {
+        perror("sigaction");
+        exit(1);
+    }
+
+    /* Pushm is disabled -- SIGILL via EC_SYSTEMREGISTERTRAP */
+    asm volatile("adr %[tmp], 0f\n\t"
+                 "str %[tmp], %[test]\n"
+                 "0:\t" GCSPUSHM
+                 : [tmp] "=&r" (tmp),
+                   [test] "=m" (test_pc)
+                 : [push] "r" (1));
+
+    exit(0);
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 0347a36e8d..c6f401c317 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -76,7 +76,7 @@ $(SME_TESTS): CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
 endif
 
 # GCS Tests
-GCS_TESTS += gcsstr
+GCS_TESTS += gcsstr gcspushm
 AARCH64_TESTS += $(GCS_TESTS)
 $(GCS_TESTS): gcs.h
 
-- 
2.43.0


