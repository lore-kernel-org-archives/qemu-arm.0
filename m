Received: by 10.28.71.27 with SMTP id u27csp2095054wma;
        Sat, 17 Feb 2018 11:00:40 -0800 (PST)
X-Google-Smtp-Source: AH8x227OVBq3HhN7IHKcv16ZGfk6GUacwaRYc9EDxvRxymnuCIhLF9OPHhjNp4RR3G3XZlhOhgju
X-Received: by 10.129.124.137 with SMTP id x131mr7533190ywc.52.1518894040392;
        Sat, 17 Feb 2018 11:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894040; cv=none;
        d=google.com; s=arc-20160816;
        b=R/r+xOd+YxD80rs14anSSvWM4yjyQ3qULSRUIS2E6Qk3oITTwUiXQgPh8vvxfI9l7x
         TB8MtaM/I28r1/Dows2tRo3jhHjCqGds6LM0j5z1/PrG4DsqO0Cx66iFuVMMYL2zUWVr
         aROHawf9wjO5ZJOjAS5F3TNCph/1AKmus7IuCVcSNN7SU0hEZS3r+SXe3m3ysZ/rJ8q4
         lIpLX24tWDdnv+QNzY8qZeivYRjcjauz6WXQHIe9si2TnKw+V2kbO2VcgpvvQByzm/Xe
         BRPh4TU1arD7Da/f3mPesqJgFrxi+UJunltpWs00hK6tLqVDG+/FUj8gEWTKeRphSwbV
         GutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yqpNa6LdvOaBLZgG0e0TTv5WL7qSDCjvAX9y6/JraPc=;
        b=arXci13e+188p96/YLBedvhBg+rMFURwsUVQumdeMZymUQZnqdPsF/y61aX6croA2g
         Pn65VpbHNzb/0p/NOmNXzxco07Moh2ADif3FwhNGUHeRFQpZo3zNeYWplrrEzUbjzXv9
         WtH4t4Pn9MaW2j85jyfsC7GH+PeWmFdkzzV+yutb0L+XMtLT51GfuqY3yTjUne5ZKKWm
         Lv83VGo+58N8TtfISEpgmL6WTKaSm+frmL2Hgteu/h9meYtPevAFAnXYK00bwPh7Izan
         9EuOE1NH2YPWWx+O/aRlXNpzZvXScPe4LUlU3eEp5FqJ8jTi0WwFF3Nw2YRwMV3/R5zP
         1MmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OqrSJAuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b63si2068999ybb.436.2018.02.17.11.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:00:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OqrSJAuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7ix-0006R2-Mr
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:00:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AT-0001l5-6L
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AQ-0002Cp-68
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:01 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:41241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AP-0002CU-Uy
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:58 -0500
Received: by mail-pf0-x242.google.com with SMTP id 68so591403pfj.8
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yqpNa6LdvOaBLZgG0e0TTv5WL7qSDCjvAX9y6/JraPc=;
	b=OqrSJAuQChgvOEmzEAmyFOvFbm3TsWxQBjIYhQJMSHHzgzDoOWrrz9mlcLl7Ihr1UU
	JbqIFkORERW9MAn3xlIXMhjv/lVaFEv0uhv2FOBIi6xnrTjY1D+qKf1wzhV4cMLTCPAt
	gVgITEIfpQFpXzuXVynaDtZGp2OzG+59eZnE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yqpNa6LdvOaBLZgG0e0TTv5WL7qSDCjvAX9y6/JraPc=;
	b=SwSGe5rw5gtgBSJrhnQYhx0V8mNbXSDTs51gxUw+B6z0laccAHJqAQ0jET7zDCiIIa
	KH6S4vLEs2e2UR5aGtFcEI1o3m8zdWZqUyGpe9bK8RvZT+UjvNcZJTWU8qAl5mSFMTqA
	WcieMPLPZ95vd3jw1jjiBMJZdS6bbCmARNJYbhf1Et0h5qd3By6GLamgQB5LbyqvLUNb
	Gwk5u+DrZOoyR51HBwTv8sjqr2ssBdbDYnFLJVPPmKyfvaZ0dscHJ23S6iIxP6/5G3mY
	4dCr1FHP808Pe3YsgJjbU4fH2tsQjnNXVVWxUjuggBCIBKb9ZlWnA225pu7kRNEUHQwI
	B0ZA==
X-Gm-Message-State: APf1xPBfxBWIzsyT1cNVsatfNYvtEo0uxnhC+wLS3r5Odcz3tOdjfSpX
	T42SVGUS3qOXdFENWlWEFO+NcQ==
