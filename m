Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954996lfg;
        Tue, 9 Mar 2021 08:21:00 -0800 (PST)
X-Received: by 2002:aca:5bd7:: with SMTP id p206mr3459573oib.66.1615306860345;
        Tue, 09 Mar 2021 08:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306860; cv=none;
        d=google.com; s=arc-20160816;
        b=c/6M49HZZ1H9kK8Tzzoi644eig4vZXQg4Im42PJcmp/cUnbhlESRRqU2bX/XTa3RUM
         OvFG5g/bZNN0VqYos5aK7Oa1ZOl82Xg8ua0GmHLYNYNGQtaAFBdO8o0TigfWYFBXXfyk
         iuiiQlQFz+z889pJ/x/bgE4bzBp1o3eAbUdJgwNycGZlCnpx34dbaxC+T5PTVtpp5yvT
         Egwwj7fvZBRANyEdcuIilukeHAhFJVLWH740Achs9FGIi6dcLQfEohDrc+28m4l6J3BM
         hhhdmZY3Ro+qXJ0wPx5JYs7vGKr0f7n0Z12xpduaEYtVWb/Lz9DF0c19LnC8e1Amfdgg
         FEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tgusoMtmDQWI+mFp+GeBtWOtPA1PyCYaH+NXyjthEkA=;
        b=nPinDnTvnnUhWgnTVRrImi1FkUz4O8uMI5i4p2PllDnz2hEBjfBI2oAj1U+LJr4n9x
         gzRPQYAlq4aB7wlrtiDiEqXUOfBB73yNAyb4rNvpiC/q9qWJuQrj9/5aPxT/0w2IIDeZ
         AZXFhOADL/VHI7reDeJh3Yof48PefCWF4zU+ZG0qE/x2Fjm3j02ud3F+EiTJbHvbtfLp
         r0t/CmlN43++5eOZ+0PEtdUJIGHfskc6CM1Tv0y7UBOl2tIVuB6gY7wJN4JlMRz5v9CH
         xWEpdvIXGdGPqfiggCSJE9H8H9+Osk/TaVhOT+DDa5gjXLZad4nYJkKJjDnCihcC81j6
         KhgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqzv2niG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e2sor4137979oiw.40.2021.03.09.08.21.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:00 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pqzv2niG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tgusoMtmDQWI+mFp+GeBtWOtPA1PyCYaH+NXyjthEkA=;
        b=pqzv2niGVMP0OGtuk0ONtdcvfGynuzAROnLj1lNdN7kDrKSvVaSe1ZImDJFp4T3+6K
         NHSHg2lRnLjxB6s3ZUkif8qvI6P+89Y+dl3w80O2h7Gv8674gXDBzgz52uWcvUHgELv4
         9b8GgjsDMw7chlm+zC3CHFuRBWyAZnQ1YVAW83x2lg9R49m8btowfp8+AHfxa9wa8LMu
         aug5ba/ISn9P7nAZwjqD/wTrPpOGos+rVvjd350b56roBILCUayzarWgAXFKXYgpCbVd
         TNtfA0N4fdgB+wOb+IWo1lKG5tdnGC+JehBBgrNnumxQ4vZo7Zh66cmHbo7jMPQz+2dk
         5vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tgusoMtmDQWI+mFp+GeBtWOtPA1PyCYaH+NXyjthEkA=;
        b=SiVBiAID1HtSex+5mRR1Mh5p8Tr6DxUMlKCmxQ7ybjB2lI7OPkB0mVEjLxCOmgJ8Ye
         Ah4Tdz2eEE3bXXHIzQFA/pK090Shq84Bp13THVegoqDkVRKzG5XQ5Pmp4KsWrogf1ukL
         52amWKBvuUCklWgNFx9qyGLDQX0gI7qFRYPFhW+K/Ob+jNOJJseSnsOQ5hJwY/jeY7rI
         luy0tFbkos9asOAVJ7hmZblH6CVsv88pTAO4uPASRN2K/0U6HwksjIgonguHMrdwrCvP
         xTXSAoR3JfLy1ELHeQLYcmaMkXH4Hl+tES8P2+/yg4pWXtyzH8kWZGIDz4RkSNxGVkF5
         J1nA==
X-Gm-Message-State: AOAM532rGZmk/ErLUHjFZFjsOP+mi8LDhqgCrs3M2D7Qz+b1oGNi9RLG
	s4FxMGtnVIwRCxoJAU5iTZZDTvBq
X-Google-Smtp-Source: ABdhPJwIVTjSovuotv8pBvsVkfYclC/HBNTdXbAyoUt5UXXrITSM+hE0R2gEESuttAu2JCBMcGxSCQ==
X-Received: by 2002:a05:6808:1290:: with SMTP id a16mr3483280oiw.161.1615306859972;
        Tue, 09 Mar 2021 08:20:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 15/78] target/arm: Implement SVE2 bitwise shift left long
