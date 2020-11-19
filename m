Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp757199lfb;
        Thu, 19 Nov 2020 14:07:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE+y2KVjJcMTcjX4Dkn6TO1Xi6tXdc83iWTZiVzczQqzT25DRRSnetejqeSfXlAnsBVJwJ
X-Received: by 2002:a05:6902:690:: with SMTP id i16mr5067971ybt.148.1605823645107;
        Thu, 19 Nov 2020 14:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823645; cv=none;
        d=google.com; s=arc-20160816;
        b=uW8UlU3tQSqEWd0G7p2UmwTWJrbKZrHCNdFy1ikTGb0Bhtu1yL8hIyIzwiaHhDAgQx
         Z8IwfbDGyZk5/tspZkhw2KB9cACYtcxYzqMnclH59cAE7r9wy59tXsKcuL3r2C2imEuL
         EStYxzpbm27vXVKtKfE1w3HB062rETP6C65+RANBmvQuZvsZO2pFqz1CfHrOBl8HW6bp
         d/0y6ZVvZUykSasjHgK5+k3a5FwUEOOnRnebNoq8wzApKQnxEvokMJZNzWFLABZZD1Vx
         2bfXp1UlKkdmDJNoSeh2bFWUzRP+Qaf1vP+l850uPRcIYAAebYrAE3WFCAcjdq7nnfXb
         O/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fefp6vwB13CDumLtzkP2IpkRHFYQ0KIOF0eOKK7wtig=;
        b=dDQ4cABYw7GY6vkKm+ejN/yjYCgdHmUsKXEgUJEteirbYqFBY/vLuKB3GXGrJHwDrM
         HkDuzhwdn3HLqrrCDU5Xq+4pMVOWbCk8uQvn2ND/x2lc3nLT3O/MYdx3exlqWToVgAcF
         gQKvS3M1Wv532VAYefrrquxXMiD7TMwfHzTyq7xo8Z3RSXi71AcwzzEWCtEjgaL6UpqN
         6onA8vJ/KuJrMtRNpxbKYxh/E8zghnS3HEm05Q/2dkXGR5vIPJoqmxbXkOIvVh7Nju/U
         EaOCRHLrk4xlcXggXvSqyRcd22hu4tO3aF32ywcJfSvwpMIWoTj+CM7CqPGU214LBBKG
         dEJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUf1ePKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a34si1055153ybi.18.2020.11.19.14.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUf1ePKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs5M-0005Vz-DE
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvF-0000x9-QB
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:57 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruz-0004D7-9H
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:57 -0500
Received: by mail-wr1-x441.google.com with SMTP id m6so7983805wrg.7
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fefp6vwB13CDumLtzkP2IpkRHFYQ0KIOF0eOKK7wtig=;
 b=XUf1ePKdWlFArUr8NFMEqWBYBkV8FtwP/roIG2d8hreGeCm1jsvAOyPLWUmWXRbl76
 oD0cLWQuoA2CGpgqFvrH/PiDXxhbLlBxa9/rkTUj7KrT8rFcT7MAzc4Yt6kT59OQpDak
 1olUC3E+bRrmXJiXY8z3NzSxoXDl2smFYBcTlt+wkPCy9YJRvDe7eAxZFHO2o7XwxoYT
 eq74hV+XzLVGYXSKBdHlV/leeWLIfX3C8C/iuyxPEqHNDYtoenBguBVWJEf1UMSdRCtN
 4Eite97WI5bRUAZ/7NcUMuWVS8G5haA6mU7xpi/da9yauA1BMfOHoKFpEfLUPTXdbLou
 eM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fefp6vwB13CDumLtzkP2IpkRHFYQ0KIOF0eOKK7wtig=;
 b=eLHcrbjRMkgb1p0dMuTPJad3gITS2BQHBgb7j3ny47Zx0NuM+v2AUj0bAvFNwEBViL
 O+eALtnoQvKV7zGVRfyWIi1yww9bLvS+jSMEZRtHJu+lvc0i5zEmYwqxhd63Kxv3gbDN
 2XGAYJnGDRWLFptTli48cJHCZAcmlwRj9BbJGmCdw81/0sfx6DNxRc0+bXBj0BvEVDR3
 8bBTzA1BT0ohqoa9JBhfen5f+s//QvofZIyLt6EauKuhyN3KbgEcrsdCEgDkwv/HFYSY
 a4RfEMuETZ3tjBcqEdE6bQ/CFGg4yZjC/Teal4Bu1+kNpYI0DSe5sbMF+F1ivA4n0F0Y
 ql2Q==
