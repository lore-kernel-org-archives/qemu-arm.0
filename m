Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1144577njb;
        Sat, 1 Feb 2025 08:46:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfh+7M8uLBCGF25uAWiMjdjUwS2loa2muMLxNdVrQZZlUyOi14VvyGYaF3FFXuASbt+9vwV9exY2mdFg==@linaro.org
X-Google-Smtp-Source: AGHT+IE61LvcOwo4vX23z5KEx4mMHpthu60SWK0J/q0rZfqi6m2Iuc2+DlGf2IsBELjUNVDyxcXb
X-Received: by 2002:a05:622a:5108:b0:45d:8be9:b0e6 with SMTP id d75a77b69052e-46fd0b92332mr253081471cf.43.1738428388578;
        Sat, 01 Feb 2025 08:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428388; cv=none;
        d=google.com; s=arc-20240605;
        b=MJdqGUBuN/cloD+zWXT6RqO4up2aTYsfsspplopsEWgMHnT0VePZY6RLbGb024KYOj
         wNO1QBDXhO3bkSf8bnxjBYeZlbopHo+Yh6tlgdWvbpldBThz93SdG7NzFxxLo1K+vTNa
         rKDw0/zVWq5fbITC3bMRbILxJ27hHqqCtkc6DCEkmxROiIC2bKgngGtxEo7CAvNtqH/C
         ilpEnyF8MdE+U0eKAD0vSlRIZ1gqSybZOtRHdo76XorEDXyJvzcfcprXENuvkO3SHp0X
         LcP42nC1eegbebV7BBs41SwvItx3OZiIG1Lm7tDMIwymN+H2C+CgHyCM+M/YocjcAiwX
         3pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t5Lc0sWgo+3G84LPfignpf76iyeDNPt3aNSusiwbo3I=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ccCvCU7REel6TMSTvVVlp3z3n2aSqZLzzurFfHEZuaHEsgjT1KoeOHeAjwdxnWMg1C
         yVIimpSHXdoCsZHL6LB0hvPvo4tPUuuCNPDSjp1u3vEsH0fNsT6o5BQXCrLo1CRkKuzW
         jRe4LF2biPtGF4FgKZ12xawXr4ra2G21UUfhmof42QCTeuuaPn6b0J3V2+e8Mm6+ftK1
         081vFpCwok0PyVF5xzkXF12O/3IBSjiCpHiFd4gNgCeoj+c+LvZg8VATHnIAodNi2Zx2
         vq4uuTX0MZQjHkhrmDybxW9JEObBqLtb/ZRAdEVH1/vfx24Z24qZmtF85sxQzkv+TX3o
         dOVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zs/DIQVp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d0581si61475951cf.359.2025.02.01.08.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:46:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zs/DIQVp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYX-0006yH-Gh; Sat, 01 Feb 2025 11:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYS-0006no-GA
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:12 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYQ-0001G7-Lk
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so20838595e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428069; x=1739032869; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t5Lc0sWgo+3G84LPfignpf76iyeDNPt3aNSusiwbo3I=;
 b=Zs/DIQVpxZgsCw0Y0U+pJHSuO2z1SCYlam/DMQrJY1Hx91mbEjX8RSkYs+OoGQHcmy
 zyoMc5tYSZfcJszFyjFXf/vP8k6Fw+u0JZETNvco8LvvK+qALMcwQ7/xefLDp2eKRDw9
 CcuJuhHeO9c+gDH6yrHGBVzG6UAN3fqOQsu6C4hs34QkpK0KT647iQGU9jZEP5YhqA7c
 Wi00itzYKww7XVvMT1knM3YzaDvOLKT+hN34hVReYcOT+GIVMfBRmkBKKZuNFBetYGOv
 6dE9NvNuKm3x0/zPHBSSuJ0pcyUtq7jQWvgWKWka+dxKkwiUQgxHBLpTykQoMzRvXQTE
 K1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428069; x=1739032869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t5Lc0sWgo+3G84LPfignpf76iyeDNPt3aNSusiwbo3I=;
 b=Ykp4ZwgIxr/lqv5G+D/94a1yCWm9Hrk3waOJuHCzxJONOhYNnj4JR/Leyf8jH5f+VY
 JpWl670YNrMxCgb6sigr2j7ULSvFPX/+HVCpwnS0n5uEG9foz2M6uLmrDugk6BMw5j4R
 qXmBXsPRRqtTE+orxExIdOmtctnspqZt4alfRXSMt7XNWXBFgoVMCu4PeC548cbY+pcv
 dIJ3kOiioCLVE3Ef+zP9CSn89MOK28w02kRVAjheNJRBBKaDI6uzQFxxyiE9UJikszif
 RymXOJO1MVGenM76GvScluK1QLETruDjKsFee92TsrQ6Q3m1sUsBtmi+iFioBB8XVzzW
 ywog==
