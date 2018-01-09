Received: by 10.28.173.206 with SMTP id w197csp3955698wme;
        Tue, 9 Jan 2018 09:43:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBotdG0WTc6c7r+VCE5SKBXV4dKLVaNwHIUf8Nujng421ZPAofq6yxdwTNDgugbRhprKVYhhz
X-Received: by 10.37.244.84 with SMTP id p20mr13699425ybe.52.1515519801940;
        Tue, 09 Jan 2018 09:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515519801; cv=none;
        d=google.com; s=arc-20160816;
        b=kCJ5+eY6fVz47UHD9d6EmvAL1PJkjQEPBPeyp7KJEwIONtxU9hs74F+UDn3fpj50YM
         kbRbM1VIh442NMkbP7pOCiEuRCpoTVo6IpCDAQ1ecr1UyMNJccbKKERyzJFYkYhRbuPw
         t7wg7mTNee/wHKRof6nxboEgJOEKNuKjrwN3gslqqJOzp11c2ZYcuRvs/TzExasyi2Xr
         ZKWtJP0tf87gbCybNNVTfkyraEd1rFiKRRCzig3f6FqJpGoMZ8H9FiXVsc78APU9bke4
         CgJATJlnM8qDzsE+rZP6lkf1aMWdZjHFRHLkIJqTSnSxNcEEKs0/PUpk4IE+HqpVebO/
         0pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=FrhbNW/NaP4pbA/GCmWLvksLiJfziIEeRDAl6iEY3sM=;
        b=rNhNnsqDwSfBJOsLWidMD0KPx5Fe07xtOZzcLx+6LlgVvlRDQhbOymcPfqLXTT/zbU
         a3Goc7XndJE7Mxj/D2PEjRx5uf2H46cZiMBzFPFC8VB4NQ6mCJwRe1s7pGFGydh85Ey8
         kZDhbKWpnNMbDGe3M/lec7grlJgNdJPkHAupjUWjHDegWe+4S6gqaok1UMiZuF1FL74J
         W1yDtdMKrouua3I9hWmY2187oCYtPGd22+vOVpO5ZtQm6pd1qg14igrjIUFWvc5ZRWEs
         aebigs3lSneheOT8HpTLzcUpwByZVN489oiXi+2v2SSGXjvkO52DjGuUOhn5O6cEjzi1
         Cc9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LG9pMJvS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3si3004453ywb.764.2018.01.09.09.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 09:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LG9pMJvS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYxvl-0005XL-Cx
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 12:43:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eYxu7-0004Qa-9N
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 12:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eYxu4-0003yT-3z
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 12:41:39 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:36810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eYxu3-0003xa-Px
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 12:41:36 -0500
Received: by mail-wr0-x242.google.com with SMTP id b76so14947573wrd.3
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=FrhbNW/NaP4pbA/GCmWLvksLiJfziIEeRDAl6iEY3sM=;
	b=LG9pMJvSP8ZEJh/Y5n/BKmLkWUnBV1nXR9cxikr6DaXzXwSLheNWJ9WCkTPGrwxaF2
	RcIdrN/7VYh51LsGX1+Oa2D9opY1oNRwTsc1bpuXDM1OCj1wL6Bh122Zmu94j/BMEcnj
	68UdxZPALutXvEbf1n4dLejfKgTpU7Uo3jxI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FrhbNW/NaP4pbA/GCmWLvksLiJfziIEeRDAl6iEY3sM=;
	b=NSipO0DDVTJN5GwOlbAkgmdSKD1vBtoFlzZXFmXmC6MAnpt9P5kz76X6Bbd8GiWAGL
	Y5hXoIrRrq5sSpnr7DBW0uBrzztZs8g5h0NnJdiYbyAVMYJ5p8HmU7hwC/LI8mevVxft
	TeX1CrwPmnimkfrbet8OLlUxrAxUmF4pDaqKV/WXoS71WrrX91S1a16vG6dU0wy97U3u
	QOC15CCABr8KrVaQ6HzDeksw1vkVFkUT7iprZdyFUMQi04IPRAz4WEuZHhYl1QwE33zQ
	qdtnWZ6jTWISFamdZ30hHSJ7b3JK8tYTrNagap0qlYtrYctKGpBy98duNvImE993f6+V
	YTtQ==
