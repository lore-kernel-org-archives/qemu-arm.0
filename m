Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3233DC44500
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:48:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEfH-0003ng-7D; Sun, 05 Jul 2026 00:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfD-0003ZC-NG
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:07 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfA-0006Mb-Iw
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-845b6d9bf39so1505798b3a.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226463; x=1783831263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOV8aDWsylX+EDtzAiDKgexQev8L9FW7a3sm5qjjMIQ=;
 b=avUGdVEwbvgjvlnKg3ADV1XlbnAaTdKPJsdUe63hwqLVfeYjqcp3mTTPzl0SX6Fmtu
 f3BmzBg/MhYeqPWrKiADxUlqrDEB034aZ49Gfd0cE+qozv76+kQ2lUCMfM4vow7PzIvx
 mNAXf0pcWZ1JyUNY3cWiU0ViqmD9jcwwowSQ3oFcQEDQAvx/rDUlliymHHjLMAvwscEi
 cyedorcfkHEeXLPZJ4QoCWAp3nXIZygoAicCbiCamYMx6WFcxlf8IIOsqAsHp+Kgdtu9
 HBBpe1+mmSkY+jTGKlIAkSjHGCO87u1ucQZlL4ham3fE76oPyGoNaYBeIUe8vdkPHn7p
 AM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226463; x=1783831263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOV8aDWsylX+EDtzAiDKgexQev8L9FW7a3sm5qjjMIQ=;
 b=sTAUvamDHB1tBqznSXbLpMIXDx8Q6TUu9FBWw0tjQo3KCe/BEu9QL35iTyzqLC63vQ
 sXOzxQD7GOsSaDMj6pU4LAq9I9I/BJ7X5N+IHC2W1udsYJ7bAr/2LapUMJPmhnsnDQUq
 2dqxpsYGUKRlq4mvFtV5WNj+865Cv/18H+5YlQ5+smmzA78L7H1D4shm6Jhi46SDBvoj
 wKp30BrpD2nKcGtfQIIYvBw7BH4S1y8HIaWoWZwitPQSFN17h8GLLJB9Gs45hadFah15
 69swSHEfVUFIZVCcy0J+eZVuXJFMMY33SnEOeYxxcOTjInKPiwIoCNCnKK2kPSV9hKf3
 /PDQ==
X-Gm-Message-State: AOJu0YxxNeM0kxGOj7Bz7+S8KRoLeYdR8lch0zYY2JHTSzL4wtTdAK3+
 ehLQ7S4BDiU98c8sONBa4pR+6LaGNnsopXLJV2gAmb1z33+r2csLdU491B+X1wZvLR4=
X-Gm-Gg: AfdE7clZ9r+Os11nEsyTGfN/gZ0ztx6Bx6djCtvAU20bk8UgVwj4n5rx8V4vwb8zQTu
 0RznirHoKqup1JdKRzVR+r1p6cU6zIhaOi0h6bIEV1FKB6Fxt9DWoD9/5cY4C4h/HJafL2q93Td
 eTJuUxH2opJ9GSj2WJCWNMrOUWjEbvf5qbB4KNWQEm/FhUBFpwq2PFRyyRamfOpXwB4N8bsrIBG
 GiTk3F+RcL19ViFUZFqTnbSjQO1eeQNOCmBNERKeuRA/FVaXQ143rYijqx/VOMDAhqIbMo2VyaF
 AW2tSCYd4Dzy7ANUigIp81C82Y/dR5o5Hwizgbp9keCqmz3GjlO3euNS4c8mDdh6JwC7DJjeJ0p
 z5h6PSuQOaO28x9NTe1awAYoSD661w3PE5iVFbu/0TtKm3D2HLT1onfDFtV+ciCyQnJo6xLyZyY
 MFacz1TYaJXTL9GGRuqm5DcH1UcwkqHDN/nj8cjLhuzMwC5fI=
X-Received: by 2002:a05:6a00:94ed:b0:847:8704:1c57 with SMTP id
 d2e1a72fcca58-847f871b1ebmr4284173b3a.31.1783226462959; 
 Sat, 04 Jul 2026 21:41:02 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 41/46] target/riscv: Merge riscv_cpu_debug_check_{break,
 watch}point
Date: Sat,  4 Jul 2026 21:37:20 -0700
Message-ID: <20260705043725.1373137-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

These functions are identical.  Rename to
riscv_cpu_debug_check_bp_wp and install in both target hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.h       |  3 +--
 target/riscv/debug.c       | 12 +-----------
 target/riscv/tcg/tcg-cpu.c |  4 ++--
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 540835f2d0..fbe6898718 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -144,8 +144,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 target_ulong tinfo_csr_read(CPURISCVState *env);
 
 void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit);
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp);
+bool riscv_cpu_debug_check_bp_wp(CPUState *cs, CPUBreakpoint *bp);
 
 void riscv_trigger_realize(CPURISCVState *env);
 void riscv_trigger_unrealize(CPURISCVState *env);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index f4689519d8..803418f390 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -923,7 +923,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
     do_trigger_action(env, DBG_ACTION_BP);
 }
 
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
+bool riscv_cpu_debug_check_bp_wp(CPUState *cs, CPUBreakpoint *bp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -933,16 +933,6 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     return trigger_common_match(env, trigger_type, i);
 }
 
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    int i = wp->id;
-    trigger_type_t trigger_type = get_trigger_type(env, i);
-
-    return trigger_common_match(env, trigger_type, i);
-}
-
 void riscv_trigger_realize(CPURISCVState *env)
 {
     int i;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b73e3e9dd4..3701aa6c94 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -292,8 +292,8 @@ const TCGCPUOps riscv_tcg_ops = {
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
     .debug_excp_handler = riscv_cpu_debug_excp_handler,
-    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
-    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
+    .debug_check_breakpoint = riscv_cpu_debug_check_bp_wp,
+    .debug_check_watchpoint = riscv_cpu_debug_check_bp_wp,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.43.0


