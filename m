Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1291674ejn;
        Fri, 21 Oct 2022 09:07:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7hUiNWRA6Gxdr8d3qvj366bCAWce4nnAXo2Qgh/X6DVCL+a0Yr9ih9fPZ96v2o5E127eY6
X-Received: by 2002:ac8:7c55:0:b0:39c:e345:9cc6 with SMTP id o21-20020ac87c55000000b0039ce3459cc6mr16573991qtv.679.1666368447318;
        Fri, 21 Oct 2022 09:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666368447; cv=none;
        d=google.com; s=arc-20160816;
        b=bQywwxHoeNzYhugS0WorNRMi/enSJSGlf7Q6y4VQaUsKqM5nVGU4Eaf+S3PqF2Tvy4
         nW/Tlld44AwqXsrKEhzuWiF6nXkTSD8Vfc89mIItxdgXzg9lSgRSLAV+Y/RXh6lvAkob
         4rI4SXGlmTpYm/V7CUovsdaGGe7F5T69W6wPM1c0FuT2NoTgNaAaRpZyWuQfdMjGzW8r
         6mYIPPur+q4ZfRq1zMWYF7HODVrvtt4sdX4528HoX5fw8WGIo5SxPBYFaDgR2Oq1r0iD
         YkcFuo3vEJqu6NHQCAOZr4nLKUzjw6tia3PEjxIFM3dL1tuNxedO4ig3ULgPIX9LjQGy
         bDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Np9gvwTtvCeoH20hMVBWK5EHSNtPAWDkE/dbBbTbCWQ=;
        b=niAll5oQI/J+Ek3nIXfFi4XttYu2BP2/pwo1z7fHrll3vCF2RApTV5qjy59edlLq5j
         CdZeMe1gZUv7CK8CQfc6CVdpOHEK4xhZwGwLwxFuRxI0VeQcvgdu2AYoiolV46YoM19/
         H/K1pO7ZMUBrlNrt5ewyxGgKdoig/D9U8qODXx+LQkmN5gecBQ/crU9Yw59GO+zxcFwC
         wWOlIdY305Y2D5EoczbVNSn9Q3Qy/9y+xJ4z7JOzGZv5o9hBjIExhH6iTU7qIrEEml6Y
         0UgK2jki/t/+YVGeD/HAjjjFDQK4soNVgJvsLOIzku9DD2wYGr6IjExCVDL/sLoLhUR9
         eHWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgTm1h2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id kf10-20020a056214524a00b00499351e5588si11442130qvb.541.2022.10.21.09.07.27
        for <alex.bennee@linaro.org>;
        Fri, 21 Oct 2022 09:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgTm1h2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oluTN-0003IQ-OF; Fri, 21 Oct 2022 12:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluSv-00030Q-K2
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 12:01:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluSm-0005dV-OL
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 12:01:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so5396647wms.0
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Np9gvwTtvCeoH20hMVBWK5EHSNtPAWDkE/dbBbTbCWQ=;
 b=OgTm1h2aojJT19SYg3THvlQv4XSLCuzuzebIuyX+kgayCoRGSePZ9A4WYd81dC7HCy
 XAPapR2QN55CCwv/uvTrKeomvKYDue1fmQWHS+n9c+CgBXYRinBFqTzxVnJ7m/VUjRz5
 R/VUOMkXTNqM0vmEtlF2vnvYWqq4ulrCztmJT887F+JQGnS/8bbLKLWrPrIanupd3vmn
 EZSDZL9X/Hfop9w8H1zSeO06iGdwngnfnBIiM5Kh7Ph3Nj2TVGdJBE1sR86r7IhO/aMH
 wfIQ/e6Q57mU/hlUwbcJM1MIQF74mi2T5Qlw+iLtHTDzuYpCeDI6TJ8884gx6Ik1fcr/
 zhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Np9gvwTtvCeoH20hMVBWK5EHSNtPAWDkE/dbBbTbCWQ=;
 b=sGcDEzzMLyvr7tAJsOypD8MoY3LMcA4HDMgRDp5COZI3mKyqP+SplSLsFI3ui4eX/8
 NSk5va9uchOSApCuEBu6arScZJLGz8oSmIyHY4TrvYI7QZ+kfdUDHidD7cU/k063dSEZ
 wCrEBxi1WfbqxPbpCr3HxB3v/RHQjq9csofR7DKWJ5Cnhp2uMY++SGOTqx0HMRUu+4C2
 VdtT69zUNhnOvh5IXEcIg/NdTG5JsKVQMgpe7uwXI0djj9ssxYX1/Qg6Dg8yX6eo7M9j
 q1C7dyDn3+7iSujlM5AlTwb6HC+ojqwUnPGrgME9irD5O+clX24ASfWV2A5+MQemhljc
 o3Bw==
X-Gm-Message-State: ACrzQf1tIU+z+idFhkGQFqcdNm0RgsWHJTAxyy9JldalNBEvbPkThEv8
 mQmKeBnxZ++MwVtW7iP37h0gjLV6z7V3xg==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr34028950wmr.27.1666368094955; 
 Fri, 21 Oct 2022 09:01:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a1c2942000000b003c6c5a5a651sm2900642wmp.28.2022.10.21.09.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:01:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Implement FEAT_E0PD
Date: Fri, 21 Oct 2022 17:01:31 +0100
Message-Id: <20221021160131.3531787-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I/tqF2pAaTQf

FEAT_E0PD adds new bits E0PD0 and E0PD1 to TCR_EL1, which allow the
OS to forbid EL0 access to half of the address space.  Since this is
an EL0-specific variation on the existing TCR_ELx.{EPD0,EPD1}, we can
implement it entirely in aa64_va_parameters().

This requires moving the existing regime_is_user() to internals.h
so that the code in helper.c can get at it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
changes v1->v2: rebased; the only real conflict was that
regime_is_user() contents had changed.
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/internals.h        | 19 +++++++++++++++++++
 target/arm/cpu64.c            |  1 +
 target/arm/helper.c           |  9 +++++++++
 target/arm/ptw.c              | 19 -------------------
 6 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b0..fd61360a086 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_E0PD (Preventing EL0 access to halves of address maps)
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c1..f8c59858063 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,11 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded2..c8c5ca7b934 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -707,6 +707,25 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1c..da95eabab5e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1185,6 +1185,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f432..252651a8d19 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10491,6 +10491,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ps = extract32(tcr, 16, 3);
         ds = extract64(tcr, 32, 1);
     } else {
+        bool e0pd;
+
         /*
          * Bit 55 is always between the two regions, and is canonical for
          * determining if address tagging is enabled.
@@ -10502,15 +10504,22 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 7, 1);
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
+            e0pd = extract64(tcr, 55, 1);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
             epd = extract32(tcr, 23, 1);
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
+            e0pd = extract64(tcr, 56, 1);
         }
         ps = extract64(tcr, 32, 3);
         ds = extract64(tcr, 59, 1);
+
+        if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
+            regime_is_user(env, mmu_idx)) {
+            epd = true;
+        }
     }
 
     gran = sanitize_gran_size(cpu, gran, stage2);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a101..aed6f92d6f6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -104,25 +104,6 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-
 /* Return the TTBR associated with this translation regime */
 static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
-- 
2.25.1

