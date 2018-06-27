Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5779686wrq;
        Tue, 26 Jun 2018 21:50:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfUMVUu/WztOy40yHhEB/cUIGhfwRkyh/RUCCmTtIbB/+jzgfrTst1vw+qMGbf4c4UOflso
X-Received: by 2002:aed:3966:: with SMTP id l93-v6mr4062585qte.220.1530075001302;
        Tue, 26 Jun 2018 21:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075001; cv=none;
        d=google.com; s=arc-20160816;
        b=josBc34x5cLg8zwbKyf3oASh44fUArJZ9rgjw8KqnyJcyGGGJsS7MtMmQLmtLwxjvL
         wyMPYPY5snZyKT9l/uS+WnDRriEb58ToEqAKTmSJ3BNWczLUE90SL4Nel6oSbf7gqG/L
         /Wz8N6HKGOkIzS6NVbtT3HE4UMPphm2/0eT/ooTp6jnShxsBiPntOVcIO8NqDeaOi5L6
         60zkyrflOyTf3AJo5qmXoYoJP0iFhbm63PzGS1b92oMXJIWenEAfTy21XtWnc3MxaU2D
         c/vkK7ZT8u9Wlsww1NdpHRHNqPhfeIC7Emq8Vu1TARmMpm34eS/ceX22D02CzPhBVdSH
         hbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XcxUc+IuwOCzeTRePaPETaBJTNxjUkcwGFz2+hndW5M=;
        b=GhneGDh2wi7bUartnjTx4YIWRAw+rmjimGeSKOoz22yhWy4tFcR2G47tqeMmuSbxOo
         +av3taAPjBMPH70HvLqGCeqjLq2bTIIq1Hs9vNhAXG5MG6XT1Ql4F17HufUFhbIvrc6p
         Aa3pXWLJcP7kltNOhE66Jj0GlnAKHuhMSn9RjceVSCHM5cRFQUKYpOLTXwXjt7TImPFA
         N8IXvWZ048TxtWOqOq3wm1vC+xw//opKVvChpk8zaO9qNYuVq0kQ6iBDot7nHJ7DjQvU
         q9h7mC7Dn03wMabCoCi04v+Magmk9X2r/v5SGTeaf83Yas1jmJuMKbVsrR2dJvmgv7lk
         0mXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OoAxk4FM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e187-v6si2947607qkb.358.2018.06.26.21.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OoAxk4FM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2P2-0000lO-Nz
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:50:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29d-0004Vg-8X
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29Z-0000lP-Vo
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:05 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:37620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29Z-0000ka-Jx
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:01 -0400
Received: by mail-pf0-x235.google.com with SMTP id y5-v6so388683pfn.4
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XcxUc+IuwOCzeTRePaPETaBJTNxjUkcwGFz2+hndW5M=;
	b=OoAxk4FMZjUxRPMbhomeRd+Rktp/UroyL+JkktWjradrcXTJEV8PHS2yqJ+RE2/qSG
	889jFiPb4NqiOXjuevxyqK1MmB3IJwjBrly8Z5uaY8rnt9ZgO3nSBWmhP9Bu9aWRGRwa
	Ij7GBcc1Occp5hNTdAzqpTLUv8MqpqM2t2Rnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XcxUc+IuwOCzeTRePaPETaBJTNxjUkcwGFz2+hndW5M=;
	b=VOmLbpkArlpO0YwX9UUEM0exJ37sBbQ80l2ybzJCdOV4pgfA24pLHG2cOxZs6FD3e7
	RqkgTHG14RgGDgEhKh06F8gbsqZZm9EVEecEuxqBSXAHnwDTU9+yR5wDsBnPBOSV9wR0
	ZWuV8lY43D4q4t6S2vAcqb4a683XUJuK/3ta3zs+DGLALw4+fzJUpUaASvNzSU/pohTt
	M6naKuJANQ5r9Nh6IzLSO34rTqbUs4YcS/nrszsa/vBLB/sfDd6PNstWyYHJuapQJvOC
	fFj+Euc0f30YLrYCwdEJOIhC9ri9+RekuK0DZ5o6qNAcOcEt3NjH8KJeDvJIaBO+rUnr
	LXyg==
