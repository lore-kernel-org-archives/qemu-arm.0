Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955034lfg;
        Tue, 9 Mar 2021 08:21:02 -0800 (PST)
X-Received: by 2002:a05:6808:341:: with SMTP id j1mr3486288oie.173.1615306862506;
        Tue, 09 Mar 2021 08:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306862; cv=none;
        d=google.com; s=arc-20160816;
        b=G0bepXDkWPtU+6PTNVyHdFTPjfSHgBC8sSXEtDgDPSZ2LmUanPx6w+M8Ve7go8JM1o
         o91mJUodh1lJAnXS3/MOq5mawqJ2mbWfaGM+5YK35FqOp76GwTXOu/kwWxUS4yV+Clo3
         nCwV1dPoz1cLOmTAyuTCLyZcDhx2vpGn7tkUEA1bUMQA2HpYr70mEsQ/Z+m3DED77EmZ
         gMuhngflPWfZLusHVU0nPnJDSV+z+NzqmIqB64SgHh03wBtxf0FihAOX4sL1ZgDe+vQr
         kt7z53Lw2WTlNVJ21VCowPolsYtfv1VMxW4PoYfjvOFohXQSB9ROJUR8uC6AVma1I8s5
         Ck3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JFABDHCDp3HL/YAORggSqEppCmdhvx5EoY62umVHCko=;
        b=PuiSBrQzqoCNx7w8KQ4xNx3hZUAcjgQLhr96ed7BEL1Y9/eU8qlcQzFFmvAh4LH4/3
         PCmKn5gzDmJvznNhiNFq2aYMEpW38v39kJ+QU/tDhPt7SbikHcg+n9rOBOCza6+FtYJo
         1KY/DroAUUKgtoF/ANM93vGrpft9/z4Em5Eb0IvbjYdRTFBUOak3CEQW23IxDOh4BEZT
         Mv5Rhv7bc0cpRHc7WioNEOoGxhlV4f1UQjsi0/QGPVkcXX/I9UVjSD1fwvaxq7ymM/XM
         kAjgmhqhrRNzARNBIW04xpOVJI7VQjrR70AIaVoFXBhNJK7tTGHWsLmIR+kAHFvoFgny
         xkyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hsTdpc9z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o131sor4204168oia.0.2021.03.09.08.21.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hsTdpc9z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JFABDHCDp3HL/YAORggSqEppCmdhvx5EoY62umVHCko=;
        b=hsTdpc9zKjY5nOzrRPvd4u/3wtkuaVepm9JCeWX8DeuSQ25dbel+OM4L0xr9mr4wkT
         Ekuo6t5NG3ntvMuKBLw3fVUg/QDuCnzqEVEBjn0jv+vlj9lI4b+9K2kYNYh3IceX6QBA
         M4ChE+4NrjRiF0ywtsDeR+wfWUzZEW9b5RJPYfLE9B5dsSJ0vMNrom6PrtZQsNwRZv/8
         Q4Gk7VgenGfjfQYmOJWx2DNDI5GrXt6xBMr9QHtzc+RG+mQxNdXSoGCTBYllSkw9W52q
         EB78NbpJgkHgys+9zA+4zinXOX5wM+zNObiAkNSpEbsvYlVgWiojiHQKfWWPx9IwFEk0
         z3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFABDHCDp3HL/YAORggSqEppCmdhvx5EoY62umVHCko=;
        b=iFYZwnljUWow5TSdm4E3p8s+YGkPq2qdMC3Is9fhMJs5I/AwUiXNRIWBW1Bd8cNECm
         jNwgD73BEWMxGbdgbzvHwL/Yy9KRF089G6zLOJxXMcH+YTDyD7XBIEoKazUleVYImQU6
         qZJtHndM+aMH5Rl67t7YxCNrxogvC/7Feq+bbCrd1dJnv6fj/z3sjNpZGHdDiEpDQY1L
         QkI99UxJhU3sIrsSyivbzO1vxROj4t1dRVP5Sc+Up5Fb6aDXqjhficvYrERafR3Ja6QN
         NKfYphUkBsKZSdxgJ6aTfMS8SSKtc0bj72Wa9v899JRD+swOIk4EzH7J6fh+5dV6pI4V
         qPsA==
X-Gm-Message-State: AOAM530knmB9fozgb5QNTzeGvn8DdLdaRNJpWm7Ut0BF7N1Xt4Tk/5tk
	OVVjA1eb7nkexHeLvCdNCTjagoYh
