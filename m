Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp752218njc;
        Tue, 25 Jun 2024 11:53:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNtIjX9hegOB38ra8NOVZPKXOK7eHYQJsY2Je1hwxJMnHXwllO2rzkW4qF+IzN53zgu0G00Ktw26jdSfyV/2AeaIcKobHM
X-Google-Smtp-Source: AGHT+IGnBIPx4HvxpN4q3d+JFaD4RQbjt0RVIZZI/GSbh6vO1BMsUvbDUtE2WwAx0hZux6aw+SZZ
X-Received: by 2002:a7b:c7ca:0:b0:422:8557:3c5a with SMTP id 5b1f17b1804b1-42489e46a79mr64637705e9.19.1719341614975;
        Tue, 25 Jun 2024 11:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719341614; cv=none;
        d=google.com; s=arc-20160816;
        b=qO8PTHHl+cwMu/C5/zWj9rTN8G/0whXQ7hDvaZoglInoAg+NyezjECicfutSV2gtsm
         9CjMgy7IKaxvpR/tmEWhPwZzvEY5O7p6X5XEkOHMUzVBulHdisuRVPls6DOYiy/IhFFR
         gS9Sir7kygPrlvqwUtpTci+0Q+S6IL0azWH1ipmd8a6SQ+5p0p2H3cYImrWpHPVBvaQl
         IE8ijX2sQWPWf5wmeoC1QxrX5Kf6VuS2HMFbruw57XPMgnBXlwhlPOSAE6+e46zdrWHH
         tqcc8Qhb+CRuhKk68vPxl/cCCCVOgXqkxqavDRSIfQJ0LalzJJ6lGfv0FN0CFyjrSDnI
         laXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wsKF91GwX4/Knu6MbETuxw4jFllUHVVW6ayUlN0J0DQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=LB1Kvs5+qoymu6HMqdR2NzNVT1KtsjSaCYTISpbbYWrIA5DczMVTpEd0S8XsKEbR2e
         o01alA/n6PIFlG+P/l3KKZU+n5CbxEzBiszOLB+WVLadkfA8xDUp3U/wdaNcXeLktHqo
         5TXNgAXNBncO6COyFcGxOMlB+lSD7BfbBEgJtG16TPvoFlWbZI4mw1aCEapDl/YbIhsQ
         9OUDbqL+D30PDL+309rxY+nlfeJP1wnJlMO7xUAPCL3nqDM//Yf0oyU9HlE02OeaVGZj
         6WqbzzDDw0GMVoPF1X/ER/d9P24yThDBnYG1nwSe+IfwEGiJq6B5wXBagbB9djIgu4gA
         pDHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNOYjSaD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4248635cb5dsi47627075e9.40.2024.06.25.11.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNOYjSaD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sMB7J-0001YM-1O; Tue, 25 Jun 2024 14:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB44-0000wr-Tv
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 14:38:57 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB2q-00066c-UT
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 14:38:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fa2ea1c443so23091735ad.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340544; x=1719945344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wsKF91GwX4/Knu6MbETuxw4jFllUHVVW6ayUlN0J0DQ=;
 b=xNOYjSaDJrUVpHygzM01J8Z6foF5lHqzbog8hYIbqd0s6EQyiPVSTdV7d9N0rLretU
 FepHmDElB2ywoS+xLmgweZUBXTOhMLGBsnQikrX1Hq+pHvpc7BJccCzftf0quVXcwcVV
 2X/KIyNQI5Bn1Ou6dV7J64oqeu3QL4t7gnBqZncuL4XKpaZ4p2e0sNcWBllU5Q9crN4l
 U183x+0Yeg/xelMu8awtA5OOfpyuBKdorhIfYW75EuJdhuKFRGiZEZXzv6ect0Mcri/8
 0Jdy5VrAtOOMCTLvceU59Bqca9pRrrJKc2NRjcyVXn8RrVvu8TfBEvyOgeW7QV6cr9eT
 hAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340544; x=1719945344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsKF91GwX4/Knu6MbETuxw4jFllUHVVW6ayUlN0J0DQ=;
 b=IO7JnGTvx3F/Gh3fzYnah1aql8HuMO9py7ijsAxf8Kwetr1TFmH9nRDArYgn/7+96W
 IJjuZXtCjXby5uIseojT9ai6DJwHZ37C2nTQBd6YVUl5/96UfcDIbSkenOQDPhfulogc
 eheTwq6vS4mAaNTicveGbAp7jBUo9l8bwUYwbeEWRg3XGnpL/flD2y3yCVMOco3ySbLy
 zIU9llmPSbMmRuVbwbPRTRSWkXP4tEkQDRYEEfy3PXajTHITfJhTbs+NB+HFzDCJcimB
 SzGx/KBS0WIO7OAoyfkE4SV4rNGbuUfpxLL2dZJIDyefMFbdn+H3HsmSiP4/vc9zPeNg
 PLoA==
