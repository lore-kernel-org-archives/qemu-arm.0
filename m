Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5776255wrq;
        Tue, 26 Jun 2018 21:44:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc94xRt62Faq5iFbQpqZcCr+4Pz6Zq3jA9PGxiszBmYR6rDthyrhoqdR7EIfvQoJHfCPCZu
X-Received: by 2002:ac8:12c5:: with SMTP id b5-v6mr4025038qtj.372.1530074659540;
        Tue, 26 Jun 2018 21:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074659; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9IIP80bv1TWbp5kRvyX7pm0XhfwZkHpGfeNu7/AypJXOw8O1hJzJGgSgQ5eY99vU4
         s3pEdo3wq7APJdYmOcGa1XwKXyPfSWwOsaRFODf8gtpcVhmUKMq8iROgFFcKejv4m5WA
         a+v28FZzUmuanI8j/QNLyHZLkxzuV1JJ5eR9cwIKbueDu7YfJCVCvM7Nq6gv14N9Jj5d
         PZD5wpq7/sHCIW0MKlMVnjbYzuRtlK2rMA+pVBk/18j/d3f/l5eqb53OJxUO3XT/270B
         9Drh1SJ8Dix+3SEx8Wx/gr7bf8WBwaOCd+F6rKoH56VMIKFriIsTCtKSZUUM2n9Z2Y7L
         mGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k+61EXcPbnvOR/jsDDYTANncnlq/tWc+99vEb14N6Ow=;
        b=oDIAfpnVsp8fbQG87eJhfvpdO4vc7Y3lhut6xFl1lnfI3RDFr95FEXzT9awwWJIHyh
         qqh5qzFgk6GGYGLSfVz+M7Ei9NzMYOIBUqjXr/rf05v4J5lsxWpj5FKC1KJdlMM+p15L
         ahaNSWXHIKAPnJnnoCAYe4x2SVzCy4Sk+OruMOxEjE7j1dp57iHWAogcduHALsHnaQ+X
         k6zxeVhV5LAJa7f+tUVlssGjY4BWIVp3eNJbkYH24z/Zm7GizyOztBt/U1r+LEC+dfFL
         6wZf6yOkORzAkeg/L5MUhsX3jNzQtj6q5JYV6oNRrbQLsKvtE8FGDwC8lFfbvgCgPxOd
         jPhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LzOZAX2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w140-v6si2117903qkw.211.2018.06.26.21.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LzOZAX2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2JW-0004SR-Vo
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:44:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29V-0004KE-Ga
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29S-0000cV-TG
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:57 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:36349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29S-0000aq-HY
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:54 -0400
Received: by mail-pg0-x232.google.com with SMTP id m5-v6so367559pgd.3
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k+61EXcPbnvOR/jsDDYTANncnlq/tWc+99vEb14N6Ow=;
	b=LzOZAX2nyFXzjPIP0d/7zxvG/wsynE5xtPzuj6S3cDcZ2KMEpNYmJphdssYdQIEXtR
	2BDX4I1Wr3bc2ZvrpzDK2Xv4ZQkUyMaYgVzEq6HwYz0r0ZcTUMyXXNDpkGlXea9jh0rA
	07B65TDgrpM4DCPusrIYIRpZucKulcRAz4LBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k+61EXcPbnvOR/jsDDYTANncnlq/tWc+99vEb14N6Ow=;
	b=IyfTSp+4ofrEHsdBIJ1ESWWFiNFwWK1w6Ky3OJS8ZvEYhiHXhNQwOOcM35J2R419vD
	mHpwQ6yiKsS7zuK0MD2gGbNvA2FRPnnkKY4SPT5ZLufL2uGTjTxrv5g4l1+eJWiQxdkR
	me2Yjzft3MZ1ffk6A7/QBLK3e6uw7A4N1mENXayeSKHNF0nppMLddMJ3gnHzNKcJ+JjM
	40NG+ifbPktI/nPh6MWl7+Bxf9WegE5SmOHPBupAIzoChP03a/jnJNO0JE7lbnDAvdCA
	ZjZcjwzge+m2UVqwGoAkR8XlmlCZGUoi9Zwff/1/V87FhJOqWUXdvis9qiu2IiTdhHjm
	bdUg==
