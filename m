Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142943njb;
        Sat, 1 Feb 2025 08:42:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1YXYlj0vAc1Ee6ngizajo03qJF9Zk22l39Tk274zkXYZTDjEKRGiGqJcLNwKbH/UfTMl9HC8r2gmBtA==@linaro.org
X-Google-Smtp-Source: AGHT+IGSGCtcVBWnTtM3rgjgrDo8lUzKfzZIbaq99hWSL2Cwn1MN9cHUnJUAYA1RoBgYpaif/8hA
X-Received: by 2002:a05:620a:c44:b0:7be:8304:f241 with SMTP id af79cd13be357-7bffcda48aemr2460865885a.50.1738428172926;
        Sat, 01 Feb 2025 08:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428172; cv=none;
        d=google.com; s=arc-20240605;
        b=ak5rrmwTnkkg376wVhgLZzxDgYVcAIQ68ae/ewgOjwc8aMX2FfxEU9UogF68KTNNQq
         IKv0d7hUWrsAT8e+rpDnGJO7PFM0LK/Z2wUz3BwD2q4L2Echz9BqRM+UO5D9RuF+PrFO
         +IkqkdP8NDu7xQJ/+PXr5E7g9pHg69sh9JS2+uHKCH34NBKQDePJ96g6lkCd4v1GMX9g
         Uxnzkf9X1QWxygW6CQXKFdXo8i5ZxvtzhjFcEBKZAxu2g77Vg1wSPCQF3dlkJMqRanbw
         UTjGvFUqDCqIf2BaN//BmgK21Hb4KvUKj+geIVhl4D+j50xgaASfY0EF7y6x+syau32O
         9wJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ndFhy3R+PRvTF5+po0fXXM0VFFSL6oPFu21l+oGBHxY=;
        fh=jtcfwCu2H98oCc+PerTbGEAxJ0roaW690xQ+OlaR9s8=;
        b=KRoz6f6V/zFBI3RoTcqOp9Vx6H8uP5WRGzKbymFbDvwG5iaLys8t1aakonJYY+NFOG
         QpvFz8Cc8jb1/WH/cv2Qs0pQAt+tZnL1qLV5e4B6LWqkOF7Rm1eTmbWOqW2oaJtZdgG2
         VoDNqOsKN8m1B0azQUkZFveFo9EZrj366+Jmc/pf4v4RJf7Tb+QfcRUoIqRQvygxWBx4
         pVH/kehDc+/Yd4SMg+LtyYPD9pC56Z+0t2aVWRHgydUMPlwhw8BZQsw/BlHWehgirANk
         rFetJbfNtteUx/6Zb6PYqKirzN4JcgnORS8q7JCLERfpxHL8ixBEg+R1H86ytm/dD/vp
         EtKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D1Dxzkx9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8c0a2bsi626853685a.57.2025.02.01.08.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D1Dxzkx9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1teGZB-0000cI-Np; Sat, 01 Feb 2025 11:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYr-0007Vu-S1
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:41:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYp-0001N8-EP
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 11:41:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso34953825e9.2
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 08:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428094; x=1739032894; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ndFhy3R+PRvTF5+po0fXXM0VFFSL6oPFu21l+oGBHxY=;
 b=D1Dxzkx9kPi5EsE5LB4gqJUiNnBvmEsEiQ8Sn6sJPqJGUJ4+AkdcFCUE2O1BkS9uPu
 VftxipvHqQT+RMFOsUQb8Mxo7Snam76qVBVol7cafY7/Rtjzg62r0+AvShRj8DsxLx35
 NRmN7GJGiRrt1RXi8+lJYl5LfXBpvmxEumjTDgApPu1qBc8mM0KDORdfExFYdHFDyZNI
 ad2veswFL36MIMvnOuQ2uIxzEtNf/OLPMk2JrK5RbwtJRPXZWH2Wez4CJmVktwvkL82D
 58Pu9ZYcgJWIxyiU3FnsQ1OLtQWo7L1EnNN8QtmjK3e9aqwhFAmUuonWX599tgrpj50X
 qL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428094; x=1739032894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndFhy3R+PRvTF5+po0fXXM0VFFSL6oPFu21l+oGBHxY=;
 b=b8G+yzYjv6LbFmrjIf3QC6xLmfL17DOv08c6cvFRbrjlifithOpCaR8CeM7C5C6Jy8
 D7UUnml/vClyjvVdpAvfbsnI3WrXYK/TSKE2MMgrTDe2BQlCk5Nu7r3lXxY38TjlZuGe
 ZP7ePkumaFBtVXSZIgAZ0COu2c2wQSK/DCIKHzPRKHEy1+WI7ylk2cRWNpjEVjupG8OK
 lQkzFa9uAH2qHFqNgnq1D7Zw6IoJe3/a7Sh0HYuOTs3JnK6L7IA6tc3A4nq9XxHdOzLp
 mUWv28YR4XcJxE3Jkgo81NeJc8ZlnGx/NyaFDufQo+SDVR2BqtAXZPaM9UvwhmKBjs2K
 MrYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZe4jPJ4O9F/Qhqh6Qq6jbUn2ZrsvXkh4mv8b2k4L5d6BHBuQRdSsVtxOcM3+bev0txu/psS0/AJMg@nongnu.org