X-Gm-Message-State: AOJu0Yx+j/O/aV341kQapkn3bmfpPTPKX7M2QWuYrc4cDwRzq/ekqXdw
 iDARGaffmoIJnBQC6NcnOlxAHnivLBYYUSKXtP2lIsGV5GX8J+ir+559bE1xfRS8DGeQGbTwB37
 c
X-Received: by 2002:a17:903:244a:b0:1f9:a602:5e39 with SMTP id
 d9443c01a7336-1fa238e4665mr108256365ad.11.1719340544327; 
 Tue, 25 Jun 2024 11:35:44 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/13] target/arm: Convert BFDOT to decodetree
Date: Tue, 25 Jun 2024 11:35:30 -0700
Message-Id: <20240625183536.1672454-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: doKV5icGoas4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 20 +++++---------------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8a0251f83c..6819fd2587 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -950,6 +950,7 @@ SQRDMLSH_v      0.10 1110 ..0 ..... 10001 1 ..... ..... @qrrr_e
 SDOT_v          0.00 1110 100 ..... 10010 1 ..... ..... @qrrr_s
 UDOT_v          0.10 1110 100 ..... 10010 1 ..... ..... @qrrr_s
 USDOT_v         0.00 1110 100 ..... 10011 1 ..... ..... @qrrr_s
+BFDOT_v         0.10 1110 010 ..... 11111 1 ..... ..... @qrrr_s
 
 ### Advanced SIMD scalar x indexed element
 
@@ -1029,6 +1030,7 @@ SDOT_vi         0.00 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
 UDOT_vi         0.10 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
 SUDOT_vi        0.00 1111 00 .. .... 1111 . 0 ..... .....   @qrrx_s
 USDOT_vi        0.00 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
+BFDOT_vi        0.00 1111 01 .. .... 1111 . 0 ..... .....   @qrrx_s
 
 # Floating-point conditional select
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9a658ca876..0f44cd5aee 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5604,6 +5604,7 @@ static bool do_dot_vector(DisasContext *s, arg_qrrr_e *a,
 TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_b)
 TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
 TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_b)
+TRANS_FEAT(BFDOT_v, aa64_bf16, do_dot_vector, a, gen_helper_gvec_bfdot)
 
 /*
  * Advanced SIMD scalar/vector x indexed element
@@ -5942,6 +5943,8 @@ TRANS_FEAT(SUDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
            gen_helper_gvec_sudot_idx_b)
 TRANS_FEAT(USDOT_vi, aa64_i8mm, do_dot_vector_idx, a,
            gen_helper_gvec_usdot_idx_b)
+TRANS_FEAT(BFDOT_vi, aa64_bf16, do_dot_vector_idx, a,
+           gen_helper_gvec_bfdot_idx)
 
 /*
  * Advanced SIMD scalar pairwise
@@ -10951,11 +10954,11 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         break;
     case 0x1f:
         switch (size) {
-        case 1: /* BFDOT */
         case 3: /* BFMLAL{B,T} */
             feature = dc_isar_feature(aa64_bf16, s);
             break;
         default:
+        case 1: /* BFDOT */
             unallocated_encoding(s);
             return;
         }
@@ -11036,9 +11039,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         return;
     case 0xf:
         switch (size) {
-        case 1: /* BFDOT */
-            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
-            break;
         case 3: /* BFMLAL{B,T} */
             gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, false, is_q,
                               gen_helper_gvec_bfmlal);
@@ -12053,13 +12053,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         break;
     case 0x0f:
         switch (size) {
-        case 1: /* BFDOT */
-            if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
-                unallocated_encoding(s);
-                return;
-            }
-            size = MO_32;
-            break;
         case 3: /* BFMLAL{B,T} */
             if (is_scalar || !dc_isar_feature(aa64_bf16, s)) {
                 unallocated_encoding(s);
@@ -12070,6 +12063,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             break;
         default:
         case 0: /* SUDOT */
+        case 1: /* BFDOT */
         case 2: /* USDOT */
             unallocated_encoding(s);
             return;
@@ -12179,10 +12173,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     switch (16 * u + opcode) {
     case 0x0f:
         switch (extract32(insn, 22, 2)) {
-        case 1: /* BFDOT */
-            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                             gen_helper_gvec_bfdot_idx);
-            return;
         case 3: /* BFMLAL{B,T} */
             gen_gvec_op4_fpst(s, 1, rd, rn, rm, rd, 0, (index << 1) | is_q,
                               gen_helper_gvec_bfmlal_idx);
-- 
2.34.1

