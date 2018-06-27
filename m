Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5773630wrq;
        Tue, 26 Jun 2018 21:40:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcZbliTZ4+V8L6q3/+5XLQeKXm8v5x27kp/WR5bB+fNhWnWUdtgyZ3j8R6nIOY+FfiGQ8GG
X-Received: by 2002:ac8:2e83:: with SMTP id h3-v6mr4005407qta.365.1530074413158;
        Tue, 26 Jun 2018 21:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074413; cv=none;
        d=google.com; s=arc-20160816;
        b=YBU+QhhOMTCpbiyWjwEoKR+VWjo8AkEo6F24ETitkdXhs5Qps1brhSBngdtLyQrq80
         yGKLx1oezQ2OjNhPzQsU/yZj20GmmfWheGckk9ej8xOG8zdKSyE4fGI/YdWCpMHOntQE
         jtULQx7mjuypAXCgR73DRi9MICVU+QQoUFpYSuFJyo5UGmjqrh3RUN8qLGptlSjLFJyp
         ffYtICuVWFmHCW+b/IUKylFk7e2i92pTcF12ho2hlbs+Ymh9J7trWkomEPs5TWZev7Yi
         a4dRNbDCx5UjITZ3FO64flJ5lY72xI6qqq/7e8nELeHvyUnIFP1JNgiJqKY+QU8BHlie
         l2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=S1V2am/qIvokLBP9WK4jWvopleanf//7wXvzpKLZj44=;
        b=VkCCDNgZb5IlA/wgMyQm8qbru9RMggUsSBre9+vVvZXvu3HAauTnrQ3wP6vavqKfQH
         Nhc09qJfSOoEOTBDwqqlU680A6Lg9kGeXvgkBiNYGkl/reLpostrdI+nv30WGc2iC2/X
         wpyBv+S0zFEJZvTkkC8reNIKzorHJ0KAXKi56Pidt+KJ7za+Gog5DD9AhpftLx+mB+JL
         SoUaSRFHFgAoBvB9zX6a4evImUQuoWDDY7qLCvPJmPZaAv0Et8+aHXtX6F/N1xv513yC
         Ybghpfd/TCi0arqJsT/wktUs6Jy9XyjqhzdsTnt4FzZsxm4yvuwTLbkpA7WT6JZO/SW1
         9kXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4HrwqLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si1013092qts.384.2018.06.26.21.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4HrwqLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2FY-000107-JQ
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:40:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29I-00047u-VL
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29F-0000B1-6k
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:44 -0400
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:47093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29E-00009V-P5
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:41 -0400
Received: by mail-pg0-x22e.google.com with SMTP id q14-v6so354733pgt.13
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S1V2am/qIvokLBP9WK4jWvopleanf//7wXvzpKLZj44=;
	b=j4HrwqLPSMc0eaaPJMnLNeWUpzUnPW5Me3DuOiAvWg349qRXNTuhNCEsk8YVTSaFDq
	FXYFngeYDxWQVYGGPcps/wNZeKOtI7Ma0k++BnEG+IJu2l2zVk8zEEXiTfhKVhvukVcR
	xVxWjinPhKNpYwNJDidVkhCWxDWi2Xu96Me5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S1V2am/qIvokLBP9WK4jWvopleanf//7wXvzpKLZj44=;
	b=SCXpU0mBPzzoczbNsVeuRy8r9D6RbN9kDfo5CAdcANsq8bH7MbtQtU1KOz4eYRR4NO
	0mF3p6Lf5jcUxs1YsGK1ZZ7BBj9EtbBP1WERZx/J7ZrUlJWAOnIKW/UUw4JMmTpGME/v
	LFTCWaTfSvrxEDztzo6TRgS6j2vQKB5XsuBfHiVv8FTtNKdUodTqdP9M7DUKGuw6QX+h
	vXSlgsTI0X+OIcqA7kOPup1vhNjD+AO+udemq3PJG1FJHSMh/BVF8b92pl5TYak1KG6m
	f+WfPcCdrjbbizdeyQHyqeGoZY/WnmLw4qAGtGCVhIqHQNmyyCxhHimY5vzK1Tk2XARr
	Yfjw==
X-Gm-Message-State: APt69E1z1zKxphLErCRNwqB3adAMcv4L5P7RKuDOE0nfrfYWbZQ9hWiI
	Td/yZvj0/WlVy8M+db2oDFp4fw==
X-Received: by 2002:a63:82c7:: with SMTP id
	w190-v6mr3745245pgd.253.1530074019611; 
	Tue, 26 Jun 2018 21:33:39 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:32:59 -0700
