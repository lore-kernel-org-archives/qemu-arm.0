Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2437089lft;
        Sun, 3 Jul 2022 01:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tU7znpZ9t6YL0yZmGGMTwf5VplMlwZSuXpzoR/iOSMnE3N4JjrWoxXFQD35KjgXdGDLfDB
X-Received: by 2002:a81:6186:0:b0:318:67d1:6fcb with SMTP id v128-20020a816186000000b0031867d16fcbmr25962608ywb.110.1656837363923;
        Sun, 03 Jul 2022 01:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837363; cv=none;
        d=google.com; s=arc-20160816;
        b=absUpw/u1uYq4hw6s7rTQ9w2f6Ky8t2rmQmUsiNi8t+rlLGoZihVquP4j7Jf0yo3ih
         oR9h7nXKArOYOcnmTB2lUW0n+GXwNQCHeJPMC+nXAQZxXBztnLyhvlsDNORZObgOeDZZ
         hS9+uy83/Q/DHSslfrXnsXPl+ig4ko+0WJ9naasLOrUd4Pf+WNOfWLpjFEK4tu7ugsAV
         NZ7RSo67VpjgnADpMY/zW2aOSPX5Tt5rpmPlqX6/utmikxklh91l0o91U0odJJXf7YGJ
         8ZhHn622YPxidJ1TKScJ0l7a1RSlTNSvjJPb/3+1QdqAz/aslhjesZNS3Rn05qeN7IzM
         JlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k+mjMX0KtyF64EiiGnY2kjZkHIBqsqSc4+dYDHj5ESs=;
        b=vhnwIWMgOtiNMWCUAcTzRSfA8/5PpnGqZgwP+19c7VbhjcTIz6M1lNLT+IYlBgeE4B
         SLotfLS7gccN2J3cYlgLvhS2pVY9GeAv0Bd/IpXTeMd1rZMt+Vfryl0Kg5j8yCpp2VRR
         UZE8qHNTGfe5iSHQs2lqLOBSJhZ5eZddU3yGO+QzSAG/oxu9iCV6h08USNeUPWTSpGxn
         ykTm4L4cnqXthiaBWo4Ouv1kJCTePzBjPoAWgGwpu3+S1xolFHe3PZ/0jRcdx2UKfDo1
         pDTS1tXznrCubDxU6YUqxEU9niNsAw+4q4K+o6PNdonIbXd54XeAIPQi8fH47Uf1/MqH
         nCpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yfY9z+kW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b96-20020a25a269000000b0066cc109fa14si28238012ybi.453.2022.07.03.01.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yfY9z+kW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v5H-000180-7B
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uur-0007Sc-OI
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:18 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uup-0005xV-6y
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:16 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m2so6033835plx.3
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+mjMX0KtyF64EiiGnY2kjZkHIBqsqSc4+dYDHj5ESs=;
 b=yfY9z+kWrY1HMT6fTJ91d/Gb7IgJD4BlktsWI3ICjzWgFcLmTeuVfaMa7HnY9ppTN4
 yCj8QMB2wZ4Piuc+7N8WmKceqpRIuf3wm/8DTbR/tr5JlA4PXmd3R0/FTBTlk99HnuBk
 WM+ilBqoQQj7kClF+NlhRizECYGLpyH+FQ5KgIfNJCIqjwb8/HEpe93jfQ2mSkLbx5l6
 SWBuIxSGMLZGCeZQJZx/Ln7Hs8K3kk4b8E+TzKETsIiq1nYzhwmiPd4/fX42KNFlgBuq
 yk4pd1Urbvftc5ZAcKbv1GVDlHhpdXHpBHmw4RpC1cjXyZZbdxZ62hibIK3VtVF4AZQW
 P+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+mjMX0KtyF64EiiGnY2kjZkHIBqsqSc4+dYDHj5ESs=;
 b=DKRlB804l5nMrQdu/N2Gp46njZ0Cxtl6asy9TnVbO+EbpqKSFcBfZ2onMQ3qghWEDx
 w9nSYmSc9UY514zwVd/PfPP2xV6vPr5BvajBlBsAk4enzn2qhbgJT7V4AawwBnLaZbum
 oBXvWCL0r2IBME9xPJsXqP8yt/L5HXrMTPivqiDpjtlvTu2PfcZmp/NXDGaO1KHwOk/V
 3m29XEdW6j5qNp+K+kh5uW0JE2yVoymWIWArrwXDYOHRCwYVIALS2ADUdmKBPEnzQSw6
 YYjuDxVArYDIQ/F+2BY7M4BUYPo0QppVxsuo7A89y3Dnwx+hhH1TyvbwTrpLAlealztx
 GnIw==
