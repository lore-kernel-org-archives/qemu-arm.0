Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp927833njk;
        Fri, 24 Jan 2025 08:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWc6ZIG0l3OiOE1+lfcNGxOK0S5sQ1K1i1bzMKDLsRZGAv9hbI729SviCZuEoJzu9CVyInA3XhOtrGLAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IENG2Uq+CbDxeItD8JOaEN+TZu8ofukS4G/pywNURtnL6QrvbnAgI9CAA8Lv3yv7+s/oCgS
X-Received: by 2002:a05:620a:f01:b0:7b6:e207:c8a2 with SMTP id af79cd13be357-7be63288238mr5175894985a.55.1737736269963;
        Fri, 24 Jan 2025 08:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736269; cv=none;
        d=google.com; s=arc-20240605;
        b=PxsY7Gp2Af0nyzisDSMYwQVC0BYjAzDPwblNVxckhXB60dIP7SgIxmBA0YydtGUxmV
         6KVZfX7kYVP9UK8B1JfU9h9tZ8w26W36yfnczURe7HDdT4kFGBDaFGuy86Q3K5iJDRqo
         SkA3juy0cAQlIq0nRO0Ud2QENXpb4Sm2UybD0yKYbk3YOQ5FYnbDKd9Efy8xXr0RMucP
         +VtA0u3ihiuyl3chfmB4NG/J+QLD+2eMRRq6u5bHVESgbvoAKo/8qSsRc0Mrg+SqFpRb
         7A8o6Z7A5/f3Rn3omDrk5kRedqmM4uq71snYkrYpoHjc3n1pFaE01Yrbpd8TwZ8oWL9+
         ktpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4Bgl+ZIxVXe0JFRcnJx8Zd9vTtPNDxDGEduc3gMGLhE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=j8djRKhKf+xHEmwqWBM8F39aV/np2MxslvobCRtRP7PIOys8mmwkHJjo7LF7QQtO/S
         nRtf+0P3S96wbu/b8xqzWlBDdwZZ7PR7k01niNKL4smvfnOpSzC+HSrzHou9YO/+iwhk
         qLwgwqGVVevfgiOd1fvQPIEdaDFP1epggUlHj3RLeYFTyY2V3K2kVD17tvsj+fitk8wi
         wFSesmXE4+nZga7QG7ivDqhQhsl8KTk8bUMkQs3v9nwaIAvHIu338QvA3fwhL0qgIWbr
         ddWx9cURxhTToFDdvD+iB/YLwzLLv5OiLGTD4BT1Sx9TOAguK0+9AWvsqPd1KB6pFRAi
         LYHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbObekRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee16cesi304475185a.261.2025.01.24.08.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbObekRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYt-0005Px-H2; Fri, 24 Jan 2025 11:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYd-0004Ft-LS
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:23 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYa-0005aU-68
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso23696015e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736159; x=1738340959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4Bgl+ZIxVXe0JFRcnJx8Zd9vTtPNDxDGEduc3gMGLhE=;
 b=NbObekREb4g8E2a3l5qsq/7B7njOfV9rH1b/uffiCkBcjjUhwzKVWxXEYBno9zEdyY
 XyONPkttvd8xazHwWDU3Sq3v/0j9K4dFQ3mz1NVcko7R+Vtl+zdPDFs3ZwOoBAA/mlyk
 J7GbwD90y4QHN1ue2M7J1cXQ5oTJun0Nn4Xm7+yCs2sg4uxkZgV2nsxo4zBhnPaEomm5
 pmd7inscEtHJp51I2yMk91H6lTrEc5C6yQeqDUk6VftEf+DWJ6hM/nOVHIZrj7FNAYru
 7EMiuWQu9jbhyNUnkE2ZIaF1rdw5LFfgH8szJKKcIUW2P0BfOmgAfvsWTwQLtFpfEug2
 kgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736159; x=1738340959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Bgl+ZIxVXe0JFRcnJx8Zd9vTtPNDxDGEduc3gMGLhE=;
 b=uGDMV1tgHKCV5U8mPY8PGJIhP4WKMSXf0Dyptk13r6c1eqXn5o3GWRYz8Mj6qnuZXP
 PxyVfhix4ZAGpLakna6OA4AWTltvTTLD3FJQTZy/AppQT49gAHITuGnwbjIlH+SwKD3g
 WRbpliym7vFkOdnoyzlwZ+sbiOCwGYycq3kKGCaTSLksnIDj2J9JUYYhwkCAgDokl+76
 6FG+eHp6VokAwYJSda8K7nmA+u2WwI9Y9IeP4Irgvok5SemlxntIFsw7RRe2mBEehHsH
 gCq0gycD5tTco1O/VlH0OspN/7z0Q3gcKzR2SyX04dEwo3WfsMfwMQ228W/4HMWFlSCi
 c22g==
