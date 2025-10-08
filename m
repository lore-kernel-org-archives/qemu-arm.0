Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9A3CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:09:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cEp-0002Tr-QR; Wed, 08 Oct 2025 18:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cDi-0001UY-To
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:01:20 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCg-0007X5-M1
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:01:14 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso409643b3a.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960803; x=1760565603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55ummCXHlN27uJsHHRoko5hx4ehNW7kEFeS5FsKkEGI=;
 b=NGjkjxxxstddTwC4dF+eu077L+QM0AoH+xSGlpin4UhohIoliNgix75wpUxNWpDw9K
 kGG6NyFxGuyQG3Z1PSkb4h6wsOreCgMt6bJMLDl3FLAQlfXNIey5vUVh4GkIwK9eWSv0
 m+lEft20bKVRbMuZsmTkJvisuQ2pJKoYnqC6BL08hT0m009I1haFxMRRpeLip8l8MDol
 5MkQ1l0j2x9kI6hy6t5zeNnWD+CtrfrqRTY66L+ziFSXmxz1CitHxG91/yAyJMUaZn0K
 1+xdwkjlce/emxY7VXPRhkE1Moe7YJhsUrUsA6Qb8EM4x/LXVF3jpskyW4X47G0s1OMG
 Mi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960803; x=1760565603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55ummCXHlN27uJsHHRoko5hx4ehNW7kEFeS5FsKkEGI=;
 b=eVEKZrNZlUn/Z+IoS07lew/oySn541BEC5FAQtRLdRJA7ff3EaH3qJpSCza8aAlOc5
 N3JH3QV7EKet8x5i8r/dN6PB/iGnw8MavLPOW8QVIdYAIPqQdevLLgcto6bxLlRWZ/9j
 RLJ3ZRN7BHAhWgzSFxTII0hzv86ltxL1P7jOQJ1Pz8VuuPmc6pJcnXhohmkCKpGCfn8s
 l3Ik18OTOcLj+J+ZKNsWYT+cqA4Y4ISM02N4cmMWLy47T46C3+tm6TnPxzcHCWRdVEqO
 t1ZWfWKmsh8M00eySlSQI9Ji6qRWPrVaxkDmtd+aL9+ef4sF3v9dt0kl82lyZKwp3aJ3
 GzqA==
X-Gm-Message-State: AOJu0YxArYvQzXGzV2fsbE30HhTWrDEaFdozh1b5+ML9IFI3dSjZ3IJW
 H32YNzTL088SzL9u3Rt+5RgVuIps7jPb48tBf95cZKBroyqECZZ++FwxMi91z1DVCwQ=
X-Gm-Gg: ASbGncsxzDxhT8zNlOXsnicgN9H8dueYPCtRn4leSf1GlWAGNPOpODkBl8eSLBH88CG
 PpOrhQvet9D04roi0gzl3YXkZn6qejRf9IIbys0HPjVPnaXoYuwx0BwjsNoLxUiehVfKEamHwh/
 YDTBJsuFtvNlJDRBW4H/X/9GAEcKXYF8X2g0wnRAQJztGdqXwp78mHM8SV9Xr6406Qyiipn7qnO
 KWoCrjHoByrd68oGDe7XKbykAZgGgAg5ZkHm2YIpfyMKVqMD2Q7wcpeKdqinDJosYfwhvbMEeRe
 tLMwxqAOQjftb0XhQt5fM9Jn0R9cVAw4tVFeDNlDA6WnCjpKc7FeNOfZTrArf5K3xhbBQ0Bvk+g
 2ExW8twsud0EhFI3uF4RMYDOsc/JvZOa1EllNTwGgoykKtn4HBZ/gXaSwVILV5ObRk6k=
X-Google-Smtp-Source: AGHT+IHM5x6IgkhCfX7nq/gY2YUPaMBOOJRcNu1gpn0JHxhN7sLETaACZpe31ZoCPZAvw07hnmtaVg==
X-Received: by 2002:a05:6a00:178e:b0:78c:985b:8d3b with SMTP id
 d2e1a72fcca58-79387437020mr5267530b3a.23.1759960802847; 
 Wed, 08 Oct 2025 15:00:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.15.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 15:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 72/73] tests/tcg/aarch64: Add gcspushm
Date: Wed,  8 Oct 2025 14:56:12 -0700
Message-ID: <20251008215613.300150-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
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


