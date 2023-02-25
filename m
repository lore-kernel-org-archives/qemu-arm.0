Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639479ejc;
        Sat, 25 Feb 2023 01:23:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8v6Ve83mr29kKLFk2J7VYVBtVho69g8Xj9HHzQzCJCr44YgbdJ6QL1dIupnjN73sMAE0rq
X-Received: by 2002:ac8:5b85:0:b0:3b9:ec33:eabb with SMTP id a5-20020ac85b85000000b003b9ec33eabbmr4694890qta.19.1677317034022;
        Sat, 25 Feb 2023 01:23:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317034; cv=none;
        d=google.com; s=arc-20160816;
        b=AYeQ7hCEChrf1xPnfd+mwMzcvo7/wapNeZ8TPomTl/xs2zYtjqf7/z1kGyDlUKhL8J
         g3ol4n+Ns+WCXiZSWBnUBg7ab/qZYFnxxFDLdGTufiVMl2qK44ERkTB3w/6T1sOLRHFP
         /qO212vhxB2fIGeiwaAgqLAZCLLMC8MNNiC2jexKaxvcrh0pl0yExX4oSNv6ItrUauPG
         n1uqANrbpEUjSunPkIcbSnRsPE1bga3GfrO5SceaaPV32EnEYfxae3CVuXoaaiERAn3v
         U+IshlTHIEYfCiRJQuPvnHkZBZu37qonnn0L8mtylk/X0qddICUhCM5xDvKnLYYomurU
         irPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kzN44zkvPiekz5pNcUok1y3dyGa4SpE7A5HrTAlnyn4=;
        b=tpjOLJ7tLifzIehfN4OcJREjdDD3TAZ4AkEOcIYYCXNpWyfwQ7JsCVzCZ3Ul38HLay
         XoTmh78Eq0k02/G3qiP2+oiKCiCZo7L90HXApKYKBJqFBT49ryXHK1DBs0lOmC3cklKE
         hjiTIteO9pnVg2zhs7dp/lO2Yh52aSw49lVKJzEtjR/RFQ/XBd9REapLERa5McaMPV1W
         3izeJHPhBPxVgzHpetL85x/x7KzR3eWmCQq+o/dOs2yQR5OMQeAqUOefviVlXqnIfSUK
         W5fpDTBtlet+mP0HvkFMglyY/itpzSZ7yjAiYWrLJbJd/c/yGI+Yo8HEgDrEX/fuD/c0
         bf9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8fUUhnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020a05622a175200b003b86db0752esi1621209qtk.351.2023.02.25.01.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8fUUhnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqdi-0004Tj-GR; Sat, 25 Feb 2023 04:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdf-0004Ow-QF
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:14:44 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdd-0001Nj-5X
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:14:43 -0500
Received: by mail-pl1-x634.google.com with SMTP id i10so1862361plr.9
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzN44zkvPiekz5pNcUok1y3dyGa4SpE7A5HrTAlnyn4=;
 b=g8fUUhnlBnXZpZXK7SAScuEbpSPOnxhzobUxh7KfZ6HFWJ5TIxIg6m2Ja5CB919ERG
 96Hybj7HLrCosLF2sSkWjc3U67Cs2kFwPO3LGFQA2u4983PRz0R91DnPzYIlTiV7WB3a
 +nAjCNHlVjK64THsV10l/Kwl4M7kZ7eI/6Sz/8eHQhPsKNssjBmQ2a/vwAiQKXgRD1U/
 Vrj+vj8fIHa0crVfWS666Ilt7o9RyXU1At40v8KT5E3RSM+wIWCWfjfBRmoeHBCCGcDo
 NzBt4GY05XMcD4Oz6U8DEBAzbvLOIcJJL0wfhvFeZ0QoWdAQs9NtgiffUx+pyxxJzB/8
 tQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzN44zkvPiekz5pNcUok1y3dyGa4SpE7A5HrTAlnyn4=;
 b=zniWUB/6uttq6M/nMob4gkOiTAyRxezTmvZ2etwIsVPnRikmyuToyn/E5TB8ZouCBw
 wqZ99C/1a+9FavW384iRBspaextVuvIG2wcSSj5LG9KFeO1CqNK3+uqSsPXqtBGHzkAS
 RluYIR3JrxvNXsAf6MfRj9Tmgns04FxgEQ09/WBXdzc7GwxnCotq7JcZhk2jiLkp8IaM
 /HkT1fe85+M/AtxGK8/Xj+MHYVnbIwzKD1h4o58KROHjwyx7+qipkeoaayW3TY3X3XsM
 Ir6MXAo/zvptWWZ4lyLDyXsMRk6izj4DU9jyhmiwP6CVIxM3kRECyhpiCVE1nQBNpv5l
 XyDw==
