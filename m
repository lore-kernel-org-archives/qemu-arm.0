Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143714njb;
        Sat, 1 Feb 2025 08:44:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHjR1YGCOUs4dvJ0QMcEqFZ83STuS5FrZ6rmjJgyvTAh+pSu9up55Be3C+qPCxHR9AJDHyrkp1yzBlgg==@linaro.org
X-Google-Smtp-Source: AGHT+IF6CN7kvwzkUBbX11tvMvGhEbtSl7nUtk7ZrCWVZWWNtAH8KDFp25oyRnbGykHfO74N5zMK
X-Received: by 2002:a05:620a:4556:b0:7b6:dac1:cb80 with SMTP id af79cd13be357-7bffcdb1e79mr2247075585a.58.1738428276353;
        Sat, 01 Feb 2025 08:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428276; cv=none;
        d=google.com; s=arc-20240605;
        b=YMHB4ws00aqO2pE3/yHERZtRlN+fnyfRAX8NGGEFoKRjiE75zolw895Bxs/P+2nSm5
         PGAo+C8yvwn0sIzLD0mMjSAnR1+UPaz21r4kw+WF9u8RUd2mFpiVexggIC7Rg8K0tR5P
         Je8HqAMPxBgvJG5N2P+VVWtbNkPIaRd8g/FAnV8hIBVgpFvPWfNv5ITTUG5mkpQvf4DC
         md2iJQWcUgH98zfs4WqovwRZmkTGvsAvpXiTHVDXuVNcj4sdfaPUTrmPA1PdDLkI7Z+X
         aK4R6x/0W+Z4C2vveJ3/iGPt/Q3KkS4oLJsxKO526QwUvNo/OLQVIut/UKCRbp8mYhLQ
         G/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SzNiCTM1wRDHeMF6JHYRq3YiojwFkHP92UV866vxOSE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=BhY6pB/6bt20P9Q4ft7D1cjuQLQQcGLc3EoL+P40rQbKDohluGogvQVjInYpPOrUuT
         Bs/Op2mRV+9/BYR70pOv0Xe8Pl6EXqVtMnpo0ntkDw6gPqFsiX4MXjKG42ca0zPLEIDA
         fX17hOWH1r75q5l6HFI9YP5gR0EIAAkNT5ctCRmsjEH6FSkr86pBwje+BO+JhtLftdkO
         JRjyEoy5iOHuhcQsLM1KNVabNEm1R0+vKrElqGSZriQqZEkAzb/PHeONbRMnUD2tlMjY
         dgWT4YHS0jrqPioiZx6/HOarx+CTj0+50j+t88+vuCi6Ag/elMn5u4FDgnsDdcVF9wWM
         UbcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YvXv+Bco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8bf59fsi655734685a.70.2025.02.01.08.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YvXv+Bco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGZM-0001jC-Os; Sat, 01 Feb 2025 11:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYl-0007Rp-MA
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:35 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYj-0001Ld-GY
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43618283d48so22479575e9.1
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428088; x=1739032888; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SzNiCTM1wRDHeMF6JHYRq3YiojwFkHP92UV866vxOSE=;
 b=YvXv+BcoHqdozDGpcT4l1ieFEgu3ypxRJKj1Y02wRmjXUy4QHx1x2Nssvd/kkaFheo
 F/0Y/iL6Zn+42H1VVQX/CH8nG5OONv4LU8yhGGrfTgaGaYMt489P8MkRQSUHkdvKs/re
 Kvg4423ALHXmgmvqhT7M1EXEoBaWQUyucaHcmqn5ylIWOwPKM6E8HeSs2EeO2furTSON
 p6V1MxVeTuxdHAkJ9I8uOHFAzHVYQMriNJ6y5Vxk0ieDsKbI+zy//iXYyDo00ee3eZsJ
 XnjNi0pxjWMOrFMEPli1NcOixYiZ9b5qsnZo/AojYyWCkKEMKvLc84uXwqHgGMf8pRcr
 CMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428088; x=1739032888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzNiCTM1wRDHeMF6JHYRq3YiojwFkHP92UV866vxOSE=;
 b=r4cwvki9ZkF+0Zmh4FvaeZSImnk83OSqjdxjLG28J5dkYUmHFbfXmr9ab4uJiP++X4
 qHomSSkQRoBs06B+r92bsUhJiTPhcWiaE/fmEPkbfzJ4ZJie+jl1AzWxuzDwSPXYHM+J
 d2EJjUdJ6fCK4k/56C+4dRRVisU59pjJWUy1di3qjmUcN1NoruiH33C4SLqW1zWWCpvH
 XcNc5ymj5Pi6aQhxKVDH/asN9bjP3g2XvBH7xWSv3Cb3H5onivXsnMcKGBC4E7pAHnID
 Z4Q308pYLRrDJfOMKiK2crf3Ne7UOxqfJdlGw8KdWl7FyehIVeGSTt3qkVjmKWsSNIHj
 dE7A==
