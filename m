Received: by 10.28.71.27 with SMTP id u27csp2098064wma;
        Sat, 17 Feb 2018 11:04:07 -0800 (PST)
X-Google-Smtp-Source: AH8x225lvFP5ehzbVqVuGmetOnUfxQ98SIa6KJVEuw6Z2uWn5J3UlI/vHt+3d/Xc5QZotirVMVrU
X-Received: by 10.129.87.139 with SMTP id l133mr7462453ywb.214.1518894247560;
        Sat, 17 Feb 2018 11:04:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894247; cv=none;
        d=google.com; s=arc-20160816;
        b=J2M8I4vNA7rXxH2e160yk0tCSm3MHzfDV2b60txdkv0RDQasqOXHXnSkcklAGu6MqH
         QBJ6l6thb59doBQKh/xVfxJnmvukvJ5brMz7SP1qIz7jh8M7K+nLWdFy7rJ9IrPGLVa8
         Uu4RgM10L++yE+FHqnYgcLD1mHL0lE2fMDQockimQsKP4Fh+U4yDuiZ/nS+59mRHjJZz
         8+oqqf3j/TfGCXR5DNqGSl4gSJE2PESMyZh7S3BCpiIcjKH8Ov3N90QI8znmf/wi1ZgP
         bBocbrxqheExLyJ+ythEJmbd61NCO72IG8wLsI72BSs3x25hRF5zQg61Nv5bdA5kdlES
         3RtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=y77VXTcItoEr50fnaXeizXOxi+B96vWDrfG5IAacJoI=;
        b=pizSEJMjieEUUxAFhIHg1j9ZSlNS7+7KBm5FZHzv6fTk3coZ2G+JJHqP8Mjnc0ydj6
         NaPA5auC5VeU5l5f8/yBrUFejuwKZa0KboTFkr0mlvg0/VXVd6knTreSTQM4lh169CzF
         Bas3bDE61DJyvchf+wh3PHx/XtC4hsyBqY+GAVpNUmDvSyU/BaNj3YQb+RfS3jnOucCF
         d/VktmOZvmz4IonNXEqkyQ4cDArQzWdlTpLrC/sn9zpB+lSwW+oI7Uv1urO2K/vPwTBW
         4zybl/PnAAs5h1cWtI96pq76ep4v+shi0Xxq2tT6oEAB7nOP1JVH/nqbJF4u56sq00/C
         QMVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NVHBDsMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n14si1495019ywi.566.2018.02.17.11.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:04:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NVHBDsMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7mI-0000sj-Um
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:04:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AU-0001n9-Rs
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AT-0002EI-9R
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:02 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:32805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AS-0002Dt-VR
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:01 -0500
Received: by mail-pf0-x242.google.com with SMTP id b8so525796pfh.0
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y77VXTcItoEr50fnaXeizXOxi+B96vWDrfG5IAacJoI=;
	b=NVHBDsMh2kDQxF8XKMUixrckyYlojinVvRxKUWy2ZfWF0NWAUfhJKJKb21uAmDV7RT
	hapg0Zi4HQNmksI4aLR2Jg+HX9mHVpaiYA1ep3eKgka6G9t+g5oKHclqDgFcH2FfvEHG
	SjBeBQPyOPqiukgRY8rwREmjZgLUYq1AdCBg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y77VXTcItoEr50fnaXeizXOxi+B96vWDrfG5IAacJoI=;
	b=edHLfDhu1R9WlUWcuPAm0/am7gPaDW6weSiCey6Xfoidim2sEdkLUOTmwFLpG1erX6
	jzOlBkl5Nc3kV1oANbufBoN7lGa7dX9W8nDkpO/hKVU4nB79MGQDAGd4hkeKRoR8835G
	uqL21XqkBmXYxzQgRr41HGLUhE87rLjXlvBkQN73O9d2mPEFjq7JuzOyeHw9AEnECibK
	Raa+Y+yx6ZZa4OeVQv3WDJOCIIanIvIZFbIQbZJOiUHzF1xmcuUXDNWV5rdaHlFwm83y
	uxficX6nIR46cW7r26Wchoc4634gagfKUdgztdDBj0bxNCL2qZiqOTuNcc5TEzw6EXSy
	DYOw==
X-Gm-Message-State: APf1xPCkRHXAPlv/ttvc+RrHvYC6+9k+e4rGluVwtpCbmIM28pZiPLXH
	DZWm8MwoHbFiD6CDRieasOBJczfIT/s=
X-Received: by 10.101.100.208 with SMTP id t16mr7928770pgv.398.1518891899959; 
	Sat, 17 Feb 2018 10:24:59 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:15 -0800
