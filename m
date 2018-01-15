Received: by 10.28.173.206 with SMTP id w197csp2679829wme;
        Mon, 15 Jan 2018 04:46:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBouQaPqigJfgXdzSDtfHRF5TJoLPefGzGOOoJMhagKfd3VA/dhlD5gBJ5ZeLGxje2lUjGOlW
X-Received: by 10.129.109.133 with SMTP id i127mr21691733ywc.444.1516020376270;
        Mon, 15 Jan 2018 04:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516020376; cv=none;
        d=google.com; s=arc-20160816;
        b=q2VVZ9gtAPEcEcmvQFEo/Gt2drDf5LrJXDfNyn9G5t6/LUExUxqLqJnwR7uEgcOsDz
         pf/SnGtN2Cu6v4J7Emav4JGP8WWvYHGDMcayNii0REbPcpV7ZW/UEQJWXCnG/aQNPOcF
         Gqy9an+oZ5UXPn775uZZg4AbgwTp85UMucYsRvl8dbJ5EInHOGWIISfUj+I9hW+LH9Gg
         on9d/FUuiXSdwlch88ft2Lv6/YYZN9hBPJqO/QTw7Pyih2othYeGEwVlUaPliRod6JoD
         0/hF2gM8nJNQ6vFXMDJX3FLc2RR3NyaXc/e8CN9fxjaRYl4ZhNdIFpOnYTaNrvjX3zSd
         dWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6gIrZas7Ynnq0ioYKMHhGI+vDSbmgmUUTW6Vry/ZJKs=;
        b=foJX/ZtzZOddg+hpB7Mjv77Gv4ttWXTgpKs91TKvns9h74Skgxd+46B9A/f2LmKqbc
         nKx9uj4uZ1KahoCfbZelNmQARPmzyc/wSVBEVsHpqA260xopbjQmZptTAUf6eAT9RLHf
         iUvtDwu3a3Sp+9c2VRZYKNyHEjLcvA+bTc6r3jlAie6Q/mtdpUqwRsPQn7cc3sbuJBzd
         xRvlfDLqKgJzoeYfEf6IBRy6mOcVUGZTPWNGSBdq5ihATp0NMB8qE0s/+hwx2auwJ5Gv
         dXp6JQJASNrRfvpsDIM2n6qiJwmBiqyCWS4SknRb9PTuLqhk3Gch/weeHHHu2OTduJ4a
         WVIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PdW6bJkv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i12si5932158ybl.640.2018.01.15.04.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 04:46:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PdW6bJkv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb49X-0007I5-Om
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 07:46:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb49K-0007GP-2s
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb49I-0002B6-Fa
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:02 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:44954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eb49I-0002Ab-6N
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:00 -0500
Received: by mail-wr0-x244.google.com with SMTP id w50so11499684wrc.11
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 04:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6gIrZas7Ynnq0ioYKMHhGI+vDSbmgmUUTW6Vry/ZJKs=;
	b=PdW6bJkvBJ7/hFVfZnnWrsP64NNAR8P/MTVlLe4FyoAiFuDky8DM3xGqkdL5CgpcSO
	jtfOBhtD6yLEi3j/XcIMwsnkiOi+duLy2uXC2KBMI/hkYwKTHT9wA97RN1uiVrhPH7EE
	s1HzmUXBx5Kg52TXrCl50+u9KHGMSL6OhPwss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6gIrZas7Ynnq0ioYKMHhGI+vDSbmgmUUTW6Vry/ZJKs=;
	b=oLmBU7hrai+fhFsIUtM+5X+228oyxYuAjYC5Yu6eluzkuiQkTD1OUiTds/S3G0ZPMg
	HQ2nHSgpClu361790pq5v0biBjbzzalRWxV2CF+ht0P1unuroSPHzykYo/ZDXcnSivu2
	3PR25HtADXhJvhm2WBvqq60NrmTsuJxP5kZ/QPVUTW//gOETGQi5vaA2FUsKhHD7LbXw
	Tc4i0fcks/HiBolLw+Qpdn91RksMZYSpX4kMPD8CsMdRfp8DmkQevlNldzWFz/l3ZAIy
	8SrBKa0yFanZYPZnZ6s8J7F+zfrmXs9dJcOi6PtwLayJ584KpB9Hh712I6gcdf0U8VuJ
	49JQ==
X-Gm-Message-State: AKwxyteB32L1pZsLY2tFPn4HXU3isxvkdHOdlutU+VL+X/rlioGvff1A
	mMGaPCqkDaS+bSeYthFTLdJHmbE4uwQ=