X-Received: by 10.99.113.90 with SMTP id b26mr8168202pgn.10.1518891896945;
	Sat, 17 Feb 2018 10:24:56 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:13 -0800
Message-Id: <20180217182323.25885-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 57/67] target/arm: Implement SVE
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nm4+l/xRAAkr

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 49 +++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 41 +++++++++++++++++++++++++++++
 target/arm/sve.decode      | 11 ++++++++
 4 files changed, 165 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3cb7ab9ef2..30373e3fc7 100644
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
index 4edd3d4367..ace613684d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3100,6 +3100,70 @@ DO_FMLA(sve_fnmls_zpzzz_d, 64, , 1, 1)
 
 #undef DO_FMLA
 
+/* Two operand floating-point comparison controlled by a predicate.
+ * Unlike the integer version, we are not allowed to optimistically
+ * compare operands, since the comparison may have side effects wrt
+ * the FPSR.
+ */
+#define DO_FPCMP_PPZZ(NAME, TYPE, H, OP)                                \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
+                  void *status, uint32_t desc)                          \
+{                                                                       \
+    intptr_t opr_sz = simd_oprsz(desc);                                 \
+    intptr_t i = opr_sz, j = ((opr_sz - 1) & -64) >> 3;                 \
+    do {                                                                \
+        uint64_t out = 0;                                               \
+        uint64_t pg = *(uint64_t *)(vg + j);                            \
+        do {                                                            \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                    \
+            if ((pg >> (i & 63)) & 1) {                                 \
+                TYPE nn = *(TYPE *)(vn + H(i));                         \
+                TYPE mm = *(TYPE *)(vm + H(i));                         \
+                out |= OP(TYPE, nn, mm, status);                        \
+            }                                                           \
+        } while (i & 63);                                               \
+        *(uint64_t *)(vd + j) = out;                                    \
+        j -= 8;                                                         \
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
index 0241e8e707..8fcb9dd2be 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3265,6 +3265,47 @@ DO_FP3(FMULX, fmulx)
 
 #undef DO_FP3
 
+static void do_fp_cmp(DisasContext *s, arg_rprr_esz *a,
+                      gen_helper_gvec_4_ptr *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status;
+
+    if (fn == NULL) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    status = get_fpstatus_ptr(a->esz == MO_16);
+    tcg_gen_gvec_4_ptr(pred_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       pred_full_reg_offset(s, a->pg),
+                       status, vsz, vsz, 0, fn);
+    tcg_temp_free_ptr(status);
+}
+
+#define DO_FPCMP(NAME, name) \
+static void trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a,     \
+                                uint32_t insn)                        \
+{                                                                     \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                   \
+        NULL, gen_helper_sve_##name##_h,                              \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d          \
+    };                                                                \
+    do_fp_cmp(s, a, fns[a->esz]);                                     \
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
 
 static void do_fmla(DisasContext *s, arg_rprrr_esz *a, gen_helper_sve_fmla *fn)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6ccb4289fc..f82cef2d7e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -321,6 +321,17 @@ UXTH		00000100 .. 010 011 101 ... ..... .....		@rd_pg_rn
 SXTW		00000100 .. 010 100 101 ... ..... .....		@rd_pg_rn
 UXTW		00000100 .. 010 101 101 ... ..... .....		@rd_pg_rn
 
+### SVE Floating Point Compare - Vectors Group
+
+# SVE floating-point compare vectors
+FCMGE_ppzz	01100101 .. 0 ..... 010 ... ..... 0 ....	@pd_pg_rn_rm
+FCMGT_ppzz	01100101 .. 0 ..... 010 ... ..... 1 ....	@pd_pg_rn_rm
+FCMEQ_ppzz	01100101 .. 0 ..... 011 ... ..... 0 ....	@pd_pg_rn_rm
+FCMNE_ppzz	01100101 .. 0 ..... 011 ... ..... 1 ....	@pd_pg_rn_rm
+FCMUO_ppzz	01100101 .. 0 ..... 110 ... ..... 0 ....	@pd_pg_rn_rm
+FACGE_ppzz	01100101 .. 0 ..... 110 ... ..... 1 ....	@pd_pg_rn_rm
+FACGT_ppzz	01100101 .. 0 ..... 111 ... ..... 1 ....	@pd_pg_rn_rm
+
 ### SVE Integer Multiply-Add Group
 
 # SVE integer multiply-add writing addend (predicated)
-- 
2.14.3

