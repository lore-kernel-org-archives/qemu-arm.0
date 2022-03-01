Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209808lfo;
        Tue, 1 Mar 2022 14:00:15 -0800 (PST)
X-Received: by 2002:a63:be0c:0:b0:373:9f38:928e with SMTP id l12-20020a63be0c000000b003739f38928emr23240916pgf.241.1646172015298;
        Tue, 01 Mar 2022 14:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172015; cv=none;
        d=google.com; s=arc-20160816;
        b=gi/Sdo9o2E68k3tw/W0+XbhtjiG6ubzVtc1xBJsJdgA+NkLqBjggFMV3zlKAy50ZIu
         IGFqv977qJ0mCbQODT7j3YZYUFO+ZYgw2E055cF2QfHfxjvgaZW/TEhO4Y9CEAtwe/eu
         xHlPSZLyWd2OBPgOHobVU4K+N23SIjLBM/DqnazCFivdnO9muXiR9mOIiUyJl92QvIxl
         6IjvYHBk1ob/NHLm3fRwrxE/C7LwO89mKe8YewrZwSyQrRfaoP06dW0kMp9OsFKt0yrM
         JtyF3AYSBSc5a1yOf4tBPfz233/TU55Oi0371RppiK6HA1A4RmlTrg1ycnt+PG1RIgsJ
         uOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
        b=KVqvYLd9ZqcX8MCYxCeaCSKbkD0pmV9FMxrAn8jgl9x7qhG0IMSf3xoAHPuj1HVg9l
         FDNXQz4kc2oGGevPhIHy2NHs5ghTZkRkvrweR3Id5lsF63zinE2X1/RfrkZYGaElBQTs
         KOu6YIMhPm8ETj6Y0ORjC3NMjOm2sFEW6NVRAT3Na8kObpmAI5RKZkNzRS5kwSh2Wbfy
         dJE8bYy7vj5hgSxl/PRpHfhJ3Idwn83ANUsnZbz2Guq7LiSw2YxTGpMFP/IcrKS6afAG
         X9WsBL91P5jS2bK6V8Mr4ki/Q2MhqOJGcz3LUcjEVnZ6tVQEXHVw6lY4UkX6wsem56yP
         2Rug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wmy5RugO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x7-20020a170902ec8700b001518fcdfc99sor540141plg.163.2022.03.01.14.00.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wmy5RugO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
        b=Wmy5RugO15iYoda6BPxEg0B8IO+i0Cq/TAILoJDnOKz63NyH4Ih2f3B/2Rc+7avbLd
         HW0UyyTRSseFRzGKaRf8Ep8bmht6vWXk8FU0bs0VWzlZAjFtjo+GbSy8L11N2ax3hKgo
         AQiGRTDzzd6vXb9E+V8y4czopyFkPZ0PUo4J8ASQsy24xec61rNZ0k1irkGLbi/wRtOD
         VDZvKTZKbSspIww69iWLaFMEizbmalize+nE4iCCpTU+zo5x43cz5DUQRBwaDKFol5ce
         j5F1KvWhYJjmus18aHAA+S2dMOU1R1VsRHdk9GDAVI8zcK2J2RmVkceYzIAJgfjC+EC7
         ru0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
        b=3k8Ne+bwxP+ZoOwimch/RzTwlZ1+o3+DQtWMoiyO6XI1hgz8+gf3v9fqQPEHriwPGV
         coPaBpqmUivZ4BrLqTB6tIlTGpC/1BZ8eKcLykFhDygh/BgTw7KpmJfdiOoq+fa2o+yn
         RC8EorT4ellPA4460uiT8qhR+kOtcT6J9u3v+xWSyqcy8mHxNm7d9lUX2mXaRo7+A+PP
         NPl+577ItOmjVDVtEYO5P8T0uKXh7v4K+unEWeNgaABr8YyC1wE9Yx5sjDRfJsczyTna
         lKIyQZrpxBCkvGHoDH0502rKTMNY4Nfjb/cEZ2+Eu51fvszlb/Te0/whozWesVjuEADO
         zQZA==
X-Gm-Message-State: AOAM532VocSwWOOc3E3JfKcB0TR9r8bQ9nZ2/y32S3kbeTN4KSFamCBP
	1tuCEZj45mVKItnJ6CsVC6KNJpTV
X-Google-Smtp-Source: ABdhPJznX60q7l8+36HYaGBopmOaWch1jFLEuor7SDqcpxv+4r/GHQNq/NJ85znJOEgD2juT7OCF0A==
X-Received: by 2002:a17:902:ab4c:b0:14f:bb61:ef0a with SMTP id ij12-20020a170902ab4c00b0014fbb61ef0amr27572532plb.84.1646172014254;
        Tue, 01 Mar 2022 14:00:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 07/18] target/arm: Honor TCR_ELx.{I}PS
