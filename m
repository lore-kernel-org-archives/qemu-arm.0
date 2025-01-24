Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp929614njk;
        Fri, 24 Jan 2025 08:33:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3/Y9ckEbvtZYueMCC1/g6jPfpHu4hLDY103Md7kauPjOCp4fbgb/gkPkv0LWU/LG/YUB+l64gIwe61g==@linaro.org
X-Google-Smtp-Source: AGHT+IGeD4PCkTRWFDzyqiCoGNxw0ZxcYRTrVuJJcGVB4NhjJy8SHZGST2td7YzwtwR90G30P/oi
X-Received: by 2002:a05:6122:2106:b0:517:167a:5cc6 with SMTP id 71dfb90a1353d-51d5b2f032bmr27741194e0c.6.1737736429717;
        Fri, 24 Jan 2025 08:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736429; cv=none;
        d=google.com; s=arc-20240605;
        b=gT1jW5G5WXs9SW5yY0FFSyVFntbtJC9soFWmWzUShFhROgzIg/9c+32DA6tk54CIqG
         Y633zaDAakpdD4yOpObuUZWAfxy8i0WWYAJqsyd6aMzFH0xwDsIAlk3sgxa4VPGn+Fp7
         MGeSbQ0JzIUI5CV/0Iq1yRpgeIST1xvm8rbq3u2OMWWXlqIz/X0NGAb/FEK9gRc/Cs3p
         JglpO5gbgP6oP390mdJu1thpUNaonrY7Mze5rG1EOGUqu5Huyj3uP/TW+btpJUGYWIeN
         Ia39zHb/e1kpqbXcs+fd4XvLN8QydAhVOw+uSIU3XeCQO3Cn0dGZT7gSAccSt2VF2uKv
         6UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TJWHKwJc3eVXnXS7s+U0+OWmDKYYczcs9FMJOdpDaQc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=lxdUN8PlfDRmFX2rk5XJF3KCK7OwIIUqkzdSQY24TqJYnqbuRbm8dYrVPLp5LZCKYR
         lHFmFVUg6JsGCh9V9Sr4d1XOswAX4K5mL8jXY5Uols7nQAJZ+/SfvDcSGG515ZBIiRWj
         0u3poqdZAGuvJZfx//QtSmQ1zC4roYqEFPmq6+wA34Nb6b7In3oiquY0NpM/c2tjMSha
         W7ayxZ+LydXf/5IjTHhNy539N0Fb/Ajs0NDX/vv/qqORdBlkfc12t40F5FSKY6iGruGy
         JiA2omUzMwU6bv0K8G+C41j3z49F5mK1pfNeIa0kCt4+l0Dr9eXiIMtJIKKJ4MOtrOJI
         cVTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XfkzxoyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ec826fcsi986689e0c.183.2025.01.24.08.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XfkzxoyG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMc9-0004Yf-50; Fri, 24 Jan 2025 11:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYr-0005AY-AE
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYp-0005ft-1U
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so15864935e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736173; x=1738340973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TJWHKwJc3eVXnXS7s+U0+OWmDKYYczcs9FMJOdpDaQc=;
 b=XfkzxoyG7VokJzyXm4X3yULPKw0utZA4mN2vItNaxuyYexP1TK2p6Vwh/sxCUCdpIo
 13EV+HNJBpfWuTJX+deRULB85723Uu5TdG5ysN/sPB/OpY1kRe6YMV3gf28xRBetcC9S
 gIPvsVI0leN5tZiPiiI+ToB8xcg+4kFIw0oqacIEN02e0aHlRGFPAepgipja5GAbi5wY
 D/Z6wtyt/ho2RCRrwUNwCFahDaJ9C+Bq0eNn7pMPNciXcwB3DnsdnANiPUBH898gwU8h
 +1/mkMM5MizLpa+g5S41CROzIYy3Y7+dqZt/+YNE+WqsVEwnTZTRaoEvi+B6Ez5Lj1X5
 rjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736173; x=1738340973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJWHKwJc3eVXnXS7s+U0+OWmDKYYczcs9FMJOdpDaQc=;
 b=ZlsmV9yLT7UB9v2/DB5ndj8LqoxxiXt5Em3llIwd80u1i6bh8MjpYy9QCYJAPAqznb
 uC6ddcZIvlxAaatCutBNE+GxRVnrfsUvjZcgvprJUCw+uYgH0mxx4M9qP9X41wUIZSqj
 ryTyWQPhc/HWRyTtCmpXUmML7e3M0NOJiLCoa6Gn9+B/P+q1E0uqZ5HZhp5YHDa0adYi
 be9hpADNiphIfAR4zvgAHjWG9PejAq5f2chtiwus4YHkt/HKpvzJmo2gCuPw00vVyeSc
 aUgLe2mMKweuY2NkSUJdkEAekRPQtbAw29G9QEgiJKFosgQLAdCNDXvHggJ6Hx8sPVMv
 0WHg==
