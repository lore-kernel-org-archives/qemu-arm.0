Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287760lfk;
        Wed, 9 Feb 2022 20:04:53 -0800 (PST)
X-Received: by 2002:a17:903:32cb:: with SMTP id i11mr5360160plr.118.1644465893075;
        Wed, 09 Feb 2022 20:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465893; cv=none;
        d=google.com; s=arc-20160816;
        b=zv826ax5a2mfuXGYLJzpdMN8IbMlq2E+D9MfuXNoR1iRsMeildbdd2ZcOexusVEzy/
         rMdN5iaeWEy5GUrfqDf9wg4Kozcbwb3/7EoOzF1KLlR+KgE5NkhJWNoyCjkp9m27VlTQ
         TmfPMaTdul8/Esg7SsOt/36lxmbvZJHUitqyMxdBWkSfmijvt4Wc05KYCINwAYZ58lL9
         IC9Jai0xnpihnibNDOiyWYU+WL8xBobo+OkddfywkWEXfNl7IFlbWJEWU1wLtOy2XxAq
         MqU0DVwzZh4pTbUXUgRm2FWtY/4PbAhieuhSY2Fgar2lZUZmh9XCW+ebcMri9DQKFjdK
         N9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9unzvtzWabHumoVo2LIqZ3/KoNmw+Kj3VTUoCLWhgOA=;
        b=zdFhM9m6UGo8uqj/wxAs9m/fIbeBM9hkqBsuN6bpaI5M6Rxs8AiCPzbxQxVXC3c8TA
         BWBbS7nmqDdcnC7SNc8MqDuAorN43QcSvmwEKpZKbC/6kunxD1XWSFSi4EpeO1lDf3JD
         PDXWH+CIQdsHGmVRbk/mo8tT8tyEsCBKfcAH+Y9nrvwOgRb8bkJMo3f6M98UKpaqn8Zd
         4wDMiP1tvk2ieuB471W4lIXWLrJKOzD7o8YC5bPAcQ7DitdqFZ5qJugOwIcw5bjomFfj
         ZmvfJfmoOaH714ussRl9gBwyX1ajn1eVxdLcGqu3zuDq0KedJE8pOzo08ACRwm36XQv/
         GFpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+JwQgMi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 185sor3275545pga.82.2022.02.09.20.04.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+JwQgMi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9unzvtzWabHumoVo2LIqZ3/KoNmw+Kj3VTUoCLWhgOA=;
        b=h+JwQgMiCcG0aahhuT+yB0y2quVt3pYL82kcF9qIdsWyERj151UAluYcuY7slyPR8P
         8iwdBljIxk6WtBLjUyNb8lR6F6MoOVsrdWqyNq18b0Xw47khaERqTcYJBe5/7tLl1OgM
         AqekX6lgY3ATMIjohLnuji63vBgZizupHk1lbrmd3hPVD02M55IgENNAsiyvi2iSr0WN
         HvUILAaa0GwmrJyUk9ceLKja1JuHeXapBNczPqjJL7giGLQtV/Rxelz4RhrXf/a11kGA
         hyJwBaiXh3JTd8LIbikpfq5HMTmKY0Q1mAbsQkvzIzVJ/RPuSgFdK3MO0JPoqPwOJeaI
         vt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9unzvtzWabHumoVo2LIqZ3/KoNmw+Kj3VTUoCLWhgOA=;
        b=zEILgOSvcX5lxXrc9seJyUdDMpPzh0csgKl7rVye3HBmpSjkYXViSaEQSdRUMOpB6G
         2k8vyO2YZV+Fb6Layhjfz1k/NX3FICHG7rWiKqmoc4LMwuTS3RzhX6uAq+4jvi6nABZ8
         FhGn/TPaxkvy+OyXyFebNXuqd9JlR0GxSaiQwx3qHxEN3JoH7VSW//wfygcTKbVAAZhk
         4r+LtidnSrPs/gtlzb6Cxc+cs8Ia01+PDRCUeNL5ppeTpJShxW2pRCpT8nK6LwD6OOFB
         DS3g6U5ZlJLj/a7GNKnGecQc4Cpgfban0QpZcKKmJx3JkwfGPGEpjkDWLSi9KQBusJUd
         mzPg==
X-Gm-Message-State: AOAM53272b03zpnyftksoxELlF5rZbmVavhA6kKzhBZTrgo7Ucror2V+
	z3mBMCjaa0Lpho0weLyxH27QJ+1Eui5tXBQEt+Q=
X-Google-Smtp-Source: ABdhPJyvhB3MYTLOaF6Fv80g/cx/bfQs8bEsnPNLx9GfBXiH0zxnzLhNfS6gCiKJpydPV3aJWyN+aw==
X-Received: by 2002:a65:66d5:: with SMTP id c21mr701948pgw.152.1644465892535;
        Wed, 09 Feb 2022 20:04:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 07/15] target/arm: Honor TCR_ELx.{I}PS
Date: Thu, 10 Feb 2022 15:04:15 +1100
Message-Id: <20220210040423.95120-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I6lBUhco4ZzJ

This field controls the output (intermediate) physical address size
of the translation process.  V8 requires to raise an AddressSize
fault if the page tables are programmed incorrectly, such that any
intermediate descriptor address, or the final translated address,
is out of range.

Add a PS field to ARMVAParameters, and properly compute outputsize
in get_phys_addr_lpae.  Test the descaddr as extracted from TTBR
and from page table entries.

Restrict descaddrmask so that we won't raise the fault for v7.

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
index 94304804cb..015f992f02 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11147,17 +11147,19 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
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
 
@@ -11208,7 +11210,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k, tsz_oob;
-    int select, tsz, tbi, max_tsz, min_tsz;
+    int select, tsz, tbi, max_tsz, min_tsz, ps;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11222,6 +11224,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract32(tcr, 24, 1);
         }
         epd = false;
+        ps = extract32(tcr, 16, 3);
     } else {
         /*
          * Bit 55 is always between the two regions, and is canonical for
@@ -11242,6 +11245,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 23, 1);
             hpd = extract64(tcr, 42, 1);
         }
+        ps = extract64(tcr, 32, 3);
     }
 
     if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
@@ -11270,6 +11274,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
     return (ARMVAParameters) {
         .tsz = tsz,
+        .ps = ps,
         .select = select,
         .tbi = tbi,
         .epd = epd,
@@ -11397,6 +11402,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
+        int ps;
+
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
@@ -11417,7 +11424,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
@@ -11521,19 +11537,38 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
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
@@ -11558,7 +11593,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
