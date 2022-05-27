Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1265456lfh;
        Fri, 27 May 2022 13:18:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCWVB2j7sFd6WAghTCp6td3VmnURTgJ4996R3ysSznJ2dpvBrz5rSSo/15V5JLJbTyDE4d
X-Received: by 2002:ac8:5dcc:0:b0:2f3:d8d2:7cf with SMTP id e12-20020ac85dcc000000b002f3d8d207cfmr35059060qtx.464.1653682729850;
        Fri, 27 May 2022 13:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682729; cv=none;
        d=google.com; s=arc-20160816;
        b=02FGU1kVzN63jP2OPd22d/ZUJVG1r8oTd2KcvZEqwmWz/f7lQFtxx/KI+9TdB0lRhD
         m12L1T20Pwm2yq7ksxY6YmwDSSMfkfZb/9oqH7+NndlugfrrA9E4fgMpKFbUyK8RZ1Vk
         fulBVDS/kEuW9qgRTrf7QRRvgIXZPCGUJq2i6tDiv2zO39I7cefdd9Ja7QlKJBKJpozR
         n3igGmJVAbS9zzzEzaoBdv4ooKoWvOsH0z4f/yRvw5U0YMTQz5hINiJG/ST6+RjYmBw0
         /v3UCpRU4NsYHSQElc/IHo3tM7jlC4X+KxkJcG4uEGsqVq77YdWGngIeyzwcMyzjR/Yu
         gyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1aZUP1IXtEVHWIw+YmPbOakWTMWHyTpkaX4csFgdKvQ=;
        b=F9m7mBKCo5NL6lz9EzlWdTeb99iPIk2c0whqUxqSdMK8KjQaAGgKqLW+8E6dfej0sX
         VJDOKC/jc2Lc7iumvkb+gpVnQqzR/FIK1w/gY8YUq5UYitYRcrb3TkGGHkqU8zMPfvi/
         yXxzpLSxwblUYQZTYt1QfsgV3A5ScW+mnm2khqYZGJb1eTUDuYl0wRMuLv72MPMauXM5
         UTC5fFq/5uhbZmwD/RAV8Ck7KeyTNekc80dOW+ECqHsoAL+Ib/eHNNh0Nw7ZMair2Xc1
         vilLzAvqcnPmrHT01Nii2If7/lU71oq7VAw3ZXhRdkgefcCaM8iz6zRP5qIjr6eb0oPm
         WJog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iAnTLM87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139-20020a370b91000000b0069f887f340csi3129865qkl.602.2022.05.27.13.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iAnTLM87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugQ5-0007sj-8v
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0001xQ-Nh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefb-0005Na-Ol
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c65so4426012pfb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1aZUP1IXtEVHWIw+YmPbOakWTMWHyTpkaX4csFgdKvQ=;
 b=iAnTLM87hrVD99guJ/eBi2Y00JUPM67CBihW6k/DTqkDrWhfs3CoEo90yzLOl+uGQr
 Tg9xFannsN47mE+btarvNjBE4+4rMvwF9do+mlJQJzz6+Yc8k7Cm1zT/YQAZaEnEKfna
 g0SKgSIZDCy7IhotAnr0jjcMVjhiLwUa4fPUTfohZRK6F9eAxnY1jNTIbWBsICW46toq
 OyR5o6z4nrMfNr5v/fUvtFYZrOfbugEDp8d08ltPgLHW3YP6bYuHAyIMc5Gs7Y7W/GBV
 PPQvtyPZ0JbX8P9SvZOSIFHOB4mBteDaQq2FzlUPLDnDCZ1rLjJIlXyXkCUOu057TVoL
 RcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1aZUP1IXtEVHWIw+YmPbOakWTMWHyTpkaX4csFgdKvQ=;
 b=twX93f0O9KDP5uDJphclVLE4jnITEbyyF1jxTNbViQClrb8i+6NndTHdqmrxE90c6g
 +g3fd9EDLwKVgPNqmAE7EFZjYefaiYn231bs1OQAqfbIt6zzZ1gEn08O57FVYltSutoV
 1DbdgeY+ZXQN9zUe66H1lAuy4cxHxNFgdZoP3bdwQnYt9G2fMUFlV3zF3Tq8RWFpdVGE
 crJOaKnEbrlygPI28acrD9y8Rsk72eO+ThKONGv1PRXGCDmIVm3A04GA/j78zHrVXzT+
 Kt9iba5IjxH1ElRq1GjEX0zq7rJWW65phfNA7Bb6B2m+oyvz+gyMGkEbbm65QqRtEE0o
 9aKA==
