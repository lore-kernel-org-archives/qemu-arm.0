Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955309lfg;
        Tue, 9 Mar 2021 08:21:21 -0800 (PST)
X-Received: by 2002:a9d:644a:: with SMTP id m10mr25148632otl.233.1615306880998;
        Tue, 09 Mar 2021 08:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306880; cv=none;
        d=google.com; s=arc-20160816;
        b=xHWU1sLgSvxmp1od3cMRFX8ul4KBYMYO66H44Av1vF7RC+PazQwk2w11LR7gGMi5FT
         HTS+RWMjHH1D4gD5rg4DCsvh0G/SRB6Stvhoiu2+aSaQzDOlZw/kH+zUoqvWoFaHtZ8X
         CLvC3nPJRmOqE7ygO5FLzTFIodRYmjZSkn1wll/54WwoJg470H5ZJGw0NXis+XC9meNH
         tIZ/9E9DTrHGFIPZhdEFgOt0blSv/T1+rweOb3vxBEoeQJwtamEAO0T86I/d5GNCM6JI
         UPdTd/gVijec+ouwTaIoHvlg/QHoDnY4+lTXCzFma4EKNgeABoHs80RxarklCwevTcXh
         Vqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zjgMuM7VtBxm6ii284K+FR//b3PnTa2tgQtaP6TgvsM=;
        b=BubgAZYBnKEHAg8+75rKh8C+NZhzZtpBTyO1evrk6Bs4CEuSXsOjnSCM8SbENocmAd
         dICOgziZs0XDUjv6JoBlsqydL+EE3L27tCno7NfaiizpkdvxWkZx8SkVKJEA+0KpISMN
         F9ot4M/t4hXRS4oa2UwdVI2odwG6Gge3LNqzfFW+VO3NDEVkyFMjfoVuYUS6WRWyaL4w
         Fq6MWXlGVsCpWd4SMHdcDpGfiTo6TZp+Hi925FnmsPWDf5n4N0Uo2zPL9Xny2QDlWKso
         yIyGIgPFzFNizsCIKu4nm6W3CgiTIVRr2g6ANoZupvwg5+O/QrneaeuOy71Zb5GnyTrH
         oEKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4+AntUX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c15sor3175654otn.109.2021.03.09.08.21.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4+AntUX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zjgMuM7VtBxm6ii284K+FR//b3PnTa2tgQtaP6TgvsM=;
        b=Y4+AntUXf25f+LReilg5EWsFxGvmwRlRU6Uc79YLaK7dR559TKErExGwZQbkJYjuFn
         GJu+q5Na0fy1X0947SvpLkBIySnJzVpz/PvgSU682pf6zpztsWwfuAOGqxk1yRdw+puC
         ea2CezTQvToHp5lQxV5mQaObJNdhEqUZFeQyj6x20ulmOhHeX6XvNsLRs/6kJGx/jS+q
         F72puiGovIorkq1UYOhDeA1cA2bkCHzbaj7RLhEhvM4RbKWodS9hFiieyHOXwHN+CcDN
         jTxHm8eSt37l2A28IJ3XmZMpWGjmnvIkwusHmtScIYSEW4RFFuXk2KtWModpty6QfrNw
         GymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zjgMuM7VtBxm6ii284K+FR//b3PnTa2tgQtaP6TgvsM=;
        b=dJCCGeSCzeoKlNzPnC4DZnMChkRCvsO5ufyIdzCG9XUgHdRiV7XFzuA+MHil7R5CzX
         mj0p7T/OmwSCWQrXxHLv6tw5KsxMjkF4C1CExhmLzu6TBMUOK+tzf1PNpQT/+I4JPvKw
         o69sXhwcsT+A2orXPQpA5uHfa0XUxUNucUlt7MgW/i4IzEqLUGV99B/Lda0JIkz7/h3p
         KYwyAXBCgmSG1Jd9tkvusyYJrXMKRO3iF0cmWYmWr3XyF8pQopJpD1+ioJavCyA2Y9gV
         Lt+9189bMFnfNHm4fURIxSHG5VnTv9sX43Vi7r8qWrykh5isDMei3G7JkbyapMmIMzn0
         Ckxw==
X-Gm-Message-State: AOAM531pjENcBFGhV09jvfwG01UAs5hk2vXcEXRNGDdm9unr2MISWuoI
	D4NilI//8nyAWxjcmn77s0vkmUhYDlMXqamDyt0=
