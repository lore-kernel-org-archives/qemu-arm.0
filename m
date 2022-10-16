Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1969256ejn;
        Sun, 16 Oct 2022 15:11:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YTh9XTOlLhQc88yc3cJ6c1bOUkV6z+0GrbW9MPhe3PzaLqG39BZ/2ONP03kVGyPneYUs1
X-Received: by 2002:ac8:5c45:0:b0:39c:dcea:c552 with SMTP id j5-20020ac85c45000000b0039cdceac552mr6393383qtj.128.1665958304110;
        Sun, 16 Oct 2022 15:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958304; cv=none;
        d=google.com; s=arc-20160816;
        b=v0nHpkCHKUfT/qSmf7puAJFgbNuTFmtgNAaEuTELygIsLqf9jlXeI07YAqpM3ZIBOJ
         FyeLP9YkzivKT3gOYYvZFFZLuUo3EAwyf9BqqBYOhBDJR88SHYJZSSQ9levqASpZmOrU
         YOAyoqXvtRBLfNJSdVY8+VaCyQys/6uNyzOc7tCTG5I+OPpTK4kQh2qYOIs/wCY/GMfg
         l3j/1zmeXW4zQdfoM8t9Ni84l3Okam/DV2KGwMhc4yKxo0CFbAU4iEHdUU9MG+JYe9Yi
         ueLxt8PcsNyuDbEoNQSdRDQfOUILlHwuzNspc10ionzNmWLuzfJQpFcNP9YKZD5SLM/k
         dmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KRC0PQi4FuPYcvWsXmno1zqo2C9efqzFcFomIVhlMdI=;
        b=wZNpudJOVw94/52q5Qghzi9kpyaleDPI1S3KqAfYwkp52QxRRRToZynA/AluGV+LgM
         xs3Ox3+bsaz4bBTReNsjIySC+/nJEfIpZ0ckyTPh4M225QnKTrgV/oxnCVFTY1xKnOEA
         I6cxQtUSaiJvh414tk0ZswnOruneOE14G07DBLQ/MwFRgm+NGwgV3XUes0ZC2W0iksxW
         SHxgIYHzdQW0JVu26qSkbsuRxsw6QwN/JkdjuhOtn7cw5iedGsj36ASK52A92MRdi05k
         GLjzurVJ9oSNggb4pgbcar+gcFLBYjoGbW70k1Q+EruNzOHMu0MIf5qkfnJjjJzTz1ZB
         tDng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHBUtIyv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05622a055100b0039cd4ff1224si5304153qtx.683.2022.10.16.15.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHBUtIyv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBrD-0002Jw-B6
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpt-0002FE-B0
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpr-0007hF-60
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id 70so9414665pjo.4
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRC0PQi4FuPYcvWsXmno1zqo2C9efqzFcFomIVhlMdI=;
 b=qHBUtIyv44tKcozQMEVdk3B8rSq+3Lmd0EXhAC2HCVo8YCRa9PXtOf3aeIwOwa9BVq
 KH/W0KN2Gp6SkO892sse47RD8jQGvkjOkTLEh46Ic3X2xhlus8mHQHHTFQd7Q5HSyU+j
 f9MrGBcAzJcLh1gV/0bAfxv2Z6jZJxxWcjkkzsQEmxooPg39+j3oxD1fcSgdEtFdZWOB
 HZtQBzMf7FZ4781DE7rq0aH0eI6NzRXBT7lxS1zey9/3VWOUrqeEn/Briy3yPPZhDbdM
 +iTNI0FJh1gYtIFUMuwSZPiukSh9RTUw+esLcrOnORrd9yuDG42zFFEjjTzDY8PxmT2O
 U14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRC0PQi4FuPYcvWsXmno1zqo2C9efqzFcFomIVhlMdI=;
 b=aGIUKaqQ/wCZD54ynWcXBVBLuKCGYDhGkvwm2zDy1EzPZvZyQueu34NzVITEBJoSr/
 DaYXGeXxowyjgovUD5XXFoTZLwYyIc9jOg1WHYUzachzxK08kgCxKgrrlYGhCWIhaexz
 Eoy+LDoWt1yZ4KcUxTL+oHJhMHsRk1gYHMmwgrxfOFMlbTx+vDrQC+dmB2ikgGgt6Tiw
 ezWidmje8XNXKTYuv87y9U+ts+Voj9TBteHBLHL16JW6MhMyVQdRHsGVKFgksANeLQsG
 vpn6+DGZ6kNFg8P/B5L+r0nwdBRuuUXKiJ2n3JkvlUZ7trEeAI4JjskBDb8p/Pqdjh1l
 cYwg==
