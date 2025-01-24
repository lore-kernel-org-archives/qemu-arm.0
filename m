Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp927822njk;
        Fri, 24 Jan 2025 08:31:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUC9qTe+ViCcAnKCGSkXp1WDph2DNyudWQ9vw8MvHGEvdNpeQhSZFls8nuO5lSAAvdZcLXzezwrZwruyA==@linaro.org
X-Google-Smtp-Source: AGHT+IFcclkA2c+zUjYj5FcQ1Sp5LSmPreUHraaL0lvsIlFlBeVNlmfWC3LZe9vyFZs0wYCJ2bZY
X-Received: by 2002:a05:620a:3942:b0:7b6:efd0:3d1e with SMTP id af79cd13be357-7be63288d37mr5182318385a.53.1737736268664;
        Fri, 24 Jan 2025 08:31:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736268; cv=none;
        d=google.com; s=arc-20240605;
        b=Ji6J2Deop1qGOIJmR6Oaii84mK1ZBZXx3ijXMJCzgq81sAFVLrbhKJ3KzCot1HTdC0
         mfnPQ+CMTPtihxB/PDFAMf6HivX62z1p1dcvP3ZgRMp6NS1MUXL837GSztEJYqWgtCEk
         M7lvkd5qjrObVwXs0NtnuKN3E2E6cDwaULNLVwzNxrp6L4J/68JQbPv1OAeh9JSVms4M
         eTtnR9JxB0xE1YhX+o6K43hGPBpBwPIm8j0jZpeKX/jv2VlrE8osisACFLsyJ1Wo2dE+
         I961WVwobXvCayPnTQ/D9zV7ogR4ScjKMv57nxP3BZJ96VWzZD1r6J/sEcRGBsDh+dRH
         3UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y5oz9pArMzFfW9wvGP0yBGuc3ozPKdEsvW7lbByV5HM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gCyhtM90yweVwgzOgKg7BFKdZukGPx/DmAtJFmWfCDlN/cgLnVNRZlg9nvqBVTK236
         u81y5BqyTDMEVdHjb1g8vXI5iejDqVOcUcmwyDOxtBj9cQ81bY+ZOvdmBVaEoAFEpaAF
         /5A7zn6Fu9D/DvY/fIltFYJo7kQvFwkF+XlIbptGrbAX03irkhI2QiKHmdLdc+dmhVsN
         BIK94uku9GRdxIzfYpMbZNffGLEJmxbUGk/4G2nJwc1Hv++nyYhK7hiugkHMZaiCkJlf
         YtI2H+IipwbdB9jVP9sXbCkwNQbWXflY0dofx1m0Tik+oLnHA7cD84/bj9pxtuWbMNPV
         gWvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Da0PXiFO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af117bfsi301301685a.502.2025.01.24.08.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:31:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Da0PXiFO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYw-0005XD-3J; Fri, 24 Jan 2025 11:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYW-0003zV-FA
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:17 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYU-0005Yj-M6
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so15862945e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736153; x=1738340953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y5oz9pArMzFfW9wvGP0yBGuc3ozPKdEsvW7lbByV5HM=;
 b=Da0PXiFOAGUwhSarHIHL66ST5LgrJE7FWjOTKc1j10+UA1Wi18+Q2eVDx1YkXRNI/B
 Y8p1eUvx3fqSMQp2E1lbavFrFqJ79TWxFVgtDuPoG/+kk3Y8raVU0FJl/Siq3eDZGcr9
 Psc72TrvcyfiZBKI+nQDXqqJXurMmGmaKvPwSkXGmNpKIRFQohRc/QvbOZEINTstZO1S
 AEmYrtlpPoY1ZU1g87deTmTdnNbNf09Rp6Un5skvS9c7YLrM3NnxtDcOmhA1OimQQFTP
 1vY0j8B1Tp4A2xBvWOlmjFPwfmLveeb3k44qPmYLzSvqtKdgXG/rkQTjTHigYVASA6Ly
 bRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736153; x=1738340953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5oz9pArMzFfW9wvGP0yBGuc3ozPKdEsvW7lbByV5HM=;
 b=m7IdStREuBq/MUEWseZXK8yOMRLG87KESitNDjx0NMVdmPdYNzq4avMWCoSLjSvtw0
 U+ZKtzJ0e7WAyngaWtOCYjm5hujbiU9F0goas9I8C5mE8HI01ABUhP0XKiuap5F8eUw7
 xpcK2UlyFOue4t5dtUxaxXsQvdqBXhT6CZ3ydmloVd7aAC4/xSf1R8ij0Wh0OlaFL1+J
 FsFHXmya8LOQixpSUnnkIj8/pwHeiU0m1rxiJATqQC8mOAinOG9S9xFMFqJlv1jEA0ID
 SIewxWK9zoJ0JwjTRfSPCPFk4Ij04zTzHqzAMZMVxo2zEwqLcKJ2ZZfL/niWWCMk9blk
 kNWg==
X-Gm-Message-State: AOJu0YzeeAMs6cK9Zm6XfR7I1zvwFbByW7y9PdeGl02Vr82FC/2sJHgs
 a1XDcbM+P8sBZF++mIU2sPqjurTuPsldwp1XXLEXwCh75FSZeBeSoiD4/q7EIKXUzXZA1gWdR8y
 X
