Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp940257njk;
        Fri, 24 Jan 2025 08:52:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXr8Bfng10gHp0Jt43GOF78YB1PEHKHDxGiCiDeDYzs4ZJERyH9jhq40tyivLI//cwFguDNF/wtOgB3Bw==@linaro.org
X-Google-Smtp-Source: AGHT+IGe/J6xi1vLXfxTRvl0aX6Ioa2OZ4U/Gr0XNvCx1m0mw1YtxAhDS2vk39Z6qNkFIW0lFvGG
X-Received: by 2002:a05:6214:430a:b0:6d8:8e0f:8c03 with SMTP id 6a1803df08f44-6e1b21864c2mr534137556d6.18.1737737523620;
        Fri, 24 Jan 2025 08:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737523; cv=none;
        d=google.com; s=arc-20240605;
        b=Lgmz5kKcpLwEAylNfVpl8rdCH+zOtMs1YBTbxLUGR8JjeKzeu3vfm31w/yW3Tlf2hZ
         U+HXLoqtxV21ZKRNR/+pUrUOXF6FlBMN/D8HtgRfelMR+ow5V5Zea5rvFOXqIYAZNg6v
         duSlZjB6QLisfA3A5AltHgR4rGTJ9JX4P2TEti53RdgkluOfKHtUNR25PBkWi18v4oo6
         cU6xop5MIwgOHwyiZ6HMRigi1ip+mD0i0Cd/y25eFqiekJKvH4lqklnquwfiAV73RzFJ
         zlR1il1GmVmq+PA6I/asT7uqvf0XtCLloUkLAb5L8rAi/KJRFejt8UN4CG1rLQ5Oqnnp
         /tqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6dgTVvVr0GNtxqpPbcNERedzCSbz846MhmUGqEskeJE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=BjnigzVfNCQJnNu4hAub+KpMsV11jqEDCEBiE690Dl1Oh2WOE2l2gZQU3S9SNVYI8B
         4BucpEdmb6C2bfnSdWGsalSQBCejMck2u1M3N1lgt35yHSw2/9bMPnd+GI9XLI5MKUTo
         uGu7ndGyyjrgPvD8LyZPuIaJOkxG1ZhbpN8CE9LJGDrsIWVvakD482Dj+SrlwUR8q0/6
         iFFOcFCGF6PTrmhSx2mw7t2NcIZ/d03AYR7ZMz/FPiH2AhRRHi4wpU5LwUsFoBKJJeV+
         2lIyPg8ZNDuNTgtxDsZ56KoFUvfTRhTP6z2qoT2aWFvnEPrKb44ZU9miBqg5PF4R7gbF
         Tr0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGQCzzN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525cba1si27432556d6.80.2025.01.24.08.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:52:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGQCzzN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMgf-0006Wx-IZ; Fri, 24 Jan 2025 11:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZA-0005pW-Oq
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ7-0005m3-FU
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so16745295e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736192; x=1738340992; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6dgTVvVr0GNtxqpPbcNERedzCSbz846MhmUGqEskeJE=;
 b=qGQCzzN6S8q9GVDFW/IUoO5RBfyz3yGFfmag+CFksup4UHYlCJV7hjdLZv0rFGbxzG
 C7m6Ggdp4uVwuiXE1HwKmnlSLlZRL5PuvLeUwKFA0C1pHumCheKj8yvoV4rqOspqsLUI
 h/ON2pwADJGzfGVUtW51PXqhNFiYGbLrdrzZ/D2a0J4Mgk5J4g/reteWWl5hN8Ue8c8q
 krXK06jl37ObdiPgClDRXJjoi1XPiAdBDxIB1+DYumNtNeVk+qnzyup6Fi08g/5Qnx23
 lWgyEiYmGDn+vXT8VtnAlD2mzadKLI3fOfrmzkYlbxIi8ad1b6+9pf4vfU2dSYt9SNh4
 2xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736192; x=1738340992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dgTVvVr0GNtxqpPbcNERedzCSbz846MhmUGqEskeJE=;
 b=Vm2AHElIbVg7dWL0FjUQk0g5UStBa8QR0gvx2zCgW+4GfYSw0WULxbU9VLQPD0gWYE
 NxIWhRFLqSr7Do6XZg06JeHYfgK0o8ZShUHx/C7Y6z6gKi3EnOHLF7ztzj4CrbfhDshg
 xivucGcgpVvKSuFF9xo6aZr4F7HR/cRGI8qpyx0Y9IgWEUssikWF9ZZektGGfOnP/osg
 HBn2aO5pVIr5HzGqiQ0PnostX7E1QVzA5TgZN4Rgy/+8vZH5Dssn2+xlWL0plJm9aiwI
 HkSgXtOMoklC2T8PTL+496Fs5Mts+XWwh0T5QttzPq7PPJICvOvWT4JtTal6erfTUzLp
 zIkA==
