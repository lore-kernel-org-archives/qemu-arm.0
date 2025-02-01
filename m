Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142900njb;
        Sat, 1 Feb 2025 08:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWukCBJUwj+Fn2LlCD/CmflZsAwF1nUMqvCCuSVAxjmi/oMpy9C47/ZxH3/zy4l5X5F4nllQLmWNHd/UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFjT2LRPTzj6BLXh/B5x9dprML4rT+w7tflN3tcojCwDb2DVj7wUpJ0XrrRwVrxPG9Vx4W5
X-Received: by 2002:a05:622a:198f:b0:46c:7150:be3c with SMTP id d75a77b69052e-46fd09e28a0mr255297911cf.2.1738428166499;
        Sat, 01 Feb 2025 08:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428166; cv=none;
        d=google.com; s=arc-20240605;
        b=caIg/uMUzdHHN4fr6uD2dPNG6bLBDxdstsdLfaZDbsQ193U6BSKupai1mmfb0275qX
         kr79m/T3ZOKWu2CchKq6XjZzomoFE27I5EE9JcK83IRnStKdQCxMpt/zN0hN5PpijhIU
         cbZ6phLNbgQzNQIMT/9uhahh0zHj/fk1pmp8/yhy4vszpApxBsKg0g52Ea1GYYvsd0UF
         0Kvmw6ZVYpaOq5A1L7v/oEIsEw00eUngSzfgTr0dHI4XaeYypbyLVyucUOT/myUG3Qib
         46tDf02f+1z8SivTTXIuTPbY3ZC3lROOQchZJY0PIdqbFCr3szq4Y9Bdf3KV74WzogJC
         03xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9mOpJBR2x6kKTmggpcs5nZOE6fHzluEUYy5LaYjc6rg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ZAgHYR1CH8GT3GCUyLsSm4sbqm725As5C1eVGwzrAmcEzwV73VJSU5C/g2C+NieE/T
         HcsMEMY0vqvYl4+Uzhhq57rN0TbWZg0jDGjeVED5TxK52D60wkKjgT5zkX+m5cihdqY+
         N8Oezq41FCcaAYeJ5ai6YNXOsHPZbXBMDPCwGFt58Hou+uPGIeVWfcnogWQNjYfqgYqG
         zMohSKYZ71lgJ+4DuSB0vqPW5eSqpLVN9wcH/bJbKKUDj8uw7usafBswCo20xwEMfT0H
         hcJQ8nBTZmT9r0g+X4EkGlb8Y1o86aq8iLes38I01FklzA8ap2OKwQBbPOjqZ5a5sra9
         4kOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRWDMtYG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab8bfsi59829851cf.60.2025.02.01.08.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRWDMtYG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGZQ-0002Bi-Uv; Sat, 01 Feb 2025 11:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYt-0007Wn-Ej
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:41 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYr-0001No-Ds
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:39 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso2352844f8f.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428096; x=1739032896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9mOpJBR2x6kKTmggpcs5nZOE6fHzluEUYy5LaYjc6rg=;
 b=lRWDMtYGIBl9U/veuFKdRbyCpkfUMKWUDyU5IYcSZX37FbL1VO7Alm/wLFLRzMZtZf
 2/27FZjA6l82LzLbW59UHlneOSTur5sXNFJlNjI8i0bZ6RH4NGzIrjq5ha76gHaMr01a
 m4VryfjIFOVfkQ04WCE5YADiceHJsUnNtXsGP/6E1grwAKkl2IEyrfB6B4h8ZYDO38Rb
 fP18bIQZeHRtrAtdMrBlWAU11NOw2mI+FgjaGFD7nL06bZHm1o6voG8ys1BUD2TFhyC7
 8MhPa0FoSzYvhgzAigAvdVMkz1RDVgc8Nu0tRbu8l7E48isq5Qo8zdHCRRdMIbWzdpdq
 pWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428096; x=1739032896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mOpJBR2x6kKTmggpcs5nZOE6fHzluEUYy5LaYjc6rg=;
 b=eXwxcVe/m7v8W/SRjy+lurB1t7fnX3JYnRhCHLCYaUjUXEphC9O1Zb4T//OWwRj7It
 7pE97mJCCvZ8FDRZA05D1ycecjRYQdO1zpARlCYIyuu7y/nJ8e6DhSPioTxfB7zyHQRT
 BW0tNVuKjqXbp23yST2Tml5BFRnhW6bXXguywecTNHohq+ie21EC09GgrnKfKNvT1X7m
 rBQ2yW/pmfKXMcIIrJhA8Pfx1/aJFhFG5SZfNB4ptj9n//inv/GHxmuE5RVfilaEHiY3
 1mzwh9NXXNRVYoa0AGxf91moPJzC6Jo2AaQo/imJRVENZH2YMhXtH1HyDb8c0IFW0xIo
 av2A==
