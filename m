Received: by 10.28.71.27 with SMTP id u27csp2110071wma;
        Sat, 17 Feb 2018 11:21:18 -0800 (PST)
X-Google-Smtp-Source: AH8x224VBrskxJU/X7S3viPmfPKqDSWyVcRnkcHfxgYxKaV4JrAONjIOD97e1FniHuHAe3/MZvXO
X-Received: by 10.37.33.70 with SMTP id h67mr2123331ybh.412.1518895278535;
        Sat, 17 Feb 2018 11:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895278; cv=none;
        d=google.com; s=arc-20160816;
        b=puVCv4FrKdxkl8UkF3FS0KskWC9GOc73rzdXK0zcwJXjFJBCjBtrcXoVonbCyXsf9J
         9TtnY+ShfIvPJWgiJ2QFlQ8T+H6f3uwK9b6l9ehbDm3JoTR7o6ZjOpna/xT0vfgBwPW4
         qy4z7MO6yir7ky0Gu0ald4dIn/6WeuC9DWgkqCuQWOxuc+YAirDqL6n+muuOOLeFTVoS
         aYS2W2irZx+GKjxBIX6DdG+IlFg2jy3MckIqKjP3hIoWsSL0m5Qnx7qYDJS8w3L6N8iC
         TnyHX99rZCHz0lSvYLT3NNwClKKUjN/gY+1tnaw40vkzq6GHBrVgn5EbKbBd5psxJww2
         xBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8A9oZaEU1Q/sjBJ+Ds3RtyUVolRFNfgjtMee6G1xKSw=;
        b=C0KBnIxG8ryTX4gencs9aJYteMrsQ5BrMEprcICjgObfcGoLI1MTKqOdm8RVN1idkA
         DXdmXACFYGJL8o4gWxU/XPoXZ5Ga87BIpRw/w7cTW0rZlLQ3rkbx3t87Yq93d42mIDdx
         2gbRDUMfAZI3MMtbhntxSfekUkZFv5Z3nqMtQMtw1cY89Hm+Tncl0w94pI+OYvhH/Ta7
         mG0lI+CC1HP3/Z0homx3ayhvcq2uiM+06xtc0I4mlsycGbts7d70GZ3d6NrvKYWw/qVn
         73ObbesRDWIVGSjjcNWT3Bqd3eEG9WbfFrweXwFoKjbaSVlLPZ68YXzZbjrMgbX94VD9
         qtlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ILmJkAB/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 205si1687444ybd.23.2018.02.17.11.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:21:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ILmJkAB/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en82v-000826-RU
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:21:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AW-0001pi-Ly
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AV-0002FS-4i
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:04 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:42014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AU-0002Ev-Sd
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:03 -0500
Received: by mail-pg0-x242.google.com with SMTP id y8so4343546pgr.9
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8A9oZaEU1Q/sjBJ+Ds3RtyUVolRFNfgjtMee6G1xKSw=;
	b=ILmJkAB/QmiKvyTrvdZRU0xnCcOuTiKT0Up+kSeGeb6kH6WW9ZIl17bj9FrGzt0OkX
	AqvDcJI3dZDr/DeiohFASo5cXa46yqZ1uCoFvkBeFq5s4U0sjPOb0oVcsZveVgXtZkh2
	6GIr76f5UCROG2O6+dJ9UBMwxpDHTIhe7XvGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8A9oZaEU1Q/sjBJ+Ds3RtyUVolRFNfgjtMee6G1xKSw=;
	b=ER8FkX1HWvh/HF4TFPHyYN8Re5IZq/ofHTqzqXi6KUhY85B8f0YsdcCuYvsikq7bpG
	tc/XDU/LKjU+PlLWv6QxbtxpE3y6u5QVsTvC+PudPLt35cZ7ZnbuHl5P2WdfGCMKkwJZ
	OOucRtcKGEH+I0HzP+ryV2HXIcWXfc7Lqjfpwzdehyu0mvJxjjcxJrWGWLn8dWRufC6A
	nw7GaXTM2zTPwYd+su2AQqqToLUPV/XlEWKZAM+2KcbakjEOjryRWNDVxYcam2Cjdrqr
	VlL/gN8s91B+rW4b2Y8rNfFk5ZmMb3/G+YW27PrCENR8Gk0lekHk3WXqUMcWN7ZbWAqJ
	ClXQ==
