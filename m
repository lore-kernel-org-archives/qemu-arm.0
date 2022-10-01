Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp474367ocs;
        Sat, 1 Oct 2022 10:03:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66D0ItKGl2K5gAMhlAVHxA8XJN/OUwQ5+Hb3MnxfSId1XzFJF0eYRz1jzyUYSYhTLpVuYF
X-Received: by 2002:a0c:b3db:0:b0:4ad:8dff:399b with SMTP id b27-20020a0cb3db000000b004ad8dff399bmr11010582qvf.4.1664643838085;
        Sat, 01 Oct 2022 10:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664643838; cv=none;
        d=google.com; s=arc-20160816;
        b=L7cz7yhqsJLsmTlh9NgWKEVow71nCRYA4BcocbKKoop1/l3cjDsfJw6MwfSq4tC+iQ
         eo3E92loBHGzbIxTGVQd8QVX/xXXWhsMKOLKR0+Lph6+p+zZTy2Qwh7uUCp69tBR57f4
         UvIywtoM0j6ItMEuFyIth6uuftXnWy4QmxmOKDH7YbIURWkdPD0ojKiIOp22acFNgvPL
         AzA7krF62/gQ2LjMD1iVjt0QjMDrjysE18OHRMuwOXL3e7L7wfiV7zGp0bktdcydEWsP
         aczTD+jgS4gx0aPhzuw/FyIqQTjv/YKKBYqQMbWqe3PW24yVFPPgGl4jsRDaKYLFy2/i
         eyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PIHa4426Hp/agSFdW8nii/mkTFfd47hTZ6myTQDFrL4=;
        b=egcaypY9pw8L69kcavV+qRvrWzapymfM4//lw3J6EPgaT0CmnAlgd6gMBw/xeKs7Gw
         +uQvwMbmf0V1jHuKmqvnPeRxgJRHgSFlw46nsQdySJc01axvhwJAcycO0Nt9adMRSAkP
         mPq0pD2TbnPa+PmeE/PiKCLa0tMwk9HujuHGrHB7ByN6FajIA3sztUQhS/rJMY+Y0IgR
         Mpuc+7wNAUYYnDBU6XG5XIziBXINGAVWfRCok4L2l+UHrzaPtoS83AJ4DpYPKbn6uwaz
         +G/t2od4yrinScO3jCqeeC1X6VD+Vs26fiod3trDcyh26AQIQF6Iq1kWpP7iyQihQ7/y
         KXnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQ7pt44C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05621420e600b004991d9d6375si2424567qvk.493.2022.10.01.10.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 10:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQ7pt44C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefu9-0007DZ-3w
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 13:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHr-0007P3-MT
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:23 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHq-0006Mx-3l
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:23 -0400
Received: by mail-qt1-x82d.google.com with SMTP id f26so4334767qto.11
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PIHa4426Hp/agSFdW8nii/mkTFfd47hTZ6myTQDFrL4=;
 b=BQ7pt44C1sVEbwBqxlFsjZdpe2Neex0+bbLXjMcr78tItPI/uo1wnUIdxv0VqOFfye
 HIS+1jyJmDW6v9mVlQ95iErD2fCfXRfRc+RNd5+hEqSV2TKkqmaJ/fK5GM/zkKbGvwUP
 EL/C+vrLGAi/bFKgiNgyKwPbx+3JUB845M9P/FQkLIimJOSD5+Wd27745dsseOyAyM8C
 S0GAQuIfIRpJ15+cBSTtF60hqcoXa6b6s0JlQz9uD1DhroqBYo1+WbvoCeFk3TMNkngy
 XZdCkMM3oA9aIinE0UaWznGCKxFl1mFBAw4Lv1+X1TafwrrIOcNRDCZjVdv79iOcjC4L
 zf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PIHa4426Hp/agSFdW8nii/mkTFfd47hTZ6myTQDFrL4=;
 b=QOD+7wlpaYksVd62lOvpkjZ/9njn38ggYHEgCpXK1RFrNI8XVl8TSZEn37LsfqX0yK
 StyYwXwBQRjM+3mJALSGddmIZQzXZO7+Zi5FNx+qCYrwHHNL9htuGDLLo6c1A4AUiyXf
 gPHLtc/a35m6z724coM5nFvQMLLc/ytz7o29mnB9ZJZkWOJ6eoewCDJalVHCf3TCGc8Z
 Hta5TFQnP1VZbPEmBBND6Qz4gee63BweBSY67LiAzkntlde57gQYvhifGstJ/sp6eFIY
 94deLN5PIkg/u7T1eK/6FNahUUOPoQtZSEPvNnlnSwwhpmckA2X/8mRc58Mn7D8QME76
 416g==
X-Gm-Message-State: ACrzQf0Mb83Lh1o5pNiOMSaoILAL9VzKGZ3vRvjx1pLCv486M4c/0dOP
 C69ExZHe/BIk4iAA25RmrGzGdUSFWseseA==
X-Received: by 2002:ac8:7f4d:0:b0:35c:b953:185a with SMTP id
 g13-20020ac87f4d000000b0035cb953185amr11071651qtk.382.1664641461036; 
 Sat, 01 Oct 2022 09:24:21 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 24/42] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Sat,  1 Oct 2022 09:23:00 -0700
Message-Id: <20221001162318.153420-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: y9zwXd7uxtCn

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       |  7 ++++++-
 target/arm/ptw.c       | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 689a9645dc..98bd9e435e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8cad2ef7c..0effa85c56 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2899,8 +2899,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 EL2&0 +PAN
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
+ * Physical (NS & S)
  *
- * for a total of 8 different mmu_idx.
+ * for a total of 10 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
@@ -2965,6 +2966,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ccfef2caca..05dcacf45b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -179,6 +179,11 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        /* No translation for physical address spaces. */
+        return true;
+
     default:
         g_assert_not_reached();
     }
@@ -2286,10 +2291,17 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
 {
     uint8_t memattr = 0x00;    /* Device nGnRnE */
     uint8_t shareability = 0;  /* non-sharable */
+    int r_el;
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        int r_el = regime_el(env, mmu_idx);
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        break;
 
+    default:
+        r_el = regime_el(env, mmu_idx);
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
@@ -2338,6 +2350,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
             shareability = 2; /* outer sharable */
         }
         result->cacheattrs.is_s2_format = false;
+        break;
     }
 
     result->f.phys_addr = address;
@@ -2543,6 +2556,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2551,6 +2565,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1

