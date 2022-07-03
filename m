Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2438681lft;
        Sun, 3 Jul 2022 01:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sIev+otHAQZhBberq2RMhNukpSFS+yZXfXMt4XPl0cqRY1MKuU2BerHBCELOR21Z2zqV8H
X-Received: by 2002:a25:9d89:0:b0:669:31d4:7cd9 with SMTP id v9-20020a259d89000000b0066931d47cd9mr25895790ybp.294.1656837607662;
        Sun, 03 Jul 2022 01:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837607; cv=none;
        d=google.com; s=arc-20160816;
        b=WSze1rlX/eSYpWPXk0itb1tSZJGkuwnuLVInPPmFFtRfJcufRw5MCAC40wa1Ykck0c
         58QNqsBv5rk8RuZhurf1aDtYioL0beGNjhOWLoXgalhSMC6dihG9GoqPrnDtiu5QWXgH
         /GNZrqVnfQOA6/JGlv1rMjTZcz9GZNSvfRJo8i9MvdDf0qiCtPheFm8DO3h32ll+ykzi
         ip2QHAv0ZLTiptpd7ggFVBL8NDAc9ALCQArVAQ8wcXW9N0tIamkFXNYB2URQq5y35cEB
         8ZqojmaPhDzymCvjbzKVAaITr5m2dbbw07QTHdKAMMK2i8lnNIlcq5s86V/W7CdrfsbO
         v+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dcZqPXo79BDZKicxDVav3BkTqxcrjPA4mDAfxWZ855o=;
        b=DvtTZYrwNBlYWv4BmbU61DHqaQ4nnEuDiGz8th90hzFkJagpETovTBo9a6zbPXVy7M
         7yyrs9XwmEPBGQWIsuWmK2ccgpQGCJPucu6ByjG+E9OWb5GP8AgsFs002mHdIqCIlO4l
         iNwjhimXzPHNm4u/uoDINMqckEwoSl0n6XnVIZ1TCqdsw4GCu9jyyWh5+Hq9+/eHBcwj
         AaLgmDQI2PiI99iIaQ8yZlYziySYudwJq0M5dj1CeNV7vfNuBeizj4Fo1uLEThPIpun8
         uNjx1JQSoZ3ACsTyBGxZlJ5SZu1tbt2THAlD5Z36TY2Og0UhIxXP2a+NGbCu4BD23Xnu
         xogg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGe+4qSE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e126-20020a253784000000b0066e2d2d7648si3829311yba.336.2022.07.03.01.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGe+4qSE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v9D-0008He-19
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuo-0007RX-0f
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:15 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uum-0005x6-B0
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:13 -0400
Received: by mail-pl1-x62a.google.com with SMTP id o18so6042291plg.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcZqPXo79BDZKicxDVav3BkTqxcrjPA4mDAfxWZ855o=;
 b=BGe+4qSE7i8Zbp3DI2ganWoIpSDNIuGN32FY74HGCSmvd6A1G5i+TpKCvrRqF2lfzl
 3tOAKqNb5vwcBF60GrQqXOKs+pFntxJ7+eV7Lcm5tNB35mpPNn27PDTo1mgMafmo1yw/
 O2EkCnoGKIsLwAUmYAOgVzIRSCFHN2SSaWYpb2/75iS+1dMxexJEfbOid7bxDgRgrWyh
 kPXbkbk2gynHoCJhb73N1kg6HZmUEZfaPeEz94LnB1ZoEmHXz1fxlVjqnIM0VLT/neH9
 YiYQABDoP/+t2nxh/oNvnHeAKk3rxPah6Hgwcsq9DNAkPikUFAYuXcd6dn+eLsCxDBSa
 SmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcZqPXo79BDZKicxDVav3BkTqxcrjPA4mDAfxWZ855o=;
 b=nE2GcW9eh5Mrv/a+iXEsvJZ1tQU5x8KRHHV/wY7mhMJ1xGk87s9qhZ7cgdCZN9AiRL
 lA/WwNotIoE1igeUmOJ3SVky3WFZpvQRBqMjflXWi6vLqUl0dAWxJD+JGfsvO3VhCRL9
 1ckXqDODXkf6bcNoQ/aIDJsaL/38M3HvUUFg+sJUlCfxvO5RTSE/v3lkyQjhsGv+TJvb
 DhKEVhMIkEP01gig7vQJnq/lvX1R90bDTSOq13ZqHzQoMcKwOhGZ/RKShLwP0EGEnvna
 e6sdhymUpW01+CKJU6WHmJgURj8GBBEMz/+4QLCOcW4BptoL9USxMqIY4/2JjevCiE0m
 6Sjg==
X-Gm-Message-State: AJIora+Tm8nGCJ7EAbkYxvv+/ZoxxYtKq9fnnrJhN2aSYefXjs3WnyNr
 5lurToLOeeHe7KEnKzsY6byDqCrIotXDZ7U2
X-Received: by 2002:a17:902:e541:b0:16b:8f8a:3363 with SMTP id
 n1-20020a170902e54100b0016b8f8a3363mr28575827plf.66.1656836711050; 
 Sun, 03 Jul 2022 01:25:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav8
Date: Sun,  3 Jul 2022 13:53:32 +0530
Message-Id: <20220703082419.770989-16-richard.henderson@linaro.org>
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
X-TUID: aD/YX+31FDTO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4b69ecb1b9..ef28258d51 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1963,8 +1963,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, target_ulong *page_size,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
@@ -1999,9 +1998,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                 } else {
                     fi->type = ARMFault_QEMU_SFault;
                 }
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         } else {
@@ -2011,7 +2010,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
-                txattrs->secure = false;
+                result->attrs.secure = false;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2024,17 +2023,19 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                  * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
                  */
                 fi->type = ARMFault_QEMU_SFault;
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
-    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+                            &result->phys, &result->attrs, &result->prot,
+                            &mpu_is_subpage, fi, NULL);
+    result->page_size =
+        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
 
@@ -2410,8 +2411,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->attrs,
-                                       &result->prot, &result->page_size, fi);
+                                       result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1

