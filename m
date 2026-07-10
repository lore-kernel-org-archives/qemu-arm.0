Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3B1C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:58:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIGa-0003xz-IZ; Fri, 10 Jul 2026 16:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFH-0001pJ-8K
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEz-0000uw-U7
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8454160043aso1457445b3a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716872; x=1784321672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fJfbDIS/fYFApYI9j0z0r2WuLwyv5LpJL3k4ywDcnyc=;
 b=SeHFvCoXjE7Jg1AehseZZU+EqahgL0momPEmMUmADwADeFg6rqb/q6gzQB1Q7VNKV6
 xWZInx24FKUz1aIsJ/3qXqo9nzqGboRJ6XPJpeweiQNwf17hTJ1fXqIZFvUdbmAmD0hU
 WEQEsKsNXezC4U9tAYOMlB63HXQDqkvtXjRZrQ9iNP/oU2lFnfp6S+Eow1ER8nzYzcbl
 MMMRmIFSLWayxyDBs9IT+uaJGWgZ1igCw4LS3zx3svRJQQrI2VcGzj0468mTnoRR4nEZ
 Co/UYfj9rr/eez1MckLhhGbEfQ7Eeo88A2RPjb/U5o9Ml1MTj0esgW58yvazOSE6e4aQ
 7dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716872; x=1784321672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fJfbDIS/fYFApYI9j0z0r2WuLwyv5LpJL3k4ywDcnyc=;
 b=HzUN+iH02yPRlirE1DunJi8Q6vtwI/VQbV0+vCDByKzcADudxSJCWvubyTuuhjQe9A
 AlH2aRgMTwpHomA2aGpZ5POixINHTmFnQf6qFZCCDFguByO1dnv4FHdTChvTGhAe1n43
 Q9B93ZORIJ8AoZHurLjnkRJurn5bkqFF6k/Z8JdTnbqyILg1jAqniTRQKbZqRpjw5Kek
 pKzvN5X4qD9pyEqVkru4BnPVqVA5kXRaNikjMTJD49uSUu/qdXTup7bEN2MQ7KFY/WPf
 3nP5Sz3he5wf08eC32KepDmn0QgQVgkr/gfeHMYCCSsph0LjekyBR4YFIYV7yxhHXOC0
 GP3A==
X-Gm-Message-State: AOJu0Yy1gAhumibZ64OnPX5hJAOdAJ+8MN8okLPSxUWZYyDojIZNuYwB
 gKV6UExXNzi6QkVX0swvGvTH7H+JQPDwzFEDc5SJdxsieEqeJrvck2bEZNzk0N8/WBg=
X-Gm-Gg: AfdE7cmeXyJ+aSnIgwxc4rOzt/AbM8Pi5KuffQqv4Kg7d62h4tkWS1SLZ3Eb+IAI1BV
 /TzOtZw8ol/ulI4SkF/xZJsvIwMUldBMNzQ4S+/aWuAPDeqclvqXeNOpTl72tP8H1LcVgtPBy6J
 UByZve5lpJvmhh87XgC7PneY9lJyBkK8rGk+G4RxJZTZDL6dqk+V4ehDHSZE+VtnzGlrJ76RjBt
 IIHCMWvnSbo1aP7Cr9kvduqH8M0ytFryUfkfkLWQYuCwdEo5zlaL98F6cofFsyhwTVHaROk3gbi
 hDAguL5FX4rLjgsxvXzFspdykvuTsjfvpYRVA2Km6GBoue4MHQw2OlpaV+DYfdZy3BAWF7BXdNB
 H4hHQ/aURjgZLMeTYT7xaIg/LenDIsHeUH/utasHnsX+GSsQlZeKcshvxRWn84b+MrJlrKWFymg
 yUmazOChkMeyTYqWsum+Kl3+SnlsmX
X-Received: by 2002:a05:6a00:18a0:b0:848:6720:6fec with SMTP id
 d2e1a72fcca58-8488965c1fbmr568684b3a.28.1783716872552; 
 Fri, 10 Jul 2026 13:54:32 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 27/51] accel/tcg: Pass breakpoint hit to debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:37 -0700
Message-ID: <20260710205401.836304-28-richard.henderson@linaro.org>
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

Record the CPUBreakpoint in check_for_breakpoints_slow,
into a new CPUState field, so that the as-yet unconverted
target debug_excp_handler functions won't see it.

Only call debug_excp_handler for BP_CPU, and clear the
CPUState fields after the call.  This will allow these
actions to be dropped from the target hook.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  1 +
 accel/tcg/cpu-exec.c  | 32 +++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3986e43f84..1a42940d92 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -526,6 +526,7 @@ struct CPUState {
     /* ice debug support */
     IntervalTreeRoot breakpoints;
     IntervalTreeRoot watchpoints;
+    CPUBreakpoint *breakpoint_hit;
     CPUBreakpoint *watchpoint_hit;
 
     void *opaque;
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 3205f365e5..a4eb1f1c31 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -363,6 +363,10 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
     return false;
 
  found:
+    bp->hitaddr = pc;
+    bp->hitlast = pc;
+    bp->hitattrs = MEMTXATTRS_UNSPECIFIED;
+    cpu->breakpoint_hit = bp;
     cpu->exception_index = EXCP_DEBUG;
     return true;
 }
@@ -681,19 +685,29 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
-    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
-    IntervalTreeNode *n;
+    CPUBreakpoint *hit = cpu->watchpoint_hit;
 
-    for (n = interval_tree_iter_first(&cpu->watchpoints, 0, -1); n;
-         n = interval_tree_iter_next(n, 0, -1)) {
-        CPUBreakpoint *wp = container_of(n, CPUBreakpoint, itree);
-        if (wp != cpu->watchpoint_hit) {
-            wp->flags &= ~BP_WATCHPOINT_HIT;
+    if (hit) {
+        IntervalTreeNode *n;
+
+        for (n = interval_tree_iter_first(&cpu->watchpoints, 0, -1); n;
+             n = interval_tree_iter_next(n, 0, -1)) {
+            CPUBreakpoint *wp = container_of(n, CPUBreakpoint, itree);
+            if (wp != hit) {
+                wp->flags &= ~BP_WATCHPOINT_HIT;
+            }
+        }
+    } else {
+        hit = cpu->breakpoint_hit;
+        if (!hit) {
+            return;
         }
     }
 
-    if (tcg_ops->debug_excp_handler) {
-        tcg_ops->debug_excp_handler(cpu, cpu->watchpoint_hit);
+    if (hit->flags & BP_CPU) {
+        cpu->cc->tcg_ops->debug_excp_handler(cpu, hit);
+        cpu->watchpoint_hit = NULL;
+        cpu->breakpoint_hit = NULL;
     }
 }
 
-- 
2.43.0


