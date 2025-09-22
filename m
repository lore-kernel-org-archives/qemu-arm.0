Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A72CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:59:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ljC-0002Qa-Cc; Mon, 22 Sep 2025 14:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lge-0006J1-JP
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:58 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfZ-00053m-Vl
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b523fb676efso4105514a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567225; x=1759172025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55ummCXHlN27uJsHHRoko5hx4ehNW7kEFeS5FsKkEGI=;
 b=RvYxoAzsqAhTckbtnVrKiUZLsj8zYgK+zo0PzKA0H2M6dvo9B/P7jEBW1eCNzdrxra
 AQp8/8O5DzrIPuPqP9vcUjnx2yh8XhWJWhOBPQl/tz1sbKBlMUTxnzuA3JizBxpq8QQW
 5836M0rkFl80JlyFqcBpXHbKsCSMvYINPGREApodlUfZH3tT5dOGxtOxJ8126SqIv9LD
 pdwm72qCookOULa7d/6a7mFwlPQdqlZS2iutxCzL/Yt8HM4DNdRdkwko26jfYInFG/ZT
 06IXpAvGpYdO1AGbXoMkuNHlQbm0OzEolT+n9xqmOy/uyh7dgYtOnVVWY15AJVhL1qVC
 PWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567225; x=1759172025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55ummCXHlN27uJsHHRoko5hx4ehNW7kEFeS5FsKkEGI=;
 b=Sa0DGzbnY7CDjnLxgo24I1+/EH2Ifmup9P/1UHbRDcXE4XqGH9RbisJqsr+WAcUdDF
 UHY/2cH8bFtM5xwsyfTWNCqgOsn3xpCwh5dBuSiYyjCKjq5sSHg99YZ7B8oQYa1ww8Sf
 rKKom+lhF0QB/iHsUGmu9RlQ+HssXNLXlFoph93hjK/ia87FnyBzITd/iCj5RkvML65g
 KA2KJe7hU1eLpFbjm1DUcccNZwGJsrG6aT+TJJbLw8lYr2o6053ABBSK3kZntVWlcuPN
 vIn3dVhnO2XhvnkqxW+Bq9TeQ8szHNuLVc+vORoQtwtWAsIoFQGCr8yjwoNaGhZxWRKh
 y7LQ==
X-Gm-Message-State: AOJu0Yz8VvEGQ2djiGQp4/D/xZIDzd7d6tJ6EZiTFPUg37G4K19udnO9
 nMlzNq/Xz4V0oBUKbj0199+gYSUoEfFIWuQLgxKF1vc/hT+nEzFaVINbItnlRjpBmRBoMaWOtip
 AinpY
X-Gm-Gg: ASbGncsf6Bx+rRonwn8gkCY9bMbJU+odrKO79lQ+aXZvo0R3SFjpi8dWyr9xu4OkwcW
 lD284+dHKKDzAK3cW6ahuON78LWVmDuRROS6DXnzbCn6qfTWHTgRso/64RmVyCK60xxHFEyEXmL
 dPXaNqScMABEXzKMOdaQ0H2uSpvv4k1vX6krhwC2GyxQzeG0vfdmmcdUS/RLxtazEIVCLB213Yb
 wBSjbbPe07B2z8wKZBvPjI09kcSY8J9gMF6zQnW+IXxotdckHcITRiGByeexE/feboxIVxWqGGD
 CdmnKgWEHUzMUpxmUUCmFBPef4Q94mXwBIy5rjVk1226sTe8bFNc4Lwr8YOtSXh6svX4FaTYuxM
 PzwTsZlJbesk39K9KfglkzXm49Rye
X-Google-Smtp-Source: AGHT+IF1VSV3z7bnoj3CcGivDv+iMFSlhJf4md7j3nUnfgDksHmXJDrRAkw8tL0W7ey9x7GN/nbNRA==
X-Received: by 2002:a17:902:d512:b0:278:9051:8ea5 with SMTP id
 d9443c01a7336-278905190dfmr56385015ad.21.1758567225099; 
 Mon, 22 Sep 2025 11:53:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 75/76] tests/tcg/aarch64: Add gcspushm
Date: Mon, 22 Sep 2025 11:49:23 -0700
Message-ID: <20250922184924.2754205-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
index 5e1b3a3385..fddb7bc9cd 100644
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


