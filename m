Received: by 10.28.71.27 with SMTP id u27csp2103115wma;
        Sat, 17 Feb 2018 11:11:06 -0800 (PST)
X-Google-Smtp-Source: AH8x227X60lixomguzUAGyfKmXQBqsylFny1jqWBzzSz74VnYE+uUzeO/T8CUnFq7O378/On+FSM
X-Received: by 10.37.187.206 with SMTP id c14mr7396588ybk.408.1518894666193;
        Sat, 17 Feb 2018 11:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894666; cv=none;
        d=google.com; s=arc-20160816;
        b=gq2HcqL3yklVjRt+73e8mL2Ipoviqh8F+wqA7/uovwtN4woIAEI/09689C9g3YX0wA
         BWVkppSQPdinSlSEgKAKiVOE0hh62yIZj+LKLjoVSN18kL6BIjAPSF5AYnY6dtfnVS3a
         xW4DcYfNRFZ/v+YDtFQcarInBe4tyvLmTDZ+KkU6Tg7+/7xtjsBHn2tcmokOddskkSfe
         NqXEAioCmRHVGKy8jK3jFfpjhF0uWvYPpSaGw5N4WJoVBeIch8/O52E5ZTinJEixl1po
         v3+coVyo3tDNe5BIE/PH8K7l5JWNPL0zbW5jdUSbOp7s777vwAh3zLYJsMR9hiRLo3Qk
         hFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=f6tnM4rLbtSBZqU3j1NYbg9btYpfaZ4siRzrSFF1A54=;
        b=xOSgFIfpLfYsODerRIEVSgvrv8qke3noWwKMZGXc6sg9lgLJPyn8c8f4/ClKToXZIY
         qFiTk1vMD+QosIgUFzeRfRDVChu2ixx2qmUybf7XTZZ5VB6+jIPb/33el5majeLfLFC6
         Ek1zze9Oy4gT3qoFuFrqzG1BF0Wl5GKHpN0fhWaSOsFGWzvaeB5RqTi+SBRvSBv/3L9a
         HGP19T26CQfgWwWcKfaibOKbztoM79nerPuzLgAH0WaQjFuoKovsfjOHlbqYIhHRHQWR
         gTof67KTiKSqO0sCN7EebK8TZtYwRIO1/piNviHeLB6Dxx2sqQJvtfjW7JhBkA2wxbXh
         3F4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EhjmOh6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9si1455937ybm.137.2018.02.17.11.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EhjmOh6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7t3-000738-Fu
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:11:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7A3-0001Fi-QM
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7A2-00020J-3b
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:35 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:45875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7A1-0001zp-OH
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:34 -0500
Received: by mail-pf0-x243.google.com with SMTP id w83so592606pfi.12
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f6tnM4rLbtSBZqU3j1NYbg9btYpfaZ4siRzrSFF1A54=;
	b=EhjmOh6lGPWybODY5lXUS71MTW38IIzcnhajIriQbP0P00tlB7d3HRAmBYCW9OYuEW
	PnDLVI6XqhG1kH9EpIbQaDp+RLTzMQZV6y8+xJRr7r21PiuLVxg3MEs1bxh+iXaO4UML
	F7ncbuivsjEJhKJeQ3UltlropW6EgvJcC4BlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f6tnM4rLbtSBZqU3j1NYbg9btYpfaZ4siRzrSFF1A54=;
	b=cI6a/ouLXHiRmNORLtj2c2wxGlnsUZaPZ3FVSddQzSkkFPEkkPw8Vuh8tZmoNYIKg6
	hU4MR4VKAZnpYV1Acxq1W8F4xZqmr/1Iktf7oN7nkW4oLYXfBKOt0LnloA1HkHeiPHbY
	G5EAcW/sWFfdjYA/T77/E8y9ld8W2tE0q5L2P/RTjhnls1b3jpXutI0SpS8jHjF2X5l2
	oL8p5wovktYrP4XMv0bgmMiFAOxdQdfVftv0i8S/1xCK3i1LhDOgyogmEJazjAFiJIIg
	tZWB1Q2pmvUXS1s42rtc+6MbPMKtAWjdQtkQrTFieX72w245mrqxB5xaqnYhR7v0hTng
	5KGQ==
