Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2436331lft;
        Sun, 3 Jul 2022 01:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJjDOYvK+VlIAaNdrVPC9gW0Z57WLZJ6RC8spQNMSCVJkd6VBgIJMcqxUnTds498QacwmO
X-Received: by 2002:a25:850b:0:b0:66c:d287:625a with SMTP id w11-20020a25850b000000b0066cd287625amr24491126ybk.31.1656837236309;
        Sun, 03 Jul 2022 01:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837236; cv=none;
        d=google.com; s=arc-20160816;
        b=kiQKwS2WJqx6Zp4Tid2nS4yEu6JB7/gs2w/0WqMf+y3Sz6ZLvY7lHQAq1srXUru1Dy
         Cx967MG0SGbB5b+xbVcFqLOV9oWrthrUz9c5ljcpXSaAIZkOVUGAomw3Fjr6TnlVbWo8
         Fg2RugfjiFohkInXNh3j8lzPAxEBiRqURk5j7s8Kq4T8JX6NKA5RrmtE9Rda0+i5o7/M
         dyfyuD/uYLpnol2iK4Cchpl83Mf4cXdqIpE/pP66RYq2MjtJCxnBCAwguhcCXF6njF4T
         KGVeaFB9OazCd26cGj5fOqadhD81piM4IirjqF3F1gWIPcZn3ZWwF0hxeq2DulgeFoYs
         Kr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6KbpdzE3nKTc1cc74Wpw4Q3gP7yLnp7bGPdrHmKMb7w=;
        b=NshormgW9hJfylGth5+QzBBdhAm5BEgOU8DNUbEM7foWb6/R0qEn7EQLkO4bmUmJZY
         6c01u33EigpexzwEmAhaRztEOywypkqkCNR80MPUnYSEM8rvCevGIR/v4eU3jI3PlGaZ
         /IZIMdPoCVCwz7OOud9GxMFvHJF0UB8N1k8FRXfxjNFIx8oAz/tPeNbyDHCx5/9RGi2q
         GMdCkj15tEcU+Rq4AakE935C8b9EEOH19XS44PivMjQFFRiGJ6L8AVyoiPvgzyH/3bVR
         TDFOEjtBEAwdOwyxWFaeoLn8lZ09E92hAMM4FUpUk15uzhWPEKe6Mk/z7wrqu+Tr5S/z
         yEgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eui8nRM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u66-20020a817945000000b0031c9183bc16si623335ywc.501.2022.07.03.01.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eui8nRM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v3D-0005rC-MM
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uul-0007Pt-Ca
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuj-0005p0-0h
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id n12so6403696pfq.0
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KbpdzE3nKTc1cc74Wpw4Q3gP7yLnp7bGPdrHmKMb7w=;
 b=Eui8nRM13or8jkwApwHK0qE+NRBVEbV7DP4XsAeCFSFsQforfewttezRTK1jbS+Wkc
 9eUdxld5EECvarwStryciV8VayvYQIXDFmOVKAE0zblYgDTgONfe3NgoXSSfIO3vvBVu
 wTMv7G+J8LcVqRqD1OyIxwc1zHT0mXNdBdCI3W09blSjp4uSb/gcc1HlXpoMt7T2oMXH
 VeHEwu1WVLoNqJCwml2L7sp4ISnQPFKOJozHfcITynbcUvUjVmVsJj9GRoUHt5g6nNDc
 aTkgX0sCifdJthL7FriNr5VJUf0uxCSH6qyscqtw0eqGNQivEVsd0PBBzu2nwOk2Ykpg
 c7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KbpdzE3nKTc1cc74Wpw4Q3gP7yLnp7bGPdrHmKMb7w=;
 b=mjhUXlTv6FfNNjYiENxXKmKc1+HKUB8SicynOXf59wqo/itRZBXb8Ui80fRWxLnLyw
 dep4Gdxx88s7XcVjyQfkJFNtiuJg4gjgn/zbBe5YrVv5NBvJovPJYChIu9CwcvE95TDS
 PaWqls7U7wVi/5VRzCORSZ+88un3tVLTf8K25TTY3MrkRq3Wdzb0HowZH95uzseCJ14l
 MtnXxvbAa4tVtQl8Nwso3484I11YtYMDdBRxpdDPO5/eqp8RL+La4TRlQ6MHMfHS1PFL
 w5h95v1qnGkIwS253YZ3Yv5DHKOIy04bARLsVEHGIMam34+RDKc81xJ/jUc2Hq3PcdQ/
 qu5A==
