Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp209315wme;
        Wed, 16 May 2018 15:42:15 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoQNGA5cNyLcqs3uj/XCf0bbzxX6dr4TWvI0r2r7pya5o720WsA7cPKbdfWDirs7e7iOrHw
X-Received: by 2002:a0c:f8c9:: with SMTP id h9-v6mr3027679qvo.122.1526510535442;
        Wed, 16 May 2018 15:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510535; cv=none;
        d=google.com; s=arc-20160816;
        b=EK5d7fNddDmW++vFpM3r0lRCQdcMlW+0xiamsWRy5SyeaqAB3EJ3jPqrNdgwwD5THK
         rMuGlt3wFnC2iMJxd2v2NIdU9rO0EogkcuCTScmIorySDrpiX/UjEiEstjyU3IVvCW9D
         yyyBiy8C9spkr3AgHCKWoFGl8v/G6Mb5l2nM40dPAdAMdLuWcjOE4uolO6oXnR2KWdiz
         z7RkCiwq8wPNhwAJt3TQRIRbkGxnEgx1gi3ODhp3xlDNVCofg9a3PySedNCUCO2RG2t+
         nkPz+T1eX86ewe5JJ9nlVDeOizMXP9k7zVAyOxHXOpYB+JCrOfhFpXAxoU52nPsSQIsJ
         wmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=h3k5Lx2BpD0Bum1sIuKXKWkJNyfw0mObCfVucUuPQp4=;
        b=D8ZAr0326H6UI6ByeinIsrXwH+1FNGlednGPRhjMGvwk7VT0+Dfchmail0DX1YHw0n
         obdm/bAKKGmr3xhyL6U51qBLftqnX6ycIVgXIQPtjTkHqMoRGh/8vSb73F5qpCL6M7Nz
         fZ/as9nLolmEBaMIKaAiPgQ21KyhuGCVy7/ZVX4C94ec3RH31OF8fQ5tVlKRA1Qiqgde
         FTAgs9AVIs1MQa6gmuL/0ByN8hVyzRSZtt6C0R4IrRCqtcfQ7ONnK0gF1FEP8QbMvkpe
         SUc6fse6zBTUySKqiMiB+D8vJx0zbsjMxQLC/+r07rffKUIyQsl/EgWwj/HkPG4aNtEc
         GKEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iKrHbBLs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d26-v6si3477112qtn.268.2018.05.16.15.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iKrHbBLs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ57e-000890-Tp
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wX-0007wB-5J
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wU-0007j8-OH
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:45 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:45740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wU-0007iP-FV
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:42 -0400
Received: by mail-pg0-x243.google.com with SMTP id w3-v6so886312pgv.12
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h3k5Lx2BpD0Bum1sIuKXKWkJNyfw0mObCfVucUuPQp4=;
	b=iKrHbBLs8I+XbBRjw123bRKly0K56cifBGuU3Vxmk4tl1MEUvGRsHIB1D4r8wWEN9Z
	1OCL/owUacY8DLF4Ofo3GdhFZ7K1/K3thg72HUNmreXyjGmd7ATTH6gW341lvhDCecvc
	fQAe5CRkNPhRq+bhqBMhFAlwKfhax8s9BFcQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h3k5Lx2BpD0Bum1sIuKXKWkJNyfw0mObCfVucUuPQp4=;
	b=q01+SSGSPjCNOQlKt2mdryBWLT83hW0coTj14m2OmQ5halb9szGQs51IA3BRyrzHgy
	PrsQq1QogeK7qA7ha896wd7r5z50NNd9NaDWcKQzUFs6NBYce334UwvodavedDGwTj/6
	z0Ja6RVXpOVnHL3NWzKwfTu/iSvaIB3qf9W/JgWhPCA75ugvPRZOjK9Pv7FLKLoZqf+B
	ZIWLHVn4AfL2Bh3CkRLOIwBSO+ii/jA3QTrtMVdqjrBwjDTl2vu189LO5kZLj9rwNb0V
	RAPBX5rGA/GUpaOxP5NT/UjzY5sshSK5cDu1Cy303eqFhLz53WZrKytRicVR/8zrLwQo
	YDPw==
