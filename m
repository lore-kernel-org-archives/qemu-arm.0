Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933645njk;
        Fri, 24 Jan 2025 08:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXg9pvXGcGYjDyfB3cNvLZa8+dPLgVvjtw/Cvj6Jm+82EX79eiVAzUe1Zjlymg0EfExH7W5KYKhsvDeJw==@linaro.org
X-Google-Smtp-Source: AGHT+IFdE5PRbqAKiEtiJHEDBNfa3gbBHJijPoMJ2TCSbhzkftxTWBm6ekktpfl4R3TDQ9T3UasF
X-Received: by 2002:a05:620a:3705:b0:79f:18d4:d613 with SMTP id af79cd13be357-7be632796admr4383637985a.38.1737736840714;
        Fri, 24 Jan 2025 08:40:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736840; cv=none;
        d=google.com; s=arc-20240605;
        b=K1vQoU0aH6VtMrTiUJpISG/gVpaweSFWz6OXsWZvqeQu7E3s/ls0VzX4xi4xATByQu
         ASwDP5YRTz6h2s7LH6yY8qXjBA0b3e5r1gLkVurlcnVTUoWL2WgGrcXMNEztFILzyCBH
         HWlxLgZau0r70+zrXW80sKy/Y44zuLUbu4fYmDTnKwsKDzTmT0qUEaXKgJOqNVBdMrub
         V/SHFiWNsxSBhoD4gbT9qwRbRAq2ZwL7BLGaGJBPrdfT8y88mnNTPp+lRDHza6xsiTb3
         kQC9e/gB3VKfe9ra7TaDXUGpHhXO2v3eY/kC08SVM1n8WqbtgYdkDFvbu/ufjnAyFq+p
         iI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MgMjtmIn5YHOySMtqed78/dy6/ryGORph+YbtAdKVfY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=c04ORgHDh0LtkWwjh6ZPwaImaG5lzeqJrflY6wxkcy1dBxrZG3zg9YkKfJIVFsZ2ow
         c4/0M/ofZWv/dd8+mzu0tZG7NRLQ+xYPYXf4dribJ+tb6HpRkShfTKLeWPKMUxmDGYIa
         JBNF3Tpzu8ialXBst4uWh2Z87DVa3vjV8wT5GMHL5oElHPi1iZhUy91nUlwphe00k8q5
         D7Ku/FWQi2fji8JUySxU12wzHfME+JXl6158j4X2WD/614YVdJCCzc+XXy0jIKinS5hP
         NUoam7BjoWGQNXzb8vVyF3O5H9Geap8cGNYFQNjAgKrBDkaDVt8y3zfA+Hvi1On6/70P
         Msog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOK8y6St;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81ad7si254826985a.60.2025.01.24.08.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:40:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOK8y6St;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYg-0004Il-5n; Fri, 24 Jan 2025 11:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYE-0003h0-NE
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMY7-0005N6-8a
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283dedso23820975e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736125; x=1738340925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MgMjtmIn5YHOySMtqed78/dy6/ryGORph+YbtAdKVfY=;
 b=ZOK8y6SthOCMdrJ7V8Yu8MsmjtqhA3NkeX2WOV1vnXK2N9b9rCKu1yvleKyTJ3vFQs
 fc9n+Grt3swpKnqxRc36m9/wLKqkre4g327A3FyLLaZTZbOuNEzJTYT843EAn8YHfp4z
 vnSQbgSOjlXsZYNFjaOyETwe/f+VHTVCu8tmcKWFVFy/LyrdckzT6RxymOBwA5pFxVR+
 FXfWcVWh6fjJ/v3xhoYOKzMty8cqP1a7xROVxf1TL+VYwxEq7kvbQGuIw1mHcoKR1ar5
 AzAJNO3FlmveecygrsvvtiAh23nJaRMuFfkcSegseNl9OUDMzYS5S/BvER49eMrJ/Tvy
 Im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736125; x=1738340925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgMjtmIn5YHOySMtqed78/dy6/ryGORph+YbtAdKVfY=;
 b=CyQZkH8iA1vMABJcNjjyNdW5BlqRyc2F5mI+/E6W4yoHNZoVi8EpCOh6D1cYqPVaNU
 Chxmkt/Cynq+ESY9ZN20Pce66sXud5ERXt1Y3YFIz+Q3GycSujbJTfzQ9pC0xsAIxGxm
 wFOGCEFyUxP0L2GOKlB0CAQwimdxdY0//TWZws/ankwcaGJvL/dXgIKOaELPa8RkBYd2
 YjezFe/M3io7Mc8FyNSq5dMKlGpeNenk8D8//019/7jtBBQPuxq7Cl+lokpn7mpVhc9V
 ydweFxzdhw2m5+qAnObaAn5dymCgJmpAc5uSN1Caud78te2lJNsp7b/mkXC5h1EWnxH0
 nppg==