X-Gm-Message-State: AKGB3mJj0lIAD07jEg5T135PMyJhNA5l3qMD9Dg6VydwNCtBMXrYm2vB
	3VkP853E1HG4mALTZ/uL8HFPXdbPnGU=
X-Received: by 10.223.128.34 with SMTP id 31mr15483326wrk.248.1515519694098;
	Tue, 09 Jan 2018 09:41:34 -0800 (PST)
Received: from localhost.localdomain ([154.144.231.40])
	by smtp.gmail.com with ESMTPSA id
	u79sm15717415wma.26.2018.01.09.09.41.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jan 2018 09:41:32 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Tue,  9 Jan 2018 17:41:26 +0000
Message-Id: <20180109174126.28305-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: [Qemu-arm] [PATCH] target/arm: implement SHA-512 instructions
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
X-TUID: yjh2NI2iVJSQ

This implements emulation of the new SHA-512 instructions that have
been added as an optional extensions to the ARMv8 Crypto Extensions
in ARM v8.2.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 target/arm/cpu.h           |   1 +
 target/arm/crypto_helper.c | 136 ++++++++++++++++++++++++++++++++++++++++++++-
 target/arm/helper.h        |   5 ++
 target/arm/translate-a64.c |  82 +++++++++++++++++++++++++++
 4 files changed, 223 insertions(+), 1 deletion(-)

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
index 3b6df3f41a42..a89464f5acdc 100644
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
@@ -25,9 +25,11 @@ union CRYPTO_STATE {
 #ifdef HOST_WORDS_BIGENDIAN
 #define CR_ST_BYTE(state, i)   (state.bytes[(15 - (i)) ^ 8])
 #define CR_ST_WORD(state, i)   (state.words[(3 - (i)) ^ 2])
+#define CR_ST_QUAD(state, i)   (state.l[(i) ^ 1])
 #else
 #define CR_ST_BYTE(state, i)   (state.bytes[i])
 #define CR_ST_WORD(state, i)   (state.words[i])
+#define CR_ST_QUAD(state, i)   (state.l[i])
 #endif
 
 void HELPER(crypto_aese)(CPUARMState *env, uint32_t rd, uint32_t rm,
@@ -463,3 +465,135 @@ void HELPER(crypto_sha256su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
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
+    union CRYPTO_STATE d = { .l = {
+        float64_val(env->vfp.regs[rd]),
+        float64_val(env->vfp.regs[rd + 1])
+    } };
+    union CRYPTO_STATE n = { .l = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    } };
+    union CRYPTO_STATE m = { .l = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    } };
+    uint64_t t;
+
+    t = CR_ST_QUAD(m, 1);
+    CR_ST_QUAD(d, 1) += S1_512(t) + cho512(t, CR_ST_QUAD(n, 0),
+                                           CR_ST_QUAD(n, 1));
+
+    t = CR_ST_QUAD(d, 1) + CR_ST_QUAD(m, 0);
+    CR_ST_QUAD(d, 0) += S1_512(t) + cho512(t, CR_ST_QUAD(m, 1),
+                                           CR_ST_QUAD(n, 0));
+
+    env->vfp.regs[rd] = make_float64(d.l[0]);
+    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+}
+
+void HELPER(crypto_sha512h2)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                             uint32_t rm)
+{
+    union CRYPTO_STATE d = { .l = {
+        float64_val(env->vfp.regs[rd]),
+        float64_val(env->vfp.regs[rd + 1])
+    } };
+    union CRYPTO_STATE n = { .l = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    } };
+    union CRYPTO_STATE m = { .l = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    } };
+
+    CR_ST_QUAD(d, 1) += S0_512(CR_ST_QUAD(m, 0)) + maj512(CR_ST_QUAD(n, 0),
+                                                          CR_ST_QUAD(m, 1),
+                                                          CR_ST_QUAD(m, 0));
+
+    CR_ST_QUAD(d, 0) += S0_512(CR_ST_QUAD(d, 1)) + maj512(CR_ST_QUAD(d, 1),
+                                                          CR_ST_QUAD(m, 0),
+                                                          CR_ST_QUAD(m, 1));
+
+    env->vfp.regs[rd] = make_float64(d.l[0]);
+    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+}
+
+void HELPER(crypto_sha512su0)(CPUARMState *env, uint32_t rd, uint32_t rn)
+{
+    union CRYPTO_STATE d = { .l = {
+        float64_val(env->vfp.regs[rd]),
+        float64_val(env->vfp.regs[rd + 1])
+    } };
+    union CRYPTO_STATE n = { .l = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    } };
+
+    CR_ST_QUAD(d, 0) += s0_512(CR_ST_QUAD(d, 1));
+    CR_ST_QUAD(d, 1) += s0_512(CR_ST_QUAD(n, 0));
+
+    env->vfp.regs[rd] = make_float64(d.l[0]);
+    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
+}
+
+void HELPER(crypto_sha512su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                              uint32_t rm)
+{
+    uint64_t d[2] = {
+        float64_val(env->vfp.regs[rd]),
+        float64_val(env->vfp.regs[rd + 1])
+    };
+    uint64_t n[2] = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    };
+    uint64_t m[2] = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    };
+
+    d[0] += s1_512(n[0]) + m[0];
+    d[1] += s1_512(n[1]) + m[1];
+
+    env->vfp.regs[rd] = make_float64(d[0]);
+    env->vfp.regs[rd + 1] = make_float64(d[1]);
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
index ba94f7d0456a..543c41d1fa45 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11111,6 +11111,86 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
     tcg_temp_free_i32(tcg_rn_regno);
 }
 
