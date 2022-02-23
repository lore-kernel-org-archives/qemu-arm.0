X-Received: by 2002:a17:902:e302:b0:14f:d360:afe3 with SMTP id q2-20020a170902e30200b0014fd360afe3mr1832560plc.171.1645655513166;
        Wed, 23 Feb 2022 14:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655513; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBtRD1mfg7Nopm3ynNxSMrjeZuHco4OXvfXhAmMUWidwFbR6/EBZ3Mfs8cloV1Ovv3
         fYJ7nUX0iI1aFUOxuG3viqV5utQCkh955/TlosfRpAoc82sJev5Lzm5oVlIjy8abQMnE
         0HIdM6Mxo3Vmxhv9WMPfXb1QAE/edhcEADZ+t/PWIAZnQDKPtiNTZbfaE7n9Y+EpnSEf
         H7RKk2Ngg3DLy1AHd3mwMxp97jTas8KGCEkAi7UpiPbOaHDfOEfBjqCu/fGvbt3Ywc8N
         fWKOgYa09sR7kQmTxhKN646rwSWnSP+tr7yKyCUhEmuD8+IEx3/+IxrwYeSgb8ncvbue
         dnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
        b=ZRoR4jygOw4CySjiefb5ospjJdGIKnTmTcq8ECl24Wq0fMSjXiNvYhGx0A9wAHkLSy
         eUrVVTOTdMdYsPC5Ut4Mgw2D8y9O3uhNY9Wx/4zHB9KcL0hVaootS3SXSIOCE/TxYOSs
         xqpGFhqEUA8Fm6lnyBsLrK9RYYmRjEHU5apJTDBWA8qTdCR4fUctWd8yN/VVM3VSTQu0
         sZ5vOYiNPqQso/SC1UUn6pWgulUr0NZAyIshImPC1SaKkeauWukuubuz4qUNqcKuGroy
         7zQWoBopREiMAhIfsZAhYmjcdZE2WdwdlaJaPfYrRYIzaymjhwW1kVXvOVNDPoQc963t
         yanA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8zPDZfP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j16sor1333128plh.135.2022.02.23.14.31.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8zPDZfP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
        b=Z8zPDZfPN18iEOEzjhnS6MKg+S84OsixiiLfXVdyBWC1ZgRB3YWlFUX2CDg9b3GrR6
         /9xrkT19NUIMjXHs3RP5BWHGiq5QeXsi3+9eBgDnIO0dlv1ardly/P5jergM887C5AIQ
         YNgJ9HCNmtP3oMdl2k0t0ZMAY3kE8MEmSohOboaeIRk8a0v/zscmYUQdEiXhl7m8gaP3
         hktauuiLBtFLDTwreMBkVmemli1yvkX2y5wA5shT7HjFF+4Y5UMsbgcqb4kL/XuhhjI/
         Wf47CVV3htPYCKWjIzatF6Rp/eBM8HUhEkBMF/7FW4UV8eeUJY+iVBUEJrQe3VvALTbG
         R5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4y89pQ0OdmVIqwd6NdNcqx8YrKd1GuWayeQiD4wW2NU=;
        b=Ij+mr8B2m74OpXHJ2tGDXMGi1tsXsQ/NoTNuRUvzFZujzFmpOXxsG06T7DZIqA2Pok
         Fs/33BKdnXbtsQ8bMvsEj6SYQAA7y4F1rYtMTF1K+gQ96GhwvXuTczPuVKRDaybgeuS/
         x64JvjcdnwPZP184KTGxLumTqLVbc74hwku4evxPBXsu18qS3E3dFqGdCF1bPqNvN4Is
         JEUlhbeckghV4KvA5oOac0k0EqEPPYAoosdOC5GjMsgWy44b46HoT1KKX/3w7NXcz6tx
         rih7kb9YuYaS2G3oQlEuejIjyA6pdxxXKGvV3RE+vPwvvEOzoKUOZJ+Pwp9ma7eBT7IO
         qRKQ==
X-Gm-Message-State: AOAM530h1mEOc1Idc6Q+tvzPrZhJpEigsx0TMuiJ376N2f1uKYGVQ9el
	mRAvttzgDGg7OU30w5rSE+M3XmOw
X-Google-Smtp-Source: ABdhPJxhDFig15Q9NqAn4W6/VtX1zzoDBrbS/gUxF4ylSRS/3awSbwc7Lm8A/p0SfT0fpUbyBPgQjQ==
X-Received: by 2002:a17:902:e84e:b0:14e:cbf5:a9c6 with SMTP id t14-20020a170902e84e00b0014ecbf5a9c6mr1855153plg.169.1645655512485;
        Wed, 23 Feb 2022 14:31:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 07/17] target/arm: Honor TCR_ELx.{I}PS
Date: Wed, 23 Feb 2022 12:31:27 -1000
Message-Id: <20220223223137.114264-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wkk6uB/E6Uld

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