X-Gm-Message-State: AOJu0YyQLBtWZHZujJ/J0xKFBaqVc0AW8bpLQZ5yNvG7fOaxOD1zaAeu
 oyOkD4rOtGjEjF0OKvOYDtQDaEZGhI6/TWAVBr9qpooo+EiWUiKOKEvLVD48OJMDFGEzmSec5FD
 i
X-Gm-Gg: ASbGnctBRfEYuJYcPlljgksnbuPGLtcUAqzo0Az3MpLXfIFZov/QaXmr5LoNfPK3/cv
 XxmaBsJ+l7tVWyl5a9lg7GQY6aHASqTaLB0CKet8JkOiRXnSI+tj4d7rkw85MblKE5P8eAx/fpB
 ILgf5PPXbvBOSo2omCo8TobJa11zZiZNNbQ8DJEsZu4D0tumoZ9C5eHSu5rKIQIhhthvn0w5PQK
 Ej7oQh7PCawpwgecygr3oYBl8rh8iB/iAyayMNmUG5fHfXxPBcTyouMr1Ug0G7HOl1UvCyppcLY
 0DZ3OKoFBJk=
X-Received: by 2002:a05:600c:8717:b0:434:fbcd:1382 with SMTP id
 5b1f17b1804b1-438913ca6acmr330021005e9.11.1737736173597; 
 Fri, 24 Jan 2025 08:29:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 45/76] target/arm: Implement FPCR.AH semantics for scalar
 FMIN/FMAX
Date: Fri, 24 Jan 2025 16:28:05 +0000
Message-Id: <20250124162836.2332150-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lWpZxTGOU4Qd

When FPCR.AH == 1, floating point FMIN and FMAX have some odd special
cases:

 * comparing two zeroes (even of different sign) or comparing a NaN
   with anything always returns the second argument (possibly
   squashed to zero)
 * denormal outputs are not squashed to zero regardless of FZ or FZ16

Implement these semantics in new helper functions and select them at
translate time if FPCR.AH is 1 for the scalar FMAX and FMIN insns.
(We will convert the other FMAX and FMIN insns in subsequent
commits.)

Note that FMINNM and FMAXNM are not affected.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-a64.h    |  7 +++++++
 target/arm/tcg/helper-a64.c    | 36 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 23 ++++++++++++++++++++--
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index bac12fbe55b..ae0424f6de9 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -67,6 +67,13 @@ DEF_HELPER_4(advsimd_muladd2h, i32, i32, i32, i32, fpst)
 DEF_HELPER_2(advsimd_rinth_exact, f16, f16, fpst)
 DEF_HELPER_2(advsimd_rinth, f16, f16, fpst)
 
+DEF_HELPER_3(vfp_ah_minh, f16, f16, f16, fpst)
+DEF_HELPER_3(vfp_ah_mins, f32, f32, f32, fpst)
+DEF_HELPER_3(vfp_ah_mind, f64, f64, f64, fpst)
+DEF_HELPER_3(vfp_ah_maxh, f16, f16, f16, fpst)
+DEF_HELPER_3(vfp_ah_maxs, f32, f32, f32, fpst)
+DEF_HELPER_3(vfp_ah_maxd, f64, f64, f64, fpst)
+
 DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 05036089dd7..406d76e1129 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -399,6 +399,42 @@ float32 HELPER(fcvtx_f64_to_f32)(float64 a, float_status *fpst)
     return r;
 }
 