X-Gm-Message-State: AO0yUKXKEdutiVWWI9tzv/XyTUWiHoVQBXoUBEtW6GSOCC+iJvDJuzxy
 PsuOIDEyvT6sz4NT1GjI2QjYXA==
X-Received: by 2002:a17:902:c40b:b0:19a:5958:15e7 with SMTP id
 k11-20020a170902c40b00b0019a595815e7mr2875365plk.15.1677316480031; 
 Sat, 25 Feb 2023 01:14:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 03/76] target/alpha: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:13:14 -1000
Message-Id: <20230225091427.1817156-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 64H+KGKbhc8U

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 70 ----------------------------------------
 1 file changed, 70 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index a0afdbb465..9d25e21164 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -179,7 +179,6 @@ static void free_context_temps(DisasContext *ctx)
 {
     if (ctx->sink) {
         tcg_gen_discard_i64(ctx->sink);
-        tcg_temp_free(ctx->sink);
         ctx->sink = NULL;
     }
 }
@@ -279,7 +278,6 @@ static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     gen_helper_memory_to_f(dest, tmp32);
-    tcg_temp_free_i32(tmp32);
 }
 
 static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
@@ -287,7 +285,6 @@ static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
     TCGv tmp = tcg_temp_new();
     tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEUQ | UNALIGN(ctx));
     gen_helper_memory_to_g(dest, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void gen_lds(DisasContext *ctx, TCGv dest, TCGv addr)
@@ -295,7 +292,6 @@ static void gen_lds(DisasContext *ctx, TCGv dest, TCGv addr)
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     gen_helper_memory_to_s(dest, tmp32);
-    tcg_temp_free_i32(tmp32);
 }
 
 static void gen_ldt(DisasContext *ctx, TCGv dest, TCGv addr)
@@ -311,7 +307,6 @@ static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
         TCGv addr = tcg_temp_new();
         tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
         func(ctx, cpu_fir[ra], addr);
-        tcg_temp_free(addr);
     }
 }
 
@@ -342,7 +337,6 @@ static void gen_load_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
         tcg_gen_mov_i64(cpu_lock_addr, addr);
         tcg_gen_mov_i64(cpu_lock_value, dest);
     }
-    tcg_temp_free(addr);
 }
 
 static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
@@ -350,7 +344,6 @@ static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     gen_helper_f_to_memory(tmp32, addr);
     tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
-    tcg_temp_free_i32(tmp32);
 }
 
 static void gen_stg(DisasContext *ctx, TCGv src, TCGv addr)
@@ -358,7 +351,6 @@ static void gen_stg(DisasContext *ctx, TCGv src, TCGv addr)
     TCGv tmp = tcg_temp_new();
     gen_helper_g_to_memory(tmp, src);
     tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEUQ | UNALIGN(ctx));
-    tcg_temp_free(tmp);
 }
 
 static void gen_sts(DisasContext *ctx, TCGv src, TCGv addr)
@@ -366,7 +358,6 @@ static void gen_sts(DisasContext *ctx, TCGv src, TCGv addr)
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     gen_helper_s_to_memory(tmp32, src);
     tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
-    tcg_temp_free_i32(tmp32);
 }
 
 static void gen_stt(DisasContext *ctx, TCGv src, TCGv addr)
@@ -380,7 +371,6 @@ static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
     TCGv addr = tcg_temp_new();
     tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     func(ctx, load_fpr(ctx, ra), addr);
-    tcg_temp_free(addr);
 }
 
 static void gen_store_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
@@ -398,8 +388,6 @@ static void gen_store_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
 
     src = load_gpr(ctx, ra);
     tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, op);
-
-    tcg_temp_free(addr);
 }
 
 static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
@@ -416,7 +404,6 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
     lab_fail = gen_new_label();
     lab_done = gen_new_label();
     tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_lock_addr, lab_fail);
