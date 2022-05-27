Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1220518lfh;
        Fri, 27 May 2022 11:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxhPE5YKt7jKt3shMuiQ/eLZ+uT3f1ZBAWVS1buPpbHClSPojSARKqRFWplMAEN8teq6Sq
X-Received: by 2002:a05:622a:1484:b0:2f3:c837:57a6 with SMTP id t4-20020a05622a148400b002f3c83757a6mr34638142qtx.460.1653677463406;
        Fri, 27 May 2022 11:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677463; cv=none;
        d=google.com; s=arc-20160816;
        b=Rsex0a6kdU8aQi0JRDyTSWcRwV3OiaMhweg1SVbScn9oIVf+bFefRIHnJ7djNqBIaf
         wNFUJSHKRI3Tcx4K+wjHP0GrjNud4/5mZEf5pFRdKiQvEOiHhXMnOawCJaEbAWwwGyF3
         mdiH5MCf8hjMeVHU0zW3pKxqD4pb+5BdutLWUErRtTIGogzXoXGkhFLVQ9ZSgejd8/II
         VzB+04y7UGQgt1IeLrJW+z7vQymYFncz07ELHcufdE4Tr542iFyudq+Y92fp33YsUgRy
         dw7C6i2QzjCMVBc/AEPY1WX+eZLU3DhGH6jDVn3XY6YcNrl6i5aQoDe1CwSn74SGdsFh
         ec7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nVh+ysx/XJ2HaFQarq0ZODircWC5hqhYfLiphUA9Ke8=;
        b=z+MQpVlYC+uyuFJhe4rkKwIosU/iqsAfko285hrW3W13N5B9bO/UP2CbboXX0TsmK0
         UR2IiTMpvLh7Vw1MaiM4lPo+Q7a6V6jJtcSDBiviksSgFkzCgXsZOc7VIgE4Yo/ypX0f
         16Fpu2gGBjb/YmXwAZIrUnEDx5gSB49zNKwMceE9O5/43+UnVlODRqzwURLroZ5XUFmk
         TyaMNpnO0n+zHu/z3dxFcYMJAC1KR7YWSIkcc15GC2mATG2gF+JqMscdArQciyt1Jbgv
         AfBLXD3cjxOvbtXpAGC9O4HNsdER/sRmZkt5rL/own7/6badKFPH+RDRHMkF+tRYQfTP
         rS0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YU6Dnm6Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a284c00b0069e8a40fffesi3666855qkp.11.2022.05.27.11.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YU6Dnm6Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuf38-0000xf-TR
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYY-0006iG-AG
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:26 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYW-0003UM-2N
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:26 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i18so4963231pfk.7
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVh+ysx/XJ2HaFQarq0ZODircWC5hqhYfLiphUA9Ke8=;
 b=YU6Dnm6ZmQtzn1/IaZZAnESDAJwAexlsi1FiR+bkgMDpUiRytlus8NkIHtzKL5GxXa
 sXKjdwknhi8oWQNq9PfXgb1pG9RlQ2l8c+pE5mTcEuElVOaXG3TN7EIyWUXIYxLp8CN6
 oYYgYdfLQu3FKCHsOZc0L/mJZ01pA86yTvfRB93AB+NCgo0uvS27T8OMapGuY5ubEp2h
 HVksY17Fh6nau3CQoogWMqrtalZLkQhezFEbXunOmVIrbZ68E0BnE6eixvL5cL+rBQPR
 bcd0DnwCkUEGT7pQ21LNUSaCo7m/EcoKTZmKD2M2hWdp8ci/hUS8dZGQr8ufpqi0OW0D
 LVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVh+ysx/XJ2HaFQarq0ZODircWC5hqhYfLiphUA9Ke8=;
 b=xzvUa+wklyUCaPOwxn+oj3CBQI3a3dboS3UrdpQBR+wzhgExQBYVPVYGCYRaA2/mdK
 CWA1TiONkL9LSqxEZ+xNa8Cd01uQWOqEdQ4KJTGMPmBrL1cxLmKJFSJaAYEus8460gZz
 VjKhHC3tow14rStiwddHmFmc6wCRXvI9WtOlW6yL1N8yQWDokEtbGvbVXWqR2FBRrPJ2
 Rwr3Ls05xoBaDUQ0/cnUQdpMkhuX8Qn2RzS159V4JxFtSYI44Flum2JhcwGKo3fVvEMj
 zyMD5GeUKRazH/Xmi4j3yMFIBBcFerCivOcumWB2nNNVlb0RCY6pyxUgsVQJ08R4FiZp
 5svg==
