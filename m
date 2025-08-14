Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A48CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:20:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXhb-0001lQ-5U; Thu, 14 Aug 2025 09:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhO-0000vr-J4
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:54 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhD-0005yB-F3
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-24457f47000so7265155ad.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176920; x=1755781720; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SotLYLgeVo+CKYkDdlihGsrrJawGkZPr42hZuKBjr+k=;
 b=DyQvJ0HZe1/BIDPY+w66ShdVbberqsodrCbffej9jlwhrs86bRkM/cCt/ZRf2TgMRp
 SabyI9CPMgRwA6OXsSqYL1Lk4+imeiT31rqN7gyaXUKWvDzaQDz7gJSmi59Uptz0gLrj
 tDTu41lSXdKxCGhS8kSQuGc/AvGWJcXvOOKvcb1S010VCHUunfeCBd/3S4NFajj+8cry
 bRKbLqBnTCdfggPmTVlVOaIWP8ZhBUEOWUZezehlzFNJBV7d7QRyxRToBsJna9Z/XjFQ
 LVRp14p+ah+iB+rAq4U+w1qY/IJQ5NHkqPmPz425fCNDZ8wJKF2PeyGjcWJ0t1YUBY8l
 XhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176920; x=1755781720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SotLYLgeVo+CKYkDdlihGsrrJawGkZPr42hZuKBjr+k=;
 b=wiWAMVoCtUFGoYeZOfLLFQKkd73DBkYLvj7vEr/X15982dV41qj1z10xCRfDF+fagB
 aO3v+g/NDAvk3sTg/9BhgB8xG1RD2EDFirNENBfKCwQQr81Z80O3DOisUFy5i1L7Fg7f
 e+pZR8TC9x4+1/DmZs52/Of5EmLp4idnOTW94mXDOhbBb0rbADTUjuGvsTv3XzYEm870
 LqR2/ppPhMZpEChHiDt2vxLoeo15RUr2RvhdbGGdcu4oQxs9XzHhaJKnmn4HGGiKmtHp
 eHz4R5VWfeE/wUXMjpFdIwVrcBXJZRxllvFzXdb1b1wa/ut4nRjQh8HvEWpvsVQ2EgDE
 Crzw==
X-Gm-Message-State: AOJu0YzNH1j8W5X25Cog6dDBEragYi8FaC6kLIndOOhWdYKmYuSaszaP
 YV0vRCy//I/jDR76MEbfkSDuQVZWnLqXv2ctZ8j+Kj+dogF6CQRehhLJnCD42eKac0Q=
X-Gm-Gg: ASbGncuh/fF64Y27lhGlz588krmk7CruQbkUUZ2B2/8BDAznR/W3/uM9Gjlyc1dsSnQ
 5awEiVmn+w8FC3gEsfb8J2A3GtnDV4sOcSrcz0lu7ZDZpPuy4PxJclYDEasz8CDO8ubqRl3nTyf
 wUR53PqlW8ZXMsEZ5B8qM+/XlJMIIaIIuUoNEpgeZf2oQ9R6UKwO5Hj7vLKB4MdJgUhcwWkWzec
 CiRBdcy2oRVfRlp4r8eZn0JnVVNeePsj3Tcpqpo4CSzWinJJ69aX6yOVFD6eo4nm4hNnNegHbaa
 YeHUZs2nlGsZq9oQjnjVcubpIGb60WqPBjE9z1kFqPibefJx/71MBxorBctpKKOo+qi6ZvibvrK
 yenM9uS0ZSzFbf5iVz0v5njeu90AV0UGUt1MqBZjDDYFXmio=
X-Google-Smtp-Source: AGHT+IHPMQ37RESdZkKcbeLTTR+tYZ2/ePRnBdXQSbqyT5zDTKWX9Fg406xDSVLsDgHldxHoMPx3YA==
X-Received: by 2002:a17:903:2c8:b0:243:7cf:9bca with SMTP id
 d9443c01a7336-244586ed222mr38606435ad.55.1755176920293; 
 Thu, 14 Aug 2025 06:08:40 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24304c2943asm64438335ad.30.2025.08.14.06.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:08:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 84/85] tests/tcg/aarch64: Add gcspushm
Date: Thu, 14 Aug 2025 22:57:51 +1000
Message-ID: <20250814125752.164107-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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