-    tcg_temp_free_i64(addr);
 
     val = tcg_temp_new_i64();
     tcg_gen_atomic_cmpxchg_i64(val, cpu_lock_addr, cpu_lock_value,
@@ -426,7 +413,6 @@ static DisasJumpType gen_store_conditional(DisasContext *ctx, int ra, int rb,
     if (ra != 31) {
         tcg_gen_setcond_i64(TCG_COND_EQ, ctx->ir[ra], val, cpu_lock_value);
     }
-    tcg_temp_free_i64(val);
     tcg_gen_br(lab_done);
 
     gen_set_label(lab_fail);
@@ -504,7 +490,6 @@ static DisasJumpType gen_bcond(DisasContext *ctx, TCGCond cond, int ra,
 
         tcg_gen_andi_i64(tmp, load_gpr(ctx, ra), 1);
         ret = gen_bcond_internal(ctx, cond, tmp, disp);
-        tcg_temp_free(tmp);
         return ret;
     }
     return gen_bcond_internal(ctx, cond, load_gpr(ctx, ra), disp);
@@ -550,7 +535,6 @@ static DisasJumpType gen_fbcond(DisasContext *ctx, TCGCond cond, int ra,
 
     gen_fold_mzero(cond, cmp_tmp, load_fpr(ctx, ra));
     ret = gen_bcond_internal(ctx, cond, cmp_tmp, disp);
-    tcg_temp_free(cmp_tmp);
     return ret;
 }
 
@@ -564,8 +548,6 @@ static void gen_fcmov(DisasContext *ctx, TCGCond cond, int ra, int rb, int rc)
     gen_fold_mzero(cond, va, load_fpr(ctx, ra));
 
     tcg_gen_movcond_i64(cond, dest_fpr(ctx, rc), va, z, vb, load_fpr(ctx, rc));
-
-    tcg_temp_free(va);
 }
 
 #define QUAL_RM_N       0x080   /* Round mode nearest even */
@@ -615,8 +597,6 @@ static void gen_qual_roundmode(DisasContext *ctx, int fn11)
 #else
     gen_helper_setroundmode(tmp);
 #endif
-
-    tcg_temp_free_i32(tmp);
 }
 
 static void gen_qual_flushzero(DisasContext *ctx, int fn11)
@@ -645,8 +625,6 @@ static void gen_qual_flushzero(DisasContext *ctx, int fn11)
 #else
     gen_helper_setflushzero(tmp);
 #endif
-
-    tcg_temp_free_i32(tmp);
 }
 
 static TCGv gen_ieee_input(DisasContext *ctx, int reg, int fn11, int is_cmp)
@@ -716,8 +694,6 @@ static void gen_cvtlq(TCGv vc, TCGv vb)
     tcg_gen_shri_i64(tmp, vb, 29);
     tcg_gen_sari_i64(vc, vb, 32);
     tcg_gen_deposit_i64(vc, vc, tmp, 0, 30);
-
-    tcg_temp_free(tmp);
 }
 
 static void gen_ieee_arith2(DisasContext *ctx,
@@ -808,8 +784,6 @@ static void gen_cpy_mask(TCGv vc, TCGv va, TCGv vb, bool inv_a, uint64_t mask)
 
     tcg_gen_andc_i64(vc, vb, vmask);
     tcg_gen_or_i64(vc, vc, tmp);
-
-    tcg_temp_free(tmp);
 }
 
 static void gen_ieee_arith3(DisasContext *ctx,
@@ -927,7 +901,6 @@ static void gen_ext_h(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
         tcg_gen_neg_i64(tmp, tmp);
         tcg_gen_andi_i64(tmp, tmp, 0x3f);
         tcg_gen_shl_i64(vc, va, tmp);
-        tcg_temp_free(tmp);
     }
     gen_zapnoti(vc, vc, byte_mask);
 }
@@ -948,7 +921,6 @@ static void gen_ext_l(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
         tcg_gen_andi_i64(tmp, load_gpr(ctx, rb), 7);
         tcg_gen_shli_i64(tmp, tmp, 3);
         tcg_gen_shr_i64(vc, va, tmp);
-        tcg_temp_free(tmp);
         gen_zapnoti(vc, vc, byte_mask);
     }
 }
@@ -986,8 +958,6 @@ static void gen_ins_h(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
 
         tcg_gen_shr_i64(vc, tmp, shift);
         tcg_gen_shri_i64(vc, vc, 1);
-        tcg_temp_free(shift);
-        tcg_temp_free(tmp);
     }
 }
 
@@ -1015,8 +985,6 @@ static void gen_ins_l(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
         tcg_gen_andi_i64(shift, load_gpr(ctx, rb), 7);
         tcg_gen_shli_i64(shift, shift, 3);
         tcg_gen_shl_i64(vc, tmp, shift);
-        tcg_temp_free(shift);
-        tcg_temp_free(tmp);
     }
 }
 
