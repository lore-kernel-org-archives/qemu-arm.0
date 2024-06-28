Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp163076njm;
        Fri, 28 Jun 2024 07:25:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOiE5Mc+1B41k4JYYAgVcsaIG05A8ZwIbKmdRSdXCPrRnTyKebjaR4fscCCYa3DlkR/UPudAQeQYQ0NqNzZU3m804PA6BL
X-Google-Smtp-Source: AGHT+IEWP0pBkK3sI9Yrj0rHQ8Wz6FsXy67wSE3JPwXCQGIRzHFgKjNkEz8voMZ31V3VEWlDgctb
X-Received: by 2002:a0c:eb8c:0:b0:6ad:6447:a23f with SMTP id 6a1803df08f44-6b5409e0c05mr182159856d6.30.1719584714594;
        Fri, 28 Jun 2024 07:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719584714; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgZ4K2NVvV9CUW/jZEAZBrWp5768UCEKLa1TWvF/ZEubxvelLU2RMCh8ZoM5Gq6n9N
         hTC440QXBdxfVQ22rrTamcCZIKtYTWeWOkxqQNVyB4m+D9f9werXrKYYs3Eay3WI9/p5
         g7Q71yMY674ESBYcIMuV2N3Vdxsu/9YJlDNCTCwtti0Hd+PZlAaNQK+fvT2oe/am0PXe
         nlgiC7AcOgGA5MjSPmybIUit9hmZuVGMemDSkWkOHXXt/6dhC0mfsG3dP1H9TS/BBBAK
         RRo+zhMxFfIw7fZbYXOIET3ge1WEbFeWMZdqtRNXZ9fG+UGZ0gzavMCP8EKbgPd4UN+4
         aTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w7xsCqJG+GOkokM323EFwKmfjonAJNK39VxKpZVtgHA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=LrOYoarw4AXmKh2yBUGe5f5pKV1W9N41fUQPgvrh7ddXLv21v5MbwIfd+XFJke68Xw
         lp/q+8Mz3APwF4d4Z9tslkADzorm2NcPOGj4Ql+wrrTPO++4KBGeWJJj/eoYMAkbmxL5
         lRG8IadCK9JrtpZHdT8oVKR+E7rSnHuOBh4bQXR2RJyJbglDZzUEf5FB2ikagqdBvZcD
         mj/vOjnSyAG1a6yn/B8m1m2bNeoDUPz5FMdgO2mbn1BjxvX4TvtfaUjH0VkiAseEzi0w
         YvBichbKfe0d7qChzgQ3rzEMW0QqlZR+y2Fo0FvneDKNayPNfOzDUa82Nrmtt5No2c/G
         XaAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cNOE/Wd8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e36c197si20790896d6.152.2024.06.28.07.25.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 07:25:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cNOE/Wd8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNCWn-0002iS-9f; Fri, 28 Jun 2024 10:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCWW-0002aq-Hu
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:24:28 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCW8-0004VN-V0
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:24:22 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso928254e87.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719584634; x=1720189434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w7xsCqJG+GOkokM323EFwKmfjonAJNK39VxKpZVtgHA=;
 b=cNOE/Wd8+lVDqhVzzDKZ7yP15aH5GyxLkyHQo7El6nThpNnHYlsf8sNPMQx8x5tx05
 qIyxmsUF2WpkNfJwSoRYvkpkMzyP7vO4TwCwgvprp+f8KSiXVs0FzJFVxzztVypfxLB4
 Cf//JSB81yFgBA1lRbq4d6L9kzH+gcogSn/FybojZTi5X9CsyXq/RD1uXgULs693E/vs
 56u2f83yOd8wBPxzERNamejCUZvPfMNGj/J12rGmdXZOzn5Yn/edMhUupDG/pC8jUB8u
 qfU47ub67M2IgS48+J9BpCX4DVftWNMB8lWx7TSseL5SLuslr01M9MbnTacjlFYH3X5H
 o16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719584634; x=1720189434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7xsCqJG+GOkokM323EFwKmfjonAJNK39VxKpZVtgHA=;
 b=fniB3ttCSVTwsEjVLvek+ZZ/fy8nbk5UVCPWkI0AxjWzR8XRfmoWEVPeezOF6W0Uzs
 eBr8Fzp8kqqnhmGoXJ6k9O8C7d2NzHf35vvnU5UP2D+X8Fe74BENT4xd8U1qJ+Y0vZZK
 98IabRsK5WKbHstaB94KPCpkGWb5DtaI4wZzuh+l/4j3qMwRO65AqkRZeKeaRI2vAhLk
 xQ/F72VTC+Av+XS4wXDgwZ/q5Slvh3JdPnJJiZsYloBF4bT/dzsUcUPYKsi3jrZ4OCy/
 5gWUONqRiqpyDnfq4zKsxrCbk6ZH6waEhUQkG8t9bdng1fOhen6R4kPApA2F3DDBtUVD
 SzdQ==
