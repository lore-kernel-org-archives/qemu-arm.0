Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3CCCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:56:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lgJ-0005y6-7n; Mon, 22 Sep 2025 14:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfV-000403-7T
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfC-0004xE-SN
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-269639879c3so47714915ad.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567198; x=1759171998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSuK61F+DOMY4zp/EHxX3Vza3zAy1L/d4c+YvNNK7Ak=;
 b=IKqT+rwmRddl+Thw1Hhv5jd2EnNoTKTtuYBU3EfMqHekAm3cYN1sNPcSzKH+U2rKbe
 GArIcusYpmTcZ3MyHsfbLq8cxzwcuW1/P2R8mtvMYKD0gGJAAGBEOTSN9PQbl29bd4lB
 2zfqyk+abwS1oUsQx0XgK7IDfbA5daqkFXwy7yhAxKxPoUKnn6DBPy9oMWLYH7Z2tNlj
 1aUM4MF08N+fw0M6AfWowmEzs2v3OddBGvLfP9s2/KYWI0YfLboW778PZ/JAEY6o1ZjS
 qTb8c5lMir5mv73Ka4BlQsNq+T/YlAuA/H1DbgIz7d6P3jVl6YV3i0KynlTrKj+s7Txp
 i5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567198; x=1759171998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NSuK61F+DOMY4zp/EHxX3Vza3zAy1L/d4c+YvNNK7Ak=;
 b=sz6yZuXNC5mY+eDDpQUxA4GWsgjufsrIhkq0y56mRLeiToVoWaX5h7L60t2b6864+h
 am3actBQ3QeSs0hb28+EYkDjcWfx4MuyYPk4YULj5o9FWuizSQCERhtsq3MivnODz3qt
 fhpx5r7IIcGVVy3DAMBeROKKOxofG/lGcKZ7HGPKDZVeD23ZDk435TyEJxXkx9Ey4EzP
 gwfJAUoQDP4gCXc0X3l8+qwkP04V/bt+PbTLmE0df2asdeSXbOl1KByZpkWYSmfWlslg
 EK3xv74IP7j78XUon7LUwk8hUbdIk7+2yB5p3jlVSYPZ59vbMX3N+LGEZo6+iV1ln+Tv
 WpLw==
X-Gm-Message-State: AOJu0YyzWdSrHlCExYGZzxNZ2RJ4vDUuzX2jL169iw7vws5/7721w+GW
 2NsdrWAlt5WfPIEfVT7za8R/aPBMq5ylXE1lMm+rnfnMe6EiwgFxW47hbBngsXc3PnM=
X-Gm-Gg: ASbGnctfxNbjlR8Mork1MtgC2dNa12hj9CWlFAql57M9ZR6+s7QwDXK2SKdpPqw+eiL
 UtIdhCmRcnbme0a4YsC4zZ/9dhC0uqx00DI0cwUNSCvHNeAP2BI3mIfRDO7bNTxJDEYv5Dcj72B
 HHcrGphBmitdwvNaCbKhsw7tdTanLgELi/9H2S9qiiQ+Hfhogi0mAfJK+3/zJIGDPHqI7fAVqi9
 fRcGDXKmgJKkKeXgYQitMKZEzSS1ZxW0taGfGhh/O5/TO0GvM4nFlvqoC6bzEjT72qXCwbZTk/z
 bDi7hlgJ9Dp5AeuVBB9RSuQfzB5Ys+V7wbKsP1ZK3yFrLO+qrC2te9g+zzYLcuLdKa1xyTVFxNr
 wZMJYhIAtheP2yonCLU+2If4o8Q5D
X-Google-Smtp-Source: AGHT+IEfvJc1KvQSu2JFdu4C7BiqxOZhjhLsle7gaCspFDvVzh4CaeGLf1sQkd6DaTjigMhii2lN2A==
X-Received: by 2002:a17:902:e550:b0:272:2bf1:6a21 with SMTP id
 d9443c01a7336-2722bf16e99mr126364845ad.14.1758567198268; 
 Mon, 22 Sep 2025 11:53:18 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 46/76] target/arm: Introduce delay_exception{_el}
Date: Mon, 22 Sep 2025 11:48:54 -0700
Message-ID: <20250922184924.2754205-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
index f0331830b5..d607a0afd6 100644
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


