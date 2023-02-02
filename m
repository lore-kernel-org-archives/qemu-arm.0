Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp166210ejb;
        Wed, 1 Feb 2023 23:54:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+kNwwuO3NliWs1yGn9b6kopT8x6YAE7huhgnQXov6wrJslpxDLiTwsC+hqd+NHGF2sDut1
X-Received: by 2002:a05:6214:713:b0:537:6d82:62b7 with SMTP id c19-20020a056214071300b005376d8262b7mr6990394qvz.5.1675324439852;
        Wed, 01 Feb 2023 23:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675324439; cv=none;
        d=google.com; s=arc-20160816;
        b=HuM5R5q4ISzxtGUZzpSWZPnt1kd7TdKUipR+YE5YQJ2M0F2U88pGI1me75stgts63t
         /fLEMQsxat2Oeoi8CIdyODN6yiF+T33LvIH3pUxYoEuV3pcNYyOMTFcPkhO8iqDxnAAm
         5kupRcyqChQGD6YACKXh/W0z9QxRAwp9jmF5qp7rlxkQwt1JiTh2jtdoWyxWa5Tc8gTS
         QMNHh3acA4tUArrqageosIJYPsvjJYnoVmEZOGAOGHG9aYun055gmJD1khdAObECQ9M1
         /rNdeYTSF8rr+nS/KWatasS2o5Bodw4sHoLNcYoGH3g/SL2W4UqSwrLonKJRKsUEQHgF
         Rovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1O0ziB85LBzYVmooOntlkw3VruZivPb8RVxaGoqtzSU=;
        b=qrESVnlK4hSndoo0+59Q3UeqjwzKxm1NTeC6hiK4GsKyOHhGqDixOrM18Cp6euA9hG
         1k4nxvXH+16dKFzKBKwChtmRJqDlWEjoDT8dUnN3FrhSKyBe1Y55dol/+8UtGx2aTq39
         k2uC3SyAvhwTHmITNLHGL5sPO8QC2Gz51GrclWl1nOMF0KPW/oPdVRDO9u7VmrPhzYRX
         vl79M4TfKfiIWyHrYJdA9VA3hpnmIkVZ4TLqde6GnANPJGVzDn93Pg4lZgnlQueiCDiW
         AGqLSerHdXO5lwpoVLl6elfEORYIzLXZkRl044UGkPeqSULYo5E5GfUWE+DA6qTSWwBZ
         ztAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbZv6cFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020ad45761000000b005348ef6ed16si12735264qvx.301.2023.02.01.23.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Feb 2023 23:53:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbZv6cFa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNUOu-0001PC-8w; Thu, 02 Feb 2023 02:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOs-0001OM-PG
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 02:52:54 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOq-0007js-O6
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 02:52:54 -0500
Received: by mail-pl1-x631.google.com with SMTP id jh15so1034721plb.8
 for <qemu-arm@nongnu.org>; Wed, 01 Feb 2023 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1O0ziB85LBzYVmooOntlkw3VruZivPb8RVxaGoqtzSU=;
 b=QbZv6cFa4RRZ/iw1HYt34ZWnLrRSszn6eqr0G3yv+K7NJwBsGmx8LZ90E5Svu/CaRM
 JKEmw0IremuQrAJF6CJyg8ygHCBVYAAJPCee1kpjemOgdVS3ZtvEd3Xys9vxFc3W9vJI
 KHZozAYgINtl+Lq2Wvsj2lPLCiFzuSiO5KHvHBIa6UL76ze87gZVn0fCiPfH/qj4DTlc
 W1s8auhIcP9lEXzRCzJewhxlgCj/Af4DEYDQGHwkExExRQC9rvf7LGJXfuFWzwmr2Fe9
 TQbqd6hNH2EhmrNp6JMb/t9PIrZDjH4601nJ5N/5icPH4FdI5pRSm7IAmWIWifNd1juS
 LhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1O0ziB85LBzYVmooOntlkw3VruZivPb8RVxaGoqtzSU=;
 b=M+srZR9EMPE9R8nU+ESPOIFXDsLdlHJ0aYgnfhUMCDjhT4eX0oo2Qgf4wGYwXHjCes
 1WTkC2JKmSNpdkquSlP4h9Ssadmsdig/zV6pQ5r+HZWUd/H2vAwfY9A6gdcty8nZ08BB
 lDU3Kb0JP4cmfqG5yW+9NpRD3C0pgqVAvpcboBSJKkQBKUtRsTg/RDQ1rijoFCptyDOi
 rGWmZaKRwCz007/JzQJxpVXIr7YQkhBKcb/Se8a6ZQMbcSkXPFiy2XQtUxK0XehJm+/o
 hYYQKEc24Xq3p47B2drcU7X/a1cluiihp6JeSuO5oe9MNMLznxDcmyb25RER5wRdl7dn
 cq5Q==
X-Gm-Message-State: AO0yUKXsob1Yd/LIwUZPTZhzz010rNnvXsvVoKK+Z8Gh0TynvUqokBve
 idGW5LUYRBeynoO2xU7a4cUrlg==
X-Received: by 2002:a17:90b:1651:b0:22c:5cd:2672 with SMTP id
 il17-20020a17090b165100b0022c05cd2672mr5184144pjb.34.1675324370850; 
 Wed, 01 Feb 2023 23:52:50 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a7ac400b0022c35afad5bsm2496763pjl.16.2023.02.01.23.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 23:52:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/4] target/arm: Store tbi for both insns and data in
 ARMVAParameters
