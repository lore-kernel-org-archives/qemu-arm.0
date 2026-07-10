Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF54CC44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIIH-0000ZV-4W; Fri, 10 Jul 2026 16:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIE-0000Oh-7h
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:57:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiII7-0001rb-97
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:57:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so17309015ad.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717066; x=1784321866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YsP83YiTkmrY79bbOPi3SHoXW0ymWPjIg1hBoCFHly8=;
 b=RdvFuxcTnbZ3OJWmJ+PaH7OfNa+Bfvu2HkBTv6hwbjHj3Mq28kQ78MUsORNEjl9a8C
 2EqAeS9hehk/06H3lOR++sledon+jSPK7LVamiIHDXsjIEG7CDHvdIZzzTk9psXlR8Qd
 RnfvRmCyF7ApAL3LudSI+5J8Fb7UDa1jfR2ATMSabkXe6rr56LGtu5hXzPRnd6K8EG2v
 2zUlfKidINd1G0rY32gqNR1P37aYgKlMO51Thuoh0ImzPHG889uyEVBLtW1Y7QwUKWDI
 5h2VX4rPX1rF7kBUbdBT0nqZb+bVnhS+FAK0vJgnYJX7DVVAusuE4Ob4NCmaZusEgUrl
 710A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717066; x=1784321866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YsP83YiTkmrY79bbOPi3SHoXW0ymWPjIg1hBoCFHly8=;
 b=Zogkrefhrq1M8q4zAemgDXLYqj0tlDCKhUX202l/BHObdnrihEdjG3CO6YFz6ihVON
 7wPyoMR5VmwNOJ/VBudPBkuKhivYCrKux1JutcCW99jJk0VAtjPiiQkS+zl9UagGNTCf
 JsEdRlniY8IpOBazetxv27A/s61IuMFc/kZ1IHg9k6pOx76E9TGZgXidCuuAW+8VioIQ
 xPbkzokRZg9rvwExOU6yG/vfzLoPJ7B1E6naIxRHNQLuXV5swOm2yyE0WzyhaV/aBomq
 s8gEe6sMkyi7YzOx41HmY8TKQgL4r+zjlt+6qGhbZoKgbMDj2amcf1+AMuVmVNOVIgCY
 YZtg==
X-Gm-Message-State: AOJu0Yztutz9538X7xLXvxftHEWUJAru8EYprCi8hE1fj2tlPhVw93IJ
 nYckAt15zc/eXxQ5xhX/z4QBnTdBjBuUzVYqYvW8LLrkx2cOGbNpeznCYW/ff/6XDe8=
X-Gm-Gg: AfdE7cl92a288Uv0EJ0l85BTrC6IYdKuPurf59V8RuBTz1NzwQpCvXuCWXYC6no9uCb
 K0t6BeL30ji1n8iRShztp8SVu2vpk2zJ8r9KFvc1q7JDFjp91PojEggHToyRUxPcRCe0/7mta12
 9G6SZmgTFU4XSVM5f136orDUXDJ4tWkdt8vE3vjwpZG3HnkyV+vGMsZRkUbbbZ8f41ex0nBtEGU
 jp0F88oTyjupzmuQclpEn7X9YfLWIDzaw4+IIsW0Dpl8v2ak14KJYyRHoJFxfSb/FLh5eTzr2Oa
 oAdEgu/6hB5mYEs7U+CNTMudn7ZEaVSi8qlBOd1++zyzl8GMZt/lOzm+I0/itOyu4OLo7GBe1z2
 u6Y7IY10Drdl5jKXjCgIBwL0Wc3toDQ1LNnWhR6q5iTnLSwB/4hSru6Q88A/v9oe9SVCEDkmYrx
 OwNyUs9caVQRnZfM/eeQ==
X-Received: by 2002:a17:90b:33c8:b0:387:e0db:3fb1 with SMTP id
 98e67ed59e1d1-38dc77993c3mr526112a91.42.1783717065807; 
 Fri, 10 Jul 2026 13:57:45 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 41/51] accel/tcg: Clear BP_WATCHPOINT_HIT after use
Date: Fri, 10 Jul 2026 13:53:51 -0700
Message-ID: <20260710205401.836304-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
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
index a4eb1f1c31..68d434fff4 100644
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
index b36e957b95..c78fb330c4 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -170,6 +170,8 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
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