X-Gm-Message-State: AOAM532Dzflswgb+PL+exb2sl/hlovXoZ1+6I/MF16+lqJE8vbMuwx0Q
 UH0Pmx9C36jOkJSThqFaC6YnD6DKlJEBDQ==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr12319588wrm.259.1605822997628; 
 Thu, 19 Nov 2020 13:56:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/28] hw/intc/armv7m_nvic: Update FPDSCR masking for v8.1M
Date: Thu, 19 Nov 2020 21:56:04 +0000
Message-Id: <20201119215617.29887-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FNIo1eLWBbEk

The FPDSCR register has a similar layout to the FPSCR.  In v8.1M it
gains new fields FZ16 (if half-precision floating point is supported)
and LTPSIZE (always reads as 4).  Update the reset value and the code
that handles writes to this register accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 5 +++++
 hw/intc/armv7m_nvic.c | 9 ++++++++-
 target/arm/cpu.c      | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04f6220b2f7..47cb5032ce9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1521,14 +1521,19 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPCR_IXE    (1 << 12)   /* Inexact exception trap enable */
 #define FPCR_IDE    (1 << 15)   /* Input Denormal exception trap enable */
 #define FPCR_FZ16   (1 << 19)   /* ARMv8.2+, FP16 flush-to-zero */
+#define FPCR_RMODE_MASK (3 << 22) /* Rounding mode */
 #define FPCR_FZ     (1 << 24)   /* Flush-to-zero enable bit */
 #define FPCR_DN     (1 << 25)   /* Default NaN enable bit */
+#define FPCR_AHP    (1 << 26)   /* Alternative half-precision */
 #define FPCR_QC     (1 << 27)   /* Cumulative saturation bit */
 #define FPCR_V      (1 << 28)   /* FP overflow flag */
 #define FPCR_C      (1 << 29)   /* FP carry flag */
 #define FPCR_Z      (1 << 30)   /* FP zero flag */
 #define FPCR_N      (1 << 31)   /* FP negative flag */
 
+#define FPCR_LTPSIZE_SHIFT 16   /* LTPSIZE, M-profile only */
+#define FPCR_LTPSIZE_MASK (7 << FPCR_LTPSIZE_SHIFT)
+
 #define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
 #define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 9628ce876e0..be3bc1f1f45 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2068,7 +2068,14 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         break;
     case 0xf3c: /* FPDSCR */
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-            value &= 0x07c00000;
+            uint32_t mask = FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK;
+            if (cpu_isar_feature(any_fp16, cpu)) {
+                mask |= FPCR_FZ16;
+            }
+            value &= mask;
+            if (cpu_isar_feature(aa32_lob, cpu)) {
+                value |= 4 << FPCR_LTPSIZE_SHIFT;
+            }
             cpu->env.v7m.fpdscr[attrs.secure] = value;
         }
         break;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40f3f798b2b..d6188f6566a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -262,6 +262,9 @@ static void arm_cpu_reset(DeviceState *dev)
              * always reset to 4.
              */
             env->v7m.ltpsize = 4;
+            /* The LTPSIZE field in FPDSCR is constant and reads as 4. */
+            env->v7m.fpdscr[M_REG_NS] = 4 << FPCR_LTPSIZE_SHIFT;
+            env->v7m.fpdscr[M_REG_S] = 4 << FPCR_LTPSIZE_SHIFT;
         }
 
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-- 
2.20.1

