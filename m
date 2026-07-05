Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332FDC43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:47:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdt-0008Ns-OI; Sun, 05 Jul 2026 00:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcV-0005Hi-7B
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc9-0004Pz-8V
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ca7aaa4b85so15399765ad.3
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226276; x=1783831076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+m7+GFqYgO2mGhurSu+ZocnMlHw4aq+wKZ/1FbPF0Jg=;
 b=tymHrdJFTYtRzM1hbOqJlJNDwhypwEUEdRUQ0QkrYyaQcZm/7MoiE1GX+7gQWlT3TG
 nKVKZxFy/2qIh/8D7hFn+zBoytLmmhPSzTqzCoKdHjx+p2s9j+rdyez7B4itHxVXIWap
 tEnpCt4ZGEo9AYsb00BY8IiF782ZpXonQgJ0pqMLKlU/l/XIeCE5xz569kAY4X6gVpDd
 Jqub64PJunLVjl/DlW6M6fLjOHL6LzCTuOjvU506q3afa4dWZ7Ozh1wMhWLlITXNu+RC
 jfXZQHIB6rzjYP1AYpBWd8Vvy0PBwJmYXZ/6wjfOtAuC+vvKJYo+XEFqzAfZIx3iEJDk
 kQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226276; x=1783831076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+m7+GFqYgO2mGhurSu+ZocnMlHw4aq+wKZ/1FbPF0Jg=;
 b=KKlBsEHZW/Krr+Sh6Ajcrv9eeeq7lPqSXeEfVQ7on3j5u1REav2QgYBs6s9dOXAfZV
 PWA6CxpkjlNV1JRQ4S2ps/gfen4sDQWGcc3QUj7PyZvfbobLj37n9LLVsg8bFcMcMQHC
 cwXP6NnVms5eLYY/kz08ReBdlCCZ4dcbiy6R3bg1S5AXrLXB/XdX1DZr/T2ivwPHUF3J
 qU/jfn80tLE2VrujUoBgh9mB9YAgl/G14NQlDphVs2pMMIZfQHtbjZWWrCNTDFU5UQfX
 VC4M0avPkIfgOdbSHE9K9KcoZNIfdZGyU0v5ppXMP4zhHJvQse+kPjJwS+0dEWnAwhx0
 LIiQ==
X-Gm-Message-State: AOJu0Yzzu29bjnNtFTEofUT98oMa1HX9xUMrqDFAKIUP6uYUryqNKH/f
 ixlRPgIs5mByG4Qt4FhPeHJl112gGEMQG5SIdUS2GGyPqwp3WGyYYbPOrhzMptNN05s=
X-Gm-Gg: AfdE7ckgKqaELomI7PuT498jC4WyP2y9tqXUUtg/mqE3Rr27YQiDg5PiXQwTQ5a6l90
 W4poLoqdZ2GHoueZN3VDovfhuAh3CgMjBGEyT9MWI4HYAt4uGxdhnU5Hdnwj50apu9tA5HQjoU3
 I7oR+tA5Zamf9da9sR7teYmpErljW8HZO8gcYuXr4un9h4itqptaiS5o9iRmV88aDg1OMhTl+4I
 1jj6VEHcFFTH0kdeoLbJpHTEx2TszwAmyMC8TJUfxT3bbrfuuWMwfGWM1+MS4mkTOGP20paH1vN
 NFbkcnJW45p7t5LIg9BgouUfaRmBS4oG+ZELMjsfegyCWQGcuBsGdFhdYY62g9/PQhvbLlDBAYu
 Pw7tlI3LoiS9ejAHGqNj4+MKDDacHL1KGvvjnhqct8BYb3inYUmYx9W68987NOUUKoVFxN1NzX7
 81lObFBecdOXv7RpETs99F0y24kxFpfSOy5W2K4j+dPL2hnHk=
X-Received: by 2002:a17:902:f70e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2cbb9ebea9emr53328415ad.29.1783226275756; 
 Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 34/46] target/i386: Use CPUBreakpoint arg in
 breakpoint_handler
Date: Sat,  4 Jul 2026 21:37:13 -0700
Message-ID: <20260705043725.1373137-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

We no longer need to test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/system/bpt_helper.c | 32 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 5dab77b2c4..86562fc946 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -200,28 +200,22 @@ void breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-    hit = cs->watchpoint_hit;
-    if (hit) {
-        if (hit->flags & BP_CPU) {
-            cs->watchpoint_hit = NULL;
-            if (check_hw_breakpoints(env, hit)) {
-                /*
-                 * FIXME: #DB should be delayed by one instruction if
-                 * INHIBIT_IRQ is set (STI cannot trigger a watchpoint).
-                 * The delayed #DB should also fuse with one generated
-                 * by ICEBP (aka INT1).
-                 */
-                raise_exception(env, EXCP01_DB);
-            } else {
-                cpu_loop_exit_noexc(cs);
-            }
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
+        if (!check_hw_breakpoints(env, hit)) {
+            cpu_loop_exit_noexc(cs);
         }
+        /*
+         * FIXME: #DB should be delayed by one instruction if
+         * INHIBIT_IRQ is set (STI cannot trigger a watchpoint).
+         * The delayed #DB should also fuse with one generated
+         * by ICEBP (aka INT1).
+         */
     } else {
-        if (cpu_breakpoint_test(cs, env->eip, BP_CPU)) {
-            check_hw_breakpoints(env, NULL);
-            raise_exception(env, EXCP01_DB);
-        }
+        /* breakpoint */
+        check_hw_breakpoints(env, NULL);
     }
+    raise_exception(env, EXCP01_DB);
 }
 
 target_ulong helper_get_dr(CPUX86State *env, int reg)
-- 
2.43.0


