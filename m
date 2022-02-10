Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287956lfk;
        Wed, 9 Feb 2022 20:05:15 -0800 (PST)
X-Received: by 2002:a17:90b:38d0:: with SMTP id nn16mr743500pjb.21.1644465915145;
        Wed, 09 Feb 2022 20:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465915; cv=none;
        d=google.com; s=arc-20160816;
        b=CFqWJsFrnHRJlKVU68EkO3AYuQOEvV/A12bMt1uxnvG0MhZekOmwxQ7cp4SvkXkI5Y
         ZifMEcD0G8LSR92YX6H/ePCk8kOTzOM8bVb90FkLNSAByqpDZSaggsOl0ckMYUjLu59n
         0JnZmLoojAtMhNTz9R4Ao6qDqAvaT81IfusX2t6dxCBuE3yKR/8ZPlzE81KlY95t0Maw
         d6z3z6xCfx+/JA4XEnLEiolqPMLJ4VTTnAdePjEqFFTAGKcB03qWBn6lrESW7MnRvAYd
         TP59e5Kae4Dj95gzQzCXMZxm2G/MmBNOmeBwchn9UlssexTuxKrA5jPdlHpDWOEYcqln
         /Urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rl+deY7CG2LcOyT6/JU0+OryAiRw3UHGvhaIal+CJ9A=;
        b=S8fZJo1n/ZcRK3E5sCi6PNWhrED67sTLhX1R+kCXKk9RNeyLBp91DLdqOibYQPQl+7
         F5AxnQgi6HzpuHPBrxZE012hZdcGgaKFJ5+1azelMKPu4nUa85KL5XZAWFxvKnGC/e2D
         X1B9+kXwVkW+zTkOPzzUvIlszGXQfdRARUsA5FYR11/M4KrUXsYb9XM+6MXYKLQJYSGl
         E01WAoglZIWTpj+sWhV7jQx75gS+kwIbpfMIIgqL6Bq4yemkUqjXeuJhTfYaygRGn6Y4
         vIdsMMPRQo4t1rW51aqaeuNjaMVOYnSqW9Jtbg1rugL7z+YlSwMsX0HwmTZJwaDWOsqV
         MHKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bWtrIFoS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p5sor193809pjj.11.2022.02.09.20.05.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bWtrIFoS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rl+deY7CG2LcOyT6/JU0+OryAiRw3UHGvhaIal+CJ9A=;
        b=bWtrIFoSs5PuGjsscb7b8/eW/WW1cavo3DDOXu2O59fl8H5CKwfJ1Ujbx71wHnqEJi
         n3F1hGe9Guo4RXvEELIHUYlovCbsovzQeTTp6eb62R5KpbwK2DrR5O+PJNYDKsUBpcb6
         d5takqQ54eyNoXYqk3l7nKFZSkCG091eZeXigqL5GGDi6cHbE+sNV+2hSTKyfDVyZVk3
         owahHlvplhbmcXzZX/u0qMUhy7HM6Z6tVDA/eNJuCDaeUugPZ9gYsiq7u0X9kzH15aCE
         ejMbhZRjwTy4VOb3ZLYCCSS/2/JgotI2k4bj3k2Mlsgztv1xOm+mBiXNiFEe1e1oxl7f
         LdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rl+deY7CG2LcOyT6/JU0+OryAiRw3UHGvhaIal+CJ9A=;
        b=MWkm7FdQBQoIyB9mNmKD/BHQA++eKKhwkz3JgOk4n62myC0BJKD6qXYnbmbLqSu6Mt
         g/uFu8wiT+iVIpJVchxG+uop1P9AMefNIU+zdxCvGTk0wbhvws7OSPdToAyNZFyFyKOV
         UgW2hxG74HH1rhL3C11y0sf2fAJ2qs1cVck0IgxarMVy/QQ/Fbc48Mu6ERGhJSRKgGTA
         eVqw9/i2+nX37QM8rOg2KeaHQyrnmiCnTB5KjyOmBiAWZG//TO/Lh54kHrbdwf6qzkGq
         nLXNk4AEQ6JYnp8h2QtRgSfCVug3fsaMy/nkVqm2i8GNAvT4i1lFPKAOLKIHXrwSXitc
         t+JA==
