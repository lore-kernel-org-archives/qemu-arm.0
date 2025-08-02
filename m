Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77880C87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLpX-0000AU-6S; Sat, 02 Aug 2025 19:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLn0-0003xX-O6
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:23 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmz-0005s7-09
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:22 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-741a0ec1a05so316186a34.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177840; x=1754782640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlJgHJEmHUYZe6YiGfVDRPRDT1LVN/rOSO+BbVvbmBY=;
 b=mMvL+atL40EcvhCjB9g6Ckn5/EgwJ6r+dvrSv5cS7t8zMtE6F78SK+x36hHJvpjMTt
 l5/zmDpTUd1b3LrVeX0TGRW8wyX3Ij2E2249dN+2ZgNmcHdO0xO6aD+y3QweAfHpLpu5
 HlQ3w9UvNflfx0lS6mDQD2uGFI9Hr0j5QYSwu4wvVpFAlPvozPFl2BLOiFBDpXLLvZoN
 BAdJ19z2y3Id8EEWrPvR0k3hL4mTkxKcFulB8+bE9miOAKOMyl9/2dlSjkSxUixfxb0u
 LKATGmzpkE0pkU6VdNOmEjR8qOhYIOo4Dvhr5kgcN5dWGLSFgRW7k9djgijeN8DDxhJL
 MPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177840; x=1754782640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlJgHJEmHUYZe6YiGfVDRPRDT1LVN/rOSO+BbVvbmBY=;
 b=ccJsAAOpQh58ixfW4Sj+lUQi9U7kw6FZl4P9XK1sbk9LFg2UEV/jY7OgSytZ4aQhKI
 QFDtpOSx6zYUKxKh+rVvuScnb6JwaEoaOaj9VXv7768tBSPlo7XRwPI1Pg8LzYhc3Jy0
 C87Kuo+13QkMO7PbYHfNGgo4GcuD+4yR/E2OyYKXbYZUB3qBz1Ti9CExvJ3V0QCA0hzq
 lH3UptsRRN2isUiDJxQ4naqqKmoPPwb4raIJCcIeihOOL3gF3wuHOzPU3Drpi02UniT2
 P10UK+fKSsmddj3mJsMppUTO9zzhR+f3IlWShC9zqdRBvFGq0VAP5K6wyK9qu1IAkcHi
 rKTA==
X-Gm-Message-State: AOJu0YxQgsW+FLbPdEPOZvK8xBdTKlEYrooTxIY/FAtYznKY2E+D4Tl/
 sV8E/mXJLl9Ctw/RFuP/f4L+tGfbEayPmFboBzK3JPGYjQC8eZ7MfcXryFK9ZduqMM6HTi1KVc9
 ylnOoG5U=
X-Gm-Gg: ASbGnctGMR+4cb2y1+arQVgtfi+lKIu/raLKaqTa2WQnvY3zANaffW60hu3a00gn7yH
 a8i0MdGixcdk5n2XTi3/0uri2p6as776dokXtQK4agSrTzRjgYGckMd0rhudIlv//QTUL+tCoRD
 RxgPDjw39NmuTR1dXM6doX7U15wBV3/PI8jNN38qmqE8oYShByFs+vnRAzisuBe5oWUbCmxuhi2
 /GgCKDvSDiC26wGqUeNlV1mNzBThP5A+1NRa0/MfZ3VrOeprGnC+/oz/1CawabFG5mR1P5qXQBm
 xCkWIrt2ce48qUQaYR45ZJSfpyZ0CXUQ2HNj3v/BXd9tG3z/WllDV+8TiVB9ku42d0e9fhkFJxg
 2/7n2ztXlGdAT0E8Z0KgDJF0xkq5LugrhzSEmDGMhontQ57UyXIrX
X-Google-Smtp-Source: AGHT+IEiADQITXKqrTtvLpkKeLd5ZP/13dXIR55ECySImnxNRI6Oo9cZt9NLGVlU4Oy/Vl5eB89F0g==
X-Received: by 2002:a05:6830:448f:b0:73e:6313:3fdf with SMTP id
 46e09a7af769-7419d284629mr2472616a34.16.1754177839784; 
 Sat, 02 Aug 2025 16:37:19 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 54/85] target/arm: Introduce delay_exception{_el}
Date: Sun,  3 Aug 2025 09:29:22 +1000
Message-ID: <20250802232953.413294-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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


