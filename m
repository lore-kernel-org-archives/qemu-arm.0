Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209738lfo;
        Tue, 1 Mar 2022 14:00:08 -0800 (PST)
X-Received: by 2002:a17:902:c3cd:b0:151:806d:1b9b with SMTP id j13-20020a170902c3cd00b00151806d1b9bmr5982841plj.98.1646172008485;
        Tue, 01 Mar 2022 14:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172008; cv=none;
        d=google.com; s=arc-20160816;
        b=CWbAZ0MM6I/fVGsk/33Y978TLACCwEVq733CFwLeDBWP3/EhPn6Sh7GVIjsjRrJWv8
         fSA0eH87BkRXbAfENlnKkGRmqY9wtvo7J8u+mxG3qdjqjLOGQ8BJtG/FdnLYKISDewvW
         GKDcZ2NXsBZV7R5fNLIPgkKYJvTdRFu97xxCw9qxufseqS2DzEgTwMbmD8JiSPW+O5cj
         0TLs5mEABJoMoHfBNAR2S1AliPqx4nhyM1R/oEGXI5pJ9I3lUHKryEWUc6dpGSMpSq3v
         soSa2rwbj80tSFZsIVMwz0eEAfBYfZRqf7BHKFKxl0NdXhEh4ZkacXsUfx8vUgL1HarT
         eBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
        b=RgCLg8FVqojwckzvDnM4VmH+Jqtkl5x8VbF5wfTqCW2fZ/+tUZGE1Kt8zglmkcNxCn
         asYh0/rHlTO7LhRcBXXXKb575v/db2ycm3AlNYWweqDEME1zjvBSkiVusCVIorYsUji0
         8NbXdux/OCQEQKrlBTcRcBxdJEHWv7pyKEcoNqxdyLZfbE/j7obx6Q+zLgezw4zwvj8O
         DiHe1OREgj184/MmIr6AzHSmbCGQWFZ6dA2pPy35XfQUE+6UUdCTuiKC3fJid2DBlTDs
         XK2lD+vXm1cmLBFHdeL9z3foL94a3Zd4i3uXK0MoydXT4UV6TXicyHH8oRXc/kpi350G
         BUGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xH/Mpwws";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z11-20020a170902834b00b0014ff2e2674bsor7156756pln.31.2022.03.01.14.00.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xH/Mpwws";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
        b=xH/MpwwsEx7tCCiXBux6CW1bncqLIT+/ndlXh6/VUdnO9JDYCi49WGBcxCb4Ff9cg9
         cGQVTbgkSMc0iGGhcaS67Z9aFwS049ZkYHV00jdjYMFHGgM3QSQRhWEGsWlYWvg/MIcj
         4KMNYt0VjSomcKespNRQxGPBwMdYR0veGZsk9DhkvLyigPTL3HRLVJDwt7uAIT6Axb9C
         VHg/4VbbbjKV+oEDi22MbAYs7hB4ND1bf82TXZtVPzOB8WRen0bdEEHJWKdAo65tQvcD
         IVNaNOlXPn9UUza3tSVBfiwaTgLDqty63Dg5D1oz/n/ecayciiC7eztu7JTiDrOpLQ/k
         I2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
        b=IqfHsMTh+6eTqCNNoBrYD1VXGwex91qAz/jfrjCX6xGzDonAbVQKlEHOQr0xa1R/Ci
         UDJ7nuskk8eEq/pVRy0o3MdFMdkTSoGAlvSOo0KRer6xbxmF8WRixbiw24OSgVzswuSQ
         9H0iy0A4t3pRPkLFZ5zUQNaZUeilMwEGS3Zgky2xxrGhQej9sxypP8sycQ2bxdelm8gE
         kV0E34lFbIX8HDl0Vzi+ojBnZBpXPOB3iBfyQO4NseReGVC7kWv11wbGHEvcTnG/Mmb4
         6/QunOdfUY4DSW2hDxGrjn83j4cCpAlFK/ZRZGELnpfbnmAoVNrMiIEMXwkTDgQjcxD0
         DIYg==
X-Gm-Message-State: AOAM530+zkq3fCc+rDA8UIPpL0ySBeejzxSLfOL/c6qNDjvKR6mn2BKt
	GLNvjzi7KP8eX3LNnx5LsP1ZLmA37FqW+KyR
X-Google-Smtp-Source: ABdhPJz1hB3YNJDKth1KuNTqtMV+kDRRoc9OVW6y+XDQNOPf/xXqE7rjPLWiYrT5ekrgRLO3vvv8QQ==
X-Received: by 2002:a17:903:24f:b0:14f:73fa:2b30 with SMTP id j15-20020a170903024f00b0014f73fa2b30mr27698588plh.174.1646172007947;
        Tue, 01 Mar 2022 14:00:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 03/18] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Tue,  1 Mar 2022 11:59:43 -1000
Message-Id: <20220301215958.157011-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: C0dPUCrd6agV

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Continue to bound in aa64_va_parameters, so that PAuth gets
    something it can use, but provide a flag for get_phys_addr_lpae
    to raise a fault.
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3f05748ea4..ef6c25d8cb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1055,6 +1055,7 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool using16k   : 1;
     bool using64k   : 1;
+    bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7bf50fdd76..dd4d95bda2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11190,8 +11190,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, max_tsz;
+    bool epd, hpd, using16k, using64k, tsz_oob;
+    int select, tsz, tbi, max_tsz, min_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11232,9 +11232,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
+    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
 
-    tsz = MIN(tsz, max_tsz);
-    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
+    if (tsz > max_tsz) {
+        tsz = max_tsz;
+        tsz_oob = true;
+    } else if (tsz < min_tsz) {
+        tsz = min_tsz;
+        tsz_oob = true;
+    } else {
+        tsz_oob = false;
+    }
 
     /* Present TBI as a composite with TBID.  */
     tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
@@ -11251,6 +11259,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .using16k = using16k,
         .using64k = using64k,
+        .tsz_oob = tsz_oob,
     };
 }
 
@@ -11374,6 +11383,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
+
+        /*
+         * If TxSZ is programmed to a value larger than the maximum,
+         * or smaller than the effective minimum, it is IMPLEMENTATION
+         * DEFINED whether we behave as if the field were programmed
+         * within bounds, or if a level 0 Translation fault is generated.
+         *
+         * With FEAT_LVA, fault on less than minimum becomes required,
+         * so our choice is to always raise the fault.
+         */
+        if (param.tsz_oob) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
-- 
2.25.1