X-Gm-Message-State: AJIora9dNnzfxJCNYrR+pMWJ487lrxbbspy0SBO1rUahVl6HTmmaOC0s
 /ovWx3LwnMQhhxJrp8cw8dXdwQ==
X-Received: by 2002:a63:87c8:0:b0:411:69bd:60f6 with SMTP id
 i191-20020a6387c8000000b0041169bd60f6mr19461504pge.524.1656836708275; 
 Sun, 03 Jul 2022 01:25:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav7
Date: Sun,  3 Jul 2022 13:53:31 +0530
Message-Id: <20220703082419.770989-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnCC7IIVliZk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f2e429574d..4b69ecb1b9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1509,17 +1509,16 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
-                                 target_ulong *page_size,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
     bool is_user = regime_is_user(env, mmu_idx);
 
-    *phys_ptr = address;
-    *page_size = TARGET_PAGE_SIZE;
-    *prot = 0;
+    result->phys = address;
+    result->page_size = TARGET_PAGE_SIZE;
+    result->prot = 0;
 
     if (regime_translation_disabled(env, mmu_idx) ||
         m_is_ppb_region(env, address)) {
@@ -1531,7 +1530,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
          * which always does a direct read using address_space_ldl(), rather
          * than going via this function, so we don't need to check that here.
          */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else { /* MPU enabled */
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
@@ -1573,7 +1572,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 if (ranges_overlap(base, rmask,
                                    address & TARGET_PAGE_MASK,
                                    TARGET_PAGE_SIZE)) {
-                    *page_size = 1;
+                    result->page_size = 1;
                 }
                 continue;
             }
@@ -1611,7 +1610,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 continue;
             }
             if (rsize < TARGET_PAGE_BITS) {
-                *page_size = 1 << rsize;
+                result->page_size = 1 << rsize;
             }
             break;
         }
@@ -1622,7 +1621,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_Background;
                 return true;
             }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+            get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
             uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
@@ -1639,16 +1638,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 5:
                     break; /* no access */
                 case 3:
-                    *prot |= PAGE_WRITE;
+                    result->prot |= PAGE_WRITE;
                     /* fall through */
                 case 2:
                 case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
+                    result->prot |= PAGE_READ | PAGE_EXEC;
                     break;
                 case 7:
                     /* for v7M, same as 6; for R profile a reserved value */
                     if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
+                        result->prot |= PAGE_READ | PAGE_EXEC;
                         break;
                     }
                     /* fall through */
@@ -1664,16 +1663,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 1:
                 case 2:
                 case 3:
-                    *prot |= PAGE_WRITE;
+                    result->prot |= PAGE_WRITE;
                     /* fall through */
                 case 5:
                 case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
+                    result->prot |= PAGE_READ | PAGE_EXEC;
                     break;
                 case 7:
                     /* for v7M, same as 6; for R profile a reserved value */
                     if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
+                        result->prot |= PAGE_READ | PAGE_EXEC;
                         break;
                     }
                     /* fall through */
@@ -1686,14 +1685,14 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
             /* execute never */
             if (xn) {
-                *prot &= ~PAGE_EXEC;
+                result->prot &= ~PAGE_EXEC;
             }
         }
     }
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(*prot & (1 << access_type));
+    return !(result->prot & (1 << access_type));
 }
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
@@ -2416,8 +2415,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->prot,
-                                       &result->page_size, fi);
+                                       result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.34.1

