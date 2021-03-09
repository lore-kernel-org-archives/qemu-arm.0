Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955352lfg;
        Tue, 9 Mar 2021 08:21:23 -0800 (PST)
X-Received: by 2002:aca:484:: with SMTP id 126mr3435448oie.81.1615306883747;
        Tue, 09 Mar 2021 08:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306883; cv=none;
        d=google.com; s=arc-20160816;
        b=gK7z+NtCK8VcV6JZlxmDKBKMC6ex78i6ITpR7o7tC0c66Gdi9QkwMaQCG5C/s0AMai
         kb+1qh5nmKWpQKFzO7vveAUlLVC55CMfQtqhJ5ZAnkTTla6wDrSrFo02fcRs4FB3kqKK
         U6f8CWYnKp7F2/Q7Fj3A6nH64gimMGUFOlosRz/XCyhYxDKTsMHN/8FJtV0WZUQh+b9Q
         f83pVbdDOTMBkxY87j6h0Zrom4xLxR0qEgt2VG+9rWWSAtiVxumJexbxI/bg43JXvKJy
         GGV7SLiFgoBRcWAFnNQgrZcIFO92GsrPoUYATyyIOxjCu75A0vdst62/Zr4Jbodkh9Gj
         FkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yIctWEimOpT3ofhcc26IOMfX6Wto+emY+iSYhkedMtU=;
        b=td1vWcoDzv44KVTpXWokfVimKiNnUT6L0TDl4zC6AE2L3RD2xvU8LIR1cZegLRJdP0
         qdMICKhqPPhsyPFoCzP3JrwrjZBR4DXuq6cCiv0rJBOFrnsBnoWp6N+jTy3MqjINYgeH
         RJlMBB9GIi0QdubXRBdbtAbEZDSVaarEzCM6V7KzGYh1TXaYZ7+4FpwHKhRyii93ICjq
         VybLCt1B+9aOxr4/D1VJqatlaIG1GE+X763UJpSKXuRv4rt5NOFCnv2hHj1HXlptxn3m
         ClcoUtSn/xKsCUYH/dwAUMLjbfzS6D82bJH1q9WuUljyWpSuLo5fVtZT6AnWtDQ0vLcJ
         GOFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l0qq8OhI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o6sor69645otp.186.2021.03.09.08.21.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l0qq8OhI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yIctWEimOpT3ofhcc26IOMfX6Wto+emY+iSYhkedMtU=;
        b=l0qq8OhI5nS+ZFa5BGDM0y+aNWfficIuAJDPwB1pjoTq+kREq/1u30pbf6KCWnMQNI
         G8SeVAmvtwS/m1uVuI2GNPe6Xq+26CDVLP5TjTINYAgBolXXdg+p0Yh5//RFOreEixtx
         WPHbhJf6K1bazNIYV9vVhYGmALpjfJNS/9z7FpILqbnqKJxQH6Ni5ic6lj0ySlPrAz1q
         a//4anocXDlR94qvbTCV1NJZl3BgNGtxUq2ObeA2dtaQqhOvW3MNorWcDuhrt3sR8Mxx
         IreGEr81WoBiaqN3E4922CRpUcyBIkc27k79rA4njtl7cuGA5AH3mnvxe4uQx/7vCBkn
         81WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yIctWEimOpT3ofhcc26IOMfX6Wto+emY+iSYhkedMtU=;
        b=ELpv3A+jnzBesAbH+FzOBtxha2YgmYnF0a3Rh5uJr6/d5vnha4VAlW5QTMYo6txILr
         3/HTifZhSjZxgbKlJoSBGMjOdwuWH18/aegPCFmVLO7s9gY57CV/Sfi/c2lNl2IxQE4G
         ba7dehegNm94Z4bvrh8JACO1f8t6Zk3xQNJ3dkUIF2Z349gg9ugS6HbhQvMxgw7VYMV8
         MNMhGbUsBd6DumUGVOPHupmyDS0Lo/POFEboNi221GxMK/nkhISi309ppxZ4RtjbvmGO
         NhBpYfujFAtP1MhLbZ77ePPLIM2BCB2clVRepo1kPA2MWPy3L9ZB7G2UXKSKmnZTpQUJ
         ndKQ==
X-Gm-Message-State: AOAM531UtKGzXThsVG6LVCtZlu2ntUPCAfXNMFUzaoheI7vrpwjH5AuZ
	GDzfSm2e0llgeEbNm/iZDI+qPRdRafk+5/P2BKE=
X-Google-Smtp-Source: ABdhPJy5+hlrpN/diwiRL2oRREoiFJtHCYrcXl3MKQk9hK/zFD3dFwKuiJ4PSWK3NV2ATmkB7npWhA==
X-Received: by 2002:a9d:3f37:: with SMTP id m52mr24075414otc.92.1615306883289;
        Tue, 09 Mar 2021 08:21:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 35/78] target/arm: Implement SVE2 saturating multiply-add high
Date: Tue,  9 Mar 2021 08:19:58 -0800
Message-Id: <20210309162041.23124-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: j3hw8mmFom4H