X-Gm-Message-State: AOJu0Yy0Ryrkd5RRrtvGiwlcWrP43D9i6VXIO/XHoJxkjds5iNP8n4rG
 QsCR6IenZ3KvwoqPwPNeygqcoTFe2zkEnM2dZ9oC6WfJaClgOTCuPWCea8UApgHf0Dcn0Ip6dc0
 H
X-Gm-Gg: ASbGncv1cXEYyya1HmVSVSL2Ghf/kSIxl6ky9/fl1qfri7Vxm4OYdrvzeHg+IrutIaP
 NMFJ1ZfjQ1N3Aip+BoRlctVyAOK66d4teW8i5I+7E4xW33cCefUQFqqehq7QV09p95EGCOaRJcL
 2w92Rd5pvo8jh67jHYBixuJCpMNObob54rdfw2I5rT7qjXV0wqRmhnvwPNC7kJoTNzws/EL0kg7
 yjU08wwCx5Rm6OssTWc6gxElOS/flzucR2pDYfpT+mWXuYTQhjRVg7YOa97dsmvg0oJ9jFijR2n
 0NcHBAmFACZTW2Y4BBAv
X-Received: by 2002:a05:600c:1c99:b0:431:5044:e388 with SMTP id
 5b1f17b1804b1-438dc40be3dmr125177545e9.22.1738428087910; 
 Sat, 01 Feb 2025 08:41:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 57/69] target/arm: Introduce CPUARMState.vfp.fp_status[]
Date: Sat,  1 Feb 2025 16:40:00 +0000
Message-Id: <20250201164012.1660228-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: AihTIfziQASv

From: Richard Henderson <richard.henderson@linaro.org>

Move ARMFPStatusFlavour to cpu.h with which to index
this array.  For now, place the array in an anonymous
union with the existing structures.  Adjust the order
of the existing structures to match the enum.

Simplify fpstatus_ptr() using the new array.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20250129013857.135256-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 119 +++++++++++++++++++++----------------
 target/arm/tcg/translate.h |  64 +-------------------
 2 files changed, 70 insertions(+), 113 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f562e0687c9..c025649ff24 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -202,6 +202,61 @@ typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 
 typedef struct NVICState NVICState;
 
