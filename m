Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA45C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:44:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEd1-00069q-Fi; Sun, 05 Jul 2026 00:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc5-0004tB-Nu
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbs-00049U-G3
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:53 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cc8e87f29bso217865ad.2
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226259; x=1783831059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7mbi44ms/ED7IuWTQq/DSHUQAsdDGZrhybOFw4BdE8=;
 b=iEKZLirlbx6EzYgwl0W8B/1/lWKXaiPAzjwJHFe/UR3eKdY/NSes7qgSqSeppOGKHp
 j7YmAysDzpMZgoZc9rVodTbzl0EfR27B/QwcpJMxgac3jHQhTN9cKL5TeO/X1uk6cx7M
 gbDjOUfsHEDYuV/TzepRSQom5XL4Kmzq7YZjdf1QAxDZDR+MkZqfZaZgDZLuoFEhrZW9
 e7Rc2owe1ZS/bJWvJYBF01Xk49D0HWr1cF5rL7U4MRCs7Lme+nzxJr8sRrFhlRzK8aA6
 pwVczkwWNpWOBkWZqw/6zJN481YfPF4nf+3SlPuiNYqLo4fuq+vEJ4hW9p6Rvecq9aTu
 zl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226259; x=1783831059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w7mbi44ms/ED7IuWTQq/DSHUQAsdDGZrhybOFw4BdE8=;
 b=o8evJ3nvB8mF0pKsAHOkbugrPpwb6XKW0SQdIPdXB4R77S697hMho+AjM6xnfldx3W
 oRleQoA/d0M20p8VmHZjstH2il05GljMjlGOoFSCF1Z58gALvnMsYuoUCB7BY6muYRNG
 f+adT9KC79yDWN2ylEWmdOECmaHOb+kRr+FE52AN6JeLye7oaFr2UQ230+EZSS5fUIYK
 KD4omgZiAAoMPtaCkbFdVCsuq2XKlX4aGG7X/9E0PrGWPqsjM8FaEDW+EYnj5rEOjjTI
 TbfW+7p4MerfRE8oToRijKjEnHLDieDorC0mbB+IvMzY+A28SyJovXBY3rjMO8Pf8vmp
 G5Dg==
X-Gm-Message-State: AOJu0YwmROd/ti67cGg+WigXfTyumjSKcaAbWctsgqNPB4PnmGojiEta
 h0T7+EjS+9+AcqkC3FpEFrU5w7XbANg2pVa4TTF1DLJCOy0+YI61lR+PiNQ9ibCn+/I=
X-Gm-Gg: AfdE7clCwuaGcZE3YHGFWj/iiTEpLah1j0qWTDIkOvxHxylRPT2dLZusKa321K2LuB9
 v5giqXgQMjD2Lpv3PPew48JhvJfIcRck9LRZf17W1gUEJ9XvlDj5zme86mZ4/GTiBI0ovHWVmP+
 xtuqJjFFK5+x3BkCtjnr4R62jAnuqQJuFpZtdrCU/nU4LrJ/XhsLY/l37nfXKmsnKLyztEmmK4E
 pcPpZZcOAbaKVBRNsFP257h9Wy8Q4XvoXtiJtfFM4R5twoGHrduagKUAzgQP/u/Z/MrLP1nuvvu
 XXce9kG7U3oqrd0uNFMjFEh3zWC56iUQKMx4Mly0H/BmAflOtXxvsj6MyXln3/GGw3WUq7oEQQi
 syd+DL20EIXnqDmpQDX3RyuKyvH40y8I8WXKCEMjjhawQaHDBQ+ulvddQsK6ayIjhVrvmGT63y9
 q1SM4rI6C4uGBnqBkM1Lr6CWh0pqZWcFaH9+B+h9VT3YyCS0w=
X-Received: by 2002:a17:903:230f:b0:2cc:7759:ffac with SMTP id
 d9443c01a7336-2cc775a0dd7mr29035405ad.30.1783226258807; 
 Sat, 04 Jul 2026 21:37:38 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 13/46] target/arm: Split is_wp out of bp_wp_matches
Date: Sat,  4 Jul 2026 21:36:52 -0700
Message-ID: <20260705043725.1373137-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


