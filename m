Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071393wrv;
        Wed, 31 Jul 2019 13:38:39 -0700 (PDT)
X-Received: by 2002:a63:9318:: with SMTP id b24mr8156342pge.31.1564605519558;
        Wed, 31 Jul 2019 13:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605519; cv=none;
        d=google.com; s=arc-20160816;
        b=a4MIWjP0EDTOhUzHrNg1xHUQqUm1ZC2XPeunyiO0SKasD07ih11my+CA19Z1MHi934
         3A+N7QTeQVo5m1gG1Gb1c4uddfVMVK0Ahmgy+5j0fh+JdjS6MGK0fC3kMBtsk3F1v0f6
         T+taz0Vo9ZvzmCjULJyf2MBzqGExr/5qkaueDUogJ+qlxuFxMSogDUNLdB40vcXTY2Em
         M3rrLZyqy8zMBZt8t4lVl2nQ1lBU+MKOPSIrMQltBlCfrxOx7hggzqKCO5peYG7jhKtH
         5F/0PveWmWrExILXvhrbpNc772RzQ4Is5FM/1j6Lqt3H4icOjFNzSq0jP6zHHg2SBoAJ
         b5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=uNn5q4INDqZzSSWnDmMk9zDSnWJbLDXBWQcIuUU2uJI=;
        b=EZCnt/O69tMebPSaWx6tKUsvxUBn9YvLfW8zB1OwkQu3kXddbQ92HAnNA8ukjmX1Wz
         tA/h1TsEqMkuqsyWw/PpgHnmBhnLHShHrQjoAC9YpBZODM5vsjeXTqAs0YCLZBGU0Ywv
         2mEzwidxmHWtdZek+C4CVgbu91hkQMIv3KseCyDwf8ax6nozgzu9NHdLckRFyMlZp8OO
         mlSWIDSVOtPtRCzLW2RsLOc+hOvx+dfE11ewrF9hW+h8UZ3ByJgCKIZsa9QSWp8/6Bev
         ZbJ2LYkwPIe9cy+LVItcj8Db2ZbAqFLfQFpV9PVaX3xvkwEmqK+/UyL73pg0sFY3Bfyi
         B+7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z7CoxzCy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d6sor26543140pgd.65.2019.07.31.13.38.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z7CoxzCy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uNn5q4INDqZzSSWnDmMk9zDSnWJbLDXBWQcIuUU2uJI=;
        b=Z7CoxzCy7QzgKSn7JoSt1DYfrp/h+j3DRImGw5eTnQYNT05aU5yG6PH19lI08Oc2Mc
         OYFD/NRagj8NbGPMqM0YojWoortqXmBm3imFic2o+VZQqHspWlm/NKYfHItMCwaHdxEs
         z8LZY7XseWXFpasA+AD5VRVJoNb2+aZmdy+NOjFPhKR93qoUwpmI/a4YFm1mKco+6fOh
         KQIy4NX1pbso1YyxH9Am4evsc7J6BvN75BY1AoWlkfOqq3qlOyV1VvV0TVglIZcONbxK
         0jpkdMJQHTnIenX0l3orH4NaCF2S5gVX9VqiBv9HsqD3RaS78FVWtsD1XSQZ7+VDcSdn
         4AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uNn5q4INDqZzSSWnDmMk9zDSnWJbLDXBWQcIuUU2uJI=;
        b=hR60HACNBe50pmPm+iQSG9a3UOZp1AhMXyRozUZr3Cu3Bk+56AlGVwOZ3KNhWvOKQS
         vK7NVXsm8cv3mMS36qiknhoNcpFfhYwidqIO4IyGXlYx8TGrvpqjCJYD6WEYfTXCALXU
         Av6YO6fY2sy+7Cm/e4UAUzxDRTFvq9M4ouXuureHRzmv6kc3JTZKHNBWvR38eM+nnEzZ
         vktuEgkvK/FS3HNSCoKIGUhrbcKaKMq546aZELp6aRF0LkT3ciyHWCz7WwUCtcIKcyS/
         qY1ZJWt4vI8mHaPmhZi1mr3H5nEMr8mUoAUqPA8Vg0LEKJHNQZrrSGL+M39Bk0cq/iSy
         UHVg==
X-Gm-Message-State: APjAAAVCnv65Jinep6JeQ799vJ570ykbO1VjSfWaexS4MfTwi1IFjTML
	fXL6vGJJqa3ZLXE71geYrdn3eUHb77ZUlA==
X-Google-Smtp-Source: APXvYqyni8wVYxHX5Ha1dlrOrOSB5gBHIrtpkhP1sfv3fZC0UUncAYqaJak7iKtV5DE4//YOX3M4Pg==
X-Received: by 2002:a63:ff65:: with SMTP id s37mr73372006pgk.102.1564605519022;
        Wed, 31 Jul 2019 13:38:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 19/32] target/arm: Rename ARMMMUIdx*_S1E3 to ARMMMUIdx*_SE3
