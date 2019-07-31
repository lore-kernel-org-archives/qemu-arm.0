Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071311wrv;
        Wed, 31 Jul 2019 13:38:32 -0700 (PDT)
X-Received: by 2002:a65:60d3:: with SMTP id r19mr90581519pgv.91.1564605512171;
        Wed, 31 Jul 2019 13:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605512; cv=none;
        d=google.com; s=arc-20160816;
        b=fz9VYf+863DNEVxsXsVMuhskQ5ZTVtF+DqWCTR0AGcAxi3Hkd/bDip5GCdXsSLzZLk
         jCb35fD5MmY8hGEG4OtPpd6G8VArVrajkNDwx/hJBq/2tNT9IV0vgdeKGMTmoHxKerUE
         Co/Zj9aIJhqJL8gbTKYM9Eij9JEOl4WpqWzrMBMw77/Gha6deGQnrpR8DhywbzKpb0sr
         biArwD3oxaabrGt28vcZWf75pbw+e1avbIBc0dwcGehVXXz5NM8x/A0l1WqeXuTURUkl
         HcYMGEsDHdkHgZUWRdRFGqzpo+e+PoPDgjtGeFju1k+V+DdhEJnZDuZivMBZgkNftFII
         PRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h3dhwpfe86udFJHT5d1QRrLfJzUV39xxz0iIkIlTtJQ=;
        b=THf2Ih+gT5kWwQQ2vI4fr7OhWHMx4bxe/OGWbvNYAZKBej9FWVvJD8MXum7pL6lwo9
         IjIlPA+xWUhwzvCVfjUqfcZpO+gvATJ+z0TW25JBOQ/TTYhVYZX7ryWxM9LO+OOBcYe3
         YRlG2bVfY8j0Y1Ut1ul1H5wXdgVHOMj9smtueyDO943I4zd3x+dvemvVZTAr90zDEsTU
         OBqaZUlijwWqEPDfC1pknUg4NUNCtpCXf5GW5Xb0BXL1iYM1pUCjuhG36S1CCtc9H0Xu
         0vyOJHWBLSQJLGfXgKxySfTy2ZyOeE+O+/wtUcwMxPN3KpngZMNF9UX1dRgLdoKHHkdW
         JFgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fEfOWxba;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f16sor45617715pgn.77.2019.07.31.13.38.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fEfOWxba;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h3dhwpfe86udFJHT5d1QRrLfJzUV39xxz0iIkIlTtJQ=;
        b=fEfOWxba8dUcw1YB9PkYIF7f0IZt3Jot9DSidbxSvrttwik89jhDybvAmE8VjvntkR
         mDhvbPtx9iN+Z9x0RjobWti4c2cp2cY8mDuDtAqKQ4WtW3WwgeUXoJYyL95HToYcRHrM
         Xsq6CJqvcgL+jwB0/QbDoMWfP85NCylb65BUO2s8jFH0TwOMeL0uv0ehHKDdjmjmkL9p
         ze0FDx8VuCQYQR0/twXL9eSoBsBgOWaRBgek75lmMDXYGekadt8wj0iKMPHEkJOnq5uq
         ecKpamJKT5bbCXFt1APD3TF4suID1yEE2tlK8d/YvA2ZNBLEFaYkifOJviGN09SzEvV6
         IA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3dhwpfe86udFJHT5d1QRrLfJzUV39xxz0iIkIlTtJQ=;
        b=Y0V1+COTQAG8hyacqhy6uvyjhemori1w4QWj8Jsdnmg0sipqdDXlH1WhMGTVy3wklJ
         Socq3ejPuC82tH0NUDo7pVg1cQhOn8BwqDThwBbQkw6s1CpomQWnFBCgo7rcg1Vn3Kix
         42Hj8MDAB1Qb6TTGJDsY7TslZ5cweRiiUjnXfWKlVWFuClvvoUAtllogwG27WPqmjC3G
         YQ8/5+aHLPAJ0hiVnTpf1pDMheCKcp7iix+2QaRTTTpYh+1IP2iirgjcFdiyH5aOBPF2
         O4MGqP7pBik9wcILH5YJiN+Y1ZvS12ORTlD9RtMrWpqm8gJ9dufeaZ2XgNQ/Svac+hFs
         K2ZQ==
X-Gm-Message-State: APjAAAVcH36wjijONDzFOBhd3cdQbVHIc3/qZKZmzg9QtnxvPoR0jE0G
	TRQk03wOJTuQyhSwtKAWOCo3ZZv3
