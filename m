Received: by 10.28.173.206 with SMTP id w197csp3096437wme;
        Mon, 15 Jan 2018 11:43:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBot7hzm0m7RGHjDhDy1BMBYry6GsLkfEKo87otHMg4HpPOCTnuGFBtNENLMwanmwAcExnxhk
X-Received: by 10.37.234.67 with SMTP id o3mr32657165ybe.478.1516045430784;
        Mon, 15 Jan 2018 11:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516045430; cv=none;
        d=google.com; s=arc-20160816;
        b=r39p3X2gHY9UAXaO1xhrg8fi6UuukVNBwznJeStU0m9MBcjOs//ksdZOg0Vw3gkHaH
         vHoAeS2aG2DTsfSl1XDO+ck8F1KApPvfeRLsEo0VeoR3g8TW0jdq0+mK6FKDgH1/Ln2j
         qNgYXZK2Kcc+mqvwxoeyJD/jR1cTDLoAvW6jqg6lzs9ndvy0N/PQPa3gcv26hdD0fujB
         wx3Dp0h6eYCQJ8BbpBONd5bnXM2Hpe564qtk2fpSxdIWRk0LmQ96gNXv3+3JA6ZMHYdo
         9oNy7BepKW9AQm3qUeh1H0pSyC0Rx8cbJzNGzmqae+/emmFRMjuJP/xX7pHIegom9vu0
         dQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qBZt09cinziBTShs18kNmYFdShTC00QvYSjBfY2rS7w=;
        b=pW2RSnSri6BEiJQzPMEraVp+YGY9HIvXkqvPgsRsHmRAplvWyAGcx1TsnU8oXRMMto
         X6RYUUWYseYlUQZs39dxd1nZfs8c58VmUID6CC9eZ0WFt0WUs8YhTS+YWOEMf3Z9qhC6
         u/BPNxgqa/zHHKN7d0Qn2ejZI8Q0gUacMNpggZfpidNZxvvpjjoli2GGgQT66zjaYRjI
         oXn/DtP128/f9iXpOFWFaQRrYaxB0/XQHKgKbBJbWWv5ORx36zE65UOoT4hz1RZ3+o4D
         wozVlXOETp2BMqoE2W6AsEqN4sA2SPOc3D28ThStOCkEgxoRp2MmI7SyPVxWPAVDME1D
         BOGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C0HLgOCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b19si79909ybg.426.2018.01.15.11.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 11:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C0HLgOCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebAfe-0002Au-4i
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 14:43:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfO-00026L-BI
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfM-0007L9-6e
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:34 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:37776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1ebAfL-0007KW-Su
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:32 -0500
Received: by mail-wr0-x243.google.com with SMTP id f11so2408927wre.4
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 11:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qBZt09cinziBTShs18kNmYFdShTC00QvYSjBfY2rS7w=;
	b=C0HLgOCEQG3dpYR7ciOLUADx1j8sBA7S+8V8DSieUmYqcUFl9tELGRWZD3XxzdPhWP
	LHuZDdOsTTWvBuIViUD5cDr36JjJ3fsH81a5tOP+guqHBF4jsvgvd58l8r85xONRnexH
	5m5wygo4ybv5krvwMo5MV3P2s8pi/YECt9U3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qBZt09cinziBTShs18kNmYFdShTC00QvYSjBfY2rS7w=;
	b=R6RFMtwcdWUTUQ7+/z3PCb36FoLg2Npg2C37dPZ6fVjcneYJ8eNHPWZcve7R8PUdj5
	90mwtPE3HUh4TWFaXsCV8+IjBVFQ9tKrZSMGG62s+R4MgigYZ0/DPiMySugH2Zq8UXGM
	hsdyceqx2vWDgqn62CsyQmoj6QllqfTd0uaBmCESCRDo4LT5rJnP4MwOXRp2nyDh1DdF
	xU/3lB6YubUGFHJxniZIkdZ+3ikbrK4ZzGnFYdBvuG8L6KtVt0kTfqPhxvBIZVfuXdzp
	kWbi+pfOIDbyGXtAxVzbZB34d+z6rUB36Gz90mVWWwNBS4JZg7CZMdfyizeom7I7L2rx
	Qd0g==
