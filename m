Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1205550lfh;
        Fri, 27 May 2022 11:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqoU2NeuD5oAptw1kOiVyRl4coiCLujwIEHfGlbWfBRfFoFT8Dmw2FJkzxlpuah4ujR5Lv
X-Received: by 2002:a37:acf:0:b0:6a3:31f4:e581 with SMTP id 198-20020a370acf000000b006a331f4e581mr28728601qkk.371.1653675578159;
        Fri, 27 May 2022 11:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675578; cv=none;
        d=google.com; s=arc-20160816;
        b=bhvrhpl7vMV/LbxNWnlAVqaQOLEH483Dvy0yHyDGB6xJvrPQrd/vMGlm8hMnQ0pQmg
         dSSMmxNFVUvEL6y7sB81SmGw++NjKl57FFaDCwvhwukH+fDNSV/WXG4ReoO0Hda7RoB5
         WEYpmVc4D8HkUaqOgGKPExX2lzF8Qr8lX57vJpCXs0JAWgIVbOXyST/7eztitfwrnoOr
         /eU2HO4csfnpDFf2rTlFweIfgzwxb6ZaAgMcDh88TGN0gD28RnbzLXju5Ho8hvWVmfNM
         ABvYARrb/z/aPLMJHzz5uC9KMAaku25bf7KLMp+BoRLQgaSZJA5WcbzSyvW8l0+gkh5F
         ExqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LjiBcNkbgiDPbsJwQ/GjdDeJI1JzDFSHbGcvlgr0qS0=;
        b=rUFpmD3v5S/e2Z95kFcH+XeFH7P7mDyitk2o6r0PidPK5PPZOD0dVNAhbc2ZGf4E2P
         LGwOWk6mimMRopE4SFc0fKL9+f588Q45zr6xAGu4msgLiKeB+09o9hal1prEAZRCr5VQ
         6nhmAowlnu74CpSMzjjXMcYBPXAp2x1hYfEb+sw4NyatO0YeLyo2A7WRqmcKGM1fFNbf
         j1mvSrnQomq1iQ9ECGdhwVp30XBN5fr71cw2kCrrGFzmPGHMIR2gvpt/nPjg09M3mpHu
         xQLsNTXG6PbzM1BL61A4pScVpVOmRS/O0RdXfTrIWzHBqmsbmxLFYj3MXQEhtgKsmCB1
         sJ6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zt76yIUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020a05620a258b00b006a461f1745esi3440328qko.162.2022.05.27.11.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zt76yIUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueYj-0006XJ-IO
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYS-0006Oz-HW
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYQ-0003XB-0f
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id g184so4598229pgc.1
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjiBcNkbgiDPbsJwQ/GjdDeJI1JzDFSHbGcvlgr0qS0=;
 b=zt76yIUlaBHi5K5h2EdcuWDvqzEvtPIHOr6UozJfEfUJWHxOc0eAhX+8WgSa234jFR
 wdRYIz8Vp+SsB9HfpOPp0NnAF3XsJ06tplFF3Wh+SEkyUtsNnmJn3xnaGrMVKKm3r/vb
 YWKe2PM7XzkWxsleYAsLa+54mIqhl1F4B1Wenvwx6lPArXE5foLwWSseLEtw7TSVnNnx
 8wEJhUEfNN6NvCidF6eHryY4PEg59lmZVo22h8cWKE3xVEjD543HhINQAmcWXXvll4Vd
 s3SmQ03CXMfY6TKil8Wl6v3l+GwiC8GHczkp4zFrxlrd3r1VW+cIFEngFthamRTnvGy4
 423g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LjiBcNkbgiDPbsJwQ/GjdDeJI1JzDFSHbGcvlgr0qS0=;
 b=Q0wJs9x9Sl2Jojoy3IbwT1S7KNBTE7yBQkRrnH9GKfp+Kfffjy7jcAJ+0972R4gENj
 I3wsEGSscj+6I+9qsDmIOu44TuOQE6g5H1LComR3w8FQv1MVl12t+U3+M1oEJlbLFpRK
 kUhWGlSWME4NnCZqBxXjYCY3tM0k7lg0erWNTGVwcBEe05HAKU9B9AM+sJtDiuIiWhoK
 8UUF501EhhYE3/mD+gzwuBmg14aD+55o9lvrwiPQPoS/a5o2vvk1dnlKNy/m/Vnzj12z
 +q5YxzYdUhI+sayzyUOszdhzrLhX3IaZiCU6IywuuZ0O0kOl39eKfYQX5HOp4Jaf2212
 qiMQ==
X-Gm-Message-State: AOAM532CKHebhtA8gIwnNAjX4LifkPPTRg/m7wJqIhlMZsQhwqyTXLH7
 Ek1Q4r/jRTD6G1E2E5zJvPOr1A==
X-Received: by 2002:a05:6a00:724:b0:4fa:a35f:8e0f with SMTP id
 4-20020a056a00072400b004faa35f8e0fmr44796945pfm.25.1653675556657; 
 Fri, 27 May 2022 11:19:16 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 008/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zzzz
Date: Fri, 27 May 2022 11:17:21 -0700
Message-Id: <20220527181907.189259-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kvhi2ixcfgS7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 102 ++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 64 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6ec996e7f2..5aaef5b18f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -176,15 +176,21 @@ static bool gen_gvec_ool_arg_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
 }
 
 /* Invoke an out-of-line helper on 4 Zregs. */
-static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+static bool gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm),
-                       vec_full_reg_offset(s, ra),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
@@ -2421,11 +2427,8 @@ static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                          (a->rn + 1) % 32, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             (a->rn + 1) % 32, a->rm, 0);
 }
 
 static gen_helper_gvec_3 * const tbx_fns[4] = {
@@ -3813,11 +3816,8 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
         { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
         { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->u][a->sz],
+                             a->rd, a->rn, a->rm, a->ra, 0);
 }
 
 /*
@@ -3827,13 +3827,7 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
 static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
                         gen_helper_gvec_4 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
 #define DO_RRXR(NAME, FUNC) \
@@ -7122,13 +7116,10 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
 static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
                              gen_helper_gvec_4 *fn, int data)
 {
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
 static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
@@ -8215,24 +8206,21 @@ static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             a->rm, a->ra, a->rot);
 }
 
 static bool trans_CDOT_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
 {
-    if (!dc_isar_feature(aa64_sve2, s) || a->esz < MO_32) {
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_helper_gvec_4 *fn = (a->esz == MO_32
-                                 ? gen_helper_sve2_cdot_zzzz_s
-                                 : gen_helper_sve2_cdot_zzzz_d);
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->rot);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             a->rm, a->ra, a->rot);
 }
 
 static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
@@ -8245,10 +8233,8 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             a->rm, a->ra, a->rot);
 }
 
 static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
@@ -8452,10 +8438,7 @@ static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
 static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
@@ -8478,11 +8461,8 @@ static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
-                          a->rd, a->rn, a->rm, a->ra, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
+                             a->rd, a->rn, a->rm, a->ra, 0);
 }
 
 static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
@@ -8490,11 +8470,8 @@ static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
-                          a->rd, a->rn, a->rm, a->ra, a->index);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
+                             a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
 static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
@@ -8502,11 +8479,8 @@ static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfmmla,
-                          a->rd, a->rn, a->rm, a->ra, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfmmla,
+                             a->rd, a->rn, a->rm, a->ra, 0);
 }
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-- 
2.34.1