X-Received: by 10.223.164.4 with SMTP id d4mr8741070wra.49.1516020358759;
	Mon, 15 Jan 2018 04:45:58 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id
	i71sm16816701wmd.1.2018.01.15.04.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 04:45:58 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 12:45:45 +0000
Message-Id: <20180115124546.7253-3-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180115124546.7253-1-ard.biesheuvel@linaro.org>
References: <20180115124546.7253-1-ard.biesheuvel@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-arm] [PATCH v2 2/3] target/arm: implement SHA-3 instructions
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
X-TUID: IrCXWCp2Vx3Z

This implements emulation of the new SHA-3 instructions that have
been added as an optional extensions to the ARMv8 Crypto Extensions
in ARM v8.2.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 target/arm/cpu.h           |   1 +
 target/arm/crypto_helper.c |  88 ++++++++++++++++
 target/arm/helper.h        |   5 +
 target/arm/translate-a64.c | 105 +++++++++++++++++++-
 4 files changed, 198 insertions(+), 1 deletion(-)

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
index a89464f5acdc..432d36dd3c25 100644
--- a/target/arm/crypto_helper.c
+++ b/target/arm/crypto_helper.c
@@ -597,3 +597,91 @@ void HELPER(crypto_sha512su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
     env->vfp.regs[rd] = make_float64(d[0]);
     env->vfp.regs[rd + 1] = make_float64(d[1]);
 }
+
+void HELPER(crypto_rax1)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                         uint32_t rm)
+{
+    uint64_t d[2];
+    uint64_t n[2] = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    };
+    uint64_t m[2] = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    };
+
+    d[0] = n[0] ^ rol64(m[0], 1);
+    d[1] = n[1] ^ rol64(m[1], 1);
+
+    env->vfp.regs[rd] = make_float64(d[0]);
+    env->vfp.regs[rd + 1] = make_float64(d[1]);
+}
+
+void HELPER(crypto_eor3)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                         uint32_t ra, uint32_t rm)
+{
+    uint64_t d[2];
+    uint64_t n[2] = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    };
+    uint64_t a[2] = {
+        float64_val(env->vfp.regs[ra]),
+        float64_val(env->vfp.regs[ra + 1])
+    };
+    uint64_t m[2] = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    };
+
+    d[0] = n[0] ^ a[0] ^ m[0];
+    d[1] = n[1] ^ a[1] ^ m[1];
+
+    env->vfp.regs[rd] = make_float64(d[0]);
+    env->vfp.regs[rd + 1] = make_float64(d[1]);
+}
+
+void HELPER(crypto_bcax)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                         uint32_t ra, uint32_t rm)
+{
+    uint64_t d[2];
+    uint64_t n[2] = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    };
+    uint64_t a[2] = {
+        float64_val(env->vfp.regs[ra]),
+        float64_val(env->vfp.regs[ra + 1])
+    };
+    uint64_t m[2] = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    };
+
+    d[0] = n[0] ^ (~a[0] & m[0]);
+    d[1] = n[1] ^ (~a[1] & m[1]);
+
+    env->vfp.regs[rd] = make_float64(d[0]);
+    env->vfp.regs[rd + 1] = make_float64(d[1]);
+}
+
+void HELPER(crypto_xar)(CPUARMState *env, uint32_t rd, uint32_t rn,
+                        uint32_t imm6, uint32_t rm)
+{
+    uint64_t d[2];
+    uint64_t n[2] = {
+        float64_val(env->vfp.regs[rn]),
+        float64_val(env->vfp.regs[rn + 1])
+    };
+    uint64_t m[2] = {
+        float64_val(env->vfp.regs[rm]),
+        float64_val(env->vfp.regs[rm + 1])
+    };
+
+    d[0] = ror64(n[0] ^ m[0], imm6);
+    d[1] = ror64(n[1] ^ m[1], imm6);
+
+    env->vfp.regs[rd] = make_float64(d[0]);
+    env->vfp.regs[rd + 1] = make_float64(d[1]);
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
index ec17391f4ff4..aa2669419766 100644
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
@@ -11134,20 +11137,27 @@ static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
 
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
+    case 3: /* RAX1 */
+        feature = ARM_FEATURE_V8_SHA3;
+        genfn = gen_helper_crypto_rax1;
+        break;
     default:
         unallocated_encoding(s);
         return;
     }
 
-    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA512)) {
+    if (!arm_dc_feature(s, feature)) {
         unallocated_encoding(s);
         return;
     }
@@ -11208,6 +11218,97 @@ static void disas_crypto_two_reg_sha512(DisasContext *s, uint32_t insn)
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
@@ -11239,6 +11340,8 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
     { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
     { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
+    { 0xce000000, 0xff808000, disas_crypto_four_reg },
+    { 0xce800000, 0xffe00000, disas_crypto_xar },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.11.0

