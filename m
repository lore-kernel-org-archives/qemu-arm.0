Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5026992wre;
        Wed, 30 May 2018 11:09:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJtgmjjRnlYIPpjTRoHuhYnKija1ZGPnEc9CKebIAmMGtl44NKUegN1j5uCFeJKlBSIemSa
X-Received: by 2002:a0c:9c49:: with SMTP id w9-v6mr3564609qve.193.1527703763834;
        Wed, 30 May 2018 11:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703763; cv=none;
        d=google.com; s=arc-20160816;
        b=HjVt9m5xhr1NLDGDIvzUAdilNCpDMuxEKTqHF/Bo8uf+h3HHGP1ZJgMIICgruIr8/v
         tcCFgTakQIIRbg+Ck5OmqDsQEEDXTEw7h/xHdL7Jex+2H+mgFGg1JC7j+r2DYCyP/kri
         o7avs55Anw+EQ0uvJ/ToqNTjT6Y1c0bvPUq4L2FEKB69ow83eKOTJRA3f7xb4pDtOR6O
         1zQNRr79t5Nj/Sn+PL00W3RoLD/87jv4J28iwjsKm6AWUi4uxeAxgrLjaIV+FPxox7Xt
         T3MvPyOn4qHFEx8sVkwDzxNwirvXTdbEVBICZoy1qOL1JYKfHkbVTlg8bM1H/Zu5gplJ
         VktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fLlTkQZMBKLlfK4X9k246o+TLhUSnciff9gKTmqGISo=;
        b=f6T+2i8MT72JzSXHS4Tf08GjRgGO0gj1YSWfuU0SIVZeL7bDLxkLQscx5zE7+NBFni
         tq/YhE+MAOd9gxyQtZnTSQl0DdcziopkpTukVHlWeoMhFyYvbHxWZJAGApqiakgeIERp
         5VNv+OHlQc5vFMPsg3FrqlnzUBVj4rckIVGpvpwKzfDAqjEaX0D81sZd9zqqpuR5So20
         moKoo6vS2IAHd/ZUSPheBiu6Ba9aUOHOKGmtUnyr6O7HlDpoObd0XWzhrgCzWD/ncAq2
         ui47jDSQ5F5gPwldR0obrWJuwlJ9iUeiJ0P00pUCcpELobCgsMJsHUtdpWvro22Hv/ac
         g9cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QD/MRrQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t74-v6si3147894qkl.41.2018.05.30.11.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QD/MRrQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5XH-0007bH-8v
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:09:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Q2-0002Bq-4X
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Q0-0004sM-Kl
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:54 -0400
Received: from mail-pl0-x22c.google.com ([2607:f8b0:400e:c01::22c]:38157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Q0-0004rA-2P
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:52 -0400
Received: by mail-pl0-x22c.google.com with SMTP id c11-v6so11554558plr.5
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fLlTkQZMBKLlfK4X9k246o+TLhUSnciff9gKTmqGISo=;
	b=QD/MRrQs/mRoxQOz0SRevXZxidLNSrLaU44VMTLX6tfUKhz0+0gX5KdCZp6PoyZFKZ
	MyikSPJRIRQqeumkj54dNFQ/5k8qibZtXLUCXYC+nT+iA5q0C27uK4XM2KhtPYwMUCbr
	G4WMWSdyPUh/jHiTPMlr7SxPjecMfzFlmCGcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fLlTkQZMBKLlfK4X9k246o+TLhUSnciff9gKTmqGISo=;
	b=nHWq5xwIZi5idTgm699kGkqws+5yZwfozZCotoS1Jz11vt5WA75wRJhOpKp7hpjKJr
	b6Ir3taDHbseRU3tWVtjCjIHbetEk6W649nFfvA+MDIsO4jMjG7nxrRn71wRKFOv6Jke
	etiCvQ1VeoaoGJJGBJFT3Tlc2njQnBZTbA0E34xgYr2hXf/OyGoJ7bl8+plLx23iQJgs
	u9P069wyyEYse+MIpDZwR2sOtwXp1NlW/0NJHQCQJ1wIbtpYoImzNSyOklzdvWHuVdPX
	d3G+1f7QLVZDhovFnkzxnSdrSXMitFV2uCGffE3viZKdJaN+p/eS+77vx/XtReX76umu
	4RCQ==
X-Gm-Message-State: ALKqPweoh63LjPOdpzEkCDhGI8mzNQSkMUgb2+H0JMrEVSE7Nct0lKXI
	ZFxHZPjPOZ9itogZmGjdp3QCPVjYkxQ=
X-Received: by 2002:a17:902:6ac7:: with SMTP id
	i7-v6mr3737493plt.288.1527703310718; 
	Wed, 30 May 2018 11:01:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:20 -0700
Message-Id: <20180530180120.13355-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22c
Subject: [Qemu-devel] [PATCH v3b 18/18] target/arm: Implement SVE Floating
 Point Arithmetic - Unpredicated Group
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
X-TUID: nDDGw1yueDs1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++
 target/arm/helper.h        | 19 +++++++++++
 target/arm/translate-sve.c | 42 +++++++++++++++++++++++
 target/arm/vec_helper.c    | 69 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 10 ++++++
 5 files changed, 154 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 97bfe0f47b..2e76084992 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -705,3 +705,17 @@ DEF_HELPER_FLAGS_4(sve_umini_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_umini_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_umini_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_umini_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+
+DEF_HELPER_FLAGS_5(gvec_recps_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_recps_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_recps_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_rsqrts_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0c6a144458..879a7229e9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -601,6 +601,25 @@ DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fsub_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fsub_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fsub_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmul_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmul_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmul_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_ftsmul_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 78e74047c8..cea64dfc18 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3364,6 +3364,48 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
+/*
+ *** SVE Floating Point Arithmetic - Unpredicated Group
+ */
+
+static bool do_zzz_fp(DisasContext *s, arg_rrr_esz *a,
+                      gen_helper_gvec_3_ptr *fn)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           status, vsz, vsz, 0, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+
+#define DO_FP3(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a, uint32_t insn) \
+{                                                                   \
+    static gen_helper_gvec_3_ptr * const fns[4] = {                 \
+        NULL, gen_helper_gvec_##name##_h,                           \
+        gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
+    };                                                              \
+    return do_zzz_fp(s, a, fns[a->esz]);                            \
+}
+
+DO_FP3(FADD_zzz, fadd)
+DO_FP3(FSUB_zzz, fsub)
+DO_FP3(FMUL_zzz, fmul)
+DO_FP3(FTSMUL, ftsmul)
+DO_FP3(FRECPS, recps)
+DO_FP3(FRSQRTS, rsqrts)
+
+#undef DO_FP3
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index ec705cfca5..4b5ec94698 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -427,3 +427,72 @@ void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+/* Floating-point trigonometric starting value.
+ * See the ARM ARM pseudocode function FPTrigSMul.
+ */
+static float16 float16_ftsmul(float16 op1, uint16_t op2, float_status *stat)
+{
+    float16 result = float16_mul(op1, op1, stat);
+    if (!float16_is_any_nan(result)) {
+        result = float16_set_sign(result, op2 & 1);
+    }
+    return result;
+}
+
+static float32 float32_ftsmul(float32 op1, uint32_t op2, float_status *stat)
+{
+    float32 result = float32_mul(op1, op1, stat);
+    if (!float32_is_any_nan(result)) {
+        result = float32_set_sign(result, op2 & 1);
+    }
+    return result;
+}
+
+static float64 float64_ftsmul(float64 op1, uint64_t op2, float_status *stat)
+{
+    float64 result = float64_mul(op1, op1, stat);
+    if (!float64_is_any_nan(result)) {
+        result = float64_set_sign(result, op2 & 1);
+    }
+    return result;
+}
+
+#define DO_3OP(NAME, FUNC, TYPE) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
+{                                                                          \
+    intptr_t i, oprsz = simd_oprsz(desc);                                  \
+    TYPE *d = vd, *n = vn, *m = vm;                                        \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {                           \
+        d[i] = FUNC(n[i], m[i], stat);                                     \
+    }                                                                      \
+}
+
+DO_3OP(gvec_fadd_h, float16_add, float16)
+DO_3OP(gvec_fadd_s, float32_add, float32)
+DO_3OP(gvec_fadd_d, float64_add, float64)
+
+DO_3OP(gvec_fsub_h, float16_sub, float16)
+DO_3OP(gvec_fsub_s, float32_sub, float32)
+DO_3OP(gvec_fsub_d, float64_sub, float64)
+
+DO_3OP(gvec_fmul_h, float16_mul, float16)
+DO_3OP(gvec_fmul_s, float32_mul, float32)
+DO_3OP(gvec_fmul_d, float64_mul, float64)
+
+DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
+DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
+DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
+
+#ifdef TARGET_AARCH64
+
+DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
+DO_3OP(gvec_recps_s, helper_recpsf_f32, float32)
+DO_3OP(gvec_recps_d, helper_recpsf_f64, float64)
+
+DO_3OP(gvec_rsqrts_h, helper_rsqrtsf_f16, float16)
+DO_3OP(gvec_rsqrts_s, helper_rsqrtsf_f32, float32)
+DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
+
+#endif
+#undef DO_3OP
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index eee8726bdf..6f436f9096 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -648,6 +648,16 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
+### SVE Floating Point Arithmetic - Unpredicated Group
+
+# SVE floating-point arithmetic (unpredicated)
+FADD_zzz        01100101 .. 0 ..... 000 000 ..... .....         @rd_rn_rm
+FSUB_zzz        01100101 .. 0 ..... 000 001 ..... .....         @rd_rn_rm
+FMUL_zzz        01100101 .. 0 ..... 000 010 ..... .....         @rd_rn_rm
+FTSMUL          01100101 .. 0 ..... 000 011 ..... .....         @rd_rn_rm
+FRECPS          01100101 .. 0 ..... 000 110 ..... .....         @rd_rn_rm
+FRSQRTS         01100101 .. 0 ..... 000 111 ..... .....         @rd_rn_rm
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.17.0

