Received: by 10.28.71.27 with SMTP id u27csp2095653wma;
        Sat, 17 Feb 2018 11:01:13 -0800 (PST)
X-Google-Smtp-Source: AH8x227AwvFfEZ2qSW4T5y7p+job6u/i0N7UyUYp/SXKukPI4X8sDE72FDTBMJarqtbGpNRqMOIx
X-Received: by 10.129.43.86 with SMTP id r83mr7325433ywr.309.1518894073657;
        Sat, 17 Feb 2018 11:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894073; cv=none;
        d=google.com; s=arc-20160816;
        b=jJPaTyXdvszjR9Dto6fpAGLJo8jqZBjTDBup7uNywPGHA8SWeeGrZM7ztZAiXcRKea
         Emk1qW4D68tpAvwfi3ZhmAC8NU0m5TSHezrNxUeI3bXc+5/2xks7cLzvznOlv+fFGbg/
         jOePrkjTUTe74hh+6RTxpjeDtrQ3rEB5WTxL1NBPA/kw3hYbMx+wSvLQGjq5MIgvGDPS
         3hU3hMUVlY3i7l/9J82/NGnLT5IsljDZKon4k07rvNyDyech583z4PSlQyI0jV9ciUFf
         HYmF+LI1zw/3v9zKvkasStLDpIfhf7nYx3qk1+BqD2PSBQsYBPXsn2/8GiSTL/5oTXwq
         UFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=N/uyfV2EnnPtS8uXZFNB+wp3yS83EN710i4Qp70kVz4=;
        b=C/D8qOxfNDeS7sAYgn4baTjScY5tqiCJ30VXMzkP+PejDK6KeiOExSAM4Se6qmbdPm
         6ce1kz+PFXzXrs9JVt+eVPAwuPYMvIizvQ8KJG6BO4U/wXQJS8TPBL/hzuyz+eaAHHqs
         zBUUiBxLK2q3stRAB4PcWIYkl0mlUOcZ2wvDk9PEHmYlWreM1VOGQPD/0dpVIfuvc344
         ADsIbG19SnOLcLjEwYzeOt2G3fqklycVVO9LCl3EAEmt7FCdYJwzInGiMRjrlZKea/JF
         RcO0EAu0oM1JKK1PRVrGbA4YjW3hBUrCTnvOANEQ8pSGqCGqqOcg0u56UsqV793wqX6e
         drKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H/MUIYn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q135si3557308ywg.106.2018.02.17.11.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H/MUIYn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7jV-0006pw-2a
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:01:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AF-0001Rq-40
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AD-00027C-Hv
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:47 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:44555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AD-00026z-AB
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:45 -0500
Received: by mail-pl0-x243.google.com with SMTP id w21so3427159plp.11
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N/uyfV2EnnPtS8uXZFNB+wp3yS83EN710i4Qp70kVz4=;
	b=H/MUIYn1loOyvN60iecRE0FQjCwd/BjSnnyc15z+QbX2c/H8rVKH38gGmh604YWggC
	0FKT8NXeIKlxk4p9mXj1VpQS3Vw942fgR+Zv9AP1fWaMKC5QxzeYiaF3OHKU7YZSINoa
	QiqPd7izm5AMwGANa1dlHyrrfkUfzI/Wg5oMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N/uyfV2EnnPtS8uXZFNB+wp3yS83EN710i4Qp70kVz4=;
	b=hO0Y3iG6RNYjebA5b9M1ecNWhLmPYRE+NQHKw+CB1OZtvlRzggi470skjpirFLstKC
	3K9RXnpV0R7zv6RJ5H3j5eHXhUjqk5CWkgFmXwwh01t2Bz5RYrnLtuJe4xGkSdicjT09
	50ZwV9PjA5F0qGwKtT7NPDKu5GjDCJW5TJ5aFUdCWPODL25I7x/DHLYwfuqUurUDbbec
	lsGycUxbAXWppjxpE53OmsSEAsCdlzw5tcHon4zIE8DbzuYWcNEIe4xBYLvKZ/HeYoUz
	y1+/bBaX5t+3wm4J4KcGRenjcrXvdoQnkLLpGpatR4PdAf+OWu5F69qMpECHKEEDgbEB
	7FsQ==