X-Gm-Message-State: AOJu0Yzq0/uD5fOkhV52xr5vJJMi78MNyhtU0uf69CVOF58kVo5kWD2i
 hagBn/IbDOplLPgGChGpKrky4LkswaUlixGPoq5AJ0H/kQnK+9QnG4oseuBHVnk5Ho2L5fhKeX+
 k
X-Gm-Gg: ASbGncuYxphHdKEGsibSgnrrvUpRtMsQR77bXRaW6+uGGKvHvZADbjvQ7+2tvaUhMxB
 lus2SN+mGeZ5J20Cv5UaH0q3w3CIBS+zyX3zv02rkhEVcpPREZK26S1r7OUkkZKUORyQutQIeTi
 Bw7VdJirgP3x8Tsi9/94aJdgtDO0xj4/6y4sf2ybv65Gp0SUvnt7d3lVO7d0qEK6xlxH4hAq5bA
 5MtkK7lmDB/b4x7Me+IibjlAmXl2d/Q1dG4b8JWrscm/qITAoobOCDaBBDI6jgIjaa/GuDUAFLD
 BXc2FPtTnPc=
X-Received: by 2002:a7b:c3d8:0:b0:436:17e4:ad4c with SMTP id
 5b1f17b1804b1-438a0d3c71fmr222778305e9.6.1737736125570; 
 Fri, 24 Jan 2025 08:28:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/76] target/arm: Define new fp_status_a32 and fp_status_a64
Date: Fri, 24 Jan 2025 16:27:26 +0000
Message-Id: <20250124162836.2332150-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: AjjEO2qR7pT4

We want to split the existing fp_status in the Arm CPUState into
separate float_status fields for AArch32 and AArch64.  (This is
because new control bits defined by FEAT_AFP only have an effect for
AArch64, not AArch32.) To make this split we will:
 * define new fp_status_a32 and fp_status_a64 which have
   identical behaviour to the existing fp_status
 * move existing uses of fp_status to fp_status_a32 or
   fp_status_a64 as appropriate
 * delete the old fp_status when it has no uses left

In this patch we add the new float_status fields.