X-Gm-Message-State: AOJu0YwK/2pN2V0VmCz2+BY7kdXI9q2+vDwLpLg2LKgZRQZIHJ6Ggzd/
 rf8VDIS9/GTMnFSOw2Mq/+dIPe01qKN3sljMMVVLF94fkRtcdR7SJRCVfPReOhTJwfpbCL29NKD
 n
X-Gm-Gg: ASbGncsR4I7pWF4lrPTTblr1NZrKbZIadvcLXDm8ILSSWUaKFMBjt/MNytUUW3tXcWQ
 G1SMnP5wHoJd3MG/OQ36bLNe4w5Zegx3Wca3aF1rk9Zi2b16DqzNfA3heMXe7cl3lIUCmddjIke
 Dgs77VTXXeTpt9iUeQP6r0vkR7hVuYJjkv3Zxvett6uWneA9ro8zDye8w39zAXFOqoP+eKgqXL5
 1eML8OgOaTd2E225n6mKCZDnZGbpCykbGMjbr0aNqaBlohg1UPK+Vj53lIDjHp1bbw4FOwmoWtQ
 8/5NWStRTue/eU9gIq0Q
X-Received: by 2002:a5d:5f93:0:b0:386:3213:5b9b with SMTP id
 ffacd0b85a97d-38c51e8e12fmr13617935f8f.43.1738428093731; 
 Sat, 01 Feb 2025 08:41:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 62/69] target/arm: Remove fp_status_f16_a64
Date: Sat,  1 Feb 2025 16:40:05 +0000
Message-Id: <20250201164012.1660228-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AxxnIkBVrgFv

From: Richard Henderson <richard.henderson@linaro.org>

Replace with fp_status[FPST_A64_F16].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20250129013857.135256-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h            |  1 -
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/sme_helper.c |  2 +-
 target/arm/tcg/vec_helper.c |  9 ++++-----
 target/arm/vfp_helper.c     | 16 ++++++++--------
 5 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e3d952588a..9e39c8d0d3a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -693,7 +693,6 @@ typedef struct CPUArchState {
                 float_status fp_status_a32;
                 float_status fp_status_a64;
                 float_status fp_status_f16_a32;
-                float_status fp_status_f16_a64;
             };
         };
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 01a0428c6ed..4fc1d00d60f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -554,7 +554,7 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a32);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
     set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 727c085f374..6e336e10c6a 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1043,7 +1043,7 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
      * produces default NaNs. We also need a second copy of fp_status with
      * round-to-odd -- see above.
      */
-    fpst_f16 = env->vfp.fp_status_f16_a64;
+    fpst_f16 = env->vfp.fp_status[FPST_A64_F16];
     fpst_std = env->vfp.fp_status_a64;
     set_default_nan_mode(true, &fpst_std);
     set_default_nan_mode(true, &fpst_f16);
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index cffd0222602..48dbd8bdd23 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2173,7 +2173,7 @@ void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
         }
     }
     do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, negx, negf, desc,
-             get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64));
+             get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]));
 }
 
 void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
@@ -2183,7 +2183,7 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     float_status *status = &env->vfp.fp_status_a64;
-    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64);
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]);
     int negx = 0, negf = 0;
 
     if (is_s) {
@@ -2254,7 +2254,7 @@ void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
         }
     }
     do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, negx, negf, desc,
-                 get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64));
+                 get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]));
 }
 
 void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
@@ -2265,7 +2265,7 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
     float_status *status = &env->vfp.fp_status_a64;
-    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64);
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]);
     int negx = 0, negf = 0;
 
     if (is_s) {
@@ -2275,7 +2275,6 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
             negx = 0x8000;
         }
     }
-
     for (i = 0; i < oprsz; i += 16) {
         float16 mm_16 = *(float16 *)(vm + i + idx);
         float32 mm = float16_to_float32_by_bits(mm_16, fz16);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 09e707badeb..6f7ca617936 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -126,7 +126,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
           & ~float_flag_input_denormal_flushed);
 
     a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
-    a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
+    a64_flags |= (get_float_exception_flags(&env->vfp.fp_status[FPST_A64_F16])
           & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
      * We do not merge in flags from FPST_AH or FPST_AH_F16, because
@@ -158,7 +158,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_a32);
     set_float_exception_flags(0, &env->vfp.fp_status_a64);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a32);
-    set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_A64_F16]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD_F16]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_AH]);
@@ -201,16 +201,16 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_float_rounding_mode(i, &env->vfp.fp_status_a32);
         set_float_rounding_mode(i, &env->vfp.fp_status_a64);
         set_float_rounding_mode(i, &env->vfp.fp_status_f16_a32);
-        set_float_rounding_mode(i, &env->vfp.fp_status_f16_a64);
+        set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64_F16]);
     }
     if (changed & FPCR_FZ16) {
         bool ftz_enabled = val & FPCR_FZ16;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
-        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64_F16]);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_AH_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_AH_F16]);
     }
@@ -235,7 +235,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a64);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
-        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_A64_F16]);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_AH]);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_AH_F16]);
     }
@@ -245,10 +245,10 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         if (ah_enabled) {
             /* Change behaviours for A64 FP operations */
             arm_set_ah_fp_behaviours(&env->vfp.fp_status_a64);
-            arm_set_ah_fp_behaviours(&env->vfp.fp_status_f16_a64);
+            arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
         } else {
             arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
-            arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
+            arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
         }
     }
     /*
-- 
2.34.1

