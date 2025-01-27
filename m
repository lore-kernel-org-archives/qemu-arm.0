Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775670njk;
        Mon, 27 Jan 2025 15:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcc5Vv3JM3cRVR4E61/CLSUYE5ffkcLH/P4guikm967LwGq9GaTVR1EV3HDWYZfQwQcbx4bQEfgxsdRg==@linaro.org
X-Google-Smtp-Source: AGHT+IFRFENheF/5uCEmob2T24kOAK28Gw6F+o4yKWYb54ONjFpmADn0Xp0+BpxfD4j0ega4t99Y
X-Received: by 2002:a05:6214:1312:b0:6d8:a486:e87c with SMTP id 6a1803df08f44-6e1b2140ce0mr580880986d6.4.1738020576858;
        Mon, 27 Jan 2025 15:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020576; cv=none;
        d=google.com; s=arc-20240605;
        b=QOl128Jt1VKwQZwDTqBJGKWrGumFHMyvybMCzckdQhiOdFwvm7eyST04H0B966a8Yz
         gVwu6jbfPan3JRUmHmCXNUV8Hg6RpHDvbTjuO+37GbTVP1BnEOqEbDw9lxWioyLoTLrx
         KhPWwzwXv5SlIDgyZ/9WCSHlU0goka9CgWhWE1vAu++6Tp3BkiabHtWvChZWnJ7PljJC
         jmdGaa7Pjb3/H2LmWuLHCFB3YEC6zAaBH0SepLA7yfwxBnA5/Fs8DVq/smH8EeVEmOIK
         z2jXVkwCNlCRdU0mW/e+UrlwiAcf4J5lEEel10z+bMvMKj/5K+I6Bd5thyzNL/NpRqTI
         ZXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/sdwLV8iKeS70T4jE5aOB3XPO2jkT8fDK3S2SuLEEx4=;
        fh=/xLjfWFyKxv0aQXFHuu7CyhKpQ0yLfFCaIolz6wB8q0=;
        b=AMbf9Ke0yFykk5uAQaCeOGOBgUs19vWWAICgYY1n+acSyEBQzBK7aMweWd3OgqKGyb
         nYZ6YYm1tdg2AzKv2TMYz84iG1RMtTUakNZKz831pAoblMn2K1EdpfHYp/JMtNGU4Ybp
         2nF/f73D4Q7md/GNTUpybDSzg5hIpxzAtghaGH52CbDvg2ILD5YiDV3mAFWmc3/yV0EX
         qZmje6zS4x7nIIANcJdIq12GxcqPJKlJeGb/8AYKW60Y8Y9a3iZZyyWq6217NRBzICpg
         86bzcoRcPfQ9eEOm15KhRzO+BWvIuG/eaWNynrb3Baj8vRuJ6UucHxdEVafUzm5aJRB9
         hdJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVxfAI7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205f01d53si108783056d6.270.2025.01.27.15.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVxfAI7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYUu-0006TN-Hp; Mon, 27 Jan 2025 18:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUi-0006MQ-Fn
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:19 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUe-0005Xq-BJ
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:16 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ee76befe58so8598985a91.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020371; x=1738625171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/sdwLV8iKeS70T4jE5aOB3XPO2jkT8fDK3S2SuLEEx4=;
 b=zVxfAI7nuE7oQwB7Gw38SnqENV6q89lAmaLvD0nQGTQhPQqqY09eiVaciwir7U9wtm
 31PXpKSTOBfSJqgl70ihvTYGKwHQbQR5p/PMxNs549qVG4gSfEoIGZWM1raGMWJ/vsPG
 AsbbZ6R2LORAaNT3qOMaF9Tkl9GEIV3VEswu290ufroy7WbfGrnbOHdenNcn/v+mhUrA
 EKFkU0POapQd/+82mKFCeqJpKAPt32cimYqdq+tU3vhNdvKjO8DFDquHpQ7CsZ3FwAjb
 95CyL4CEdVREyDavuBFk9gXvd0hR9ZFPScL2vaeMG20fFyvGjkAAXPcJhF2dxJ45stfg
 KBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020371; x=1738625171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sdwLV8iKeS70T4jE5aOB3XPO2jkT8fDK3S2SuLEEx4=;
 b=sbs7CCT3L0XnUC3A9+Cu9xyO3SEqvheJqbkJwrRo268jb5kjAn85zlTZiJcBTJAZ5y
 7JbbIwazZks15Ec9f/Gt77bIBGbVbQl+HKy5F0S1gCX2E1Se0l4670yfjlsASjRMrGXF
 fn3PbBKfwXcEcYRgP+tBjXXLp6hQaSOPvPq2GQErhXQUYQAyfLTkEWPmszlYEWfoCgEG
 xpAE7s4XvfnVpwv0BlBCw1rOvRrvnnerRt1Ut1aF+Kp/ZhUz+EBl7tW3uBwlXYOHVN+p
 7DGsdad8vaExzpt/bmJAv7/2lJ+Ex/N5gyOwNEvTIcDPGGroGVUrxg0oIbtJ1jbSAQLm
 kHsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEtWfoIykQW9aG9OcwZHb7ykI0Q0YTglRT0IVeCeqKYVFoU9kjx/DcyQ8njsNh9aZPtvxCOjipqQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGtW2m2BPYTcsRwpvs31b/LXt2MIcfevJlLM0w3HWWXc9DAHnQ
 rt6UmbVaHLPxCN/58MQxb48/mSC7naD+IxGrZ2y75l1ygUtI5nuBWlLGxTzfclo=
X-Gm-Gg: ASbGncs3FqrE3VBhkrTFXCQrzPJ/aYBZgp7Iro+wXwXP6O3VxvfsHQkWRg6tpMYeHNX
 RzFpwD86irhkWR+2V6+3DFQrBDmbQNJZIP1y/c3bRNvWM0FZzVxfH/qtaYEH6OLnOaxjuwaREea
 HsJYupN9BX2hjODuLFvzmv5kSbejjJNSePiFxqB7smtrsnEXp5XsDe/OGhpuBH+YVrDZhK5PAjV
 I3iJEpo6JO6EWBPMp9gRIMz3IcfH/4pj9dKj/ei5zAyFIB+4rqoAfKwSQ0MQ/0OlR4xONWHiGdX
 jar5rUykPWatkwx+Lb+wn6qUqAG+kabXtGXfvgQ=
X-Received: by 2002:a17:90b:540b:b0:2f2:8bdd:cd8b with SMTP id
 98e67ed59e1d1-2f782d972a2mr59914566a91.29.1738020371067; 
 Mon, 27 Jan 2025 15:26:11 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 07/22] target/arm: Remove standard_fp_status_f16
Date: Mon, 27 Jan 2025 15:25:49 -0800
Message-ID: <20250127232604.20386-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: VyCUUEYkAJcN

Replace with fp_status[FPST_STD_F16].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  1 -
 target/arm/cpu.c            |  4 ++--
 target/arm/tcg/mve_helper.c | 24 ++++++++++++------------
 target/arm/vfp_helper.c     |  8 ++++----
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c025649ff2..893a2cdd0a 100644
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
index 8fa220a716..b887edf1d1 100644
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
index 03ebef5ef2..911a53a23a 100644
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
index e63455c4bb..28c2b40bd8 100644
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
@@ -158,7 +158,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a32);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD_F16]);
     set_float_exception_flags(0, &env->vfp.ah_fp_status);
     set_float_exception_flags(0, &env->vfp.ah_fp_status_f16);
 }
@@ -205,11 +205,11 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
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
2.43.0

