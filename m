Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A18ECCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:12:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cD0-0000yT-U6; Wed, 08 Oct 2025 18:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCh-0000Ej-Rl
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCK-0007MO-W9
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:08 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7833765433cso408459b3a.0
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960783; x=1760565583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NNf1WmXSTI58NaZyRuQIPA+gxIE0nBNVq/aWBPGCWw=;
 b=fGmImTrHFR56+GkO8GF5KJzUD+8mNNKYiHtaAbNm3E1hNP+QSUt3/3s3Cc8rJikYlk
 sYUJ+YK2Y6te8a4yE1bs1XjztOudg09uuYzTVh5fpEa9vO56tAfy1CkHaZbO38aHnf2S
 auzES4JPQf+Scmr3b5M7w8OqHeEMYfdV3K6hwjFpJqJuCxRGnHLFxmy1UG1CwcVQBr5Q
 Qo9EBxmaJKxok2jXJQ999vzDkQ82/nt3/GjZIEi0Uj2w/dNwdU8h8k/CbCaJCFrx06Oy
 YqELFvtu4C40DzsvyZTTeEEn+HIfDke2dyN/TUrEkDGbXy5oRTGrVUxz2PNErGNFmXif
 h6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960783; x=1760565583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NNf1WmXSTI58NaZyRuQIPA+gxIE0nBNVq/aWBPGCWw=;
 b=h6AW6/mnVp8RVFPsTX41v4KIx0FQ/HF5wwzqXjA032AEK3SoW4Z4cvNAe8emkiyeP8
 XQBRIfJOmyvxXAtFehaLr+fvtLMJpDRIWheWBRLfcoRHZDKH55aeoEBYzJv2j1UA7mT2
 OdGkAr4mrBWYGx880CvpHoLv2llIs5p1uE5gJPVCalWHlRJhlhxJCLVKtb1126+YloDv
 JMp4xfM0B1kzXk4EMiih5gSq/mBKuMmRclEcK9ulROS0CEYOXl0yPkP9ahoWiGcx3z4s
 qGd8yD/ZcMLVpiOb0iIvh7DRkRU7eWIU1r8krYB0Hg8GFGa8vuDxLSWuiYdMFOUUVf5q
 3mUA==
X-Gm-Message-State: AOJu0YxqAJCY11Hq91OOR6qXbdXNCP/TrDtp+wC0CnkJYVYqRxgo3wfl
 32lKIYTiFVVo6IEHN6khYL6Z5yfIEQ3J0RuL8vqmM6qr7rfr5OXyGsTWeL+/9cmRZFz7NeMz5ia
 NlDwlUQA=
X-Gm-Gg: ASbGncvtVEhBNrLEvXfqJrHOzj5dpOAF0tBO0Vbfa6/tNBpjUKoqZTabRTPOoHU1zlR
 X+RDf1wznJIi/j/up22bSYcYSgSzgluPpjBVJNZN6hoFdCvMZDh3+f6wGoycTvp1QloCfK2I1j4
 e/uxDz6W4NlvfZMvwj2eYBCawqJlWCBCvtCDWeHAhkAuIXPxVcLek4QDbDYqB+au82S7AGPIkad
 yyHwoPYc3ZFYRNZgSmEpdanKldZKG9YXZcGoMaDcZDMrSlveGcqEQfk5AUjTE68L4p9IAlNNndo
 29cejp+DlJZGK//4vVT91XdhF8mgcX/+qGpVmBtr7HH8xOXT/8jRjuivDuCMZOAT5Z0oYrUdgD2
 EKJTKkugZVL/vzfK6YC96r9yfZwJFERBmnS3AGzJzEMFf+6vbxfPLBIiCOYkYTs2GgSg=
X-Google-Smtp-Source: AGHT+IEKraxerr7KDK+J1VWrt0poQ3RDi3rU4y3+Qr918KUA/Rks82Tgq3N3PJjmHnQt92ZDletBZw==
X-Received: by 2002:a05:6a00:92a2:b0:781:16de:cc14 with SMTP id
 d2e1a72fcca58-79387a23b05mr7098570b3a.32.1759960782683; 
 Wed, 08 Oct 2025 14:59:42 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 43/73] target/arm: Introduce delay_exception{_el}
