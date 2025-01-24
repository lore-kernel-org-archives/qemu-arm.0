Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp931288njk;
        Fri, 24 Jan 2025 08:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvkYT7gotDwldoS8Sg4o7mM4QJMRZpn0sZA56It2iobhVFn6vp8xcRcz2JaxqqoOVXMjqpdT9Hvvf1KA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5YydA/uCjsMxXdVKLZAkCCdxoDzVlO0nFW4XElas4ESN97eCc7P/XOxqs9aXAtkC6QKPG
X-Received: by 2002:ac8:598e:0:b0:460:8f80:909a with SMTP id d75a77b69052e-46e12b7bf08mr458577571cf.32.1737736596359;
        Fri, 24 Jan 2025 08:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736596; cv=none;
        d=google.com; s=arc-20240605;
        b=U/RcSwbWHNSS06ZvksP+GOwBNx5otZHKuX9ZVaGodS7Mzc2Sj8d9rDQcfrfZV0np8q
         Xgqo+xDDKVLaN3DTMp8TCXbIKsa08QCYiDHn2bX2WOXE1GD/e7EEJUFkmBUYatAH2UhE
         DslL6VBIjQ+7FtOeFPfselcuHOvx/vnY7dv0JZ0OmuGxfVxhrnkIkTNlTxjEMGEJ/R0L
         ECC5ohQTdrZKRTKjQAvCMD3D1Huxu00PSDg95YolBzkR/DE4PxXBJ3HHe1FTqpyewXB2
         qiIY1MaxhCCpvROOG6QK/hjOoJyreduTSQ3bcVPjASSZ77Q4OOzeHAHRjamGddI8/ENf
         3CLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=e2iz1ymTg5b9+bCfwCSDZDBGdLz/53i8ds01lMabmII=;
        fh=jwjdW24xtcOChs4DVPZYTFKh+xCcFVZ9+1eIKxxhnBQ=;
        b=bJeqex9642LNGaD1nI63pjTQboQZ7ewKARMB/iZEmv/O32EvyxinW1nfd2ObGEoxKA
         FeAhPmgIcLIh8HRmuJsbMMVsAq4IasG3zDhE/zoRq1nmw60AyBvyYFvFVuSNb0vYINSp
         pvvof8b8V9OcsDaz1fauMFetlnHeoV3xoA5gZIbST05kK6a5wjCdyk0md0nXoHHTuGy6
         iHxeq70dFbmct9GSkxn0tgo6+C/y1+CYAqq/Hn1hqvNWZOYYQ33080P8WO+bi0JQnvvv
         AbesqmEmTKpzf/nlUJLXXnOOunHg1Ri5CWHGR4TFXdUzd9MKiQcSiFgz8VQmfVDP07fl
         BsoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBJZDrvK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2a9c2si261542285a.595.2025.01.24.08.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBJZDrvK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMbu-0002nL-7D; Fri, 24 Jan 2025 11:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYU-0003yV-8c
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:15 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYS-0005Xo-Ey
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:29:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283dedso23825175e9.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736151; x=1738340951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e2iz1ymTg5b9+bCfwCSDZDBGdLz/53i8ds01lMabmII=;
 b=lBJZDrvKFa+N/IdQgh8q9hVmaG6HyyJemkgeBvRDroCKMqvCWfIFhCszggnnLa/s4I
 1n0hVzYKvmwvMaRHiifP5ISMQ55/WtKJyF9NYhtODDUxNSxIBORlfdGgvzYrZtC7QAF8
 SFLAWaGC7rbNvsjMXBz1maAInrX5vl5f/yUDolR3P9uKDsnDsJypHp6TM2IKSWep/j4o
 wuNWj7CPoNi9GioyaF8wlMJy0JQBNwa/OwTk5QPwj08A6qXi8gGTd8la1DGX8iK/xciZ
 AO5Kuy+fuhM5sHeYTPeHCJPgeWfppAI6hxEGHGZdU/25ewvpPudmu01m5BPGVueoId4Y
 7v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736151; x=1738340951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2iz1ymTg5b9+bCfwCSDZDBGdLz/53i8ds01lMabmII=;
 b=Qet6dHDFBna6s94lSUeGHvz7LgFVem7a78OQ/SQu3ZQ4+wS8ggmkMoqKmhtsfJM72j
 I9urvCp7BEzUDYPIvVzAYk2a9dZQaRbNQHul4pSd72u/zhSfco6DF5CeHma7Ig7HXZo4
 SN89jxBkSINojVPORzX4y9w6r9wu1zKgif3EjAiBnzl9aBZLGrjPNWKVNodTyj+UwkD0
 ummBcaSOhWsppbmoBFTT6GL5yzyNx9UgEXgbmUZVskNAtu9AXdF8Ko9+W3DXsdJOVkd4
 cTXw6uI9SiHjrnrONndnNe1zhCbre4U/0g/tgPINc2xmNkneD9kztF418sp94ufdNDH/
 u5Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyhW66M7/etitWPCgRToVxay8yyBUpNnk0AAxxTjgpfLMYJfU+l3nJbWgnJA2n21zIE1RMKakkJjDz@nongnu.org
X-Gm-Message-State: AOJu0YzKBGYjG0zjNEfuIjvQNBsmxS0O+t9+39i4DJL3Qu9vTYHRwxJ+
 UOe9tophzsRYZMUtmgHAj5/uBmLoxUULxFDJcCcOJWrNuAWRW648DFCRekeP/D0=
