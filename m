Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5781850wrq;
        Tue, 26 Jun 2018 21:53:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcRDDJIlItDqmOR2PJ8hvvEKKe9X2lk3T/G10d72O436lL2zsvtymISIL8TFRMEKHQk4voy
X-Received: by 2002:a37:c394:: with SMTP id r20-v6mr3875072qkl.372.1530075212824;
        Tue, 26 Jun 2018 21:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075212; cv=none;
        d=google.com; s=arc-20160816;
        b=VfpJ8vej9gonvTzJXRkAYNxJaSXHz3xYq2EbPPIY3+n2guDlMBENHoFL/M/H6Qip9s
         MbLdcF+p/3LXVN/vKZb9U8iamTKlcvSZ3RN35Ke1BwuYQR6d2032b8TCtH0GB/v+lkds
         wbvT/88XcPqjGYI0ykfT1DQNKSRbXzaYJwrY8lzvpl6PrwtDkLNOjM0CdCnL4F+huHiw
         jjsCpReMY9aX3lfZy0OYoncNs2+x2XUYTMBTGpdoFuN7DNgh8/p/YESQ5dQxKcnTYk9n
         YvljVtBjNbVSlE9BLPqFd2hkVhj+hkKap2zp0U3OjlK/blrhsKBGJEvKryH2kINHS8/s
         soHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BdZt6i8MbMPKk1Bf9oqfvRlv/ASYX8to6Ot9k54XpXg=;
        b=GvPPRnWESIKGFG59do4dwDtgn5H+p+Dy4JI2u4S5IlIwXFSVByJEg4o5yGB3Pbq3IB
         bVRDkpvj1z2o7K+fnMU5swcdfUxDbfpZhAYDTMQLEAE7QvDuxaQ1lRUtBLzU9uPxgDNP
         FtnEEXgeLj17GxoAtgmnzuCFWfCDi18fHvVBbSSA6bj0GXTY1UZriUzVspQttAP6WML7
         tkSInoMOWcpsj6H7kV6mNPUNyymC4XP0i+H54Ul8nKO8Uy2BKqAUVfVbEhs/Ih8AoocS
         T1q1X1za6v2dRQipoqIFQQXydmrVfaEG0M2iCyrUz/HNSfFIEgeTLL6JKHtiSBVN+0eS
         ZGNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U1Kz1CG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u89-v6si2881507qvu.165.2018.06.26.21.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U1Kz1CG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2SS-0003Ny-8e
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:53:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29Z-0004OG-35
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29X-0000ii-8Z
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:01 -0400
Received: from mail-pl0-x229.google.com ([2607:f8b0:400e:c01::229]:42127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29X-0000hs-0S
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:59 -0400
Received: by mail-pl0-x229.google.com with SMTP id w17-v6so411475pll.9
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BdZt6i8MbMPKk1Bf9oqfvRlv/ASYX8to6Ot9k54XpXg=;
	b=U1Kz1CG4ixrx1EE2kt98ega52U/bbyRhh1zAlHWW3YFe/Q04rt/kyGhVdyxna9rqiS
	qLLxhQ+bdSUxbIryav0Dpscq21GJjJq09dle37xrbqJuBe6swDhos3Tga1SHCHJrtndz
	o7frISHY2DPtk8TyvFQO4x8pvEJjsV7LEPfF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BdZt6i8MbMPKk1Bf9oqfvRlv/ASYX8to6Ot9k54XpXg=;
	b=p0JaZpY2g/5eQtClquqMZnjYVd8B4nMsgCisqSHZstEtJrZS/j2AA8s4vzWUp4cQIh
	m85/MTvSvSriVBvjSSfGFx6Z01LpdPxyFdfZ8fgFM52rjpMEaA/niwfKzTWo1kLr+8Ow
	477g0xPTnw8InAvBPhKNywOa278nDT/qLad2BjNiaBHqNhU62b/ZFH0O8KBScHwXkBXr
	72ec0cwSMAO4QyuWO2AzF1J3OAjvx2A0kuiP5aFMAZRHL8/PiMgJuCa1bE/0UHDWA8zd
	S1M/+ulclLV4X2Z0T88C0gk1i+ftfAoPUZ9yTR52yFxN4q8/+P7sOs+3GQSwZShC7MIp
	99cQ==
X-Gm-Message-State: APt69E2DpsKUF90TjWNEWJu+8cTfv9K6+WCC4iJUju04/0QklCOyt9BT
	8LD0mhuCWPno5VCXAwwGQO8XIA==
X-Received: by 2002:a17:902:b68c:: with SMTP id
	c12-v6mr4512421pls.114.1530074038007; 
	Tue, 26 Jun 2018 21:33:58 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:12 -0700
Message-Id: <20180627043328.11531-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::229
Subject: [Qemu-arm] [PATCH v6 19/35] target/arm: Implement SVE FP Fast
 Reduction Group
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
X-TUID: gamtx+OFLrd1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 35 ++++++++++++++++++++++
 target/arm/sve_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 57 +++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 +++++
 4 files changed, 161 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 087819ec2b..ff69d143a0 100644
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
index bc23c66221..4c44d52a23 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2852,6 +2852,67 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
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
index b60d47af2c..3b009193a9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3450,6 +3450,63 @@ static bool trans_FMUL_zzx(DisasContext *s, arg_FMUL_zzx *a, uint32_t insn)
     return true;
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
+static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a, uint32_t insn) \
+{                                                                        \
+    static gen_helper_fp_reduce * const fns[3] = {                       \
+        gen_helper_sve_##name##_h,                                       \
+        gen_helper_sve_##name##_s,                                       \
+        gen_helper_sve_##name##_d,                                       \
+    };                                                                   \
+    if (a->esz == 0) {                                                   \
+        return false;                                                    \
+    }                                                                    \
+    if (sve_access_check(s)) {                                           \
+        do_reduce(s, a, fns[a->esz - 1]);                                \
+    }                                                                    \
+    return true;                                                         \
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
index 15fa790d5b..66b0fd0cc4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -735,6 +735,14 @@ FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
 FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
 FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
 
+### SVE FP Fast Reduction Group
+
+FADDV           01100101 .. 000 000 001 ... ..... .....         @rd_pg_rn
+FMAXNMV         01100101 .. 000 100 001 ... ..... .....         @rd_pg_rn
+FMINNMV         01100101 .. 000 101 001 ... ..... .....         @rd_pg_rn
+FMAXV           01100101 .. 000 110 001 ... ..... .....         @rd_pg_rn
+FMINV           01100101 .. 000 111 001 ... ..... .....         @rd_pg_rn
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.17.1