Date: Tue,  1 Mar 2022 11:59:47 -1000
Message-Id: <20220301215958.157011-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kh7MkVd8eq6a

This field controls the output (intermediate) physical address size
of the translation process.  V8 requires to raise an AddressSize
fault if the page tables are programmed incorrectly, such that any
intermediate descriptor address, or the final translated address,
is out of range.

Add a PS field to ARMVAParameters, and properly compute outputsize
in get_phys_addr_lpae.  Test the descaddr as extracted from TTBR
and from page table entries.

Restrict descaddrmask so that we won't raise the fault for v7.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 72 ++++++++++++++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fefd1fb8d8..3d3d41ba2b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1032,6 +1032,7 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
  */
 typedef struct ARMVAParameters {
     unsigned tsz    : 8;
+    unsigned ps     : 3;
     unsigned select : 1;
     bool tbi        : 1;
     bool epd        : 1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 675aec4bf3..c002100979 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11149,17 +11149,19 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
+static const uint8_t pamax_map[] = {
+    [0] = 32,
+    [1] = 36,
+    [2] = 40,
+    [3] = 42,
+    [4] = 44,
+    [5] = 48,
+};
+
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
 unsigned int arm_pamax(ARMCPU *cpu)
 {
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
     unsigned int parange =
         FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
 
@@ -11210,7 +11212,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k, tsz_oob;
-    int select, tsz, tbi, max_tsz, min_tsz;
+    int select, tsz, tbi, max_tsz, min_tsz, ps;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11224,6 +11226,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        ps = extract32(tcr, 16, 3);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11244,6 +11247,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 23, 1);
             hpd = extract64(tcr, 42, 1);
         }
+        ps = extract64(tcr, 32, 3);
     }
 
     if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
@@ -11272,6 +11276,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
     return (ARMVAParameters) {
         .tsz = tsz,
+        .ps = ps,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11399,6 +11404,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
+        int ps;
+
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
@@ -11419,7 +11426,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
-        outputsize = arm_pamax(cpu);
+
+        /*
+         * Bound PS by PARANGE to find the effective output address size.
+         * ID_AA64MMFR0 is a read-only register so values outside of the
+         * supported mappings can be considered an implementation error.
+         */
+        ps = FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+        ps = MIN(ps, param.ps);
+        assert(ps < ARRAY_SIZE(pamax_map));
+        outputsize = pamax_map[ps];
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
@@ -11523,19 +11539,38 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
+
+    /*
+     * If the base address is out of range, raise AddressSizeFault.
+     * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
+     * but we've just cleared the bits above 47, so simplify the test.
+     */
+    if (descaddr >> outputsize) {
+        level = 0;
+        fault_type = ARMFault_AddressSize;
+        goto do_fault;
+    }
+
     /*
      * We rely on this masking to clear the RES0 bits at the bottom of the TTBR
      * and also to mask out CnP (bit 0) which could validly be non-zero.
      */
     descaddr &= ~indexmask;
 
-    /* The address field in the descriptor goes up to bit 39 for ARMv7
-     * but up to bit 47 for ARMv8, but we use the descaddrmask
-     * up to bit 39 for AArch32, because we don't need other bits in that case
-     * to construct next descriptor address (anyway they should be all zeroes).
+    /*
+     * For AArch32, the address field in the descriptor goes up to bit 39
+     * for both v7 and v8.  However, for v8 the SBZ bits [47:40] must be 0
+     * or an AddressSize fault is raised.  So for v8 we extract those SBZ
+     * bits as part of the address, which will be checked via outputsize.
+     * For AArch64, the address field always goes up to bit 47 (with extra
+     * bits for FEAT_LPA placed elsewhere).  AArch64 implies v8.
      */
-    descaddrmask = ((1ull << (aarch64 ? 48 : 40)) - 1) &
-                   ~indexmask_grainsize;
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        descaddrmask = MAKE_64BIT_MASK(0, 48);
+    } else {
+        descaddrmask = MAKE_64BIT_MASK(0, 40);
+    }
+    descaddrmask &= ~indexmask_grainsize;
 
     /* Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
@@ -11560,7 +11595,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             /* Invalid, or the Reserved level 3 encoding */
             goto do_fault;
         }
+
         descaddr = descriptor & descaddrmask;
+        if (descaddr >> outputsize) {
+            fault_type = ARMFault_AddressSize;
+            goto do_fault;
+        }
 
         if ((descriptor & 2) && (level < 3)) {
             /* Table entry. The top five bits are attributes which may
-- 
2.25.1