Date: Wed, 31 Jul 2019 13:38:00 -0700
Message-Id: <20190731203813.30765-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: SLSC3CFEEmbK

This is part of a reorganization to the set of mmu_idx.
The EL3 regime only has a single stage translation, and
is always secure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  4 ++--
 target/arm/internals.h |  2 +-
 target/arm/helper.c    | 18 +++++++++---------
 target/arm/translate.c |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c7ce8a4da5..94337b2fb0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2853,7 +2853,7 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_EL10_0 = 0 | ARM_MMU_IDX_A,
     ARMMMUIdx_EL10_1 = 1 | ARM_MMU_IDX_A,
     ARMMMUIdx_S1E2 = 2 | ARM_MMU_IDX_A,
-    ARMMMUIdx_S1E3 = 3 | ARM_MMU_IDX_A,
+    ARMMMUIdx_SE3 = 3 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE0 = 4 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE1 = 5 | ARM_MMU_IDX_A,
     ARMMMUIdx_Stage2 = 6 | ARM_MMU_IDX_A,
@@ -2879,7 +2879,7 @@ typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_EL10_0 = 1 << 0,
     ARMMMUIdxBit_EL10_1 = 1 << 1,
     ARMMMUIdxBit_S1E2 = 1 << 2,
-    ARMMMUIdxBit_S1E3 = 1 << 3,
+    ARMMMUIdxBit_SE3 = 1 << 3,
     ARMMMUIdxBit_SE0 = 1 << 4,
     ARMMMUIdxBit_SE1 = 1 << 5,
     ARMMMUIdxBit_Stage2 = 1 << 6,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c505cae30c..dbb46da549 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -819,7 +819,7 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_MPriv:
     case ARMMMUIdx_MUser:
         return false;
-    case ARMMMUIdx_S1E3:
+    case ARMMMUIdx_SE3:
     case ARMMMUIdx_SE0:
     case ARMMMUIdx_SE1:
     case ARMMMUIdx_MSPrivNegPri:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0d4f33026..e5b07b4770 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3116,7 +3116,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         /* stage 1 current state PL1: ATS1CPR, ATS1CPW */
         switch (el) {
         case 3:
-            mmu_idx = ARMMMUIdx_S1E3;
+            mmu_idx = ARMMMUIdx_SE3;
             break;
         case 2:
             mmu_idx = ARMMMUIdx_Stage1_E1;
@@ -3198,7 +3198,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             mmu_idx = ARMMMUIdx_S1E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
-            mmu_idx = ARMMMUIdx_S1E3;
+            mmu_idx = ARMMMUIdx_SE3;
             break;
         default:
             g_assert_not_reached();
@@ -3422,9 +3422,9 @@ static void update_lpae_el1_asid(CPUARMState *env, int secure)
         ttbr0 = env->cp15.ttbr0_s;
         ttbr1 = env->cp15.ttbr1_s;
         ttcr = env->cp15.tcr_el[3].raw_tcr;
-        /* Note that cp15.ttbr0_s == cp15.ttbr0_el[3], so S1E3 is affected.  */
+        /* Note that cp15.ttbr0_s == cp15.ttbr0_el[3], so SE3 is affected.  */
         /* ??? Secure EL3 really using the ASID field?  Doesn't make sense.  */
-        idxmask = ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0 | ARMMMUIdxBit_S1E3;
+        idxmask = ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0 | ARMMMUIdxBit_SE3;
         break;
     case ARM_CP_SECSTATE_NS:
         ttbr0 = env->cp15.ttbr0_ns;
@@ -3967,7 +3967,7 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = CPU(cpu);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_S1E3);
+    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_SE3);
 }
 
 static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3992,7 +3992,7 @@ static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_S1E3);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_SE3);
 }
 
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4020,7 +4020,7 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = CPU(cpu);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_S1E3);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_SE3);
 }
 
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4069,7 +4069,7 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                             ARMMMUIdxBit_S1E3);
+                                             ARMMMUIdxBit_SE3);
 }
 
 static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -8693,7 +8693,7 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_S1E2:
         return 2;
-    case ARMMMUIdx_S1E3:
+    case ARMMMUIdx_SE3:
         return 3;
     case ARMMMUIdx_SE0:
         return arm_el_is_aa64(env, 3) ? 1 : 3;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1fc2bf8a52..5372947e47 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -156,7 +156,7 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     case ARMMMUIdx_EL10_0:
     case ARMMMUIdx_EL10_1:
         return arm_to_core_mmu_idx(ARMMMUIdx_EL10_0);
-    case ARMMMUIdx_S1E3:
+    case ARMMMUIdx_SE3:
     case ARMMMUIdx_SE0:
     case ARMMMUIdx_SE1:
         return arm_to_core_mmu_idx(ARMMMUIdx_SE0);
-- 
2.17.1
