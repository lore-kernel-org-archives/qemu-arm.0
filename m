Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE4AC43602
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEfL-000415-Ll; Sun, 05 Jul 2026 00:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfH-0003ne-8V
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:11 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfD-0006OI-R0
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-845e363246aso2027638b3a.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226466; x=1783831266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=ppNF5PuNpbI8QeSD5r/vRERadsbJnmQ++YpSiaeFHTizbfigZHQqXX8Hd58KeWME/Y
 xOSshh9Vx6GktctbktWSbk8Nra8NvqHRqZwVQdOzwN8gLwoXnGQWMy8hE0Qf5CIPyOHB
 dZrzsCAVabaYYmqMxW8KmdXjYK07X4X9OKiEu9NqPMiCByWSz8Q7F86cE+O3y/XKX6zY
 SQXQk98XZms5UaSIF9qZaDTjLs8F12vPKkAPnNsPOMziO2e0SZRLcMP703IfiAzHWvII
 zJynTZN1R6a7i+hgod6z1ZBIyg0YjkTJh9NX3YWMlQOt3l5BB/Fnu3iv4/vnGeAO3kW8
 A0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226466; x=1783831266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=BX39J9GpsJD1dehzwt+g6qzastMgnpDvxOdivtk9fEbqrQeZYN7KYkTSxUrLiGgMsn
 Irw3Kj+aut9F38bEUMs3KYRKg/VK5Dph+OfcZOoEKQlcU6RhJbrLx/g4NrI0UOISK92k
 lDT1kTWsa/zR9HK1jLMJ7ld9yR/325P1LA0drrhn8BN5OKyeejr8N0GttAiPDHW6KwJN
 bBdE+s9rMaDWagtgqRkrV+6P4enm8opV5i6OoLNjCjw+LZ5/gnPYVD0I7wxyHeKDoA6C
 ysnCVet53ar5OAnykVqbIO1AhFVsefihwpEPSxkdyKdfsyq1MEWR2mxss0n1WI48ZyDH
 bGcA==
X-Gm-Message-State: AOJu0YyIzelENMKIlT2JoM2cf3gnWoLJTFO+g+aRZ9U65F82u2XRlo7P
 I0ePu/izt450/mkyS2OBbBpFDjySTD4EPfGFn72lQLOka+4jTgH/24HMCWEGCAW+Vqs=
X-Gm-Gg: AfdE7cm9R1Nzor4737UvNYZhmFnFtwPWH/0UWzBFjPkA49DgH32qQy8K9lbiW20CYsd
 k91cWWF13qtz2EauLnU5bVT0is+4t2EJTi/5u9hzP4ijrQM2Oin/NwHDQaIu0gRr3DOtsUwbXvS
 8OfdtntrRuxK0uFu2lihexlRcYJ7qI887a/suif1wIcvHGGAG5MDuYWXURkqUwob/QCpc619sXk
 iOkC+o2GsMy0XtoRxyj68aNDaOfixjSM/6aPYSXooq8AH7NlsJ7ZZp/A9n9RA3NCJMnNFovZ9il
 eRYNxKz406do7jJsw2OvU/bGBfp/EnAxEZiNRSAh8YvR/bmuzzr+M+qqvgBqXrNrjQWvIYjFbkv
 npnxUVuFga4VtfOvP8Z3kCrWlWCp7tQ2VDHivPHHQhl53MXdFfoG6L0pbD5PY0fLd7fFikAoM1p
 U6EI75MPkNGuBEQ9uv6DclbjmcrsUoefPiKkbrmyJBchgo9AI=
X-Received: by 2002:a05:6a00:2d99:b0:847:871a:94ca with SMTP id
 d2e1a72fcca58-847f6f3d63cmr4784193b3a.41.1783226466338; 
 Sat, 04 Jul 2026 21:41:06 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 44/46] target/xtensa: Simplify xtensa_cpu_debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:23 -0700
Message-ID: <20260705043725.1373137-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

No longer need to check BP_CPU.
Use hit->id instead of a search over ndbreak.
Unify the raising of the exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/helper.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 7643e97b2c..f66d0bff04 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -207,47 +207,26 @@ void xtensa_register_core(XtensaConfigList *node)
 }
 
 #ifndef CONFIG_USER_ONLY
-static uint32_t check_hw_breakpoints(CPUXtensaState *env)
-{
-    unsigned i;
-
-    for (i = 0; i < env->config->ndbreak; ++i) {
-        if (env->cpu_watchpoint[i] &&
-                env->cpu_watchpoint[i]->flags & BP_WATCHPOINT_HIT) {
-            return DEBUGCAUSE_DB | (i << DEBUGCAUSE_DBNUM_SHIFT);
-        }
-    }
-    return 0;
-}
-
 void xtensa_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 {
     CPUXtensaState *env = cpu_env(cs);
+    uint32_t cause;
 
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            uint32_t cause;
-
-            cs->watchpoint_hit = NULL;
-            cause = check_hw_breakpoints(env);
-            if (cause) {
-                debug_exception_env(env, cause);
-            }
-            cpu_loop_exit_noexc(cs);
-        }
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
+        cause = DEBUGCAUSE_DB | (hit->id << DEBUGCAUSE_DBNUM_SHIFT);
     } else {
-        if (cpu_breakpoint_test(cs, env->pc, BP_GDB)
-            || !cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            return;
-        }
+        /* breakpoint */
         if (env->sregs[ICOUNT] == 0xffffffff &&
             xtensa_get_cintlevel(env) < env->sregs[ICOUNTLEVEL]) {
-            debug_exception_env(env, DEBUGCAUSE_IC);
+            cause = DEBUGCAUSE_IC;
         } else {
-            debug_exception_env(env, DEBUGCAUSE_IB);
+            cause = DEBUGCAUSE_IB;
         }
-        cpu_loop_exit_noexc(cs);
     }
+
+    debug_exception_env(env, cause);
+    cpu_loop_exit_noexc(cs);
 }
 
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
-- 
2.43.0


