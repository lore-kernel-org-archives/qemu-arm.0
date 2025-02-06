Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777361njb;
        Thu, 6 Feb 2025 11:58:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGxL+npU2R3bOB5bjRSslXXcldyw5KG5UDi3QPy6nut2cfxj0fRR1MGmqRvIt+/CBHoyfbnRNyZSQk2A==@linaro.org
X-Google-Smtp-Source: AGHT+IH4x6AFJxgwn227V0LOJaLQbvg7G30tHBBim8WYbrnERVFYIIwZZ6XNGUUx7Tg9GcogXkWd
X-Received: by 2002:a05:6214:20e2:b0:6e4:4484:f354 with SMTP id 6a1803df08f44-6e445740d5fmr4299636d6.38.1738871908400;
        Thu, 06 Feb 2025 11:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871908; cv=none;
        d=google.com; s=arc-20240605;
        b=MuAFUtT5R6ujaJtul9urrTt22ee3XnfRHoRfWmNajXtjsU5Cg1OKv+zItpjkeFniHQ
         svtmVGvRQKMWmXDgpodNU1kREN8wNlyC0qN6GT0vTfKpJlJ8HxFPqYQ+yWv0/WI9mwQL
         9974ZkcKggeLplmCkOFToo+qAJtgRxHnPiiVRKQsjbTZWnL6XE5cmLG8ZB8jOrReT9et
         1tzz2kGdAcv6fkZLnAtWIxNiDhZ9KYuloBBKIwm1DBG+tHk76PcSzavNcaNx8i2QKZD4
         V+p8nrWf0KiB5Pp1eWHhBxfw379QpJqbLgLn8CpoAqv7ldBWzP8tfz3HeHq0O5rS3XoF
         g2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RfCREBeWqP3xZCwzPTg3qYrCq3aLvYTQX4nKzsiQLes=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=iGNt8DNMd5wcWwRYamWhCw2fyRJ0sEmDxP+4d/V8UOme9f3+eyy39VPPRP6Xik/VZh
         2z0qhKyYmrXMzYz4ERBqdmpGI5Wxu57I0UhnO1Zcs296wDq7lIMFc6qbDTPOzIq98iav
         1KyLU6FmOdKxejO3oN9AFTis9c4ThmZoGQtCVz++jLRVGAOjkaPgQSwQgjpJg13onidH
         w09p88mG5YrA8OGybdmZ3Ws9IQ0bMdCgv6a+ly2Oa7DTXy8IasevWAPpz01RtLmh7Zrq
         Uyk5AEKQn8PjhB7VVHE66M/7FLfFAPqqQaQ5zrG7sVL2PcMSeMe4kIGlpAHigUJh/twK
         8D8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwX72b2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e443086d9esi4728716d6.365.2025.02.06.11.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:58:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwX72b2y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80j-0007gh-9E; Thu, 06 Feb 2025 14:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80G-0007FB-8k
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80D-0000Xg-HQ
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2164b662090so27974645ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871852; x=1739476652; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfCREBeWqP3xZCwzPTg3qYrCq3aLvYTQX4nKzsiQLes=;
 b=GwX72b2yimJNteFNGWpYilyekeb45zyTUFoaLQ/A18ujr9EvHqU7VdiUmApIPoN0wh
 29IgXwmqX/p3Vjo6h8B5aDCgoOJp20ag7EI8gJha+LJJ3tmq0gZEitrj0GZguCiWLwvF
 rwUYEdaG4AmfpnML6mMmHOz2xcFVYDlNFuM+JXcW9yScCcl7KLPWC4Kf4pur2gDKjMmx
 oyS1FuloVH9qXjH6OzdQVHPAf++vj54IGLMHjSjhoWtKs+zI8a7yHWeSjxHFwDhx3MdP
 6eAPhwP6m+2TH1P+QPor96hJqu3KoAVk4tOyoDyeLy0zQB3EgP9ZUSccGN+hLvH1xNLv
 TFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871852; x=1739476652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfCREBeWqP3xZCwzPTg3qYrCq3aLvYTQX4nKzsiQLes=;
 b=sZIBtsQS2o4U0QtfeoB+rwU6dlbDSqIknegxO1Q4hrwyNk+FObt7TVteW4DMGDZnCv
 0deWNjXEURCfJW77Ul9nH7q5q3o0Llwb5u+yYtDzeeBT5JnKcWzFJTppkxAUc9zGyxFf
 uW3Af5E+3oPKXfRjaG4EIizKunsO+hfjH3qAd1Cs+tSQ3iS1NbcCiAi+bvASybJvhJ13
 qhrulRIaI9GrzOtFKpwJ5ZSBs1ct4l2nOLGy1h87WFbchi5rZHNBNGXr5OrJnQ1qWi0W
 ZvWIS4VysfY1KTA5YC2/oL3mP7e8yrKBV+1a0bRk9u7KCtX/3DAr9pW5nXFziiuurmMo
 FUWw==
X-Gm-Message-State: AOJu0Yzjku66O4X2c8nJoaHQ5rYM1EA3rit0/TS5uIA035w0fVRU1Zut
 ylxDAAFZJABZdoMVXtv/2uHn7+JopK38847/vav0mU0wyu+hU7Zmz8adyLJtUQ+TqBswiRGBCb/
 0