X-Gm-Message-State: AOAM533EGNTH4ty0IqjU8pwTRU91+BOSsTxewBtyyFxlfeShtZlQL8Nu
	rxlMnjwnKe6M/onR5oXsADqIdL/a
X-Google-Smtp-Source: ABdhPJx5nIpDzel28jebnQMYICp5EneOAlnSX+mODHYXP8FQNQJCvPOqdl8Od+a6Oel2kNq0OftKSQ==
X-Received: by 2002:a17:90b:4c91:: with SMTP id my17mr722070pjb.221.1644465914575;
        Wed, 09 Feb 2022 20:05:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:05:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 15/15] target/arm: Implement FEAT_LPA2
Date: Thu, 10 Feb 2022 15:04:23 +1100
Message-Id: <20220210040423.95120-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XIYWKmQZSBTI

This feature widens physical addresses (and intermediate physical
addresses for 2-stage translation) from 48 to 52 bits, when using
4k or 16k pages.

This introduces the DS bit to TCR_ELx, which is RES0 unless the
page size is enabled and supports LPA2, resulting in the effective
value of DS for a given table walk.  The DS bit changes the format
of the page table descriptor slightly, moving the PS field out to
TCR so that all pages have the same sharability and repurposing
those bits of the page table descriptor for the highest bits of
the output address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Check DS in tlbi_aa64_get_range.
    Check TGRAN4_2 and TGRAN16_2.
---
 target/arm/cpu.h       |  22 +++++++++
 target/arm/internals.h |   2 +
 target/arm/cpu64.c     |   4 ++
 target/arm/helper.c    | 102 +++++++++++++++++++++++++++++++++++------
 4 files changed, 115 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c52d56f669..24d9fff170 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4284,6 +4284,28 @@ static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran4_2_lpa2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
+    return t >= 3 || (t == 0 && isar_feature_aa64_tgran4_lpa2(id));
+}
+
+static inline bool isar_feature_aa64_tgran16_lpa2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 2;
+}
+
+static inline bool isar_feature_aa64_tgran16_2_lpa2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
+    return t >= 3 || (t == 0 && isar_feature_aa64_tgran16_lpa2(id));
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00af41d792..a34be2e459 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1056,6 +1056,7 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
     unsigned ps     : 3;
+    unsigned sh     : 2;
     unsigned select : 1;
     bool tbi        : 1;
     bool epd        : 1;
@@ -1063,6 +1064,7 @@ typedef struct ARMVAParameters {
     bool using16k   : 1;
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
+    bool ds         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 707ae7767f..9382c19e54 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -766,6 +766,10 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64mmfr0;
         t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2); /* FEAT_LPA2: 52 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);  /* FEAT_LPA2: 52 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* FEAT_LPA2: 52 bits */
+        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /* FEAT_LPA2: 52 bits */
         cpu->isar.id_aa64mmfr0 = t;
 
         t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 771de959dd..bf694d8324 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4544,6 +4544,14 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     } else {
         ret.base = extract64(value, 0, 37);
     }
+    if (param.ds) {
+        /*
+         * With DS=1, BaseADDR is always shifted 16 so that it is able
+         * to address all 52 va bits.  The input address is perforce
+         * aligned on a 64k boundary regardless of translation granule.
+         */
+        page_shift = 16;
+    }
     ret.base <<= page_shift;
 
     return ret;
@@ -11079,8 +11087,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     const int grainsize = stride + 3;
     int startsizecheck;
 
-    /* Negative levels are never allowed.  */
-    if (level < 0) {
+    /*
+     * Negative levels are usually not allowed...
+     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
+     * begins with level -1.  Note that previous feature tests will have
+     * eliminated this combination if it is not enabled.
+     */
+    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
         return false;
     }
 
@@ -11221,8 +11234,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k, tsz_oob;
-    int select, tsz, tbi, max_tsz, min_tsz, ps;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
+    ARMCPU *cpu = env_archcpu(env);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11236,7 +11250,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ds = extract64(tcr, 32, 1);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11246,6 +11262,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         if (!select) {
             tsz = extract32(tcr, 0, 6);
             epd = extract32(tcr, 7, 1);
+            sh = extract32(tcr, 12, 2);
             using64k = extract32(tcr, 14, 1);
             using16k = extract32(tcr, 15, 1);
             hpd = extract64(tcr, 41, 1);
@@ -11255,24 +11272,51 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             using64k = tg == 3;
             tsz = extract32(tcr, 16, 6);
             epd = extract32(tcr, 23, 1);
+            sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ds = extract64(tcr, 59, 1);
     }
 