X-Gm-Message-State: ALKqPwfGdSSfvExXtiBR6RU/oEk2fmFmITLsQzzTewpcbj0f3gGx+10S
	SyMl3WrB0Uv+adIyyTzFqx6dDPPAJx4=
X-Received: by 2002:a62:f20d:: with SMTP id
	m13-v6mr2780394pfh.170.1526509840841; 
	Wed, 16 May 2018 15:30:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:30:02 -0700
Message-Id: <20180516223007.10256-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v3-a 22/27] target/arm: Implement SVE Element
 Count Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IVgQgVzeW7UH

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  11 ++
 target/arm/sve_helper.c    | 136 ++++++++++++++++++
 target/arm/translate-sve.c | 288 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  31 +++-
 4 files changed, 465 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4f1bd5a62f..2831e1643b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -393,6 +393,17 @@ DEF_HELPER_FLAGS_4(sve_ftssel_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_ftssel_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_ftssel_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_sqaddi_b, TCG_CALL_NO_RWG, void, ptr, ptr, s32, i32)
+DEF_HELPER_FLAGS_4(sve_sqaddi_h, TCG_CALL_NO_RWG, void, ptr, ptr, s32, i32)
+DEF_HELPER_FLAGS_4(sve_sqaddi_s, TCG_CALL_NO_RWG, void, ptr, ptr, s64, i32)
+DEF_HELPER_FLAGS_4(sve_sqaddi_d, TCG_CALL_NO_RWG, void, ptr, ptr, s64, i32)
+
+DEF_HELPER_FLAGS_4(sve_uqaddi_b, TCG_CALL_NO_RWG, void, ptr, ptr, s32, i32)
+DEF_HELPER_FLAGS_4(sve_uqaddi_h, TCG_CALL_NO_RWG, void, ptr, ptr, s32, i32)
+DEF_HELPER_FLAGS_4(sve_uqaddi_s, TCG_CALL_NO_RWG, void, ptr, ptr, s64, i32)
+DEF_HELPER_FLAGS_4(sve_uqaddi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_uqsubi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 85a0639e3a..979aa5c409 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1235,3 +1235,139 @@ void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = nn ^ (mm & 2) << 62;
     }
 }