X-Gm-Message-State: APt69E23CJ/amlkpnwj50uNljXVEGe40vHLafsL8ZpTEpHEjpYWeShon
	7acjSZy+waLh+/7jOwu8iLWHKJTB9kw=
X-Received: by 2002:a63:2ac4:: with SMTP id
	q187-v6mr2283055pgq.333.1530074033622; 
	Tue, 26 Jun 2018 21:33:53 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:09 -0700
Message-Id: <20180627043328.11531-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: [Qemu-arm] [PATCH v6 16/35] target/arm: Implement SVE
 floating-point compare vectors
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPaUkRV/tvax

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 49 ++++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 62 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 40 ++++++++++++++++++++++++
 target/arm/sve.decode      | 11 +++++++
 4 files changed, 162 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 55e8a908d4..6089b3a53f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -839,6 +839,55 @@ DEF_HELPER_FLAGS_5(sve_ucvt_ds, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_ucvt_dd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve_fcmge_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmge_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmge_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fcmgt_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmgt_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmgt_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fcmeq_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmeq_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmeq_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fcmne_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmne_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmne_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fcmuo_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmuo_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fcmuo_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_facge_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_facge_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_facge_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_facgt_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_facgt_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_facgt_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_h, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_s, TCG_CALL_NO_RWG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fmla_zpzzz_d, TCG_CALL_NO_RWG, void, env, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 81fc968087..41d8ce6b54 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3193,6 +3193,68 @@ void HELPER(sve_fnmls_zpzzz_d)(CPUARMState *env, void *vg, uint32_t desc)
     do_fmla_zpzzz_d(env, vg, desc, 0, INT64_MIN);
 }
 