+/* Crypto three-reg SHA512
+ *  31                   21 20  16 15     12  11  10  9    5 4    0
+ * +-----------------------+------+---------+--------+------+------+
+ * | 1 1 0 0 1 1 1 0 0 1 1 |  Rm  | 1 0 0 0 | opcode |  Rn  |  Rd  |
+ * +-----------------------+------+---------+--------+------+------+
+ */
+static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
+{
+    int opcode = extract32(insn, 10, 2);
+    int rm = extract32(insn, 16, 5);
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_rm_regno;
+    CryptoThreeOpEnvFn *genfn;
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
+ *  31                                     10 9    5 4    0
+ * +-----------------------------------------+------+------+
+ * | 1 1 0 0 1 1 1 0 1 1 0 0 0 0 0 0 1 0 0 0 |  Rn  |  Rd  |
+ * +-----------------------------------------+------+------+
+ */
+static void disas_crypto_two_reg_sha512(DisasContext *s, uint32_t insn)
+{
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    TCGv_i32 tcg_rd_regno, tcg_rn_regno;
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
+    gen_helper_crypto_sha512su0(cpu_env, tcg_rd_regno, tcg_rn_regno);
+
+    tcg_temp_free_i32(tcg_rd_regno);
+    tcg_temp_free_i32(tcg_rn_regno);
+}
+
 /* C3.6 Data processing - SIMD, inc Crypto
  *
  * As the decode gets a little complex we are using a table based
@@ -11140,6 +11220,8 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x4e280800, 0xff3e0c00, disas_crypto_aes },
     { 0x5e000000, 0xff208c00, disas_crypto_three_reg_sha },
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
+    { 0xce608000, 0xffe0f000, disas_crypto_three_reg_sha512 },
+    { 0xcec08000, 0xfffffc00, disas_crypto_two_reg_sha512 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.11.0

