Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1145981njb;
        Sat, 1 Feb 2025 08:49:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbukpz8mGQgD6Hm6P46lzPBrG3Tyed/tCAHzN6VzGq36mzUmqV8tIMXSxpVuHsFB5yDbcbA10yzjWbrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGSCgnlsM4xst7eqGUpqNfpejRXRx7xg6rKFKpSWsaGdmg1ePGyqN8Ns3eN7zJD9MGq8W0w
X-Received: by 2002:a05:620a:3947:b0:7b6:cdd4:bdd8 with SMTP id af79cd13be357-7bffcd14499mr2031540585a.16.1738428575964;
        Sat, 01 Feb 2025 08:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428575; cv=none;
        d=google.com; s=arc-20240605;
        b=DWG6PKfMzuooeR68eoCZlProzVl/YKdSvdr+cz5Fxa3z20kuS0JYFB1hdiX7ht+RC6
         WhQ3VILi2XV7lSs0QYzmEbXJ8heFlm5SjSzB8/a/G7LY0Htr+xQwi8cqMK0Yz85t854u
         lq11UMFaH2ctJjdEK1/FHvRcuxOeAanjakmwtupX15H690+ddTYuWiW86IZN+VvVnuJk
         44a/LR5jG6KGOOu3jaJRAH7kXfFdjXLSuUtDWp+QKCHRbovOAUi/o1QPOgN1wcO7bcj/
         lHe5fkCyyG5EFqyMKURJGkS2rs9nSfIZSEMUTO1YgZUQxrEpxihF3ok76YsLutE5nWTZ
         wnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RfaeHPukqP5/vmbxYrDVYoRgPjTPHLeoO2dTIS1VQiA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=WWf5VBD3J4Bp78iJevbZx8WLXlTjOCYNYogcmtb3thG7U1VEC7lNuZjuy75gPkxegD
         S7QJzTR0e2lyzx00SmmuV094s/Qtkw028nyPNOqVjOQMK5Y0nggnK/rO18DcaqOcY+JK
         32TI6+NLJnDQcHs6Z7BoibJDCtsXVeV4GLcz2Q7TsX9WVHy13QfSCnho3b05zxHWxMI0
         VA+Y1JPX2RYXR//vUgfVxBbpzrv7gByMX3Pw0CA1kkvS5fYDm4Qgxvpz+F8mQqAfD1Qf
         VPaVebMDKWDTlFR+nON0lYvV03x94ELPjIrC6a7cicF2H1Rh+bnclE7levetB7lLRgWd
         alsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xrWkNgOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a925813si608204185a.517.2025.02.01.08.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xrWkNgOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGZL-0001U7-RX; Sat, 01 Feb 2025 11:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYm-0007S4-8m
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYk-0001Ln-Aq
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so20574395e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428089; x=1739032889; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RfaeHPukqP5/vmbxYrDVYoRgPjTPHLeoO2dTIS1VQiA=;
 b=xrWkNgOYcVskBP5X9rMoJTr4iDpmhzoO5/XzJValMIEGjQSyyGqejLbROqnl4rqmwq
 XtK8epczLegoXMavEaKcX/3vCGQqIc/ZbzBxfs8RPNU8ZH0fDr6knc97wSIW7lygb+do
 vy68CyZLfDRxtCMLD/Pr9+l5BQDIgOfwmzCO7IXjlIvY0lybHegmxM0ookcCAL79+7Xm
 G89G3o4pf4UDDlFFb0fH86HquhCGL0ryLWPcpJF4wl4vt4v5lamRwp1Wl6CunVYS692S
 JTalhlsDThr6OA9W10yThSZS/mZ86Exk5CdJTJ900xzD1RGdehyVUoPMM3pHDGYxYlK/
 JZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428089; x=1739032889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfaeHPukqP5/vmbxYrDVYoRgPjTPHLeoO2dTIS1VQiA=;
 b=K2QDO4439AL3wIJX7SXJBQZUzxaC9Y7YOEgXcAVXQ4SWE9GlPjjPBDB7LzfLD5tHRf
 mUqdNzIVgKHxEb1G5bK/8ZcquGqLCEayXrokLAWnagb+IXFrZt2DHGsWIC2U584q7iFr
 7BES50MYen5yCu8GsjEuHx2ZjX4xQr4l8rYXc1goG2DFtL+5aRU1wdISrL4OpTY/GSZK
 SN3kcCGLNF32CmyEgNKMLuT+ai3/2PJI/Q7DL17YTMlqMIWbq0arrkMXZfp4AAdr0VA9
 KwCo0+SThO72KetHEvOXQpW1zQZrmBK8HZj3Yma2PtNAxBCiv4tay8AbeeVz9tVcLa4T
 KJeQ==
