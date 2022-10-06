Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp188775ocb;
        Wed, 5 Oct 2022 20:50:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7npWcshiPtJ5+bqZhoj4nTFovkQaI8cjyp9l+4GydXtOJiIkaIY2dAnMdDf08OT9pcRYzT
X-Received: by 2002:a0c:aa9a:0:b0:4b1:82b4:4934 with SMTP id f26-20020a0caa9a000000b004b182b44934mr2462604qvb.58.1665028243369;
        Wed, 05 Oct 2022 20:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665028243; cv=none;
        d=google.com; s=arc-20160816;
        b=G261cQkpOMo+zo3GZMZkgiQnjAI+A/DWNgL+ym1SYQdeDVYIsaMKG9IguyMphBZ3lN
         IpQFzGICj5eAiZz4BoyimxXamzYKt/l34eB8KzRKl2bdctChPAdIMGITqLhoo3TkmgKU
         Fl3KW1JmAeoOPXug4YJspdgFLsUTweZcXbE27BTKIcSsRgh6dhYdgesXVI/fBgi42W6G
         Rg7g4SK+UiwSROvu2Lupm/Ik+UFozYHy9fcYq7neRBG65QtllBKJ36R9JhV0gBg6fVV7
         htba/E0aIbobuBABeapd6D21M6oFmyArawIzcdHaUCQXnSesRTIVaJNI0YfyUQ8uFaFY
         o0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+B8rOtkjvONjZSA2MWgoQbv6N8UN3QaAqQ4YsJ87nAo=;
        b=IBcUpCyjAj+YLbKvEVUJPre0uIifYpV641XUzPlOhDiMmnXql4YsCr/+JkG7/3BIVb
         wDM+wUUbfOgSW3O1jxgV1qOcR/2IKYYbvPXvr+JmmneGslSNnEAfVGz9f2fcXLC7dKNy
         HGMy6kfnopmsNJhNHBqGlsT0Ku45KhUCS+z4gB8ukug6miK9WzNiwfgUVC1Gf5PhzXvH
         RUgdijix1InGE8XBLrnXOhzuv0X95CRzEYRSR6KEbvx4GCgbUHfKEYufohzpKn0NRFvF
         F8RM9jO+i0m7czvqXTLBxS35YsEwaIsG73JPT5e8jh+c41LbEzmqSRrcVtMNc9khkDYo
         0sgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VeMHYJJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a290100b006ce407bae08si7821623qkp.449.2022.10.05.20.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Oct 2022 20:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VeMHYJJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogHuE-0000UY-Cn
	for alex.bennee@linaro.org; Wed, 05 Oct 2022 23:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiv-00035k-5J
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:39:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-0002uG-23
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 23:39:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso575302pjk.1
 for <qemu-arm@nongnu.org>; Wed, 05 Oct 2022 20:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+B8rOtkjvONjZSA2MWgoQbv6N8UN3QaAqQ4YsJ87nAo=;
 b=VeMHYJJXI/putB8ubSzkEUP+cy7ySOBaJAlEk7C4Tz6CF2qsxPCu0ExaLO0To+IuEc
 qwbn5bvQ6yXc43Lu+rCKAhJ7J9AV2XVy2Sy7M9TJZNNI8JAHQc7R5wWIhD6cmehsxcDg
 nBtpGQMAv6ptHJHyJ81P9zV/8s+d/teQ9dRRSLlqIjJa+yE+nVDqh0rZr/q8hGRKX3r6
 NkYPenAaLq5lL66ShISw3yJZ0+OCZtMZ3WglNvL3p5SutzTE8lN1Qr4s54BD1ydiWam2
 Qk/IsdQkBK7Nwi2VA3v0HFIcynV0n6pdMKIPnYrbhD8Hvn7g3ZoqmtTs4YBCr2g0iYZC
 ajOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+B8rOtkjvONjZSA2MWgoQbv6N8UN3QaAqQ4YsJ87nAo=;
 b=wmJbYx2OR7gFOjrlKpEdW/l7YzZxqx5Y+ApHcFQhSoNL34eNyx0Aojne7hCePaQf0Z
 V3HLqtGbNGpDhQZihFYBNtc+tOAjBuGy6CQ0xLIzs70g5Gh+tq1w/W4bMh+BBHgbkwrV
 lqbS1LraFTzSC+L8G+zIcefJMbS223gVYFSLdFPRiy4NYXO6Fb08/c0XGvD2nJb/abMT
 mIMezlPZ2ZS9/naCKfiNHp4tIZizbkqhVP0Eh0RqETipORrNd7ljm9ciaByOb/IpUpDQ
 poq09lmZQOei6QeThjH/l/QTOXXaxxdpEw0JRNZrcGUAcc3Oz4bhsr3vcLTDmidX0wOq
 E/5Q==
X-Gm-Message-State: ACrzQf2QSWMs6IPyUkPldaqf1uQSyPC/9jt/R1yBkyAwf0NTBb6S5oTC
 YUb+ZqTH/fSU4eU3tl6o4Xwg6w==
X-Received: by 2002:a17:902:d2c2:b0:177:ed66:798 with SMTP id
 n2-20020a170902d2c200b00177ed660798mr2604235plc.76.1665027529565; 
 Wed, 05 Oct 2022 20:38:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 2/9] target/arm: Change gen_goto_tb to work on displacements
Date: Wed,  5 Oct 2022 20:38:39 -0700
Message-Id: <20221006033846.1178422-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: OWX1IytZckEU

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
 target/arm/translate.c     | 10 ++++++----
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 78b2d91ed4..8f5c2675f7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -378,8 +378,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
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
@@ -1362,7 +1364,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
+    int64_t diff = sextract32(insn, 0, 26) * 4;
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
@@ -1371,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, addr);
+    gen_goto_tb(s, 0, diff);
 }
 
 /* Compare and branch (immediate)
@@ -1383,14 +1385,14 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
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
@@ -1399,9 +1401,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
 
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Test and branch (immediate)
@@ -1413,13 +1415,13 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
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
@@ -1430,9 +1432,9 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
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
@@ -1444,13 +1446,13 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
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
@@ -1458,12 +1460,12 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
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
 
@@ -1637,7 +1639,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         reset_btype(s);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     case 7: /* SB */
@@ -1649,7 +1651,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * MB and end the TB instead.
          */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     default:
@@ -14955,7 +14957,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, 4);
             break;
         default:
         case DISAS_UPDATE_EXIT:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 42e11102f7..6855128fb1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2594,8 +2594,10 @@ static void gen_goto_ptr(void)
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
@@ -2629,7 +2631,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest);
+        gen_goto_tb(s, tbno, dest - s->pc_curr);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -9798,7 +9800,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
@@ -9850,7 +9852,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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