+/*
+ * AH=1 min/max have some odd special cases:
+ * comparing two zeroes (even of different sign), (NaN, anything),
+ * or (anything, NaN) should return the second argument (possibly
+ * squashed to zero).
+ * Also, denormal outputs are not squashed to zero regardless of FZ or FZ16.
+ */
+#define AH_MINMAX_HELPER(NAME, CTYPE, FLOATTYPE, MINMAX)                \
+    CTYPE HELPER(NAME)(CTYPE a, CTYPE b, float_status *fpst)            \
+    {                                                                   \
+        bool save;                                                      \
+        CTYPE r;                                                        \
+        a = FLOATTYPE ## _squash_input_denormal(a, fpst);               \
+        b = FLOATTYPE ## _squash_input_denormal(b, fpst);               \
+        if (FLOATTYPE ## _is_zero(a) && FLOATTYPE ## _is_zero(b)) {     \
+            return b;                                                   \
+        }                                                               \
+        if (FLOATTYPE ## _is_any_nan(a) ||                              \
+            FLOATTYPE ## _is_any_nan(b)) {                              \
+            float_raise(float_flag_invalid, fpst);                      \
+            return b;                                                   \
+        }                                                               \
+        save = get_flush_to_zero(fpst);                                 \
+        set_flush_to_zero(false, fpst);                                 \
+        r = FLOATTYPE ## _ ## MINMAX(a, b, fpst);                       \
+        set_flush_to_zero(save, fpst);                                  \
+        return r;                                                       \
+    }
+
+AH_MINMAX_HELPER(vfp_ah_minh, dh_ctype_f16, float16, min)
+AH_MINMAX_HELPER(vfp_ah_mins, float32, float32, min)
+AH_MINMAX_HELPER(vfp_ah_mind, float64, float64, min)
+AH_MINMAX_HELPER(vfp_ah_maxh, dh_ctype_f16, float16, max)
+AH_MINMAX_HELPER(vfp_ah_maxs, float32, float32, max)
+AH_MINMAX_HELPER(vfp_ah_maxd, float64, float64, max)
+
 /* 64-bit versions of the CRC helpers. Note that although the operation
  * (and the prototypes of crc32c() and crc32() mean that only the bottom
  * 32 bits of the accumulator and result are used, we pass and return
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d3575ac1154..a6f24ad9746 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5152,6 +5152,15 @@ static bool do_fp3_scalar_ah(DisasContext *s, arg_rrr_e *a, const FPScalar *f,
                                        select_fpst(s, a->esz));
 }
 
+/* Some insns need to call different helpers when FPCR.AH == 1 */
+static bool do_fp3_scalar_2fn(DisasContext *s, arg_rrr_e *a,
+                              const FPScalar *fnormal,
+                              const FPScalar *fah,
+                              int mergereg)
+{
+    return do_fp3_scalar(s, a, s->fpcr_ah ? fah : fnormal, mergereg);
+}
+
 static const FPScalar f_scalar_fadd = {
     gen_helper_vfp_addh,
     gen_helper_vfp_adds,
@@ -5185,14 +5194,24 @@ static const FPScalar f_scalar_fmax = {
     gen_helper_vfp_maxs,
     gen_helper_vfp_maxd,
 };
-TRANS(FMAX_s, do_fp3_scalar, a, &f_scalar_fmax, a->rn)
+static const FPScalar f_scalar_fmax_ah = {
+    gen_helper_vfp_ah_maxh,
+    gen_helper_vfp_ah_maxs,
+    gen_helper_vfp_ah_maxd,
+};
+TRANS(FMAX_s, do_fp3_scalar_2fn, a, &f_scalar_fmax, &f_scalar_fmax_ah, a->rn)
 
 static const FPScalar f_scalar_fmin = {
     gen_helper_vfp_minh,
     gen_helper_vfp_mins,
     gen_helper_vfp_mind,
 };
-TRANS(FMIN_s, do_fp3_scalar, a, &f_scalar_fmin, a->rn)
+static const FPScalar f_scalar_fmin_ah = {
+    gen_helper_vfp_ah_minh,
+    gen_helper_vfp_ah_mins,
+    gen_helper_vfp_ah_mind,
+};
+TRANS(FMIN_s, do_fp3_scalar_2fn, a, &f_scalar_fmin, &f_scalar_fmin_ah, a->rn)
 
 static const FPScalar f_scalar_fmaxnm = {
     gen_helper_vfp_maxnumh,
-- 
2.34.1