+
+/*
+ * Signed saturating addition with scalar operand.
+ */
+
+void HELPER(sve_sqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(int8_t)) {
+        int r = *(int8_t *)(a + i) + b;
+        if (r > INT8_MAX) {
+            r = INT8_MAX;
+        } else if (r < INT8_MIN) {
+            r = INT8_MIN;
+        }
+        *(int8_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_sqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(int16_t)) {
+        int r = *(int16_t *)(a + i) + b;
+        if (r > INT16_MAX) {
+            r = INT16_MAX;
+        } else if (r < INT16_MIN) {
+            r = INT16_MIN;
+        }
+        *(int16_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_sqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(int32_t)) {
+        int64_t r = *(int32_t *)(a + i) + b;
+        if (r > INT32_MAX) {
+            r = INT32_MAX;
+        } else if (r < INT32_MIN) {
+            r = INT32_MIN;
+        }
+        *(int32_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_sqaddi_d)(void *d, void *a, int64_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(int64_t)) {
+        int64_t ai = *(int64_t *)(a + i);
+        int64_t r = ai + b;
+        if (((r ^ ai) & ~(ai ^ b)) < 0) {
+            /* Signed overflow.  */
+            r = (r < 0 ? INT64_MAX : INT64_MIN);
+        }
+        *(int64_t *)(d + i) = r;
+    }
+}
+
+/*
+ * Unsigned saturating addition with scalar operand.
+ */
+
+void HELPER(sve_uqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(uint8_t)) {
+        int r = *(uint8_t *)(a + i) + b;
+        if (r > UINT8_MAX) {
+            r = UINT8_MAX;
+        } else if (r < 0) {
+            r = 0;
+        }
+        *(uint8_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_uqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(uint16_t)) {
+        int r = *(uint16_t *)(a + i) + b;
+        if (r > UINT16_MAX) {
+            r = UINT16_MAX;
+        } else if (r < 0) {
+            r = 0;
+        }
+        *(uint16_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_uqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
+        int64_t r = *(uint32_t *)(a + i) + b;
+        if (r > UINT32_MAX) {
+            r = UINT32_MAX;
+        } else if (r < 0) {
+            r = 0;
+        }
+        *(uint32_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_uqaddi_d)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        uint64_t r = *(uint64_t *)(a + i) + b;
+        if (r < b) {
+            r = UINT64_MAX;
+        }
+        *(uint64_t *)(d + i) = r;
+    }
+}
+
+void HELPER(sve_uqsubi_d)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        uint64_t ai = *(uint64_t *)(a + i);
+        *(uint64_t *)(d + i) = (ai < b ? 0 : ai - b);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ea8d2c4112..2a0bf6b47c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -57,6 +57,11 @@ static int tszimm_shl(int x)
     return x - (8 << tszimm_esz(x));
 }
 
+static inline int plus1(int x)
+{
+    return x + 1;
+}
+
 /*
  * Include the generated decoder.
  */
@@ -1497,6 +1502,289 @@ static bool trans_PNEXT(DisasContext *s, arg_rr_esz *a, uint32_t insn)
     return do_pfirst_pnext(s, a, gen_helper_sve_pnext);
 }
 
+/*
+ *** SVE Element Count Group
+ */
+
+/* Perform an inline saturating addition of a 32-bit value within
+ * a 64-bit register.  The second operand is known to be positive,
+ * which halves the comparisions we must perform to bound the result.
+ */
+static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
+{
+    int64_t ibound;
+    TCGv_i64 bound;
+    TCGCond cond;
+
+    /* Use normal 64-bit arithmetic to detect 32-bit overflow.  */
+    if (u) {
+        tcg_gen_ext32u_i64(reg, reg);
+    } else {
+        tcg_gen_ext32s_i64(reg, reg);
+    }
+    if (d) {
+        tcg_gen_sub_i64(reg, reg, val);
+        ibound = (u ? 0 : INT32_MIN);
+        cond = TCG_COND_LT;
+    } else {
+        tcg_gen_add_i64(reg, reg, val);
+        ibound = (u ? UINT32_MAX : INT32_MAX);
+        cond = TCG_COND_GT;
+    }
+    bound = tcg_const_i64(ibound);
+    tcg_gen_movcond_i64(cond, reg, reg, bound, bound, reg);
+    tcg_temp_free_i64(bound);
+}
+
+/* Similarly with 64-bit values.  */
+static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2;
+
+    if (u) {
+        if (d) {
+            tcg_gen_sub_i64(t0, reg, val);
+            tcg_gen_movi_i64(t1, 0);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t1, t0);
+        } else {
+            tcg_gen_add_i64(t0, reg, val);
+            tcg_gen_movi_i64(t1, -1);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t1, t0);
+        }
+    } else {
+        if (d) {
+            /* Detect signed overflow for subtraction.  */
+            tcg_gen_xor_i64(t0, reg, val);
+            tcg_gen_sub_i64(t1, reg, val);
+            tcg_gen_xor_i64(reg, reg, t0);
+            tcg_gen_and_i64(t0, t0, reg);
+
+            /* Bound the result.  */
+            tcg_gen_movi_i64(reg, INT64_MIN);
+            t2 = tcg_const_i64(0);
+            tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, reg, t1);
+        } else {
+            /* Detect signed overflow for addition.  */
+            tcg_gen_xor_i64(t0, reg, val);
+            tcg_gen_add_i64(reg, reg, val);
+            tcg_gen_xor_i64(t1, reg, val);
+            tcg_gen_andc_i64(t0, t1, t0);
+
+            /* Bound the result.  */
+            tcg_gen_movi_i64(t1, INT64_MAX);
+            t2 = tcg_const_i64(0);
+            tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, t1, reg);
+        }
+        tcg_temp_free_i64(t2);
+    }
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+/* Similarly with a vector and a scalar operand.  */
+static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
+                              TCGv_i64 val, bool u, bool d)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr dptr, nptr;
+    TCGv_i32 t32, desc;
+    TCGv_i64 t64;
+
+    dptr = tcg_temp_new_ptr();
+    nptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(dptr, cpu_env, vec_full_reg_offset(s, rd));
+    tcg_gen_addi_ptr(nptr, cpu_env, vec_full_reg_offset(s, rn));
+    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+
+    switch (esz) {
+    case MO_8:
+        t32 = tcg_temp_new_i32();
+        tcg_gen_extrl_i64_i32(t32, val);
+        if (d) {
+            tcg_gen_neg_i32(t32, t32);
+        }
+        if (u) {
+            gen_helper_sve_uqaddi_b(dptr, nptr, t32, desc);
+        } else {
+            gen_helper_sve_sqaddi_b(dptr, nptr, t32, desc);
+        }
+        tcg_temp_free_i32(t32);
+        break;
+
+    case MO_16:
+        t32 = tcg_temp_new_i32();
+        tcg_gen_extrl_i64_i32(t32, val);
+        if (d) {
+            tcg_gen_neg_i32(t32, t32);
+        }
+        if (u) {
+            gen_helper_sve_uqaddi_h(dptr, nptr, t32, desc);
+        } else {
+            gen_helper_sve_sqaddi_h(dptr, nptr, t32, desc);
+        }
+        tcg_temp_free_i32(t32);
+        break;
+
+    case MO_32:
+        t64 = tcg_temp_new_i64();
+        if (d) {
+            tcg_gen_neg_i64(t64, val);
+        } else {
+            tcg_gen_mov_i64(t64, val);
+        }
+        if (u) {
+            gen_helper_sve_uqaddi_s(dptr, nptr, t64, desc);
+        } else {
+            gen_helper_sve_sqaddi_s(dptr, nptr, t64, desc);
+        }
+        tcg_temp_free_i64(t64);
+        break;
+
+    case MO_64:
+        if (u) {
+            if (d) {
+                gen_helper_sve_uqsubi_d(dptr, nptr, val, desc);
+            } else {
+                gen_helper_sve_uqaddi_d(dptr, nptr, val, desc);
+            }
+        } else if (d) {
+            t64 = tcg_temp_new_i64();
+            tcg_gen_neg_i64(t64, val);
+            gen_helper_sve_sqaddi_d(dptr, nptr, t64, desc);
+            tcg_temp_free_i64(t64);
+        } else {
+            gen_helper_sve_sqaddi_d(dptr, nptr, val, desc);
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    tcg_temp_free_ptr(dptr);
+    tcg_temp_free_ptr(nptr);
+    tcg_temp_free_i32(desc);
+}
+
+static bool trans_CNT_r(DisasContext *s, arg_CNT_r *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        unsigned fullsz = vec_full_reg_size(s);
+        unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+        tcg_gen_movi_i64(cpu_reg(s, a->rd), numelem * a->imm);
+    }
+    return true;
+}
+
+static bool trans_INCDEC_r(DisasContext *s, arg_incdec_cnt *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        unsigned fullsz = vec_full_reg_size(s);
+        unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+        int inc = numelem * a->imm * (a->d ? -1 : 1);
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+
+        tcg_gen_addi_i64(reg, reg, inc);
+    }
+    return true;
+}
+
+static bool trans_SINCDEC_r_32(DisasContext *s, arg_incdec_cnt *a,
+                               uint32_t insn)
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm;
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+
+    /* Use normal 64-bit arithmetic to detect 32-bit overflow.  */
+    if (inc == 0) {
+        if (a->u) {
+            tcg_gen_ext32u_i64(reg, reg);
+        } else {
+            tcg_gen_ext32s_i64(reg, reg);
+        }
+    } else {
+        TCGv_i64 t = tcg_const_i64(inc);
+        do_sat_addsub_32(reg, t, a->u, a->d);
+        tcg_temp_free_i64(t);
+    }
+    return true;
+}
+
+static bool trans_SINCDEC_r_64(DisasContext *s, arg_incdec_cnt *a,
+                               uint32_t insn)
+{
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm;
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+
+    if (inc != 0) {
+        TCGv_i64 t = tcg_const_i64(inc);
+        do_sat_addsub_64(reg, t, a->u, a->d);
+        tcg_temp_free_i64(t);
+    }
+    return true;
+}
+
+static bool trans_INCDEC_v(DisasContext *s, arg_incdec2_cnt *a, uint32_t insn)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm;
+
+    if (inc != 0) {
+        if (sve_access_check(s)) {
+            TCGv_i64 t = tcg_const_i64(a->d ? -inc : inc);
+            tcg_gen_gvec_adds(a->esz, vec_full_reg_offset(s, a->rd),
+                              vec_full_reg_offset(s, a->rn),
+                              t, fullsz, fullsz);
+            tcg_temp_free_i64(t);
+        }
+    } else {
+        do_mov_z(s, a->rd, a->rn);
+    }
+    return true;
+}
+
+static bool trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a,
+                            uint32_t insn)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+
+    unsigned fullsz = vec_full_reg_size(s);
+    unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
+    int inc = numelem * a->imm;
+
+    if (inc != 0) {
+        if (sve_access_check(s)) {
+            TCGv_i64 t = tcg_const_i64(inc);
+            do_sat_addsub_vec(s, a->esz, a->rd, a->rn, t, a->u, a->d);
+            tcg_temp_free_i64(t);
+        }
+    } else {
+        do_mov_z(s, a->rd, a->rn);
+    }
+    return true;
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 224dfdd1e9..b6890d0410 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -22,6 +22,7 @@
 ###########################################################################
 # Named fields.  These are primarily for disjoint fields.
 
