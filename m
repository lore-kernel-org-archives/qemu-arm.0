Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp588619njb;
        Thu, 5 Dec 2024 19:20:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ1hOVCkhS3BPaBhhmHsjDUcmOnZIPagYoZHhMeeRXYKjK8/a5lN79IVwOQy2X8PXrQOPzA5tYNRbVUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEw7f7gxuKgFxMmJ0bT7rACN95E3qd66FTqumRNl4KA+YEnhCdMLGiyWnkh3ag7QL07597/
X-Received: by 2002:a05:620a:4083:b0:7b1:465c:ce2 with SMTP id af79cd13be357-7b6bcb83a1emr287850985a.52.1733455229168;
        Thu, 05 Dec 2024 19:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733455229; cv=none;
        d=google.com; s=arc-20240605;
        b=a842rYkhYwrQzoknYtYL4nGLsEWijp0izEOpSrYq1051Jg+cH34ku6pPAl+xkH02Yu
         DPE+GIQkWy+A+1Pp0drKBc/Ss6OA9vXDQ5H1VPwKppvMxGqdtWeV8dY6VazTN0qSdBCg
         X/u8BMPymHusqGMoWvT5Dnv4hyv1jEFk4+UrkNC7KYzOo4GEc2q81QK9VdAo71stikKp
         7vIxfr/3HEWgai8Lxc1j21GQJyRptTwpL65qi1fi6zmNAH3UEKZsCXy+NBex9eh2vyxp
         DNx8l42UqiZ5wasJr0VhCPrtMkMHk1TZFQqvPXSGAnUXnayMsa0KMTdq0qAYPbYYvTGC
         d8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ibdd8VDkjFPzML8s48eYkRj1V2SiKDJHWaM9nlMLIEk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Ti188SVMgu9FG6Vu9KEkcsqzDGnjgPfMnCi7QqaB0KTa3Ls48wQ6nyx2tCgcweCr2B
         8isUZfuX1/YrGjsCTAqqViEF1Be9oC/mMoRZEw5M0p9pXepQPINtZiIdNtb23Nivi8K0
         QcIAB5xtHxC28aMviOm4quHkFbGqwioLZ1CatZ85BZka6tRz6wQibB1FVF/SH55gcWRf
         63CkvF2bmNU9eGcqo2psWQNnrl9kM+kdiLpdAlwVxImc02bU3dIWSHkcXYvkRkY3XnFg
         KrjmmTr8K0Je4Ua9nJxkh0OuOb3mytNRjAJVy1u072eq5G3mMO6OeHte5rJ7a3feHWtS
         AaQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXzpLHE4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b7de2si31820891cf.96.2024.12.05.19.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 19:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CXzpLHE4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJOsw-0006KT-Q9; Thu, 05 Dec 2024 22:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOsq-0006GS-IT
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:20:00 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOso-0006BG-RC
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:20:00 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-71d5862c1d1so654940a34.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 19:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733455197; x=1734059997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ibdd8VDkjFPzML8s48eYkRj1V2SiKDJHWaM9nlMLIEk=;
 b=CXzpLHE4G/1lrAVoOtQsNzUiDoAcvUeoM+7c1PcNgw9HIszFPAMxKLjqOTgqAvIaWa
 JRPv01SP3DSfrP4HZhaV8ns/nPuw4RHQPRKshyjmhKCIndWeBJ4xoj8qe72jvQKrvZqa
 v8l/EpKi3HUX49lOpmoSZE0puPlGN2uHfbHnfw/ESg3mkkqTyel6/kXxTNW03SXumDqZ
 7WdLBBjQE57LVzovZJF1M294cnWUG8ZDG3XwhDBOeuR/EN+2fvLkA4vvZO3Fo9AuKrYB
 6On6YDFPSzoftsY9JvuUwCdthHRVnmaen50zPelF4vhl6oCG4+fTfBfmHEegboc9pjDE
 85FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733455197; x=1734059997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ibdd8VDkjFPzML8s48eYkRj1V2SiKDJHWaM9nlMLIEk=;
 b=O3h4w4TB0ED6sYZCFCwUX3iW66k1hVkqYTifiQSyPqXXwWgfhcLdFanFHNWhnwdspE
 Mab0/ZTUKKcY+NkXRY1UK8ZmLxAjoEVG38rBu1r//uGUknXbX029XMSnsBa8CPxAvXVP
 v7oVeLI0S1i9rpUhElEv+TQoDaoCOVm8oSJHUDvJnB0uYmYsZR4gRNVEtqt4CHSz5mGe
 Ctgxcn1ftC1HaDdthkZPqBpiKKOry0b/H3IdCQ3Pr15Bp746S37ayXuDBhiM/Cyh6miB
 bff/mYUbpUucn5fKr1l2W2tpi+RPzqK2HvKNReln9QC8Qb6wmTFHgQG/RfFZMmi1MVbB
 o3ZA==