X-Gm-Message-State: AOJu0Yx7L7fH5Ec2XpI9oRj2ybMUljXqbpmKftADN11aY+yCNfPCrCzi
 JcbZbe2ST/8CRwdKXZX73KRFUVULBMDWrbv0DMMuiPK2Y4yXFpZEMtuwBMMANzaL/7KX4Fhdigw
 I
X-Gm-Gg: ASbGncvd5VnVC6J7+XUpIEl5yj8OrnbqqN8A83nFPjv9bqtgj/2x9FDNdGEhWfjiPag
 Cd/B/9jJkLq4sx+KnHn9lw3v3zeCxJ+srD5ba0a5iKmhxcdmUP7AHrVO7QXIxVHi+fgnIW7Ss5O
 q+jl9Uv6PdgfkGn8/7NNK4XE4AUaLRjCiZQdzU7AfU99vadrmp/6Kg6EMwB6YcGuvbqQm92ShUk
 NHTgqx9WeuxneIpzHUYEbvWO3SAguv3T8/fg6D7E8DqgD8OoWNMAEd1AgaNkekIhfHAojlLUWkT
 jny9hAmCcDH6S3LyOYiY
X-Received: by 2002:a05:6000:1f0d:b0:38a:5df9:f86a with SMTP id
 ffacd0b85a97d-38c5195dd7cmr9801562f8f.26.1738428095620; 
 Sat, 01 Feb 2025 08:41:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 64/69] target/arm: Remove fp_status_a64
Date: Sat,  1 Feb 2025 16:40:07 +0000
Message-Id: <20250201164012.1660228-65-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: j2atT/MpVUmV

From: Richard Henderson <richard.henderson@linaro.org>

Replace with fp_status[FPST_A64].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20250129013857.135256-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h            |  1 -
 target/arm/cpu.c            |  2 +-
 target/arm/tcg/sme_helper.c |  2 +-
 target/arm/tcg/vec_helper.c | 10 +++++-----
 target/arm/vfp_helper.c     | 16 ++++++++--------
 5 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 06dbee57259..05a58de0451 100644
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
index ceb2dcb3fb9..777e5f5dd80 100644
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
index 6e336e10c6a..dcc48e43db3 100644
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
index 78f14503f49..215affc2711 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2172,7 +2172,7 @@ void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
             negx = 0x8000800080008000ull;
         }
     }
-    do_fmlal(vd, vn, vm, &env->vfp.fp_status_a64, negx, negf, desc,
+    do_fmlal(vd, vn, vm, &env->vfp.fp_status[FPST_A64], negx, negf, desc,
              get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]));
 }
 
@@ -2182,7 +2182,7 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, oprsz = simd_oprsz(desc);
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status_a64;
+    float_status *status = &env->vfp.fp_status[FPST_A64];
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]);
     int negx = 0, negf = 0;
 
@@ -2253,7 +2253,7 @@ void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
             negx = 0x8000800080008000ull;
         }
     }
-    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status_a64, negx, negf, desc,
+    do_fmlal_idx(vd, vn, vm, &env->vfp.fp_status[FPST_A64], negx, negf, desc,
                  get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]));
 }
 
@@ -2264,7 +2264,7 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status_a64;
+    float_status *status = &env->vfp.fp_status[FPST_A64];
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status[FPST_A64_F16]);
     int negx = 0, negf = 0;
 
@@ -2951,7 +2951,7 @@ bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
      */
     bool ebf = is_a64(env) && env->vfp.fpcr & FPCR_EBF;
 
-    *statusp = is_a64(env) ? env->vfp.fp_status_a64 : env->vfp.fp_status_a32;
+    *statusp = is_a64(env) ? env->vfp.fp_status[FPST_A64] : env->vfp.fp_status_a32;
     set_default_nan_mode(true, statusp);
 
     if (ebf) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index e6e14bfd646..fcbe36ecdc3 100644
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
@@ -156,7 +156,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
      * be the architecturally up-to-date exception flag information first.
      */
     set_float_exception_flags(0, &env->vfp.fp_status_a32);
-    set_float_exception_flags(0, &env->vfp.fp_status_a64);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_A64]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_A32_F16]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_A64_F16]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD]);
@@ -199,7 +199,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
             break;
         }
         set_float_rounding_mode(i, &env->vfp.fp_status_a32);
-        set_float_rounding_mode(i, &env->vfp.fp_status_a64);
+        set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64]);
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A32_F16]);
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64_F16]);
     }
@@ -217,7 +217,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
-        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64]);
         /* FIZ is A64 only so FZ always makes A32 code flush inputs to zero */
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
     }
@@ -228,12 +228,12 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
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
@@ -244,10 +244,10 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 
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
2.34.1

