Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2774864njk;
        Mon, 27 Jan 2025 15:27:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnFNj9VMGzPCKEYiDUBbgyzfJBVPCIBr/SDhKqoqGXKHtTpXDhC35/9n3I0ysZj2ur3VAvWyXeyAdjcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEC4EgKydH5LOuGOspSopRh0bjuARGChLVELm5iZnrfLYiwMW0nTLwUY1SEwyHDVfnv8OY8
X-Received: by 2002:a05:6214:1248:b0:6d8:b3ee:8b72 with SMTP id 6a1803df08f44-6e1b2229d49mr641598966d6.32.1738020457107;
        Mon, 27 Jan 2025 15:27:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020457; cv=none;
        d=google.com; s=arc-20240605;
        b=WCMP+S+h9f7h9Di9AKDsNExgmjs1lx99VQhaZatKt2aIJY3ebsLsGoGdyzq9PWt8ho
         u5PG8w0fhDxcEnvzK2uWc3jjRQeDTcvo+921pG2Fer8Sgodik5FVx9DTy+suIKOgxA6l
         vjhP4tXvlKvUdBX3BsJjxIcHKIbmIQBVeUvYInU+JVz0mKBXMtph4haZSAXQTzKNHlAw
         xlcA0f1jkl/Gxl2MeCJAZvUqZCavHuBH2bKbBFxt22a7Mxfqn/d+TOLGG/DOgEFSeUcH
         hSs9sckfyxUcBqOXf5RU7P/7CtRrWe4NNR+EG4KZYI9ihf4JFIjOYo5EZJKET5aNRRp7
         wrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b7xWXB+eng8DnKFn3D01/tYMXRHmURU0wtcrE+/Ypck=;
        fh=H+6xvJIthdoHUHFuPKhwg9DsPs/C1tTB0VVEhyHYa5E=;
        b=Iji+Me8FghMXrknmA/JDTfByzcLjY4Wf+rwoqbIxwhDqAILmbHj6wrKjEf+yv9aCXy
         jPicTtR+MWNVoLIl1gVOC8v5ZweylzNMk/yHxB2WAGKYr+tDGZlrcDk553SVZed2UJY/
         mWIZbFG6814Zji7cGIpTBv5xwJtBt6xJg9+NKzg2+DYBQGy5tXOF83bt9AjFFqaHOI5u
         TqwEdPQp5jwz6jlEYjuzh8ip9KQTBA4dgYVwAZAxT27Pxa/cOU5ajhVL4Nt8pogF0YOO
         Hzy3alzwGM5H0gAPKDt/zBfbr2Ab9xUIud3ahZq7U8jArgfx56tiNoW4bH4JtvtuJCv9
         ud2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jpUWg1Ca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686c2cfsi103043131cf.134.2025.01.27.15.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:27:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jpUWg1Ca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYV2-0006b2-Fs; Mon, 27 Jan 2025 18:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUn-0006PE-Sl
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:23 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUl-0005cA-Fj
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2f441904a42so8838688a91.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020378; x=1738625178; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7xWXB+eng8DnKFn3D01/tYMXRHmURU0wtcrE+/Ypck=;
 b=jpUWg1Cau8kzRH6zebyOnYMWMTWMdrE3syO9Bc5xidBvpUatoAt1QHndAHRZ5lMeji
 sJoR5aAYrm+bcl0/Ug19F2RDOcdv0A+kt6cMoJtLPy9KB8qrGsqgsJqUfrE4q1qk5SgC
 MzNmjMJTVDpCm3AeRRYnI6u8O77vorxqt+6YPFSxuyyyXypGxlDJKoFwpeAQP5/nETd8
 5tMYa8rv4XYze60k/qhF/jsfKdCjUulqD5yCOfIhLaYMyYyMjdPIJ5Jv4Wg5XskYQ1qQ
 cN5k0gdeG4GMR0+gMlvJoYrMb1VabuOHYBy5dSxfissPJw6mhUdLN9lNZVtvLAPCTgWj
 mMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020378; x=1738625178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7xWXB+eng8DnKFn3D01/tYMXRHmURU0wtcrE+/Ypck=;
 b=w6DqBQwvxcITCjI453LK1JTLtQBNN66V4zPPgf0bbcGAiozjqwbNTBVngg7vnXadVS
 IOrtFiZ93tTjPM241X9wDMuV/ekY3/hwctT+OpXR9dIIX/Nlk1yozGl2+f0bWXEglI0z
 8bFEr5hxc1SLZgnASLV8xZr56WOvz/VLTGtawjNQN1k7QUDF+R+OYA5orAnda5egq4pv
 KIjDAlvFVXgukM5u0r6l3W0pxcN+8ug+omos7Zj5PwUbT/QmyiB5Q1Gk3hB1B3DTmqJe
 hHnqLCBR5I0g1foizMfBxz7QiC/0Chb7B4Qh1VXai/eoyBhXCZ7VYpwuG8x0iYzsrf+6
 +raQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxdffRCAAiRm8fsUpV67hP9ipUNT/7gBwJU2drqpcbv9INiZ87vkstYYT2QCYT2QRqg0+k35sJ1g==@nongnu.org
