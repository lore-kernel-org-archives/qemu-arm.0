Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933139njk;
        Fri, 24 Jan 2025 08:39:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUB49TovJg83ZjqZNDjWPLry1Ylwk/wQkOHTE2OLB4BuqIBqQU/ttLaGC1tXn3/vs3q5vVog/6gVZYrhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEtL3UPVXIcOutvDCbb4KsiqwR0aeEhUNu2GfGfXyrUPkYSDyWYHJnwPsYG3NWmeh57tvcY
X-Received: by 2002:a05:6102:dc6:b0:4af:d487:45f3 with SMTP id ada2fe7eead31-4b690ce3acemr23459882137.23.1737736784874;
        Fri, 24 Jan 2025 08:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736784; cv=none;
        d=google.com; s=arc-20240605;
        b=VulvsSc61Sj78/Td9a07LhWIMuZ50xJSlUMCbF7lVyikgNAG0xHkVG8D/BJp74zfLy
         jnYNC/+O1zmg8lXzssbGwvH21ZjraUwCI3174IF9h3N7qy5VKixU6fTeI+bDczyH9clR
         FOhb6YQ0F/ttALzNKUAhPe0PcagLUgaKZlun8JWXOcDihOGHZ2tE6pWPtFzMDmuWr6Gq
         IaG3ejK3EWiR2d42VNIwb1A1r7qC4xcaG/rbcNT8nSAXzUQ65q3rUZN0TyKEFG2e10vz
         RKrZ3ZpbDGSjDMeYL7DGmS+LzzHIFiLrSDR/4hvtCH3fVfs7JQrOtET8jwlvY/FCZBMp
         nIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9M2O1KEVojOtqpm5b8dMJlhsf6kXCrNVO2nLRJ4F4OM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=R+CprEEWKsa7h790O8yLfWBZxzk7AEabVrt4GgSpmdMK5CCT1sUBAmF2mSFkGgC/bn
         3Co2+zdq975ehW3ZPMSS3nTfhYtUy4zcPTV/YHR+UnREpM4gOEsyP9Rh1zcjjNlVA9PG
         ppthjkFo60lSXUXLV828zHf+rIaIT+P5j4TytjqQeCnJEw9PvnLjZnoF7iybbF0rVtMO
         NZpRfpRU8Ki0kygdOe/Ek49MngtKLkvexPaEPi4/orGAsS8MyYbN50q/NlnzXksJTLVZ
         s/jgvkinqUOLRPU+PkqH/3Mii/Ea3vzSfunCEhVcaC5L+Iq5GA2wn8n1QpkEVz1ckgvy
         wayg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YzZ66sCu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-864a9d0b3a6si733707241.155.2025.01.24.08.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:39:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YzZ66sCu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMbq-0002Px-1P; Fri, 24 Jan 2025 11:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYN-0003tb-7t
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYI-0005TG-56
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43635796b48so15504475e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736140; x=1738340940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9M2O1KEVojOtqpm5b8dMJlhsf6kXCrNVO2nLRJ4F4OM=;
 b=YzZ66sCunxTOwsAmD0Gp0q47o7oxWtQ4ZEsiiBNSTOCz6e+0AwgssE0cfy+2wQKf0D
 GazWwp+bj6+/5ipVO0bdHTdn3YqiCoEb5EKzncAYoYMw3A0TeF6pa88UR1HZ8sTxYlEL
 yU5Z87MmqC8oa/p7R53OUpeUMFzL1L8JgtN9R5zomI0Wf05378cnE3disXTsclP6eaUg
 wYlwt2IzXQ+TMr4VNTbsgGbDjupHQi6Zi1lIuJamgyX1zaC+Hb1hih3grV7LsONFWgqT
 zMVBrcPwdQluwXLIdIYVoems4p33mhGDKMn8Aw3vMeKS4E3VlnLRZ7uu5MZtccUfumPc
 JcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736140; x=1738340940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9M2O1KEVojOtqpm5b8dMJlhsf6kXCrNVO2nLRJ4F4OM=;
 b=M/jb8a5dVvkH1CAPiZbMCFoYwwi02ICLjhMX5fTHO4J8muvbm3TK67NSt1CksgiJF6
 qn3Lb17f/skxDriNlt2Ds0wISSbH6ibl92VqT0B3ASkI4RprLnc1bzIhh95a+L7O5Q4p
 xiyv6uAQ9MYd8fyTWyWf2TeVA2jI4/n0hOIJxRXtqZ+yHTWeQPX13ym1R0JG26OvurBn
 DkDxr9aaXflkK6YR6dNK83NrzcpJdHZPlNwjI0T7BWiPFMe6uxbQ91Yc15vtqRCMoKPF
 MoJzN8oQXJRHg2znNqusupM0HSZnRByd23MG5e9+cpFut8+iHTGWhONr8Bq2jZejgrP1
 +QUw==
X-Gm-Message-State: AOJu0Yx//FbxcUOq+KwEIdnC47jVRb9nZi8CWzUk/5O0vW8xP02mgai0
 aFTMaHr7JCwSsWKZmD0+TqDVxoSg48WWaxbgtNfhjsIFt/PiqwlN0iSeNtsO9EW+bw1VaTLSeQk
 m
