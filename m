Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2445128lft;
        Sun, 3 Jul 2022 01:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHRZkp+JMtSB2bvaZ0aDBjmbUROW+yXvMR9CAtSRH9d+s9cqgEFAYqUHMtGkfxumwYTB43
X-Received: by 2002:a81:2f45:0:b0:317:71c7:fcdc with SMTP id v66-20020a812f45000000b0031771c7fcdcmr27279829ywv.73.1656838760378;
        Sun, 03 Jul 2022 01:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838760; cv=none;
        d=google.com; s=arc-20160816;
        b=gpZmToUI8es7eoLOOB0dxl8le3gLffoeVyY/UqkazcDIKzDS5jv2aTL+q+l9CLXcUA
         Ad4574/+0+lmyaCB4r1T/XLl1nGz5a3UuCWR6aIkq8sadT0SxmnTWDfvf9YjkiCVowDa
         DdRbt0h1AawXhWfrkvlypaUW06WolNqF3o7BtxEk4nrHwnUd5bMTjeG9QzphpOkUrE9D
         c75ozP7A4b1qBAvW8wxAu5Lz1foeVG2P9BOAp+nsFpOn1lmnhKU+JDM7l5xmFKsaZlwR
         uGRWCss4DEHqIB+EQs4VHTgshIcc5A5/CXfdbPAuzxtZXbSWGzk4FKwVBja7HOLGm5vE
         Uz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GsT5Xk5dtAY2Icbs3BWGWOCPzyUxhkaonhY2kebrD0o=;
        b=Ozk4HQxqxJoXwz1FvVWc2ANr4cu/4V7+hB2JNHpQlws1jRBXSAsSghZ73H96euqaJ2
         tmFT6iZI6VlmfoR+aVwVN/7H7iLibx7KAPDqiZZdKu1q2/D2U/ibqkKcPgQdCxxjrlRB
         egQ90Y8qE60fGJsgCxRd6PKaKkVMVBQurkPMqT+DvkdiTLRA7yDG7GzucS8wEfiqAXAC
         AXCyMtlHgw/wyH8PdHKn70gHn3t8w82ZwsNKqAKAnHXSumrn8ygtjwmihEgpgJnTSoNw
         aLegtwYZmDIdtVALmrZOhEZx+ytxW2P4vJpttYY7ACYkdykhLM4y9sqAuQGoz2f1UPZ5
         XIhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHE7ehj+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a252d4c000000b0066e34ce5222si1700974ybe.540.2022.07.03.01.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHE7ehj+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vRn-0001xr-NO
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvc-0000kA-Qg
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:04 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvb-0006AU-5Q
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:04 -0400
Received: by mail-pl1-x62c.google.com with SMTP id z1so234262plb.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsT5Xk5dtAY2Icbs3BWGWOCPzyUxhkaonhY2kebrD0o=;
 b=UHE7ehj+0dTIwM/tuj9+HlutBMnrpRHOqU3xH5alJU1PMKoKm4XI5mZEzt9jVf8sNs
 o9V1PsqjdbZw2WZpAJXtWwERapPYqxASXn9tqhapwxLJSMuYdTvfLLlr2o9/1WCXI1DP
 NEL7EG+W9u2b6WE7pav0FRwTxzKhUU52Ut9vnBuARxOV4k2fO13rvQlBRA0NuLrr2BGU
 g8xCTiAhe3s+BMSF6qrxhEeikLsLNKNLft/Y2i28bqNhkQkSPBkeVDMLF/hCByMu7lUJ
 fvbczoaF4+/XunwMPPh8vd1OIuJlL5Un3kIocdM2RXQKZAJ40hq+yxfPR6CAdFE/JYhZ
 6IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsT5Xk5dtAY2Icbs3BWGWOCPzyUxhkaonhY2kebrD0o=;
 b=WOvQ2KqIHY1pGFDTq8JErNdsXUbwXIRysSAjZd6T7M0JHl3tB2sa08H7ZHDh5QaIzi
 QgDRghf9ZzmGNGDjkQakWmhLtqQ9pKhJ9wu8LwH8DKQ/VOrySZ/xy+7saUGGk9lA7vut
 vUn09KGkZzcgjAY4AIyOKGeHD4RPIbJHZ16qh8I5T74WedRHCJ+ugTCf/fWY5HEKtN9l
 9bnEwWEuoYo+9nF6yKNp8WUL7cSU7DiWcBtHTGwfzvzEU3cHm6tbRFtLq6UWJNEwkt64
 Ee7y3CyHQu4/fXlguuIy7IX5kJhv3xOjmfvGMCjfX5EEmaQXV7sIelm/AT/DiGXqX8Zc
 b9Sw==
X-Gm-Message-State: AJIora8cPtzMFWeFX3WY7ElUPM+mhT0KP1Q3ALpBx1Ou+x/aDQOVWpIC
 pwpMH+LuPDmdtNvsjIrUwUvsiLNPlk0sIGfF
X-Received: by 2002:a17:90a:e98d:b0:1ef:7863:b7d2 with SMTP id
 v13-20020a17090ae98d00b001ef7863b7d2mr6128930pjy.101.1656836762387; 
 Sun, 03 Jul 2022 01:26:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 32/62] target/arm: Add is_secure parameter to do_ats_write
Date: Sun,  3 Jul 2022 13:53:49 +0530
Message-Id: <20220703082419.770989-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IvfeLNfVixiZ

Use get_phys_addr_with_secure directly.  This is the one place
where the value of is_secure may not equal arm_is_secure(env).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0908c20215..e98fc75646 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3171,7 +3171,8 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #ifdef CONFIG_TCG
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             bool is_secure)
 {
     bool ret;
     uint64_t par64;
@@ -3179,7 +3180,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_secure(env, value, access_type, mmu_idx,
+                                    is_secure, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
@@ -3351,6 +3353,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3372,6 +3375,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE10_0;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3387,16 +3391,18 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     case 4:
         /* stage 1+2 NonSecure PL1: ATS12NSOPR, ATS12NSOPW */
         mmu_idx = ARMMMUIdx_E10_1;
+        secure = false;
         break;
     case 6:
         /* stage 1+2 NonSecure PL0: ATS12NSOUR, ATS12NSOUW */
         mmu_idx = ARMMMUIdx_E10_0;
+        secure = false;
         break;
     default:
         g_assert_not_reached();
     }
 
-    par64 = do_ats_write(env, value, access_type, mmu_idx);
+    par64 = do_ats_write(env, value, access_type, mmu_idx, secure);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3412,7 +3418,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2);
+    /* There is no SecureEL2 for AArch32. */
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2, false);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3455,6 +3462,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         default:
             g_assert_not_reached();
@@ -3473,7 +3481,8 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         g_assert_not_reached();
     }
 
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_type,
+                                       mmu_idx, secure);
 #else
     /* Handled by hardware accelerator. */
     g_assert_not_reached();
-- 
2.34.1

