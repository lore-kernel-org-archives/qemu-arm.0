Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2774926njk;
        Mon, 27 Jan 2025 15:27:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLK/c2fGLVE/Um4QxcsbCKof5PpfKhuya4OJ9HSSXhDXuYGlzlo6FRqa+Ny2mX2NSrkubOV9VBvcot8A==@linaro.org
X-Google-Smtp-Source: AGHT+IFulCFedVdSINsFE67CaUWKj+qzQy80Bia1SCW5GjW+YoKE08Zzql/ZbpQX/VQBH7Uu46Cz
X-Received: by 2002:ac8:5d90:0:b0:466:a3d2:ae44 with SMTP id d75a77b69052e-46e12ad608emr688449951cf.2.1738020466777;
        Mon, 27 Jan 2025 15:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020466; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcnC3OLqh9cfQXUhWxr290UYHvxcjwmn+GDZ+jyWzKQZ19BqIViTSZTUpYrH9d6WW3
         ZOBcPgyHqq4dDFgGz2Jk9twuXsGqxhrChzq3sfQja2cfV4wYyXU9SQBnP59yNy/zqPW/
         YYMTeGeBqUHYdXcgxtmTWyEa+I3v/yx7PI+re7t90vRO7592zGxlNDy8nDHx/p2RS98U
         8fyGRwORXowx046P25at2lw6idmnAoxoTw7CGRds+9qW65S9nFtKUGrGKJYrYLJd2Ssz
         wweRCky3GM8FNqag5xE1dbTh1Qvc22IGlFR02xu3JtGmCo6OoqHOi2K8ciACxrR3eeJ7
         6Ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/o3PZF+VYx9BlUZcSvSihlV0semqIWO9oR/VySJrxZU=;
        fh=+W26hnrKRi0ITzzJEEKKAgAo1g1Wdvle1AVTWwm8EI8=;
        b=ckMm0zeRDpuSGNAmcjmBvpzPrLTlcWSHnn7LcbZ90jSvo2ln9JKo7V8gcfQ8r/uoVm
         Ug1cKL5xcaqJ5M82sQcbgmycAz1XY14Fz7p0CIIqdkm6rDmidmMeazmmQmgigsUR+fJh
         a+OraZDIGue+b/neSTO9cZ3T/ZeGG4SGzM5du//sfIxJUf6yS4MSakNqaSqBupg38cPK
         NQR6fcJonlm+6vqRhXWSe0tDDNgUJ2fJ/EBtLGk6Q3pC7tPCOqkCT9ITiWIPtSd8UF/S
         zjSQUfzqfOCS+7iS91E1yxsA3qprE1S1+6fDudgSJtP4Khgm7cXP0Rv02BcM5n1HO/W1
         ofNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rzb15ux/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba64bbsi115417091cf.512.2025.01.27.15.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rzb15ux/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYV1-0006ad-UX; Mon, 27 Jan 2025 18:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUk-0006N3-7p
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:19 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUf-0005YI-4d
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:17 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2efded08c79so6947916a91.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020372; x=1738625172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/o3PZF+VYx9BlUZcSvSihlV0semqIWO9oR/VySJrxZU=;
 b=Rzb15ux/7EOLJ3GAR4OQv5DXtEUzx+sKvE0HQsvA/vo8y7OjpdxGAkmWgw2zNN3XGO
 IE7sacTamWvdFFKryOu/X6KXYehsKLvuTEaaTOOAq+ToZjZsrRtCN1cCV1zzE5/Wf6NB
 +j4JA5If9jhRM6OcW/vB4qM/4x1+ta/AsaTeJQfiP+Lo7x3oqitgsIHJwJpZ/WuzEgZk
 OBPDUsIcGPmi1zcCJzDFTvhd8f+4MUdoKVBuK5IwugNVM69dDdFQ9CPBfpc7EdUDWTH9
 2jhbTiSv4+BkBtCdRA5QZWG/yLkA9FR4Wk9bNWgL6Q2TBNxE49J6UhYisUiToRVtY481
 3Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020372; x=1738625172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/o3PZF+VYx9BlUZcSvSihlV0semqIWO9oR/VySJrxZU=;
 b=t/Ja+11oAwW+u9vQd+P30e2Sdh+7c5yGaNmHSGYTOjavorS46by5aJGVaJbZiLNyEU
 Wc+lJkvD4g+eWm4cx6M0ZWTa1qLBGBj24KMoveJLTjKd3tpbkeolxh+N4tncll8OXsrs
 Uxp7Me8dLfZk8Lxmwh8+xl6w/XFIJ/ndCGJ4zcH0J9SUE/thTS+fHYM1a/uUovOPy6+1
 G88Cct1iUxSVlxC003e0mKOol2D9U9GlUlfGWcNvyH+G9qSMrrDOhPDaMIbWQdaDh+b6
 m1oh4xrzdqCyiL+Dgy5LU57xq4+YQewF309KLtUutNBheELQaOgBps8Mub9kV9l7EDlO
 RYCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH6He1RSIcF1t9ITYBy9L/TSgZbyRW0KnElakLx/qg/nDt6eAJJyL6q+EW5FiZbo4oz6z35tTBZQ==@nongnu.org