X-Gm-Message-State: APf1xPCG83lLxr0aJxZGOqAd5Eql1ZBPMI7rSQ/prQqweIIuqvV7NRdF
	0icB7wwTTbWHLt70GKvHUlmqUw==
X-Received: by 10.98.33.204 with SMTP id o73mr2432335pfj.54.1518891872719;
	Sat, 17 Feb 2018 10:24:32 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:58 -0800
Message-Id: <20180217182323.25885-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v2 42/67] target/arm: Implement SVE Integer Wide
 Immediate - Unpredicated Group
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/jVlaBzi0f4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  25 +++++++++
 target/arm/sve_helper.c    |  41 ++++++++++++++
 target/arm/translate-sve.c | 135 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  26 +++++++++
 4 files changed, 227 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 1863106d0f..97bfe0f47b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -680,3 +680,28 @@ DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(sve_while, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+
+DEF_HELPER_FLAGS_4(sve_subri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_subri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_subri_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_subri_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(sve_smaxi_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_smaxi_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_smaxi_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_smaxi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(sve_smini_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_smini_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_smini_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_smini_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(sve_umaxi_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_umaxi_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_umaxi_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_umaxi_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_4(sve_umini_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_umini_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_umini_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(sve_umini_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 80b78da834..4f45f11bff 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -803,6 +803,46 @@ DO_VPZ_D(sve_uminv_d, uint64_t, uint64_t, -1, DO_MIN)
 #undef DO_VPZ
 #undef DO_VPZ_D
 
+/* Two vector operand, one scalar operand, unpredicated.  */
+#define DO_ZZI(NAME, TYPE, OP)                                       \
+void HELPER(NAME)(void *vd, void *vn, uint64_t s64, uint32_t desc)   \
+{                                                                    \
+    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(TYPE);            \
+    TYPE s = s64, *d = vd, *n = vn;                                  \
+    for (i = 0; i < opr_sz; ++i) {                                   \
+        d[i] = OP(n[i], s);                                          \
+    }                                                                \
+}
+
+#define DO_SUBR(X, Y)   (Y - X)
+
+DO_ZZI(sve_subri_b, uint8_t, DO_SUBR)
+DO_ZZI(sve_subri_h, uint16_t, DO_SUBR)
+DO_ZZI(sve_subri_s, uint32_t, DO_SUBR)
+DO_ZZI(sve_subri_d, uint64_t, DO_SUBR)
+
+DO_ZZI(sve_smaxi_b, int8_t, DO_MAX)
+DO_ZZI(sve_smaxi_h, int16_t, DO_MAX)
+DO_ZZI(sve_smaxi_s, int32_t, DO_MAX)
+DO_ZZI(sve_smaxi_d, int64_t, DO_MAX)
+
+DO_ZZI(sve_smini_b, int8_t, DO_MIN)
+DO_ZZI(sve_smini_h, int16_t, DO_MIN)
+DO_ZZI(sve_smini_s, int32_t, DO_MIN)
+DO_ZZI(sve_smini_d, int64_t, DO_MIN)
+
+DO_ZZI(sve_umaxi_b, uint8_t, DO_MAX)
+DO_ZZI(sve_umaxi_h, uint16_t, DO_MAX)
+DO_ZZI(sve_umaxi_s, uint32_t, DO_MAX)
+DO_ZZI(sve_umaxi_d, uint64_t, DO_MAX)
+
+DO_ZZI(sve_umini_b, uint8_t, DO_MIN)
+DO_ZZI(sve_umini_h, uint16_t, DO_MIN)
+DO_ZZI(sve_umini_s, uint32_t, DO_MIN)
+DO_ZZI(sve_umini_d, uint64_t, DO_MIN)
+
+#undef DO_ZZI
+
 #undef DO_AND
 #undef DO_ORR
 #undef DO_EOR
@@ -817,6 +857,7 @@ DO_VPZ_D(sve_uminv_d, uint64_t, uint64_t, -1, DO_MIN)
 #undef DO_ASR
 #undef DO_LSR
 #undef DO_LSL
+#undef DO_SUBR
 
 /* Similar to the ARM LastActiveElement pseudocode function, except the
    result is multiplied by the element size.  This includes the not found
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7571d02237..72abcb543a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -81,6 +81,11 @@ static inline int expand_imm_sh8s(int x)
     return (int8_t)x << (x & 0x100 ? 8 : 0);
 }
 
+static inline int expand_imm_sh8u(int x)
+{
+    return (uint8_t)x << (x & 0x100 ? 8 : 0);
+}
+
 /*
  * Include the generated decoder.
  */
@@ -2974,6 +2979,136 @@ static void trans_DUP_i(DisasContext *s, arg_DUP_i *a, uint32_t insn)
     tcg_gen_gvec_dup64i(dofs, vsz, vsz, dup_const(a->esz, a->imm));
 }
 
+static void trans_ADD_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+
+    if (a->esz == 0 && extract32(insn, 13, 1)) {
+        unallocated_encoding(s);
+        return;
+    }
+    tcg_gen_gvec_addi(a->esz, vec_full_reg_offset(s, a->rd),
+                      vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
+}
+
+static void trans_SUB_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    a->imm = -a->imm;
+    trans_ADD_zzi(s, a, insn);
+}
+
+static void trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    static const GVecGen2s op[4] = {
+        { .fni8 = tcg_gen_vec_sub8_i64,
+          .fniv = tcg_gen_sub_vec,
+          .fno = gen_helper_sve_subri_b,
+          .opc = INDEX_op_sub_vec,
+          .vece = MO_8,
+          .scalar_first = true },
+        { .fni8 = tcg_gen_vec_sub16_i64,
+          .fniv = tcg_gen_sub_vec,
+          .fno = gen_helper_sve_subri_h,
+          .opc = INDEX_op_sub_vec,
+          .vece = MO_16,
+          .scalar_first = true },
+        { .fni4 = tcg_gen_sub_i32,
+          .fniv = tcg_gen_sub_vec,
+          .fno = gen_helper_sve_subri_s,
+          .opc = INDEX_op_sub_vec,
+          .vece = MO_32,
+          .scalar_first = true },
+        { .fni8 = tcg_gen_sub_i64,
+          .fniv = tcg_gen_sub_vec,
+          .fno = gen_helper_sve_subri_d,
+          .opc = INDEX_op_sub_vec,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .vece = MO_64,
+          .scalar_first = true }
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i64 c;
+
+    if (a->esz == 0 && extract32(insn, 13, 1)) {
+        unallocated_encoding(s);
+        return;
+    }
+    c = tcg_const_i64(a->imm);
+    tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
+                    vec_full_reg_offset(s, a->rn), vsz, vsz, c, &op[a->esz]);
+    tcg_temp_free_i64(c);
+}
+
+static void trans_MUL_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_muli(a->esz, vec_full_reg_offset(s, a->rd),
+                      vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
+}
+
+static void do_zzi_sat(DisasContext *s, arg_rri_esz *a, uint32_t insn,
+                       bool u, bool d)
+{
+    TCGv_i64 val;
+
+    if (a->esz == 0 && extract32(insn, 13, 1)) {
+        unallocated_encoding(s);
+        return;
+    }
+    val = tcg_const_i64(a->imm);
+    do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, u, d);
+    tcg_temp_free_i64(val);
+}
+
+static void trans_SQADD_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    do_zzi_sat(s, a, insn, false, false);
+}
+
+static void trans_UQADD_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    do_zzi_sat(s, a, insn, true, false);
+}
+
+static void trans_SQSUB_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    do_zzi_sat(s, a, insn, false, true);
+}
+
+static void trans_UQSUB_zzi(DisasContext *s, arg_rri_esz *a, uint32_t insn)
+{
+    do_zzi_sat(s, a, insn, true, true);
+}
+
+static void do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i64 c = tcg_const_i64(a->imm);
+
+    tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        c, vsz, vsz, 0, fn);
+    tcg_temp_free_i64(c);
+}
+
+#define DO_ZZI(NAME, name) \
+static void trans_##NAME##_zzi(DisasContext *s, arg_rri_esz *a,         \
+                               uint32_t insn)                           \
+{                                                                       \
+    static gen_helper_gvec_2i * const fns[4] = {                        \
+        gen_helper_sve_##name##i_b, gen_helper_sve_##name##i_h,         \
+        gen_helper_sve_##name##i_s, gen_helper_sve_##name##i_d,         \
+    };                                                                  \
+    do_zzi_ool(s, a, fns[a->esz]);                                      \
+}
+
+DO_ZZI(SMAX, smax)
+DO_ZZI(UMAX, umax)
+DO_ZZI(SMIN, smin)
+DO_ZZI(UMIN, umin)
+
+#undef DO_ZZI
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ea1bfe7579..1ede152360 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -43,6 +43,8 @@
 
 # Signed 8-bit immediate, optionally shifted left by 8.
 %sh8_i8s		5:9 !function=expand_imm_sh8s