X-Gm-Message-State: AOJu0Yxw/fzjXI5oXt9G+26/uQTQTtF/FXqrkm2WjELqsd61lhcU7SNX
 b+v+Kc24kuJZS8hGZ0oFE0q45EHnP2Omu8aM2X6nIVElYJsLEkzirU/Rip37Cgb+zMSqiio34zh
 P
X-Gm-Gg: ASbGncvvpE6ok6kDRqqbtftLwq8p9Gqh7T7hPOuI7fqQI41QJ3uL7SNByDu2WA6r5mH
 7qPEdVt8aawrCyZWtgqUTriuALpVXVrrQvhx/BxX3hTXMYA7hIyInddvv2t9XIVnxQqBzq7Cmbl
 hp+QwPd9qbJiUP4FqU6SSIugib/AhdSR7atulvwTJq5DLdwUM6BMSyHcc5SLwCnJb2o5nhp8lGb
 vv1DeXxMPYVQ0l/bIBoEEHgzIahu21GKBis6fgtpj/s65hmyuczigTzETFF0E3W+LrCpaeVOls3
 VbEOBEhFcVCk11gGM1ty
X-Received: by 2002:a05:600c:5488:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-438dc4223aemr116341325e9.27.1738428069137; 
 Sat, 01 Feb 2025 08:41:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 42/69] target/arm: Handle FPCR.AH in negation in FMLS
 (vector)
Date: Sat,  1 Feb 2025 16:39:45 +0000
Message-Id: <20250201164012.1660228-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: S3rZNsnhV7Ig

Handle the FPCR.AH "don't negate the sign of a NaN" semantics
in FMLS (vector), by implementing a new set of helpers for
the AH=1 case.

The float_muladd_negate_product flag produces the same result
as negating either of the multiplication operands, assuming
neither of the operands are NaNs.  But since FEAT_AFP does not
negate NaNs, this behaviour is exactly what we need.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: squashed in RTH's patch to use the muladd flag
---
 target/arm/helper.h            |  4 ++++
 target/arm/tcg/translate-a64.c |  7 ++++++-
 target/arm/tcg/vec_helper.c    | 22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index be47edff896..f0a783b7088 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -782,6 +782,10 @@ DEF_HELPER_FLAGS_5(gvec_vfms_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfms_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfms_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_ah_vfms_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_vfms_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_vfms_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2509a29528e..c209ac84228 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5871,7 +5871,12 @@ static gen_helper_gvec_3_ptr * const f_vector_fmls[3] = {
     gen_helper_gvec_vfms_s,
     gen_helper_gvec_vfms_d,
 };
-TRANS(FMLS_v, do_fp3_vector, a, 0, f_vector_fmls)
+static gen_helper_gvec_3_ptr * const f_vector_fmls_ah[3] = {
+    gen_helper_gvec_ah_vfms_h,
+    gen_helper_gvec_ah_vfms_s,
+    gen_helper_gvec_ah_vfms_d,
+};
+TRANS(FMLS_v, do_fp3_vector_2fn, a, 0, f_vector_fmls, f_vector_fmls_ah)
 
 static gen_helper_gvec_3_ptr * const f_vector_fcmeq[3] = {
     gen_helper_gvec_fceq_h,
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index ae3cb50fa24..fc3e6587b81 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1558,6 +1558,24 @@ static float64 float64_mulsub_f(float64 dest, float64 op1, float64 op2,
     return float64_muladd(float64_chs(op1), op2, dest, 0, stat);
 }
 
+static float16 float16_ah_mulsub_f(float16 dest, float16 op1, float16 op2,
+                                 float_status *stat)
+{
+    return float16_muladd(op1, op2, dest, float_muladd_negate_product, stat);
+}
+
+static float32 float32_ah_mulsub_f(float32 dest, float32 op1, float32 op2,
+                                 float_status *stat)
+{
+    return float32_muladd(op1, op2, dest, float_muladd_negate_product, stat);
+}
+
+static float64 float64_ah_mulsub_f(float64 dest, float64 op1, float64 op2,
+                                 float_status *stat)
+{
+    return float64_muladd(op1, op2, dest, float_muladd_negate_product, stat);
+}
+
 #define DO_MULADD(NAME, FUNC, TYPE)                                        \
 void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
                   float_status *stat, uint32_t desc)                       \
@@ -1584,6 +1602,10 @@ DO_MULADD(gvec_vfms_h, float16_mulsub_f, float16)
 DO_MULADD(gvec_vfms_s, float32_mulsub_f, float32)
 DO_MULADD(gvec_vfms_d, float64_mulsub_f, float64)
 
+DO_MULADD(gvec_ah_vfms_h, float16_ah_mulsub_f, float16)
+DO_MULADD(gvec_ah_vfms_s, float32_ah_mulsub_f, float32)
+DO_MULADD(gvec_ah_vfms_d, float64_ah_mulsub_f, float64)
+
 /* For the indexed ops, SVE applies the index per 128-bit vector segment.
  * For AdvSIMD, there is of course only one such vector segment.
  */
-- 
2.34.1

