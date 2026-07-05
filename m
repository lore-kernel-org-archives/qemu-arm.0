Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3138DC43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:43:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdw-0008Ux-Pz; Sun, 05 Jul 2026 00:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcT-0005FF-HX
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:17 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc7-0004NH-Ky
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ca70925c25so22577195ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226274; x=1783831074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mes9xDUQ0Ck2g/+WTnUtzsbUXNthtYb/ogAdhSHGYlY=;
 b=RRqaEcfxaiRmjYVBkmGKhQJuCxjQtQQtWZTgqI5vcn6nZae0SmFcOxaxGQehREDzuP
 DOiXOTedxpkYZIu4l2CVSkiy0e7aFrcB3pb6JPoPH0xpyyxqtMhsQR+LlJNso/d7qenG
 PHfe1YQ9IYL5R+xp8klfaQaGjBrGoNmkvWuqHWkUEl3LeBYZTgxJmpvc0TgOhmAPDGM7
 M6gyFxqh7kphZcevXZgAnGzzs+pZ2xj8ypY7hSfV3/md2e8xsYGNk8owtO9nnkQkjRQt
 lOsbN2Vcmc9J7WEncn1iLyAmwdPCBHrLIQgGk0I7Souir8NSf1ji+rAKNhmV8MmT9bKU
 ZHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226274; x=1783831074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mes9xDUQ0Ck2g/+WTnUtzsbUXNthtYb/ogAdhSHGYlY=;
 b=hJeQlU3H1hw5upy72UYZIGFIVIowTUkh46r97Ioq3e6cBuxAbIm9ZHYzRUMVd2lPjN
 hzRYrshFEcFJCZ/k0tXsxH6yq3kGO38NCR4A/1fuI2rbebqCUI28Pph1ZBq9gk/t0uDk
 Lx8FoZQQWKui94zkoGh64fETyiZuD/9YgOlC8WeyVO30WpHz9Rroo9mWdCwCSBDT7O8K
 pSGNAfvA86u+pZ3I9XcjL8ZqDB++xXmQX8TC6lTRYNY9GZheuRNw6Ee2uLHTJ9CvQzbc
 4HkVn8lO6kk06TktBmYeI9lBcX17BGCcoDDH0fXMOFk22499fl34Z2YTZ5WWV434AODi
 L3PQ==
X-Gm-Message-State: AOJu0Yw1FfbwDVr8fwkDPelMBHnqHX8pymS3SWOKUxObtRXn5x/tJO86
 JAOtYO4mnXokoCaJ9t6tkk1QcTdB2V+Go65+A8eLAfm9s+S9BNK3+KB2mTQ6E01jcc4=
X-Gm-Gg: AfdE7cnKeDAS86A1rtNdBel6rGFxwLqo8rdRwQcgV+8Sbd8F0tvEOlbTWWF3gWbKPqP
 qzN6AP1OjO2CGJlzBQK5VxxO3VAmdGu4ukUlVsbYTwuCJhqgHbYH+ZS7zQKbEop1jSJZ2CmImBV
 +lREDCMAMNeA8D0VhFKLOj3sz4Ug+Q9zaYN6PVqIPcZ9m9lsdTwIJvbbj/hiR8d2wPSib79Brpx
 oX/GgDxDE4/IAAeKhy32ckgf9nNnoW6flNEg3jer9cwlO/ubkJxb+RTv39JCbGENM8hFIu8CA8e
 uC0E9EXUcs1Q71DZQq7N52c3H6itVUHb/fMCsAfcNZbHvr6iovl3bk3PDGiew2+jx6+k85TTOqa
 B9aQqun2YEiQzMw9nZWOYiNu9H1/yXDCBp06CWgRTeP/iP3zwXsja2fuKSwN/uix4h6F0n6jzp9
 2OYjttaCX8IhfEh/gcx4vZoQo1pATfRCHKmylaJAd0t2hJQfE=
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id
 d9443c01a7336-2cbb9efe254mr56878805ad.43.1783226274109; 
 Sat, 04 Jul 2026 21:37:54 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 32/46] target/arm: Use CPUBreakpoint arg in
 arm_debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:11 -0700
Message-ID: <20260705043725.1373137-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We no longer need to search for a matched breakpoint,
test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index fe8513a5de..d705f7aef2 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -422,42 +422,27 @@ void arm_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    CPUBreakpoint *wp_hit = cs->watchpoint_hit;
+    uint32_t excp, syndrome;
 
-    if (wp_hit) {
-        if (wp_hit->flags & BP_CPU) {
-            bool wnr = (wp_hit->flags & BP_WATCHPOINT_HIT_WRITE) != 0;
+    if (hit->flags & BP_MEM_ACCESS) {
+        bool wnr = hit->flags & BP_WATCHPOINT_HIT_WRITE;
+        syndrome = syn_watchpoint(0, 0, wnr);
+        excp = EXCP_DATA_ABORT;
 
-            cs->watchpoint_hit = NULL;
-
-            env->exception.fsr = arm_debug_exception_fsr(env);
-            env->exception.vaddress = wp_hit->hitaddr;
-            raise_exception_debug(env, EXCP_DATA_ABORT,
-                                  syn_watchpoint(0, 0, wnr));
-        }
+        env->exception.vaddress = hit->hitaddr;
     } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
+        syndrome = syn_breakpoint(0);
+        excp = EXCP_PREFETCH_ABORT;
 
-        /*
-         * (1) GDB breakpoints should be handled first.
-         * (2) Do not raise a CPU exception if no CPU breakpoint has fired,
-         * since singlestep is also done by generating a debug internal
-         * exception.
-         */
-        if (cpu_breakpoint_test(cs, pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, pc, BP_CPU)) {
-            return;
-        }
-
-        env->exception.fsr = arm_debug_exception_fsr(env);
         /*
          * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
          * values to the guest that it shouldn't be able to see at its
          * exception/security level.
          */
         env->exception.vaddress = 0;
-        raise_exception_debug(env, EXCP_PREFETCH_ABORT, syn_breakpoint(0));
     }
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    raise_exception_debug(env, excp, syndrome);
 }
 
 /*
-- 
2.43.0