+# Unsigned 8-bit immediate, optionally shifted left by 8.
+%sh8_i8u		5:9 !function=expand_imm_sh8u
 
 # Either a copy of rd (at bit 0), or a different source
 # as propagated via the MOVPRFX instruction.
@@ -96,6 +98,12 @@
 @pd_pn_pm	........ esz:2 .. rm:4 ....... rn:4 . rd:4	&rrr_esz
 @rdn_rm		........ esz:2 ...... ...... rm:5 rd:5 \
 		&rrr_esz rn=%reg_movprfx
+@rdn_sh_i8u	........ esz:2 ...... ...... ..... rd:5 \
+		&rri_esz rn=%reg_movprfx imm=%sh8_i8u
+@rdn_i8u	........ esz:2 ...... ... imm:8 rd:5 \
+		&rri_esz rn=%reg_movprfx
+@rdn_i8s	........ esz:2 ...... ... imm:s8 rd:5 \
+		&rri_esz rn=%reg_movprfx
 
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm	........ ... rm:5 .... imm:2 rn:5 rd:5		&rrri
@@ -630,6 +638,24 @@ FDUP		00100101 esz:2 111 00 1110 imm:8 rd:5
 # SVE broadcast integer immediate (unpredicated)
 DUP_i		00100101 esz:2 111 00 011 . ........ rd:5	imm=%sh8_i8s
 