X-Gm-Gg: ASbGncuL9qDdiWm680byFrp1w/C/erYEgBn0gWBCuACXl6nzR8jMM7kFCatAxW1qNbT
 vPkdG1t+Pftxx8iB815t/0AADoF3INoxLo81BBbg4X0s8FzxUMQf1ppnTgOH6OnFGlCAUS2LgAJ
 6IWdLlSVj0TVo2uIdy1tym0oqWpvUTHFhX22iELen82BtNfu3KrOGNGHllKFg+22/1Tpw4Bmdiu
 GPKlmoVBq9VswcuWyFwuNNkChKSvGg9e/NgeuupCV49hECqIhDpCX38Vqyu3D9Fayzi15tKau/a
 FWrJaohhVhU=
X-Received: by 2002:a05:600c:468e:b0:436:5165:f1ec with SMTP id
 5b1f17b1804b1-4389143145bmr300790185e9.30.1737736151068; 
 Fri, 24 Jan 2025 08:29:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/76] target/arm: Use FPST_FPCR_F16_A64 for halfprec-to-other
 conversions
Date: Fri, 24 Jan 2025 16:27:46 +0000
Message-Id: <20250124162836.2332150-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oPmGpinpV38Z

We should be using the F16-specific float_status for conversions from
half-precision, because halfprec inputs never set Input Denormal.

Without FEAT_AHP, using the wrong fpst here had no effect, because
the only difference between the F16_A64 and A64 fpst is its handling
of flush-to-zero on input and output, and the helper functions
vfp_fcvt_f16_to_* and vfp_fcvt_*_to_f16 all explicitly squash the
relevant flushing flags, and flush_inputs_to_zero was the only way
that IDC could be set.

With FEAT_AHP, the FPCR.AH=1 behaviour sets IDC for
input_denormal_used, which we will only ignore in
vfp_get_fpsr_from_host() for the F16_A64 fpst; so it matters that we
use that one for f16 inputs (and the normal one for single/double to
f16 conversions).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 9 ++++++---
 target/arm/tcg/translate-sve.c | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 74766a0bc47..a47fdcd2e48 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8568,7 +8568,7 @@ static bool trans_FCVT_s_sh(DisasContext *s, arg_rr *a)
     if (fp_access_check(s)) {
         TCGv_i32 tcg_rn = read_fp_hreg(s, a->rn);
         TCGv_i32 tcg_rd = tcg_temp_new_i32();
-        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR_A64);
+        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR_F16_A64);
         TCGv_i32 tcg_ahp = get_ahp_flag();
 
         gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
@@ -8582,7 +8582,7 @@ static bool trans_FCVT_s_dh(DisasContext *s, arg_rr *a)
     if (fp_access_check(s)) {
         TCGv_i32 tcg_rn = read_fp_hreg(s, a->rn);
         TCGv_i64 tcg_rd = tcg_temp_new_i64();
-        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR_A64);
+        TCGv_ptr tcg_fpst = fpstatus_ptr(FPST_FPCR_F16_A64);
         TCGv_i32 tcg_ahp = get_ahp_flag();
 
         gen_helper_vfp_fcvt_f16_to_f64(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
@@ -9511,13 +9511,14 @@ static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
         return true;
     }
 
-    fpst = fpstatus_ptr(FPST_FPCR_A64);
     if (a->esz == MO_64) {
         /* 32 -> 64 bit fp conversion */
         TCGv_i64 tcg_res[2];
         TCGv_i32 tcg_op = tcg_temp_new_i32();
         int srcelt = a->q ? 2 : 0;
 
+        fpst = fpstatus_ptr(FPST_FPCR_A64);
+
         for (pass = 0; pass < 2; pass++) {
             tcg_res[pass] = tcg_temp_new_i64();
             read_vec_element_i32(s, tcg_op, a->rn, srcelt + pass, MO_32);
@@ -9532,6 +9533,8 @@ static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
         TCGv_i32 tcg_res[4];
         TCGv_i32 ahp = get_ahp_flag();
 
+        fpst = fpstatus_ptr(FPST_FPCR_F16_A64);
+
         for (pass = 0; pass < 4; pass++) {
             tcg_res[pass] = tcg_temp_new_i32();
             read_vec_element_i32(s, tcg_res[pass], a->rn, srcelt + pass, MO_16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 37de816964a..fc7f0d077a5 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3887,7 +3887,7 @@ TRANS_FEAT(FCMLA_zzxz, aa64_sve, gen_gvec_fpst_zzzz, fcmla_idx_fns[a->esz],
 TRANS_FEAT(FCVT_sh, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_sh, a, 0, FPST_FPCR_A64)
 TRANS_FEAT(FCVT_hs, aa64_sve, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve_fcvt_hs, a, 0, FPST_FPCR_A64)
+           gen_helper_sve_fcvt_hs, a, 0, FPST_FPCR_F16_A64)
 
 TRANS_FEAT(BFCVT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_bfcvt, a, 0, FPST_FPCR_A64)
@@ -3895,7 +3895,7 @@ TRANS_FEAT(BFCVT, aa64_sve_bf16, gen_gvec_fpst_arg_zpz,
 TRANS_FEAT(FCVT_dh, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_dh, a, 0, FPST_FPCR_A64)
 TRANS_FEAT(FCVT_hd, aa64_sve, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve_fcvt_hd, a, 0, FPST_FPCR_A64)
+           gen_helper_sve_fcvt_hd, a, 0, FPST_FPCR_F16_A64)
 TRANS_FEAT(FCVT_ds, aa64_sve, gen_gvec_fpst_arg_zpz,
            gen_helper_sve_fcvt_ds, a, 0, FPST_FPCR_A64)
 TRANS_FEAT(FCVT_sd, aa64_sve, gen_gvec_fpst_arg_zpz,
-- 
2.34.1