X-Gm-Gg: ASbGnctlylALGdFUICrziT4g09netL7X+6R2F5x2/fBQUE/6CXcoKLz5l1jGyIfpPSM
 u6lu6YD7na/Vq7YSqkT5vtXB2VLlp/4V9yKJXPo4HP1Fm195Pp4CsyOHPdySFNcw3M4CzpF8SWM
 p0LdIyqP+i4bwavnjRm2takRSSeaMaooIMLu+yCU/VLaQkDhHVRJVCFcEs6r8jIvrpmThUCiBcT
 pSV10uJJhDHva8t3Dd57nFahM7hdf1We4z8AjhY+Kht/1wKjY1cVNKtFPjGoJ+NLrGhMMW+QJZt
 TPS2YAW7mwYE9BZTqW1i3blZZtz47+gVaWyOqbkKpCPzByI=
X-Received: by 2002:a05:6a00:3c88:b0:730:4598:ddb5 with SMTP id
 d2e1a72fcca58-7305d41760fmr827810b3a.2.1738871852018; 
 Thu, 06 Feb 2025 11:57:32 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/61] target/arm: Split out get_zarray
Date: Thu,  6 Feb 2025 11:56:35 -0800
Message-ID: <20250206195715.2150758-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: G7oN0Hstiapk

Prepare for MOVA array to/from vector with multiple registers
by adding a div_len parameter, herein always 1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 40 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index eed9345651..a818a549cb 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -43,7 +43,7 @@ static bool sme2_zt0_enabled_check(DisasContext *s)
 
 /* Resolve tile.size[rs+imm] to a host pointer. */
 static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
-                                int tile, int imm, bool vertical)
+                                int tile, int imm, int div_len, bool vertical)
 {
     int pos, len, offset;
     TCGv_i32 tmp;
@@ -55,7 +55,7 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     tcg_gen_addi_i32(tmp, tmp, imm);
 
     /* Prepare a power-of-two modulo via extraction of @len bits. */
-    len = ctz32(streaming_vec_reg_size(s)) - esz;
+    len = ctz32(streaming_vec_reg_size(s) / div_len) - esz;
 
     if (!len) {
         /*
@@ -111,6 +111,13 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     return addr;
 }
 
+/* Resolve ZArray[rs+imm] to a host pointer. */
+static TCGv_ptr get_zarray(DisasContext *s, int rs, int imm, int div_len)
+{
+    /* ZA[n] equates to ZA0H.B[n]. */
+    return get_tile_rowcol(s, MO_8, rs, 0, imm, div_len, false);
+}
+
 /*
  * Resolve tile.size[0] to a host pointer.
  * Used by e.g. outer product insns where we require the entire tile.
@@ -177,7 +184,7 @@ static bool do_mova_tile(DisasContext *s, arg_mova_p *a, bool to_vec)
         return true;
     }
 
-    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za, a->off, a->v);
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za, a->off, 1, a->v);
     t_zr = vec_full_reg_ptr(s, a->zr);
     t_pg = pred_full_reg_ptr(s, a->pg);
 
@@ -234,7 +241,7 @@ static bool do_mova_tile_n(DisasContext *s, arg_mova_t *a, int n, bool to_vec)
         for (int i = 0; i < n; ++i) {
             TCGv_ptr t_zr = vec_full_reg_ptr(s, a->zr * n + i);
             t_za = get_tile_rowcol(s, a->esz, a->rs, a->za,
-                                   a->off * n + i, a->v);
+                                   a->off * n + i, 1, a->v);
             if (to_vec) {
                 zc_fns[a->esz](t_zr, t_za, t_desc);
             } else {
@@ -243,13 +250,13 @@ static bool do_mova_tile_n(DisasContext *s, arg_mova_t *a, int n, bool to_vec)
         }
     } else {
         for (int i = 0; i < n; ++i) {
-            int zr_ofs = vec_full_reg_offset(s, a->zr * n + i);
+            int o_zr = vec_full_reg_offset(s, a->zr * n + i);
             t_za = get_tile_rowcol(s, a->esz, a->rs, a->za,
-                                   a->off * n + i, a->v);
+                                   a->off * n + i, 1, a->v);
             if (to_vec) {
-                tcg_gen_gvec_mov_var(MO_8, tcg_env, zr_ofs, t_za, 0, svl, svl);
+                tcg_gen_gvec_mov_var(MO_8, tcg_env, o_zr, t_za, 0, svl, svl);
             } else {
-                tcg_gen_gvec_mov_var(MO_8, t_za, 0, tcg_env, zr_ofs, svl, svl);
+                tcg_gen_gvec_mov_var(MO_8, t_za, 0, tcg_env, o_zr, svl, svl);
             }
         }
     }
@@ -315,7 +322,7 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
         return true;
     }
 
-    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za, a->off, a->v);
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za, a->off, 1, a->v);
     t_pg = pred_full_reg_ptr(s, a->pg);
     addr = tcg_temp_new_i64();
 
@@ -337,18 +344,13 @@ typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
 
 static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 {
-    int svl = streaming_vec_reg_size(s);
-    int imm = a->imm;
-    TCGv_ptr base;
+    if (sme_za_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int imm = a->imm;
+        TCGv_ptr base = get_zarray(s, a->rv, imm, 1);
 
-    if (!sme_za_enabled_check(s)) {
-        return true;
+        fn(s, base, 0, svl, a->rn, imm * svl);
     }
-
-    /* ZA[n] equates to ZA0H.B[n]. */
-    base = get_tile_rowcol(s, MO_8, a->rv, 0, imm, false);
-
-    fn(s, base, 0, svl, a->rn, imm * svl);
     return true;
 }
 
-- 
2.43.0

