Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954804lfg;
        Tue, 9 Mar 2021 08:20:46 -0800 (PST)
X-Received: by 2002:aca:59c4:: with SMTP id n187mr3462749oib.117.1615306846130;
        Tue, 09 Mar 2021 08:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306846; cv=none;
        d=google.com; s=arc-20160816;
        b=pVi2K7/TMfyw8wJqzr/Bl0TO/oySC4jWIGRAJzunbbYVpcLVNGn9JvylxZ+YHiawF6
         +6IrSoLd+SKwAjRm27A4DZBKjaZTThz6ArEz+ICLeiWDoF254ihNSoU0+/DMmrK6SEwy
         jR/X3Yn4wzfMwyN5inQYbSsmy9UhebJquhcL7YQH19xQFHlEYfqi15FZn9bip5KqWtL4
         AVPmTQ6GcphE53UBuAnYqjueYiyGkCeS2iqaEikc7FDMzt+VnItUh7mjYHy7q5m5J2Ze
         s0Id+2S8OlqI1cwTH9ErFxEuEYcVa+tThsppxPuIZQJLfvuiI+FnmSF+9Eo5Vw3ikYaX
         lB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HvSrOl22actPyuRTqNBVMMjUXh2g8f+fmwTAA2vQd8U=;
        b=RUj9oJuth9GfcOuLmDKXPGJxnry8lxTeMDsnIxhyyl+KHLCXhsP24rTEXsRN8NUj44
         feFQzPVkvyvaEds/hYTS1lM6MpYoxeAP514JA6P4OVe2rC7YqwigP+xP7FfSZ9dRrUN7
         5Mkkd7oJwOvePEjP0AkgyAz2tAcC9IkAo1fwZPxHMOIlE8eeFJWCPeun8IsfzNeUy/Bg
         JFfsllNGaExU+YBdv1etl1ijKejKE6Cx6A8/2IJCz+ONiDi2r5KQ5F+b+ge400ecUDFL
         e3ddNZLBY8lx+09lfBeQcRfUyBWeqAIWxhbflqKdIPYW2WqUwJTAe+eRXtozjBMpdkp3
         HN+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RifNVV1X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2sor1089341ooj.6.2021.03.09.08.20.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RifNVV1X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HvSrOl22actPyuRTqNBVMMjUXh2g8f+fmwTAA2vQd8U=;
        b=RifNVV1XV9YWWu7edWc6wDDTJVbiIIxQ0RYQW+UjFnzzgAfrPbqmaM69sHcF98E2C8
         uyImPK/VDNSa6h4KUM+khu3/MAiIiVb7dt71MrFfmWATntgW7/KvevOqZGiBfixukDy3
         JROLtRSiQ3ElLc94t6qrvbcITF44LuyEYAridz0utSl43X4+SYlfspsKJb3uytpijxD6
         qXBQl8OTDxwBhwX5D0kcMaWVDC3mm0wtSXVNCUmNtcj/xz4Tcs3h1Alm2B3jBxoLxgkM
         07TNhKr96ga4iNgSqnog+rSN3EihnMlDPAxnsJwAG8p5s3W/adLQEbiW9fN4NVPVyKmd
         LfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HvSrOl22actPyuRTqNBVMMjUXh2g8f+fmwTAA2vQd8U=;
        b=jLBWcGD4aCj6ykqHa1uGi2bFM+gkV0qKkE7gQRRRVqpya8bKoRP7+DUJXWgp+U/ibs
         BAWSDcgS+I+WQwviRpWX5jZIjjlO61oEKm7oPq1yTudt0vtjY1oN4EHO9h1R0pYnm0t4
         HpAdsvOPome9XYqzliUj65IFJ9AZo4WDxOFWhyHVL+lsbKA7RCgUJrfiMkwh33CN+Hup
         4KoWfZCny7O1ORY6vKYi5ljC7XWlMj9HjmLBQ8jhNpcYdpc0CipR/OuuWihC1uhKtTQG
         9BG9UAJXRvcxIr0bwBhHhsc5hJZ5/GrlAjQn9r7pBZAVXhqRB+QZQJtwjvpgM4e94Ije
         wXVQ==
X-Gm-Message-State: AOAM531IJYaXeakaF0TUjtZHAWRlZn/pSx+M2uu3r6wdKe3mH4u/OuDD
	FC2y/G4ieRnmbfPXFnNvy2CWZ6xL
X-Google-Smtp-Source: ABdhPJwT7CA3Ym3qnUtkC1EJdm00PGrPhraeOYMVeLLFc7moY/wygO3vdvm8wxGERel9Ru9FdqbgdA==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr23199487oop.18.1615306845733;
        Tue, 09 Mar 2021 08:20:45 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 02/78] target/arm: Implement SVE2 Integer Multiply - Unpredicated
Date: Tue,  9 Mar 2021 08:19:25 -0800
Message-Id: <20210309162041.23124-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lF1KQd3esUVu

For MUL, we can rely on generic support.  For SMULH and UMULH,
create some trivial helpers.  For PMUL, back in a21bb78e5817,
we organized helper_gvec_pmul_b in preparation for this use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 ++++
 target/arm/sve.decode      | 10 ++++
 target/arm/translate-sve.c | 50 ++++++++++++++++++++
 target/arm/vec_helper.c    | 96 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 166 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index ff8148ddc6..2c412ffd3b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -828,6 +828,16 @@ DEF_HELPER_FLAGS_3(gvec_cgt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_cge0_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_cge0_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_smulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_smulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_smulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_smulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_umulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_umulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_umulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_umulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_sshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ushl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5c90603358..557706cacb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1090,3 +1090,13 @@ ST1_zprz        1110010 .. 00 ..... 100 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=3 scale=0
 ST1_zprz        1110010 .. 00 ..... 110 ... ..... ..... \
                 @rprr_scatter_store xs=1 esz=3 scale=0
+
+#### SVE2 Support
+
+### SVE2 Integer Multiply - Unpredicated
+
+# SVE2 integer multiply vectors (unpredicated)
+MUL_zzz         00000100 .. 1 ..... 0110 00 ..... .....  @rd_rn_rm
+SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
+UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
+PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0eefb61214..06b906bce9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5796,3 +5796,53 @@ static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
 {
     return do_movz_zpz(s, a->rd, a->rn, a->pg, a->esz, false);
 }
+
+/*
+ * SVE2 Integer Multiply - Unpredicated
+ */
+
+static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
+        gen_helper_gvec_smulh_s, gen_helper_gvec_smulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_umulh_b, gen_helper_gvec_umulh_h,
+        gen_helper_gvec_umulh_s, gen_helper_gvec_umulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 3fbeae87cb..40b92100bf 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1985,3 +1985,99 @@ void HELPER(simd_tblx)(void *vd, void *vm, void *venv, uint32_t desc)
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
 #endif
+
+/*
+ * NxN -> N highpart multiply
+ *
+ * TODO: expose this as a generic vector operation.
+ */
+
+void HELPER(gvec_smulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ((int32_t)n[i] * m[i]) >> 8;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_smulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = ((int32_t)n[i] * m[i]) >> 16;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_smulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = ((int64_t)n[i] * m[i]) >> 32;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_smulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint64_t discard;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        muls64(&discard, &d[i], n[i], m[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ((uint32_t)n[i] * m[i]) >> 8;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint16_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = ((uint32_t)n[i] * m[i]) >> 16;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = ((uint64_t)n[i] * m[i]) >> 32;
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_umulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint64_t discard;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        mulu64(&discard, &d[i], n[i], m[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.25.1
