Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1145538njb;
        Sat, 1 Feb 2025 08:48:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqL6IfVX3pLkw82VHSf/e1HsKI3JAEVLznOJKj6NL4fe0/BaNoJ3G8tU02setGR9yGqcvulCA8AwLoGA==@linaro.org
X-Google-Smtp-Source: AGHT+IGhJ/puOu06R+2TXT5/yJ7p/bdLvyJzhKkje1ZCran2J6IVQhiWIPxLO6mnqpOOkvI+66MH
X-Received: by 2002:ac8:5811:0:b0:466:b382:a789 with SMTP id d75a77b69052e-46fd0a820bcmr243618611cf.4.1738428509323;
        Sat, 01 Feb 2025 08:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428509; cv=none;
        d=google.com; s=arc-20240605;
        b=RdK6rX48FfhtfjIorp1+YWqMX08wQ7TGlbx2G+LJvHKVYDikHdpSIO98ohtoYtkEqz
         BlNU/u75iyidnyDrOreglG/ikaRTRyU/qeqFYKw7PEI28St5y0qZQ0mKpaLfJrJXrv/1
         2vyEzuJl/m5INnnFTKAPbJfhNEXvOeP3l3c6ny7mu8SBAk+kJLwmK25tJIVcqLviV8Fx
         HLMSv/JVWPU9NduGNglN+x1AYRG+ywThVyRx9bYjWVN+/8Oh6IbsTIktMhdqbhIKBes3
         22ipITxcSu5b33pDtingBuycVJTBBv/j9KqFhSTzh00UerOpgFAbK4oupVgRDic1nVyf
         /dMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ryV1Ue0br35R/rD6LQ3aXcrygp6/qiCCF2NgOcEO2tA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=SnKgb5Cfhne1R/560835ILclrUfQ/yMuNEQGsHPjwDELa0icNlTP+3ehvVEaVJSXYK
         WA/0LVwhHdDiw4dk8cxGDd8JTQ0p14Q3V2Aif/WJGNHIONLc0J9b6ED3cvNH2J9H7hms
         kDvOlRjvF57tbjek7sN8SXjdOHVktkvgRJyTq3lqNyWSbwz9mI+fHjfTFZtorz4M+mUg
         nNdOy6PfWg3GGa4wZBpGjhAnTt5FY2b5YLWGt1LBejaBmBDmStR+3v1Y7Lr2xlMHVU2W
         9I45gwyPIhfY9dfF1LbD1wwZVEQ4fcOUJ6hR4mAYLvaJE9bGW5TnmdTrjzeQSnKdn/ZS
         JW3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uLfaD99u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0aadb0si61446231cf.9.2025.02.01.08.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:48:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uLfaD99u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYR-0006kA-G8; Sat, 01 Feb 2025 11:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYM-0006bp-In
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYK-0001Dv-Pb
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so20838205e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428063; x=1739032863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ryV1Ue0br35R/rD6LQ3aXcrygp6/qiCCF2NgOcEO2tA=;
 b=uLfaD99ua/2557VvSRd5fgJIk2jlwzVbHh+Y4qWVlibBrkrERPMKbbCmUf2L/kgRu9
 7srY7Ags5pX2weP3EtQQoWrJ4uM5MZy3fWxOfadzPphpWBY2fu0nY3Sn+xCSjizF+OKl
 HcPFwx5b9AS4qbu1cKnpJCL9fpm+g/TfmJ+uG+YWVcyOVRvPq5b/rodmKnrofPsXEw4A
 sUiOh9o3dxoc7Nm60pH6ZTmLkoUTECa6RhgY+7ReHMFHZ40fTQjiSaxx93v/qQYwO3bs
 ABCL3RZ7OghXCauwzM2OQmrC8xsgXUTF3eJogCbY2ZGhN15YlEIcYni2ieaRWDA52+vs
 bzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428063; x=1739032863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryV1Ue0br35R/rD6LQ3aXcrygp6/qiCCF2NgOcEO2tA=;
 b=BaTpmSI3WHyawsVBssDBMeotpTW/tzlU6JYuhPZ6djCRwsTPZjC4icFLGIr5rVsoGk
 ZyecB1DnLHxLemND7eh71qiOOT9GM1csFQHYGI6Dam1/Np9TPty2mkQE8qnyHAm3052j
 dOA5iQP55sYRPH0GlMfolCs1+tOiYRc/vbH2MgjwUuG4pqZ577l+DvJq16K5vLuSkYBW
 1oQR+EZcORYFqa1V4m2S1VQ1DRaNbzCXPCwaYqYewvhFCZMfIey7oIswNKMi7bsTp39V
 3941h6L2MgCCyHYqnm8k7iFMRfQYYpOyMTSvD01/TaMMvylNpGJ/CnhGuKG4a7eU3ejm
 9zMQ==