X-Gm-Message-State: AOJu0YwT9GkL6ZFqXgVpGAhdSDgCR1jTXBPTS+wYda4jauugvl9chFlK
 vxm3vtkxUSGi7+iTogENxwjnkOUIOeaCIqnn/NQhHrYYuiBt+przGw1JTeWePBVPtWqhINE8YNy
 F
X-Gm-Gg: ASbGncuAZB/SnXLUJvbvGrL1Sa2NaZsb6bRrF989yMeDpngc2N/qiEzsNmRChDms4ln
 wzsvbK52YH5dVTtuXgdkqJvkRQkEbEZnCMk8CSodfu6YHlPz9+Oe5f0txcv4pzL/9LmUY1bujo/
 cvjeV9SnzBt1ZHJtd5Ozd1RTZz79lsiFSf9YcK1Yc+S6MDqYkcKk5zjxR+Q9exBewIaE5va8qFt
 f4/qqlJgax/T6wyLBFO/8VCaXOBnb+FVvuEFBZwAMZQ2j4EcUZwubweAJEfxMXTcHrROF7s2tLS
 ANxFDa5UIJsP2hu8sQ8m
X-Received: by 2002:a05:600c:1d1e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-438dc3bd896mr142840605e9.8.1738428088887; 
 Sat, 01 Feb 2025 08:41:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 58/69] target/arm: Remove standard_fp_status_f16
Date: Sat,  1 Feb 2025 16:40:01 +0000
Message-Id: <20250201164012.1660228-59-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: F6asQQhueBUr

From: Richard Henderson <richard.henderson@linaro.org>

Replace with fp_status[FPST_STD_F16].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20250129013857.135256-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h            |  1 -
 target/arm/cpu.c            |  4 ++--
 target/arm/tcg/mve_helper.c | 24 ++++++++++++------------
 target/arm/vfp_helper.c     |  8 ++++----
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c025649ff24..893a2cdd0a5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -697,7 +697,6 @@ typedef struct CPUArchState {
                 float_status ah_fp_status;
                 float_status ah_fp_status_f16;
                 float_status standard_fp_status;
-                float_status standard_fp_status_f16;
             };
         };
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8fa220a7165..b887edf1d19 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -549,13 +549,13 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     set_flush_to_zero(1, &env->vfp.standard_fp_status);
     set_flush_inputs_to_zero(1, &env->vfp.standard_fp_status);
     set_default_nan_mode(1, &env->vfp.standard_fp_status);
-    set_default_nan_mode(1, &env->vfp.standard_fp_status_f16);
+    set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
     arm_set_default_fp_behaviours(&env->vfp.standard_fp_status);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