X-Gm-Message-State: AJIora9n+jl6jZ8YDdqiD1S9QxBcDDQZwC7Zq2HI2zGxXssCix6TTesa
 9r6nRRb8BZP4M3wY/o3kK22O+g==
X-Received: by 2002:a17:902:ecca:b0:16a:53a0:75 with SMTP id
 a10-20020a170902ecca00b0016a53a00075mr29284865plh.43.1656836713972; 
 Sun, 03 Jul 2022 01:25:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/62] target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
Date: Sun,  3 Jul 2022 13:53:33 +0530
Message-Id: <20220703082419.770989-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TytpOE3ka4QZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 11 +++++------
 target/arm/m_helper.c  | 16 +++++++---------
 target/arm/ptw.c       | 20 +++++++++-----------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7d08917f88..a817acaaf4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1115,12 +1115,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                          V8M_SAttributes *sattrs);
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
-
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
     /*
@@ -1147,6 +1141,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       GetPhysAddrResult *result, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+
 void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 84c6796b8d..69d4a63fa6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2770,15 +2770,10 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     V8M_SAttributes sattrs = {};
     uint32_t tt_resp;
     bool r, rw, nsr, nsrw, mrvalid;
-    int prot;
-    ARMMMUFaultInfo fi = {};
-    MemTxAttrs attrs = {};
-    hwaddr phys_addr;
     ARMMMUIdx mmu_idx;
     uint32_t mregion;
     bool targetpriv;
     bool targetsec = env->v7m.secure;
-    bool is_subpage;
 
     /*
      * Work out what the security state and privilege level we're
@@ -2809,18 +2804,21 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
+        GetPhysAddrResult res = {};
+        ARMMMUFaultInfo fi = {};
+        bool is_subpage;
+
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &phys_addr, &attrs, &prot, &is_subpage,
-                          &fi, &mregion);
+                          &res, &is_subpage, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
         } else {
             mrvalid = true;
         }
-        r = prot & PAGE_READ;
-        rw = prot & PAGE_WRITE;
+        r = res.prot & PAGE_READ;
+        rw = res.prot & PAGE_WRITE;
     } else {
         r = false;
         rw = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ef28258d51..b012577f17 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1697,8 +1697,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
+                       GetPhysAddrResult *result, bool *is_subpage,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
@@ -1720,8 +1719,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
     *is_subpage = false;
-    *phys_ptr = address;
-    *prot = 0;
+    result->phys = address;
+    result->prot = 0;
     if (mregion) {
         *mregion = -1;
     }
@@ -1803,7 +1802,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
@@ -1818,9 +1817,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn && !(pxn && !is_user)) {
-            *prot |= PAGE_EXEC;
+        result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (result->prot && !xn && !(pxn && !is_user)) {
+            result->prot |= PAGE_EXEC;
         }
         /*
          * We don't need to look the attribute up in the MAIR0/MAIR1
@@ -1833,7 +1832,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(*prot & (1 << access_type));
+    return !(result->prot & (1 << access_type));
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2032,8 +2031,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
-                            &result->phys, &result->attrs, &result->prot,
-                            &mpu_is_subpage, fi, NULL);
+                            result, &mpu_is_subpage, fi, NULL);
     result->page_size =
         sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
-- 
2.34.1