Message-Id: <20180627043328.11531-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
Subject: [Qemu-arm] [PATCH v6 06/35] target/arm: Implement SVE
 floating-point arithmetic (predicated)
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
X-TUID: jNBiwyvUOhsu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 77 +++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 89 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 46 ++++++++++++++++++++
 target/arm/sve.decode      | 17 ++++++++
 4 files changed, 229 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 185112e1d2..4097b55f0e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -720,6 +720,83 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve_fadd_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fadd_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fadd_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fsub_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fsub_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fsub_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmul_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmul_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmul_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fdiv_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fdiv_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fdiv_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmin_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmin_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmin_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmax_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmax_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmax_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fminnum_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fminnum_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fminnum_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmaxnum_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmaxnum_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmaxnum_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fabd_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fabd_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fabd_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fscalbn_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fscalbn_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fscalbn_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmulx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmulx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmulx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 031bec22df..3401662397 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2811,6 +2811,95 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+/* Fully general three-operand expander, controlled by a predicate,
+ * With the extra float_status parameter.
+ */
+#define DO_ZPZZ_FP(NAME, TYPE, H, OP)                           \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,       \
+                  void *status, uint32_t desc)                  \
+{                                                               \
+    intptr_t i = simd_oprsz(desc);                              \
+    uint64_t *g = vg;                                           \
+    do {                                                        \
+        uint64_t pg = g[(i - 1) >> 6];                          \
+        do {                                                    \
+            i -= sizeof(TYPE);                                  \
+            if (likely((pg >> (i & 63)) & 1)) {                 \
+                TYPE nn = *(TYPE *)(vn + H(i));                 \
+                TYPE mm = *(TYPE *)(vm + H(i));                 \
+                *(TYPE *)(vd + H(i)) = OP(nn, mm, status);      \
+            }                                                   \
+        } while (i & 63);                                       \
+    } while (i != 0);                                           \
+}
+
+DO_ZPZZ_FP(sve_fadd_h, uint16_t, H1_2, float16_add)
+DO_ZPZZ_FP(sve_fadd_s, uint32_t, H1_4, float32_add)
+DO_ZPZZ_FP(sve_fadd_d, uint64_t,     , float64_add)
+
+DO_ZPZZ_FP(sve_fsub_h, uint16_t, H1_2, float16_sub)
+DO_ZPZZ_FP(sve_fsub_s, uint32_t, H1_4, float32_sub)
+DO_ZPZZ_FP(sve_fsub_d, uint64_t,     , float64_sub)
+
+DO_ZPZZ_FP(sve_fmul_h, uint16_t, H1_2, float16_mul)
+DO_ZPZZ_FP(sve_fmul_s, uint32_t, H1_4, float32_mul)
+DO_ZPZZ_FP(sve_fmul_d, uint64_t,     , float64_mul)
+
+DO_ZPZZ_FP(sve_fdiv_h, uint16_t, H1_2, float16_div)
+DO_ZPZZ_FP(sve_fdiv_s, uint32_t, H1_4, float32_div)
+DO_ZPZZ_FP(sve_fdiv_d, uint64_t,     , float64_div)
+
+DO_ZPZZ_FP(sve_fmin_h, uint16_t, H1_2, float16_min)
+DO_ZPZZ_FP(sve_fmin_s, uint32_t, H1_4, float32_min)
+DO_ZPZZ_FP(sve_fmin_d, uint64_t,     , float64_min)
+
+DO_ZPZZ_FP(sve_fmax_h, uint16_t, H1_2, float16_max)
+DO_ZPZZ_FP(sve_fmax_s, uint32_t, H1_4, float32_max)
+DO_ZPZZ_FP(sve_fmax_d, uint64_t,     , float64_max)
+
+DO_ZPZZ_FP(sve_fminnum_h, uint16_t, H1_2, float16_minnum)
+DO_ZPZZ_FP(sve_fminnum_s, uint32_t, H1_4, float32_minnum)
+DO_ZPZZ_FP(sve_fminnum_d, uint64_t,     , float64_minnum)
+
+DO_ZPZZ_FP(sve_fmaxnum_h, uint16_t, H1_2, float16_maxnum)
+DO_ZPZZ_FP(sve_fmaxnum_s, uint32_t, H1_4, float32_maxnum)
+DO_ZPZZ_FP(sve_fmaxnum_d, uint64_t,     , float64_maxnum)
+
+static inline float16 abd_h(float16 a, float16 b, float_status *s)
+{
+    return float16_abs(float16_sub(a, b, s));
+}
+
+static inline float32 abd_s(float32 a, float32 b, float_status *s)
+{
+    return float32_abs(float32_sub(a, b, s));
+}
+
+static inline float64 abd_d(float64 a, float64 b, float_status *s)
+{
+    return float64_abs(float64_sub(a, b, s));
+}
+
+DO_ZPZZ_FP(sve_fabd_h, uint16_t, H1_2, abd_h)
+DO_ZPZZ_FP(sve_fabd_s, uint32_t, H1_4, abd_s)
+DO_ZPZZ_FP(sve_fabd_d, uint64_t,     , abd_d)
+
+static inline float64 scalbn_d(float64 a, int64_t b, float_status *s)
+{
+    int b_int = MIN(MAX(b, INT_MIN), INT_MAX);
+    return float64_scalbn(a, b_int, s);
+}
+
+DO_ZPZZ_FP(sve_fscalbn_h, int16_t, H1_2, float16_scalbn)
+DO_ZPZZ_FP(sve_fscalbn_s, int32_t, H1_4, float32_scalbn)
+DO_ZPZZ_FP(sve_fscalbn_d, int64_t,     , scalbn_d)
+
+DO_ZPZZ_FP(sve_fmulx_h, uint16_t, H1_2, helper_advsimd_mulxh)
+DO_ZPZZ_FP(sve_fmulx_s, uint32_t, H1_4, helper_vfp_mulxs)
+DO_ZPZZ_FP(sve_fmulx_d, uint64_t,     , helper_vfp_mulxd)
+
+#undef DO_ZPZZ_FP
+
 /* Fully general two-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7639e589f5..4df5360da9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3425,6 +3425,52 @@ DO_FP3(FRSQRTS, rsqrts)
 
 #undef DO_FP3
 
+/*
+ *** SVE Floating Point Arithmetic - Predicated Group
+ */
+
+static bool do_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
+                       gen_helper_gvec_4_ptr *fn)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+#define DO_FP3(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a, uint32_t insn) \
+{                                                                   \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                 \
+        NULL, gen_helper_sve_##name##_h,                            \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d        \
+    };                                                              \
+    return do_zpzz_fp(s, a, fns[a->esz]);                           \
+}
+
+DO_FP3(FADD_zpzz, fadd)
+DO_FP3(FSUB_zpzz, fsub)
+DO_FP3(FMUL_zpzz, fmul)
+DO_FP3(FMIN_zpzz, fmin)
+DO_FP3(FMAX_zpzz, fmax)
+DO_FP3(FMINNM_zpzz, fminnum)
+DO_FP3(FMAXNM_zpzz, fmaxnum)
+DO_FP3(FABD, fabd)
+DO_FP3(FSCALE, fscalbn)
+DO_FP3(FDIV, fdiv)
+DO_FP3(FMULX, fmulx)
+
+#undef DO_FP3
 
 /*
  *** SVE Floating Point Unary Operations Prediated Group
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 3abdb87cf5..636212a638 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -684,6 +684,23 @@ FTSMUL          01100101 .. 0 ..... 000 011 ..... .....         @rd_rn_rm
 FRECPS          01100101 .. 0 ..... 000 110 ..... .....         @rd_rn_rm
 FRSQRTS         01100101 .. 0 ..... 000 111 ..... .....         @rd_rn_rm
 
+### SVE FP Arithmetic Predicated Group
+
+# SVE floating-point arithmetic (predicated)
+FADD_zpzz       01100101 .. 00 0000 100 ... ..... .....    @rdn_pg_rm
+FSUB_zpzz       01100101 .. 00 0001 100 ... ..... .....    @rdn_pg_rm
+FMUL_zpzz       01100101 .. 00 0010 100 ... ..... .....    @rdn_pg_rm
+FSUB_zpzz       01100101 .. 00 0011 100 ... ..... .....    @rdm_pg_rn # FSUBR
+FMAXNM_zpzz     01100101 .. 00 0100 100 ... ..... .....    @rdn_pg_rm
+FMINNM_zpzz     01100101 .. 00 0101 100 ... ..... .....    @rdn_pg_rm
+FMAX_zpzz       01100101 .. 00 0110 100 ... ..... .....    @rdn_pg_rm
+FMIN_zpzz       01100101 .. 00 0111 100 ... ..... .....    @rdn_pg_rm
+FABD            01100101 .. 00 1000 100 ... ..... .....    @rdn_pg_rm
+FSCALE          01100101 .. 00 1001 100 ... ..... .....    @rdn_pg_rm
+FMULX           01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
+FDIV            01100101 .. 00 1100 100 ... ..... .....    @rdm_pg_rn # FDIVR
+FDIV            01100101 .. 00 1101 100 ... ..... .....    @rdn_pg_rm
+
 ### SVE FP Unary Operations Predicated Group
 
 # SVE integer convert to floating-point
-- 
2.17.1

