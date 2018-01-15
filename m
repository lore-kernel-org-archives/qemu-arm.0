Received: by 10.28.173.206 with SMTP id w197csp3096513wme;
        Mon, 15 Jan 2018 11:43:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBov9ra7uk1uK+AgfG1xTG8fqm8m8753dH1GTUXtrO6HG3T7kjNS6q4ZfDTlnK1U2vGdhb7Gz
X-Received: by 10.129.109.133 with SMTP id i127mr22833273ywc.444.1516045436362;
        Mon, 15 Jan 2018 11:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516045436; cv=none;
        d=google.com; s=arc-20160816;
        b=ukzFGC5u4v8NpcEOrg961XVf8AIDYvbR5GltS5d+pHtSwncOaEtIGFT/UqfLyp6VZl
         yuj4H7aHrcdpEYauv5wxGQ1TH1zHb8IdO4juag4CovDPKZbnducYruEwbijrbzqyz4we
         6ju84SgxLrgP74SoqHNfUGIezW3sXfMeU7nIk/Q2B9B5Z5Q6VnChRRglcf7WVGU5h9RB
         pPTcVZNEVYAGumOHpchagX5aOmcsjk40vu+802ZFYu7huZl0IictLfWNv8wMLUuy1ay5
         gkAj1eU6/U5MQfZKkhWGglyvXfhdI+cUD40TdxP5t2eujXWQa+cxABI3WClgvPCdtueV
         X6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=lSyq7DB1K8Z4KtCRzayzaZF2p0I3QteJCk8Io6RQ4e0=;
        b=RgM+e5zOobbkegYpVLz1CeEcrn0uxHeU7EFayS1AtWV8yLQvaULlKvnV5/CKdAWT8y
         Wd7sWmMn8NHxGQpVBnbDHPgrXFBxv23+cI2dXj5JDFm6r5u+vJus4VTe7FkEuUjwtgtL
         DHaccA5LibCb9v4y/Zh7bMKFZneR26gnwpJ/+i6obhqtvOJw+PFnOA05YC0klxm9YJH6
         iAZnwN4L6sYpBV3IyX2cLbsLEDYWTOFAy/iVyV6lFo9cvs+TaBEUOJ1Yyn9QXFoqJXQs
         3bycNs/WKuh2Uz0j9zTB5v1Cx1fmfS9s3B1Bx7STTQ9WB9d2F4fiUbrB/dWbX1H8B5tE
         i3wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AXUzm4mv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x127si78708ywc.696.2018.01.15.11.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 11:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AXUzm4mv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebAfj-0002Hp-Q5
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 14:43:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfP-00027K-R6
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfO-0007Li-7N
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:35 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:43860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1ebAfN-0007LS-U3
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:34 -0500
Received: by mail-wr0-x242.google.com with SMTP id s13so12887682wra.10
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lSyq7DB1K8Z4KtCRzayzaZF2p0I3QteJCk8Io6RQ4e0=;
	b=AXUzm4mvn7ivsFqS1QJlDUXqGmW3e/DtUYTUXxoHNLXTRrBCZ8t34B7R7yIrm0WkbX
	HSCm1yyaJ4ucXVSH8pRM/eQoJ52V4jpxuB0qaNigKBoW3YUoI8DkcUzcS3fz2jwXT+tA
	KvI697Z9MSHrde3PhNP++3Ibh1Pun41XnDIxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lSyq7DB1K8Z4KtCRzayzaZF2p0I3QteJCk8Io6RQ4e0=;
	b=rf/x+szAx5Qk5zEWUOB1DBsr/FAqmcFwqNjEavSXSdzQo+UcbUDxHsTYTXIgdEJn38
	XpZ4484XUuixN/J0+sk/LSUK58LRWRMzxjAxglAi301KhEMWRwSvQxifRyKCkKJVzIWq
	KVjqo1ZdtF/uHiG44paed0BLgNrBVHuPK1xzcpuJZkBEqzNnWQdd3eWiCiRNdOQ+SC2L
	C80/LVRowzJg62Exc81xS6cAv/FG6xk5Kk5iU8cOPKVGtFe8a06UoEYOnHdePu8H5e/g
	D1Fb690yNCHpt5t5Hx/I26JJebHKpYOIiUiKqL0njp/9WwrCH5SKdA/ImKfr8QH63tRl
	EytA==
X-Gm-Message-State: AKwxytczNpHh5VlWOGFfFH7uyrLesDnE9UB4aKTFAaYbqRkGSX9UC9dq
	xlPnKwSExYAnk3CI44wWsOv8+aAnTbk=
