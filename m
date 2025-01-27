Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775436njk;
        Mon, 27 Jan 2025 15:29:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUv9oKi4WieLx+FfrmDCOtVuDsfeKj/8UKZgfrlzIsesI+fx+D7GpQb+sjnerqqgx8yq4GRhaabaPBDmA==@linaro.org
X-Google-Smtp-Source: AGHT+IEMjkQJ39RjFBsuHUQuCxpqi7tqdYzLFAL5Eo8aryzTyx9mBWHP84iqYGodhAXN/0IXZfPd
X-Received: by 2002:a05:620a:41a:b0:7be:82e5:5697 with SMTP id af79cd13be357-7be82e5584fmr3289990185a.44.1738020540303;
        Mon, 27 Jan 2025 15:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020540; cv=none;
        d=google.com; s=arc-20240605;
        b=Cp32MB1bkvcet/F10FNz8QphMddvzSyh3m/7rwA1Nirv0UQXeNo0S7QQv+muOJj+7Q
         97HoPZv9mwyetIDpwHO5Mx2M+PZvy4p4mXpGCQoJN3iXy990yGReI23xHIsy4QfjyuJ2
         vn+TDjolZWYy5Bpq5vnbKAxY8DOejdu7SeMi1hNHvwE49e8tWB8OplSRylhh5I51GpNy
         2xM4l9fSfRvMZVniqu9RdQ8ZGux8mK+4Vct/ghJxSBrHG/ATXlOiaQSqVouhmKQ51V+e
         JA311pCLF4Xwf0ObIY34R4SqsXAJKoPcTqWUaE4YXSSG3ZclgyGmGum6arP+ODYk43Ej
         +UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=weeu4pGBnKKliPk8DdBFAKHVxY9v63/VAYgurHgBoNI=;
        fh=KmYfcqVtgDJgr/TLYkAoBB5LUKZvIp5D7ffYfktxQ1g=;
        b=Rx9arZU6DxK4E+t+6RUTX8yU2GAXNrrkH20cJv1kIAuqEOCdGWDvWv4C4RR+gaTv2U
         mA2cYBnf+lA9Z1F94BZZkc5PwY9Q7uUlmIdESFGFfmruTryBt8cbsHww7k3GLFO0r5U0
         qz6f80BuherZW/4BR5N8J038G7/jb2yfJDOW8Zl3hspdy0vdECMvE/3DnMs2wrmeCJBA
         md3aM71G9YbR6jpRbkwvETj6EaynDSIu4XHvYjIT4hiKFUGuKLNCFyqlhi9Udq/O/uHK
         iExtpYDTLvoBDc1xoFMTmbVuySnWAJqshSDo8f/nU8gJhCBudluoEIZ6DcJDx+aTAMnY
         XLDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMXsuQVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af12634si1063546985a.547.2025.01.27.15.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:29:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMXsuQVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYV6-0006eH-EG; Mon, 27 Jan 2025 18:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUn-0006Nw-0L
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:21 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUk-0005b9-0B
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:20 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2ee76befe58so8599062a91.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020376; x=1738625176; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=weeu4pGBnKKliPk8DdBFAKHVxY9v63/VAYgurHgBoNI=;
 b=DMXsuQVZvLXmEZ5aNq8E1dKbADKgudE0GuWHvmmR6vFZ3JkrCjATHakoDZhi4OTW9D
 b4iH8cuBTc/fD2N2QCJVJWqGXcSt7SZbNwx8wowz2ETCIGxPfXgYSUvmNzF2pZDjOFUp
 s+wcXTSNj6JVa/Cxo4Rp38T6kpyOJjtTaQa1egHfJfE/Cw/n6OcK0HOiO4AQQs3QXC2b
 OKI2fHS7Q2TI72xAZPne9BB5iPeRsHiCyRj04uhcl/CjPLZj1x6bsGDRYw0qStGa+ODo
 ZnsZqa6V1gulbHC5kPUTtaMekCQaZs8ZiBWGDMyq8+1yPI26aj0ZCr4w+O/CKa1K75ow
 Khgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020376; x=1738625176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=weeu4pGBnKKliPk8DdBFAKHVxY9v63/VAYgurHgBoNI=;
 b=lROF0k3M+1rsawRv/YbKwOzJF6sUaHb8ECxhjRSOCS0jkCGFsHfp2tqDLl0X7GyURP
 2pVUdcyjjH5MZ/fyvM365mowxhPTqDuf4M+yjnuKMM9GyzanaCUhJQ+QvwwdxzjLC1D4
 7xPAnIev2csrQCeaSJU+wQbGrBDgpAeHiaMYVriBf4BesM40CDIBm4GsnPSh5ypvKxzF
 L9eDt0fBdQI7r1F7VIyXOOSsJFKN17Z9p3sAmWX1LhFLsoMDsK1v8fWXzTLQUVEZsKvH
 614+UFbtJc2SoWsz4+qYctFn1DyGpML9bz8K1lz4mOeUSmMlSVwrprXMt4MyrbLsoYaO
 MOuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLzU8UqUe/i5E4hKFid98nSPqJtZJd5RbukWZiOKCCr9EV3vSTR5sTHeZID4wuJtIgl1kUdRPvqg==@nongnu.org
X-Gm-Message-State: AOJu0YzJiDOiymB540BE8d8VQo8rfsjBold0bis8f/VBUpOf1Ak28R6T
 9Btn30D66tCM/5GCpt8oZ6nCiFKZlwJq2EYEgcQ+ZLzedzKtD4AK8fj4wYRitwnElESsS1Y71Yg
 s