X-Gm-Message-State: AOJu0Ywl0y5SpeNBrdJ+TvB15HxI/HfxN2KB1eF/w4tBGeutjBnAarK7
 H4kOyXFn5AYgOqWHduAmz87k0hFg0EApgPRC5oQYLTnap/skBLFePwypsGOBYfY=
X-Gm-Gg: ASbGnctvbNN+1+QCIvPdnF+Hq7lVtr53RndJeAmGnoqpfISNrzHmxU6tr6poD7I+D13
 fKgS2vhG+BsErUettzTG/K2xLVXwg0fR/K23+zxTdA5dZ6zaDOkWxHiCasuGy4zOjUhblwbrGmk
 ryUkixNtoK6nDrM1AjhhgMzVRIHv5UeI3yLWp3o16wCYO3GGfqXbYz162WXHt8vAm1a+TBsRY/i
 GBYT+lX7bljiECmfwMYIy2aVnnm8fynIQAAiRd9L0G5TvOQX8jnLpOa4JfLcPntCe5NZ2RoW6XW
 CW4Wc6zV1USTLF4M1kHWWn4ElH/Yrkviz7Q1
X-Received: by 2002:a05:6830:2aa5:b0:71d:5604:2084 with SMTP id
 46e09a7af769-71dcf4bead8mr857427a34.5.1733455197709; 
 Thu, 05 Dec 2024 19:19:57 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f2793255bbsm541045eaf.40.2024.12.05.19.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:19:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Use float_status in helper_vfp_fcvt{ds,sd}
Date: Thu,  5 Dec 2024 21:19:52 -0600
Message-ID: <20241206031952.78776-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206031952.78776-1-richard.henderson@linaro.org>
References: <20241206031952.78776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
X-TUID: REbbDhNEmoDI

Pass float_status not env to match other functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  4 ++--
 target/arm/tcg/translate-a64.c | 15 ++++++++++-----
 target/arm/tcg/translate-vfp.c |  4 ++--
 target/arm/vfp_helper.c        |  8 ++++----
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index d4c8ff40a1..6abab5da99 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -147,8 +147,8 @@ DEF_HELPER_3(vfp_cmpeh, void, f16, f16, env)
 DEF_HELPER_3(vfp_cmpes, void, f32, f32, env)
 DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 
-DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
-DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
+DEF_HELPER_2(vfp_fcvtds, f64, f32, fpst)
+DEF_HELPER_2(vfp_fcvtsd, f32, f64, fpst)
 DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, fpst)
 DEF_HELPER_FLAGS_2(bfcvt_pair, TCG_CALL_NO_RWG, i32, i64, fpst)
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6286e4fda3..f0d5ce123e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8502,8 +8502,9 @@ static bool trans_FCVT_s_ds(DisasContext *s, arg_rr *a)
     if (fp_access_check(s)) {
         TCGv_i32 tcg_rn = read_fp_sreg(s, a->rn);
         TCGv_i64 tcg_rd = tcg_temp_new_i64();
+        TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
 
-        gen_helper_vfp_fcvtds(tcg_rd, tcg_rn, tcg_env);
+        gen_helper_vfp_fcvtds(tcg_rd, tcg_rn, fpst);
         write_fp_dreg(s, a->rd, tcg_rd);
     }
     return true;
