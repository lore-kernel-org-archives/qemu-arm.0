Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B55C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIEw-0001Sp-Ph; Fri, 10 Jul 2026 16:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEs-0001Kt-Ml
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:26 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEj-0000hI-RJ
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:26 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-848882fdb18so343337b3a.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716856; x=1784321656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w/QoPchMBLEoPNwVaZS+xZRRFREK+x04Oz5t5RgPWdc=;
 b=rgkDTkn0Y+9/6Nn+FPyMWXO4uSIZPxT4gEsY4xpSzturGI55L4CUa5rW/P4HLO/54y
 C30G332YoPuMUXgft2UzrdF4T2vjun4wCAKW2PSH7dQsn9B5djkXnG0KJIb2F4+kKDML
 jTYq8Xu5eOVgAkGmy4lsyYa8YvQ+ABd8vpUxOb3w5o/yYHlZNFlaJka9Kt9+ZcQrZP+e
 OsohNbojeUYR0wiRMCVj7Gtdjvq9VRW8uo7rBUr1FXAzi3yaSN7wOrBtkm6kee4imMJr
 +sbr3ctHbk3k1wjBl215kqvUfyJUK26ep34q7Nkbyg+NZIlD9c9MvgZGk83/0JmpZH17
 kWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716856; x=1784321656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w/QoPchMBLEoPNwVaZS+xZRRFREK+x04Oz5t5RgPWdc=;
 b=s/n/AqgCEsbGy0ZblVb0+u4/jjFmsdT/0Su6dT9VkwVu3QPfF+lpmxQpLa4BizbQvQ
 E1Lrx6KDoiDIk+Yw+0D4HfZxL9yGgcDYTIAtTjqE+D1FBPPUBlmR0e8JbaTd0CPyD81o
 emWOYo/gmeyb4BW5QT79CBE84QQrX7EnLNzSYT3OSpLt3KkY9YjzxQ24s7OQOmFI2Hbf
 /RVj9j5+U/J30zu5l8atRiTnqsd280iZWLU77SqxtBwp3DGYq+bjAI+n3LBbbW1sbx5x
 i8LvgCeMvEA/EX+9thcyj362lRJx9+GvHVQ38WIe6e30PRpieRaPmul4nL+Apq6NCIO3
 739w==
X-Gm-Message-State: AOJu0YxGNVhTRLrLEXywetpRAkt+TG34PislaqUYdHnL41sqGE+0HzyD
 0o44WPSERb7nXWrq/KvcIfzMRkVEQDAaSucB7Z9qjRnakm3QCNW5C0RsgQmp9vRdpZY=
X-Gm-Gg: AfdE7cmZInB8Fe6UZs8JInxh3+J0/pXysxhjAXHfAIT6pFBI4D04hiwR+Vk5Nnkaz00
 BnxYUBF1nRmnuEnQF74U56kg3cVVIr0/tAJ5C6erQeE0uUREnT0jkph82vkO/qcWNb4YI/x/jjh
 TSFFuoql7BNL+fQXa+CDgXoVVSzIeeA7Yqr2YSh7DRGw+oWbMVkO6a09JSabBM2qtAl8yuB2uXy
 IpS6F4xve8oJBeVDsGoPOYB6xaK6OwP208R+ZQzn8kHGu1r5YHsCWyG5v2K0eKSsspqaBpU05Hs
 xWPG1EnkuVJZm5NclPknk2Q6SGv78VOWkK49fGmj/MRFk87iygWdPr9A1VIiclVGKPJ0WhNvB26
 71eGiD/DTee7mc68qO2M8a0mVjvFyIG7v8WskOblNVVa01g1k+rGKzIfINLsMq+kbJKVwaOYG1s
 G8vPp7ROSd1id1I1wj+A==
X-Received: by 2002:a05:6a00:1a8c:b0:848:75a1:a0fe with SMTP id
 d2e1a72fcca58-8488964a85fmr496369b3a.18.1783716855939; 
 Fri, 10 Jul 2026 13:54:15 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 11/51] target/arm: Use wp argument in
 arm_debug_check_watchpoint
Date: Fri, 10 Jul 2026 13:53:21 -0700
Message-ID: <20260710205401.836304-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Use the matched watchpoint instead of looping over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 2389830b2a..daad2ac440 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -365,7 +365,7 @@ bool arm_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     return bp_wp_matches(cpu, env->cp15.dbgbcr[bp->id], arm_current_el(env));
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 {
     /*
      * Called by core code when a CPU watchpoint fires; need to check if this
@@ -373,37 +373,14 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    int n;
-
     /*
-     * If watchpoints are disabled globally or we can't take debug
-     * exceptions here then watchpoint firings are ignored.
+     * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+     * match watchpoints as if they were accesses done at EL0, even if
+     * the CPU is at EL1 or higher.
      */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
+    int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
 
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-        int access_el;
-
-        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
-            continue;
-        }
-
-        /*
-         * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-         * match watchpoints as if they were accesses done at EL0, even if
-         * the CPU is at EL1 or higher.
-         */
-        access_el = (wp->hitattrs.user ? 0 : arm_current_el(env));
-
-        if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
-            return true;
-        }
-    }
-    return false;
+    return bp_wp_matches(cpu, env->cp15.dbgwcr[wp->id], access_el);
 }
 
 /*
-- 
2.43.0