X-Gm-Message-State: AOJu0YzwNQtjzVgJygs31PoswOEH5FCZ33AcB174p6sOnei6tBbDG/AZ
 SoyXBBm5mn770FJNTo/JK2uLtD/4xqerlWCC6DiftTQaMIFbcHyJWjhXeNxebRWmCFbQlncbgZc
 mTUw=
X-Received: by 2002:a05:6512:3caa:b0:52c:cccf:85e1 with SMTP id
 2adb3069b0e04-52ce1865a49mr14550208e87.65.1719584634295; 
 Fri, 28 Jun 2024 07:23:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55c0asm37180945e9.15.2024.06.28.07.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:23:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/arm: Make vfp_set_fpscr() call vfp_set_{fpcr, fpsr}
Date: Fri, 28 Jun 2024 15:23:41 +0100
Message-Id: <20240628142347.1283015-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628142347.1283015-1-peter.maydell@linaro.org>
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: ykuxl1Hs68Ju

Make vfp_set_fpscr() call vfp_set_fpsr() and vfp_set_fpcr()
instead of the other way around.

The masking we do when getting and setting vfp.xregs[ARM_VFP_FPSCR]
is a little awkward, but we are going to change where we store the
underlying FPSR and FPCR information in a later commit, so it will
go away then.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h        |  22 +++++----
 target/arm/vfp_helper.c | 100 ++++++++++++++++++++++++++--------------
 2 files changed, 78 insertions(+), 44 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 68a9922f88e..0a570afcab4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1730,17 +1730,19 @@ uint32_t vfp_get_fpsr(CPUARMState *env);
  */
 uint32_t vfp_get_fpcr(CPUARMState *env);
 
-static inline void vfp_set_fpsr(CPUARMState *env, uint32_t val)
-{
-    uint32_t new_fpscr = (vfp_get_fpscr(env) & ~FPSR_MASK) | (val & FPSR_MASK);
-    vfp_set_fpscr(env, new_fpscr);
-}
+/**
+ * vfp_set_fpsr: write the AArch64 FPSR
+ * @env: CPU context
+ * @value: new value
+ */
+void vfp_set_fpsr(CPUARMState *env, uint32_t value);
 
-static inline void vfp_set_fpcr(CPUARMState *env, uint32_t val)
-{
-    uint32_t new_fpscr = (vfp_get_fpscr(env) & ~FPCR_MASK) | (val & FPCR_MASK);
-    vfp_set_fpscr(env, new_fpscr);
-}
+/**
+ * vfp_set_fpcr: write the AArch64 FPCR
+ * @env: CPU context
+ * @value: new value
+ */
+void vfp_set_fpcr(CPUARMState *env, uint32_t value);
 
 enum arm_cpu_mode {
   ARM_CPU_MODE_USR = 0x10,
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index a87d39e4d9b..38c8aadf9b4 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -99,14 +99,27 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     return vfp_exceptbits_from_host(i);
 }
 
-static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
+static void vfp_set_fpsr_to_host(CPUARMState *env, uint32_t val)
+{
+    /*
+     * The exception flags are ORed together when we read fpscr so we
+     * only need to preserve the current state in one of our
+     * float_status values.
+     */
+    int i = vfp_exceptbits_to_host(val);
+    set_float_exception_flags(i, &env->vfp.fp_status);
+    set_float_exception_flags(0, &env->vfp.fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.standard_fp_status);
+    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
+}
+
+static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val)
 {
-    int i;
     uint32_t changed = env->vfp.xregs[ARM_VFP_FPSCR];
 
     changed ^= val;
     if (changed & (3 << 22)) {
-        i = (val >> 22) & 3;
+        int i = (val >> 22) & 3;
         switch (i) {
         case FPROUNDING_TIEEVEN:
             i = float_round_nearest_even;
@@ -141,17 +154,6 @@ static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16);
     }
-
-    /*
-     * The exception flags are ORed together when we read fpscr so we
-     * only need to preserve the current state in one of our
-     * float_status values.
-     */
-    i = vfp_exceptbits_to_host(val);
-    set_float_exception_flags(i, &env->vfp.fp_status);
-    set_float_exception_flags(0, &env->vfp.fp_status_f16);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status);
-    set_float_exception_flags(0, &env->vfp.standard_fp_status_f16);
 }
 
 #else