X-Gm-Message-State: AOJu0YyfEogfs0iLmfRaH17V9s6s3kgYtW3FxXdjJRB/5mdxLg1GZu9M
 4l4QWS2LdU/qV8pAOGIaJLo6TNEcGDNSPFqt5ytK864fZAYc6BqbpHWeY/qbjuMvpmkyWfuP3dF
 c
X-Gm-Gg: ASbGncssv5bke8zjzCWOghU+IXAhc6TIVRFB/Em+RaXyZaR6Py0oaQonDo/yQLThvsE
 hH7BQ24AAlPc6zBicHi1+WUav2hFqlkNPjSicTjsXQ43k2ux2aDw1H+FtXevXh8OZ8lw/istZ9l
 30mVCB5mgmoaXaQYLQEr+PD2nf1MV3zX9vzWZUcwcr1jyGYxhepkn+nPd9/R7/u9smu9q13kJZU
 vWD5grdZ81QjF/QDdSsTSbZXum3X4PLMKjx6VWSbXQ1p4CiJyS2esbFC4S8118wTvfIyDnCSBK0
 QsKSfeWZIG8=
X-Received: by 2002:a05:600c:3c94:b0:435:192:63ca with SMTP id
 5b1f17b1804b1-43891439f04mr240114165e9.21.1737736192085; 
 Fri, 24 Jan 2025 08:29:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 59/76] target/arm: Handle FPCR.AH in negation steps in SVE
 FCADD
Date: Fri, 24 Jan 2025 16:28:19 +0000
Message-Id: <20250124162836.2332150-60-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GBT9Dda8Gg3o