SVE2 has two additional sizes of the operation and unlike NEON,
there is no saturation flag.  Create new entry points for SVE2
that do not set QC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  17 ++++
 target/arm/sve.decode      |   5 ++
 target/arm/translate-sve.c |  18 +++++
 target/arm/vec_helper.c    | 161 +++++++++++++++++++++++++++++++++++--
 4 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2c412ffd3b..6bb0b0ddc0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -591,6 +591,23 @@ DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 52f615b39e..8308c9238a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1346,3 +1346,8 @@ SQDMLSLT_zzzw   01000100 .. 0 ..... 0110 11 ..... .....  @rda_rn_rm
 
 SQDMLALBT       01000100 .. 0 ..... 00001 0 ..... .....  @rda_rn_rm
 SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
+
+## SVE2 saturating multiply-add high
+
+SQRDMLAH_zzzz   01000100 .. 0 ..... 01110 0 ..... .....  @rda_rn_rm
+SQRDMLSH_zzzz   01000100 .. 0 ..... 01110 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 15cbca0674..f6eea9554b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7563,3 +7563,21 @@ static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_sqdmlsl_zzzw(s, a, false, true);
 }
+
+static bool trans_SQRDMLAH_zzzz(DisasContext *s, arg_rrrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_sqrdmlah_b, gen_helper_sve2_sqrdmlah_h,
+        gen_helper_sve2_sqrdmlah_s, gen_helper_sve2_sqrdmlah_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
+}
+
+static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_sqrdmlsh_b, gen_helper_sve2_sqrdmlsh_h,
+        gen_helper_sve2_sqrdmlsh_s, gen_helper_sve2_sqrdmlsh_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index b0ce597060..c56337e724 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -22,6 +22,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
+#include "qemu/int128.h"
 #include "vec_internal.h"
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -36,15 +37,55 @@
 #define H4(x)  (x)
 #endif
 
+/* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
+static int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
+                            bool neg, bool round)
+{
+    /*
+     * Simplify:
+     * = ((a3 << 8) + ((e1 * e2) << 1) + (round << 7)) >> 8
+     * = ((a3 << 7) + (e1 * e2) + (round << 6)) >> 7
+     */
+    int32_t ret = (int32_t)src1 * src2;
+    if (neg) {
+        ret = -ret;
+    }
+    ret += ((int32_t)src3 << 7) + (round << 6);
+    ret >>= 7;
+
+    if (ret != (int8_t)ret) {
+        ret = (ret < 0 ? INT8_MIN : INT8_MAX);
+    }
+    return ret;
+}
+
+void HELPER(sve2_sqrdmlah_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], a[i], false, true);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], a[i], true, true);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 static int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
                              bool neg, bool round, uint32_t *sat)
 {
-    /*
-     * Simplify:
-     * = ((a3 << 16) + ((e1 * e2) << 1) + (1 << 15)) >> 16
-     * = ((a3 << 15) + (e1 * e2) + (1 << 14)) >> 15
-     */
+    /* Simplify similarly to do_sqrdmlah_b above.  */
     int32_t ret = (int32_t)src1 * src2;
     if (neg) {
         ret = -ret;
@@ -133,11 +174,35 @@ void HELPER(neon_sqrdmulh_h)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_sqrdmlah_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], a[i], false, true, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], a[i], true, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 static int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                              bool neg, bool round, uint32_t *sat)
 {
-    /* Simplify similarly to int_qrdmlah_s16 above.  */
+    /* Simplify similarly to do_sqrdmlah_b above.  */
     int64_t ret = (int64_t)src1 * src2;
     if (neg) {
         ret = -ret;
@@ -220,6 +285,90 @@ void HELPER(neon_sqrdmulh_s)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_sqrdmlah_s)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], a[i], false, true, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm, *a = va;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], a[i], true, true, &discard);
+    }
+}
+
+/* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
+static int64_t do_sat128_d(Int128 r)
+{
+    int64_t ls = int128_getlo(r);
+    int64_t hs = int128_gethi(r);
+
+    if (unlikely(hs != (ls >> 63))) {
+        return hs < 0 ? INT64_MIN : INT64_MAX;
+    }
+    return ls;
+}
+
+static int64_t do_sqrdmlah_d(int64_t n, int64_t m, int64_t a,
+                             bool neg, bool round)
+{
+    uint64_t l, h;
+    Int128 r, t;
+
+    /* As in do_sqrdmlah_b, but with 128-bit arithmetic. */
+    muls64(&l, &h, m, n);
+    r = int128_make128(l, h);
+    if (neg) {
+        r = int128_neg(r);
+    }
+    if (a) {
+        t = int128_exts64(a);
+        t = int128_lshift(t, 63);
+        r = int128_add(r, t);
+    }
+    if (round) {
+        t = int128_exts64(1ll << 62);
+        r = int128_add(r, t);
+    }
+    r = int128_rshift(r, 63);
+
+    return do_sat128_d(r);
+}
+
+void HELPER(sve2_sqrdmlah_d)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], a[i], false, true);
+    }
+}
+
+void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm, *a = va;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], a[i], true, true);
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1
