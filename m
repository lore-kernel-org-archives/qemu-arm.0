Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955173lfg;
        Tue, 9 Mar 2021 08:21:11 -0800 (PST)
X-Received: by 2002:aca:170e:: with SMTP id j14mr3501504oii.173.1615306871356;
        Tue, 09 Mar 2021 08:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306871; cv=none;
        d=google.com; s=arc-20160816;
        b=MYjpv/jNZSJ7Tz/JFA/WC02d2HzkTd0eaJ2mOXTgwVIQnBICs4I9fNhgfCgSNOY+/Y
         oI3feM26H0m64EJavWI4iVL7NYGoRRWwLv5ft1EBkuD7RgoYCqITy4hSZjxw6k+MDS0A
         xTClq9l/jyYGrn+TuZwYfyJO2s91lkC/VyE/2qbNBEaVPxq0yH/S5+/MfBETxse3jiSj
         GOqiTo/kedeXK6i7atmFUnAZP1brpoWcFdzG58WVhrCeU1eUdtiDQCMbyjICtlpVlQma
         81ncmKOKO+7heUqTJDPaaqXQ7kkOG/LIU1J6lW6TvsL4E6f+YxLGTQ4CC+4vOgS+xiGZ
         JR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hzN4bO1Q9kWzjd+yXsPtlaqCNoI3movNX0neMlD42A0=;
        b=pxkyXUQrNW2TLwEmYSoE32CG6vRdp1MyYqNLvpfFcJcyy4j3lDdVOSNv2m36YisRd5
         izhv6/ThPBFYL3HsbVtoJTrJCcZ5gnPHq70DOTgV3ZqofmtFrVKHVKEzxIFX6UuUGO+X
         4qwBk+ZskBvrZJ0/hnAfbhbr0OglEkQvMThmTprC1BFWgFrkE28KFgy++M16DOB1t2oQ
         ryW0vMH2ij201aQSvgRn0as4CeqDZseCzhI6PtK2U68IuthlTeWZNebYCIlb5XdQmZFM
         dxu7j3kp7+jPeJfNqVe+uVOAxqGyJ4+ZgEvkToyzOZ6HEIoIw7lX+IhATUZz4UbACTqS
         PfzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5KJQKN9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10sor4098037oiz.6.2021.03.09.08.21.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5KJQKN9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzN4bO1Q9kWzjd+yXsPtlaqCNoI3movNX0neMlD42A0=;
        b=i5KJQKN9bkqEcjBqGiOCWwGMjhmab9bcMrL4qpn5XJJJhlqqhHKg1eMmBqWvWg5MMb
         RsRFl0gFyiMZCRzLZ09L8A5BpaEgUVDEM1E9vQJ1LzJ1WMLIHbex/L0VkPDD15vo/nq9
         Sct5eqCgZwzfPOErepBVkVs6+8VwW7oJe1/KV76tl4n5kfYomUEBFDkNT32ChGSYjQdN
         hq3maIX4uV2QVTU3Us9pjYgYaqBrMt0UVZ2LrvcuQ+rNWseqs5Mz+s8wAiI8o8/DTGbp
         taQpJ00aLC/ayqbtivTa1JAvUDzcMSW+I3R8adao6YEgyPHdSBUXH/Ezdv7ZISc0HVY7
         rwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzN4bO1Q9kWzjd+yXsPtlaqCNoI3movNX0neMlD42A0=;
        b=XgFsvL74e/WbvbUv6fMI+iyqb03AkpJgtX498qJ/hgMFzpxjeOPSjkA0apkLV0QU3b
         3Q7JA8JmsXkT7mvlHJHaAaPCfCcaJXg/jAtkPTDkNzJxeVIVhCPs7NFPrlaO1TjJPjQ+
         afsfXqbNxg93u+682U+0ilT5f8SWrysjKOfvvzG2cEQ51Yr1vd/4dRfBxOWgJHGGjVBj
         W20QDhrfJLBCn/i6Fou5xSo2wQJYEUsAbIxkwK8Pp1aDKMy05/mEVGgOMKkLx/N2wfLg
         RDX7e6+AHL5oTnbayDKJ30bqGjl6m3SVhIcWZk4ettuT3koeFqzU/LSSf13BOsY0QMd6
         Uz1w==