-    arm_set_default_fp_behaviours(&env->vfp.standard_fp_status_f16);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
     arm_set_ah_fp_behaviours(&env->vfp.ah_fp_status);
     set_flush_to_zero(1, &env->vfp.ah_fp_status);
     set_flush_inputs_to_zero(1, &env->vfp.ah_fp_status);
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 03ebef5ef21..911a53a23a8 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -2814,7 +2814,7 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
@@ -2888,7 +2888,7 @@ DO_2OP_FP_ALL(vminnma, minnuma)
                 r[e] = 0;                                               \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(tm & 1)) {                                            \
                 /* We need the result but without updating flags */     \
@@ -2926,7 +2926,7 @@ DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
@@ -2964,7 +2964,7 @@ DO_VFMA(vfmss, 4, float32, true)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE * 2)) == 0) {          \
                 continue;                                               \
             }                                                           \
-            fpst0 = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :   \
+            fpst0 = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :  \
                 &env->vfp.standard_fp_status;                           \
             fpst1 = fpst0;                                              \
             if (!(mask & 1)) {                                          \
@@ -3049,7 +3049,7 @@ DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
@@ -3084,7 +3084,7 @@ DO_2OP_FP_SCALAR_ALL(vfmul_scalar, mul)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
@@ -3117,7 +3117,7 @@ DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, float32, DO_VFMAS_SCALARS)
         TYPE *m = vm;                                           \
         TYPE ra = (TYPE)ra_in;                                  \
         float_status *fpst = (ESIZE == 2) ?                     \
-            &env->vfp.standard_fp_status_f16 :                  \
+            &env->vfp.fp_status[FPST_STD_F16] :                 \
             &env->vfp.standard_fp_status;                       \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
             if (mask & 1) {                                     \
@@ -3168,7 +3168,7 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
             if ((mask & emask) == 0) {                                  \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & (1 << (e * ESIZE)))) {                         \
                 /* We need the result but without updating flags */     \
@@ -3202,7 +3202,7 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
             if ((mask & emask) == 0) {                                  \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & (1 << (e * ESIZE)))) {                         \
                 /* We need the result but without updating flags */     \
@@ -3267,7 +3267,7 @@ DO_VCMP_FP_BOTH(vfcmples, vfcmple_scalars, 4, float32, !DO_GT32)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
@@ -3301,7 +3301,7 @@ DO_VCVT_FIXED(vcvt_fu, 4, uint32_t, helper_vfp_touls_round_to_zero)
         float_status *fpst;                                             \
         float_status scratch_fpst;                                      \
         float_status *base_fpst = (ESIZE == 2) ?                        \
-            &env->vfp.standard_fp_status_f16 :                          \
+            &env->vfp.fp_status[FPST_STD_F16] :                         \
             &env->vfp.standard_fp_status;                               \
         uint32_t prev_rmode = get_float_rounding_mode(base_fpst);       \
         set_float_rounding_mode(rmode, base_fpst);                      \
@@ -3427,7 +3427,7 @@ void HELPER(mve_vcvtt_hs)(CPUARMState *env, void *vd, void *vm)
             if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
                 continue;                                               \
             }                                                           \
-            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+            fpst = (ESIZE == 2) ? &env->vfp.fp_status[FPST_STD_F16] :   \
                 &env->vfp.standard_fp_status;                           \
             if (!(mask & 1)) {                                          \
                 /* We need the result but without updating flags */     \
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 66a482a9add..4920afeb012 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -122,7 +122,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     /* FZ16 does not generate an input denormal exception.  */
     a32_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
           & ~float_flag_input_denormal_flushed);
-    a32_flags |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
+    a32_flags |= (get_float_exception_flags(&env->vfp.fp_status[FPST_STD_F16])
           & ~float_flag_input_denormal_flushed);
 
     a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
@@ -160,7 +160,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a32);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD_F16]);
     set_float_exception_flags(0, &env->vfp.ah_fp_status);
     set_float_exception_flags(0, &env->vfp.ah_fp_status_f16);
 }
@@ -207,11 +207,11 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         bool ftz_enabled = val & FPCR_FZ16;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
-        set_flush_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
         set_flush_to_zero(ftz_enabled, &env->vfp.ah_fp_status_f16);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.ah_fp_status_f16);
     }
     if (changed & FPCR_FZ) {
-- 
2.34.1

