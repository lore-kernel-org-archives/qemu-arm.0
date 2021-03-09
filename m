Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955201lfg;
        Tue, 9 Mar 2021 08:21:13 -0800 (PST)
X-Received: by 2002:a9d:4d0e:: with SMTP id n14mr5870793otf.316.1615306873646;
        Tue, 09 Mar 2021 08:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306873; cv=none;
        d=google.com; s=arc-20160816;
        b=uVwvuRSfTeEfIYNIZe6NgZlTSbnXjUq5rCehvhNfpEjUQ36jkdzavhcW37D3+cmfi4
         dyanI322PexK1NAUwfoH1MMR4aMGlNUTv8aTuCT/Fc3cvz/Avtz0QoaL9EVnU2GME5qM
         6N5Zasl2J1Cj++01sXrRWJlqcrqlKjyxXZPA53d/lDYt5g8+2IgK4Vnnxcico40AGhop
         eb4y5wzAbSrb6DkVhX66L5PWiFxVIxWhV36xV1sh8zJRy6+xzkmlXICV9i45hV/e94rt
         /BgQaQ1leNP30lfmNOprEzQ7LeANI6wkS8lkDJSQeblJsP8ZTdXg3wh4/nCFT9Qz3Rta
         Fe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b3LCEzIegBZA/KKLIZt6ZumkwDD1iAx7cVD9vUey8jQ=;
        b=glyVUboXRpsooMM9EpY75hGtgtDeWmFxvjTly6iMUZuHQEyDGYUFSyjv04xNSjoGrg
         CDNPxF39XDGzP95Hp8K/KD6fhn9ZkxxH7Uhnaf5OuDCQq5vJheACUcQflcLRRUCxeNSf
         rrtlsdBUoPysBRnIJp/n1qEoqqM6JTZMXkddu2zOnCRdtUP9Kal6o0jIaghPfgqPbKOw
         37ROn22HDz5gahXS6JF+jaHECtwapgLjVaqKkM+oK1thJ/4C4ioVfQMAuVNDKmT7LWzO
         x/bwPLvsn0FuCxI1Xhm+2f7TLoHxkeQslk52glYRHy8DLlGbGYCINM7OaLgOqzSDDFBh
         r6Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2VmB+Y1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d16sor489768oij.162.2021.03.09.08.21.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:13 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2VmB+Y1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b3LCEzIegBZA/KKLIZt6ZumkwDD1iAx7cVD9vUey8jQ=;
        b=y2VmB+Y1CR44IU10Gs6jdsfkzEtbpKSMPI4eaoKnNltVUTlLFVDBIJD1pH3nzO/PaM
         3XjwGNhwT0l+L3rdrtKPBHB0cWo429vA+3qdqkGOxj5VN057cgfzAtcEdCcWBP2v2chv
         v3d2KdUMcATSnGi6ApQVF9DuPC80Hek/V0CtJyN1qKMY14XTaOnDPHe7TUyei01SJJPN
         isuk/tdsfBdZVyDUkt+QVzY543Er7lH7175NBz7hQGGIPgXGrxClJnloJ4vXdXTyosL3
         cySRkTQJG077HRvQGZzqUe03XTAEDrwAuAPqk2q7XoD9KfVhwUzdW8BB7zJznQ31ku8F
         3tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b3LCEzIegBZA/KKLIZt6ZumkwDD1iAx7cVD9vUey8jQ=;
        b=pUPMIlaPRAlN10BTWyPSNk5PddmHKyZEMcCrDRpg7Lo9PTaE75clV25bK8kp2txRmL
         0VsSruTIRUilG/2PX9ii1RYuuPeiRUVfMPfEq894VYLdXvvNFJctsoTddTOoOp1ONiW+
         r6o1gyBS4wF/hEFnGGE9Zgt+fmMwlHHKMJNUsajCLchONITw+LtY0H1yAN62Qa7Ev+0o
         QOVe3i0+E31HQQYDg2kZzZk+hlOFHM+gRzmXcYiewP2EHKPOC7t/t7Wp0S7AxelO8L4m
         DmflRfaSl7ATUCt9u7/7q1PPBxfSq2X1Zclk8yaPkQ6inn1EdMZO+2LComCUDMyYAm1o
         a/FQ==