X-Gm-Message-State: AOJu0YyumwmRKshTAYINqN41IXoz5Cd79saA5n8wypZiqpTnn5IUd1up
 4qrdnywxGHOKIABDn1kXMI5taQy9MLlwajZjT/siN27k7ovM1w8BKyaR6j1nETFNw9kW5j0iIKi
 v
X-Gm-Gg: ASbGncuont2VpkguHoeCv7ddmeZz2XAuiHKp25OLs+MphIoJPyoyh0G9xq9XpEcSpJn
 ZFHrkH9E55F96e9gVSthjJvewfQ1N6LXew737z9JQzYpAZszIBObqA1E+tqIDXpfYBx8qS/ORRl
 Ei9Wk+L7DU7K6MoTQ2+CEFX2IPHHIm5U+nVxTlEao4SOYV7ktx1dOzuNoJKJWqNcmzTduPaElM+
 gqX0EJkNRblEBtVbb4psghs711qJGZx8Cxx+eStrQzKPu3fzAoG/wD4Zm7C+NC0jxSOALdvUuaU
 REe0PmDoNPG2l64xwzAhvwPUCqamOtUTSJtYsAE=
X-Received: by 2002:a17:90a:c88c:b0:2ee:c059:7de3 with SMTP id
 98e67ed59e1d1-2f782cc01f5mr70851429a91.18.1738020378131; 
 Mon, 27 Jan 2025 15:26:18 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 15/22] target/arm: Simplify fp_status indexing in mve_helper.c
Date: Mon, 27 Jan 2025 15:25:57 -0800
Message-ID: <20250127232604.20386-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: Mr+zVdXtI2yf

Select on index instead of pointer.
No functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mve_helper.c | 40 +++++++++++++------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 3763d71e20..274003e2e5 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -2814,8 +2814,7 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -2888,8 +2887,7 @@ DO_2OP_FP_ALL(vminnma, minnuma)
                 r[e] = 0;                                               \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(tm & 1)) {                                            \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -2926,8 +2924,7 @@ DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -2964,8 +2961,7 @@ DO_VFMA(vfmss, 4, float32, true)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE * 2)) == 0) {          \
                 continue;                                               \
             }                                                           \
-            fpst0 = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :  \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst0 = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             fpst1 = fpst0;                                              \
             if (!(mask & 1)) {                                          \
                 scratch_fpst = *fpst0;                                  \
@@ -3049,8 +3045,7 @@ DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3084,8 +3079,7 @@ DO_2OP_FP_SCALAR_ALL(vfmul_scalar, mul)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3116,9 +3110,8 @@ DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, float32, DO_VFMAS_SCALARS)
         unsigned e;                                             \
         TYPE *m = vm;                                           \
         TYPE ra = (TYPE)ra_in;                                  \
-        float_status *fpst = (ESIZE == 2) ?                     \
-            &env->vfp.fp_status[FPST_STD_F16] :                 \
-            &env->vfp.fp_status[FPST_STD];                       \
+        float_status *fpst =                                    \
+            &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
             if (mask & 1) {                                     \
                 TYPE v = m[H##ESIZE(e)];                        \
@@ -3168,8 +3161,7 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
             if ((mask & emask) == 0) {                                  \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & (1 << (e * ESIZE)))) {                         \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3202,8 +3194,7 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
             if ((mask & emask) == 0) {                                  \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & (1 << (e * ESIZE)))) {                         \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3267,8 +3258,7 @@ DO_VCMP_FP_BOTH(vfcmples, vfcmple_scalars, 4, float32, !DO_GT32)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3300,9 +3290,8 @@ DO_VCVT_FIXED(vcvt_fu, 4, uint32_t, helper_vfp_touls_round_to_zero)
         unsigned e;                                                     \
         float_status *fpst;                                             \
         float_status scratch_fpst;                                      \
-        float_status *base_fpst = (ESIZE == 2) ?                        \
-            &env->vfp.fp_status[FPST_STD_F16] :                         \
-            &env->vfp.fp_status[FPST_STD];                               \
+        float_status *base_fpst =                                       \
+            &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD];  \
         uint32_t prev_rmode = get_float_rounding_mode(base_fpst);       \
         set_float_rounding_mode(rmode, base_fpst);                      \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
@@ -3427,8 +3416,7 @@ void HELPER(mve_vcvtt_hs)(CPUARMState *env, void *vd, void *vm)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.fp_status[FPST_STD];                           \
+            fpst = &env->vfp.fp_status[ESIZE == 2 ? FPST_STD_F16 : FPST_STD]; \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
-- 
2.43.0