X-Gm-Message-State: AOAM530elveCE4mWvJQ/IyASIAX/LZ8fC5+MucGx5uCjfsErRvnStqxS
 yt6+A4Ct0nUK2w5RcPuAw2makRSwswk93g==
X-Received: by 2002:a63:314b:0:b0:3f5:dc43:3b81 with SMTP id
 x72-20020a63314b000000b003f5dc433b81mr38180148pgx.456.1653675563234; 
 Fri, 27 May 2022 11:19:23 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 015/114] target/arm: Use TRANS_FEAT for do_sve2_zzz_data
Date: Fri, 27 May 2022 11:17:28 -0700
Message-Id: <20220527181907.189259-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: phGEdGtUp/6s

Convert SVE translation functions using do_sve2_zzz_data
to use TRANS_FEAT and gen_gvec_ool_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 69 ++++++++++++++------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b097b44d9f..ac76705da6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3840,61 +3840,42 @@ TRANS_FEAT(SUDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
 TRANS_FEAT(USDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_usdot_idx_b, a)
 
-static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
-                             gen_helper_gvec_3 *fn)
-{
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           vec_full_reg_offset(s, rm),
-                           vsz, vsz, data, fn);
-    }
-    return true;
-}
-
 #define DO_SVE2_RRX(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
-    { return do_sve2_zzz_data(s, a->rd, a->rn, a->rm, a->index, FUNC); }
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
+               a->rd, a->rn, a->rm, a->index)
 
-DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
-DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
-DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
+DO_SVE2_RRX(MUL_zzx_h, gen_helper_gvec_mul_idx_h)
+DO_SVE2_RRX(MUL_zzx_s, gen_helper_gvec_mul_idx_s)
+DO_SVE2_RRX(MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
-DO_SVE2_RRX(trans_SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
-DO_SVE2_RRX(trans_SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
-DO_SVE2_RRX(trans_SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
+DO_SVE2_RRX(SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
+DO_SVE2_RRX(SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
+DO_SVE2_RRX(SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
 
-DO_SVE2_RRX(trans_SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
-DO_SVE2_RRX(trans_SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
-DO_SVE2_RRX(trans_SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
+DO_SVE2_RRX(SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
+DO_SVE2_RRX(SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
+DO_SVE2_RRX(SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
 
 #undef DO_SVE2_RRX
 
 #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
-    static bool NAME(DisasContext *s, arg_rrx_esz *a)           \
-    {                                                           \
-        return do_sve2_zzz_data(s, a->rd, a->rn, a->rm,         \
-                                (a->index << 1) | TOP, FUNC);   \
-    }
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
+               a->rd, a->rn, a->rm, (a->index << 1) | TOP)
 
-DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
-DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
-DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
-DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+DO_SVE2_RRX_TB(SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
 
-DO_SVE2_RRX_TB(trans_SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
-DO_SVE2_RRX_TB(trans_SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
-DO_SVE2_RRX_TB(trans_SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
-DO_SVE2_RRX_TB(trans_SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
+DO_SVE2_RRX_TB(SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
+DO_SVE2_RRX_TB(SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
+DO_SVE2_RRX_TB(SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
+DO_SVE2_RRX_TB(SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
 
-DO_SVE2_RRX_TB(trans_UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
-DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
-DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
-DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
+DO_SVE2_RRX_TB(UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
+DO_SVE2_RRX_TB(UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
+DO_SVE2_RRX_TB(UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
+DO_SVE2_RRX_TB(UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
 #undef DO_SVE2_RRX_TB
 
-- 
2.34.1

