Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979441ejc;
        Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:171:4f8d:22a7 with SMTP id l5-20020a170903120500b001714f8d22a7mr20800394plh.164.1661182068994;
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182068; cv=none;
        d=google.com; s=arc-20160816;
        b=OGIR5IjIC5DINGxbcXSWl3cB9s3ZybXEvZD09HvlU8dX117iAhnP+FGm/WxxzyNW2a
         NZLNBbRACtCLVqnJF5+rHiVSEqTe+BhxVXl5g7Oj/y4dqTafudKzXAyEU3dQ9JcCQGVl
         1NcQLfU1rlRobsDfadD9ueKsspLsv31Z11GZrER4FlJIuTjvVwYCKbjpO84YVQVTNejt
         xo+4c5XDrl8TPUs7zRiNyhTD5qCTOc+0b/1lzRTjuoQpqMZ3gvkDDbQFMgUeACSszs+8
         mWttwx0qSCk533CICBOK9uifBsIidz6Zg46S4MXO/13+y18zJ92HrKCVhzG/m+hHS6CO
         2WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hqvGmlmcNGpOKQjb7JM1JdOHnWL1WKCnMBq1zvwuxw0=;
        b=FeWIHjkZky460AcQDNj7S3T+l5wuXnwQmi7hU5MhF7ljybj7cMuD0CJRiQ/w8y4Wlh
         6/2XwoLKm4q5VvRGX5bYgFJk0X14GPAZlLR8W+GonOzHGf+qQzBKU+a5sU8vx+CJ/OnD
         l+f5G1X/IQJPysfuX3RC747OZvjJ54hGeDkLP4CDJgUL3OGkg41Vo/LBO6qf4iCkaJTe
         ZNdGHcPmJLiQ1KJt+IoNzTc316MELEiUt7+WaljNReBjhzIsAuQ9SvIXVXOL75K9JD9q
         I86dNXdOlUXLEh0Ho0NdCK5wXtHUin+HH12L3cX+IcBZedfNJ0QecunvIOTszi+aFzAq
         CoSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mJlAxr1v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v13-20020a62a50d000000b0052e6c058bdbsor4773929pfm.26.2022.08.22.08.27.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mJlAxr1v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hqvGmlmcNGpOKQjb7JM1JdOHnWL1WKCnMBq1zvwuxw0=;
        b=mJlAxr1vdNSA2Fgz1Gannvue66ZxuX7Fk7SXnbeZLMEytqXaAIKSPUCsYKGzc9agjF
         qOHQpV2rgB/wW02b5nzW7yCU6Z7zqx+uQzsKMm7IJrM0loN1MZP1yOoDJPFTt2RLzdvp
         l+WRaPEkPOITCunCvZBqx+EiFvx7Y6PIMo2GsPf81fkdYpx2pmHfYVEl4Vlb/iNwgiG4
         Qt+/zSP5qN3gyerGRu/5Uq20jXUiSgJcW3OCvTLnnDiE+JkWnspUsBrEPaoAM767mN3Q
         MCuVfw+oR9xbxSNDwsXeaDB7gnVhokRu6Na2p80s2eVnJl5a8aOKohlNn/MQMin/Gj5W
         av9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hqvGmlmcNGpOKQjb7JM1JdOHnWL1WKCnMBq1zvwuxw0=;
        b=QwjJ76qaYOvXdz28/AKSwNq0GKXsqKAHXzJ3DsEiS5YGrCKXv4syKcTghS4XPM2j80
         Y14xgXpgdKnPJfrHILDgmS4OKkqCshzy3/8mdJ3JMGSNP8cBK16Epugi0BmIoGbZBaSO
         snvsyRBaTUZR9rwBTBwK/+sGfR5efx87xl1BEEh9eLSen5I+rhbxSP9LKDIjt27L0lRJ
         fuS7O/SOGCQqPkEa20Pw/bVwoneJuxeG9gri/eDR+NE+t7GMq4W6LU1ZbyHnDDR5tCRQ
         x4t3hYAP8As8vxuhL5pBnxXjroCXHYadgS2WQmzzFZ2/9fTJXZwk7qtoP6gOQxy4bRH/
         HnyQ==
X-Gm-Message-State: ACgBeo20sbux2RS2eUI/NKTZ5DDOVxVMwcVB3vFyRRNkG2B18wf4EoBy
	vFOdhJ8zuNfPKlw03u7DBkbxSXJD
X-Google-Smtp-Source: AA6agR6mh6XC5KB5msSCRt6DZ2wyxWvmSqIahLE22zGumjJmHcJ0mN7L0q1UakbrQpJZ7dslsxv95w==
X-Received: by 2002:a62:188f:0:b0:536:ee23:e3ed with SMTP id 137-20020a62188f000000b00536ee23e3edmr366121pfy.33.1661182068505;
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 07/66] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
Date: Mon, 22 Aug 2022 08:26:42 -0700
Message-Id: <20220822152741.1617527-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xmz+5D2/5tkZ

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 15d152432f..3dd6708eee 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1513,17 +1513,16 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
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
@@ -1535,7 +1534,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
          * which always does a direct read using address_space_ldl(), rather
          * than going via this function, so we don't need to check that here.
          */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else { /* MPU enabled */
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
@@ -1577,7 +1576,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 if (ranges_overlap(base, rmask,
                                    address & TARGET_PAGE_MASK,
                                    TARGET_PAGE_SIZE)) {
-                    *page_size = 1;
+                    result->page_size = 1;
                 }
                 continue;
             }
@@ -1615,7 +1614,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 continue;
             }
             if (rsize < TARGET_PAGE_BITS) {
-                *page_size = 1 << rsize;
+                result->page_size = 1 << rsize;
             }
             break;
         }
@@ -1626,7 +1625,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_Background;
                 return true;
             }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+            get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
             uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
@@ -1643,16 +1642,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
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
@@ -1668,16 +1667,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
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
@@ -1690,14 +1689,14 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
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
@@ -2420,8 +2419,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
