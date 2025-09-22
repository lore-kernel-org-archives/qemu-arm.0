Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D5FCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lhZ-0007Ln-Dm; Mon, 22 Sep 2025 14:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfj-0004l0-GW
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:01 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfG-0004z9-QY
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:57 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b551350adfaso3678746a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567206; x=1759172006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOf+V7iXKEQ87gc87S31iBQI+ufnBC8kf+Au1UAqMt4=;
 b=Uh/2BSn5bPqOh/3OS4tp/PK+c61YPXwhiKukmKdTpUrh1aBS6ZtzojshIHa3k3xxQE
 J7sJGebRkvv625GdgPloeWJme7XT2NrabE9tK4W/RH77MS2zK+YVKv7RUs35BSsnlSU2
 qk3t8Q4AjyidvU4+ZXhRVJZVH53GwJ0mkBEmU/HOddxUuXnkBjBf82ExFJIiEIW0ML8t
 Zf8c5gX8M1wnVvS7X6sq/7lZZDJes548Kb6uwoKhFP3Jfg3B78vLxk/YEMHNz7uGMFim
 kmDbKW1hshVe3mPsl6bZI2TtnVhMJm10WDMQwNQZk8Qiw3qEJqlEsPOZcYwJKkrOc6r8
 prtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567206; x=1759172006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOf+V7iXKEQ87gc87S31iBQI+ufnBC8kf+Au1UAqMt4=;
 b=QzemvR4eum+Temv6NC0H9BPEwx/QBsHSDcvJSKOfXil3jqzi2PSm/NRceBVB1xOZ4R
 FI4zEIZKTW1+WEzCMlrPdst0tSuiS/MoLCGGHTR7s7tTkgOy0X4BOsdD0dX3pVb/aiVi
 yXrar/h0mhiCrFtuhF4kul93AAu5EoBvVh0l4wzPguOhPbAOXFv6gLeV+tK2+0hAC8kv
 Tp/b7szOvCpIZU5K8r5Y/3Zkga7DmiYlwEVUpdPEK1Uh0rS23PsnnW9RUe18skewzuQz
 H7wJwC4LwSZ1rSlQQQnQDCLOYNRKEzJtlrncuXEqiqyiBNlGYDcnJ+cZ60UgsV7XfpJB
 vQuA==
X-Gm-Message-State: AOJu0YyFV5YkRKF/09o6EMulOXHulyW0ju19kjj0ot6CSvXFO27Ln5rI
 3wqp85361PT7XMaLTyombfPCEQur5ghtx6mODO6bMLK5Hmj6UApNtS8AeZ7bumO9+c8=
X-Gm-Gg: ASbGncsK3lf8bpC0eIg3QQs6bSRfoNR29d7tUXnW6mdHlWHjiDDCIXoX70SJCi2hJjf
 MwF0F/HjozPJ7Gc/Lpvp8aW1oa53C+t3+kVJsrGXWFvn4JDlx1eEu5W6crgNSHrklqcPSlOwq9n
 JQhiuR11PVPkMmohSZXD37BCBS8iGM/n4QAhqEmOBXcbW/aqqxNqt4Vi3zRBgpctzbO7tZTrGDB
 Fl4st2uCCvLxaA8NsrhE5hURFW6F6o+HS4tW+xF/+QNMoVwPUC+HRVm8LFzJgxc5O/mLk+m0jvF
 cqfovMiakvY6gNub36cg6b8i2OsR2hCxPxgQERI8EQdXPmCXBI8EM5NBm4AXes4uvGHrqnVQJ5B
 Rwe+dKkDQPbPrypZejGXpNBEAmK/Y
X-Google-Smtp-Source: AGHT+IHCCKV+nnFgyIC4gxg1U5Z6rPO1ZUp5OQwJyINZdG7oNwPgj2yFV1GzH2k9tW8JAB0/DO8lAw==
X-Received: by 2002:a17:902:db0e:b0:24c:ca55:6d90 with SMTP id
 d9443c01a7336-269ba5762dfmr157929885ad.61.1758567206414; 
 Mon, 22 Sep 2025 11:53:26 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 55/76] target/arm: Implement GCSPOPCX
