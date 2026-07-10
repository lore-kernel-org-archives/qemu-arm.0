Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AC3C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIEu-0001PG-EQ; Fri, 10 Jul 2026 16:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEq-0001IN-W8
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:25 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEh-0000ft-PP
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:24 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8484f229529so1094062b3a.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716854; x=1784321654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w7mbi44ms/ED7IuWTQq/DSHUQAsdDGZrhybOFw4BdE8=;
 b=Ku7BUNiKjm3IT0HvBzZtYO66oSesFDeHdf6uXzsv+AHHoj458mpIjq0NjlEVwz3kuK
 1NFDByL8GYnlXkU6CAdDL+VvrGlV8n0OlG7iHpXWRQEnH/NBcooM2QDSk7lU2cwI2D5j
 aIzzddcEb5/Qr1wQ2R8j2cQR/Nb+O8DQqx+tFslBQhInlbUnTkF6BQeHCVLbYeMGxWyC
 8g1s/as//YLxMAY6U5blGMds76wPB7TTJs+N+/1zoHgBvxYUhUEiUjFAkqCDjhfbB2T1
 XIxERueJyP6EOfoZxB0T622pwXDzAfBsi5TiqQyshpGG7/wTs2/rc+F15G8Z7jdG6jtk
 96Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716854; x=1784321654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7mbi44ms/ED7IuWTQq/DSHUQAsdDGZrhybOFw4BdE8=;
 b=I8tG/U+/YSvd+jYtaUptmaTCsDu2lHD6+Ti7YCCHBHbWXnuDfIKjOI9ESj28PDElw+
 pz/p8rnygKs3n8sWnqF+vA8eui8yOLWSh1Zcemp1kKBlhLOvdEALFVdZs5IZsvuJTZW5
 d8z4+SpAtOvwWcs7IdEk8CovHPQIZFAeFi/eow3g3Vx5jvkTsACrVLNivQwHIyYVMpOD
 Afv9xWABja60dHnScOnjD9I6oI6BfpJ811xV2TlLou21VqSQJnrgweJQT0kv6vvdm5gZ
 2lqpqXe/MnndgKRY4NEm7VhTVJVz72xaYwUPhV3iEXXUYA/9g7oU2fxqN52ght7BU1Tj
 i/xA==
X-Gm-Message-State: AOJu0YwnAMyQO0UwaNefrLgrUz6+MtD4ad1cy7QkRgpG6II1FmEzrm17
 qqP/8TERw/qxMYNRFH1sQE+43FPFq7b9nn3aSErFarRg4SlPFu2iqHjDNoWCb2nXI3g=
X-Gm-Gg: AfdE7ckoF8y/Hjq1gBEuB/498zRnntRGLcDe5FwMy6RAldWpJkYYCtcEngm7B3vO7rt
 reauj9s3M1k/N6yERxD8D7CC/uBi1xLfLrAcMpKaGyrmxsDPM6yDTSbBkv0aa7YYYXRIq2v7eho
 0cw1TCZ8S18DujEy/3ymJDUoj4n3Sq+zm/pu7M0AFjQtRBMXotpKdj5YySL255BXycJgdDLWH8v
 ojzX5m2R9FSMqG+sSLYLhagClZUhAhvnE3clOYGIvyNeQkKikpt2qfbxGQOfoelq0lRVr1Ye8t8
 UxBab0OSGuP4Dxw+JJ13MHsam2hVLjgBtHBA8dU8rVVsWytSlE85aGzDfu8A4Mgju+OB8kIIwfj
 Zr32pelQkDsuPKsZT5G2vnG3o162KRt2Q717fP3a2KxM7tKGjQHaF5e8LONO1LnRT+o4duewxTc
 dRzuzr9MPeSF1locBf0w==
X-Received: by 2002:a05:6a00:4207:b0:848:68cb:5c74 with SMTP id
 d2e1a72fcca58-848898343a8mr470769b3a.60.1783716853081; 
 Fri, 10 Jul 2026 13:54:13 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 09/51] target/arm: Split is_wp out of bp_wp_matches
Date: Fri, 10 Jul 2026 13:53:19 -0700
Message-ID: <20260710205401.836304-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

This function is only called twice, once for each of
breakpoint and watchpoint.  Hoist the separate bp/wp
code into the respective callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 49 +++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 306106b7e8..519a06fbc7 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -252,41 +252,16 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     return contextidr == (uint32_t)env->cp15.dbgbvr[lbn];
 }
 
-static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
+static bool bp_wp_matches(ARMCPU *cpu, uint64_t cr, int access_el)
 {
     CPUARMState *env = &cpu->env;
-    uint64_t cr;
     int pac, hmc, ssc, wt, lbn;
     /*
      * Note that for watchpoints the check is against the CPU security
      * state, not the S/NS attribute on the offending data access.
      */
     bool is_secure = arm_is_secure(env);
-    int access_el = arm_current_el(env);
 
-    if (is_wp) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-
-        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
-            return false;
-        }
-        cr = env->cp15.dbgwcr[n];
-        if (wp->hitattrs.user) {
-            /*
-             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-             * match watchpoints as if they were accesses done at EL0, even if
-             * the CPU is at EL1 or higher.
-             */
-            access_el = 0;
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-
-        if (!env->cpu_breakpoint[n] || env->cpu_breakpoint[n]->pc != pc) {
-            return false;
-        }
-        cr = env->cp15.dbgbcr[n];
-    }
     /*
      * The WATCHPOINT_HIT flag guarantees us that the watchpoint is
      * enabled and that the address and access type match; for breakpoints
@@ -390,14 +365,16 @@ bool arm_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
      */
 
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
-        if (bp_wp_matches(cpu, n, false)) {
+        if (env->cpu_breakpoint[n] &&
+            env->cpu_breakpoint[n]->pc != pc &&
+            bp_wp_matches(cpu, env->cp15.dbgbcr[n], arm_current_el(env))) {
             return true;
         }
     }
     return false;
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
 {
     /*
      * Called by core code when a CPU watchpoint fires; need to check if this
@@ -417,7 +394,21 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     }
 
     for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        if (bp_wp_matches(cpu, n, true)) {
+        CPUWatchpoint *wp = env->cpu_watchpoint[n];
+        int access_el;
+
+        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
+            continue;
+        }
+
+        /*
+         * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+         * match watchpoints as if they were accesses done at EL0, even if
+         * the CPU is at EL1 or higher.
+         */
+        access_el = (wp->hitattrs.user ? 0 : arm_current_el(env));
+
+        if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
             return true;
         }
     }
-- 
2.43.0


