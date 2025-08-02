Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1C6C87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLx6-0004Si-Pb; Sat, 02 Aug 2025 19:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLsB-0004ZR-AG
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:53 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLs9-0006tH-MK
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:42:42 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e75668006b9so1975286276.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754178159; x=1754782959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SotLYLgeVo+CKYkDdlihGsrrJawGkZPr42hZuKBjr+k=;
 b=uMcg4CrkZC9tQ2bNall8ZCSMmN+F8ejXvXYMWmmhit+uvchN3ZMjkJ9l5bKbjEDspj
 0OeUlV7OoMZNMQ4XSeutl/PUxIA8AgSBiNAwggnc5SOh3gHkoRErf+I1de5z3r9MZR3D
 BXU3q4pK7BX4JRN7uh+s66QvVD+s/9GzmrYImgZUB9gmVlGynCf9SduMjf8gfri6geKQ
 Hsdb8nUroxnKbve27AAvsAyz79DtxMFgVdH2h1VLP9maSKnRCepb5pvWqUE4uHs2nuhG
 +XFk0SaSIUE3dZgyjH61bpFhsqQgWZwqhonK6A7a5xmuUj0dwIGDWldtdtqRbLjlBN0M
 2bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754178159; x=1754782959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SotLYLgeVo+CKYkDdlihGsrrJawGkZPr42hZuKBjr+k=;
 b=XadZJoh4jTEn64KlTKAuZC//fMOfNCU4VZ4PGei3etxYC6KMYzq7qyM+CpsFvyMvPv
 dHaIwSyfmUuVogmvuI4kimcEZTom7Mwf9xrXZCrP0vkKgD1fbIckeHiHNc/X3SAasl+e
 KW73W+B+uFaMGgOthZEg13WtDVJ8/IoPZn3d/Jyqjj4pB3ybX4VtGOdofR3WdmPMHDLt
 4vzYDhFYUoXODmmgt079dBaKxq3YKreu/ysVI8bPZRIh8WEgZQOOZ1lapO0dhfyHVTaF
 DAWKKwGD/71zXP7/UEDsjiZacp4patWK+I2Vla22SaqyKq80KEljBQkv5vsibJWmNe3W
 eKUg==
X-Gm-Message-State: AOJu0YxFVaxDgNCZS+4rSoHZlS5AmjD4KpVV+17fGfPrw9yIbfVZ6sni
 7eOAMZR7wKK9BECCgGN9t2DF8vxOEM1Tr0v7S5dMOnQG26hzsn+ocWnT/BJ/OTbYwoA=
X-Gm-Gg: ASbGncv1qVgI3G1l8q2dqfIk1Rkjdsps1AIhfLW8gyGMrUECpsIiF8ZJeDwH2esGhAx
 i0r49nboY8XPbi/u7X50aZ/mgtrAmic1s0Az5M/o4GLeLXZpRFtABxnWvwte5BEHF+60T78Rzy4
 txkU2glGPLg37OUAfc0pRWXc/pwUaMIf9f/3Q2ebEHXLyrUrncSkqjfwibxSiZ/hAM8pzKfiFCJ
 c6QebP8a5OoSbxlAJ+CzcQe/Fg/1Chl3/meTNUzvIvHCyp/3GMYc8Fd39HEmNXPN3jZN+oEaMn7
 c7RSk74t31owOAclaYfNjNHTXY2TTtWzUU1g5aH288fuF1yK5xkwPZfvsSS+T0n3nj4B/iBQXpe
 OnEa3KqKURKdYjseg6Kt/LwYEu2NNjiSUZCobMIVvKYw97Cd2XXiT
X-Google-Smtp-Source: AGHT+IHAvWQEApRen2ThMrR4i1yfCwvNavAmxZmDFh3njuIad3m5De3XsBTj2kXn+gHPzT6iPLabnw==
X-Received: by 2002:a05:6902:2a8e:b0:e8f:d5c8:64fd with SMTP id
 3f1490d57ef6-e8fee1de7e4mr4853215276.41.1754178158890; 
 Sat, 02 Aug 2025 16:42:38 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a423f38sm18461527b3.40.2025.08.02.16.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:42:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 84/85] tests/tcg/aarch64: Add gcspushm
Date: Sun,  3 Aug 2025 09:29:52 +1000
Message-ID: <20250802232953.413294-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb31.google.com
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

Validate successful and trapped executions of GCSPUSHM, GCSPOPM.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/gcspushm.c      | 71 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/gcspushm.c

diff --git a/tests/tcg/aarch64/gcspushm.c b/tests/tcg/aarch64/gcspushm.c
new file mode 100644
index 0000000000..c330417a2f
--- /dev/null
+++ b/tests/tcg/aarch64/gcspushm.c
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "gcs.h"
+
+
+#define GCSPUSHM  "sys #3, c7, c7, #0, %[push]"
+#define GCSPOPM   "sysl %[pop], #3, c7, c7, #1"
+
+static void test_sigsegv(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+    uint64_t inst_sigsegv;
+
+    __asm__("adr %0, inst_sigsegv" : "=r"(inst_sigsegv));
+    assert(uc->uc_mcontext.pc == inst_sigsegv);
+    assert(info->si_code == SEGV_CPERR);
+    /* TODO: Dig for ESR and verify syndrome. */
+    uc->uc_mcontext.pc += 4;
+}
+
+static void test_sigill(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+    uint64_t inst_sigill;
+
+    __asm__("adr %0, inst_sigill" : "=r"(inst_sigill));
+    assert(uc->uc_mcontext.pc == inst_sigill);
+    assert(info->si_code == ILL_ILLOPC);
+    uc->uc_mcontext.pc += 4;
+}
+
+int main()
+{
+    struct sigaction sa = { .sa_flags = SA_SIGINFO };
+    uint64_t old, new;
+
+    sa.sa_sigaction = test_sigsegv;
+    if (sigaction(SIGSEGV, &sa, NULL) < 0) {
+        perror("sigaction");
+        exit(1);
+    }
+
+    sa.sa_sigaction = test_sigill;
+    if (sigaction(SIGILL, &sa, NULL) < 0) {
+        perror("sigaction");
+        exit(1);
+    }
+
+    /* Pushm is disabled -- SIGILL via EC_SYSTEMREGISTERTRAP */
+    asm volatile("inst_sigill:\t" GCSPUSHM
+                 : : [push] "r" (1));
+
+    enable_gcs(PR_SHADOW_STACK_PUSH);
+
+    /* Valid value -- low 2 bits clear */
+    old = 0xdeadbeeffeedcaec;
+    asm volatile(GCSPUSHM "\n\t" GCSPOPM
+                 : [pop] "=r" (new)
+                 : [push] "r" (old)
+                 : "memory");
+    assert(old == new);
+
+    /* Invalid value -- SIGSEGV via EC_GCS */
+    asm volatile(GCSPUSHM "\n"
+                 "inst_sigsegv:\t" GCSPOPM
+                 : [pop] "=r" (new)
+                 : [push] "r" (1)
+                 : "memory");
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


