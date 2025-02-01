Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142122njb;
        Sat, 1 Feb 2025 08:41:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtGRHjlyMPHoWCGzWn5JTnvFiOPjVePQMbOTm94GW9TZSj/3NPPkRyl97KrYYkYcBgI9iCvempYw3VHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEFrq608HptjGkFpxmuYPEooEUNfwETe6SvuhrlWFk1j8EdxqBEFdmlevokbsmtP9Eso5Kq
X-Received: by 2002:ac8:7dca:0:b0:46c:82dd:9a67 with SMTP id d75a77b69052e-46fd0acd528mr259704321cf.28.1738428070385;
        Sat, 01 Feb 2025 08:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428070; cv=none;
        d=google.com; s=arc-20240605;
        b=khfAD1BoI9+USvNg1i6Z7VlxMCKGlHBt9CL2MchKDDnIXqiLYxUEIp+8cnytDlsZzK
         hJEAKcpa9LjoNeaiYAKLaajvoe5ewtHtl4yZOCr2sy5Vinjg1OT0ZsoE6eFXc2IZr2Ij
         Kst8dvGQfOBqcEPwS1PDrIHsVZNlDkMr5k01lyr/vDqy5I6C6sKGb+78kECQIPhOaN3r
         4kiBauQ7tVLgGm70nkj6U3MUELbkPEz57wqipa3pOi/cZULMgaJ9NyOA2PUni+ZEZzgx
         MDl10gLw9X7attnlEjlil1srSpzXzNDhGIkZB2fvytiP9jZSgqcW8vcfl84o0f15GuWs
         V6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QSWlr4evNHIOrPAke9eHdO8l/yZ0zpwffXN2cBE755Y=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=F2kzayhjBRK+RkK1iV8Ujqp7hLED0MxEIuEsK/Q8sAv+ytkG75KqIgQ0dxDqBgK0H9
         mmR+p/vgO1IGpCGFBd07lbJK3JVBfWGdvhDX0A5SkB24ocpxxmgxWoafymGCUnnyy9r6
         rEO6IvqgLncClOX9ZRbyw4WHnVYbuVbbT3pVto/MN+VMk9d0SuOQykaxH3P3ZGP4CL25
         uLaI3TKR8tPG25ovMe/xCaQtPnl2vzlt6SH5LP9WLPp2LJt2BfPqKx/jqDeCr535XjZu
         iVJ4paApZlrH+iuvC+pMFS9MhDZyzBrhHIEV2CkkqwMIsj7Nj67TQsJzsNTx1mCnTvSZ
         XGEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dtds9qXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab935si58761211cf.58.2025.02.01.08.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:41:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dtds9qXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY1-00068x-3r; Sat, 01 Feb 2025 11:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXt-00063S-4b
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:37 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXn-00015B-MD
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso2352309f8f.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428030; x=1739032830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QSWlr4evNHIOrPAke9eHdO8l/yZ0zpwffXN2cBE755Y=;
 b=Dtds9qXTLSXmGkhu/4DRRiLn0i7k69OZJCnTC4rf1U5WLFKhAFiHnIhFgRmLPMOJg6
 6eHs98vJgZcp+5JMY6ctus+thLYj0vaop0/EbpMiYMjRmMUvdkuyfZ4uWL0/Z1sSup4w
 hyb3MkyA3BVL20nUovinP9U9Rr2ds/UhBdiPiG43LahGWwreDsRJtsOks6vmwyyS9toQ
 jOAZXS8AK6FLKT2WKFbIhtD9UeS/nxMX8Qr6cwuMazP/RM/IPNw54T217bZRDkDSbUAA
 waHQmrFfH7DLyFe+QtmTWtQNUXELaxG+ZFyakaXc7xdxLSZc0g36dUg5Sh7YeIi8Ml+1
 JEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428030; x=1739032830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSWlr4evNHIOrPAke9eHdO8l/yZ0zpwffXN2cBE755Y=;
 b=sD3zWO/1n0Hc7eZWy3JKdI5OUAb8b8ouGLYu4dxixw7fxawvTiWMf+nJxcbyGgb6Gv
 tFfbaoSYm/dSDJY1bCjScOUZS/l089wV/6fAY84XElcHdEJFTwjUcoMfK1CGlJYTEbKx
 RDGol+PsVi6bRjI8CqMooMuUoDcTejUjiVfiaW1JW5qar1q5RKozqeblQzXdDSD1xyYI
 gCPpcjat8Y5l0IWyi428dY0QcsWJ87I1FWY2WQ5G48+QIYluGMmTQ6R/FytlywBm5PNz
 D2+65o36UjBlwEyImin8wtPZUi4DgfSi4A8rn4TZHQ/csmEzV7nLTRt1XrkMQ+BbuH7u
 yu7Q==