X-Gm-Message-State: APf1xPDvXkwF8WLMcxa83F3kGfPuT2jmMgNLKjr6WcC7keKbUyg4ONv5
	gXMG4oVugVtnNhPD7IFCGTTj+g==
X-Received: by 2002:a17:902:7808:: with SMTP id
	p8-v6mr9622082pll.161.1518891884401; 
	Sat, 17 Feb 2018 10:24:44 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:05 -0800
Message-Id: <20180217182323.25885-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v2 49/67] target/arm: Implement SVE FP
 Multiply-Add Group
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
X-TUID: /+sE6SWNopwS

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 16 ++++++++++++++
 target/arm/sve_helper.c    | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 41 +++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 17 +++++++++++++++
 4 files changed, 127 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 84d0a8978c..a95f077c7f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -827,6 +827,22 @@ DEF_HELPER_FLAGS_5(sve_ucvt_ds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_ucvt_dd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fnmls_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d80babfae7..6622275b44 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2948,6 +2948,59 @@ DO_ZPZ_FP_D(sve_ucvt_dd, uint64_t, uint64_to_float64)
 #undef DO_ZPZ_FP
 #undef DO_ZPZ_FP_D
 
+/* 4-operand predicated multiply-add.  This requires 7 operands to pass
+ * "properly", so we need to encode some of the registers into DESC.
+ */
+QEMU_BUILD_BUG_ON(SIMD_DATA_SHIFT + 20 > 32);
+
+#define DO_FMLA(NAME, N, H, NEG1, NEG3)                                     \
+void HELPER(NAME)(CPUARMState *env, void *vg, uint32_t desc)                \
+{                                                                           \
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);                              \
+    unsigned rd = extract32(desc, SIMD_DATA_SHIFT, 5);                      \
+    unsigned rn = extract32(desc, SIMD_DATA_SHIFT + 5, 5);                  \
+    unsigned rm = extract32(desc, SIMD_DATA_SHIFT + 10, 5);                 \
+    unsigned ra = extract32(desc, SIMD_DATA_SHIFT + 15, 5);                 \
+    void *vd = &env->vfp.zregs[rd];                                         \
+    void *vn = &env->vfp.zregs[rn];                                         \
+    void *vm = &env->vfp.zregs[rm];                                         \
+    void *va = &env->vfp.zregs[ra];                                         \
+    do {                                                                    \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                     \
+        do {                                                                \
+            if (likely(pg & 1)) {                                           \
+                float##N e1 = *(uint##N##_t *)(vn + H(i));                  \
+                float##N e2 = *(uint##N##_t *)(vm + H(i));                  \
+                float##N e3 = *(uint##N##_t *)(va + H(i));                  \
+                float##N r;                                                 \
+                if (NEG1) e1 = float##N##_chs(e1);                          \
+                if (NEG3) e3 = float##N##_chs(e3);                          \
+                r = float##N##_muladd(e1, e2, e3, 0, &env->vfp.fp_status);  \
+                *(uint##N##_t *)(vd + H(i)) = r;                            \
+            }                                                               \
+            i += sizeof(float##N), pg >>= sizeof(float##N);                 \
+        } while (i & 15);                                                   \
+    } while (i < opr_sz);                                                   \
+}
+
+DO_FMLA(sve_fmla_zpzzz_h, 16, H1_2, 0, 0)
+DO_FMLA(sve_fmla_zpzzz_s, 32, H1_4, 0, 0)
+DO_FMLA(sve_fmla_zpzzz_d, 64, , 0, 0)
+
+DO_FMLA(sve_fmls_zpzzz_h, 16, H1_2, 0, 1)
+DO_FMLA(sve_fmls_zpzzz_s, 32, H1_4, 0, 1)
+DO_FMLA(sve_fmls_zpzzz_d, 64, , 0, 1)
+
+DO_FMLA(sve_fnmla_zpzzz_h, 16, H1_2, 1, 0)
+DO_FMLA(sve_fnmla_zpzzz_s, 32, H1_4, 1, 0)
+DO_FMLA(sve_fnmla_zpzzz_d, 64, , 1, 0)
+
+DO_FMLA(sve_fnmls_zpzzz_h, 16, H1_2, 1, 1)
+DO_FMLA(sve_fnmls_zpzzz_s, 32, H1_4, 1, 1)
+DO_FMLA(sve_fnmls_zpzzz_d, 64, , 1, 1)
+
+#undef DO_FMLA
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1692980d20..3124368fb5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3208,6 +3208,47 @@ DO_FP3(FMULX, fmulx)
 
 #undef DO_FP3
 
+typedef void gen_helper_sve_fmla(TCGv_env, TCGv_ptr, TCGv_i32);
+
+static void do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc;
+    TCGv_i32 t_desc;
+    TCGv_ptr pg = tcg_temp_new_ptr();
+
+    /* We would need 7 operands to pass these arguments "properly".
+     * So we encode all the register numbers into the descriptor.
+     */
+    desc = deposit32(a->rd, 5, 5, a->rn);
+    desc = deposit32(desc, 10, 5, a->rm);
+    desc = deposit32(desc, 15, 5, a->ra);
+    desc = simd_desc(vsz, vsz, desc);
+
+    t_desc = tcg_const_i32(desc);
+    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+    fn(cpu_env, pg, t_desc);
+    tcg_temp_free_i32(t_desc);
+    tcg_temp_free_ptr(pg);
+}
+
+#define DO_FMLA(NAME, name) \
+static void trans_##NAME(DisasContext *s, arg_rprrr_esz *a, uint32_t insn) \
+{                                                                    \
+    static gen_helper_sve_fmla * const fns[4] = {                    \
+        NULL, gen_helper_sve_##name##_h,                             \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d         \
+    };                                                               \
+    do_fmla(s, a, fns[a->esz]);                                      \
+}
+
+DO_FMLA(FMLA_zpzzz, fmla_zpzzz)
+DO_FMLA(FMLS_zpzzz, fmls_zpzzz)
+DO_FMLA(FNMLA_zpzzz, fnmla_zpzzz)
+DO_FMLA(FNMLS_zpzzz, fnmls_zpzzz)
+
+#undef DO_FMLA
+
 /*
  *** SVE Floating Point Unary Operations Prediated Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1a13c603ff..817833f96e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -129,6 +129,8 @@
 		&rprrr_esz ra=%reg_movprfx
 @rdn_pg_ra_rm	........ esz:2 . rm:5  ... pg:3 ra:5 rd:5 \
 		&rprrr_esz rn=%reg_movprfx
+@rdn_pg_rm_ra	........ esz:2 . ra:5  ... pg:3 rm:5 rd:5 \
+		&rprrr_esz rn=%reg_movprfx
 
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
@@ -709,6 +711,21 @@ FMULX		01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
 FDIV		01100101 .. 00 1100 100 ... ..... .....    @rdm_pg_rn # FDIVR
 FDIV		01100101 .. 00 1101 100 ... ..... .....    @rdn_pg_rm
 
+### SVE FP Multiply-Add Group
+
+# SVE floating-point multiply-accumulate writing addend
+FMLA_zpzzz	01100101 .. 1 ..... 000 ... ..... .....		@rda_pg_rn_rm
+FMLS_zpzzz	01100101 .. 1 ..... 001 ... ..... .....		@rda_pg_rn_rm
+FNMLA_zpzzz	01100101 .. 1 ..... 010 ... ..... .....		@rda_pg_rn_rm
+FNMLS_zpzzz	01100101 .. 1 ..... 011 ... ..... .....		@rda_pg_rn_rm
+
+# SVE floating-point multiply-accumulate writing multiplicand
+# FMAD, FMSB, FNMAD, FNMS
+FMLA_zpzzz	01100101 .. 1 ..... 100 ... ..... .....		@rdn_pg_rm_ra
+FMLS_zpzzz	01100101 .. 1 ..... 101 ... ..... .....		@rdn_pg_rm_ra
+FNMLA_zpzzz	01100101 .. 1 ..... 110 ... ..... .....		@rdn_pg_rm_ra
+FNMLS_zpzzz	01100101 .. 1 ..... 111 ... ..... .....		@rdn_pg_rm_ra
+
 ### SVE FP Unary Operations Predicated Group
 
 # SVE integer convert to floating-point
-- 
2.14.3