We will also need to split fp_status_f16, but we will do that
as a separate series of patches.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  4 ++++
 target/arm/tcg/translate.h | 12 ++++++++++++
 target/arm/cpu.c           |  2 ++
 target/arm/vfp_helper.c    | 12 ++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a6e8e589cc..337c5383748 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -634,6 +634,8 @@ typedef struct CPUArchState {
         /* There are a number of distinct float control structures:
          *
          *  fp_status: is the "normal" fp status.
+         *  fp_status_a32: is the "normal" fp status for AArch32 insns
+         *  fp_status_a64: is the "normal" fp status for AArch64 insns
          *  fp_status_fp16: used for half-precision calculations
          *  standard_fp_status : the ARM "Standard FPSCR Value"
          *  standard_fp_status_fp16 : used for half-precision
@@ -659,6 +661,8 @@ typedef struct CPUArchState {
          * an explicit FPSCR read.
          */
         float_status fp_status;
+        float_status fp_status_a32;
+        float_status fp_status_a64;
         float_status fp_status_f16;
         float_status standard_fp_status;
         float_status standard_fp_status_f16;
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 2d37d7c9f21..a7509b314b0 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -671,6 +671,8 @@ static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
  */
 typedef enum ARMFPStatusFlavour {
     FPST_FPCR,
+    FPST_FPCR_A32,
+    FPST_FPCR_A64,
     FPST_FPCR_F16,
     FPST_STD,
     FPST_STD_F16,
@@ -686,6 +688,10 @@ typedef enum ARMFPStatusFlavour {
  *
  * FPST_FPCR
  *   for non-FP16 operations controlled by the FPCR
+ * FPST_FPCR_A32
+ *   for AArch32 non-FP16 operations controlled by the FPCR
+ * FPST_FPCR_A64
+ *   for AArch64 non-FP16 operations controlled by the FPCR
  * FPST_FPCR_F16
  *   for operations controlled by the FPCR where FPCR.FZ16 is to be used
  * FPST_STD
@@ -702,6 +708,12 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     case FPST_FPCR:
         offset = offsetof(CPUARMState, vfp.fp_status);
         break;
+    case FPST_FPCR_A32:
+        offset = offsetof(CPUARMState, vfp.fp_status_a32);
+        break;
+    case FPST_FPCR_A64:
+        offset = offsetof(CPUARMState, vfp.fp_status_a64);
+        break;
     case FPST_FPCR_F16:
         offset = offsetof(CPUARMState, vfp.fp_status_f16);
         break;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dc0231233a6..8bdd535db95 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -573,6 +573,8 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     set_default_nan_mode(1, &env->vfp.standard_fp_status);
     set_default_nan_mode(1, &env->vfp.standard_fp_status_f16);
     arm_set_default_fp_behaviours(&env->vfp.fp_status);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status_a32);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status_a64);
     arm_set_default_fp_behaviours(&env->vfp.standard_fp_status);
     arm_set_default_fp_behaviours(&env->vfp.fp_status_f16);
     arm_set_default_fp_behaviours(&env->vfp.standard_fp_status_f16);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index afc41420eb1..7475f97e0ce 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -64,6 +64,8 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     uint32_t i;
 
     i = get_float_exception_flags(&env->vfp.fp_status);
+    i |= get_float_exception_flags(&env->vfp.fp_status_a32);
+    i |= get_float_exception_flags(&env->vfp.fp_status_a64);
     i |= get_float_exception_flags(&env->vfp.standard_fp_status);
     /* FZ16 does not generate an input denormal exception.  */
     i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
@@ -81,6 +83,8 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
      * be the architecturally up-to-date exception flag information first.
      */
     set_float_exception_flags(0, &env->vfp.fp_status);
+    set_float_exception_flags(0, &env->vfp.fp_status_a32);
+    set_float_exception_flags(0, &env->vfp.fp_status_a64);
     set_float_exception_flags(0, &env->vfp.fp_status_f16);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
@@ -109,6 +113,8 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
             break;
         }
         set_float_rounding_mode(i, &env->vfp.fp_status);
+        set_float_rounding_mode(i, &env->vfp.fp_status_a32);
+        set_float_rounding_mode(i, &env->vfp.fp_status_a64);
         set_float_rounding_mode(i, &env->vfp.fp_status_f16);
     }
     if (changed & FPCR_FZ16) {
@@ -122,10 +128,16 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         bool ftz_enabled = val & FPCR_FZ;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
     }
     if (changed & FPCR_DN) {
         bool dnan_enabled = val & FPCR_DN;
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a32);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_a64);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16);
     }
 }
-- 
2.34.1