X-Received: by 10.223.201.143 with SMTP id f15mr6656648wrh.192.1516045412605; 
	Mon, 15 Jan 2018 11:43:32 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id 34sm435051wro.7.2018.01.15.11.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 11:43:31 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 19:43:19 +0000
Message-Id: <20180115194321.15411-3-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
References: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: [Qemu-arm] [PATCH v3 2/4] target/arm: implement SHA-3 instructions
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
X-TUID: Jv3nVUNoF2sC

This implements emulation of the new SHA-3 instructions that have
been added as an optional extensions to the ARMv8 Crypto Extensions
in ARM v8.2.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 target/arm/cpu.h           |   1 +
 target/arm/crypto_helper.c |  69 +++++++++++++
 target/arm/helper.h        |   5 +
 target/arm/translate-a64.c | 108 +++++++++++++++++++-
 4 files changed, 179 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 295529366c0a..8e355398e3e0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1341,6 +1341,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
     ARM_FEATURE_V8_SHA512, /* implements SHA512 part of v8 Crypto Extensions */
+    ARM_FEATURE_V8_SHA3, /* implements SHA3 part of v8 Crypto Extensions */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/crypto_helper.c b/target/arm/crypto_helper.c
index 15c22c82ca5e..b51fb0bd2897 100644
--- a/target/arm/crypto_helper.c
+++ b/target/arm/crypto_helper.c
@@ -560,3 +560,72 @@ void HELPER(crypto_sha512su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
     env->vfp.regs[rd] = make_float64(d0);
     env->vfp.regs[rd + 1] = make_float64(d1);
 }