X-Google-Smtp-Source: APXvYqzxWA7PoiKIGMQfA5MX/czSvkN8aHlzxQZ51Aq22HOdgfpUq2gXlCELt+djs6Adnmv1yOCUJw==
X-Received: by 2002:a63:550d:: with SMTP id j13mr52857180pgb.173.1564605511637;
        Wed, 31 Jul 2019 13:38:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 13/32] target/arm: Split out vae1_tlbmask, vmalle1_tlbmask
Date: Wed, 31 Jul 2019 13:37:54 -0700
Message-Id: <20190731203813.30765-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5fB0ZbnWJlsx

No functional change, but unify code sequences.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 118 ++++++++++++++------------------------------
 1 file changed, 37 insertions(+), 81 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e9f4cae5e8..7ecaacb276 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3898,70 +3898,61 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
  * Page D4-1736 (DDI0487A.b)
  */
 
+static int vae1_tlbmask(CPUARMState *env)
+{
+    if (arm_is_secure_below_el3(env)) {
+        return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+    } else {
+        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+    }
+}
+
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
     CPUState *cs = env_cpu(env);
-    bool sec = arm_is_secure_below_el3(env);
+    int mask = vae1_tlbmask(env);
 
-    if (sec) {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S1SE1 |
-                                            ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S12NSE1 |
-                                            ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
 }
 
 static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
     CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
 
     if (tlb_force_broadcast(env)) {
         tlbi_aa64_vmalle1is_write(env, NULL, value);
         return;
     }
 
+    tlb_flush_by_mmuidx(cs, mask);
+}
+
+static int vmalle1_tlbmask(CPUARMState *env)
+{
+    /*
+     * Note that the 'ALL' scope must invalidate both stage 1 and
+     * stage 2 translations, whereas most other scopes only invalidate
+     * stage 1 translations.
+     */
     if (arm_is_secure_below_el3(env)) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S1SE1 |
-                            ARMMMUIdxBit_S1SE0);
+        return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+    } else if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0 | ARMMMUIdxBit_S2NS;
     } else {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S12NSE1 |
-                            ARMMMUIdxBit_S12NSE0);
+        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
     }
 }
 
 static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    /* Note that the 'ALL' scope must invalidate both stage 1 and
-     * stage 2 translations, whereas most other scopes only invalidate
-     * stage 1 translations.
-     */
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int mask = vmalle1_tlbmask(env);
 
-    if (arm_is_secure_below_el3(env)) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S1SE1 |
-                            ARMMMUIdxBit_S1SE0);
-    } else {
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            tlb_flush_by_mmuidx(cs,
-                                ARMMMUIdxBit_S12NSE1 |
-                                ARMMMUIdxBit_S12NSE0 |
-                                ARMMMUIdxBit_S2NS);
-        } else {
-            tlb_flush_by_mmuidx(cs,
-                                ARMMMUIdxBit_S12NSE1 |
-                                ARMMMUIdxBit_S12NSE0);
-        }
-    }
+    tlb_flush_by_mmuidx(cs, mask);
 }
 
 static void tlbi_aa64_alle2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3985,28 +3976,10 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
-    /* Note that the 'ALL' scope must invalidate both stage 1 and
-     * stage 2 translations, whereas most other scopes only invalidate
-     * stage 1 translations.
-     */
     CPUState *cs = env_cpu(env);
-    bool sec = arm_is_secure_below_el3(env);
-    bool has_el2 = arm_feature(env, ARM_FEATURE_EL2);
+    int mask = vmalle1_tlbmask(env);
 
-    if (sec) {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S1SE1 |
-                                            ARMMMUIdxBit_S1SE0);
-    } else if (has_el2) {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S12NSE1 |
-                                            ARMMMUIdxBit_S12NSE0 |
-                                            ARMMMUIdxBit_S2NS);
-    } else {
-          tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                              ARMMMUIdxBit_S12NSE1 |
-                                              ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
 }
 
 static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4056,20 +4029,11 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
-    bool sec = arm_is_secure_below_el3(env);
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    if (sec) {
-        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                 ARMMMUIdxBit_S1SE1 |
-                                                 ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                 ARMMMUIdxBit_S12NSE1 |
-                                                 ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4080,8 +4044,8 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * since we don't support flush-for-specific-ASID-only or
      * flush-last-level-only.
      */
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     if (tlb_force_broadcast(env)) {
@@ -4089,15 +4053,7 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (arm_is_secure_below_el3(env)) {
-        tlb_flush_page_by_mmuidx(cs, pageaddr,
-                                 ARMMMUIdxBit_S1SE1 |
-                                 ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_page_by_mmuidx(cs, pageaddr,
-                                 ARMMMUIdxBit_S12NSE1 |
-                                 ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1