-    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_st, cpu)) {
         max_tsz = 48 - using64k;
     } else {
         max_tsz = 39;
     }
 
+    /*
+     * DS is RES0 unless FEAT_LPA2 is supported for the given page size;
+     * adjust the effective value of DS, as documented.
+     */
     min_tsz = 16;
     if (using64k) {
-        if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+        if (cpu_isar_feature(aa64_lva, cpu)) {
+            min_tsz = 12;
+        }
+        ds = false;
+    } else if (ds) {
+        switch (mmu_idx) {
+        case ARMMMUIdx_Stage2:
+        case ARMMMUIdx_Stage2_S:
+            if (using16k) {
+                ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
+            } else {
+                ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
+            }
+            break;
+        default:
+            if (using16k) {
+                ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
+            } else {
+                ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
+            }
+            break;
+        }
+        if (ds) {
             min_tsz = 12;
         }
     }
-    /* TODO: FEAT_LPA2 */
 
     if (tsz > max_tsz) {
         tsz = max_tsz;
@@ -11294,6 +11338,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     return (ARMVAParameters) {
         .tsz = tsz,
         .ps = ps,
+        .sh = sh,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11301,6 +11346,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using16k = using16k,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
+        .ds = ds,
     };
 }
 
@@ -11526,10 +11572,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
+        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
         uint32_t startlevel;
         bool ok;
 
-        if (!aarch64 || stride == 9) {
+        /* SL2 is RES0 unless DS=1 & 4kb granule. */
+        if (param.ds && stride == 9 && sl2) {
+            if (sl0 != 0) {
+                level = 0;
+                fault_type = ARMFault_Translation;
+                goto do_fault;
+            }
+            startlevel = -1;
+        } else if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
             startlevel = 2 - sl0;
 
@@ -11583,10 +11638,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * for both v7 and v8.  However, for v8 the SBZ bits [47:40] must be 0
      * or an AddressSize fault is raised.  So for v8 we extract those SBZ
      * bits as part of the address, which will be checked via outputsize.
-     * For AArch64, the address field always goes up to bit 47 (with extra
-     * bits for FEAT_LPA placed elsewhere).  AArch64 implies v8.
+     * For AArch64, the address field goes up to bit 47, or 49 with FEAT_LPA2;
+     * the highest bits of a 52-bit output are placed elsewhere.
      */
-    if (arm_feature(env, ARM_FEATURE_V8)) {
+    if (param.ds) {
+        descaddrmask = MAKE_64BIT_MASK(0, 50);
+    } else if (arm_feature(env, ARM_FEATURE_V8)) {
         descaddrmask = MAKE_64BIT_MASK(0, 48);
     } else {
         descaddrmask = MAKE_64BIT_MASK(0, 40);
@@ -11621,11 +11678,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /*
          * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
-         * of descriptor.  Otherwise, if descaddr is out of range, raise
-         * AddressSizeFault.
+         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
+         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
+         * raise AddressSizeFault.
          */
         if (outputsize > 48) {
-            descaddr |= extract64(descriptor, 12, 4) << 48;
+            if (param.ds) {
+                descaddr |= extract64(descriptor, 8, 2) << 50;
+            } else {
+                descaddr |= extract64(descriptor, 12, 4) << 48;
+            }
         } else if (descaddr >> outputsize) {
             fault_type = ARMFault_AddressSize;
             goto do_fault;
@@ -11719,7 +11781,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         assert(attrindx <= 7);
         cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
     }
-    cacheattrs->shareability = extract32(attrs, 6, 2);
+
+    /*
+     * For FEAT_LPA2 and effective DS, the SH field in the attributes
+     * was re-purposed for output address bits.  The SH attribute in
+     * that case comes from TCR_ELx, which we extracted earlier.
+     */
+    if (param.ds) {
+        cacheattrs->shareability = param.sh;
+    } else {
+        cacheattrs->shareability = extract32(attrs, 6, 2);
+    }
 
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
-- 
2.25.1