+/*
+ * Enum for indexing vfp.fp_status[].
+ *
+ * FPST_A32: is the "normal" fp status for AArch32 insns
+ * FPST_A64: is the "normal" fp status for AArch64 insns
+ * FPST_A32_F16: used for AArch32 half-precision calculations
+ * FPST_A64_F16: used for AArch64 half-precision calculations
+ * FPST_STD: the ARM "Standard FPSCR Value"
+ * FPST_STD_F16: used for half-precision
+ *       calculations with the ARM "Standard FPSCR Value"
+ * FPST_AH: used for the A64 insns which change behaviour
+ *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
+ *       and the reciprocal and square root estimate/step insns)
+ * FPST_AH_F16: used for the A64 insns which change behaviour
+ *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
+ *       and the reciprocal and square root estimate/step insns);
+ *       for half-precision
+ *
+ * Half-precision operations are governed by a separate
+ * flush-to-zero control bit in FPSCR:FZ16. We pass a separate
+ * status structure to control this.
+ *
+ * The "Standard FPSCR", ie default-NaN, flush-to-zero,
+ * round-to-nearest and is used by any operations (generally
+ * Neon) which the architecture defines as controlled by the
+ * standard FPSCR value rather than the FPSCR.
+ *
+ * The "standard FPSCR but for fp16 ops" is needed because
+ * the "standard FPSCR" tracks the FPSCR.FZ16 bit rather than
+ * using a fixed value for it.
+ *
+ * The ah_fp_status is needed because some insns have different
+ * behaviour when FPCR.AH == 1: they don't update cumulative
+ * exception flags, they act like FPCR.{FZ,FIZ} = {1,1} and
+ * they ignore FPCR.RMode. But they don't ignore FPCR.FZ16,
+ * which means we need an ah_fp_status_f16 as well.
+ *
+ * To avoid having to transfer exception bits around, we simply
+ * say that the FPSCR cumulative exception flags are the logical
+ * OR of the flags in the four fp statuses. This relies on the
+ * only thing which needs to read the exception flags being
+ * an explicit FPSCR read.
+ */
+typedef enum ARMFPStatusFlavour {
+    FPST_A32,
+    FPST_A64,
+    FPST_A32_F16,
+    FPST_A64_F16,
+    FPST_AH,
+    FPST_AH_F16,
+    FPST_STD,
+    FPST_STD_F16,
+} ARMFPStatusFlavour;
+#define FPST_COUNT  8
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -631,56 +686,20 @@ typedef struct CPUArchState {
         /* Scratch space for aa32 neon expansion.  */
         uint32_t scratch[8];
 
-        /* There are a number of distinct float control structures:
-         *
-         *  fp_status_a32: is the "normal" fp status for AArch32 insns
-         *  fp_status_a64: is the "normal" fp status for AArch64 insns
-         *  fp_status_fp16_a32: used for AArch32 half-precision calculations
-         *  fp_status_fp16_a64: used for AArch64 half-precision calculations
-         *  standard_fp_status : the ARM "Standard FPSCR Value"
-         *  standard_fp_status_fp16 : used for half-precision
-         *       calculations with the ARM "Standard FPSCR Value"
-         *  ah_fp_status: used for the A64 insns which change behaviour
-         *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
-         *       and the reciprocal and square root estimate/step insns)
-         *  ah_fp_status_f16: used for the A64 insns which change behaviour
-         *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
-         *       and the reciprocal and square root estimate/step insns);
-         *       for half-precision
-         *
-         * Half-precision operations are governed by a separate
-         * flush-to-zero control bit in FPSCR:FZ16. We pass a separate
-         * status structure to control this.
-         *
-         * The "Standard FPSCR", ie default-NaN, flush-to-zero,
-         * round-to-nearest and is used by any operations (generally
-         * Neon) which the architecture defines as controlled by the
-         * standard FPSCR value rather than the FPSCR.
-         *
-         * The "standard FPSCR but for fp16 ops" is needed because
-         * the "standard FPSCR" tracks the FPSCR.FZ16 bit rather than
-         * using a fixed value for it.
-         *
-         * The ah_fp_status is needed because some insns have different
-         * behaviour when FPCR.AH == 1: they don't update cumulative
-         * exception flags, they act like FPCR.{FZ,FIZ} = {1,1} and
-         * they ignore FPCR.RMode. But they don't ignore FPCR.FZ16,
-         * which means we need an ah_fp_status_f16 as well.
-         *
-         * To avoid having to transfer exception bits around, we simply
-         * say that the FPSCR cumulative exception flags are the logical
-         * OR of the flags in the four fp statuses. This relies on the
-         * only thing which needs to read the exception flags being
-         * an explicit FPSCR read.
-         */
-        float_status fp_status_a32;
-        float_status fp_status_a64;
-        float_status fp_status_f16_a32;
-        float_status fp_status_f16_a64;
-        float_status standard_fp_status;
-        float_status standard_fp_status_f16;
-        float_status ah_fp_status;
-        float_status ah_fp_status_f16;
+        /* There are a number of distinct float control structures. */
+        union {
+            float_status fp_status[FPST_COUNT];
+            struct {
+                float_status fp_status_a32;
+                float_status fp_status_a64;
+                float_status fp_status_f16_a32;
+                float_status fp_status_f16_a64;
+                float_status ah_fp_status;
+                float_status ah_fp_status_f16;
+                float_status standard_fp_status;
+                float_status standard_fp_status_f16;
+            };
+        };
 
         uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
         uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 0dff00015e8..f8dc2f0d4bb 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -670,80 +670,18 @@ static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
     return (CPUARMTBFlags){ tb->flags, tb->cs_base };
 }
 