X-Gm-Gg: ASbGnctv7uu+CHvYKAvYybXDNy68NQ9RVFLUo8i+Byqzg5EZ3ZLfrctizJq7NId+s7j
 gMelzlyL7wa9MzO5RG/0M1qZ/8omIi9ieLSusF7h8LYtQlaB1GB90Diy35x/HpEEoFzLuxnmz9u
 3JvE/j4M6wZXsg7jC28hKD+vnlODyWg2CbqUNXv8/L5uiOcKw3F3LgxkvuyeC/cklVmJ3uF3P86
 OviS1rn04aRkR3IEqEf833WZoHuLs+bufpSFSuHGdLycbEcxOTc50UlLRkOEMhJy8CWoysqyKl0
 +gpDXJG3u7L8jJGZgEvF/EIp9VFuRkbPs9uhDks=
X-Received: by 2002:a17:90b:54cb:b0:2ee:dcf6:1c8f with SMTP id
 98e67ed59e1d1-2f782cb4d3fmr69542291a91.16.1738020376638; 
 Mon, 27 Jan 2025 15:26:16 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 13/22] target/arm: Remove fp_status_a64
Date: Mon, 27 Jan 2025 15:25:55 -0800
Message-ID: <20250127232604.20386-14-richard.henderson@linaro.org>
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
X-TUID: tJSDinFD/Bun

Replace with fp_status[FPST_A64].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  1 -
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/sme_helper.c |  2 +-
 target/arm/tcg/vec_helper.c | 10 +++++-----
 target/arm/vfp_helper.c     | 16 ++++++++--------
 5 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 06dbee5725..05a58de045 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -691,7 +691,6 @@ typedef struct CPUArchState {
             float_status fp_status[FPST_COUNT];
             struct {
                 float_status fp_status_a32;
-                float_status fp_status_a64;
             };
         };
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ceb2dcb3fb..777e5f5dd8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -551,7 +551,7 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a32);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 6e336e10c6..dcc48e43db 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1044,7 +1044,7 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
      * round-to-odd -- see above.
      */
     fpst_f16 = env->vfp.fp_status[FPST_A64_F16];
-    fpst_std = env->vfp.fp_status_a64;
+    fpst_std = env->vfp.fp_status[FPST_A64];
     set_default_nan_mode(true, &fpst_std);
     set_default_nan_mode(true, &fpst_f16);
     fpst_odd = fpst_std;
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 61f268efad..9ed04b1b0a 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2184,7 +2184,7 @@ void HELPER(gvec_fmlal_a32)(void *vd, void *vn, void *vm,
 void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
                             CPUARMState *env, uint32_t desc)
 {
-    do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, desc,
+    do_fmlal(vd, vn, vm, &env->vfp.fp_status[FPST_A64], desc,
              get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]));
 }
 
@@ -2194,7 +2194,7 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, oprsz = simd_oprsz(desc);
     uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status_a64;
+    float_status *status = &env->vfp.fp_status[FPST_A64];
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]);
 
     for (i = 0; i < oprsz; i += sizeof(float32)) {
@@ -2246,7 +2246,7 @@ void HELPER(gvec_fmlal_idx_a32)(void *vd, void *vn, void *vm,
 void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
                                 CPUARMState *env, uint32_t desc)
 {
-    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, desc,
+    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status[FPST_A64], desc,
                  get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]));
 }
 
@@ -2257,7 +2257,7 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status_a64;
+    float_status *status = &env->vfp.fp_status[FPST_A64];
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]);
 
     for (i = 0; i < oprsz; i += 16) {
@@ -2936,7 +2936,7 @@ bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
      */
     bool ebf = is_a64(env) && env->vfp.fpcr & FPCR_EBF;
 
-    *statusp = env->vfp.fp_status_a64;
+    *statusp = env->vfp.fp_status[FPST_A64];
     set_default_nan_mode(true, statusp);
 
     if (ebf) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 6a6eb48530..e0d0623097 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -125,7 +125,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     a32_flags |= (get_float_exception_flags(&env->vfp.fp_status[FPST_STD_F16])
           & ~float_flag_input_denormal_flushed);
 
-    a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
+    a64_flags |= get_float_exception_flags(&env->vfp.fp_status[FPST_A64]);
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status[FPST_A64_F16])
           & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
@@ -154,7 +154,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
      * be the architecturally up-to-date exception flag information first.
      */
     set_float_exception_flags(0, &env->vfp.fp_status_a32);
-    set_float_exception_flags(0, &env->vfp.fp_status_a64);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_A64]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_A32_F16]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_A64_F16]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD]);
@@ -197,7 +197,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
             break;
         }
         set_float_rounding_mode(i, &env->vfp.fp_status_a32);
-        set_float_rounding_mode(i, &env->vfp.fp_status_a64);
+        set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64]);
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A32_F16]);
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64_F16]);
     }
@@ -215,7 +215,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
-        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64]);
         /* FIZ is A64 only so FZ always makes A32 code flush inputs to zero */
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
     }
@@ -226,12 +226,12 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
          */
         bool fitz_enabled = (val & FPCR_FIZ) ||
             (val & (FPCR_FZ | FPCR_AH)) == FPCR_FZ;
-        set_flush_inputs_to_zero(fitz_enabled, &env->vfp.fp_status_a64);
+        set_flush_inputs_to_zero(fitz_enabled, &env->vfp.fp_status[FPST_A64]);
     }
     if (changed & FPCR_DN) {
         bool dnan_enabled = val & FPCR_DN;
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a32);
-        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a64);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_A64]);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_A32_F16]);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_A64_F16]);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_AH]);
@@ -242,10 +242,10 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 
         if (ah_enabled) {
             /* Change behaviours for A64 FP operations */
-            arm_set_ah_fp_behaviours(&env->vfp.fp_status_a64);
+            arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
             arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
         } else {
-            arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
+            arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
             arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
         }
     }
-- 
2.43.0