Date: Mon, 22 Sep 2025 11:49:03 -0700
Message-ID: <20250922184924.2754205-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        | 17 +++++++++++
 target/arm/tcg/translate-a64.c | 56 ++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ccf45fd136..6d9145109f 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -52,6 +52,7 @@ enum {
     ARM_CP_GCSPOPM               = 0x0009,
     ARM_CP_GCSPUSHX              = 0x000a,
     ARM_CP_GCSPOPX               = 0x000b,
+    ARM_CP_GCSPOPCX              = 0x000c,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 5b5b895a09..3795bf7f36 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -66,6 +66,19 @@ static CPAccessResult access_gcspushx(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_gcspopcx(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    /* Trap if lock not taken, and enabled. */
+    if (env->pstate & PSTATE_EXLOCK) {
+        int el = arm_current_el(env);
+        if (env->cp15.gcscr_el[el] & GCSCR_EXLOCKEN) {
+            return CP_ACCESS_EXLOCK;
+        }
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSCRE0_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 2,
@@ -120,6 +133,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
       .type = ARM_CP_GCSPUSHX },
+    { .name = "GCSPOPCX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 5,
+      .access = PL1_W, .accessfn = access_gcspopcx, .fgt = FGT_NGCSEPP,
+      .type = ARM_CP_GCSPOPCX },
     { .name = "GCSPOPX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 6,
       .access = PL1_W, .type = ARM_CP_GCSPOPX },
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c1852e2c5d..c601ff790b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2568,6 +2568,54 @@ static void gen_gcspushx(DisasContext *s)
     clear_pstate_bits(PSTATE_EXLOCK);
 }
 
+static void gen_gcspopcx(DisasContext *s)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int spsr_idx = aarch64_banked_spsr_index(s->current_el);
+    int spsr_off = offsetof(CPUARMState, banked_spsr[spsr_idx]);
+    int elr_off = offsetof(CPUARMState, elr_el[s->current_el]);
+    int gcscr_off = offsetof(CPUARMState, cp15.gcscr_el[s->current_el]);
+    int pstate_off = offsetof(CPUARMState, pstate);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp1 = tcg_temp_new_i64();
+    TCGv_i64 tmp2 = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPCX, 31));
+
+    /* The value at top-of-stack must be an exception token. */
+    tcg_gen_qemu_ld_i64(tmp1, gcspr, mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp1, 0b1001, fail_label);
+
+    /* Validate in turn, ELR ... */
+    tcg_gen_addi_i64(addr, gcspr, 8);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_ld_i64(tmp2, tcg_env, elr_off);
+    tcg_gen_brcond_i64(TCG_COND_NE, tmp1, tmp2, fail_label);
+
+    /* ... SPSR ... */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_ld_i64(tmp2, tcg_env, spsr_off);
+    tcg_gen_brcond_i64(TCG_COND_NE, tmp1, tmp2, fail_label);
+
+    /* ... and LR. */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp1, addr, mmuidx, mop);
+    tcg_gen_brcond_i64(TCG_COND_NE, tmp1, cpu_reg(s, 30), fail_label);
+
+    /* Writeback stack pointer after pop. */
+    tcg_gen_addi_i64(gcspr, addr, 8);
+
+    /* PSTATE.EXLOCK = GetCurrentEXLOCKEN(). */
+    tcg_gen_ld_i64(tmp1, tcg_env, gcscr_off);
+    tcg_gen_ld_i64(tmp2, tcg_env, pstate_off);
+    tcg_gen_shri_i64(tmp1, tmp1, ctz64(GCSCR_EXLOCKEN));
+    tcg_gen_deposit_i64(tmp2, tmp2, tmp1, ctz64(PSTATE_EXLOCK), 1);
+    tcg_gen_st_i64(tmp2, tcg_env, pstate_off);
+}
+
 static void gen_gcspopx(DisasContext *s)
 {
     TCGv_i64 gcspr = cpu_gcspr[s->current_el];
@@ -2920,6 +2968,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspushx(s);
         }
         return;
+    case ARM_CP_GCSPOPCX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspopcx(s);
+        }
+        return;
     case ARM_CP_GCSPOPX:
         /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
         if (rt != 31) {
-- 
2.43.0


