Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A5ACA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXdT-00030M-JU; Thu, 14 Aug 2025 09:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXct-0002I5-An
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:17 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcl-00059g-Ax
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:15 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-76e2e629fc4so1024317b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176643; x=1755781443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlJgHJEmHUYZe6YiGfVDRPRDT1LVN/rOSO+BbVvbmBY=;
 b=ouu7aC72THOs+DwBpub2fCgKW55+N/ig/vNByebe1Hj1YfZ+cI9YOogLmqxS2jKLQJ
 6ypOy1JWY2VOzBLY4dsdBniGz0iqG9g6j5E84vkaXwvl/qVjSCaaNsC1oKzJmDYFUmwn
 X8CFnQttZdxHYBrL245sZDxYTjb4S5teIwpDWlwgGV1nYcyHJLo7smHg9dkR8crGbFUi
 INe8xCqwqMAJQ+jjAvi4fVuzMRCGx+vJdEYseJZCstKoMc8qBuvqFpS9vndAOTNtl8f6
 k6RmlYfJwv+3NAaxlftSbI+dKTlUr45IREs8C1G2LyeeMfWh4+Ufh9fTEfo7cVBnqI98
 NzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176643; x=1755781443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlJgHJEmHUYZe6YiGfVDRPRDT1LVN/rOSO+BbVvbmBY=;
 b=GTGZzGYKTTaMbDopslWQOqb9mi4iiQX+SrzjlhHTE9R9QV6AqhDqEGx2hT+0OpX8Ha
 6i/YFUx7FUE1mpVGJ6C7FDg0fmlX2qRHl5hgNCFD7b+RFfGL/4y+XtL47hHw9J9zHKTy
 MATKUIyLBoS3BFfJcrrlEY7On+ZqzUbUqXMcIhpx0OvBwiTNp+YPshlGw4COk19zIzDE
 l7AEaZW9I7L7EAtSwuBLIVDF2/o1cmlNAssNydmjrYw3f05O4xdVAfl4dI8CQYjNgGfA
 LDoCxCXM3QwG82cHApEXZH53bDicrghsVpv2ITzrzZQInKxtDL2XfTgoitd1VIC211P2
 mKaQ==
X-Gm-Message-State: AOJu0YyOHdm7WxOg+BS1bxC+CSmOAQDPbsJNA8NCqJhs5E+ioRc6t2vo
 L3AHYdC6Oc+/hbiU4zv8r9875FnpaKsiWxazhekSsNq/rdcI7aaEtZbEQX2SMCoSMkY=
X-Gm-Gg: ASbGncuyDJVzwv7nXPOgzfMsS6kRD+wLqVcYmL5UxTEoR99W9BgcZM6SfK3AqlqBO0O
 PZZOmwYAVv+dy0MDExgTTq1cCJHOKCBj8XUI4JppAoSF8eIPM4Ly7w8R/mi5CSND5hwhRXUQ6Iu
 7wHr1adi58Y9aLUXOU+TrzsmZINhzVURMG0SdhJL5qv+xbITjBTgqmSuRg0yataXTh+gwMXytAF
 0j9fPhk9vBjBQCXed4vS+3vC4eGfNc3X9HIUMJcKwL3g0m7L+MI2A4/wfISaLfxKSIiIQszMI1i
 bVkjy1qMpGiJJG/oxxiyElhc9RVWwTNKc9I37SU85+BLTHoB0U37hR6OpLTPQ5QG9DtDGHq4WEO
 hNRxdNF2KGSf49fNtYoPtZ2kKe/UytHVH/mP8PniEPmZmwBk=
X-Google-Smtp-Source: AGHT+IHdz9z1AZIeiDbiBCSmPdmb0jtoHHdcEc3qz3/8wn3c7fQHIDhM8/3vpLiahSc5ynZHBl5SCw==
X-Received: by 2002:a05:6a20:939e:b0:23f:f96c:1197 with SMTP id
 adf61e73a8af0-240bd23bd4cmr5262022637.24.1755176643328; 
 Thu, 14 Aug 2025 06:04:03 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 54/85] target/arm: Introduce delay_exception{_el}
Date: Thu, 14 Aug 2025 22:57:21 +1000
Message-ID: <20250814125752.164107-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
index 1479f5bf74..a40cbd4479 100644
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
index eaeafdf138..d803c10ac7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10411,6 +10411,8 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         }
     }
+
+    emit_delayed_exceptions(dc);
 }
 
 const TranslatorOps aarch64_translator_ops = {
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f7d6d8ce19..c4dd3a747c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1090,6 +1090,57 @@ void gen_exception_insn(DisasContext *s, target_long pc_diff,
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
@@ -8107,6 +8158,8 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
+
+    emit_delayed_exceptions(dc);
 }
 
 static const TranslatorOps arm_translator_ops = {
-- 
2.43.0