X-Gm-Message-State: AOAM530CT2QqNszgEma4+rywrg5hJclI6M0K7Mo6qCK+Q/1dy/jm96VQ
 gxvPUHgaCdTQSy90yUUQAeBGvSYr/CpGug==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr45300829pfl.40.1653676001543; 
 Fri, 27 May 2022 11:26:41 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 099/114] target/arm: Use TRANS_FEAT for gen_gvec_fpst_arg_zpzz
Date: Fri, 27 May 2022 11:18:52 -0700
Message-Id: <20220527181907.189259-100-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: buQkMvJh47rw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 68 ++++++++++++--------------------------
 1 file changed, 22 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f0f2db351e..1108494919 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3841,29 +3841,24 @@ DO_FP3(FRSQRTS, rsqrts)
  *** SVE Floating Point Arithmetic - Predicated Group
  */
 
-#define DO_FP3(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)          \
-{                                                                   \
-    static gen_helper_gvec_4_ptr * const fns[4] = {                 \
-        NULL, gen_helper_sve_##name##_h,                            \
-        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d        \
-    };                                                              \
-    return gen_gvec_fpst_arg_zpzz(s, fns[a->esz], a);               \
-}
+#define DO_ZPZZ_FP(NAME, FEAT, name) \
+    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = { \
+        NULL,                  gen_helper_##name##_h,           \
+        gen_helper_##name##_s, gen_helper_##name##_d            \
+    };                                                          \
+    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
 
-DO_FP3(FADD_zpzz, fadd)
-DO_FP3(FSUB_zpzz, fsub)
-DO_FP3(FMUL_zpzz, fmul)
-DO_FP3(FMIN_zpzz, fmin)
-DO_FP3(FMAX_zpzz, fmax)
-DO_FP3(FMINNM_zpzz, fminnum)
-DO_FP3(FMAXNM_zpzz, fmaxnum)
-DO_FP3(FABD, fabd)
-DO_FP3(FSCALE, fscalbn)
-DO_FP3(FDIV, fdiv)
-DO_FP3(FMULX, fmulx)
-
-#undef DO_FP3
+DO_ZPZZ_FP(FADD_zpzz, aa64_sve, sve_fadd)
+DO_ZPZZ_FP(FSUB_zpzz, aa64_sve, sve_fsub)
+DO_ZPZZ_FP(FMUL_zpzz, aa64_sve, sve_fmul)
+DO_ZPZZ_FP(FMIN_zpzz, aa64_sve, sve_fmin)
+DO_ZPZZ_FP(FMAX_zpzz, aa64_sve, sve_fmax)
+DO_ZPZZ_FP(FMINNM_zpzz, aa64_sve, sve_fminnum)
+DO_ZPZZ_FP(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
+DO_ZPZZ_FP(FABD, aa64_sve, sve_fabd)
+DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
+DO_ZPZZ_FP(FDIV, aa64_sve, sve_fdiv)
+DO_ZPZZ_FP(FMULX, aa64_sve, sve_fmulx)
 
 typedef void gen_helper_sve_fp2scalar(TCGv_ptr, TCGv_ptr, TCGv_ptr,
                                       TCGv_i64, TCGv_ptr, TCGv_i32);
@@ -7125,30 +7120,11 @@ TRANS_FEAT(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
 TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
            a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
-static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
-                            gen_helper_gvec_4_ptr *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fpst_arg_zpzz(s, fn, a);
-}
-
-#define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
-static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
-{                                                                           \
-    static gen_helper_gvec_4_ptr * const fns[4] = {                         \
-        NULL,                            gen_helper_sve2_##name##_zpzz_h,   \
-        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d    \
-    };                                                                      \
-    return do_sve2_zpzz_fp(s, a, fns[a->esz]);                              \
-}
-
-DO_SVE2_ZPZZ_FP(FADDP, faddp)
-DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
-DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
-DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
-DO_SVE2_ZPZZ_FP(FMINP, fminp)
+DO_ZPZZ_FP(FADDP, aa64_sve2, sve2_faddp_zpzz)
+DO_ZPZZ_FP(FMAXNMP, aa64_sve2, sve2_fmaxnmp_zpzz)
+DO_ZPZZ_FP(FMINNMP, aa64_sve2, sve2_fminnmp_zpzz)
+DO_ZPZZ_FP(FMAXP, aa64_sve2, sve2_fmaxp_zpzz)
+DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
 
 /*
  * SVE Integer Multiply-Add (unpredicated)
-- 
2.34.1