Message-Id: <20180217182323.25885-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 59/67] target/arm: Implement SVE Floating
 Point Multiply Indexed Group
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
X-TUID: 7TH4+DcayFDp

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 14 ++++++++++
 target/arm/translate-sve.c | 44 +++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 19 ++++++++++++++
 4 files changed, 141 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f3ce58e276..a8d824b085 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -584,6 +584,20 @@ DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_ftsmul_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fmul_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmul_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmul_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(gvec_fmla_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6ce1b01b9a..cf2a4d3284 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3136,6 +3136,50 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
+/*
+ *** SVE Floating Point Multiply-Add Indexed Group
+ */
+
+static void trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a, uint32_t insn)
+{
+    static gen_helper_gvec_4_ptr * const fns[3] = {
+        gen_helper_gvec_fmla_idx_h,
+        gen_helper_gvec_fmla_idx_s,
+        gen_helper_gvec_fmla_idx_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+
+    tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vec_full_reg_offset(s, a->ra),
+                       status, vsz, vsz, a->index * 2 + a->sub,
+                       fns[a->esz - 1]);
+    tcg_temp_free_ptr(status);
+}
+
+/*
+ *** SVE Floating Point Multiply Indexed Group
+ */
+
+static void trans_FMUL_zzx(DisasContext *s, arg_FMUL_zzx *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_gvec_fmul_idx_h,
+        gen_helper_gvec_fmul_idx_s,
+        gen_helper_gvec_fmul_idx_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       status, vsz, vsz, a->index, fns[a->esz - 1]);
+    tcg_temp_free_ptr(status);
+}
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index ad5c29cdd5..e711a3217d 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -24,6 +24,22 @@
 #include "fpu/softfloat.h"
 
 
+/* Note that vector data is stored in host-endian 64-bit chunks,
+   so addressing units smaller than that needs a host-endian fixup.  */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)   ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
+#define H2(x)   ((x) ^ 3)
+#define H4(x)   ((x) ^ 1)
+#else
+#define H1(x)   (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
+#define H2(x)   (x)
+#define H4(x)   (x)
+#endif
+
 /* Floating-point trigonometric starting value.
  * See the ARM ARM pseudocode function FPTrigSMul.
  */
@@ -92,3 +108,51 @@ DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
 
 #endif
 #undef DO_3OP
+
+/* For the indexed ops, SVE applies the index per 128-bit vector segment.
+ * For AdvSIMD, there is of course only one such vector segment.
+ */
+
+#define DO_MUL_IDX(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
+{                                                                          \
+    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    intptr_t idx = simd_data(desc);                                        \
+    TYPE *d = vd, *n = vn, *m = vm;                                        \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
+        TYPE mm = m[H(i + idx)];                                           \
+        for (j = 0; j < segment; j++) {                                    \
+            d[i + j] = TYPE##_mul(n[i + j], mm, stat);                     \
+        }                                                                  \
+    }                                                                      \
+}
+
+DO_MUL_IDX(gvec_fmul_idx_h, float16, H2)
+DO_MUL_IDX(gvec_fmul_idx_s, float32, H4)
+DO_MUL_IDX(gvec_fmul_idx_d, float64, )
+
+#undef DO_MUL_IDX
+
+#define DO_FMLA_IDX(NAME, TYPE, H)                                         \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va,                  \
+                  void *stat, uint32_t desc)                               \
+{                                                                          \
+    intptr_t i, j, oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);  \
+    TYPE op1_neg = extract32(desc, SIMD_DATA_SHIFT, 1);                    \
+    intptr_t idx = desc >> (SIMD_DATA_SHIFT + 1);                          \
+    TYPE *d = vd, *n = vn, *m = vm, *a = va;                               \
+    op1_neg <<= (8 * sizeof(TYPE) - 1);                                    \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {                  \
+        TYPE mm = m[H(i + idx)];                                           \
+        for (j = 0; j < segment; j++) {                                    \
+            d[i + j] = TYPE##_muladd(n[i + j] ^ op1_neg,                   \
+                                     mm, a[i + j], 0, stat);               \
+        }                                                                  \
+    }                                                                      \
+}
+
+DO_FMLA_IDX(gvec_fmla_idx_h, float16, H2)
+DO_FMLA_IDX(gvec_fmla_idx_s, float32, H4)
+DO_FMLA_IDX(gvec_fmla_idx_d, float64, )
+
+#undef DO_FMLA_IDX
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 258d14b729..d16e733aa3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -30,6 +30,7 @@
 %preg4_5	5:4
 %size_23	23:2
 %dtype_23_13	23:2 13:2
+%index3_22_19	22:1 19:2
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz	22:2 5:5 !function=tszimm_esz
@@ -720,6 +721,24 @@ UMIN_zzi	00100101 .. 101 011 110 ........ .....		@rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi		00100101 .. 110 000 110 ........ .....		@rdn_i8s
 
+### SVE FP Multiply-Add Indexed Group
+
+# SVE floating-point multiply-add (indexed)
+FMLA_zzxz	01100100 0.1 .. rm:3 00000 sub:1 rn:5 rd:5 \
+		ra=%reg_movprfx index=%index3_22_19 esz=1
+FMLA_zzxz	01100100 101 index:2 rm:3 00000 sub:1 rn:5 rd:5 \
+		ra=%reg_movprfx esz=2
+FMLA_zzxz	01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
+		ra=%reg_movprfx esz=3
+
+### SVE FP Multiply Indexed Group
+
+# SVE floating-point multiply (indexed)
+FMUL_zzx	01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
+		index=%index3_22_19 esz=1
+FMUL_zzx	01100100 101 index:2 rm:3 001000 rn:5 rd:5	esz=2
+FMUL_zzx	01100100 111 index:1 rm:4 001000 rn:5 rd:5	esz=3
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.14.3