Date: Wed,  1 Feb 2023 21:52:40 -1000
Message-Id: <20230202075242.260793-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
References: <20230202075242.260793-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: maU4zdrbZ5/u

This is slightly more work on the consumer side, but means
we will be able to compute this once for multiple uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    |  5 +++--
 target/arm/helper.c       | 18 +++++++++---------
 target/arm/pauth_helper.c | 29 ++++++++++++++++-------------
 target/arm/ptw.c          |  6 +++---
 4 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9555309df..73b37478bf 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1072,7 +1072,8 @@ typedef struct ARMVAParameters {
     unsigned ps     : 3;
     unsigned sh     : 2;
     unsigned select : 1;
-    bool tbi        : 1;
+    bool tbid       : 1;  /* final TBI for data, not the TBID field */
+    bool tbii       : 1;  /* final TBI for insns */
     bool epd        : 1;
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
@@ -1083,7 +1084,7 @@ typedef struct ARMVAParameters {
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data);
+                                   ARMMMUIdx mmu_idx);
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ad9a667f1..fda0b9da75 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4874,7 +4874,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     unsigned int page_size_granule, page_shift, num, scale, exponent;
     /* Extract one bit to represent the va selector in use. */
     uint64_t select = sextract64(value, 36, 1);
-    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
+    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx);
     TLBIRange ret = { };
     ARMGranuleSize gran;
 
@@ -11040,11 +11040,11 @@ static ARMGranuleSize sanitize_gran_size(ARMCPU *cpu, ARMGranuleSize gran,
 }
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data)
+                                   ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd;
-    int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
+    int select, tsz, tbii, tbid, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
     bool stage2 = regime_is_stage2(mmu_idx);
@@ -11147,18 +11147,18 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     }
 
     /* Present TBI as a composite with TBID.  */
-    tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-    if (!data) {
-        tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
-    }
-    tbi = (tbi >> select) & 1;
+    tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
+    tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
+    tbid = (tbid >> select) & 1;
+    tbii = (tbii >> select) & 1;
 
     return (ARMVAParameters) {
         .tsz = tsz,
         .ps = ps,
         .sh = sh,
         .select = select,
-        .tbi = tbi,
+        .tbid = tbid,
+        .tbii = tbii,
         .epd = epd,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index d0483bf051..bfed6f9722 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -293,19 +293,20 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx);
     uint64_t pac, ext_ptr, ext, test;
     int bot_bit, top_bit;
+    bool tbi = data ? param.tbid : param.tbii;
 
     /* If tagged pointers are in use, use ptr<55>, otherwise ptr<63>.  */
-    if (param.tbi) {
+    if (tbi) {
         ext = sextract64(ptr, 55, 1);
     } else {
         ext = sextract64(ptr, 63, 1);
     }
 
     /* Build a pointer with known good extension bits.  */
-    top_bit = 64 - 8 * param.tbi;
+    top_bit = 64 - 8 * tbi;
     bot_bit = 64 - param.tsz;
     ext_ptr = deposit64(ptr, bot_bit, top_bit - bot_bit, ext);
 
@@ -328,7 +329,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      * Preserve the determination between upper and lower at bit 55,
      * and insert pointer authentication code.
      */
-    if (param.tbi) {
+    if (tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
     } else {
@@ -339,12 +340,12 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+static uint64_t pauth_original_ptr(uint64_t ptr, int tsz, bool tbi)
 {
     /* Note that bit 55 is used whether or not the regime has 2 ranges. */
     uint64_t extfield = sextract64(ptr, 55, 1);
-    int bot_pac_bit = 64 - param.tsz;
-    int top_pac_bit = 64 - 8 * param.tbi;
+    int bot_pac_bit = 64 - tsz;
+    int top_pac_bit = 64 - 8 * tbi;
 
     return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
 }
@@ -353,19 +354,20 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx);
+    bool tbi = data ? param.tbid : param.tbii;
     int bot_bit, top_bit;
     uint64_t pac, orig_ptr, test;
 
-    orig_ptr = pauth_original_ptr(ptr, param);
+    orig_ptr = pauth_original_ptr(ptr, param.tsz, tbi);
     pac = pauth_computepac(env, orig_ptr, modifier, *key);
     bot_bit = 64 - param.tsz;
-    top_bit = 64 - 8 * param.tbi;
+    top_bit = 64 - 8 * tbi;
 
     test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
     if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
         int error_code = (keynumber << 1) | (keynumber ^ 1);
-        if (param.tbi) {
+        if (tbi) {
             return deposit64(orig_ptr, 53, 2, error_code);
         } else {
             return deposit64(orig_ptr, 61, 2, error_code);
@@ -377,9 +379,10 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
 static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx);
+    bool tbi = data ? param.tbid : param.tbii;
 
-    return pauth_original_ptr(ptr, param);
+    return pauth_original_ptr(ptr, param.tsz, tbi);
 }
 
 static G_NORETURN
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 57f3615a66..a19d714985 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1193,8 +1193,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     if (aarch64) {
         int ps;
 
-        param = aa64_va_parameters(env, address, mmu_idx,
-                                   access_type != MMU_INST_FETCH);
+        param = aa64_va_parameters(env, address, mmu_idx);
         level = 0;
 
         /*
@@ -1210,7 +1209,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             goto do_translation_fault;
         }
 
-        addrsize = 64 - 8 * param.tbi;
+        addrsize = access_type == MMU_INST_FETCH ? param.tbii : param.tbid;
+        addrsize = 64 - 8 * addrsize;
         inputsize = 64 - param.tsz;
 
         /*
-- 
2.34.1

