Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D09C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIHN-0005rY-4g; Fri, 10 Jul 2026 16:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFZ-0002MI-C6
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:12 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFK-00011R-K4
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:09 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-84861fc51f5so1243892b3a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716883; x=1784321683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Oi77c4t6mTRvDij0KOLon4zdhMhjLviMYDkRz5tIy7Q=;
 b=xMG8b3H/EZ+V7aRc+e50ajp7Hx3dnazQx79ChhbiMrrL4KMw0H/3jRAMLHPJYxRtBy
 3VwlFkyRpmrHIZMlCWJP85wlzn+kuI8iCAhm36Zxjsa7FrDgfvp0H4fKpz14EbD3/NQU
 n9lMeiXHsCX4m9RY/n68MDV7yOriYd/4hfY+kXGQzC9Gdby7xZW3M2PUphsU6hDzARWU
 dsdmfWDQnE9FGI6gQdhvoqNzSYPIpm9rehj+776KsJqguDk16Zw1uDtA6xQs1qr9hwER
 XECmx2xZSuYN7z/8zWVukspJsLcih9rYmp62Xd+JhdLVY8aoJtBkZ7tKbr2HvKpCOO7I
 9ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716883; x=1784321683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Oi77c4t6mTRvDij0KOLon4zdhMhjLviMYDkRz5tIy7Q=;
 b=cbiddGumOs3jetcCEKjdWRixXE8JAe+QXipAKlZzONWTBCyVkjM2MLIU0k2/KUSXY4
 tdFpCRVpXkWX0imYc9J4oHBuwpj/tHouerl/GYhYwSadHNdNZX7ULLcKN0GyeC1xBM7B
 G6jnJbGGp8sY9fsRl+dA7L1BgmSReC7UWqc7z3ohkWxL7Sd1sfB09bu18JhdOCD9m6WZ
 knceI5oSbqk53hWeka6EpKfObdLYN97Wujh4c0m6Galzewe5wSn3QEFlLRJFYXY9kM2a
 O4R6ZO2KdRV4jWsvVxLWrJPlWW7nQ5tPE4IOML7BwMbptxb6+tlXHAGqtasG23rz43il
 CDIw==
X-Gm-Message-State: AOJu0YzdYlCgkoQ1XSjGDxlwjtBQo1svepmZjexPrnVVzd1woc/r+SE3
 SsktJg+/nKWqAFUfxBMkmEMJd+rm7OfQ4gPXYdFWRZmrW+o91PF6dRNp2A3qTZAKIB0=
X-Gm-Gg: AfdE7ckja/DX+MW9hS9szBYhTXo2hz4NTifAtIayqcbPbtrW2oyMcQlsPIgya9gbY/T
 PnnHdKALkP2WHUxddHC8Pt3hWVGiZiWbC98kEzpQ/kykxs5LoCd7Il/S1MVCmrORYpViYqVocBL
 mTTtlwHzYqle8Pq0OMYv1iBccfi2oeyvfEciWgxhcCxfV9wuuX44zArqFuTNZhUfUr6OhB6clkP
 Z4XJn7tP4ie1ey1F3OuyVnLAx9Oj2PM9VLYsgupsuIFS8+4ccRKRm2J2skqz4Szu6suDmva/4Pa
 XYjouDz+NzcGLS4hzfcMHnrySKUqQwf63lcTQU7SehxMg4hjqF7x8lS7Rq1GC0+EGYaG9CH8GvE
 7A9GD8uqM+BVGr8lykQU7H2oI6T+RC9Q7eOQptLu3rQ+RtpSOvcHfhnM/cfYwemicihl+MQWypx
 Kj0oAyeCOgsyyxPzlfgg==
X-Received: by 2002:a05:6a00:94f5:b0:82f:2b0:2809 with SMTP id
 d2e1a72fcca58-84889637281mr545510b3a.1.1783716882973; 
 Fri, 10 Jul 2026 13:54:42 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 38/51] target/xtensa: Restrict xtensa_breakpoint_handler to
 system mode
Date: Fri, 10 Jul 2026 13:53:48 -0700
Message-ID: <20260710205401.836304-39-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h    | 2 +-
 target/xtensa/cpu.c    | 2 +-
 target/xtensa/helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 663ee23dc4..119a0b8187 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -592,6 +592,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       MemTxResult response, uintptr_t retaddr);
 hwaddr xtensa_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
+void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void xtensa_count_regs(const XtensaConfig *config,
@@ -621,7 +622,6 @@ void xtensa_translate_init(void);
 void xtensa_translate_code(CPUState *cs, TranslationBlock *tb,
                            int *max_insns, vaddr pc, void *host_pc);
 void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
-void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit);
 void xtensa_register_core(XtensaConfigList *node);
 void xtensa_sim_open_console(Chardev *chr);
 void check_interrupts(CPUXtensaState *s);
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 2015a4e3d0..eb6758b694 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -316,7 +316,6 @@ static const TCGCPUOps xtensa_tcg_ops = {
 
     .initialize = xtensa_translate_init,
     .translate_code = xtensa_translate_code,
-    .debug_excp_handler = xtensa_breakpoint_handler,
     .get_tb_cpu_state = xtensa_get_tb_cpu_state,
     .restore_state_to_opc = xtensa_restore_state_to_opc,
     .mmu_index = xtensa_cpu_mmu_index,
@@ -331,6 +330,7 @@ static const TCGCPUOps xtensa_tcg_ops = {
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
     .debug_check_breakpoint = xtensa_debug_check_breakpoint,
+    .debug_excp_handler = xtensa_breakpoint_handler,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 02627ada7c..aa012068de 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -206,6 +206,7 @@ void xtensa_register_core(XtensaConfigList *node)
     g_free((gpointer)type.name);
 }
 
+#ifndef CONFIG_USER_ONLY
 static uint32_t check_hw_breakpoints(CPUXtensaState *env)
 {
     unsigned i;
@@ -249,7 +250,6 @@ void xtensa_breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
     }
 }
 
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
                                     vaddr addr, MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
-- 
2.43.0


