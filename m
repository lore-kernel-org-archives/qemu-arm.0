Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1971794ejn;
        Sun, 16 Oct 2022 15:18:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xZSAEBMZNKYF/mqWh/WD/dw6wIP9m2mHbKMA4LYWVr8KoDitDAXfpGMig4uuRoD1xMBwS
X-Received: by 2002:ac8:5988:0:b0:39a:dee7:ba40 with SMTP id e8-20020ac85988000000b0039adee7ba40mr6450231qte.635.1665958721536;
        Sun, 16 Oct 2022 15:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958721; cv=none;
        d=google.com; s=arc-20160816;
        b=aKL2AnTTvXJ+gZREJUxhAwwLotqR8L2ZDD/mjBwjshjCOFYh3uo7givY+sfJxRk1mw
         x9bJw/X/VKfr2YoS2n6eFG6Rws4xa973XEQdGajWZpH1YMbkQFFeTiOFWv1VEeNsNTHu
         ivdV8CrqWbpYcowATvguzR/xx1jA9XCjMc950rlmFDdDpXxoZQ1UgteBP6wpvC5Vd1+z
         VC3BA+VOWQMVy0WRQS0EyiI9I4KNw6ib2uCJo4dX2tU1GkUT3zCKVp47Bn7sFxzERIU0
         mg7hRrN3WKEAC/KKvsypGo2Usilykzo4ONBvml8fL3kaxiAi4q2IerqOvtoK/sHjmorl
         ajqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GijJJFcAlzJoiRg26un1mdsUkYxL5cYNKs3g8HCD2p0=;
        b=mmRmeIHRCgy36TFhQEy0VACDcHlMZM4lK778zob3sFjlnBMUa4snjq4l5RedmPGXjX
         A2OrydtiXZn7Wnon53xC9XLQDp9DpEWDGHWjDtvknn4xHZIzOY4DsZY3HFnv0E8OIh5e
         8D+rHaArhW5d5bxz/3PQMFN5PBmv4BwynvNuhVJl1vXCnHEAjvTjt/EhvqOniQ0/l7/2
         T6VN01cYfzh6L0Hz2yuKNs5F3JjZjOk2X2PSfh6i6Uxnza+bl/Xq92U33kQ+BwJV0BEM
         y3d5E/D0rwCRNo6MJF85f9IxCafXHXEgwR4EqDQX4SY6Myssl0PNaONP8Mwl0/1b/geK
         83/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gkz7r6st;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a0562140cca00b004990359d3aasi4590576qvx.462.2022.10.16.15.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gkz7r6st;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBxv-00042i-LT
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq8-0002uN-Gq
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:36 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq6-0007hE-GG
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:36 -0400
Received: by mail-pl1-x632.google.com with SMTP id l4so9197196plb.8
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GijJJFcAlzJoiRg26un1mdsUkYxL5cYNKs3g8HCD2p0=;
 b=Gkz7r6st65ehIVrPzISfNZfep11bvwA94UwLyQb+5IZtyFUI4jkD+AvRU9yeCVialD
 vW5L8eF19rwkPydtkbPKRlU/J/Yw962/esZPnF6xuFPTp/Ea20rKBrRUI0Dv/dg01GbV
 NQg6l8p4BQSSSE2KKvevuaa+PMAxwFzm6ZBeE3/n/jHZI+rekHpcfO1y7h7EpeVo3q33
 YjALqvvKNdYfDezsHVwyarX9iTTqKnLazMWvwTm64CC+ExNquw3ep341RIgOUuXyZeEd
 k+YLFwydErotQEYL8nYrL6aDhx2peupaop/FL8a5GSjUKJzyWaGaD1GPbsHs1PWR6R/k
 rzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GijJJFcAlzJoiRg26un1mdsUkYxL5cYNKs3g8HCD2p0=;
 b=fZhrgraQpZS7oeqrRJlJwB5pZXu/xdCny/RmnLw4QcGDbHHS9P+u4BRLsWDHhXelk/
 C5qoRHlrKBHzvgmnjx9wGqZmQNuHyLwW4Am6Myb/E+NtroO+mAfctaUG4KOXhuSTuyI7
 PCFVQjVkJCjMfyVpIfTfRirikRJ4auRvNHMiR68N++3CLCGdqG16aUZYWnD8NqLdMOJD
 crpO/KFiCT+QQiosZuHVRBwCjU8U1qgLDONQjg1eAuHslrnJKAIshfVrPX5xpqNQMEcH
 PCdkMPTaQGiXpfhHo3/wAYO4O9h7peQRylwCVyg6WOuby4D4S0JQuXTvkx753E5+cUcA
 X+OQ==
X-Gm-Message-State: ACrzQf3XBkdbxnQ9TTJBzQVawtMX+DCT2JEATmbQyVwWU1sDbsQtqk7/
 7i6hQJhyzXPiDu4ieVrPpm1dcJeJrFL24A+j
X-Received: by 2002:a17:902:9b88:b0:17c:97d6:5e78 with SMTP id
 y8-20020a1709029b8800b0017c97d65e78mr9069452plp.62.1665958231589; 
 Sun, 16 Oct 2022 15:10:31 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 6/9] target/arm: Change gen_jmp* to work on displacements
Date: Mon, 17 Oct 2022 08:09:29 +1000
Message-Id: <20221016220932.274260-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S+V0cMeMKgAm

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9104ab8232..ca128edab7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -266,6 +266,12 @@ static uint32_t read_pc(DisasContext *s)
     return s->pc_curr + (s->thumb ? 4 : 8);
 }
 
+/* The pc_curr difference for an architectural jump. */
+static target_long jmp_diff(DisasContext *s, target_long diff)
+{
+    return diff + (s->thumb ? 4 : 8);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
@@ -2592,7 +2598,7 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, int diff)
+static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 {
     target_ulong dest = s->pc_curr + diff;
 
@@ -2608,10 +2614,8 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 }
 
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
-static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
+static void gen_jmp_tb(DisasContext *s, target_long diff, int tbno)
 {
-    int diff = dest - s->pc_curr;
-
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
@@ -2653,9 +2657,9 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
     }
 }
 
-static inline void gen_jmp(DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, target_long diff)
 {
-    gen_jmp_tb(s, dest, 0);
+    gen_jmp_tb(s, diff, 0);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
@@ -8322,7 +8326,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
 static bool trans_B(DisasContext *s, arg_i *a)
 {
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8337,14 +8341,14 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
         return true;
     }
     arm_skip_unless(s, a->cond);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8364,7 +8368,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
+    /* This jump is computed from an aligned PC: subtract off the low bits. */
+    gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
     return true;
 }
 
@@ -8525,10 +8530,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
          */
     }
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
 
     gen_set_label(nextlabel);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8608,7 +8613,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (a->f) {
         /* Loop-forever: just jump back to the loop start */
-        gen_jmp(s, read_pc(s) - a->imm);
+        gen_jmp(s, jmp_diff(s, -a->imm));
         return true;
     }
 
@@ -8639,7 +8644,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
-    gen_jmp(s, read_pc(s) - a->imm);
+    gen_jmp(s, jmp_diff(s, -a->imm));
 
     gen_set_label(loopend);
     if (a->tp) {
@@ -8647,7 +8652,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
     return true;
 }
 
@@ -8746,7 +8751,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel);
     tcg_temp_free_i32(tmp);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
-- 
2.34.1

