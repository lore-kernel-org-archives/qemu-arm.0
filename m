Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954827lfg;
        Tue, 9 Mar 2021 08:20:48 -0800 (PST)
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr1372132otr.59.1615306848350;
        Tue, 09 Mar 2021 08:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306848; cv=none;
        d=google.com; s=arc-20160816;
        b=ehcLPW4P/RzickBpLW/m9l2QVNcGGdnWnuK/e8PApmqLCVT+D1V8G0IMK/Mt3eFTVy
         PMNtw7a9Kmo1g+3qCYEd708YaghO8V00xXZ9GW7Y99VNcJXGvXZE0A4k2gsZ5oP5Of9V
         hqd2YazoS3Sxkqb1dImGbZNODsgQvW+SpzTzRJN7IFr7HcEubkVFs7z2lkiXH54XDNZm
         qI5IMHL4g0KS+4nyDGJd686IXWg6AAlK3ETazIzVcnWUEh5PmGD249MRDFn1XNX73pm3
         JgeYYSTe3Md8rwxV2Gz+vNJPmYhhmAi+GlgLEbZKzL0OW/zP3H8Dz5XwGqsFruLUk2FA
         VWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4JrM/gCMwPo4dSZSFmIGMUubRJmYQic6TLHlnfTln/s=;
        b=lP9OFI+Pc7l22povH2MuqtryvXEW7TE5OP9rpqkOJLoR2xUIfAmNFoaAo4HYzacicp
         o4r2V4/r9KEdT7iy8ckR8VmU4BNf91HDjgwz3gyuaOWbwzvHP5NLjzmvYzHxDr45KyWq
         9Tph2JsYxsaJ6yaMWEl7iwYaYZd5hxV16WbJ4Cjx4Vvghq4+0wEvuJ/NgWrnUFJEM4vf
         5NxJMECZVDdeCdJDjCqemXjoOR7Jw+9SABbS7++5XM7mzev89ORrAD1/t/M2qVBtJ9pW
         1i77gYCJ6L9VW/5D6taPWCo20sRuL+ZmHtpqhx5/j71rpg6aJ/1gsaHQQKiCmrItEMPA
         Yjqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vmIIWa5Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d8sor1326452otf.178.2021.03.09.08.20.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vmIIWa5Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4JrM/gCMwPo4dSZSFmIGMUubRJmYQic6TLHlnfTln/s=;
        b=vmIIWa5QRdpnNdriVDsaP7WiGyINJeBalh+QCf55Js2ovzW/43RBjwC1mTxlcXLgk8
         2cflmMI6XxWciZMDd/MtGkJLy9nHytYp2d0L/oivywWNsyeTnKy70inOtoNmw9AJAQgG
         fUrzGSOZika+1mY1TU2XNSW+eht9FJstGTKZKWM2dy7TiP3XFq+RCGHgr9ENh4VuJkQ2
         eYhaxh0XfBak1e+xO4Qg8GsJmCJ9WDKjZSwpe6RQx7ZJquv+dlCa/G4IQRedYVQT6WzK
         YcrWFq2IwuVsrRiYcVUwOneYlubwaq+lVBLYQn7YW/qzUSQLB3xcgKgHGJMlIj+sOq4q
         ej6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4JrM/gCMwPo4dSZSFmIGMUubRJmYQic6TLHlnfTln/s=;
        b=DKG+Mx8NJg++V8uhhplvWEngF4fr8paufM0g0gCYjw0tFOVw9cYQnt2jXCAh7Edo6Q
         sJw1q9jgdpFK+CA028zxpJR7+MYMk6wQln/DSdb8yZiVXVgnppCzl77zZadxjcindQkc
         VlVWUQHD22rsaPjVcFsFgMjwohHAu2pwQY+XDw7VkE5cBzqbBc4RcvXlAq6WnV/mtGJ5
         wciECsthuE/8Vb0MNaytgCF8Kv682rCTSmm5mFX3Z/ksi0k/EqmcUGwU7yTg8lWg01jL
         R+qpxgmTwXUIA7UdY0dfVPGCTOVaDdy2BGAoq0YOnd5QNK+Estvntr4n+7tnaPfvcwaV
         d9Zg==
X-Gm-Message-State: AOAM530BijX9+bbuoJ6J+H5e1B8Cr/a5i2Pp+xw2dn5Ee6HdNBmJGmp3
	WA/6r2ssns2c8SatsFoDeSMa0rIQ
X-Google-Smtp-Source: ABdhPJxPYVV4ImyWSXBVfA2FkLov414KI14beJUrkEjKba46X0Y1yY/cVHnpZx7P9VmFjdBlF/6WTA==
X-Received: by 2002:a9d:4e14:: with SMTP id p20mr16850572otf.94.1615306847959;
        Tue, 09 Mar 2021 08:20:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 04/78] target/arm: Implement SVE2 integer unary operations (predicated)
Date: Tue,  9 Mar 2021 08:19:27 -0800
Message-Id: <20210309162041.23124-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hMtvtIMsLirV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sqabs, sqneg (laurent desnogues)
---
 target/arm/helper-sve.h    | 13 +++++++++++
 target/arm/sve.decode      |  7 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++++++++----
 target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b2a274b40b..9992e93e2b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -502,6 +502,19 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqabs_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqneg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0524c01fcf..5ba542969b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1105,3 +1105,10 @@ PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
 UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
+
+### SVE2 integer unary operations (predicated)
+
+URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
+URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
+SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
+SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 00bb82da91..5dcdd26db0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
-DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
+DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
+DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
 DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
 
 static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
@@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
-DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
+DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
+DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
 #undef DO_ZPZZ
@@ -728,6 +728,27 @@ DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
 DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
 
+#define DO_SQABS(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ >= 0 ? x_ : x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqabs_b, int8_t, H1, DO_SQABS)
+DO_ZPZ(sve2_sqabs_h, int16_t, H1_2, DO_SQABS)
+DO_ZPZ(sve2_sqabs_s, int32_t, H1_4, DO_SQABS)
+DO_ZPZ_D(sve2_sqabs_d, int64_t, DO_SQABS)
+
+#define DO_SQNEG(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqneg_b, uint8_t, H1, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_h, uint16_t, H1_2, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_s, uint32_t, H1_4, DO_SQNEG)
+DO_ZPZ_D(sve2_sqneg_d, uint64_t, DO_SQNEG)
+
+DO_ZPZ(sve2_urecpe_s, uint32_t, H1_4, helper_recpe_u32)
+DO_ZPZ(sve2_ursqrte_s, uint32_t, H1_4, helper_rsqrte_u32)
+
 /* Three-operand expander, unpredicated, in which the third operand is "wide".
  */
 #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 603e673696..2d8b9d2e70 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5885,3 +5885,50 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
     }
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
 }
+
+/*
+ * SVE2 integer unary operations (predicated)
+ */
+
+static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ool(s, a, fn);
+}
+
+static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
+}
+
+static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
+}
+
+static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
-- 
2.25.1