X-Gm-Gg: ASbGnctXBGwH5ERxSh85w9DW8dd9xi0M2zvl0gkIvy8vVm5nz0DvnPukhYWqE1Y9Hjr
 7re9BveNQxZgAOk4BBloAXClgap+MY9vYJj6PdcHyT5wZ1z7eWWhtfngXcb1B7MDYVPzjAWCvfl
 t86kqF8Gvh3dXX5T1mjICh4M9eN+wQ52CwN9mTY1sctPGXDfTrVkH1H8Ikcq66yDWIekn+99Ltl
 VlQAW3P1R4k8HKR/N9f7ZhTi2c67V1JjOhghUOnAqck5R7VaPkbk9wJUR47gVkXLcyLlqAUki6Z
 R6qIXXNaaVk=
X-Received: by 2002:a7b:cb43:0:b0:434:fafe:edb with SMTP id
 5b1f17b1804b1-43891427757mr260174695e9.24.1737736153235; 
 Fri, 24 Jan 2025 08:29:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/76] target/arm: Implement FPCR.FIZ handling
Date: Fri, 24 Jan 2025 16:27:48 +0000
Message-Id: <20250124162836.2332150-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: zLQPzzMVu0c+

Part of FEAT_AFP is the new control bit FPCR.FIZ.  This bit affects
flushing of single and double precision denormal inputs to zero for
AArch64 floating point instructions.  (For half-precision, the
existing FPCR.FZ16 control remains the only one.)

FPCR.FIZ differs from FPCR.FZ in that if we flush an input denormal
only because of FPCR.FIZ then we should *not* set the cumulative
exception bit FPSR.IDC.

FEAT_AFP also defines that in AArch64 the existing FPCR.FZ only
applies when FPCR.AH is 0.

We can implement this by setting the "flush inputs to zero" state
appropriately when FPCR is written, and by not reflecting the
float_flag_input_denormal status flag into FPSR reads when it is the
result only of FPSR.FIZ.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 58 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 8c79ab4fc8a..5a0b389f7a3 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -61,19 +61,29 @@ static inline uint32_t vfp_exceptbits_from_host(int host_bits)
 
 static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
 {
-    uint32_t i = 0;
+    uint32_t a32_flags = 0, a64_flags = 0;
 
-    i |= get_float_exception_flags(&env->vfp.fp_status_a32);
-    i |= get_float_exception_flags(&env->vfp.fp_status_a64);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    a32_flags |= get_float_exception_flags(&env->vfp.fp_status_a32);
+    a32_flags |= get_float_exception_flags(&env->vfp.standard_fp_status);
     /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
+    a32_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a32)
           & ~float_flag_input_denormal_flushed);
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
+    a32_flags |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
           & ~float_flag_input_denormal_flushed);
-    i |= (get_float_exception_flags(&env->vfp.standard_fp_status_f16)
+
+    a64_flags |= get_float_exception_flags(&env->vfp.fp_status_a64);
+    a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
           & ~float_flag_input_denormal_flushed);
-    return vfp_exceptbits_from_host(i);
+    /*
+     * Flushing an input denormal only because FPCR.FIZ == 1 does
+     * not set FPSR.IDC. So squash it unless (FPCR.AH == 0 && FPCR.FZ == 1).
+     * We only do this for the a64 flags because FIZ has no effect
+     * on AArch32 even if it is set.
+     */
+    if ((env->vfp.fpcr & (FPCR_FZ | FPCR_AH)) != FPCR_FZ) {
+        a64_flags &= ~float_flag_input_denormal_flushed;
+    }
+    return vfp_exceptbits_from_host(a32_flags | a64_flags);
 }
 
 static void vfp_clear_float_status_exc_flags(CPUARMState *env)
@@ -91,6 +101,17 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
 }
 
+static void vfp_sync_and_clear_float_status_exc_flags(CPUARMState *env)
+{
+    /*
+     * Synchronize any pending exception-flag information in the
+     * float_status values into env->vfp.fpsr, and then clear out
+     * the float_status data.
+     */
+    env->vfp.fpsr |= vfp_get_fpsr_from_host(env);
+    vfp_clear_float_status_exc_flags(env);
+}
+
 static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     uint64_t changed = env->vfp.fpcr;
@@ -130,9 +151,18 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a64);
+        /* FIZ is A64 only so FZ always makes A32 code flush inputs to zero */
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_a32);
+    }
+    if (changed & (FPCR_FZ | FPCR_AH | FPCR_FIZ)) {
+        /*
+         * A64: Flush denormalized inputs to zero if FPCR.FIZ = 1, or
+         * both FPCR.AH = 0 and FPCR.FZ = 1.
+         */
+        bool fitz_enabled = (val & FPCR_FIZ) ||
+            (val & (FPCR_FZ | FPCR_AH)) == FPCR_FZ;
+        set_flush_inputs_to_zero(fitz_enabled, &env->vfp.fp_status_a64);
     }
     if (changed & FPCR_DN) {
         bool dnan_enabled = val & FPCR_DN;
@@ -141,6 +171,14 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
     }
+    /*
+     * If any bits changed that we look at in vfp_get_fpsr_from_host(),
+     * we must sync the float_status flags into vfp.fpsr now (under the
+     * old regime) before we update vfp.fpcr.
+     */
+    if (changed & (FPCR_FZ | FPCR_AH | FPCR_FIZ)) {
+        vfp_sync_and_clear_float_status_exc_flags(env);
+    }
 }
 
 #else
-- 
2.34.1

