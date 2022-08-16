Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009254ejf;
        Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
X-Received: by 2002:aca:b02:0:b0:344:8f41:17b9 with SMTP id 2-20020aca0b02000000b003448f4117b9mr127336oil.117.1660682106303;
        Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682106; cv=none;
        d=google.com; s=arc-20160816;
        b=sjq/0VF97TkzGYogfwpb3lTXHljaaaHmNPn28ozMTnQm7r4aB6zsH4YZPfLou127Tn
         GehEiflSsZfEtVTCYXK1V7W3vCY2ei43ihHDoqw4C8k3mD3oON9484tw6Z63jXSE5nj2
         xyT/iFIs1IQwTgeKAMREDzrj1pHySdlLKPw18zMCId9/gTKloE35bvtSRucRy1GdO8Ir
         kdFl0NLrLWlr2p9Y6vit1ie0MExFq3H8xaIhS7WEk5sMx1uiIlutFlbGu+SYsX4C0klb
         F9FkL2j3wVMoWYanMtiNfR37i2l3OhZVw6p24AjEEBJJvYen8+8TGvbaGBX434R3e/Ov
         VZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
        b=tjpjbYyt3FYhMC9cEibIbYUiWYs3q9vtIE/8UwYStX15xJDMtIcnVXFlxxhMBeDOvA
         7jF0WO70EWJJflK/ZjhFNRJ8mhscv3+eczaLZadfna4BEZ5ScoPauXpLgYJ7Zgs5Lp7q
         8rnyIMVxilOtkLG+fDfsjG2zhxnIBdaX631ZNAxCYCLIOfUteVr9+TvzPfIhgb2luKmi
         9/Q46wnj9s8ZgR2hMTREfzNFPu08d6sulQhjeSqdNm/DbWf1y3Nu9+KMR1xwNC6jtOiy
         UTmDqa677zZW9vvtOsikOWuv2iGHGDv+1rLMZiv4MyX/9txbyjC6GCd+X2B1edN5lqxx
         G+uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AsluQiSt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gb13-20020a056870670d00b0010eb9103cfbsor2284985oab.133.2022.08.16.13.35.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AsluQiSt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
        b=AsluQiStnRkJ9ZaIy06VakISyMKR5BOUXAO5Xqc8K9AksyMOFQGZgBWvu4nLZD0JV1
         8U7v+uW9Nyc5aq9BsgB5dVMw5VG0HJ9SCHo5A6INEaZ7r4XTNE/MLX+aTzdlSFYtydMj
         M2VqrfWS8cilzwtl0lugDXQWxazN0woSIaoZsNvLvOIQSEpKxhpa+VYr9JVU7QydtlIb
         7XTbbNOeBIT5ryaf4Yvj2jAQf32Y5b20GcYsEi000dqZuFNBmrIFn3JFxl0lsX9f3T3z
         oewh4/1aid3AEt+3DajeAoRROSt/hXcqL+22ddp1iEHClzkifu17RhcLdfDr9ROnVt1p
         yRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RKoJ35vLYvCsMuP+JFswrPYXmhyjLc71nVTkFzG8E7k=;
        b=2xSDvQbZkMAZxQeflsl1ICDi6feGHUeMNhaPDJlN1hR+jzxstR/fwUfZdnnLex7FQR
         7ECAFLDZ3uzvitf/P2dcJj0OVQEVQ0mFk9ZV+sWIuBfx4BKPtP8XZOibdecU7QmaYCJ4
         x0bhtqsKBigDBoz8X3db642KUe4Oy2nwnpoB9BmdjztfHzfp+PKPkUy7HBOIutkDzm7G
         w5f7NSUg3HBcZTYReCYYdUH3PCS1EUhy8lBZm7ySrz0MqG78wIB5c5qymFT/4srOabjt
         tk0LRev/sJsrPBfx4S/Q8gL3Y1qM0hndMkj557ydRQOmGk7rWGWwAsrBhw6oKt1oxSh8
         0QNA==
X-Gm-Message-State: ACgBeo3FHCBhsI5njwGHuSVQEbXBP3hLuydvEJncewOfw/nneFfy8Jg8
	1W/Talqp/qOMYGfpQUuTo1vYrgr1CCMtDj+L
X-Google-Smtp-Source: AA6agR7SIDrWaQqZyR0NcGxcxy3SayxeSHaF0Zs3jxzOP23dVgfRHaM8P26FdVtnPAaWS80FNMnwWA==
X-Received: by 2002:a05:6870:b52c:b0:10e:e9e2:81b2 with SMTP id v44-20020a056870b52c00b0010ee9e281b2mr143761oap.75.1660682105910;
        Tue, 16 Aug 2022 13:35:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:35:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 30/33] target/arm: Change gen_jmp* to work on displacements
Date: Tue, 16 Aug 2022 15:33:57 -0500
Message-Id: <20220816203400.161187-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: X9fusHdLg5iI

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 63a41ed438..4d13e365e2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -270,6 +270,12 @@ static uint32_t read_pc(DisasContext *s)
     return s->pc_curr + (s->thumb ? 4 : 8);
 }
 
+/* The pc_curr difference for an architectural jump. */
+static int jmp_diff(DisasContext *s, int diff)
+{
+    return diff + (s->thumb ? 4 : 8);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
@@ -2614,10 +2620,8 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 }
 
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
-static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
+static void gen_jmp_tb(DisasContext *s, int diff, int tbno)
 {
-    int diff = dest - s->pc_curr;
-
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
@@ -2659,9 +2663,9 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
     }
 }
 
-static inline void gen_jmp(DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, int diff)
 {
-    gen_jmp_tb(s, dest, 0);
+    gen_jmp_tb(s, diff, 0);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
@@ -8331,7 +8335,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
 static bool trans_B(DisasContext *s, arg_i *a)
 {
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8346,14 +8350,14 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
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
 
@@ -8373,7 +8377,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
+    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
     return true;
 }
 
@@ -8534,10 +8539,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
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
 
@@ -8617,7 +8622,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (a->f) {
         /* Loop-forever: just jump back to the loop start */
-        gen_jmp(s, read_pc(s) - a->imm);
+        gen_jmp(s, jmp_diff(s, -a->imm));
         return true;
     }
 
@@ -8648,7 +8653,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
-    gen_jmp(s, read_pc(s) - a->imm);
+    gen_jmp(s, jmp_diff(s, -a->imm));
 
     gen_set_label(loopend);
     if (a->tp) {
@@ -8656,7 +8661,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
     return true;
 }
 
@@ -8755,7 +8760,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel);
     tcg_temp_free_i32(tmp);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
-- 
2.34.1