X-Gm-Message-State: APf1xPAnZTTBxATkETHivuCaAmYneEkQqMSFum/Xo7gPBjVmYLnGyxBX
	0ldGFg3mIMpY2G2oQZ+x5UgkCyNQ6rs=
X-Received: by 10.99.125.74 with SMTP id m10mr8493057pgn.354.1518891901572;
	Sat, 17 Feb 2018 10:25:01 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.25.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:25:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:16 -0800
Message-Id: <20180217182323.25885-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v2 60/67] target/arm: Implement SVE FP Fast
 Reduction Group
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
X-TUID: Yw8d/g/HEP1q

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 35 ++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 55 +++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++++
 4 files changed, 159 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7ada12687b..c07b2245ba 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -725,6 +725,41 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_faddv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_faddv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_faddv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_fmaxnmv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fmaxnmv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fmaxnmv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_fminnmv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fminnmv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fminnmv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_fmaxv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fmaxv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fmaxv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_fminv_h, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fminv_s, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fminv_d, TCG_CALL_NO_RWG,
+                   i64, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_fadda_h, TCG_CALL_NO_RWG,
                    i64, i64, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_fadda_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9378c8f0b2..29deefcd86 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2832,6 +2832,67 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+/* Recursive reduction on a function;
+ * C.f. the ARM ARM function ReducePredicated.
+ *
+ * While it would be possible to write this without the DATA temporary,
+ * it is much simpler to process the predicate register this way.
+ * The recursion is bounded to depth 7 (128 fp16 elements), so there's
+ * little to gain with a more complex non-recursive form.
+ */
+#define DO_REDUCE(NAME, TYPE, H, FUNC, IDENT)                         \
+static TYPE NAME##_reduce(TYPE *data, float_status *status, uintptr_t n) \
+{                                                                     \
+    if (n == 1) {                                                     \
+        return *data;                                                 \
+    } else {                                                          \
+        uintptr_t half = n / 2;                                       \
+        TYPE lo = NAME##_reduce(data, status, half);                  \
+        TYPE hi = NAME##_reduce(data + half, status, half);           \
+        return TYPE##_##FUNC(lo, hi, status);                         \
+    }                                                                 \
+}                                                                     \
+uint64_t HELPER(NAME)(void *vn, void *vg, void *vs, uint32_t desc)    \
+{                                                                     \
+    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_maxsz(desc);  \
+    TYPE data[sizeof(ARMVectorReg) / sizeof(TYPE)];                   \
+    for (i = 0; i < oprsz; ) {                                        \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
+        do {                                                          \
+            TYPE nn = *(TYPE *)(vn + H(i));                           \
+            *(TYPE *)((void *)data + i) = (pg & 1 ? nn : IDENT);      \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                   \
+        } while (i & 15);                                             \
+    }                                                                 \
+    for (; i < maxsz; i += sizeof(TYPE)) {                            \
+        *(TYPE *)((void *)data + i) = IDENT;                          \
+    }                                                                 \
+    return NAME##_reduce(data, vs, maxsz / sizeof(TYPE));             \
+}
+
+DO_REDUCE(sve_faddv_h, float16, H1_2, add, float16_zero)
+DO_REDUCE(sve_faddv_s, float32, H1_4, add, float32_zero)
+DO_REDUCE(sve_faddv_d, float64,     , add, float64_zero)
+
+/* Identity is floatN_default_nan, without the function call.  */
+DO_REDUCE(sve_fminnmv_h, float16, H1_2, minnum, 0x7E00)
+DO_REDUCE(sve_fminnmv_s, float32, H1_4, minnum, 0x7FC00000)
+DO_REDUCE(sve_fminnmv_d, float64,     , minnum, 0x7FF8000000000000ULL)
+
+DO_REDUCE(sve_fmaxnmv_h, float16, H1_2, maxnum, 0x7E00)
+DO_REDUCE(sve_fmaxnmv_s, float32, H1_4, maxnum, 0x7FC00000)
+DO_REDUCE(sve_fmaxnmv_d, float64,     , maxnum, 0x7FF8000000000000ULL)
+
+DO_REDUCE(sve_fminv_h, float16, H1_2, min, float16_infinity)
+DO_REDUCE(sve_fminv_s, float32, H1_4, min, float32_infinity)
+DO_REDUCE(sve_fminv_d, float64,     , min, float64_infinity)
+
+DO_REDUCE(sve_fmaxv_h, float16, H1_2, max, float16_chs(float16_infinity))
+DO_REDUCE(sve_fmaxv_s, float32, H1_4, max, float32_chs(float32_infinity))
+DO_REDUCE(sve_fmaxv_d, float64,     , max, float64_chs(float64_infinity))
+
+#undef DO_REDUCE
+
 uint64_t HELPER(sve_fadda_h)(uint64_t nn, void *vm, void *vg,
                              void *status, uint32_t desc)
 {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cf2a4d3284..a77ddf0f4b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3180,6 +3180,61 @@ static void trans_FMUL_zzx(DisasContext *s, arg_FMUL_zzx *a, uint32_t insn)
     tcg_temp_free_ptr(status);
 }
 
