Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1498909lfy;
        Thu, 6 Aug 2020 03:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytQq7B0dgYLv9ydHBVwN3cueOZuW0KC48X77qqHzQLKDK8E+hjBDDb538UznOYzCqz7owj
X-Received: by 2002:a25:c60b:: with SMTP id k11mr11044903ybf.482.1596710719736;
        Thu, 06 Aug 2020 03:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596710719; cv=none;
        d=google.com; s=arc-20160816;
        b=OPB3KQVuqnxeYjvNo+c/7If1KY1FUHpDqus1wx87IXg6eMChXb0cuhynNm4SBkKu+C
         yDEQC4sQ0uFUcnI5gn7mQhT7fgkrR+Ufh8pTvishLMR1YgZDs4ws+JeLrmjm0Fav/Q0W
         Fe2MnHfvluU4Z7wg4G+VtWgO5zo6FrtRybMstOcGfeyKrrLNQmjf9v+e7L8EO9rq5yLA
         mBMifhrXtKH0pH1RMVIdvHhV/oXilr+MXK+79WJdsm2wCoPLlmCtraIrPaq3AjL0NYZt
         L5+7PEv8NOcMq6IKtQYS+Q2AfUrXSXgU8rwTEGM16hU/MqDP6ilKNLZDV+zvT/Q2EXt7
         DRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RHA41MBQAdtJ8xHpnLFhE8L/40GSEPE/TJljdWuXLT4=;
        b=bVAlUK79MA202WXxNXSctrpWSh4B7lka1Dtu94BGwy2KrjlJ7ApGLy4K+0tSVt7das
         yZi2V7BUjBGxrOjFAYOzs7d7h9izE84L0ZBedbW2OAM5YOJIUr6RYhbYl5KZlSrStSc1
         bwAC2GP3j7olYi8mL9yWpejcJg53Bb5g7f0rrILCZEcgaygML0FG8WW02ML+HqDDcuHt
         B4OiKtxas/+gMh6MTncprd6OEljPRMEua3hJvo+Ovj6cmPiy6QaNMkyCI+B6wVbr02Hb
         P7E+eHJglYn6XtWiZSDxXzQo2xVqOxZ+Ouy3aitDf4UEWvW+wyHXiiamUiBAzjfh6+8g
         ORnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VI6liApF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si4143406ybt.186.2020.08.06.03.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 03:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VI6liApF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3dOh-0005UY-29
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 06:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3dOW-0005SI-8v
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 06:45:08 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3dOQ-0007Ih-GF
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 06:45:07 -0400
Received: by mail-wm1-x344.google.com with SMTP id x5so8420790wmi.2
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RHA41MBQAdtJ8xHpnLFhE8L/40GSEPE/TJljdWuXLT4=;
 b=VI6liApFjvKSdhPzwoAd7qUP+OKHV72ZEeIo4aIvF6+Bs7RhyETeBCM3ei3N9pmzZF
 ku+ahaUKlSbe1p0u8DFkMJUNVgws+QYTyGZZ6zvAhoRjRu32pCj7WjyEbM/sfPuorOTe
 a1ZdIlLAS49eLo5uZdS7Zt7RabM6/w6ULew2hG/d3cdAPogSAdbo1ZUp9+BhvPnS+9q7
 CITE58bR7nY3fdlZOqYLxd6l9fnTpy7HPIu4d1kdYaRQqs4/wJMcffasvp5CIWTjuKlU
 PrhVcQdE7R4KmSGpWq4utU5cccNwKxw5ziizOMVJ6CgNq5WmBXexCEbst3TkpePQ+yAC
 k0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHA41MBQAdtJ8xHpnLFhE8L/40GSEPE/TJljdWuXLT4=;
 b=LGu2A4wXoxX339qK9ohm56jKls6vXt9axqZUlTAKyJPBENasaWtH5ybgIVvQH1q9+U
 GPW+xXLpBqezg2uJrbie1H6rPvqxcYIoXN/FWP62+Y/+iSf5sSGjd8qL7OgUKV9rcEC1
 3vp2RJYStwxnY39G9Fw2swhPsb4DmC4Xjv0WnjQ/5nMq2uWTHUpzP3meQupEvtDTK7TT
 zGzWg8hMOBrd/Ysw+FmFHzO9W2hWdLCW3LARH9qgIA755YAsI8NOdgu2I9ECXgEgpJZj
 D0qR5NrNM11OalRJOImUI5eu6tWTTRW7atIe/FRhUKrIhn/6MYmLSnR51MKjhl6sfzWc
 G+ug==
X-Gm-Message-State: AOAM533Pc+yOtqxmiDtWS9rJuyBrn9KaEWw78hNSRsi1mM++hPPzGEXP
 vxaKSk+SWaMITBCbXfmM2b0/MfDhr/Ethw==