X-Gm-Message-State: AOJu0YwiM11f/aRr24eKOPUROlgKEy9Vcez0J0Z0+30nS/PEZO8/XlfZ
 YxxjZtRhvhaQRZwzqCvU5BBouxBstRELJYicYHvA1/4NkagsrCBUMsFdBwg+cJMBT2hiFXot4X6
 3
X-Gm-Gg: ASbGncstAur55/h5hzP3CFMHRvXgkacBpRIMGySM9or3WMBCBpNFqmv21zUROqXoKST
 Bw0q6jixkslJ+aFr/2QTtgu3Cb0KPPwlYOwwntBQHHcS8mj4LwLqW8cEJFoZdejZ94nNHtMM6is
 CZH9FdPaUg+n7b6LKtpkr1ySFV0xq+wucn9JCkXAdxNr3zPcrEpZj9qogkMZAbbtq2nvjuQbCcW
 fBBML1hbNmAUYIj3cWFBJRMnZDzP3sYGMVnZq4ro81VJJFca2Ybkau9mNEbL68dfs9kAFuuh328
 ZMWACC56PGQH+9fX7lf3mXXGUvLBtYZ+o1BpNUg=
X-Received: by 2002:a17:90b:17d0:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-2f782d972b9mr62185463a91.30.1738020371729; 
 Mon, 27 Jan 2025 15:26:11 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 08/22] target/arm: Remove standard_fp_status
Date: Mon, 27 Jan 2025 15:25:50 -0800
Message-ID: <20250127232604.20386-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: hx66c0LN3hPl

Replace with fp_status[FPST_STD].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  1 -
 target/arm/cpu.c            |  8 ++++----
 target/arm/tcg/mve_helper.c | 28 ++++++++++++++--------------
 target/arm/tcg/vec_helper.c |  4 ++--
 target/arm/vfp_helper.c     |  4 ++--
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 893a2cdd0a..18afff8509 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -696,7 +696,6 @@ typedef struct CPUArchState {
                 float_status fp_status_f16_a64;
                 float_status ah_fp_status;
                 float_status ah_fp_status_f16;
-                float_status standard_fp_status;
             };
         };
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b887edf1d1..26e3465a4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -546,13 +546,13 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->sau.ctrl = 0;
     }
 
-    set_flush_to_zero(1, &env->vfp.standard_fp_status);
-    set_flush_inputs_to_zero(1, &env->vfp.standard_fp_status);
-    set_default_nan_mode(1, &env->vfp.standard_fp_status);
+    set_flush_to_zero(1, &env->vfp.fp_status[FPST_STD]);
+    set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_STD]);
+    set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
-    arm_set_default_fp_behaviours(&env->vfp.standard_fp_status);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 911a53a23a..3763d71e20 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -2815,7 +2815,7 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -2889,7 +2889,7 @@ DO_2OP_FP_ALL(vminnma, minnuma)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(tm & 1)) {                                            \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -2927,7 +2927,7 @@ DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -2965,7 +2965,7 @@ DO_VFMA(vfmss, 4, float32, true)
                 continue;                                               \
             }                                                           \
             fpst0 = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :  \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             fpst1 = fpst0;                                              \
             if (!(mask & 1)) {                                          \
                 scratch_fpst = *fpst0;                                  \
@@ -3050,7 +3050,7 @@ DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3085,7 +3085,7 @@ DO_2OP_FP_SCALAR_ALL(vfmul_scalar, mul)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3118,7 +3118,7 @@ DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, float32, DO_VFMAS_SCALARS)
         TYPE ra = (TYPE)ra_in;                                  \
         float_status *fpst = (ESIZE == 2) ?                     \
             &env->vfp.fp_status[FPST_STD_F16] :                 \