@@ -8528,8 +8529,9 @@ static bool trans_FCVT_s_sd(DisasContext *s, arg_rr *a)
     if (fp_access_check(s)) {
         TCGv_i64 tcg_rn = read_fp_dreg(s, a->rn);
         TCGv_i32 tcg_rd = tcg_temp_new_i32();
+        TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
 
-        gen_helper_vfp_fcvtsd(tcg_rd, tcg_rn, tcg_env);
+        gen_helper_vfp_fcvtsd(tcg_rd, tcg_rn, fpst);
         write_fp_sreg(s, a->rd, tcg_rd);
     }
     return true;
@@ -9208,7 +9210,9 @@ static void gen_fcvtn_hs(TCGv_i64 d, TCGv_i64 n)
 static void gen_fcvtn_sd(TCGv_i64 d, TCGv_i64 n)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
-    gen_helper_vfp_fcvtsd(tmp, n, tcg_env);
+    TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
+
+    gen_helper_vfp_fcvtsd(tmp, n, fpst);
     tcg_gen_extu_i32_i64(d, tmp);
 }
 
@@ -9498,11 +9502,13 @@ static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
      * The only instruction like this is FCVTL.
      */
     int pass;
+    TCGv_ptr fpst;
 
     if (!fp_access_check(s)) {
         return true;
     }
 
+    fpst = fpstatus_ptr(FPST_FPCR);
     if (a->esz == MO_64) {
         /* 32 -> 64 bit fp conversion */
         TCGv_i64 tcg_res[2];
@@ -9512,7 +9518,7 @@ static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
         for (pass = 0; pass < 2; pass++) {
             tcg_res[pass] = tcg_temp_new_i64();
             read_vec_element_i32(s, tcg_op, a->rn, srcelt + pass, MO_32);
-            gen_helper_vfp_fcvtds(tcg_res[pass], tcg_op, tcg_env);
+            gen_helper_vfp_fcvtds(tcg_res[pass], tcg_op, fpst);
         }
         for (pass = 0; pass < 2; pass++) {
             write_vec_element(s, tcg_res[pass], a->rd, pass, MO_64);
@@ -9521,7 +9527,6 @@ static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
         /* 16 -> 32 bit fp conversion */
         int srcelt = a->q ? 4 : 0;
         TCGv_i32 tcg_res[4];
-        TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
         TCGv_i32 ahp = get_ahp_flag();
 
         for (pass = 0; pass < 4; pass++) {
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index c160a86e70..3cbe9a7418 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -2937,7 +2937,7 @@ static bool trans_VCVT_sp(DisasContext *s, arg_VCVT_sp *a)
     vm = tcg_temp_new_i32();
     vd = tcg_temp_new_i64();
     vfp_load_reg32(vm, a->vm);
-    gen_helper_vfp_fcvtds(vd, vm, tcg_env);
+    gen_helper_vfp_fcvtds(vd, vm, fpstatus_ptr(FPST_FPCR));
     vfp_store_reg64(vd, a->vd);
     return true;
 }
@@ -2963,7 +2963,7 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
     vd = tcg_temp_new_i32();
     vm = tcg_temp_new_i64();
     vfp_load_reg64(vm, a->vm);
-    gen_helper_vfp_fcvtsd(vd, vm, tcg_env);
+    gen_helper_vfp_fcvtsd(vd, vm, fpstatus_ptr(FPST_FPCR));
     vfp_store_reg32(vd, a->vd);
     return true;
 }
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 26a52852fc..40c13f3685 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -400,14 +400,14 @@ FLOAT_CONVS(ui, d, float64, 64, u)
 #undef FLOAT_CONVS
 
 /* floating point conversion */
-float64 VFP_HELPER(fcvtd, s)(float32 x, CPUARMState *env)
+float64 VFP_HELPER(fcvtd, s)(float32 x, float_status *status)
 {
-    return float32_to_float64(x, &env->vfp.fp_status);
+    return float32_to_float64(x, status);
 }
 
-float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
+float32 VFP_HELPER(fcvts, d)(float64 x, float_status *status)
 {
-    return float64_to_float32(x, &env->vfp.fp_status);
+    return float64_to_float32(x, status);
 }
 
 uint32_t HELPER(bfcvt)(float32 x, float_status *status)
-- 
2.43.0