X-Received: by 2002:a05:600c:2184:: with SMTP id
 e4mr7145859wme.24.1596710700256; 
 Thu, 06 Aug 2020 03:45:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a10sm6042189wrx.15.2020.08.06.03.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:44:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Implement FPST_STD_F16 fpstatus
Date: Thu,  6 Aug 2020 11:44:52 +0100
Message-Id: <20200806104453.30393-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200806104453.30393-1-peter.maydell@linaro.org>
References: <20200806104453.30393-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPCN8+jFPruw

Architecturally, Neon FP16 operations use the "standard FPSCR" like
all other Neon operations.  However, this is defined in the Arm ARM
pseudocode as "a fixed value, except that FZ16 (and AHP) follow the
FPSCR bits". In QEMU, the softfloat float_status doesn't include
separate flush-to-zero for FP16 operations, so we must keep separate
fp_status for "Neon non-FP16" and "Neon fp16" operations, in the
same way we do already for the non-Neon "fp_status" vs "fp_status_f16".

Add the extra float_status field to the CPU state structure,
ensure it is correctly initialized and updated on FPSCR writes,
and make fpstatus_ptr(FPST_STD_F16) return a pointer to it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        | 9 ++++++++-
 target/arm/translate.h  | 3 ++-
 target/arm/cpu.c        | 3 +++
 target/arm/vfp_helper.c | 5 +++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e8ed423ea1..e2b989e3f1a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -609,6 +609,8 @@ typedef struct CPUARMState {
          *  fp_status: is the "normal" fp status.
          *  fp_status_fp16: used for half-precision calculations
          *  standard_fp_status : the ARM "Standard FPSCR Value"
+         *  standard_fp_status_fp16 : used for half-precision
+         *       calculations with the ARM "Standard FPSCR Value"
          *
          * Half-precision operations are governed by a separate
          * flush-to-zero control bit in FPSCR:FZ16. We pass a separate
@@ -619,15 +621,20 @@ typedef struct CPUARMState {
          * Neon) which the architecture defines as controlled by the
          * standard FPSCR value rather than the FPSCR.
          *
+         * The "standard FPSCR but for fp16 ops" is needed because
+         * the "standard FPSCR" tracks the FPSCR.FZ16 bit rather than
+         * using a fixed value for it.
+         *
          * To avoid having to transfer exception bits around, we simply
          * say that the FPSCR cumulative exception flags are the logical
-         * OR of the flags in the three fp statuses. This relies on the
+         * OR of the flags in the four fp statuses. This relies on the
          * only thing which needs to read the exception flags being
          * an explicit FPSCR read.
          */
         float_status fp_status;
         float_status fp_status_f16;
         float_status standard_fp_status;
+        float_status standard_fp_status_f16;
 
         /* ZCR_EL[1-3] */
         uint64_t zcr_el[4];
diff --git a/target/arm/translate.h b/target/arm/translate.h
index e3680e65479..6d6d4c0f425 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -436,7 +436,8 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
         offset = offsetof(CPUARMState, vfp.standard_fp_status);
         break;
     case FPST_STD_F16:
-        /* Not yet used or implemented: fall through to assert */
+        offset = offsetof(CPUARMState, vfp.standard_fp_status_f16);
+        break;
     default:
         g_assert_not_reached();
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 111579554fb..6b382fcd60e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -391,12 +391,15 @@ static void arm_cpu_reset(DeviceState *dev)
     set_flush_to_zero(1, &env->vfp.standard_fp_status);
     set_flush_inputs_to_zero(1, &env->vfp.standard_fp_status);
     set_default_nan_mode(1, &env->vfp.standard_fp_status);
+    set_default_nan_mode(1, &env->vfp.standard_fp_status_f16);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.fp_status);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.fp_status_f16);
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &env->vfp.standard_fp_status_f16);
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 60dcd4bf145..64266ece620 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -93,6 +93,8 @@ static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
     /* FZ16 does not generate an input denormal exception.  */
     i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
           & ~float_flag_input_denormal);
+    i |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
+          & ~float_flag_input_denormal);
     return vfp_exceptbits_from_host(i);
 }
 
@@ -124,7 +126,9 @@ static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
     if (changed & FPCR_FZ16) {
         bool ftz_enabled = val & FPCR_FZ16;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
+        set_flush_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.standard_fp_status_f16);
     }
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
@@ -146,6 +150,7 @@ static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
     set_float_exception_flags(i, &env->vfp.fp_status);
     set_float_exception_flags(0, &env->vfp.fp_status_f16);
     set_float_exception_flags(0, &env->vfp.standard_fp_status);
+    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
 }
 
 #else
-- 
2.20.1