@@ -1047,9 +1015,6 @@ static void gen_msk_h(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
         tcg_gen_shri_i64(mask, mask, 1);
 
         tcg_gen_andc_i64(vc, va, mask);
-
-        tcg_temp_free(mask);
-        tcg_temp_free(shift);
     }
 }
 
@@ -1069,9 +1034,6 @@ static void gen_msk_l(DisasContext *ctx, TCGv vc, TCGv va, int rb, bool islit,
         tcg_gen_shl_i64(mask, mask, shift);
 
         tcg_gen_andc_i64(vc, va, mask);
-
-        tcg_temp_free(mask);
-        tcg_temp_free(shift);
     }
 }
 
@@ -1152,7 +1114,6 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
                 TCGv tmp = tcg_temp_new();
                 tcg_gen_andi_i64(tmp, ctx->ir[IR_A0], PS_INT_MASK);
                 st_flag_byte(tmp, ENV_FLAG_PS_SHIFT);
-                tcg_temp_free(tmp);
             }
 
             /* Allow interrupts to be recognized right away.  */
@@ -1215,7 +1176,6 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
 
         tcg_gen_movi_i64(tmp, exc_addr);
         tcg_gen_st_i64(tmp, cpu_env, offsetof(CPUAlphaState, exc_addr));
