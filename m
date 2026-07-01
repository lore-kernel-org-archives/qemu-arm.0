Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9988C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welGC-00067C-Mg; Tue, 30 Jun 2026 23:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFz-0005ka-Jo
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:05:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFw-0002rp-AK
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:59 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c9b19bbaefso1094025ad.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875095; x=1783479895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+veytKPeE5iu1XxgyNuqXet47JTcpmbvbPWcEYyJFIs=;
 b=j1VUpn4J+uZrOzKrbQ5ghYAwiF5dJqnE4XljJoLFJ8b+liuCbrGtRntnXNBYwjHT/K
 BpZYvkhQOpYvtOjwwF7lQDMOVn2DgxQNryq3oa1esUt0usiszd+cfYnAqsTVHOMnsCBp
 a5INQgI29za+75r5M5p9YnUX8T/S8kziDF3oosUJ1Aspt11P5dNBnGXMrQztKVPKp0dY
 RWOEgIeEetJepOiurSL9iPGAJcxrHi8k/j/qvgLhPypI27zg7vttdYQa5xyLdDUfsO+7
 GRY3MIiqrUlYXD8UgJmSVcJDayNg3YZoy/rhVUXdrLYn2VDW4oZ2Uo1N6+1aZ+LyWgxW
 ZxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875095; x=1783479895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+veytKPeE5iu1XxgyNuqXet47JTcpmbvbPWcEYyJFIs=;
 b=AfCldtFQlAEDcEUXhXOy71Nk4kU65g9YA2P6pdJ0kR/Px+cKDdqnDPBFZ8GGANvHSH
 KUjhzR+YM+vOlf54peNlw2du4eIE1vOtFKXKu1ePBMnBgfQCM8+YoD+TFW3jOUYxEuI4
 mhP0CBGTwQ+ENFnZ4PIF0NDVgMpzXy+eLVvB46eKbOtSxpQb8AzE5zKXSDqaQNrY6rWs
 eolj7gLRrdQLDjdEMa7FgBCnCtYStIgZUA/apEiZtGXqSs0v+3mh+DG6kc23BYl4y2x0
 i95sgMSgOtkXZwsskzWLTKDamqgRHe0MP5JjR1W6T9k7/abh6IfF9wsQRQk8LcaMi2fM
 pQUQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqapHDPRpOlfT4bE7bDJH1R2gk7JneoT14Pdo2xfQs0Z+stYvu2E8lHFXE3psko7kIjsY8kSIimVA==@nongnu.org
X-Gm-Message-State: AOJu0YxuENixZ43llirqr/GwiiSqv8LiRGyon4gVBUqamXR2uRuQGpTA
 et/VQmHYzmCnXgyp74t0uCqfYEQeOd1598/UKreoLK8BPE+EuyV0u5Rj+VFGZY/+7fM=
X-Gm-Gg: AfdE7cm2tHXaZl+IyAJ8h3CS/Sd0W/6vGH2MFeYO7Lk1ZPX3cwUiyjnAXpZ5XpW39uR
 pjiYMl5lNY1WYxxj0W28OHxbTIbyMMt9GyrYsXeXf3WXGa1woz/1Wm93ddWZyLoFO2runntJhjP
 gsSyaF/pZIEshZFLJNaWgVQQYPWXYqLIkREkEHG4s8D2Rg2PedctHUEPTU3iIQV2NofGaFvyE3w
 dFZXjpygAE/YpGyIbZdx2EopRdLpPAi66EKvV/Q1fA9XdcbZhNS8Mj1oM5shQ4IQ/vsNRUyX5NF
 5ytfqe/pOHE7J8n+8jGP1/rfls0f9fusWMWEHGHE9Q0AwQQKfcNJN9vloXmJW/AIEfNXoh8QPTZ
 2XA0MDaAiCVPN53bWKGJ0xMXIoU/0wAVszE6WV0BswWVWda2CHwgr6oe7LCwdrQ5bW13E1I6GaV
 pVRE8dN8xurXbLxpP4HKJZkMptWqr+wfOyGoJNQAx2NQsyuyyaW5v/Qq1GcEtv
X-Received: by 2002:a17:903:b07:b0:2c9:97a7:71b0 with SMTP id
 d9443c01a7336-2ca2ec2ad02mr49090785ad.43.1782875094644; 
 Tue, 30 Jun 2026 20:04:54 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 12/17] target/arm: Use wp argument in
 arm_debug_check_watchpoint
Date: Tue, 30 Jun 2026 20:04:38 -0700
Message-ID: <20260701030443.1382447-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Merge check_watchpoints and drop the loop over all watchpoints.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 43 +++++++++---------------------------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index fc63d35d98..e87020de90 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -326,39 +326,6 @@ static bool bp_wp_matches(ARMCPU *cpu, uint64_t cr, int access_el)
     return true;
 }
 
-static bool check_watchpoints(ARMCPU *cpu)
-{
-    CPUARMState *env = &cpu->env;
-    int n;
-
-    /*
-     * If watchpoints are disabled globally or we can't take debug
-     * exceptions here then watchpoint firings are ignored.
-     */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-
-        if (wp && (wp->flags & BP_WATCHPOINT_HIT)) {
-            /*
-             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-             * match watchpoints as if they were accesses done at EL0, even if
-             * the CPU is at EL1 or higher.
-             */
-            int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
-
-            if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
-
 bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -407,8 +374,16 @@ bool arm_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
      * is also an architectural watchpoint match.
      */
     ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int n = wp->flags >> BP_CPU_ID_SHIFT;
+    /*
+     * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+     * match watchpoints as if they were accesses done at EL0, even if
+     * the CPU is at EL1 or higher.
+     */
+    int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
 
-    return check_watchpoints(cpu);
+    return bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el);
 }
 
 /*
-- 
2.43.0


