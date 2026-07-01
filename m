Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2482C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welG4-0005pp-7I; Tue, 30 Jun 2026 23:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFs-0005gN-S8
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:52 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFo-0002nR-EQ
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c821a50615so953365ad.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875087; x=1783479887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKzv/F+MqToZ/Pnc1grvNtlQkuB0Qopo7yaWf0hhW0E=;
 b=cDDbxA21tkTrtoGG70KF/788xMOol/1Ju3+fdPW900iy1NVYUfEByVhOXA0737XHr4
 FYAdM62vo7woJLLlYWulkBHAimuDQnpxaWP6Gj3zHfgiQiVzHVC5r6c9JfoMn2lEgHYo
 3Drc4I+zVu4Sv0nhYYb15DRQMMYJ7Lzw7f8vbe+HSdK0DX6zc4lTUhEOZ3YzPYX71wOX
 vTLhU8MvCqti4FLSQOlNNPOtnuhMZihDt/Tcbh4GfAGdR6nNMTQyW16G4SgmEw9cVWNy
 PO7Cs6FXo4a2Tupvkm7we/Ov8YvvzN8JUbCrNhDxKoL8k4CpfgtdKw4Ll6PM6Nzl9LQK
 ibQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875087; x=1783479887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eKzv/F+MqToZ/Pnc1grvNtlQkuB0Qopo7yaWf0hhW0E=;
 b=n6kmXw/GU7jjAVJ7R0FjkgR2a02CHWlosCvK5atiYn7pDPMsZaHw48lHw3Pt/8yRlh
 LUOo46oypq7RznD+hptwzXfFqxluvQzpx7LaG4anhJP7DquPuF6OuZ4u8UfjBylDw6j2
 o04oIPRymhlkt6VWouf9nLEaycKfnwdpEqn160YYd6c2xVqXzhFbVZbJHQUcQ6e316On
 iKKUVPtW9mjUdteh5frPfeP1Y9QdZTjIkdiMU0QQa1YPtGb6chyLWeZELqDObxnfAfox
 LgyG3J7rW1O6ZOrLe24W+YJchW5GWJ+XkR41xd2MA3pzsJVEsfnHewjm3YrT+O8Xb1Hb
 A2nA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpP6rJrdvrU4pba3ocqFZujFu24u9NSdQYomyi8t4nHV5PYaM9b8yhQUjws5B+H/2/FT4aYhhUj7A==@nongnu.org
X-Gm-Message-State: AOJu0YyrrbAwZvmf5OTc5lzCDIL8aXYbl4gyA5Wryx/lXkvP6swOU1MF
 tA/C8WMELYTB+fdZPOHGsyJxPfb1nDO+7UXjG2JnGM6iv1eMJAbxuMNjRfrZGWBhr/Q=
X-Gm-Gg: AfdE7cmm5N36GQpwtdcDqnkI99sD7OLTI8tPdXbfrzeUcqlXgu0vcO4lIZclrs4rRpQ
 /tgktvmdgEbtcAMZ1xZeKB5H9Kz1M4/MUHpDvSvbVKrMpO0yS/bzyiIl+2EUmyssTN7OXcZkGSP
 Dm22OZ6B9nzMuUibdR7GLujEcSD1FNI+augPTw3j5DHZ9UcbzUeZvS8CrvTG6D7LqZe2Ltaeit3
 28vaxKH1QSaRFL3BjjhrrFqaF+6PgAmcZ9iA6GQn/1IprXx/pjsshQS4G85y1pA9gG1FeN98XtC
 o7SsY88Lsszg2QnXdjNyhIdEhtNR3rjpsfI69bH7ziRx7oOx8QUM3kdgeOrHu9QDCN+gB5Ox7/z
 bQt/kK37qpIR5eicfxUwlLOJpd+gDvWMvDfyYaICt/7MlTe9j3KGKFQAmXBYB8pi5pPd1QDDIol
 Q9vUy7x/hb8ZExH6lyhkTbG3wALJ29Usie932vBh0Menw5pBUBM/XL4r09tze/
X-Received: by 2002:a17:902:eccd:b0:2ca:6514:9201 with SMTP id
 d9443c01a7336-2ca6514ad48mr18691595ad.15.1782875086705; 
 Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 02/17] accel/tcg: Constify CPUWatchpoint for
 debug_check_watchpoint
Date: Tue, 30 Jun 2026 20:04:28 -0700
Message-ID: <20260701030443.1382447-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/cpu-ops.h  | 2 +-
 target/arm/internals.h       | 2 +-
 target/ppc/internal.h        | 2 +-
 target/riscv/debug.h         | 2 +-
 target/arm/tcg/debug.c       | 2 +-
 target/ppc/tcg-excp_helper.c | 2 +-
 target/riscv/debug.c         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index d2b9079835..1e163176f7 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -259,7 +259,7 @@ struct TCGCPUOps {
      * watchpoint whose address has matched should really fire, used by ARM
      * and RISC-V
      */
-    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
+    bool (*debug_check_watchpoint)(CPUState *cpu, const CPUWatchpoint *wp);
 
     /**
      * @debug_check_breakpoint: return true if the architectural
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c78c86a1fc..7a4f6938b7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -683,7 +683,7 @@ void hw_breakpoint_update_all(ARMCPU *cpu);
 bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
 
 /* Callback function for checking if a watchpoint should trigger. */
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+bool arm_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp);
 
 /* Adjust addresses (in BE32 mode) before testing against watchpoint
  * addresses.
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index f3e694c4cd..fd089ebba5 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -305,7 +305,7 @@ void ppc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    MemTxResult response, uintptr_t retaddr);
 void ppc_cpu_debug_excp_handler(CPUState *cs);
 bool ppc_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
-bool ppc_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+bool ppc_cpu_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp);
 
 G_NORETURN void powerpc_checkstop(CPUPPCState *env, const char *reason);
 void powerpc_excp(PowerPCCPU *cpu, int excp);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 91690404df..230d517f01 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -145,7 +145,7 @@ target_ulong tinfo_csr_read(CPURISCVState *env);
 
 void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp);
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp);
 
 void riscv_trigger_realize(CPURISCVState *env);
 void riscv_trigger_reset_hold(CPURISCVState *env);
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 565af7b985..ed94b20739 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -419,7 +419,7 @@ bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
     return false;
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+bool arm_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
 {
     /*
      * Called by core code when a CPU watchpoint fires; need to check if this
diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 7715cae342..7fbedbc8e3 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -358,7 +358,7 @@ bool ppc_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
     return false;
 }
 
-bool ppc_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+bool ppc_cpu_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 1acec77caa..ad9df09cf7 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -983,7 +983,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
     return false;
 }
 
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-- 
2.43.0


