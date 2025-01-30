Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181898njb;
        Thu, 30 Jan 2025 10:23:22 -0800 (PST)
X-Received: by 2002:a05:600c:2d45:b0:434:ffe3:bc7d with SMTP id 5b1f17b1804b1-438dc3c38b9mr83129425e9.16.1738261402561;
        Thu, 30 Jan 2025 10:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261402; cv=none;
        d=google.com; s=arc-20240605;
        b=QgZs45S1Tph6XkKPcTHmPvolc5amtwUr3tjdDP5ACbKMLDbwVKzp0hWo0MWXDDxafd
         HVzuwetSTea/xhzbfxixnyS76Lrskkd189F8nMkCnP4SXMH81q7gcErXwtkpgxPPzGbn
         XHZzY7AbJkiq8sNSI2IAHqYcnjdlKSULgNWMhy+V1teArUkcE6JHDt8YH+yglJCzLNvD
         k/c7+RS2hYLtIBL5jgLTmveavtplhsDNygPNV7VaQkLuXep0BNCWY5ej4X0ggJYIwCfO
         Cagd0A49syvthng43eo8CnBKWkLYG12k/1aldHiNwSeUz19hakV/trmoSM8ZH8W3q6RU
         hMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2CkHxBykkh+MkSMFpl2gMe093xK0SZ26idFhO7kRCAU=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=TuyI7ch0KUJsRl9/NiS6pHqrMW37K1GotTaAEiIHyJ4L37F7bp4sVPm6apY+TxbXV1
         2G9OlsQn9OV3hMle3eA6mCSaY9W92zGrEq7DILzAxecTN8euZ72XdElp/vbjvY8y9RhT
         unQBUwqpNe/G5UVnKDgbOeYbFR1T/5t6yrV4z5+jyZN1Z4Z7IqqZy88nwAeITFZS+bVg
         jPzmHVjd6cLoucU7fTklDnETHykWaIibpcVwosJVVwzsXWIzHaE9kKS6I+w7AMWvsaHD
         MPz7n3dze44LIFucu2R0KBVqiHIclmAq3QJxVciH2O1XAykA1lET0dZRMkFSicbCdpPz
         9bSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atHs65iv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e24620bcsor7594165e9.9.2025.01.30.10.23.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atHs65iv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261402; x=1738866202; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CkHxBykkh+MkSMFpl2gMe093xK0SZ26idFhO7kRCAU=;
        b=atHs65ivoaePcUSdVrfzN0vFBg425JWtz91VRB4GkMS+u09SKW637Y3j6/W/ojjdrp
         nlNM3Pxm5tTEBvk1WJikc8efceLAAPfCvHVDVJC/WurOVuIAIWiwuBZe8vuEfUmrcOdu
         HlbFSwgs3bista8JWAK1N0knWxiXg+CygwY4dZPxRsGmOrlqZDovYPZb3BathKwGTl/a
         Fg0W4tCLB4nHDxtvuyqLMh8vIa9bJAdo5mWwBAblMqg4o/RMXqCYo3XCKy5BUIzL2Knz
         zs/i2yAEWPPONWH8/v7Y4Idd0JMkvO+OhGhdFwiqF0EV4VNI699BJi2xrdn6x2uZjB6p
         m40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261402; x=1738866202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CkHxBykkh+MkSMFpl2gMe093xK0SZ26idFhO7kRCAU=;
        b=BsqBpmAhQmgtiqc5TBvQtRvbKuzYXa+qze0/WIGuIxoWHsrgYjjfZ4nZkLc5nbanCC
         Zw8laegbqLyuHJadMc/N19ntHVsHJcSSFV6eyMxxLeMNvw40TnUH3LYCTK8kTY09EAxt
         LdxRZ0WPe1/+bFdMrOHt+z6p2tpMztB6LQpvfeYqx9J7BYtc8FgWP8dQSZQnjZGxyNmO
         lgK+gIB7oGMZd9tb8xm0YwOmEVtJQUio65pgimG5cmkGRogYVW48XXF8Xdh9Hjlg9YLs
         2KdDAwqQkCEVjCW4PVQhoGHTH1y9TVWNviugz/w2pCTspTZLxgs+mdqzh8Y6ZIwMZrhD
         W7Vw==
X-Gm-Message-State: AOJu0YwHOVelayAaKeLNaFkKF9w/Q7bmVMgvRv28b2y//sJz3SN/VB35
	C1YwZSOykCcQ/LGViphpqCwBUF6rBOPTfRKh/i8y0jenB0KaSPY4ur11E6mQSZfMyB9x9g2B03x
	zWmg=
X-Gm-Gg: ASbGncs3ZOGAcfdXMJyrgngECFfyNbVQUPzif5JLT+0DTtBEZXo+bHZad6CEm/TUtAc
	V30UCXeR7XZpsreJd/qcQKUUrWX2LZSCKGjQnhmQIbq1VK08UrPyqntdv25iKFRnKain4IZR+HZ
	ZKPnQ+AEKxrziKOA80gwBxHzmyHe58DC6srbNbaQz4HinV8y/3VnDIioz3hLW+DYlA4JMeutJa7
	8XkYNMrhLQ9A1A7wQddrhc1osiZEiDYzB6Goapf2HS9dXH5VAIJB9vvvKlaXNUYtzC+qBzZQJPQ
	ASsu+L5mLTmZ26iJHuR1tA==
