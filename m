Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67413C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEc0-0004p7-6x; Sun, 05 Jul 2026 00:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbp-0004hu-Mw
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:37 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbj-0003yu-8n
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cad4170e8eso21505505ad.3
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226250; x=1783831050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7F1gvRjgVsXT9ENvQ+iUAk5S2n1vMDcJKaBswrQ8elA=;
 b=VarwjM+Fmsen9q20BoIot5qsK6zelo8BGO3vFzYWfYyjTMqeFjbsqB8MJ+w7zNIXHi
 LbbyY/J9a5un4xI2e1k5EBnl4Mc4eUKPysDmy1PjMIqjbP2EU0aWoZSLkZpw8q0c0RpH
 NpszYF4z3xrGUcKQbcA6n//s6w4hr6bakq+XyZgC5fqVN2G74nD9KWd5HyOCxtGs8fs2
 3CKLI9Nj/4CVitZdQRvD6iN3tigAd21iXG9Ob+orYb01SSdkt0fTcySLdnszy8EsIq2S
 CeIYmESwzuQdYfkMsjPPSYpIh2EF2Bgdyb8kM51a0p3YeBgV5l4+RrBNcj2sWkP9GP3D
 xeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226250; x=1783831050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7F1gvRjgVsXT9ENvQ+iUAk5S2n1vMDcJKaBswrQ8elA=;
 b=H7yKbva/LeHtxLyNqy2LdaMjq2aJNCRyF83M5wS3AnwAA48uprALzpfXgu6gieq92P
 ErkNhbM1e6IUC44+c75VJ5+XuILW8EP/YUhOzKHEwJymzgbnS08Ro3Go/OCoXj9w9g9m
 AKUwtUFSqDATiVSPgPnmDO8xpzCGTYBs80KgyNeMBfO5cPpnlj0InIS0Nwy8fJRZc2lS
 UbS+On0An7S12rUsoNytN9nv90bx1/m5n4s+NO2Eu+OzSd9Z2Vhy3dmPQzik+l+6pkNm
 L15S/M2SFaSupa5EwS9LlcnbCDU8Itk6Ac/H8SXljlSY9l/EWden8+r4p66tZX7Gxhlz
 SuKA==
X-Gm-Message-State: AOJu0YyCp8J3MkKLqfVrroZzAz2zQBeysrmGebKqbQwkkxaCyqQNpkRl
 vFV6IuYIan2ibSQwsEjawr0xUCJO2qjVzqfJbp0piPDqnZLbESTgYBG1AyLn7n0adQ8=
X-Gm-Gg: AfdE7cl39s0oXrGjkkGCVYjCsterYNs/A0oMELZ+sAsYduTBxT3r25JFLeeiMfgsLSs
 AKVAGTV5rQhZwdeoa/o1MZNSwheUMV726QARuXTAXwZ5Sg5146zbx8wFnSOpcwENyXGYe4N/g9L
 GMytxKnpdRqufCG7kMzrQPgJF6Zdl5vKtBA5YJ94zLYY0vZ9qDafpApvhr1ofyISwE74oiySkZk
 3h6u4GE/Lgkin86CgRCNnwLWwfRki93vFO+DKc6CyR3vIi30guQcWCkutTk/+PBfUGmNJocWPN5
 jLl3cQsbojcjWoVfZ4k8eDk/GHEhrli2Wugwa3yYYAysJnk0NbwThJn8YnVWrN+GD+3TE7fepwV
 SxqMkwZGrZzIkYL3o10ZC9icrVwmOQTJLgCIN/o4jeLUcyrAjSFZMGVi/IIxZOjhSseb7kALVkz
 ELkfxWLLKkIEIKwfB2xOqm4sL90nQhvdPKxcUbGDRh9PPXtAU=
X-Received: by 2002:a17:902:d510:b0:2c9:d55d:2d3 with SMTP id
 d9443c01a7336-2cbb9e408b1mr57029315ad.15.1783226249536; 
 Sat, 04 Jul 2026 21:37:29 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 03/46] target/arm: Inline check_watchpoints() in
 arm_debug_check_watchpoint()
Date: Sat,  4 Jul 2026 21:36:42 -0700
Message-ID: <20260705043725.1373137-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

From: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

check_watchpoints() is called once, by arm_debug_check_watchpoint(),
which doesn't do more than this call. Merge both. No logical change
intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260630220100.1289-25-philmd@oss.qualcomm.com>
---
 target/arm/tcg/debug.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 11043ecd58..7171501d40 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -351,28 +351,6 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
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
-        if (bp_wp_matches(cpu, n, true)) {
-            return true;
-        }
-    }
-    return false;
-}
-
 bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -426,8 +404,24 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
      * is also an architectural watchpoint match.
      */
     ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int n;
 
-    return check_watchpoints(cpu);
+    /*
+     * If watchpoints are disabled globally or we can't take debug
+     * exceptions here then watchpoint firings are ignored.
+     */
+    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
+        || !arm_generate_debug_exceptions(env)) {
+        return false;
+    }
+
+    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
+        if (bp_wp_matches(cpu, n, true)) {
+            return true;
+        }
+    }
+    return false;
 }
 
 /*
-- 
2.43.0


