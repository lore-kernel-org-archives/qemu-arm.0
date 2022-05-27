Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1205690lfh;
        Fri, 27 May 2022 11:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGy2J92yXdpgIJa2bTOh/d5cBJGdR825hmEbe5fuo1gIzAjot1pQ7BbP3OhuQU4Z+ALgNd
X-Received: by 2002:a05:620a:6ce:b0:6a3:18c8:c468 with SMTP id 14-20020a05620a06ce00b006a318c8c468mr30033213qky.614.1653675597139;
        Fri, 27 May 2022 11:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675597; cv=none;
        d=google.com; s=arc-20160816;
        b=ycM5x3gdv/dsds5Cluv8WpcYZ7Q4nOBU5z1BUL2wxxjJRVokMliDrRzjCxDWIQ1wuE
         PwgPFvqJwmv9l6qEUyIykMhRrvmQYdWAYvjkEIMJPVp2FRrxAG8Ar48wfcaAYqS5p3IH
         gLmQeg7gn+wslyROr2DLb6u8zBostKa+nKrXJNHVkiQDkexy5We55vd9h7g2EzSoCXHv
         SuyUs5APnNYHXDC9n5fSsM3RUS4ucv4XnrjjkEHyhF6DTc7KJfXokXMZYFzypS1Aotp7
         x6an4ZPTLMZS71o/KAvQ/pV6zLfEIkgK1rQ2flDSYmbK70zuYLhfN/bT8fbnOO2KmX79
         oEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aZqP9zYtpRqV34OynQcsQDt54YpeUjGNeRtaiqprcIM=;
        b=BbGfChF/XmU8ZIshX0FlJTK4ztabZ1Gjh2LwfmILVIH5VPVt/Ge/3fXwbGfXxS8Ggm
         Pb1zWPGfj1RmmlzwV4b5jDBIT/geDYZ0sSx1+y9mSO2U59tndSLRHkXWporviQ/fvsL1
         Vio8mWhN+UEyfFkheNoez6oJsMxfbmDKEB9aaWBIUGF/M6mnh0WY59RJBp/WMPvcZN1u
         ZMuAO11ReMhdCPDV71o0FX7G0t1IF0lgNcfH5KOlgZ+6g7UFct8RUvrRXbhGIo7aZkMH
         MqL5MdN+fAN2jE7ppndU/c5tRBQQViM2kEusz9jHVSYdJDkyLhIilwmvjjbzG4OglTCM
         P5eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiYsagaM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a138a00b002e2295e6dffsi3178978qtk.399.2022.05.27.11.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiYsagaM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueZ2-0007ZN-H3
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYW-0006dt-Py
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:25 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYO-0003WE-3i
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:24 -0400
Received: by mail-pg1-x52f.google.com with SMTP id j21so4541182pga.13
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZqP9zYtpRqV34OynQcsQDt54YpeUjGNeRtaiqprcIM=;
 b=YiYsagaMtzfeLYQuBcQzHjFYoAvunAISk/Xz2vBK+xlXXcH1Qyxx16SnPdVbRcI8aJ
 i9TEtknID8xoYUd3iQ45QTZqptWJwRfBggsl8dy498WUc2TnCnGWaveacge1udU+I6mF
 yg399J6keN+Zuti2CD/CijFeHBpaWHo1jAYdUmY+yvqfIhJov1EO3rIMmPFeojXCnc1J
 tpzenSJ2Tu196ogm684gP+G4bGYUxP96snqq5Q5mosZyTpW/6e+Nztpxm9Lj94s8H3y0
 aqtAejHQPRiG1X5tv4Pf/rkEkBq871h1UmK3AqabhvnXWViV/5JcY4iy52Lq/xkkXmSn
 qWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZqP9zYtpRqV34OynQcsQDt54YpeUjGNeRtaiqprcIM=;
 b=I/XOF9QXPaOMgSCbZ5lfbQR/WK69D7tSAB8vBjsxMi99vdF1XcioGqHGvReGATFDzc
 zOj3kfSMBrjQlBu7ot1w2Z+1QGFb452rD+yV4pE321RMISUM5Uzoweq4YWOXJZ66rf4G
 F9rbTzOcLabsuH+DMALf5/2/iP81P1B5EH8oSJvOkIBxL/N+uSlhtcd4vdATsMdlsSEN
 cQkPwSAez6uOMcqtHxfRNOrYk5NZdBHwEedTJlQpxHIM6OgT1OGmVk01bKOdvtYtm53W
 eLl/F/C8k5s2sHFtO7CGh3s5FkKNbvJLKRJVU8tMC6P2k3wiPNYlkgEBp8GVDUBJoONk
 DOSg==
X-Gm-Message-State: AOAM5336KphM8ObwVIuWGr5v72YJ3xwBOGrP+gKfAYVE6U1neJMNQ5uo
 mUvpdgxB/5tzlaP8hOPowiVkrQ==
X-Received: by 2002:a62:ce41:0:b0:519:35cc:3a7a with SMTP id
 y62-20020a62ce41000000b0051935cc3a7amr5033898pfg.22.1653675554692; 
 Fri, 27 May 2022 11:19:14 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 006/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzz
Date: Fri, 27 May 2022 11:17:19 -0700
Message-Id: <20220527181907.189259-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TE5eHGpzFGG3

Convert SVE translation functions using
gen_gvec_ool_arg_zzz to TRANS_FEAT.

Remove trivial wrappers do_aese, do_sm4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 165 ++++++++++---------------------------
 1 file changed, 45 insertions(+), 120 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 37343fb2f0..c89c25166c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1184,18 +1184,16 @@ static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
 }
 
 #define DO_ZZW(NAME, name) \
-static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a)           \
-{                                                                         \
-    static gen_helper_gvec_3 * const fns[4] = {                           \
+    static gen_helper_gvec_3 * const name##_zzw_fns[4] = {                \
         gen_helper_sve_##name##_zzw_b, gen_helper_sve_##name##_zzw_h,     \
         gen_helper_sve_##name##_zzw_s, NULL                               \
     };                                                                    \
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);                    \
-}
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_arg_zzz,                      \
+               name##_zzw_fns[a->esz], a, 0)
 
-DO_ZZW(ASR, asr)
-DO_ZZW(LSR, lsr)
-DO_ZZW(LSL, lsl)
+DO_ZZW(ASR_zzw, asr)
+DO_ZZW(LSR_zzw, lsr)
+DO_ZZW(LSL_zzw, lsl)
 
 #undef DO_ZZW
 
@@ -1380,16 +1378,11 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
 TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
            fexpa_fns[a->esz], a->rd, a->rn, 0)
 
-static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_ftssel_h,
-        gen_helper_sve_ftssel_s,
-        gen_helper_sve_ftssel_d,
-    };
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const ftssel_fns[4] = {
+    NULL,                    gen_helper_sve_ftssel_h,
+    gen_helper_sve_ftssel_s, gen_helper_sve_ftssel_d,
+};
+TRANS_FEAT(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz, ftssel_fns[a->esz], a, 0)
 
 /*
  *** SVE Predicate Logical Operations Group
@@ -2412,14 +2405,11 @@ static gen_helper_gvec_2 * const rev_fns[4] = {
 };
 TRANS_FEAT(REV_v, aa64_sve, gen_gvec_ool_zz, rev_fns[a->esz], a->rd, a->rn, 0)
 
-static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
-        gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
-    };
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const sve_tbl_fns[4] = {
+    gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
+    gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
+};
+TRANS_FEAT(TBL, aa64_sve, gen_gvec_ool_arg_zzz, sve_tbl_fns[a->esz], a, 0)
 
 static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
 {
@@ -2438,18 +2428,11 @@ static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
-        gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const tbx_fns[4] = {
+    gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
+    gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
+};
+TRANS_FEAT(TBX, aa64_sve2, gen_gvec_ool_arg_zzz, tbx_fns[a->esz], a, 0)
 
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
 {
@@ -2641,62 +2624,30 @@ static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_s, gen_helper_sve_uzp_d,
 };
 
-static bool trans_UZP1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 0);
-}
+TRANS_FEAT(UZP1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           uzp_fns[a->esz], a, 0)
+TRANS_FEAT(UZP2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           uzp_fns[a->esz], a, 1 << a->esz)
 
-static bool trans_UZP2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 1 << a->esz);
-}
-
-static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 0);
-}
-
-static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 16);
-}
+TRANS_FEAT(UZP1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_uzp_q, a, 0)
+TRANS_FEAT(UZP2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_uzp_q, a, 16)
 
 static gen_helper_gvec_3 * const trn_fns[4] = {
     gen_helper_sve_trn_b, gen_helper_sve_trn_h,
     gen_helper_sve_trn_s, gen_helper_sve_trn_d,
 };
 
-static bool trans_TRN1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 0);
-}
+TRANS_FEAT(TRN1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           trn_fns[a->esz], a, 0)
+TRANS_FEAT(TRN2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           trn_fns[a->esz], a, 1 << a->esz)
 
-static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 1 << a->esz);
-}
-
-static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 0);
-}
-
-static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 16);
-}
+TRANS_FEAT(TRN1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_trn_q, a, 0)
+TRANS_FEAT(TRN2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_trn_q, a, 16)
 
 /*
  *** SVE Permute Vector - Predicated Group
@@ -8345,41 +8296,15 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
 TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
            gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
-static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
-{
-    if (!dc_isar_feature(aa64_sve2_aes, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_crypto_aese, a, decrypt);
-}
+TRANS_FEAT(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_aese, a, false)
+TRANS_FEAT(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_aese, a, true)
 
-static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_aese(s, a, false);
-}
-
-static bool trans_AESD(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_aese(s, a, true);
-}
-
-static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2_sm4, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
-}
-
-static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sm4(s, a, gen_helper_crypto_sm4e);
-}
-
-static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
-}
+TRANS_FEAT(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_sm4e, a, 0)
+TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_sm4ekey, a, 0)
 
 static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
 {
-- 
2.34.1