X-Google-Smtp-Source: AGHT+IEJ2ODNjHam3bz1ESlW1/hTzD8Wq66vV2VuMFkU5yxxcDllToWcDqGGfaoFfFhi5PcQTZHSpg==
X-Received: by 2002:a05:600c:3155:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-438dc3ae116mr78395615e9.8.1738261401931;
        Thu, 30 Jan 2025 10:23:21 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 10/14] target/arm: Use CP_ACCESS_TRAP_EL1 for traps that are always to EL1
Date: Thu, 30 Jan 2025 18:23:05 +0000
Message-Id: <20250130182309.717346-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: M2Tkr3KxZz6Q

We currently use CP_ACCESS_TRAP in a number of access functions where
we know we're currently at EL0; in this case the "usual target EL"
is EL1, so CP_ACCESS_TRAP and CP_ACCESS_TRAP_EL1 behave the same.
Use CP_ACCESS_TRAP_EL1 to more closely match the pseudocode for
this sort of check.

Note that in the case of the access functions foc cacheop to
PoC or PoU, the code was correct but the comment was wrong:
SCTLR_EL1.UCI traps for DC CVAC, DC CIVAC, DC CVAP, DC CVADP,
DC CVAU and IC IVAU should be system access traps, not UNDEFs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c |  2 +-
 target/arm/helper.c       | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c3c1eb5f628..36bffde74e9 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -875,7 +875,7 @@ static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
                                           (env->cp15.mdcr_el3 & MDCR_TDCC);
 
     if (el < 1 && mdscr_el1_tdcc) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_EL1;
     }
     if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
         return CP_ACCESS_TRAP_EL2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 058a5af3aaf..d1e26ec9d06 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -881,7 +881,7 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
     if (el == 0 && !(env->cp15.c9_pmuserenr & 1)) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_EL1;
     }
     if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
@@ -2159,7 +2159,7 @@ static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
     if (arm_current_el(env) == 0 && (env->teecr & 1)) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_EL1;
     }
     return teecr_access(env, ri, isread);
 }
@@ -2239,7 +2239,7 @@ static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
             cntkctl = env->cp15.c14_cntkctl;
         }
         if (!extract32(cntkctl, 0, 2)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
         break;
     case 1:
@@ -2278,7 +2278,7 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
 
         /* CNT[PV]CT: not visible from PL0 if EL0[PV]CTEN is zero */
         if (!extract32(env->cp15.c14_cntkctl, timeridx, 1)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
         /* fall through */
     case 1:
@@ -2319,7 +2319,7 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
          * EL0 if EL0[PV]TEN is zero.
          */
         if (!extract32(env->cp15.c14_cntkctl, 9 - timeridx, 1)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
         /* fall through */
 
@@ -4499,7 +4499,7 @@ static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
     if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UMA)) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_EL1;
     }
     return CP_ACCESS_OK;
 }
@@ -4589,9 +4589,9 @@ static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
     /* Cache invalidate/clean to Point of Coherency or Persistence...  */
     switch (arm_current_el(env)) {
     case 0:
-        /* ... EL0 must UNDEF unless SCTLR_EL1.UCI is set.  */
+        /* ... EL0 must trap to EL1 unless SCTLR_EL1.UCI is set.  */
         if (!(arm_sctlr(env, 0) & SCTLR_UCI)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
         /* fall through */
     case 1:
@@ -4609,9 +4609,9 @@ static CPAccessResult do_cacheop_pou_access(CPUARMState *env, uint64_t hcrflags)
     /* Cache invalidate/clean to Point of Unification... */
     switch (arm_current_el(env)) {
     case 0:
-        /* ... EL0 must UNDEF unless SCTLR_EL1.UCI is set.  */
+        /* ... EL0 must trap to EL1 unless SCTLR_EL1.UCI is set.  */
         if (!(arm_sctlr(env, 0) & SCTLR_UCI)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
         /* fall through */
     case 1:
@@ -4651,7 +4651,7 @@ static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                 }
             } else {
                 if (!(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
-                    return CP_ACCESS_TRAP;
+                    return CP_ACCESS_TRAP_EL1;
                 }
                 if (hcr & HCR_TDZ) {
                     return CP_ACCESS_TRAP_EL2;
@@ -6073,7 +6073,7 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
                 }
             } else {
                 if (!(env->cp15.sctlr_el[1] & SCTLR_UCT)) {
-                    return CP_ACCESS_TRAP;
+                    return CP_ACCESS_TRAP_EL1;
                 }
                 if (hcr & HCR_TID2) {
                     return CP_ACCESS_TRAP_EL2;
@@ -6372,7 +6372,7 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     if (el == 0) {
         uint64_t sctlr = arm_sctlr(env, el);
         if (!(sctlr & SCTLR_EnTP2)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
     }
     /* TODO: FEAT_FGT */
@@ -7172,7 +7172,7 @@ static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
             if (hcr & HCR_TGE) {
                 return CP_ACCESS_TRAP_EL2;
             }
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
     } else if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
         return CP_ACCESS_TRAP_EL2;
@@ -7292,7 +7292,7 @@ static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
     if (el == 0) {
         uint64_t sctlr = arm_sctlr(env, el);
         if (!(sctlr & SCTLR_EnRCTX)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_EL1;
         }
     } else if (el == 1) {
         uint64_t hcr = arm_hcr_el2_eff(env);
-- 
2.34.1