+/* Two operand floating-point comparison controlled by a predicate.
+ * Unlike the integer version, we are not allowed to optimistically
+ * compare operands, since the comparison may have side effects wrt
+ * the FPSR.
+ */
+#define DO_FPCMP_PPZZ(NAME, TYPE, H, OP)                                \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
+                  void *status, uint32_t desc)                          \
+{                                                                       \
+    intptr_t i = simd_oprsz(desc), j = (i - 1) >> 6;                    \
+    uint64_t *d = vd, *g = vg;                                          \
+    do {                                                                \
+        uint64_t out = 0, pg = g[j];                                    \
+        do {                                                            \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                    \
+            if (likely((pg >> (i & 63)) & 1)) {                         \
+                TYPE nn = *(TYPE *)(vn + H(i));                         \
+                TYPE mm = *(TYPE *)(vm + H(i));                         \
+                out |= OP(TYPE, nn, mm, status);                        \
+            }                                                           \
+        } while (i & 63);                                               \
+        d[j--] = out;                                                   \
+    } while (i > 0);                                                    \
+}
+
+#define DO_FPCMP_PPZZ_H(NAME, OP) \
+    DO_FPCMP_PPZZ(NAME##_h, float16, H1_2, OP)
+#define DO_FPCMP_PPZZ_S(NAME, OP) \
+    DO_FPCMP_PPZZ(NAME##_s, float32, H1_4, OP)
+#define DO_FPCMP_PPZZ_D(NAME, OP) \
+    DO_FPCMP_PPZZ(NAME##_d, float64,     , OP)
+
+#define DO_FPCMP_PPZZ_ALL(NAME, OP) \
+    DO_FPCMP_PPZZ_H(NAME, OP)   \
+    DO_FPCMP_PPZZ_S(NAME, OP)   \
+    DO_FPCMP_PPZZ_D(NAME, OP)
+
+#define DO_FCMGE(TYPE, X, Y, ST)  TYPE##_compare(Y, X, ST) <= 0
+#define DO_FCMGT(TYPE, X, Y, ST)  TYPE##_compare(Y, X, ST) < 0
+#define DO_FCMEQ(TYPE, X, Y, ST)  TYPE##_compare_quiet(X, Y, ST) == 0
+#define DO_FCMNE(TYPE, X, Y, ST)  TYPE##_compare_quiet(X, Y, ST) != 0
+#define DO_FCMUO(TYPE, X, Y, ST)  \
+    TYPE##_compare_quiet(X, Y, ST) == float_relation_unordered
+#define DO_FACGE(TYPE, X, Y, ST)  \
+    TYPE##_compare(TYPE##_abs(Y), TYPE##_abs(X), ST) <= 0
+#define DO_FACGT(TYPE, X, Y, ST)  \
+    TYPE##_compare(TYPE##_abs(Y), TYPE##_abs(X), ST) < 0
+
+DO_FPCMP_PPZZ_ALL(sve_fcmge, DO_FCMGE)
+DO_FPCMP_PPZZ_ALL(sve_fcmgt, DO_FCMGT)
+DO_FPCMP_PPZZ_ALL(sve_fcmeq, DO_FCMEQ)
+DO_FPCMP_PPZZ_ALL(sve_fcmne, DO_FCMNE)
+DO_FPCMP_PPZZ_ALL(sve_fcmuo, DO_FCMUO)
+DO_FPCMP_PPZZ_ALL(sve_facge, DO_FACGE)
+DO_FPCMP_PPZZ_ALL(sve_facgt, DO_FACGT)
+
+#undef DO_FPCMP_PPZZ_ALL
+#undef DO_FPCMP_PPZZ_D
+#undef DO_FPCMP_PPZZ_S
+#undef DO_FPCMP_PPZZ_H
+#undef DO_FPCMP_PPZZ
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9eb2530d3b..b028a034fd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3533,6 +3533,46 @@ DO_FP3(FMULX, fmulx)
 
 #undef DO_FP3
 
+static bool do_fp_cmp(DisasContext *s, arg_rprr_esz *a,
+                      gen_helper_gvec_4_ptr *fn)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_4_ptr(pred_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+#define DO_FPCMP(NAME, name) \
+static bool trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a,     \
+                                uint32_t insn)                        \
+{                                                                     \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                   \
+        NULL, gen_helper_sve_##name##_h,                              \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d          \
+    };                                                                \
+    return do_fp_cmp(s, a, fns[a->esz]);                              \
+}
+
+DO_FPCMP(FCMGE, fcmge)
+DO_FPCMP(FCMGT, fcmgt)
+DO_FPCMP(FCMEQ, fcmeq)
+DO_FPCMP(FCMNE, fcmne)
+DO_FPCMP(FCMUO, fcmuo)
+DO_FPCMP(FACGE, facge)
+DO_FPCMP(FACGT, facgt)
+
+#undef DO_FPCMP
+
 typedef void gen_helper_sve_fmla(TCGv_env, TCGv_ptr, TCGv_i32);
 
 static bool do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 75133ce659..a1bc6cb395 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -324,6 +324,17 @@ UXTH            00000100 .. 010 011 101 ... ..... .....         @rd_pg_rn
 SXTW            00000100 .. 010 100 101 ... ..... .....         @rd_pg_rn
 UXTW            00000100 .. 010 101 101 ... ..... .....         @rd_pg_rn
 
+### SVE Floating Point Compare - Vectors Group
+
+# SVE floating-point compare vectors
+FCMGE_ppzz      01100101 .. 0 ..... 010 ... ..... 0 ....        @pd_pg_rn_rm
+FCMGT_ppzz      01100101 .. 0 ..... 010 ... ..... 1 ....        @pd_pg_rn_rm
+FCMEQ_ppzz      01100101 .. 0 ..... 011 ... ..... 0 ....        @pd_pg_rn_rm
+FCMNE_ppzz      01100101 .. 0 ..... 011 ... ..... 1 ....        @pd_pg_rn_rm
+FCMUO_ppzz      01100101 .. 0 ..... 110 ... ..... 0 ....        @pd_pg_rn_rm
+FACGE_ppzz      01100101 .. 0 ..... 110 ... ..... 1 ....        @pd_pg_rn_rm
+FACGT_ppzz      01100101 .. 0 ..... 111 ... ..... 1 ....        @pd_pg_rn_rm
+
 ### SVE Integer Multiply-Add Group
 
 # SVE integer multiply-add writing addend (predicated)
-- 
2.17.1