Date: Wed,  8 Oct 2025 14:55:43 -0700
Message-ID: <20251008215613.300150-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Add infrastructure to raise an exception out of line.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 20 +++++++++++++
 target/arm/tcg/translate-a64.c |  2 ++
 target/arm/tcg/translate.c     | 53 ++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 943dfd45fe..9a85ea74db 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -21,9 +21,25 @@ typedef struct DisasLabel {
     target_ulong pc_save;
 } DisasLabel;
 
+/*
+ * Emit an exception call out of line.
+ */
+typedef struct DisasDelayException {
+    struct DisasDelayException *next;
+    TCGLabel *lab;
+    target_long pc_curr;
+    target_long pc_save;
+    int condexec_mask;
+    int condexec_cond;
+    uint32_t excp;
+    uint32_t syn;
+    uint32_t target_el;
+} DisasDelayException;
+
 typedef struct DisasContext {
     DisasContextBase base;
     const ARMISARegisters *isar;
+    DisasDelayException *delay_excp_list;
 
     /* The address of the current instruction being translated. */
     target_ulong pc_curr;
@@ -365,6 +381,10 @@ void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
 void gen_exception_insn(DisasContext *s, target_long pc_diff,
                         int excp, uint32_t syn);
+TCGLabel *delay_exception_el(DisasContext *s, int excp,
+                             uint32_t syn, uint32_t target_el);
+TCGLabel *delay_exception(DisasContext *s, int excp, uint32_t syn);
+void emit_delayed_exceptions(DisasContext *s);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1337e16a96..c037119cdf 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10601,6 +10601,8 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         }
     }
+
+    emit_delayed_exceptions(dc);
 }
 
 const TranslatorOps aarch64_translator_ops = {
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index e62dcc5d85..78d26aac04 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1088,6 +1088,57 @@ void gen_exception_insn(DisasContext *s, target_long pc_diff,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+TCGLabel *delay_exception_el(DisasContext *s, int excp,
+                             uint32_t syn, uint32_t target_el)
+{
+    /* Use tcg_malloc for automatic release on longjmp out of translation. */
+    DisasDelayException *e = tcg_malloc(sizeof(DisasDelayException));
+
+    memset(e, 0, sizeof(*e));
+
+    /* Save enough of the current state to satisfy gen_exception_insn. */
+    e->pc_curr = s->pc_curr;
+    e->pc_save = s->pc_save;
+    if (!s->aarch64) {
+        e->condexec_cond = s->condexec_cond;
+        e->condexec_mask = s->condexec_mask;
+    }
+
+    e->excp = excp;
+    e->syn = syn;
+    e->target_el = target_el;
+
+    e->next = s->delay_excp_list;
+    s->delay_excp_list = e;
+
+    e->lab = gen_new_label();
+    return e->lab;
+}
+
+TCGLabel *delay_exception(DisasContext *s, int excp, uint32_t syn)
+{
+    return delay_exception_el(s, excp, syn, 0);
+}
+
+void emit_delayed_exceptions(DisasContext *s)
+{
+    for (DisasDelayException *e = s->delay_excp_list; e ; e = e->next) {
+        gen_set_label(e->lab);
+
+        /* Restore the insn state to satisfy gen_exception_insn. */
+        s->pc_curr = e->pc_curr;
+        s->pc_save = e->pc_save;
+        s->condexec_cond = e->condexec_cond;
+        s->condexec_mask = e->condexec_mask;
+
+        if (e->target_el) {
+            gen_exception_insn_el(s, 0, e->excp, e->syn, e->target_el);
+        } else {
+            gen_exception_insn(s, 0, e->excp, e->syn);
+        }
+    }
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -6791,6 +6842,8 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
+
+    emit_delayed_exceptions(dc);
 }
 
 static const TranslatorOps arm_translator_ops = {
-- 
2.43.0