X-Gm-Gg: ASbGncvCrF/XKbJIMLpUbvH0cSi+CdfJ4DAF0Z1RtMcCfpcLgASp7rGQasgX6G1jShy
 e+fU2Qh9FMfExqxSp6pd88szxBMMBaHRbAemGQXzvoSStyXhTxnN7LDcqO5UcA1YmkBVr5V18ie
 axKAtbhfW6JSb548tkL5ap3/0H1oSSc+UkE0VqejgsXZ9sByB+6aVomSGk2rvgJl3W3qbj+KJWj
 ew/uFhZ7ys5I3iIOYxVI1VWp4wzwH7wy/4kzGtLuZX9oowGnhqBpIIz4/3dtG4cnuH9/7cYHh+a
 SNST6+aOOXM=
X-Received: by 2002:a05:600c:4712:b0:436:e69a:7341 with SMTP id
 5b1f17b1804b1-438b8841d69mr79410825e9.3.1737736140212; 
 Fri, 24 Jan 2025 08:29:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/76] target/arm: Remove now-unused vfp.fp_status_f16 and
 FPST_FPCR_F16
Date: Fri, 24 Jan 2025 16:27:38 +0000
Message-Id: <20250124162836.2332150-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: OdCj1RK6QHVP

Now we have moved all the uses of vfp.fp_status_f16 and FPST_FPCR_F16
to the new A32 or A64 fields, we can remove these.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 2 --
 target/arm/tcg/translate.h | 6 ------
 target/arm/cpu.c           | 1 -
 target/arm/vfp_helper.c    | 7 -------
 4 files changed, 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be409c5c76e..2213c277348 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -635,7 +635,6 @@ typedef struct CPUArchState {
          *
          *  fp_status_a32: is the "normal" fp status for AArch32 insns
          *  fp_status_a64: is the "normal" fp status for AArch64 insns
-         *  fp_status_fp16: used for half-precision calculations
          *  fp_status_fp16_a32: used for AArch32 half-precision calculations
          *  fp_status_fp16_a64: used for AArch64 half-precision calculations
          *  standard_fp_status : the ARM "Standard FPSCR Value"
@@ -663,7 +662,6 @@ typedef struct CPUArchState {
          */
         float_status fp_status_a32;
         float_status fp_status_a64;
-        float_status fp_status_f16;
         float_status fp_status_f16_a32;
         float_status fp_status_f16_a64;
         float_status standard_fp_status;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 57e5d92cd60..ec4c0cf03fc 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -672,7 +672,6 @@ static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
 typedef enum ARMFPStatusFlavour {
     FPST_FPCR_A32,
     FPST_FPCR_A64,
-    FPST_FPCR_F16,
     FPST_FPCR_F16_A32,
     FPST_FPCR_F16_A64,
     FPST_STD,
@@ -691,8 +690,6 @@ typedef enum ARMFPStatusFlavour {
  *   for AArch32 non-FP16 operations controlled by the FPCR
  * FPST_FPCR_A64
  *   for AArch64 non-FP16 operations controlled by the FPCR
- * FPST_FPCR_F16
- *   for operations controlled by the FPCR where FPCR.FZ16 is to be used
  * FPST_FPCR_F16_A32
  *   for AArch32 operations controlled by the FPCR where FPCR.FZ16 is to be used
  * FPST_FPCR_F16_A64
@@ -714,9 +711,6 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     case FPST_FPCR_A64:
         offset = offsetof(CPUARMState, vfp.fp_status_a64);
         break;
-    case FPST_FPCR_F16:
-        offset = offsetof(CPUARMState, vfp.fp_status_f16);
-        break;
     case FPST_FPCR_F16_A32:
         offset = offsetof(CPUARMState, vfp.fp_status_f16_a32);
         break;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ff8514edc6d..7a83b9ee34f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -575,7 +575,6 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
     arm_set_default_fp_behaviours(&env->vfp.standard_fp_status);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status_f16);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
     arm_set_default_fp_behaviours(&env->vfp.standard_fp_status_f16);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index f3aa80bbfb6..3ed69d73698 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -67,8 +67,6 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     i |= get_float_exception_flags(&env->vfp.fp_status_a64);
     i |= get_float_exception_flags(&env->vfp.standard_fp_status);
     /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
     i |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
           & ~float_flag_input_denormal);
     i |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
@@ -87,7 +85,6 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
      */
     set_float_exception_flags(0, &env->vfp.fp_status_a32);
     set_float_exception_flags(0, &env->vfp.fp_status_a64);
-    set_float_exception_flags(0, &env->vfp.fp_status_f16);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a32);
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
@@ -118,17 +115,14 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         }
         set_float_rounding_mode(i, &env->vfp.fp_status_a32);
         set_float_rounding_mode(i, &env->vfp.fp_status_a64);
-        set_float_rounding_mode(i, &env->vfp.fp_status_f16);
         set_float_rounding_mode(i, &env->vfp.fp_status_f16_a32);
         set_float_rounding_mode(i, &env->vfp.fp_status_f16_a64);
     }
     if (changed & FPCR_FZ16) {
         bool ftz_enabled = val & FPCR_FZ16;
-        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
         set_flush_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
@@ -144,7 +138,6 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         bool dnan_enabled = val & FPCR_DN;
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a64);
-        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
     }
-- 
2.34.1