X-Gm-Message-State: AOJu0Yx6O8Fg0uYJcmE/HRzjI6a01Ey32QhMUOeSQPivo+41y/PVnMfK
 ydTiv5rZ9txhFUxZfc33FpLs9mYJr/0HwSfM8Yf0q/Vw+nroE+1aLhRMEQo0L630nFI4pOEYWCG
 h
X-Gm-Gg: ASbGncuvOsiPF1nk7unQH2xFSAIohKtoZk0qnsGiXktlUdU0OPuE0bkxv2hsYABbSyH
 hWZQdiftuNzyhZmcuLmj0zJzKRkaBzDhST1I7IMUqmCqk0errEDjI8CvVuGYfuZEaOHzuTsQldc
 OMzdli9DWaKTZ373Qi4qhrnG0qmoKzKdfI9Nu0qJdHJ+P2hSjqr0Sr1dXopd+w+52M2M8w5s7Cz
 2ZTlGKGY/VeUhJrMMZdsY81I7xUOjmWUrvahhcTy8jcUNcBSxvrdZfJEE1hVUL7qutHpssgaQn1
 oT3rgppazjtehvOOxK+S
X-Received: by 2002:a05:6000:400e:b0:38a:3732:444d with SMTP id
 ffacd0b85a97d-38c5195c27dmr13532118f8f.23.1738428029889; 
 Sat, 01 Feb 2025 08:40:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/69] target/arm: Set up float_status to use for FPCR.AH=1
 behaviour
Date: Sat,  1 Feb 2025 16:39:14 +0000
Message-Id: <20250201164012.1660228-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: N1BbQWECvDqD

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 1fc4fdd7794..3be3fcbe728 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -676,6 +676,8 @@ typedef enum ARMFPStatusFlavour {
     FPST_A64,
     FPST_A32_F16,
     FPST_A64_F16,
+    FPST_AH,
+    FPST_AH_F16,
     FPST_STD,
     FPST_STD_F16,
 } ARMFPStatusFlavour;
@@ -696,6 +698,12 @@ typedef enum ARMFPStatusFlavour {
  *   for AArch32 operations controlled by the FPCR where FPCR.FZ16 is to be used
  * FPST_A64_F16
  *   for AArch64 operations controlled by the FPCR where FPCR.FZ16 is to be used
+ * FPST_AH:
+ *   for AArch64 operations which change behaviour when AH=1 (specifically,
+ *   bfloat16 conversions and multiplies, and the reciprocal and square root
+ *   estimate/step insns)
+ * FPST_AH_F16:
+ *   ditto, but for half-precision operations
  * FPST_STD
  *   for A32/T32 Neon operations using the "standard FPSCR value"
  * FPST_STD_F16
@@ -719,6 +727,12 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     case FPST_A64_F16:
         offset = offsetof(CPUARMState, vfp.fp_status_f16_a64);
         break;
+    case FPST_AH:
+        offset = offsetof(CPUARMState, vfp.ah_fp_status);
+        break;
+    case FPST_AH_F16:
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
index 57100e95378..371d708cf7a 100644
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
     set_float_ftz_detection(float_ftz_after_rounding, s);
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
      * Flushing an input denormal *only* because FPCR.FIZ == 1 does
      * not set FPSR.IDC; if FPCR.FZ is also set then this takes
@@ -156,6 +161,8 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status_f16_a64);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.ah_fp_status);
+    set_float_exception_flags(0, &env->vfp.ah_fp_status_f16);
 }
 
 static void vfp_sync_and_clear_float_status_exc_flags(CPUARMState *env)
@@ -201,9 +208,11 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
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
@@ -227,6 +236,8 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
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

