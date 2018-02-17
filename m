Received: by 10.28.71.27 with SMTP id u27csp2097318wma;
        Sat, 17 Feb 2018 11:03:05 -0800 (PST)
X-Google-Smtp-Source: AH8x22701HIahRu7xyqCOJUs5+2WgT9Yc+9F2/idVwWNvyvkKbf9I+ue4t3AycvO9H2fu/Mk4pog
X-Received: by 10.37.179.77 with SMTP id k13mr7463777ybg.187.1518894185675;
        Sat, 17 Feb 2018 11:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894185; cv=none;
        d=google.com; s=arc-20160816;
        b=GPPkTII1n7l3T/tsz23g/k4eQReLd3xfM2XtQRL5WH5RxH9T9PeSEcq6aRLd93NEvF
         6FgPvLhNFs1oIPL2vuk8k5HCnX+zOYr5Am/4N6Z5BK2HpVhqXL7za3qY2ed4SirvBkbq
         Cz4ZSmFEWDr115/G9HPSnLv8Vttz9y0cdy6ppSVId/8rfPh4ap8C6M9A7mv8HqMvFl7a
         P9LVyryyqvD/SPRbC4JFoKoJBkdxDnsQRsLhnQrODuDrsHwhkb8Zb2hfMb7jdo3GE0BA
         PnIdQR6RhJW3Fwry6LxNoO4MfN9Oh9FZDVUde19HbTcSifjyRHiP7OWoPN+jgDv/zQvH
         NSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=oHroeQ0pW6nI9r1pBVle/D5G83QwYsIdCkVximFFDyU=;
        b=dwFIMqny48Hl0GPH8DJoMoa0kfkc6EvgC56CMF/BXrFhyJ0L2IUzgmhHcIEmznGCOI
         28iIknxbSxjhBx44wDxJa1R0n/jnIYPH7JkSVt3HTBfV0Wm8rASvPRAxqTFqdITFLsYr
         7x2lmDNSXvWdzVzQJFyUOlvHowunlJQzc1pJO3aZ+05NH9POzdhCsXLVOJmhfGratFmc
         BQQEnOpmjtgbiGiYCBeU1wQcf0PXLL4Bg17qEpRvrnhjV/v04xnYS3YkUYwe+t6p+H6c
         y/WfRgfGKStt191CNtMqOwFDasI4xSZjstSkNhci8WpVUajic9vm05srhnP5r1x4cXps
         v8Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eSaB5noF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si746422ybg.170.2018.02.17.11.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eSaB5noF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7lJ-0007tM-4F
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:03:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AT-0001lc-GZ
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AS-0002Dn-0f
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:01 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:37889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AR-0002DS-Oc
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:59 -0500
Received: by mail-pg0-x243.google.com with SMTP id l24so4354929pgc.5
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oHroeQ0pW6nI9r1pBVle/D5G83QwYsIdCkVximFFDyU=;
	b=eSaB5noFZRf1UWPb5mMz49m7GVFXpYPd0DlVoOpcubgaaPWOsc+aVd1Pj/vbPfuo2O
	vm9uCwojs6QevwjuphuP3/VAeRsW3llcI4qkyJ8c1qX2D37HGI1kudCFdBuRO4BpqAt9
	npfqENOlv9LSsSYjXHuGqq9jxVsiAmtKzzRy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oHroeQ0pW6nI9r1pBVle/D5G83QwYsIdCkVximFFDyU=;
	b=ohSMy1Dxe9zQnXev/xzcyXGwPY0aZ6TJbsCj2B3lHvwEvXme3iDF2lSCHfua0SzZQq
	5X99VRC664gexER8XxUCfLlm6/Otycg+5F4hQAAjk0+DWKMeSvWHGApQUcdoL5xYw51j
	JllZrHywDwhM8LEE+j31RE2GoYXS4qOgMJqBeW39n3GsyuAMcie+vbphpYbg+eXiKpL7
	NmG6D/bhXmegg+ptYZvCs8kEiwTHfqC54vRsSK03C3r8b+0AIRiTsEWgS1NcbrCxVYlF
	cwt+Y2kOg3pfelTFQlYnpR4uyZjm14F/YtxRbKZGxNyuLIsqz1ULqAebSYIC1CHdGWMr
	Kv3g==
X-Gm-Message-State: APf1xPCzws+PpYROYZnviQMIpYLcKO+dSlT/GCqL3h5IpsHlv5UyGt0Y
	p25mVKin9vHJGAvKQpRkf+FPSc8Mvuk=
X-Received: by 10.101.87.132 with SMTP id b4mr8350083pgr.332.1518891898432;
	Sat, 17 Feb 2018 10:24:58 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:14 -0800