-/*
- * Enum for argument to fpstatus_ptr().
- */
-typedef enum ARMFPStatusFlavour {
-    FPST_A32,
-    FPST_A64,
-    FPST_A32_F16,
-    FPST_A64_F16,
-    FPST_AH,
-    FPST_AH_F16,
-    FPST_STD,
-    FPST_STD_F16,
-} ARMFPStatusFlavour;
-
 /**
  * fpstatus_ptr: return TCGv_ptr to the specified fp_status field
  *
  * We have multiple softfloat float_status fields in the Arm CPU state struct
  * (see the comment in cpu.h for details). Return a TCGv_ptr which has
  * been set up to point to the requested field in the CPU state struct.
- * The options are:
- *
- * FPST_A32
- *   for AArch32 non-FP16 operations controlled by the FPCR
- * FPST_A64
- *   for AArch64 non-FP16 operations controlled by the FPCR
- * FPST_A32_F16
- *   for AArch32 operations controlled by the FPCR where FPCR.FZ16 is to be used
- * FPST_A64_F16
- *   for AArch64 operations controlled by the FPCR where FPCR.FZ16 is to be used
- * FPST_AH:
- *   for AArch64 operations which change behaviour when AH=1 (specifically,
- *   bfloat16 conversions and multiplies, and the reciprocal and square root
- *   estimate/step insns)
- * FPST_AH_F16:
- *   ditto, but for half-precision operations
- * FPST_STD
- *   for A32/T32 Neon operations using the "standard FPSCR value"
- * FPST_STD_F16
- *   as FPST_STD, but where FPCR.FZ16 is to be used
  */
 static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
 {
     TCGv_ptr statusptr = tcg_temp_new_ptr();
-    int offset;
+    int offset = offsetof(CPUARMState, vfp.fp_status[flavour]);
 
-    switch (flavour) {
-    case FPST_A32:
-        offset = offsetof(CPUARMState, vfp.fp_status_a32);
-        break;
-    case FPST_A64:
-        offset = offsetof(CPUARMState, vfp.fp_status_a64);
-        break;
-    case FPST_A32_F16:
-        offset = offsetof(CPUARMState, vfp.fp_status_f16_a32);
-        break;
-    case FPST_A64_F16:
-        offset = offsetof(CPUARMState, vfp.fp_status_f16_a64);
-        break;
-    case FPST_AH:
-        offset = offsetof(CPUARMState, vfp.ah_fp_status);
-        break;
-    case FPST_AH_F16:
-        offset = offsetof(CPUARMState, vfp.ah_fp_status_f16);
-        break;
-    case FPST_STD:
-        offset = offsetof(CPUARMState, vfp.standard_fp_status);
-        break;
-    case FPST_STD_F16:
-        offset = offsetof(CPUARMState, vfp.standard_fp_status_f16);
-        break;
-    default:
-        g_assert_not_reached();
-    }
     tcg_gen_addi_ptr(statusptr, tcg_env, offset);
     return statusptr;
 }
-- 
2.34.1