+
+void HELPER(crypto_rax1)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                         uint32_t rm)
+{
+    uint64_t d0 = float64_val(env->vfp.regs[rd]);
+    uint64_t d1 = float64_val(env->vfp.regs[rd + 1]);
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t n1 = float64_val(env->vfp.regs[rn + 1]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d0 = n0 ^ rol64(m0, 1);
+    d1 = n1 ^ rol64(m1, 1);
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
+
+void HELPER(crypto_eor3)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                         uint32_t ra, uint32_t rm)
+{
+    uint64_t d0, d1;
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t n1 = float64_val(env->vfp.regs[rn + 1]);
+    uint64_t a0 = float64_val(env->vfp.regs[ra]);
+    uint64_t a1 = float64_val(env->vfp.regs[ra + 1]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d0 = n0 ^ a0 ^ m0;
+    d1 = n1 ^ a1 ^ m1;
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
+
+void HELPER(crypto_bcax)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                         uint32_t ra, uint32_t rm)
+{
+    uint64_t d0, d1;
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t n1 = float64_val(env->vfp.regs[rn + 1]);
+    uint64_t a0 = float64_val(env->vfp.regs[ra]);
+    uint64_t a1 = float64_val(env->vfp.regs[ra + 1]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d0 = n0 ^ (~a0 & m0);
+    d1 = n1 ^ (~a1 & m1);
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
+
+void HELPER(crypto_xar)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                        uint32_t imm6, uint32_t rm)
+{
+    uint64_t d0, d1;
+    uint64_t n0 = float64_val(env->vfp.regs[rn]);
+    uint64_t n1 = float64_val(env->vfp.regs[rn + 1]);
+    uint64_t m0 = float64_val(env->vfp.regs[rm]);
+    uint64_t m1 = float64_val(env->vfp.regs[rm + 1]);
+
+    d0 = ror64(n0 ^ m0, imm6);
+    d1 = ror64(n1 ^ m1, imm6);
+
+    env->vfp.regs[rd] = make_float64(d0);
+    env->vfp.regs[rd + 1] = make_float64(d1);
+}
diff --git a/target/arm/helper.h b/target/arm/helper.h
index efa75440ce81..2053ea10b2a5 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -539,6 +539,11 @@ DEF_HELPER_4(crypto_sha512h2, void, env, i32, i32, i32)
 DEF_HELPER_3(crypto_sha512su0, void, env, i32, i32)
 DEF_HELPER_4(crypto_sha512su1, void, env, i32, i32, i32)
 
+DEF_HELPER_4(crypto_rax1, void, env, i32, i32, i32)
+DEF_HELPER_5(crypto_eor3, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(crypto_bcax, void, env, i32, i32, i32, i32)
+DEF_HELPER_5(crypto_xar, void, env, i32, i32, i32, i32)
+
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_2(dc_zva, void, env, i64)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ec17391f4ff4..c632f584aad6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -82,6 +82,8 @@ typedef void NeonGenTwoDoubleOPFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_ptr);
 typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
 typedef void CryptoTwoOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void CryptoThreeOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void CryptoFourOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32,
+                               TCGv_i32);
 
 /* initialize TCG globals.  */
 void a64_translate_init(void)
@@ -11125,6 +11127,7 @@ static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_rm_regno;
+    int feature;
     CryptoThreeOpEnvFn *genfn;
 
     if (o != 0) {
@@ -11134,20 +11137,24 @@ static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
 
     switch (opcode) {
     case 0: /* SHA512H */
+        feature = ARM_FEATURE_V8_SHA512;
         genfn = gen_helper_crypto_sha512h;
         break;
     case 1: /* SHA512H2 */
+        feature = ARM_FEATURE_V8_SHA512;
         genfn = gen_helper_crypto_sha512h2;
         break;
     case 2: /* SHA512SU1 */
+        feature = ARM_FEATURE_V8_SHA512;
         genfn = gen_helper_crypto_sha512su1;
         break;
-    default:
-        unallocated_encoding(s);
-        return;
+    case 3: /* RAX1 */
+        feature = ARM_FEATURE_V8_SHA3;
+        genfn = gen_helper_crypto_rax1;
+        break;
     }
 
-    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA512)) {
+    if (!arm_dc_feature(s, feature)) {
         unallocated_encoding(s);
         return;
     }
@@ -11208,6 +11215,97 @@ static void disas_crypto_two_reg_sha512(DisasContext *s, uint32_t insn)
     tcg_temp_free_i32(tcg_rn_regno);
 }
 
+/* Crypto four-register
+ *  31               23 22 21 20  16 15  14  10 9    5 4    0
+ * +-------------------+-----+------+---+------+------+------+
+ * | 1 1 0 0 1 1 1 0 0 | Op0 |  Rm  | 0 |  Ra  |  Rn  |  Rd  |
+ * +-------------------+-----+------+---+------+------+------+
+ */
+static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
+{
+    int op0 = extract32(insn, 21, 2);
+    int rm = extract32(insn, 16, 5);
+    int ra = extract32(insn, 10, 5);
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_ra_regno, tcg_rm_regno;
+    int feature;
+    CryptoFourOpEnvFn *genfn;
+
+    switch (op0) {
+    case 0: /* EOR3 */
+        feature = ARM_FEATURE_V8_SHA3;
+        genfn = gen_helper_crypto_eor3;
+        break;
+    case 1: /* BCAX */
+        feature = ARM_FEATURE_V8_SHA3;
+        genfn = gen_helper_crypto_bcax;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!arm_dc_feature(s, feature)) {
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
+    tcg_ra_regno = tcg_const_i32(ra << 1);
+    tcg_rm_regno = tcg_const_i32(rm << 1);
+
+    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno, tcg_ra_regno, tcg_rm_regno);
+
+    tcg_temp_free_i32(tcg_rd_regno);
+    tcg_temp_free_i32(tcg_rn_regno);
+    tcg_temp_free_i32(tcg_ra_regno);
+    tcg_temp_free_i32(tcg_rm_regno);
+}
+
+/* Crypto XAR
+ *  31                   21 20  16 15    10 9    5 4    0
+ * +-----------------------+------+--------+------+------+
+ * | 1 1 0 0 1 1 1 0 1 0 0 |  Rm  |  imm6  |  Rn  |  Rd  |
+ * +-----------------------+------+--------+------+------+
+ */
+static void disas_crypto_xar(DisasContext *s, uint32_t insn)
+{
+    int rm = extract32(insn, 16, 5);
+    int imm6 = extract32(insn, 10, 6);
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_imm6, tcg_rm_regno;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA3)) {
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
+    tcg_imm6 = tcg_const_i32(imm6);
+    tcg_rm_regno = tcg_const_i32(rm << 1);
+
+    gen_helper_crypto_xar(cpu_env, tcg_rd_regno, tcg_rn_regno, tcg_imm6,
+                          tcg_rm_regno);
+
+    tcg_temp_free_i32(tcg_rd_regno);
+    tcg_temp_free_i32(tcg_rn_regno);
+    tcg_temp_free_i32(tcg_imm6);
+    tcg_temp_free_i32(tcg_rm_regno);
+
+}
+
 /* C3.6 Data processing - SIMD, inc Crypto
  *
  * As the decode gets a little complex we are using a table based
@@ -11239,6 +11337,8 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
     { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
     { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
+    { 0xce000000, 0xff808000, disas_crypto_four_reg },
+    { 0xce800000, 0xffe00000, disas_crypto_xar },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.11.0

