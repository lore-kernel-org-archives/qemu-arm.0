Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEAFC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:00:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIID-0000Kx-34; Fri, 10 Jul 2026 16:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIA-00008Z-Ds
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:57:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiII6-0001r2-Ks
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:57:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-381018b9375so1737995a91.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717065; x=1784321865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=NCElr68YS9piSHtJUMjfvpqYzpoHGLcEBEJLrndO+kjGtoPbbclWiPUxqUwYl04lFw
 pptH5MGygnufRYYyuZOrPYQuWNA+uDuOVQrjWRWbcatrOUg0gQj1iljOvWDAcV+yiOJQ
 g8pxlbQXCtAfimrWOJXCJX7SMMfGPc2BSJMqRjpe/s8vsaldXMF8+6BkF5amg4ipeITu
 gAmR1GHTX7Cn3EQpmaqMCZ0WG1jXMdT7gRwyAPs+5jGpv3nu89V9eSjEEiT43IyHYU4V
 aMM/1ZRbqPIDlFalf28tNDhtgTf0k8gb1/Bu7TLHxdEA+EIZrLNncKF/iiD6yJXjVr1P
 4V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717065; x=1784321865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Z8VyrlNOS3AtUzlV7fFAEANc3KY/TwCjUicBVUQopA=;
 b=rE0OSMgWKdpF5BnFBDY/1I+RUafxUeUmJupONhX/3xcrL7VxEmJuN0bpGoGov98OTp
 yQYBXjzZ6QhfOIx0vZuyDu2z0QXrIbO9I3albLk+nYpYDcjdNpv4xqAXgZL5Kehc9UnG
 mA59PGAP9jzMDMoHhEyXmu78jyxiqJgNsHTWpd8ihYUkXtexSZBvLU6jdsGqOdhEcT3u
 SorC2B+5HnPp7cHVpx1iFaKgxTU1OeoICj1ytRupTEtR2y9N0dK3hzS46h2LAzl2Hr1u
 RxawrBxTpZzdFy6MptD2+9MyLnhV0LJ4XPzM4Xa1huVIM0d0TbEvBT0tuyxGL0ft19xF
 wobw==
X-Gm-Message-State: AOJu0Yzrop/JETO/tuRCiOwlS/KzheoHpf3gKIHnt9+SQBqv8yxuRO/y
 C4h1afQDPFPv+WpQclFCR+3AlNjiJ1c7HilovQs9LXvyM5lVct+aI+C39Qh8h+0DULkFeGemVJB
 jWfRt
X-Gm-Gg: AfdE7cmeD7rOSTj2oWySiJ3rv6EZol/yRNJSRqvtSOY5DLnyCSpuR2/I6Tdjrm7JzM9
 Y984srrTsAa3ku/wvTbm4ZjAROZYCm+TX55g/8E5wSry17WzSPJbwjm0r+Hv3q0EZQT8lwXRVYK
 ZCVHDHziBrOnwRBIkeFBNaRYW/AbImQZKTsaN8wbitZGikHBl1ZBgBIvup10k3SkoBpoSIwsI7X
 Q9pQgYKaJIGV2bjIm/QDDxggxswkusfJMzJic4HeP552sLI/d4mGB3KLLOQEnxjA0/St3W2Mvgd
 5kd2d+5MqzFS4f1hdhwqfprIro/4aaU0ApI4l53Vv/8irXVemZXO/7fBR+mk70gkNeIrad2dEHM
 CQdWPVour/PuBWgSptd1rfPQh5J9Cd64Ulo0v8NL47n0Q7kZi6HsQp8lLTgkoJIi87kF3qqGFI5
 1MP9QFs4/0kXCvIhHaLw==
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id
 98e67ed59e1d1-38dc77badd3mr469550a91.38.1783717065021; 
 Fri, 10 Jul 2026 13:57:45 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 40/51] target/xtensa: Simplify xtensa_cpu_debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:50 -0700
Message-ID: <20260710205401.836304-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