@@ -161,7 +163,11 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     return 0;
 }
 
-static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
+static void vfp_set_fpsr_to_host(CPUARMState *env, uint32_t val)
+{
+}
+
+static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val)
 {
 }
 
@@ -204,7 +210,37 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
     return HELPER(vfp_get_fpscr)(env);
 }
 
-void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
+void vfp_set_fpsr(CPUARMState *env, uint32_t val)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    vfp_set_fpsr_to_host(env, val);
+
+    if (arm_feature(env, ARM_FEATURE_NEON) ||
+        cpu_isar_feature(aa32_mve, cpu)) {
+        /*
+         * The bit we set within fpscr_q is arbitrary; the register as a
+         * whole being zero/non-zero is what counts.
+         */
+        env->vfp.qc[0] = val & FPCR_QC;
+        env->vfp.qc[1] = 0;
+        env->vfp.qc[2] = 0;
+        env->vfp.qc[3] = 0;
+    }
+
+    /*
+     * The only FPSR bits we keep in vfp.xregs[FPSCR] are NZCV:
+     * the exception flags IOC|DZC|OFC|UFC|IXC|IDC are stored in
+     * fp_status, and QC is in vfp.qc[]. Store the NZCV bits there,
+     * and zero any of the other FPSR bits (but preserve the FPCR
+     * bits).
+     */
+    val &= FPCR_NZCV_MASK;
+    env->vfp.xregs[ARM_VFP_FPSCR] &= ~FPSR_MASK;
+    env->vfp.xregs[ARM_VFP_FPSCR] |= val;
+}
+
+void vfp_set_fpcr(CPUARMState *env, uint32_t val)
 {
     ARMCPU *cpu = env_archcpu(env);
 
@@ -213,7 +249,7 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
         val &= ~FPCR_FZ16;
     }
 
-    vfp_set_fpscr_to_host(env, val);
+    vfp_set_fpcr_to_host(env, val);
 
     if (!arm_feature(env, ARM_FEATURE_M)) {
         /*
@@ -231,28 +267,24 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
                                      FPCR_LTPSIZE_LENGTH);
     }
 
-    if (arm_feature(env, ARM_FEATURE_NEON) ||
-        cpu_isar_feature(aa32_mve, cpu)) {
-        /*
-         * The bit we set within fpscr_q is arbitrary; the register as a
-         * whole being zero/non-zero is what counts.
-         */
-        env->vfp.qc[0] = val & FPCR_QC;
-        env->vfp.qc[1] = 0;
-        env->vfp.qc[2] = 0;
-        env->vfp.qc[3] = 0;
-    }
-
     /*
      * We don't implement trapped exception handling, so the
      * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
      *
-     * The exception flags IOC|DZC|OFC|UFC|IXC|IDC are stored in
-     * fp_status; QC, Len and Stride are stored separately earlier.
-     * Clear out all of those and the RES0 bits: only NZCV, AHP, DN,
-     * FZ, RMode and FZ16 are kept in vfp.xregs[FPSCR].
+     * The FPCR bits we keep in vfp.xregs[FPSCR] are AHP, DN, FZ, RMode
+     * and FZ16. Len, Stride and LTPSIZE we just handled. Store those bits
+     * there, and zero any of the other FPCR bits and the RES0 and RAZ/WI
+     * bits.
      */
-    env->vfp.xregs[ARM_VFP_FPSCR] = val & 0xf7c80000;
+    val &= FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK | FPCR_FZ16;
+    env->vfp.xregs[ARM_VFP_FPSCR] &= ~FPCR_MASK;
+    env->vfp.xregs[ARM_VFP_FPSCR] |= val;
+}
+
+void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
+{
+    vfp_set_fpcr(env, val & FPCR_MASK);
+    vfp_set_fpsr(env, val & FPSR_MASK);
 }
 
 void vfp_set_fpscr(CPUARMState *env, uint32_t val)
-- 
2.34.1