-        tcg_temp_free(tmp);
 
         entry += (palcode & 0x80
                   ? 0x2000 + (palcode - 0x80) * 64
@@ -1550,7 +1510,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_shli_i64(tmp, va, 2);
             tcg_gen_add_i64(tmp, tmp, vb);
             tcg_gen_ext32s_i64(vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x09:
             /* SUBL */
@@ -1563,7 +1522,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_shli_i64(tmp, va, 2);
             tcg_gen_sub_i64(tmp, tmp, vb);
             tcg_gen_ext32s_i64(vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x0F:
             /* CMPBGE */
@@ -1580,7 +1538,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_shli_i64(tmp, va, 3);
             tcg_gen_add_i64(tmp, tmp, vb);
             tcg_gen_ext32s_i64(vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x1B:
             /* S8SUBL */
@@ -1588,7 +1545,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_shli_i64(tmp, va, 3);
             tcg_gen_sub_i64(tmp, tmp, vb);
             tcg_gen_ext32s_i64(vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x1D:
             /* CMPULT */
@@ -1603,7 +1559,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tmp = tcg_temp_new();
             tcg_gen_shli_i64(tmp, va, 2);
             tcg_gen_add_i64(vc, tmp, vb);
-            tcg_temp_free(tmp);
             break;
         case 0x29:
             /* SUBQ */
@@ -1614,7 +1569,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tmp = tcg_temp_new();
             tcg_gen_shli_i64(tmp, va, 2);
             tcg_gen_sub_i64(vc, tmp, vb);
-            tcg_temp_free(tmp);
             break;
         case 0x2D:
             /* CMPEQ */
@@ -1625,14 +1579,12 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tmp = tcg_temp_new();
             tcg_gen_shli_i64(tmp, va, 3);
             tcg_gen_add_i64(vc, tmp, vb);
-            tcg_temp_free(tmp);
             break;
         case 0x3B:
             /* S8SUBQ */
             tmp = tcg_temp_new();
             tcg_gen_shli_i64(tmp, va, 3);
             tcg_gen_sub_i64(vc, tmp, vb);
-            tcg_temp_free(tmp);
             break;
         case 0x3D:
             /* CMPULE */
@@ -1646,7 +1598,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_add_i64(tmp, tmp, vc);
             tcg_gen_ext32s_i64(vc, tmp);
             gen_helper_check_overflow(cpu_env, vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x49:
             /* SUBL/V */
@@ -1656,7 +1607,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_sub_i64(tmp, tmp, vc);
             tcg_gen_ext32s_i64(vc, tmp);
             gen_helper_check_overflow(cpu_env, vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x4D:
             /* CMPLT */
@@ -1674,8 +1624,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_shri_i64(tmp, tmp, 63);
             tcg_gen_movi_i64(tmp2, 0);
             gen_helper_check_overflow(cpu_env, tmp, tmp2);
-            tcg_temp_free(tmp);
-            tcg_temp_free(tmp2);
             break;
         case 0x69:
             /* SUBQ/V */
@@ -1689,8 +1637,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_shri_i64(tmp, tmp, 63);
             tcg_gen_movi_i64(tmp2, 0);
             gen_helper_check_overflow(cpu_env, tmp, tmp2);
-            tcg_temp_free(tmp);
-            tcg_temp_free(tmp2);
             break;
         case 0x6D:
             /* CMPLE */
@@ -1744,7 +1690,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_andi_i64(tmp, va, 1);
             tcg_gen_movcond_i64(TCG_COND_NE, vc, tmp, load_zero(ctx),
                                 vb, load_gpr(ctx, rc));
-            tcg_temp_free(tmp);
             break;
         case 0x16:
             /* CMOVLBC */
@@ -1752,7 +1697,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_andi_i64(tmp, va, 1);
             tcg_gen_movcond_i64(TCG_COND_EQ, vc, tmp, load_zero(ctx),
                                 vb, load_gpr(ctx, rc));
-            tcg_temp_free(tmp);
             break;
         case 0x20:
             /* BIS */
@@ -1884,7 +1828,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 vb = load_gpr(ctx, rb);
                 tcg_gen_andi_i64(tmp, vb, 0x3f);
                 tcg_gen_shr_i64(vc, va, tmp);
-                tcg_temp_free(tmp);
             }
             break;
         case 0x36:
@@ -1900,7 +1843,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 vb = load_gpr(ctx, rb);
                 tcg_gen_andi_i64(tmp, vb, 0x3f);
                 tcg_gen_shl_i64(vc, va, tmp);
-                tcg_temp_free(tmp);
             }
             break;
         case 0x3B:
@@ -1916,7 +1858,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 vb = load_gpr(ctx, rb);
                 tcg_gen_andi_i64(tmp, vb, 0x3f);
                 tcg_gen_sar_i64(vc, va, tmp);
-                tcg_temp_free(tmp);
             }
             break;
         case 0x52:
@@ -1978,7 +1919,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             /* UMULH */
             tmp = tcg_temp_new();
             tcg_gen_mulu2_i64(tmp, vc, va, vb);
-            tcg_temp_free(tmp);
             break;
         case 0x40:
             /* MULL/V */
@@ -1988,7 +1928,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_mul_i64(tmp, tmp, vc);
             tcg_gen_ext32s_i64(vc, tmp);
             gen_helper_check_overflow(cpu_env, vc, tmp);
-            tcg_temp_free(tmp);
             break;
         case 0x60:
             /* MULQ/V */
@@ -1997,8 +1936,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             tcg_gen_muls2_i64(vc, tmp, va, vb);
             tcg_gen_sari_i64(tmp2, vc, 63);
             gen_helper_check_overflow(cpu_env, tmp, tmp2);
-            tcg_temp_free(tmp);
-            tcg_temp_free(tmp2);
             break;
         default:
             goto invalid_opc;
@@ -2017,7 +1954,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             va = load_gpr(ctx, ra);
             tcg_gen_extrl_i64_i32(t32, va);
             gen_helper_memory_to_s(vc, t32);
-            tcg_temp_free_i32(t32);
             break;
         case 0x0A:
             /* SQRTF */
@@ -2040,7 +1976,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             va = load_gpr(ctx, ra);
             tcg_gen_extrl_i64_i32(t32, va);
             gen_helper_memory_to_f(vc, t32);
-            tcg_temp_free_i32(t32);
             break;
         case 0x24:
             /* ITOFT */
@@ -2526,7 +2461,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX, MO_LEUQ);
                 break;
             }
-            tcg_temp_free(addr);
             break;
         }
 #else
@@ -2550,7 +2484,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             va = load_fpr(ctx, ra);
             gen_helper_s_to_memory(t32, va);
             tcg_gen_ext_i32_i64(vc, t32);
-            tcg_temp_free_i32(t32);
             break;
         }
 
@@ -2706,7 +2639,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         tmp = tcg_temp_new();
         tcg_gen_andi_i64(tmp, vb, 1);
         st_flag_byte(tmp, ENV_FLAG_PAL_SHIFT);
-        tcg_temp_free(tmp);
         tcg_gen_andi_i64(cpu_pc, vb, ~3);
         /* Allow interrupts to be recognized right away.  */
         ret = DISAS_PC_UPDATED_NOCHAIN;
@@ -2728,7 +2660,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 tmp = tcg_temp_new();
                 tcg_gen_addi_i64(tmp, vb, disp12);
                 tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LESL);
-                tcg_temp_free(tmp);
                 break;
             case 0x1:
                 /* Quadword physical access */
@@ -2737,7 +2668,6 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 tmp = tcg_temp_new();
                 tcg_gen_addi_i64(tmp, vb, disp12);
                 tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LEUQ);
-                tcg_temp_free(tmp);
                 break;
             case 0x2:
                 /* Longword physical access with lock */
-- 
2.34.1