X-Gm-Message-State: AOJu0YyDRbAy/7+LIjvtZlXyGh6weCx7jWTFu8qvol49CxxG+y0UUcP1
 peI1nWHw2JkVaU/lPJzDULReaO8aCz/zGH41evmlMFzOZeGKfXkOzyhVXwmE0KTjSy99jgqsEKb
 M
X-Gm-Gg: ASbGncsbajtKjIO6b9E1R0dz1pab4cWq3bCpeQUcrp4imOJNaNIhsscB8uaIyLJRr2K
 /XGpH45nrRumdHVe/0lgJJOPT4YQ60YABzrxgdU0dPfNmR0/QwuvkWGuLcvrQbRXbWeJR7CSrKI
 rP+g8yMDdI5BMYbFFQyPoybDWiiJGly6HyvJL0H92PdXtECw+lUGmhcftC9N/ohjy6U4NuFhPFQ
 TKyrQzq8qqvlQ/Eqy83y4IWMrbLAd880MxbhfLJ1QhTyRP92T+1x5xpwamQZiIndBxPa6gosA6D
 vAEhLwkiM8chCsz6zTzC
X-Received: by 2002:a05:600c:4fc1:b0:434:9d62:aa23 with SMTP id
 5b1f17b1804b1-438dc40d296mr121435295e9.20.1738428063285; 
 Sat, 01 Feb 2025 08:41:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 36/69] target/arm: Handle FPCR.AH in SVE FABD
Date: Sat,  1 Feb 2025 16:39:39 +0000
Message-Id: <20250201164012.1660228-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: Y8EB/36Y1PEM

Make the SVE FABD insn honour the FPCR.AH "don't negate the sign
of a NaN" semantics.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  7 +++++++
 target/arm/tcg/sve_helper.c    | 22 ++++++++++++++++++++++
 target/arm/tcg/translate-sve.c |  2 +-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index ff12f650c87..29c70f054af 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1183,6 +1183,13 @@ DEF_HELPER_FLAGS_6(sve_fabd_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fabd_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fabd_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fabd_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve_ah_fabd_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_6(sve_fscalbn_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fscalbn_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 5ce7d736475..8527a7495a6 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4394,9 +4394,31 @@ static inline float64 abd_d(float64 a, float64 b, float_status *s)
     return float64_abs(float64_sub(a, b, s));
 }
 
+/* ABD when FPCR.AH = 1: avoid flipping sign bit of a NaN result */
+static float16 ah_abd_h(float16 op1, float16 op2, float_status *stat)
+{
+    float16 r = float16_sub(op1, op2, stat);
+    return float16_is_any_nan(r) ? r : float16_abs(r);
+}
+
+static float32 ah_abd_s(float32 op1, float32 op2, float_status *stat)
+{
+    float32 r = float32_sub(op1, op2, stat);
+    return float32_is_any_nan(r) ? r : float32_abs(r);
+}
+
+static float64 ah_abd_d(float64 op1, float64 op2, float_status *stat)
+{
+    float64 r = float64_sub(op1, op2, stat);
+    return float64_is_any_nan(r) ? r : float64_abs(r);
+}
+
 DO_ZPZZ_FP(sve_fabd_h, uint16_t, H1_2, abd_h)
 DO_ZPZZ_FP(sve_fabd_s, uint32_t, H1_4, abd_s)
 DO_ZPZZ_FP(sve_fabd_d, uint64_t, H1_8, abd_d)
+DO_ZPZZ_FP(sve_ah_fabd_h, uint16_t, H1_2, ah_abd_h)
+DO_ZPZZ_FP(sve_ah_fabd_s, uint32_t, H1_4, ah_abd_s)
+DO_ZPZZ_FP(sve_ah_fabd_d, uint64_t, H1_8, ah_abd_d)
 
 static inline float64 scalbn_d(float64 a, int64_t b, float_status *s)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 646d0171d99..0d8bd1a49c4 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3789,7 +3789,7 @@ DO_ZPZZ_AH_FP(FMIN_zpzz, aa64_sve, sve_fmin, sve_ah_fmin)
 DO_ZPZZ_AH_FP(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
 DO_ZPZZ_FP(FMINNM_zpzz, aa64_sve, sve_fminnum)
 DO_ZPZZ_FP(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
-DO_ZPZZ_FP(FABD, aa64_sve, sve_fabd)
+DO_ZPZZ_AH_FP(FABD, aa64_sve, sve_fabd, sve_ah_fabd)
 DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
 DO_ZPZZ_FP(FDIV, aa64_sve, sve_fdiv)
 DO_ZPZZ_FP(FMULX, aa64_sve, sve_fmulx)
-- 
2.34.1