Date: Tue,  9 Mar 2021 08:19:38 -0800
Message-Id: <20210309162041.23124-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: q76/ceiNHiTu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   8 ++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  26 ++++++
 target/arm/translate-sve.c | 159 +++++++++++++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index bf3e533eb4..740939e7a8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2364,3 +2364,11 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sshll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sshll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 016c15ebb6..a3191eba7b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1207,3 +1207,11 @@ SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
 UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
+
+## SVE2 bitwise shift left long
+
+# Note bit23 == 0 is handled by esz > 0 in do_sve2_shll_tb.
+SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
+SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
+USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
+USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7877a5bdf5..3e80b612ea 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -625,6 +625,8 @@ DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
 DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
 DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
 
+#undef do_sqrshl_d
+
 #define do_uqrshl_b(n, m) \
    ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
 #define do_uqrshl_h(n, m) \
@@ -639,6 +641,8 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#undef do_uqrshl_d
+
 #define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
 #define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
 
@@ -1217,6 +1221,28 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    intptr_t sel = (simd_data(desc) & 1) * sizeof(TYPEN);      \
+    int shift = simd_data(desc) >> 1;                          \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {              \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel));               \
+        *(TYPEW *)(vd + HW(i)) = nn << shift;                  \
+    }                                                          \
+}
+
+DO_ZZI_SHLL(sve2_sshll_h, int16_t, int8_t, H1_2, H1)
+DO_ZZI_SHLL(sve2_sshll_s, int32_t, int16_t, H1_4, H1_2)
+DO_ZZI_SHLL(sve2_sshll_d, int64_t, int32_t,     , H1_4)
+
+DO_ZZI_SHLL(sve2_ushll_h, uint16_t, uint8_t, H1_2, H1)
+DO_ZZI_SHLL(sve2_ushll_s, uint32_t, uint16_t, H1_4, H1_2)
+DO_ZZI_SHLL(sve2_ushll_d, uint64_t, uint32_t,     , H1_4)
+
+#undef DO_ZZI_SHLL
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 260337d111..0f8686d47e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6072,3 +6072,162 @@ DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
 DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
 DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
 DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
+
+static void gen_sshll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
+{
+    int top = imm & 1;
+    int shl = imm >> 1;
+    int halfbits = 4 << vece;
+
+    if (top) {
+        if (shl == halfbits) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_sari_vec(vece, d, n, halfbits);
+            tcg_gen_shli_vec(vece, d, d, shl);
+        }
+    } else {
+        tcg_gen_shli_vec(vece, d, n, halfbits);
+        tcg_gen_sari_vec(vece, d, d, halfbits - shl);
+    }
+}
+
+static void gen_ushll_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int imm)
+{
+    int halfbits = 4 << vece;
+    int top = imm & 1;
+    int shl = (imm >> 1);
+    int shift;
+    uint64_t mask;
+
+    mask = MAKE_64BIT_MASK(0, halfbits);
+    mask <<= shl;
+    mask = dup_const(vece, mask);
+
+    shift = shl - top * halfbits;
+    if (shift < 0) {
+        tcg_gen_shri_i64(d, n, -shift);
+    } else {
+        tcg_gen_shri_i64(d, n, shift);
+    }
+    tcg_gen_andi_i64(d, d, mask);
+}
+
+static void gen_ushll16_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_16, d, n, imm);
+}
+
+static void gen_ushll32_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_32, d, n, imm);
+}
+
+static void gen_ushll64_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_64, d, n, imm);
+}
+
+static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
+{
+    int halfbits = 4 << vece;
+    int top = imm & 1;
+    int shl = imm >> 1;
+
+    if (top) {
+        if (shl == halfbits) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_shri_vec(vece, d, n, halfbits);
+            tcg_gen_shli_vec(vece, d, d, shl);
+        }
+    } else {
+        if (shl == 0) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_shli_vec(vece, d, n, halfbits);
+            tcg_gen_shri_vec(vece, d, d, halfbits - shl);
+        }
+    }
+}
+
+static bool do_sve2_shll_tb(DisasContext *s, arg_rri_esz *a,
+                            bool sel, bool uns)
+{
+    static const TCGOpcode sshll_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+    };
+    static const TCGOpcode ushll_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec, 0
+    };
+    static const GVecGen2i ops[2][3] = {
+        { { .fniv = gen_sshll_vec,
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_h,
+            .vece = MO_16 },
+          { .fniv = gen_sshll_vec,
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_s,
+            .vece = MO_32 },
+          { .fniv = gen_sshll_vec,
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_d,
+            .vece = MO_64 } },
+        { { .fni8 = gen_ushll16_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_h,
+            .vece = MO_16 },
+          { .fni8 = gen_ushll32_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_s,
+            .vece = MO_32 },
+          { .fni8 = gen_ushll64_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_d,
+            .vece = MO_64 } },
+    };
+
+    if (a->esz < 0 || a->esz > 2 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2i(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        vsz, vsz, (a->imm << 1) | sel,
+                        &ops[uns][a->esz]);
+    }
+    return true;
+}
+
+static bool trans_SSHLLB(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, false, false);
+}
+
+static bool trans_SSHLLT(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, true, false);
+}
+
+static bool trans_USHLLB(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, false, true);
+}
+
+static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, true, true);
+}
-- 
2.25.1