X-Google-Smtp-Source: ABdhPJypMkCKt604XEDcj6Oiel5v6qCYWne1qikb+MyukjjwlmJqOCqD1rb2dWha1qdFmB604j48ZA==
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr11081513otq.256.1615306880636;
        Tue, 09 Mar 2021 08:21:20 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 33/78] target/arm: Implement SVE2 MATCH, NMATCH
Date: Tue,  9 Mar 2021 08:19:56 -0800
Message-Id: <20210309162041.23124-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mxComcPPJsig

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200415145915.2859-1-steplong@quicinc.com>
[rth: Expanded comment for do_match2]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Apply esz_mask to input pg to fix output flags.
---
 target/arm/helper-sve.h    | 10 ++++++
 target/arm/sve.decode      |  5 +++
 target/arm/sve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 22 +++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index df617e3351..11dc6870de 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,16 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_b, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_h, TCG_CALL_NO_RWG,
+                   i32, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bf673e2f16..47fca5e12d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+### SVE2 Character Match
+
+MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
+NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4af8661cf5..7a2af036c1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6874,3 +6874,67 @@ void HELPER(sve2_nbsl)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
         d[i] = ~((n[i] & k[i]) | (m[i] & ~k[i]));
     }
 }
+
+/*
+ * Returns true if m0 or m1 contains the low uint8_t/uint16_t in n.
+ * See hasless(v,1) from
+ *   https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord
+ */
+static inline bool do_match2(uint64_t n, uint64_t m0, uint64_t m1, int esz)
+{
+    int bits = 8 << esz;
+    uint64_t ones = dup_const(esz, 1);
+    uint64_t signs = ones << (bits - 1);
+    uint64_t cmp0, cmp1;
+
+    cmp1 = dup_const(esz, n);
+    cmp0 = cmp1 ^ m0;
+    cmp1 = cmp1 ^ m1;
+    cmp0 = (cmp0 - ones) & ~cmp0;
+    cmp1 = (cmp1 - ones) & ~cmp1;
+    return (cmp0 | cmp1) & signs;
+}
+
+static inline uint32_t do_match(void *vd, void *vn, void *vm, void *vg,
+                                uint32_t desc, int esz, bool nmatch)
+{
+    uint16_t esz_mask = pred_esz_masks[esz];
+    intptr_t opr_sz = simd_oprsz(desc);
+    uint32_t flags = PREDTEST_INIT;
+    intptr_t i, j, k;
+
+    for (i = 0; i < opr_sz; i += 16) {
+        uint64_t m0 = *(uint64_t *)(vm + i);
+        uint64_t m1 = *(uint64_t *)(vm + i + 8);
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3)) & esz_mask;
+        uint16_t out = 0;
+
+        for (j = 0; j < 16; j += 8) {
+            uint64_t n = *(uint64_t *)(vn + i + j);
+
+            for (k = 0; k < 8; k += 1 << esz) {
+                if (pg & (1 << (j + k))) {
+                    bool o = do_match2(n >> (k * 8), m0, m1, esz);
+                    out |= (o ^ nmatch) << (j + k);
+                }
+            }
+        }
+        *(uint16_t *)(vd + H1_2(i >> 3)) = out;
+        flags = iter_predtest_fwd(out, pg, flags);
+    }
+    return flags;
+}
+
+#define DO_PPZZ_MATCH(NAME, ESZ, INV)                                         \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
+{                                                                             \
+    return do_match(vd, vn, vm, vg, desc, ESZ, INV);                          \
+}
+
+DO_PPZZ_MATCH(sve2_match_ppzz_b, MO_8, false)
+DO_PPZZ_MATCH(sve2_match_ppzz_h, MO_16, false)
+
+DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
+DO_PPZZ_MATCH(sve2_nmatch_ppzz_h, MO_16, true)
+
+#undef DO_PPZZ_MATCH
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a4e1230ef1..c339702cd3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7463,6 +7463,28 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
+                               gen_helper_gvec_flags_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_ppzz_flags(s, a, fn);
+}
+
+#define DO_SVE2_PPZZ_MATCH(NAME, name)                                      \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
+{                                                                           \
+    static gen_helper_gvec_flags_4 * const fns[4] = {                       \
+        gen_helper_sve2_##name##_ppzz_b, gen_helper_sve2_##name##_ppzz_h,   \
+        NULL,                            NULL                               \
+    };                                                                      \
+    return do_sve2_ppzz_flags(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_PPZZ_MATCH(MATCH, match)
+DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1