Message-Id: <20180217182323.25885-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v2 58/67] target/arm: Implement SVE
 floating-point arithmetic with immediate
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5lyI/qXyyn99

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 56 +++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 14 +++++++++
 4 files changed, 211 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 30373e3fc7..7ada12687b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -809,6 +809,62 @@ DEF_HELPER_FLAGS_6(sve_fmulx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmulx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve_fadds_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fadds_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fadds_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fsubs_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fsubs_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fsubs_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmuls_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmuls_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmuls_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fsubrs_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fsubrs_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fsubrs_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmaxnms_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmaxnms_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmaxnms_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fminnms_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fminnms_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fminnms_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmaxs_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmaxs_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmaxs_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_fmins_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmins_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_fmins_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i64, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ace613684d..9378c8f0b2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2995,6 +2995,74 @@ DO_ZPZZ_FP_D(sve_fmulx_d, uint64_t, helper_vfp_mulxd)
 #undef DO_ZPZZ_FP
 #undef DO_ZPZZ_FP_D
 
+/* Three-operand expander, with one scalar operand, controlled by
+ * a predicate, with the extra float_status parameter.
+ */
+#define DO_ZPZS_FP(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint64_t scalar,  \
+                  void *status, uint32_t desc)                    \
+{                                                                 \
+    intptr_t i, opr_sz = simd_oprsz(desc);                        \
+    TYPE mm = scalar;                                             \
+    for (i = 0; i < opr_sz; ) {                                   \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));           \
+        do {                                                      \
+            if (pg & 1) {                                         \
+                TYPE nn = *(TYPE *)(vn + H(i));                   \
+                *(TYPE *)(vd + H(i)) = OP(nn, mm, status);        \
+            }                                                     \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);               \
+        } while (i & 15);                                         \
+    }                                                             \
+}
+
+DO_ZPZS_FP(sve_fadds_h, float16, H1_2, float16_add)
+DO_ZPZS_FP(sve_fadds_s, float32, H1_4, float32_add)
+DO_ZPZS_FP(sve_fadds_d, float64,     , float64_add)
+
+DO_ZPZS_FP(sve_fsubs_h, float16, H1_2, float16_sub)
+DO_ZPZS_FP(sve_fsubs_s, float32, H1_4, float32_sub)
+DO_ZPZS_FP(sve_fsubs_d, float64,     , float64_sub)
+
+DO_ZPZS_FP(sve_fmuls_h, float16, H1_2, float16_mul)
+DO_ZPZS_FP(sve_fmuls_s, float32, H1_4, float32_mul)
+DO_ZPZS_FP(sve_fmuls_d, float64,     , float64_mul)
+
+static inline float16 subr_h(float16 a, float16 b, float_status *s)
+{
+    return float16_sub(b, a, s);
+}
+
+static inline float32 subr_s(float32 a, float32 b, float_status *s)
+{
+    return float32_sub(b, a, s);
+}
+
+static inline float64 subr_d(float64 a, float64 b, float_status *s)
+{
+    return float64_sub(b, a, s);
+}
+
+DO_ZPZS_FP(sve_fsubrs_h, float16, H1_2, subr_h)
+DO_ZPZS_FP(sve_fsubrs_s, float32, H1_4, subr_s)
+DO_ZPZS_FP(sve_fsubrs_d, float64,     , subr_d)
+
+DO_ZPZS_FP(sve_fmaxnms_h, float16, H1_2, float16_maxnum)
+DO_ZPZS_FP(sve_fmaxnms_s, float32, H1_4, float32_maxnum)
+DO_ZPZS_FP(sve_fmaxnms_d, float64,     , float64_maxnum)
+
+DO_ZPZS_FP(sve_fminnms_h, float16, H1_2, float16_minnum)
+DO_ZPZS_FP(sve_fminnms_s, float32, H1_4, float32_minnum)
+DO_ZPZS_FP(sve_fminnms_d, float64,     , float64_minnum)
+
+DO_ZPZS_FP(sve_fmaxs_h, float16, H1_2, float16_max)
+DO_ZPZS_FP(sve_fmaxs_s, float32, H1_4, float32_max)
+DO_ZPZS_FP(sve_fmaxs_d, float64,     , float64_max)
+
+DO_ZPZS_FP(sve_fmins_h, float16, H1_2, float16_min)
+DO_ZPZS_FP(sve_fmins_s, float32, H1_4, float32_min)
+DO_ZPZS_FP(sve_fmins_d, float64,     , float64_min)
+
 /* Fully general two-operand expander, controlled by a predicate,
  * With the extra float_status parameter.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8fcb9dd2be..6ce1b01b9a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -32,6 +32,7 @@
 #include "exec/log.h"
 #include "trace-tcg.h"
 #include "translate-a64.h"
+#include "fpu/softfloat.h"
 
 typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
 typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t,
@@ -3265,6 +3266,78 @@ DO_FP3(FMULX, fmulx)
 
 #undef DO_FP3
 
+typedef void gen_helper_sve_fp2scalar(TCGv_ptr, TCGv_ptr, TCGv_ptr,
+                                      TCGv_i64, TCGv_ptr, TCGv_i32);
+
+static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
+                         TCGv_i64 scalar, gen_helper_sve_fp2scalar *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr t_zd, t_zn, t_pg, status;
+    TCGv_i32 desc;
+
+    t_zd = tcg_temp_new_ptr();
+    t_zn = tcg_temp_new_ptr();
+    t_pg = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, zd));
+    tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, zn));
+    tcg_gen_addi_ptr(t_pg, cpu_env, vec_full_reg_offset(s, pg));
+
+    status = get_fpstatus_ptr(is_fp16);
+    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    fn(t_zd, t_zn, t_pg, scalar, status, desc);
+
+    tcg_temp_free_i32(desc);
+    tcg_temp_free_ptr(status);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_ptr(t_zn);
+    tcg_temp_free_ptr(t_zd);
+}
+
+static void do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
+                      gen_helper_sve_fp2scalar *fn)
+{
+    TCGv_i64 temp = tcg_const_i64(imm);
+    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16, temp, fn);
+    tcg_temp_free_i64(temp);
+}
+
+#define DO_FP_IMM(NAME, name, const0, const1) \
+static void trans_##NAME##_zpzi(DisasContext *s, arg_rpri_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_sve_fp2scalar * const fns[3] = {                    \
+        gen_helper_sve_##name##_h,                                        \
+        gen_helper_sve_##name##_s,                                        \
+        gen_helper_sve_##name##_d                                         \
+    };                                                                    \
+    static uint64_t const val[3][2] = {                                   \
+        { float16_##const0, float16_##const1 },                           \
+        { float32_##const0, float32_##const1 },                           \
+        { float64_##const0, float64_##const1 },                           \
+    };                                                                    \
+    if (a->esz == 0) {                                                    \
+        unallocated_encoding(s);                                          \
+        return;                                                           \
+    }                                                                     \
+    do_fp_imm(s, a, val[a->esz - 1][a->imm], fns[a->esz - 1]);            \
+}
+
+#define float16_two  make_float16(0x4000)
+#define float32_two  make_float32(0x40000000)
+#define float64_two  make_float64(0x4000000000000000ULL)
+
+DO_FP_IMM(FADD, fadds, half, one)
+DO_FP_IMM(FSUB, fsubs, half, one)
+DO_FP_IMM(FMUL, fmuls, half, two)
+DO_FP_IMM(FSUBR, fsubrs, half, one)
+DO_FP_IMM(FMAXNM, fmaxnms, zero, one)
+DO_FP_IMM(FMINNM, fminnms, zero, one)
+DO_FP_IMM(FMAX, fmaxs, zero, one)
+DO_FP_IMM(FMIN, fmins, zero, one)
+
+#undef DO_FP_IMM
+
 static void do_fp_cmp(DisasContext *s, arg_rprr_esz *a,
                       gen_helper_gvec_4_ptr *fn)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f82cef2d7e..258d14b729 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -161,6 +161,10 @@
 @rdn_pg4	........ esz:2 .. pg:4 ... ........ rd:5 \
 		&rpri_esz rn=%reg_movprfx
 
+# Two register operand, one one-bit floating-point operand.
+@rdn_i1		........ esz:2 ......... pg:3 .... imm:1 rd:5 \
+		&rpri_esz rn=%reg_movprfx
+
 # Two register operand, one encoded bitmask.
 @rdn_dbm	........ .. .... dbm:13 rd:5 \
 		&rr_dbm rn=%reg_movprfx
@@ -748,6 +752,16 @@ FMULX		01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
 FDIV		01100101 .. 00 1100 100 ... ..... .....    @rdm_pg_rn # FDIVR
 FDIV		01100101 .. 00 1101 100 ... ..... .....    @rdn_pg_rm
 
+# SVE floating-point arithmetic with immediate (predicated)
+FADD_zpzi	01100101 .. 011 000 100 ... 0000 . .....	@rdn_i1
+FSUB_zpzi	01100101 .. 011 001 100 ... 0000 . .....	@rdn_i1
+FMUL_zpzi	01100101 .. 011 010 100 ... 0000 . .....	@rdn_i1
+FSUBR_zpzi	01100101 .. 011 011 100 ... 0000 . .....	@rdn_i1
+FMAXNM_zpzi	01100101 .. 011 100 100 ... 0000 . .....	@rdn_i1
+FMINNM_zpzi	01100101 .. 011 101 100 ... 0000 . .....	@rdn_i1
+FMAX_zpzi	01100101 .. 011 110 100 ... 0000 . .....	@rdn_i1
+FMIN_zpzi	01100101 .. 011 111 100 ... 0000 . .....	@rdn_i1
+
 ### SVE FP Multiply-Add Group
 
 # SVE floating-point multiply-accumulate writing addend
-- 
2.14.3