X-Gm-Message-State: AKGB3mLn3rX+UzlcgJig8BMAkorTxotwsQwZC8NDjHZHrSYB0QyETLUg
	tvYbv3V7aZqjoAjvxU3irSximtnGUnA=
X-Received: by 10.223.176.173 with SMTP id i42mr29971208wra.47.1516045410512; 
	Mon, 15 Jan 2018 11:43:30 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id 34sm435051wro.7.2018.01.15.11.43.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 11:43:29 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 19:43:18 +0000
Message-Id: <20180115194321.15411-2-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
References: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: [Qemu-arm] [PATCH v3 1/4] target/arm: implement SHA-512 instructions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KeJsPrvyAY0a

This implements emulation of the new SHA-512 instructions that have
been added as an optional extensions to the ARMv8 Crypto Extensions
in ARM v8.2.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/crypto_helper.c | 99 +++++++++++++++++++-
 target/arm/helper.h        |  5 +
 target/arm/translate-a64.c | 99 ++++++++++++++++++++
 4 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 96316700dd6f..295529366c0a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1340,6 +1340,7 @@ enum arm_features {
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
+    ARM_FEATURE_V8_SHA512, /* implements SHA512 part of v8 Crypto Extensions */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/crypto_helper.c b/target/arm/crypto_helper.c
index 3b6df3f41a42..15c22c82ca5e 100644
--- a/target/arm/crypto_helper.c
+++ b/target/arm/crypto_helper.c
@@ -1,7 +1,7 @@
 /*
  * crypto_helper.c - emulate v8 Crypto Extensions instructions
  *
- * Copyright (C) 2013 - 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2013 - 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -463,3 +463,100 @@ void HELPER(crypto_sha256su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
     env->vfp.regs[rd] = make_float64(d.l[0]);
     env->vfp.regs[rd + 1] = make_float64(d.l[1]);
 }
+
+/*
+ * The SHA-512 logical functions (same as above but using 64-bit operands)
+ */
+
+static uint64_t cho512(uint64_t x, uint64_t y, uint64_t z)
+{
+    return (x & (y ^ z)) ^ z;
+}
+
+static uint64_t maj512(uint64_t x, uint64_t y, uint64_t z)
+{
+    return (x & y) | ((x | y) & z);
+}
+
+static uint64_t S0_512(uint64_t x)
+{
+    return ror64(x, 28) ^ ror64(x, 34) ^ ror64(x, 39);
+}
+
+static uint64_t S1_512(uint64_t x)
+{
+    return ror64(x, 14) ^ ror64(x, 18) ^ ror64(x, 41);
+}
+
+static uint64_t s0_512(uint64_t x)
+{
+    return ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7);
+}
+
+static uint64_t s1_512(uint64_t x)
+{
+    return ror64(x, 19) ^ ror64(x, 61) ^ (x >> 6);
+}
+
+void HELPER(crypto_sha512h)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                            uint32_t rm)
+{
+    uint64_t d0 = float64_val(env->vfp.regs[rd]);
+    uint64_t d1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t n1 = float64_val(env->vfp.regs[rn + 1]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d1 += S1_512(m1) + cho512(m1, n0, n1);
+    d0 += S1_512(d1 + m0) + cho512(d1 + m0, m1, n0);
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
+
+void HELPER(crypto_sha512h2)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                             uint32_t rm)
+{
+    uint64_t d0 = float64_val(env->vfp.regs[rd]);
+    uint64_t d1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d1 += S0_512(m0) + maj512(n0, m1, m0);
+    d0 += S0_512(d1) + maj512(d1, m0, m1);
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
+
+void HELPER(crypto_sha512su0)(CPUARMState *env, uint32_t rd, uint32_t rn)
+{
+    uint64_t d0 = float64_val(env->vfp.regs[rd]);
+    uint64_t d1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+
+    d0 += s0_512(d1);
+    d1 += s0_512(n0);
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
+
+void HELPER(crypto_sha512su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                              uint32_t rm)
+{
+    uint64_t d0 = float64_val(env->vfp.regs[rd]);
+    uint64_t d1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t n1 = float64_val(env->vfp.regs[rn + 1]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d0 += s1_512(n0) + m0;
+    d1 += s1_512(n1) + m1;
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 066729e8ad8e..efa75440ce81 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -534,6 +534,11 @@ DEF_HELPER_4(crypto_sha256h2, void, env, i32, i32, i32)
 DEF_HELPER_3(crypto_sha256su0, void, env, i32, i32)
 DEF_HELPER_4(crypto_sha256su1, void, env, i32, i32, i32)
 
+DEF_HELPER_4(crypto_sha512h, void, env, i32, i32, i32)
+DEF_HELPER_4(crypto_sha512h2, void, env, i32, i32, i32)
+DEF_HELPER_3(crypto_sha512su0, void, env, i32, i32)
+DEF_HELPER_4(crypto_sha512su1, void, env, i32, i32, i32)
+
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_2(dc_zva, void, env, i64)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ba94f7d0456a..ec17391f4ff4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11111,6 +11111,103 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
     tcg_temp_free_i32(tcg_rn_regno);
 }
 
+/* Crypto three-reg SHA512
+ *  31                   21 20  16 15  14  13 12  11  10  9    5 4    0
+ * +-----------------------+------+---+---+-----+--------+------+------+
+ * | 1 1 0 0 1 1 1 0 0 1 1 |  Rm  | 1 | O | 0 0 | opcode |  Rn  |  Rd  |
+ * +-----------------------+------+---+---+-----+--------+------+------+
+ */
+static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
+{
+    int opcode = extract32(insn, 10, 2);
+    int o =  extract32(insn, 14, 1);
+    int rm = extract32(insn, 16, 5);
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_rm_regno;
+    CryptoThreeOpEnvFn *genfn;
+
+    if (o != 0) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (opcode) {
+    case 0: /* SHA512H */
+        genfn = gen_helper_crypto_sha512h;
+        break;
+    case 1: /* SHA512H2 */
+        genfn = gen_helper_crypto_sha512h2;
+        break;
+    case 2: /* SHA512SU1 */
+        genfn = gen_helper_crypto_sha512su1;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA512)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    tcg_rd_regno = tcg_const_i32(rd << 1);
+    tcg_rn_regno = tcg_const_i32(rn << 1);
+    tcg_rm_regno = tcg_const_i32(rm << 1);
+
+    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno, tcg_rm_regno);
+
+    tcg_temp_free_i32(tcg_rd_regno);
+    tcg_temp_free_i32(tcg_rn_regno);
+    tcg_temp_free_i32(tcg_rm_regno);
+}
+
+/* Crypto two-reg SHA512
+ *  31                                     12  11  10  9    5 4    0
+ * +-----------------------------------------+--------+------+------+
+ * | 1 1 0 0 1 1 1 0 1 1 0 0 0 0 0 0 1 0 0 0 | opcode |  Rn  |  Rd  |
+ * +-----------------------------------------+--------+------+------+
+ */
+static void disas_crypto_two_reg_sha512(DisasContext *s, uint32_t insn)
+{
+    int opcode = extract32(insn, 10, 2);
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    TCGv_i32 tcg_rd_regno, tcg_rn_regno;
+    CryptoTwoOpEnvFn *genfn;
+
+    switch (opcode) {
+    case 0: /* SHA512SU0 */
+        genfn = gen_helper_crypto_sha512su0;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA512)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    tcg_rd_regno = tcg_const_i32(rd << 1);
+    tcg_rn_regno = tcg_const_i32(rn << 1);
+
+    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno);
+
+    tcg_temp_free_i32(tcg_rd_regno);
+    tcg_temp_free_i32(tcg_rn_regno);
+}
+
 /* C3.6 Data processing - SIMD, inc Crypto
  *
  * As the decode gets a little complex we are using a table based
@@ -11140,6 +11237,8 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x4e280800, 0xff3e0c00, disas_crypto_aes },
     { 0x5e000000, 0xff208c00, disas_crypto_three_reg_sha },
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
+    { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
+    { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.11.0