X-Google-Smtp-Source: ABdhPJze8GRIRIE8OpPFuCsQr7Uu7TTSKZ4haSLQ0vyBfniRdA1v47ac9BTr2GADYgxGGz5TjxlRkQ==
X-Received: by 2002:aca:fc11:: with SMTP id a17mr1346633oii.68.1615306862128;
        Tue, 09 Mar 2021 08:21:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 17/78] target/arm: Implement SVE2 bitwise permute
Date: Tue,  9 Mar 2021 08:19:40 -0800
Message-Id: <20210309162041.23124-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 55tD4Zy11v2O

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++
 target/arm/helper-sve.h    | 15 ++++++++
 target/arm/sve.decode      |  6 ++++
 target/arm/sve_helper.c    | 73 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 +++++++++++++++++++
 5 files changed, 135 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 824365209b..57d03addb4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4208,6 +4208,11 @@ static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
 }
 
+static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index f65818da05..4861481fe0 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2377,3 +2377,18 @@ DEF_HELPER_FLAGS_4(sve2_eoril_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_eoril_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_eoril_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_eoril_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bext_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bext_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bext_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bext_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bdep_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bdep_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bdep_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bdep_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bgrp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bgrp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bgrp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0922a44829..7cb89a0d47 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1220,3 +1220,9 @@ USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
 
 EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
 EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
+
+## SVE2 bitwise permute
+
+BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
+BDEP            01000101 .. 0 ..... 1011 01 ..... .....  @rd_rn_rm
+BGRP            01000101 .. 0 ..... 1011 10 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9f5d143348..ef9d40591a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1241,6 +1241,79 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_BITPERM(NAME, TYPE, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
+        TYPE nn = *(TYPE *)(vn + i);                           \
+        TYPE mm = *(TYPE *)(vm + i);                           \
+        *(TYPE *)(vd + i) = OP(nn, mm, sizeof(TYPE) * 8);      \
+    }                                                          \
+}
+
+static uint64_t bitextract(uint64_t data, uint64_t mask, int n)
+{
+    uint64_t res = 0;
+    int db, rb = 0;
+
+    for (db = 0; db < n; ++db) {
+        if ((mask >> db) & 1) {
+            res |= ((data >> db) & 1) << rb;
+            ++rb;
+        }
+    }
+    return res;
+}
+
+DO_BITPERM(sve2_bext_b, uint8_t, bitextract)
+DO_BITPERM(sve2_bext_h, uint16_t, bitextract)
+DO_BITPERM(sve2_bext_s, uint32_t, bitextract)
+DO_BITPERM(sve2_bext_d, uint64_t, bitextract)
+
+static uint64_t bitdeposit(uint64_t data, uint64_t mask, int n)
+{
+    uint64_t res = 0;
+    int rb, db = 0;
+
+    for (rb = 0; rb < n; ++rb) {
+        if ((mask >> rb) & 1) {
+            res |= ((data >> db) & 1) << rb;
+            ++db;
+        }
+    }
+    return res;
+}
+
+DO_BITPERM(sve2_bdep_b, uint8_t, bitdeposit)
+DO_BITPERM(sve2_bdep_h, uint16_t, bitdeposit)
+DO_BITPERM(sve2_bdep_s, uint32_t, bitdeposit)
+DO_BITPERM(sve2_bdep_d, uint64_t, bitdeposit)
+
+static uint64_t bitgroup(uint64_t data, uint64_t mask, int n)
+{
+    uint64_t resm = 0, resu = 0;
+    int db, rbm = 0, rbu = 0;
+
+    for (db = 0; db < n; ++db) {
+        uint64_t val = (data >> db) & 1;
+        if ((mask >> db) & 1) {
+            resm |= val << rbm++;
+        } else {
+            resu |= val << rbu++;
+        }
+    }
+
+    return resm | (resu << rbm);
+}
+
+DO_BITPERM(sve2_bgrp_b, uint8_t, bitgroup)
+DO_BITPERM(sve2_bgrp_h, uint16_t, bitgroup)
+DO_BITPERM(sve2_bgrp_s, uint32_t, bitgroup)
+DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
+
+#undef DO_BITPERM
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ea03bf6609..06812405f2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6250,3 +6250,39 @@ static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_shll_tb(s, a, true, true);
 }
+
+static bool trans_BEXT(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
+        gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
+    };
+    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
+}
+
+static bool trans_BDEP(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
+        gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
+    };
+    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
+}
+
+static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
+        gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
+    };
+    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
+}
-- 
2.25.1