X-Gm-Message-State: ACrzQf1pj/y8q/a9EltVxXJurNE2kO/lP5NbmhjjMMLUnIir6/L1BuqW
 OxurZaJ7zq3aC499nTudpGUAuA==
X-Received: by 2002:a17:90b:33cf:b0:20d:981a:a5b4 with SMTP id
 lk15-20020a17090b33cf00b0020d981aa5b4mr26883288pjb.137.1665958217809; 
 Sun, 16 Oct 2022 15:10:17 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 2/9] target/arm: Change gen_goto_tb to work on displacements
Date: Mon, 17 Oct 2022 08:09:25 +1000
Message-Id: <20221016220932.274260-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xFH6z4zwKlif

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
 target/arm/translate.c     | 10 ++++++----
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5b67375f4e..6a372ed184 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -370,8 +370,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
     return translator_use_goto_tb(&s->base, dest);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
+static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
 {
+    uint64_t dest = s->pc_curr + diff;
+
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
@@ -1354,7 +1356,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
+    int64_t diff = sextract32(insn, 0, 26) * 4;
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
@@ -1363,7 +1365,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, addr);
+    gen_goto_tb(s, 0, diff);
 }
 
 /* Compare and branch (immediate)
@@ -1375,14 +1377,14 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int sf, op, rt;
-    uint64_t addr;
+    int64_t diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     sf = extract32(insn, 31, 1);
     op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
     rt = extract32(insn, 0, 5);
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
 
     tcg_cmp = read_cpu_reg(s, rt, sf);
     label_match = gen_new_label();
@@ -1391,9 +1393,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
 
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Test and branch (immediate)
@@ -1405,13 +1407,13 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int bit_pos, op, rt;
-    uint64_t addr;
+    int64_t diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
     op = extract32(insn, 24, 1); /* 0: TBZ; 1: TBNZ */
-    addr = s->pc_curr + sextract32(insn, 5, 14) * 4;
+    diff = sextract32(insn, 5, 14) * 4;
     rt = extract32(insn, 0, 5);
 
     tcg_cmp = tcg_temp_new_i64();
@@ -1422,9 +1424,9 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
     tcg_temp_free_i64(tcg_cmp);
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Conditional branch (immediate)
@@ -1436,13 +1438,13 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int cond;
-    uint64_t addr;
+    int64_t diff;
 
     if ((insn & (1 << 4)) || (insn & (1 << 24))) {
         unallocated_encoding(s);
         return;
     }
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
     cond = extract32(insn, 0, 4);
 
     reset_btype(s);
@@ -1450,12 +1452,12 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
         /* genuinely conditional branches */
         TCGLabel *label_match = gen_new_label();
         arm_gen_test_cc(cond, label_match);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         gen_set_label(label_match);
-        gen_goto_tb(s, 1, addr);
+        gen_goto_tb(s, 1, diff);
     } else {
         /* 0xe and 0xf are both "always" conditions */
-        gen_goto_tb(s, 0, addr);
+        gen_goto_tb(s, 0, diff);
     }
 }
 
@@ -1629,7 +1631,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         reset_btype(s);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     case 7: /* SB */
@@ -1641,7 +1643,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * MB and end the TB instead.
          */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     default:
@@ -14947,7 +14949,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, 4);
             break;
         default:
         case DISAS_UPDATE_EXIT:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5752b7af5c..ae30c26ca4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2590,8 +2590,10 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *s, int n, int diff)
 {
+    target_ulong dest = s->pc_curr + diff;
+
     if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
@@ -2625,7 +2627,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest);
+        gen_goto_tb(s, tbno, dest - s->pc_curr);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -9793,7 +9795,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
@@ -9845,7 +9847,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_set_pc_im(dc, dc->base.pc_next);
             gen_singlestep_exception(dc);
         } else {
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
 }
-- 
2.34.1

