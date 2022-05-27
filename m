Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1210062lfh;
        Fri, 27 May 2022 11:29:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/3n8mryRF/lfnSw3cBec0CihfooJnktUAP41LoTFaGQGxWrUhItzoxW8R7mfOFM0Z+dZt
X-Received: by 2002:a05:620a:1712:b0:6a3:abba:697a with SMTP id az18-20020a05620a171200b006a3abba697amr16849764qkb.149.1653676157380;
        Fri, 27 May 2022 11:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676157; cv=none;
        d=google.com; s=arc-20160816;
        b=PX9wXiM0kyMCfmpbLv57F8dEyu/r3WKE4+KIIbc4rAJJVTz4HPYBZnKddhuHM2hpXV
         wzTXL1F1S28xR+yFJrt/AWYySx2HQCk3Sp1P70tPG8ig2xd8A6MEJPM6rJBUSOXENUPd
         9qJ2OrxvOciOGT8zvSKPa7wzK5ytd1LpCV1wfxlA9ivIsFdK+zpw+2pYAKlDm8co6qrs
         Ms8xPAhms9xNwCXBFo96y1ysWkHgX+8KIOtARQHD2iMOETv7SB6OgTc74Ax+G4k3oO8x
         Fr+t5PBk77G12fojn1FXvPC1Tw/gg5mmsAGQ4rElWZ92QSmshkAcJ3D9sV0JMJmckCFI
         zXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BISgCZ5si8nkaQwz0BiOtyVorklPvI5PGitAoXiYROQ=;
        b=O4X0lDuXEU37sFe0Ev8T3VN8DrLaYHXwPBfgkHppQHPtyR42KEaFh247HrfyxNSrO5
         G8U5jBaTtwkO3R6NtPGCYPYcdi1xEuR+PpDpyQ46GQU8/EtOJjBkbXgWdYurKFNzA+Hp
         MCWeJxmvGLfeB9CyNR3Xxc59QqbxZT64cTpGO5MLoX3XdCLMlZdTL4lIYtgGAs3zmTvr
         dOKvh0dY001stHnFOgrH9jki1S9FRzuTIGefO0+jFgGCQxH2oHgi8n4jyfbQBd4FEhQx
         o1vBA0q1DYl2M/uZuCasMlzNpNK4Wgv4FDFvCt4qzuQ7lvwIB7UGzOymHO4mtPDgTC8s
         jVmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lB395Xve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05622a119000b002f90ca929d2si3433886qtk.323.2022.05.27.11.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lB395Xve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuei4-0006ab-T4
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYT-0006Ub-VW
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYR-0003Xb-4q
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:21 -0400
Received: by mail-pg1-x529.google.com with SMTP id s68so4548168pgs.10
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BISgCZ5si8nkaQwz0BiOtyVorklPvI5PGitAoXiYROQ=;
 b=lB395XvePLmEZQaY4+sFEz7f2BN0kZNwbEu+kTaptiTXPtICisy5lFtkB4/mztk5ap
 nDrQytIQCJdzoaCgVhLA4e6LV65WCAvt8w7+fdP0CI6f5jrwgzlPXf0UquDDh7i/OU5V
 5jZ4g8x7cZvG7C0tQqwCnBiMJ8mncu7+OBAz6qAA2OoJ61zplWTk9NzC5R9bjgJwkScF
 MrY1NCM+Eg4okHQbAG68L1fY6x2ijWW3UqTASb+apL/AZNi9bmHses1NwV0pUraYUmVg
 tASLnL3DUJxrYdpC+5Kgytq5drts3yPFF3+svUuD2wsvO8d/rfmdTay+F88n5aqg4NTv
 xilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BISgCZ5si8nkaQwz0BiOtyVorklPvI5PGitAoXiYROQ=;
 b=dvlo8kcgXuST+UmpLtHAStXZQcYhp7sp31cD0r1H823I9FyYKJ7hwnX4Dioc0AxKGl
 ds2gC1atEdiSkGeND/yeh3xamNZq0vfxEJJR27/mHJpAeMnaufcfsEqNhcQIu7qjAdy9
 7vWaPJ73oY8rg0154jR6XGVU4cpspdaXE+jmM9GVUbDxheyAd7kJ0eRWoRXxxZEv61QS
 D29nzdeM+kZA9xBGoW2ou7jOUVmqk1bGFQr87UNdeRcpPgZvsAsOq1MkJzjgNS8J8dhv
 K5/cMtATyS0+pKfEtUtFmHWKoiASkq94HzSG0XR8UM0ZMVTH4f8pbrFFeshVkEQYWl3X
 2yQg==
X-Gm-Message-State: AOAM530IafGVexZoouWAqMjmphhiKGQ0mdF1zp3kecwYNRNOtbfezaUY
 pcgKLq2HKQgANAGQFNFNV6uefnXth49pKQ==
X-Received: by 2002:a05:6a00:a85:b0:4e0:57a7:2d5d with SMTP id
 b5-20020a056a000a8500b004e057a72d5dmr45178072pfl.81.1653675557802; 
 Fri, 27 May 2022 11:19:17 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 009/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_zzzz
Date: Fri, 27 May 2022 11:17:22 -0700
Message-Id: <20220527181907.189259-10-richard.henderson@linaro.org>
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
X-TUID: 0YjshIsCif1P

Convert SVE translation functions directly using
gen_gvec_ool_zzzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 89 +++++++++++++-------------------------
 1 file changed, 29 insertions(+), 60 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5aaef5b18f..823c1d0ae3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2417,19 +2417,12 @@ static gen_helper_gvec_3 * const sve_tbl_fns[4] = {
 };
 TRANS_FEAT(TBL, aa64_sve, gen_gvec_ool_arg_zzz, sve_tbl_fns[a->esz], a, 0)
 
-static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
-        gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             (a->rn + 1) % 32, a->rm, 0);
-}
+static gen_helper_gvec_4 * const sve2_tbl_fns[4] = {
+    gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
+    gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
+};
+TRANS_FEAT(TBL_sve2, aa64_sve2, gen_gvec_ool_zzzz, sve2_tbl_fns[a->esz],
+           a->rd, a->rn, (a->rn + 1) % 32, a->rm, 0)
 
 static gen_helper_gvec_3 * const tbx_fns[4] = {
     gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
@@ -3810,15 +3803,12 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
-static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[2][2] = {
-        { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
-        { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
-    };
-    return gen_gvec_ool_zzzz(s, fns[a->u][a->sz],
-                             a->rd, a->rn, a->rm, a->ra, 0);
-}
+static gen_helper_gvec_4 * const dot_fns[2][2] = {
+    { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
+    { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
+};
+TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
+           dot_fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0)
 
 /*
  * SVE Multiply - Indexed
@@ -8196,46 +8186,25 @@ static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
     return do_umlsl_zzzw(s, a, true);
 }
 
-static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
-        gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
-    };
+static gen_helper_gvec_4 * const cmla_fns[] = {
+    gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
+    gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
+};
+TRANS_FEAT(CMLA_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           cmla_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
+static gen_helper_gvec_4 * const cdot_fns[] = {
+    NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
+};
+TRANS_FEAT(CDOT_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           cdot_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-static bool trans_CDOT_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
-
-static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
-        gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
+static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
+    gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
+    gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
+};
+TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
 static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
 {
-- 
2.34.1