+/*
+ *** SVE Floating Point Fast Reduction Group
+ */
+
+typedef void gen_helper_fp_reduce(TCGv_i64, TCGv_ptr, TCGv_ptr,
+                                  TCGv_ptr, TCGv_i32);
+
+static void do_reduce(DisasContext *s, arg_rpr_esz *a,
+                      gen_helper_fp_reduce *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned p2vsz = pow2ceil(vsz);
+    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, p2vsz, 0));
+    TCGv_ptr t_zn, t_pg, status;
+    TCGv_i64 temp;
+
+    temp = tcg_temp_new_i64();
+    t_zn = tcg_temp_new_ptr();
+    t_pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
+    status = get_fpstatus_ptr(a->esz == MO_16);
+
+    fn(temp, t_zn, t_pg, status, t_desc);
+    tcg_temp_free_ptr(t_zn);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_ptr(status);
+    tcg_temp_free_i32(t_desc);
+
+    write_fp_dreg(s, a->rd, temp);
+    tcg_temp_free_i64(temp);
+}
+
+#define DO_VPZ(NAME, name) \
+static void trans_##NAME(DisasContext *s, arg_rpr_esz *a, uint32_t insn) \
+{                                                                        \
+    static gen_helper_fp_reduce * const fns[3] = {                       \
+        gen_helper_sve_##name##_h,                                       \
+        gen_helper_sve_##name##_s,                                       \
+        gen_helper_sve_##name##_d,                                       \
+    };                                                                   \
+    if (a->esz == 0) {                                                   \
+        unallocated_encoding(s);                                         \
+        return;                                                          \
+    }                                                                    \
+    do_reduce(s, a, fns[a->esz - 1]);                                    \
+}
+
+DO_VPZ(FADDV, faddv)
+DO_VPZ(FMINNMV, fminnmv)
+DO_VPZ(FMAXNMV, fmaxnmv)
+DO_VPZ(FMINV, fminv)
+DO_VPZ(FMAXV, fmaxv)
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d16e733aa3..feb8c65e89 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -739,6 +739,14 @@ FMUL_zzx	01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
 FMUL_zzx	01100100 101 index:2 rm:3 001000 rn:5 rd:5	esz=2
 FMUL_zzx	01100100 111 index:1 rm:4 001000 rn:5 rd:5	esz=3
 
+### SVE FP Fast Reduction Group
+
+FADDV		01100101 .. 000 000 001 ... ..... .....		@rd_pg_rn
+FMAXNMV		01100101 .. 000 100 001 ... ..... .....		@rd_pg_rn
+FMINNMV		01100101 .. 000 101 001 ... ..... .....		@rd_pg_rn
+FMAXV		01100101 .. 000 110 001 ... ..... .....		@rd_pg_rn
+FMINV		01100101 .. 000 111 001 ... ..... .....		@rd_pg_rn
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.14.3

