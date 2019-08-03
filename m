Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201046wrv;
        Sat, 3 Aug 2019 11:48:25 -0700 (PDT)
X-Received: by 2002:a62:174a:: with SMTP id 71mr67773083pfx.140.1564858105826;
        Sat, 03 Aug 2019 11:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858105; cv=none;
        d=google.com; s=arc-20160816;
        b=qo3otoDueE8+GbvQZ3EL+3UMm4QOUB6JFZI/UgDbfltVCubUlWzwXUXX63uu40ehgU
         9Y5yGKbgovnr2oIf6WMo1NFe0CC8apnRhqCeJdNqTyk2pbSfVOOfdycooDPQ9fou2mM2
         4lU5hkEdjlzG4R7AcJVkVIBBEP9X79zFf/b1Ej7YfGQDpeAhxgAq0eTvRm6t0m7Uby2Y
         YH4fFQ3WdwH9XKqhUU+lLcoxa0CLEPHHkjfQJU7+QfaGC/IbOOuWY5IY0jfP8bCBCJZg
         oBjcClGHL3f+/DDrZ+cNJMjmUS7O6Qzao7Ya7iKc3WmkWBpdOVDDi75XohaH5X5sKdX6
         tUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=uNn5q4INDqZzSSWnDmMk9zDSnWJbLDXBWQcIuUU2uJI=;
        b=MQxitj1/2IVw4Y6KMXomlg3o1O/v6IvMu3b7yCh6mAnvMxK/v2Rwk6Uoyvbc3Mwnox
         OtocshDpdAOVsp3NOTRyjs93jvdqsBvq4hvTAvKmVUWmluDS3AdA+gDDpuDLunhLDYpx
         6yOQTVq3Bpze1IBnaYI3Si75qLIYqHiY8ijb9Nhc+Bv94E/2RJKS6+meB4Hr14iaKDzb
         wLHox4uQM6mejuO0scVa9Let0OkxAc1Soa023ZINIwt8LvBvt0VVxy8cUZ3ioTl7b7AZ
         vjrCADWxUZZjbywDKCDEymE5y1iMbPOXxMrVZXpqqmM2GRQmqwSQbt3sahcvQzVgnyw8
         7bhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jr7Kr4c7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a13sor60384935pfr.48.2019.08.03.11.48.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jr7Kr4c7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uNn5q4INDqZzSSWnDmMk9zDSnWJbLDXBWQcIuUU2uJI=;
        b=Jr7Kr4c7WspWidhsMVEBqY65eKtoOdpD1vCf6jz53B3T1k0v4zi0g49FgBx3q1I7Dl
         BTWK7XyI/dIIKkJfmI3AbpmfrMn9f/Zzb+m+zzgjRAeUKHoRjtzmfBr43KMhTVdGoG6e
         R1jshS01nZ63gENO4CsOUEOID4yKeDERfXiWhVs4ZmspOYpH1022C7gHcmepqL/GlgqK
         xg47MUOEO+7FCLiL6o3DI+Msqbvtpd44FOF4sZFCLthzejM9lygGkgjwPtLY8k0DjeyO
         zm0EToUtJ4y5e6tNnTApDJ2mJgMTrHiVFPqPYTi509+wTyGFH6chjSpQwLW+tBdffG9J
         KlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uNn5q4INDqZzSSWnDmMk9zDSnWJbLDXBWQcIuUU2uJI=;
        b=Yv8VO/3V8AzuM5xXtaIO6TVDujHFHdRxvaZkMkBLa2fP1PNC0MQHkDLr3VF6AP4ox2
         1K/ZJZszZxygdi4SwwrcTL9C675MrTOfDme2IfNJbO13++0HvHy+eR6sJ/H+Vg5WJlT7
         onWCJJg+AsYsdiBh/LO/naIY72UewEVT5zMhVPXmbMjSnoWRDKQbscFWueEO57LMEzOl
         JX5v2ykse10t1FFgRH5BrVaDYT5lnkW5ebYMWiuTvpAcb2BzyT3FSHAH4zVR+Zf+jBJv
         9t769FpTtLhNZKkxX0k6qw8sVs1LbI/RXO5SgUtv3uAYvX+7XfLJSM2+0ju2wF3Wfb7G
         AmcA==
X-Gm-Message-State: APjAAAWBOHn2tHXx0ILy6U2Uk3dmGrbdjzorm3mVVvH9BCsMBFPYvrNc
	AC7Dhufrda7WN5o4lDYSy0Wj32cz
X-Google-Smtp-Source: APXvYqwtfwYy11Q3TnWncDpBK98jxsrjIdg5N9okbvj9A3tuTM6JF4sTI0DsYGJ09rG7Ft1hPhWZBw==
X-Received: by 2002:a62:187:: with SMTP id 129mr66266219pfb.128.1564858105384;
        Sat, 03 Aug 2019 11:48:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 19/34] target/arm: Rename ARMMMUIdx*_S1E3 to ARMMMUIdx*_SE3
Date: Sat,  3 Aug 2019 11:47:45 -0700
Message-Id: <20190803184800.8221-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: +yW0Y6KbeuzL

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
