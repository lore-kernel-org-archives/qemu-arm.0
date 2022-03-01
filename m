Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209969lfo;
        Tue, 1 Mar 2022 14:00:28 -0800 (PST)
X-Received: by 2002:a17:902:db0f:b0:151:5fbb:5f4b with SMTP id m15-20020a170902db0f00b001515fbb5f4bmr14186321plx.36.1646172028443;
        Tue, 01 Mar 2022 14:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172028; cv=none;
        d=google.com; s=arc-20160816;
        b=YhfIA7SXumqH097x2xr1Z20g4tIhsyGL9UcXYNo3D94SluzAAH1gDbInqPqjMh4cgH
         2c7hfJsQD0aVlXnuvZhNjKBbaRuVu/x5jKhKggK0fTunPRTTe4fiygnuw4/q6mbZ/8S7
         HLv0NClr6ySEKGDamiiNZb9PtaJkJEHNqOFw9tpY9wupuAKATDvziq624SbNGXGvnnn+
         U3nEbkmZEeLacskBmAH0vfT7alSjbEEeyG2EP86RO40Y7MuKV/dMadjmB+5TR6C7wXE7
         BToK7lVBPFidso4HUUxCNMtcGCyGuroY/ZS+JFlXXJ1TkgHDjbeOO7ql0rpKsmbTvhjU
         nQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CqWbvRTBAjyoO5+H2KGfyQ/yLbqHW7L7/zJop3eBZiU=;
        b=gfRedcFRbdBAazD2AhCM1f9bHzXn3oZxPyfgzSdBXGI85RZtmsjeQFqieIWNxaNpY6
         DAF58acE7eYfJ+cGbduPKhVlKcGZ1ZvUad7/x8X6lGHf6R1RKTrSlXGOExrsAOBSE5fn
         qZmLOUfSgu0qUK2V2IF5x3sanWH1JIjvEnnQWeesHAl0vMgksukLbSmVJxAADp1oaP4l
         hm25qY8eTy33b9XY0N0qWiEdyDVew3BvsbsszZLr2+kvO4EQHKJy4elAAtOfMeQ11Kgs
         fY8Mv86mtMFPw9Xy5B70NO6rPId/o3MEIGzpHY7UtIMAmoDyHpvb0pFJ8p9W32uYOV92
         iEXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6tHwF2v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m18-20020a170902bb9200b00151615233basor3624140pls.62.2022.03.01.14.00.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6tHwF2v;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CqWbvRTBAjyoO5+H2KGfyQ/yLbqHW7L7/zJop3eBZiU=;
        b=P6tHwF2vCGgnCi7lGTV9pMrRViWdXTKfVkldxD6QdF0F3J2FK8wjn8hfwBNP0dU9DQ
         8l0Se+tcH/P2siFNOIb676b/KuZmV/wppPp9TrhNBFUl8tRdqadvON4SaZoxYGcHjOlx
         SYcDPHBy7SAssxfWx8p+hLHq4Q22bEPUSZ5wNeRHvFLmx4nI7PImeKgwMPalPufRX9xf
         Ua/7fBf3RgQo+1VsnQcuzjc7zvB86/ga6ZMwMKQMoL78Ipxa0cCzAy2mtkNeSfdcmED6
         vsH7K9s5Cy6K4Lb+c/RYaq8rcCJYtclSGAlJCgApXktWPWrIs/PQA8RJnuapVkctwDR3
         k1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqWbvRTBAjyoO5+H2KGfyQ/yLbqHW7L7/zJop3eBZiU=;
        b=QIrJvZkZxtdAVMwHYKc+eVs4ORbss6DcWbww32xP1KWy2Hh9mvAAegYnv1DdbAIOgm
         IU2iI1kROs43h8lKdvE88OLg2tVZXqcH8Rrws3ZmjnJGsdiQhFHCDRIZugiN3xZe8cec
         NNSKVopt2BV0yyR0dHm77+nmO/IMpYJeYPOqhahkKWRUjIp0oZ/tFI01NaibCduj/sXU
         WtTYRfyXo+5wa+fZOuZYjMuSP0nr2GcFXrWT5qiIZzgprw+PXxdNcePWTNJFbWVBTjhl
         1TjDE67Oo4RQPFSfsLCDIPiuwxnPZDkXDLiNXLS4yteB310wviUZsGDaTXSHV3WXzrz4
         JiZQ==
X-Gm-Message-State: AOAM5335OMqZ2KyV+9WqzaiiHlkmjcCOb+m8ECbnRDPAxAxq3BhpsqjG
	giY+YwH7ZVDnMTnslEEQFxmX9qhb
X-Google-Smtp-Source: ABdhPJy22u83AbdnlKUpKGw9oeMll0lfirmY2wz615lBp85fuwuxl5TWMbbXFAQwzqsg59LBqjGJzQ==
X-Received: by 2002:a17:902:cec7:b0:151:9615:5ab0 with SMTP id d7-20020a170902cec700b0015196155ab0mr217949plg.145.1646172027892;
        Tue, 01 Mar 2022 14:00:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 16/18] target/arm: Implement FEAT_LPA2
Date: Tue,  1 Mar 2022 11:59:56 -1000
Message-Id: <20220301215958.157011-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YCPMeYngeDrA

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

Do not yet enable FEAT_LPA2; we need extra plumbing to avoid
tickling an old kernel bug.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Check DS in tlbi_aa64_get_range.
    Check TGRAN4_2 and TGRAN16_2.
v4: Do not enable the feature yet.
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  22 ++++++++
 target/arm/internals.h        |   2 +
 target/arm/helper.c           | 102 +++++++++++++++++++++++++++++-----
 4 files changed, 112 insertions(+), 15 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0053ddce20..520fd39071 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
+- FEAT_LPA2 (Large Physical and virtual Address space v2)
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
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
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3a7f5cf6f0..088956eecf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4546,6 +4546,14 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
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
@@ -11081,8 +11089,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
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
 
@@ -11223,8 +11236,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
@@ -11238,7 +11252,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ds = extract64(tcr, 32, 1);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11248,6 +11264,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         if (!select) {
             tsz = extract32(tcr, 0, 6);
             epd = extract32(tcr, 7, 1);
+            sh = extract32(tcr, 12, 2);
             using64k = extract32(tcr, 14, 1);
             using16k = extract32(tcr, 15, 1);
             hpd = extract64(tcr, 41, 1);
@@ -11257,24 +11274,51 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
@@ -11296,6 +11340,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     return (ARMVAParameters) {
         .tsz = tsz,
         .ps = ps,
+        .sh = sh,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11303,6 +11348,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using16k = using16k,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
+        .ds = ds,
     };
 }
 
@@ -11528,10 +11574,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
 
@@ -11585,10 +11640,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
@@ -11623,11 +11680,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
@@ -11721,7 +11783,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
