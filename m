Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5777558wrq;
        Tue, 26 Jun 2018 21:46:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpemw+U327cYDPBPTwz9q6XIldyZa2rUrrXs4XOU2o2/EhtCeCJ3Pq+JeXRuhnEuAp+5FSsQ
X-Received: by 2002:a37:3cc3:: with SMTP id j186-v6mr677652qka.362.1530074788359;
        Tue, 26 Jun 2018 21:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074788; cv=none;
        d=google.com; s=arc-20160816;
        b=Gs10/o5EtvQjCAhDqGlvr9QIFs5WUcTL5BlS9qvSDN94yoIZOQPCV59jx8X9HhC1I+
         pL++whSohefrG6fBxBdgl15CfTkGTc+v/ZOSIyIddjCl9+mxCVcM4jEfoBieHUBMB4UI
         9u1OdDcQllBNC4I7xHLnmGVfDKXK+ftlAGllt1Eo7JWoAhSx1oAF0yX4BFa+5JSmHDZ7
         c01ba0m7O9Oh0dJDZG1F6n16UJ1D0qy4l652XwI+XC7g+Dv5n9C0wWNG0jgO6O4M5+td
         +Bd6elulU73QcM4mPvhpv9/XqNVADpoNYrrqriJEfZmiFl43BFp16T2tE8b/NBvOyX5w
         VFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=16MyiFcRJA37Xsd1aBuTec8AVNcB5hz5enLFniZXy2k=;
        b=ZDidyNrM3ZboHsn2BaW42qMVlFn55J26KcBnz9uMBApzzncQO7CtA26qf39dTNjv4c
         ASkkK6PDiObxPv3fAuZY7wPbrEK+3IGQo23akAHRi0WG9mb8Szj1KjgH+UrGEwsElyyi
         zICwLx3aLh74XxJwCwtskeyaEpMEpKkfYWLvUSPwDNiD030UpiVxJPfr0GKbNQhfrILD
         YdnuK0U809omRskV7x/SGKi43YdLn4q96Lqo8SE+shbATRAEhV/Bux05Q0Qn5XJGwjXO
         9zjIPGXEQ4epHW4rUqgCypDg8cQFrfPwLvML/pew/bVSZ1Ni5BXQeK0+aYlhjWNSGLCf
         7vfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NVQkaJBR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o134-v6si2255939qke.43.2018.06.26.21.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NVQkaJBR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Lb-0005xp-QH
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:46:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29X-0004Md-Ql
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29V-0000h6-VJ
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:59 -0400
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:46480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29V-0000gB-Jr
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:33:57 -0400
Received: by mail-pl0-x236.google.com with SMTP id 30-v6so405963pld.13
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=16MyiFcRJA37Xsd1aBuTec8AVNcB5hz5enLFniZXy2k=;
	b=NVQkaJBRRzidqQPS4cHQl/kxaUZ72s1JXXrmLmluzEx10NihdThCbr8w6H7KSaMkAV
	OZCLYhHSM+vs1wgkiCTob2deVU4nCtnHUQ5Q41WXxvFK8M9zY+Ri/JlhX2HUe6EHqjkK
	37i99SISk7GhXhvUAP0GWB92bi+6LUqHULT9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=16MyiFcRJA37Xsd1aBuTec8AVNcB5hz5enLFniZXy2k=;
	b=MYuguR/abYUKh5XD3M/qLyNBGRgpLgOwLACPMS5HMtDIw5u6zr1N0rqtj85hGjSnAp
	CSAnR/x6e+aH39U+dmJNFTslAr6kBOc4vDyCVkSPFkEJx5xBh0c8OUnDoagdoIcjdoII
	za6R56tEW/8y3vJ9Vgo1KaSZcGLmYV1MqWbnsPbc94gaouvBwsmvZIRHIr7AQ6H5IGc/
	kzB8i2pxGhKYvwZG1Rvzb6L5JGaZRfgdM/KtFOhHSBfAP/mp//JEVQEOFYmBVH+Vv07B
	2EFSHlex9g89ma5P8cOOnasGTevyC+pTfNLg/mXDjN9xgQiBrZrkngG9xakYpQ64Gdgp
	HVTQ==
X-Gm-Message-State: APt69E0Z57fahqTqaHjYKm9HssNccQk5yylk32/0+DFyOyCnpx4hbXGV
	/WEltgG/MDHMmki7xIZBGfOzfUPeulc=
X-Received: by 2002:a17:902:b08a:: with SMTP id
	p10-v6mr4571907plr.0.1530074036300; 
	Tue, 26 Jun 2018 21:33:56 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:11 -0700
Message-Id: <20180627043328.11531-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: [Qemu-devel] [PATCH v6 18/35] target/arm: Implement SVE Floating
 Point Multiply Indexed Group
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
X-TUID: xN+nPObwKkS4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 14 +++++++++++
 target/arm/translate-sve.c | 50 ++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 48 ++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 19 +++++++++++++++
 4 files changed, 131 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 879a7229e9..56439ac1e4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -620,6 +620,20 @@ DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
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
index 499252deff..b60d47af2c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3400,6 +3400,56 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
+/*
+ *** SVE Floating Point Multiply-Add Indexed Group
+ */
+
+static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a, uint32_t insn)
+{
+    static gen_helper_gvec_4_ptr * const fns[3] = {
+        gen_helper_gvec_fmla_idx_h,
+        gen_helper_gvec_fmla_idx_s,
+        gen_helper_gvec_fmla_idx_d,
+    };
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, (a->index << 1) | a->sub,
+                           fns[a->esz - 1]);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+/*
+ *** SVE Floating Point Multiply Indexed Group
+ */
+
+static bool trans_FMUL_zzx(DisasContext *s, arg_FMUL_zzx *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_gvec_fmul_idx_h,
+        gen_helper_gvec_fmul_idx_s,
+        gen_helper_gvec_fmul_idx_d,
+    };
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           status, vsz, vsz, a->index, fns[a->esz - 1]);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index f504dd53c8..97af75a61b 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -495,3 +495,51 @@ DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
 
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
index 267eb2dcfc..15fa790d5b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -29,6 +29,7 @@
 %imm9_16_10     16:s6 10:3
 %size_23        23:2
 %dtype_23_13    23:2 13:2
+%index3_22_19   22:1 19:2
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz     22:2 5:5 !function=tszimm_esz
@@ -716,6 +717,24 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 # SVE integer multiply immediate (unpredicated)
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
+### SVE FP Multiply-Add Indexed Group
+
+# SVE floating-point multiply-add (indexed)
+FMLA_zzxz       01100100 0.1 .. rm:3 00000 sub:1 rn:5 rd:5 \
+                ra=%reg_movprfx index=%index3_22_19 esz=1
+FMLA_zzxz       01100100 101 index:2 rm:3 00000 sub:1 rn:5 rd:5 \
+                ra=%reg_movprfx esz=2
+FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
+                ra=%reg_movprfx esz=3
+
+### SVE FP Multiply Indexed Group
+
+# SVE floating-point multiply (indexed)
+FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
+                index=%index3_22_19 esz=1
+FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
+FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.17.1