X-Gm-Message-State: AOJu0YwD+FyBPQOdITGhSaZBUrOfW/C/5RDSIzBHjPf3CNE1ckApPoYd
 UoW92Gqyko/E+YcGOnYc93NwxIsAdfprvBVPLiR6JpcI5E1YKb8Cp6ktSMN8k5eI5KPDNqrTdde
 f
X-Gm-Gg: ASbGncsk+2Sgi5HRHe9MLSqMCL1rrAYj6Z3FnwEgj40BlEU+j1ULG67Cbfy4XVUOizl
 3OmGhFZ49o/UDVkGPDozLA8xwtMi0D8kdNNTw15B7nXPKFiQQzQolNzL6sVjJT1RVZe5cc4DTDJ
 eAL9UFww1dGj/iBofDhin2n1tEAxRCwcIVLEPfuQYGSCMFs3l9YKZ/VDccvmj2Ol8zT/srxGjU0
 GcWcBRl0FRqHXZP5pjyTNB4hrpsfVOxoQgIfWRDipCgZwhVmjAXTAYqlDyJTqJzWIrMD1OXCm4m
 kLSuDPCzrRg=
X-Received: by 2002:a05:600c:34c9:b0:436:f975:29d with SMTP id
 5b1f17b1804b1-438913bffd9mr286485905e9.6.1737736158666; 
 Fri, 24 Jan 2025 08:29:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/76] target/arm: Set up float_status to use for FPCR.AH=1
 behaviour
Date: Fri, 24 Jan 2025 16:27:52 +0000
Message-Id: <20250124162836.2332150-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: CqW2WLRA8v9m

When FPCR.AH is 1, the behaviour of some instructions changes:
 * AdvSIMD BFCVT, BFCVTN, BFCVTN2, BFMLALB, BFMLALT
 * SVE BFCVT, BFCVTNT, BFMLALB, BFMLALT, BFMLSLB, BFMLSLT
 * SME BFCVT, BFCVTN, BFMLAL, BFMLSL (these are all in SME2 which
   QEMU does not yet implement)
 * FRECPE, FRECPS, FRECPX, FRSQRTE, FRSQRTS

The behaviour change is:
 * the instructions do not update the FPSR cumulative exception flags
 * trapped floating point exceptions are disabled (a no-op for QEMU,
   which doesn't implement FPCR.{IDE,IXE,UFE,OFE,DZE,IOE})
 * rounding is always round-to-nearest-even regardless of FPCR.RMode
 * denormalized inputs and outputs are always flushed to zero, as if
   FPCR.{FZ,FIZ} is {1,1}
 * FPCR.FZ16 is still honoured for half-precision inputs

(See the Arm ARM DDI0487L.a section A1.5.9.)

We can provide all these behaviours with another pair of float_status fields
which we use only for these insns, when FPCR.AH is 1. These float_status
fields will always have:
 * flush_to_zero and flush_inputs_to_zero set for the non-F16 field
 * rounding mode set to round-to-nearest-even
and so the only FPCR fields they need to honour are DN and FZ16.

In this commit we only define the new fp_status fields and give them
the required behaviour when FPSR is updated.  In subsequent commits
we will arrange to use this new fp_status field for the instructions
that should be affected by FPCR.AH in this way.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm not super enthusiastic about the ah_fp_status naming, which sort
of suggests it's always to be used when AH=1, rather than "for this
specific group of insns when AH=1". But I couldn't think of a better
name that was still reasonably short...
---
 target/arm/cpu.h           | 15 +++++++++++++++
 target/arm/internals.h     |  2 ++
 target/arm/tcg/translate.h | 14 ++++++++++++++
 target/arm/cpu.c           |  4 ++++
 target/arm/vfp_helper.c    | 13 ++++++++++++-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8b44c725d0..cfb16151577 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -640,6 +640,13 @@ typedef struct CPUArchState {
          *  standard_fp_status : the ARM "Standard FPSCR Value"
          *  standard_fp_status_fp16 : used for half-precision
          *       calculations with the ARM "Standard FPSCR Value"
+         *  ah_fp_status: used for the A64 insns which change behaviour
+         *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
+         *       and the reciprocal and square root estimate/step insns)
+         *  ah_fp_status_f16: used for the A64 insns which change behaviour
+         *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
+         *       and the reciprocal and square root estimate/step insns);
+         *       for half-precision
          *
          * Half-precision operations are governed by a separate
          * flush-to-zero control bit in FPSCR:FZ16. We pass a separate