X-Gm-Message-State: APt69E1Q+E7AZ7MvIvzayTuEfR0YBAVs83mbvBC8JnEFaVfCmXxUQlZ+
	0dM5SBU3BylfnXcvv4TTqfMolA==
X-Received: by 2002:a65:43cb:: with SMTP id
	n11-v6mr3721372pgp.234.1530074040658; 
	Tue, 26 Jun 2018 21:34:00 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:14 -0700
Message-Id: <20180627043328.11531-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: [Qemu-arm] [PATCH v6 21/35] target/arm: Implement SVE FP Compare
 with Zero Group
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
X-TUID: gcP0UibUucdU

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 42 +++++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 10 +++++++++
 4 files changed, 138 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ff69d143a0..44a98440c9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -767,6 +767,48 @@ DEF_HELPER_FLAGS_5(sve_fadda_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_fadda_d, TCG_CALL_NO_RWG,
                    i64, i64, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fcmge0_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmge0_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmge0_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcmgt0_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmgt0_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmgt0_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcmlt0_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmlt0_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmlt0_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcmle0_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmle0_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmle0_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcmeq0_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmeq0_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmeq0_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcmne0_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmne0_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcmne0_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve_fadd_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve_fadd_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4c44d52a23..0486cb1e5e 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3362,6 +3362,8 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
 
 #define DO_FCMGE(TYPE, X, Y, ST)  TYPE##_compare(Y, X, ST) <= 0
 #define DO_FCMGT(TYPE, X, Y, ST)  TYPE##_compare(Y, X, ST) < 0
+#define DO_FCMLE(TYPE, X, Y, ST)  TYPE##_compare(X, Y, ST) <= 0
+#define DO_FCMLT(TYPE, X, Y, ST)  TYPE##_compare(X, Y, ST) < 0
 #define DO_FCMEQ(TYPE, X, Y, ST)  TYPE##_compare_quiet(X, Y, ST) == 0
 #define DO_FCMNE(TYPE, X, Y, ST)  TYPE##_compare_quiet(X, Y, ST) != 0
 #define DO_FCMUO(TYPE, X, Y, ST)  \
@@ -3385,6 +3387,47 @@ DO_FPCMP_PPZZ_ALL(sve_facgt, DO_FACGT)
 #undef DO_FPCMP_PPZZ_H
 #undef DO_FPCMP_PPZZ
 
+/* One operand floating-point comparison against zero, controlled
+ * by a predicate.
+ */
+#define DO_FPCMP_PPZ0(NAME, TYPE, H, OP)                   \
+void HELPER(NAME)(void *vd, void *vn, void *vg,            \
+                  void *status, uint32_t desc)             \
+{                                                          \
+    intptr_t i = simd_oprsz(desc), j = (i - 1) >> 6;       \
+    uint64_t *d = vd, *g = vg;                             \
+    do {                                                   \
+        uint64_t out = 0, pg = g[j];                       \
+        do {                                               \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);       \
+            if ((pg >> (i & 63)) & 1) {                    \
+                TYPE nn = *(TYPE *)(vn + H(i));            \
+                out |= OP(TYPE, nn, 0, status);            \
+            }                                              \
+        } while (i & 63);                                  \
+        d[j--] = out;                                      \
+    } while (i > 0);                                       \
+}
+
+#define DO_FPCMP_PPZ0_H(NAME, OP) \
+    DO_FPCMP_PPZ0(NAME##_h, float16, H1_2, OP)
+#define DO_FPCMP_PPZ0_S(NAME, OP) \
+    DO_FPCMP_PPZ0(NAME##_s, float32, H1_4, OP)
+#define DO_FPCMP_PPZ0_D(NAME, OP) \
+    DO_FPCMP_PPZ0(NAME##_d, float64,     , OP)
+
+#define DO_FPCMP_PPZ0_ALL(NAME, OP) \
+    DO_FPCMP_PPZ0_H(NAME, OP)   \
+    DO_FPCMP_PPZ0_S(NAME, OP)   \
+    DO_FPCMP_PPZ0_D(NAME, OP)
+
+DO_FPCMP_PPZ0_ALL(sve_fcmge0, DO_FCMGE)
+DO_FPCMP_PPZ0_ALL(sve_fcmgt0, DO_FCMGT)
+DO_FPCMP_PPZ0_ALL(sve_fcmle0, DO_FCMLE)
+DO_FPCMP_PPZ0_ALL(sve_fcmlt0, DO_FCMLT)
+DO_FPCMP_PPZ0_ALL(sve_fcmeq0, DO_FCMEQ)
+DO_FPCMP_PPZ0_ALL(sve_fcmne0, DO_FCMNE)
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1dcc2d38c9..cfee256be9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3554,6 +3554,49 @@ static bool trans_FRSQRTE(DisasContext *s, arg_rr_esz *a, uint32_t insn)
     return true;
 }
 
+/*
+ *** SVE Floating Point Compare with Zero Group
+ */
+
+static void do_ppz_fp(DisasContext *s, arg_rpr_esz *a,
+                      gen_helper_gvec_3_ptr *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+
+    tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       pred_full_reg_offset(s, a->pg),
+                       status, vsz, vsz, 0, fn);
+    tcg_temp_free_ptr(status);
+}
+
+#define DO_PPZ(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a, uint32_t insn) \
+{                                                                 \
+    static gen_helper_gvec_3_ptr * const fns[3] = {               \
+        gen_helper_sve_##name##_h,                                \
+        gen_helper_sve_##name##_s,                                \
+        gen_helper_sve_##name##_d,                                \
+    };                                                            \
+    if (a->esz == 0) {                                            \
+        return false;                                             \
+    }                                                             \
+    if (sve_access_check(s)) {                                    \
+        do_ppz_fp(s, a, fns[a->esz - 1]);                         \
+    }                                                             \
+    return true;                                                  \
+}
+
+DO_PPZ(FCMGE_ppz0, fcmge0)
+DO_PPZ(FCMGT_ppz0, fcmgt0)
+DO_PPZ(FCMLE_ppz0, fcmle0)
+DO_PPZ(FCMLT_ppz0, fcmlt0)
+DO_PPZ(FCMEQ_ppz0, fcmeq0)
+DO_PPZ(FCMNE_ppz0, fcmne0)
+
+#undef DO_PPZ
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ca93bdb2b3..a774becd6c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -140,6 +140,7 @@
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
 @rd_pg4_pn      ........ esz:2 ... ... .. pg:4 . rn:4 rd:5      &rpr_esz
+@pd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 . rd:4     &rpr_esz
 
 # One register operand, with governing predicate, no vector element size
 @rd_pg_rn_e0    ........ .. ... ... ... pg:3 rn:5 rd:5          &rpr_esz esz=0
@@ -748,6 +749,15 @@ FMINV           01100101 .. 000 111 001 ... ..... .....         @rd_pg_rn
 FRECPE          01100101 .. 001 110 001100 ..... .....          @rd_rn
 FRSQRTE         01100101 .. 001 111 001100 ..... .....          @rd_rn
 
+### SVE FP Compare with Zero Group
+
+FCMGE_ppz0      01100101 .. 0100 00 001 ... ..... 0 ....        @pd_pg_rn
+FCMGT_ppz0      01100101 .. 0100 00 001 ... ..... 1 ....        @pd_pg_rn
+FCMLT_ppz0      01100101 .. 0100 01 001 ... ..... 0 ....        @pd_pg_rn
+FCMLE_ppz0      01100101 .. 0100 01 001 ... ..... 1 ....        @pd_pg_rn
+FCMEQ_ppz0      01100101 .. 0100 10 001 ... ..... 0 ....        @pd_pg_rn
+FCMNE_ppz0      01100101 .. 0100 11 001 ... ..... 0 ....        @pd_pg_rn
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.17.1