The negation steps in FCADD must honour FPCR.AH's "don't change the
sign of a NaN" semantics.  Implement this in the same way we did for
the base ASIMD FCADD, by encoding FPCR.AH into the SIMD data field
passed to the helper and using that to decide whether to negate the
values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sve_helper.c    | 45 +++++++++++++++++++++++++++-------
 target/arm/tcg/translate-sve.c |  2 +-
 2 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 8527a7495a6..dc5a35b46ef 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5131,7 +5131,9 @@ void HELPER(sve_fcadd_h)(void *vd, void *vn, void *vm, void *vg,
 {
     intptr_t j, i = simd_oprsz(desc);
     uint64_t *g = vg;
-    float16 neg_imag = float16_set_sign(0, simd_data(desc));
+    bool rot = extract32(desc, SIMD_DATA_SHIFT, 1);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    float16 neg_imag = float16_set_sign(0, rot);
     float16 neg_real = float16_chs(neg_imag);
 
     do {
@@ -5144,9 +5146,16 @@ void HELPER(sve_fcadd_h)(void *vd, void *vn, void *vm, void *vg,
             i -= 2 * sizeof(float16);
 
             e0 = *(float16 *)(vn + H1_2(i));
-            e1 = *(float16 *)(vm + H1_2(j)) ^ neg_real;
+            e1 = *(float16 *)(vm + H1_2(j));
             e2 = *(float16 *)(vn + H1_2(j));
-            e3 = *(float16 *)(vm + H1_2(i)) ^ neg_imag;
+            e3 = *(float16 *)(vm + H1_2(i));
+
+            if (neg_real && !(fpcr_ah && float16_is_any_nan(e1))) {
+                e1 ^= neg_real;
+            }
+            if (neg_imag && !(fpcr_ah && float16_is_any_nan(e3))) {
+                e3 ^= neg_imag;
+            }
 
             if (likely((pg >> (i & 63)) & 1)) {
                 *(float16 *)(vd + H1_2(i)) = float16_add(e0, e1, s);
@@ -5163,7 +5172,9 @@ void HELPER(sve_fcadd_s)(void *vd, void *vn, void *vm, void *vg,
 {
     intptr_t j, i = simd_oprsz(desc);
     uint64_t *g = vg;
-    float32 neg_imag = float32_set_sign(0, simd_data(desc));
+    bool rot = extract32(desc, SIMD_DATA_SHIFT, 1);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    float32 neg_imag = float32_set_sign(0, rot);
     float32 neg_real = float32_chs(neg_imag);
 
     do {
@@ -5176,9 +5187,16 @@ void HELPER(sve_fcadd_s)(void *vd, void *vn, void *vm, void *vg,
             i -= 2 * sizeof(float32);
 
             e0 = *(float32 *)(vn + H1_2(i));
-            e1 = *(float32 *)(vm + H1_2(j)) ^ neg_real;
+            e1 = *(float32 *)(vm + H1_2(j));
             e2 = *(float32 *)(vn + H1_2(j));
-            e3 = *(float32 *)(vm + H1_2(i)) ^ neg_imag;
+            e3 = *(float32 *)(vm + H1_2(i));
+
+            if (neg_real && !(fpcr_ah && float32_is_any_nan(e1))) {
+                e1 ^= neg_real;
+            }
+            if (neg_imag && !(fpcr_ah && float32_is_any_nan(e3))) {
+                e3 ^= neg_imag;
+            }
 
             if (likely((pg >> (i & 63)) & 1)) {
                 *(float32 *)(vd + H1_2(i)) = float32_add(e0, e1, s);
@@ -5195,7 +5213,9 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
 {
     intptr_t j, i = simd_oprsz(desc);
     uint64_t *g = vg;
-    float64 neg_imag = float64_set_sign(0, simd_data(desc));
+    bool rot = extract32(desc, SIMD_DATA_SHIFT, 1);
+    bool fpcr_ah = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    float64 neg_imag = float64_set_sign(0, rot);
     float64 neg_real = float64_chs(neg_imag);
 
     do {
@@ -5208,9 +5228,16 @@ void HELPER(sve_fcadd_d)(void *vd, void *vn, void *vm, void *vg,
             i -= 2 * sizeof(float64);
 
             e0 = *(float64 *)(vn + H1_2(i));
-            e1 = *(float64 *)(vm + H1_2(j)) ^ neg_real;
+            e1 = *(float64 *)(vm + H1_2(j));
             e2 = *(float64 *)(vn + H1_2(j));
-            e3 = *(float64 *)(vm + H1_2(i)) ^ neg_imag;
+            e3 = *(float64 *)(vm + H1_2(i));
+
+            if (neg_real && !(fpcr_ah && float64_is_any_nan(e1))) {
+                e1 ^= neg_real;
+            }
+            if (neg_imag && !(fpcr_ah && float64_is_any_nan(e3))) {
+                e3 ^= neg_imag;
+            }
 
             if (likely((pg >> (i & 63)) & 1)) {
                 *(float64 *)(vd + H1_2(i)) = float64_add(e0, e1, s);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 9200f7f8a49..0696192148c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3916,7 +3916,7 @@ static gen_helper_gvec_4_ptr * const fcadd_fns[] = {
     gen_helper_sve_fcadd_s, gen_helper_sve_fcadd_d,
 };
 TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
-           a->rd, a->rn, a->rm, a->pg, a->rot,
+           a->rd, a->rn, a->rm, a->pg, a->rot | (s->fpcr_ah << 1),
            a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64)
 
 #define DO_FMLA(NAME, name) \
-- 
2.34.1