+%imm4_16_p1             16:4 !function=plus1
 %imm6_22_5      22:1 5:5
 %imm9_16_10     16:s6 10:3
 
@@ -56,6 +57,9 @@
 &rprr_esz       rd pg rn rm esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
+&ptrue          rd esz pat s
+&incdec_cnt     rd pat esz imm d u
+&incdec2_cnt    rd rn pat esz imm d u
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -113,6 +117,13 @@
 @rd_rn_i9       ........ ........ ...... rn:5 rd:5      \
                 &rri imm=%imm9_16_10
 
+# One register, pattern, and uint4+1.
+# User must fill in U and D.
+@incdec_cnt     ........ esz:2 .. .... ...... pat:5 rd:5 \
+                &incdec_cnt imm=%imm4_16_p1
+@incdec2_cnt    ........ esz:2 .. .... ...... pat:5 rd:5 \
+                &incdec2_cnt imm=%imm4_16_p1 rn=%reg_movprfx
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -299,7 +310,25 @@ FEXPA           00000100 .. 1 00000 101110 ..... .....          @rd_rn
 # Note esz != 0
 FTSSEL          00000100 .. 1 ..... 101100 ..... .....          @rd_rn_rm
 
-### SVE Predicate Logical Operations Group
+### SVE Element Count Group
+
+# SVE element count
+CNT_r           00000100 .. 10 .... 1110 0 0 ..... .....    @incdec_cnt d=0 u=1
+
+# SVE inc/dec register by element count
+INCDEC_r        00000100 .. 11 .... 1110 0 d:1 ..... .....      @incdec_cnt u=1
+
+# SVE saturating inc/dec register by element count
+SINCDEC_r_32    00000100 .. 10 .... 1111 d:1 u:1 ..... .....    @incdec_cnt
+SINCDEC_r_64    00000100 .. 11 .... 1111 d:1 u:1 ..... .....    @incdec_cnt
+
+# SVE inc/dec vector by element count
+# Note this requires esz != 0.
+INCDEC_v        00000100 .. 1 1 .... 1100 0 d:1 ..... .....    @incdec2_cnt u=1
+
+# SVE saturating inc/dec vector by element count
+# Note these require esz != 0.
+SINCDEC_v       00000100 .. 1 0 .... 1100 d:1 u:1 ..... .....   @incdec2_cnt
 
 # SVE predicate logical operations
 AND_pppp        00100101 0. 00 .... 01 .... 0 .... 0 ....       @pd_pg_pn_pm_s
-- 
2.17.0