X-Gm-Message-State: AOAM5302f8K/qjd1otRxZF/I+pk5ZiPbeshXenVc83XBLGjwzhPhhuRS
	VO+mVhtkGJlrQwOrE5N7yn4zAweC
X-Google-Smtp-Source: ABdhPJz/YsLDVG2GzwfiuPkTBF6/ysApMMSMJUcoHTLgkTwdMiBwR2vOdDulCMUqGvwQ/HRHbBbxxQ==
X-Received: by 2002:aca:b787:: with SMTP id h129mr2392434oif.58.1615306873237;
        Tue, 09 Mar 2021 08:21:13 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 27/78] target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
Date: Tue,  9 Mar 2021 08:19:50 -0800
Message-Id: <20210309162041.23124-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tS+KyLV85fS/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 16 +++++++
 target/arm/sve.decode      |  4 ++
 target/arm/sve_helper.c    | 35 ++++++++++++++
 target/arm/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2b2ebea631..2e80d9d27b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2460,6 +2460,22 @@ DEF_HELPER_FLAGS_3(sve2_rshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 169486ecb2..18faa900ca 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1288,6 +1288,10 @@ SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
 ## SVE2 bitwise shift right narrow
 
 # Bit 23 == 0 is handled by esz > 0 in the translator.
+SQSHRUNB        01000101 .. 1 ..... 00 0000 ..... .....  @rd_rn_tszimm_shr
+SQSHRUNT        01000101 .. 1 ..... 00 0001 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNB       01000101 .. 1 ..... 00 0010 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNT       01000101 .. 1 ..... 00 0011 ..... .....  @rd_rn_tszimm_shr
 SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b8e4152f03..96a4c76e94 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1874,6 +1874,16 @@ static inline uint64_t do_urshr(uint64_t x, unsigned sh)
     }
 }
 
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
@@ -1936,6 +1946,31 @@ DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
 DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
 DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, do_urshr)
 
+#define DO_SQSHRUN_H(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT8_MAX)
+#define DO_SQSHRUN_S(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT16_MAX)
+#define DO_SQSHRUN_D(x, sh) \
+    do_sat_bhs((int64_t)(x) >> (sh < 64 ? sh : 63), 0, UINT32_MAX)
+
+DO_SHRNB(sve2_sqshrunb_h, int16_t, uint8_t, DO_SQSHRUN_H)
+DO_SHRNB(sve2_sqshrunb_s, int32_t, uint16_t, DO_SQSHRUN_S)
+DO_SHRNB(sve2_sqshrunb_d, int64_t, uint32_t, DO_SQSHRUN_D)
+
+DO_SHRNT(sve2_sqshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRUN_H)
+DO_SHRNT(sve2_sqshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRUN_S)
+DO_SHRNT(sve2_sqshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQSHRUN_D)
+
+#define DO_SQRSHRUN_H(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT8_MAX)
+#define DO_SQRSHRUN_S(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT16_MAX)
+#define DO_SQRSHRUN_D(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT32_MAX)
+
+DO_SHRNB(sve2_sqrshrunb_h, int16_t, uint8_t, DO_SQRSHRUN_H)
+DO_SHRNB(sve2_sqrshrunb_s, int32_t, uint16_t, DO_SQRSHRUN_S)
+DO_SHRNB(sve2_sqrshrunb_d, int64_t, uint32_t, DO_SQRSHRUN_D)
+
+DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
+DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
+DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
+
 #undef DO_SHRNB
 #undef DO_SHRNT
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 91e1c4186c..fe247d758c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6859,6 +6859,104 @@ static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunb_h },
+        { .fno = gen_helper_sve2_sqrshrunb_s },
+        { .fno = gen_helper_sve2_sqrshrunb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunt_h },
+        { .fno = gen_helper_sve2_sqrshrunt_s },
+        { .fno = gen_helper_sve2_sqrshrunt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1
