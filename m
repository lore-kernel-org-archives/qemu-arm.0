Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD85C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEfK-0003wj-6V; Sun, 05 Jul 2026 00:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfH-0003pi-TU
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEfE-0006P0-Hr
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:41:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-84592b55832so1646695b3a.3
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226467; x=1783831267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSQn5AB1CNws1Obey85q6NalNpdc96132v00m/ICH9U=;
 b=LZor4ZPS8oGX0xHyGykbQeDESnVnORXI9Ytf1MuLIVYeV8/1wxwCZJqT1jIvv56rxJ
 LUxaT/fagmRbgmhsClji0TqmkROEH18zwCXC3KmhFlKkOMdpLblAJzJ8tbj7voy4PBqe
 RcbgLB2HSD1/RfrKSFXNRurSe/U0RYxLNGBvjTKif5Y7RRmEs5wgdUc3ASAyzKAUWI4O
 R/Wx66Eco8b7cXc4lLEeDr7uytr0ETpFz5zpiKFTJOtCBNNRd2QMG+9WmupkKtI520Z4
 HZbA7dZyDb1oMhKCCQh19JIT/4PHTQqbqp7Gon/E1OCctmJngcA3qvGuZ8doD2wFuhth
 NsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226467; x=1783831267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NSQn5AB1CNws1Obey85q6NalNpdc96132v00m/ICH9U=;
 b=E8ZrMaoWTy55ozKTxW2UVYpBe4phSuRnUpWl3pQ6oZ0rhkGFent7sPRKZk5+EeDoGa
 4QtUQxt3ERucFsFZoj9GjeBL22ZBbD0XSPwmodFGConK0zUN6F27zQRvuKBqRIydxFDU
 3C5UGZUCpWpqtF4VWRyKT0vE7QWu2ghhpVu/0b1Y/n/bYqA7fUpsEUVSoNjqSTLGJMWg
 5ASyR5kzivCxgJ6KmJb02huYyeuFN9cFnwzSUjxi+8XkbGR3QVBWBf+ZkeXy3Uc+XzEB
 qcUQDdAcBfnYp+y+APdsIJYS4dUicEn5oM38Sl/i+oiseUUpR14Ub8nzmnIb7LEMCfxZ
 VhhQ==
X-Gm-Message-State: AOJu0YxbgA8Y0zjIF1+mGghrgah6Rbs+TZBOOvnMeDS9Agwupcv4U6zB
 BQwRy99+UiMFhvGydGdVjGcS6vo95/qDmXX/WxakVcKAiIETZXQOcMq9oGPNU6oNsFo=
X-Gm-Gg: AfdE7cl1GjrEkSRDkx+6xrBxgOoep9ZlJp/siwk6bWPPCUfRCJXnABKgXf0tI/soc6z
 pLikpMtzsmS50rZRumOCPfZwtdgG6GkGJLwOdy6mUrkC/PwIuOwqEEeQ1gFgAZkBQskhbghgbMZ
 pdyHY8AaPqGETSYgxZAgFQdh3ms4/rVVJOvW78Wo5GUpFjEfpZYOWWidTJlkW6TASnk7Zz2NpEK
 FiXfxz+kd1AK2t8oGYwYK0rRxhPVOnm6CL6bmd0H2Jg4nTZU3jtoKzweWJJLJi97lNCEMnCLvJf
 PcUlFH/ejG9HHaDXuLZBSLkM8cqpDX7/BnmiLeZluOlEDPX0FOwj8pG3LrEVEHqhgzJOe5x4NTH
 hyaCaYhmgPk7Q0IGWx+GIN7LawevQ5r2Is0GoUEhVAgAehKAdYkksPK3/uRQ4wdDQ9rcYl48zzE
 9HSLMxlUggqYwWKHQncmps0AkjEsMDy0QGIxal/PWGF5ujXkHjcfeWIrMPzg==
X-Received: by 2002:a05:6a00:10c5:b0:845:d274:bf94 with SMTP id
 d2e1a72fcca58-847f7010c5cmr4745455b3a.61.1783226467018; 
 Sat, 04 Jul 2026 21:41:07 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6952a0dsm1952615b3a.0.2026.07.04.21.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:41:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 45/46] accel/tcg: Clear BP_WATCHPOINT_HIT after use
Date: Sat,  4 Jul 2026 21:37:24 -0700
Message-ID: <20260705043725.1373137-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Now that all targets have been converted to use the
debug_excp_handler, and no longer clear watchpoint_hit
themselves, we can clear BP_WATCHPOINT_HIT after the
single usage.  This avoids a loop over all watchpoints.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 23 ++++-------------------
 gdbstub/system.c     |  2 ++
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index bda6dd9e46..c1e4cdbc19 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -685,27 +685,12 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
-    CPUBreakpoint *hit = cpu->watchpoint_hit;
+    CPUBreakpoint *hit = cpu->watchpoint_hit ? : cpu->breakpoint_hit;
 
-    if (hit) {
-        IntervalTreeNode *n;
-
-        for (n = interval_tree_iter_first(&cpu->watchpoints, 0, -1); n;
-             n = interval_tree_iter_next(n, 0, -1)) {
-            CPUBreakpoint *wp = container_of(n, CPUBreakpoint, itree);
-            if (wp != hit) {
-                wp->flags &= ~BP_WATCHPOINT_HIT;
-            }
-        }
-    } else {
-        hit = cpu->breakpoint_hit;
-        if (!hit) {
-            return;
-        }
-    }
-
-    if (hit->flags & BP_CPU) {
+    if (hit && hit->flags & BP_CPU) {
         cpu->cc->tcg_ops->debug_excp_handler(cpu, hit);
+
+        hit->flags &= ~BP_WATCHPOINT_HIT;
         cpu->watchpoint_hit = NULL;
         cpu->breakpoint_hit = NULL;
     }
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 017585187f..cbb72be33b 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -169,6 +169,8 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
             g_string_printf(buf, "T%02xthread:%s;%swatch:%" VADDR_PRIx ";",
                             GDB_SIGNAL_TRAP, tid->str, type,
                             cpu->watchpoint_hit->hitaddr);
+
+            cpu->watchpoint_hit->flags &= ~BP_WATCHPOINT_HIT;
             cpu->watchpoint_hit = NULL;
             goto send_packet;
         } else {
-- 
2.43.0