+# SVE integer add/subtract immediate (unpredicated)
+ADD_zzi		00100101 .. 100 000 11 . ........ .....		@rdn_sh_i8u
+SUB_zzi		00100101 .. 100 001 11 . ........ .....		@rdn_sh_i8u
+SUBR_zzi	00100101 .. 100 011 11 . ........ .....		@rdn_sh_i8u
+SQADD_zzi	00100101 .. 100 100 11 . ........ .....		@rdn_sh_i8u
+UQADD_zzi	00100101 .. 100 101 11 . ........ .....		@rdn_sh_i8u
+SQSUB_zzi	00100101 .. 100 110 11 . ........ .....		@rdn_sh_i8u
+UQSUB_zzi	00100101 .. 100 111 11 . ........ .....		@rdn_sh_i8u
+
+# SVE integer min/max immediate (unpredicated)
+SMAX_zzi	00100101 .. 101 000 110 ........ .....		@rdn_i8s
+UMAX_zzi	00100101 .. 101 001 110 ........ .....		@rdn_i8u
+SMIN_zzi	00100101 .. 101 010 110 ........ .....		@rdn_i8s
+UMIN_zzi	00100101 .. 101 011 110 ........ .....		@rdn_i8u
+
+# SVE integer multiply immediate (unpredicated)
+MUL_zzi		00100101 .. 110 000 110 ........ .....		@rdn_i8s
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