X-Gm-Message-State: AOAM531UDHsUwF4LKscV1Khqf6rNYl0fyrt8PG4hdfANQefvPfWj4sa3
	mG1fm/LLcfZKO2uDfy29YVcP0vsZIQF02TGJjAo=
X-Google-Smtp-Source: ABdhPJwuX1kzhmj+ezufPD5xjm9TIFl/AgkFnFcCeU9K4wBTEtvwvuK/iGf4TQibtfMQ1mKQlFoh4w==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr3548714oig.175.1615306871020;
        Tue, 09 Mar 2021 08:21:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 25/78] target/arm: Implement SVE2 floating-point pairwise
Date: Tue,  9 Mar 2021 08:19:48 -0800
Message-Id: <20210309162041.23124-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: khVH+wChB76/

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Load all inputs before writing any output (laurent desnogues)
---
 target/arm/helper-sve.h    | 35 +++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 +++++++
 target/arm/sve_helper.c    | 46 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 25 +++++++++++++++++++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b302203ce8..a033b5f6b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2443,3 +2443,38 @@ DEF_HELPER_FLAGS_3(sve2_uqxtnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminnmp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 19866ec4c6..9c75ac94c0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1284,3 +1284,11 @@ UQXTNB          01000101 .. 1 ..... 010 010 ..... .....  @rd_rn_tszimm_shl
 UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
 SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
 SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 floating-point pairwise operations
+
+FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
+FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
+FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
+FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
+FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 115daa50a5..6da734e7b4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -890,6 +890,52 @@ DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
 #undef DO_ZPZZ_PAIR
 #undef DO_ZPZZ_PAIR_D
 
+#define DO_ZPZZ_PAIR_FP(NAME, TYPE, H, OP)                              \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,               \
+                  void *status, uint32_t desc)                          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; ) {                                         \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            TYPE n0 = *(TYPE *)(vn + H(i));                             \
+            TYPE m0 = *(TYPE *)(vm + H(i));                             \
+            TYPE n1 = *(TYPE *)(vn + H(i + sizeof(TYPE)));              \
+            TYPE m1 = *(TYPE *)(vm + H(i + sizeof(TYPE)));              \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(n0, n1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+            if (pg & 1) {                                               \
+                *(TYPE *)(vd + H(i)) = OP(m0, m1, status);              \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_h, float16, H1_2, float16_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_s, float32, H1_4, float32_add)
+DO_ZPZZ_PAIR_FP(sve2_faddp_zpzz_d, float64,     , float64_add)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_h, float16, H1_2, float16_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_s, float32, H1_4, float32_maxnum)
+DO_ZPZZ_PAIR_FP(sve2_fmaxnmp_zpzz_d, float64,     , float64_maxnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_h, float16, H1_2, float16_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_s, float32, H1_4, float32_minnum)
+DO_ZPZZ_PAIR_FP(sve2_fminnmp_zpzz_d, float64,     , float64_minnum)
+
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_h, float16, H1_2, float16_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_s, float32, H1_4, float32_max)
+DO_ZPZZ_PAIR_FP(sve2_fmaxp_zpzz_d, float64,     , float64_max)
+
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_h, float16, H1_2, float16_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_s, float32, H1_4, float32_min)
+DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_d, float64,     , float64_min)
+
+#undef DO_ZPZZ_PAIR_FP
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 65f1b11848..ae2ac20302 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6698,3 +6698,28 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
     };
     return do_sve2_narrow_extract(s, a, ops);
 }
+
+static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
+                            gen_helper_gvec_4_ptr *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzz_fp(s, a, fn);
+}
+
+#define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                         \
+        NULL,                            gen_helper_sve2_##name##_zpzz_h,   \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d    \
+    };                                                                      \
+    return do_sve2_zpzz_fp(s, a, fns[a->esz]);                              \
+}
+
+DO_SVE2_ZPZZ_FP(FADDP, faddp)
+DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
+DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
+DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
+DO_SVE2_ZPZZ_FP(FMINP, fminp)
-- 
2.25.1