-            &env->vfp.standard_fp_status;                       \
+            &env->vfp.fp_status[FPST_STD];                       \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
             if (mask & 1) {                                     \
                 TYPE v = m[H##ESIZE(e)];                        \
@@ -3169,7 +3169,7 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & (1 << (e * ESIZE)))) {                         \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3203,7 +3203,7 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & (1 << (e * ESIZE)))) {                         \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3268,7 +3268,7 @@ DO_VCMP_FP_BOTH(vfcmples, vfcmple_scalars, 4, float32, !DO_GT32)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
@@ -3302,7 +3302,7 @@ DO_VCVT_FIXED(vcvt_fu, 4, uint32_t, helper_vfp_touls_round_to_zero)
         float_status scratch_fpst;                                      \
         float_status *base_fpst = (ESIZE == 2) ?                        \
             &env->vfp.fp_status[FPST_STD_F16] :                         \
-            &env->vfp.standard_fp_status;                               \
+            &env->vfp.fp_status[FPST_STD];                               \
         uint32_t prev_rmode = get_float_rounding_mode(base_fpst);       \
         set_float_rounding_mode(rmode, base_fpst);                      \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
@@ -3347,7 +3347,7 @@ static void do_vcvt_sh(CPUARMState *env, void *vd, void *vm, int top)
     unsigned e;
     float_status *fpst;
     float_status scratch_fpst;
-    float_status *base_fpst = &env->vfp.standard_fp_status;
+    float_status *base_fpst = &env->vfp.fp_status[FPST_STD];
     bool old_fz = get_flush_to_zero(base_fpst);
     set_flush_to_zero(false, base_fpst);
     for (e = 0; e < 16 / 4; e++, mask >>= 4) {
@@ -3377,7 +3377,7 @@ static void do_vcvt_hs(CPUARMState *env, void *vd, void *vm, int top)
     unsigned e;
     float_status *fpst;
     float_status scratch_fpst;
-    float_status *base_fpst = &env->vfp.standard_fp_status;
+    float_status *base_fpst = &env->vfp.fp_status[FPST_STD];
     bool old_fiz = get_flush_inputs_to_zero(base_fpst);
     set_flush_inputs_to_zero(false, base_fpst);
     for (e = 0; e < 16 / 4; e++, mask >>= 4) {
@@ -3428,7 +3428,7 @@ void HELPER(mve_vcvtt_hs)(CPUARMState *env, void *vd, void *vm)
                 continue;                                               \
             }                                                           \
             fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
-                &env->vfp.standard_fp_status;                           \
+                &env->vfp.fp_status[FPST_STD];                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
                 scratch_fpst = *fpst;                                   \
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index b369c9f45b..60839ae560 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2177,7 +2177,7 @@ static void do_fmlal(float32 *d, void *vn, void *vm, float_status *fpst,
 void HELPER(gvec_fmlal_a32)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
-    do_fmlal(vd, vn, vm, &env->vfp.standard_fp_status, desc,
+    do_fmlal(vd, vn, vm, &env->vfp.fp_status[FPST_STD], desc,
              get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a32));
 }
 
@@ -2239,7 +2239,7 @@ static void do_fmlal_idx(float32 *d, void *vn, void *vm, float_status *fpst,
 void HELPER(gvec_fmlal_idx_a32)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
-    do_fmlal_idx(vd, vn, vm, &env->vfp.standard_fp_status, desc,
+    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status[FPST_STD], desc,
                  get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a32));
 }
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 28c2b40bd8..93db713a40 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -118,7 +118,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     uint32_t a32_flags = 0, a64_flags = 0;
 
     a32_flags |= get_float_exception_flags(&env->vfp.fp_status_a32);
-    a32_flags |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    a32_flags |= get_float_exception_flags(&env->vfp.fp_status[FPST_STD]);
     /* FZ16 does not generate an input denormal exception.  */
     a32_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
           & ~float_flag_input_denormal_flushed);
@@ -157,7 +157,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_a64);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a32);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD_F16]);
     set_float_exception_flags(0, &env->vfp.ah_fp_status);
     set_float_exception_flags(0, &env->vfp.ah_fp_status_f16);
-- 
2.43.0