@@ -654,6 +661,12 @@ typedef struct CPUArchState {
          * the "standard FPSCR" tracks the FPSCR.FZ16 bit rather than
          * using a fixed value for it.
          *
+         * The ah_fp_status is needed because some insns have different
+         * behaviour when FPCR.AH == 1: they don't update cumulative
+         * exception flags, they act like FPCR.{FZ,FIZ} = {1,1} and
+         * they ignore FPCR.RMode. But they don't ignore FPCR.FZ16,
+         * which means we need an ah_fp_status_f16 as well.
+         *
          * To avoid having to transfer exception bits around, we simply
          * say that the FPSCR cumulative exception flags are the logical
          * OR of the flags in the four fp statuses. This relies on the
@@ -666,6 +679,8 @@ typedef struct CPUArchState {
         float_status fp_status_f16_a64;
         float_status standard_fp_status;
         float_status standard_fp_status_f16;
+        float_status ah_fp_status;
+        float_status ah_fp_status_f16;
 
         uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
         uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 98073acc276..b3187341456 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1831,5 +1831,7 @@ int alle1_tlbmask(CPUARMState *env);
 
 /* Set the float_status behaviour to match the Arm defaults */
 void arm_set_default_fp_behaviours(float_status *s);
+/* Set the float_status behaviour to match Arm FPCR.AH=1 behaviour */
+void arm_set_ah_fp_behaviours(float_status *s);
 
 #endif
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index c37c0b539e2..d6edd8db76b 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -676,6 +676,8 @@ typedef enum ARMFPStatusFlavour {
     FPST_FPCR_A64,
     FPST_FPCR_F16_A32,
     FPST_FPCR_F16_A64,
+    FPST_FPCR_AH,
+    FPST_FPCR_AH_F16,
     FPST_STD,
     FPST_STD_F16,
 } ARMFPStatusFlavour;
@@ -696,6 +698,12 @@ typedef enum ARMFPStatusFlavour {
  *   for AArch32 operations controlled by the FPCR where FPCR.FZ16 is to be used
  * FPST_FPCR_F16_A64
  *   for AArch64 operations controlled by the FPCR where FPCR.FZ16 is to be used
+ * FPST_FPCR_AH:
+ *   for AArch64 operations which change behaviour when AH=1 (specifically,
+ *   bfloat16 conversions and multiplies, and the reciprocal and square root
+ *   estimate/step insns)
+ * FPST_FPCR_AH_F16:
+ *   ditto, but for half-precision operations
  * FPST_STD
  *   for A32/T32 Neon operations using the "standard FPSCR value"
  * FPST_STD_F16
@@ -719,6 +727,12 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     case FPST_FPCR_F16_A64:
         offset = offsetof(CPUARMState, vfp.fp_status_f16_a64);
         break;
+    case FPST_FPCR_AH:
+        offset = offsetof(CPUARMState, vfp.ah_fp_status);
+        break;
+    case FPST_FPCR_AH_F16:
+        offset = offsetof(CPUARMState, vfp.ah_fp_status_f16);
+        break;
     case FPST_STD:
         offset = offsetof(CPUARMState, vfp.standard_fp_status);
         break;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1ba22c4c7aa..8fa220a7165 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -556,6 +556,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a32);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16_a64);
     arm_set_default_fp_behaviours(&env->vfp.standard_fp_status_f16);
+    arm_set_ah_fp_behaviours(&env->vfp.ah_fp_status);
+    set_flush_to_zero(1, &env->vfp.ah_fp_status);
+    set_flush_inputs_to_zero(1, &env->vfp.ah_fp_status);
+    arm_set_ah_fp_behaviours(&env->vfp.ah_fp_status_f16);
 
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 2eb75bd7ecc..50a8a659577 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -64,7 +64,7 @@ void arm_set_default_fp_behaviours(float_status *s)
  *    set Invalid for a QNaN
  *  * default NaN has sign bit set, msb frac bit set
  */
-static void arm_set_ah_fp_behaviours(float_status *s)
+void arm_set_ah_fp_behaviours(float_status *s)
 {
     set_float_detect_tininess(float_tininess_after_rounding, s);
     set_float_detect_ftz(detect_ftz_after_rounding, s);
@@ -128,6 +128,11 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
           & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
+    /*
+     * We do not merge in flags from ah_fp_status or ah_fp_status_f16, because
+     * they are used for insns that must not set the cumulative exception bits.
+     */
+
     /*
      * Flushing an input denormal only because FPCR.FIZ == 1 does
      * not set FPSR.IDC. So squash it unless (FPCR.AH == 0 && FPCR.FZ == 1).
@@ -154,6 +159,8 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.ah_fp_status);
+    set_float_exception_flags(0, &env->vfp.ah_fp_status_f16);
 }
 
 static void vfp_sync_and_clear_float_status_exc_flags(CPUARMState *env)
@@ -199,9 +206,11 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
         set_flush_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
+        set_flush_to_zero(ftz_enabled, &env->vfp.ah_fp_status_f16);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.ah_fp_status_f16);
     }
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
@@ -225,6 +234,8 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a64);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
+        set_default_nan_mode(dnan_enabled, &env->vfp.ah_fp_status);
+        set_default_nan_mode(dnan_enabled, &env->vfp.ah_fp_status_f16);
     }
     if (changed & FPCR_AH) {
         bool ah_enabled = val & FPCR_AH;
-- 
2.34.1

